import 'package:material_example/flutter.dart';

import 'linked_layouts.dart';

mixin RenderObjectWithLayoutLinkMixin<
  LayoutLinkType extends LayoutLink<
    LayoutLeaderClient,
    LayoutFollowerClient,
    LayoutLinkType
  >,
  LayoutClientType extends LayoutLinkClient
> {
  LayoutLinkType? _layoutLink;

  @protected
  LayoutLinkType? get layoutLinkOrNull => _layoutLink;

  LayoutLinkType get layoutLink {
    assert(debugAssertLayoutLinkInitialized(this));
    return _layoutLink!;
  }

  @protected
  set layoutLink(LayoutLinkType value) {
    _layoutLink = value;
  }

  static bool debugAssertLayoutLinkInitialized(
    RenderObjectWithLayoutLinkMixin object,
  ) {
    assert(() {
      if (object._layoutLink == null) {
        throw FlutterError(
          "${object.runtimeType}.layoutLink was used before being initialized.\n"
          "${object.runtimeType}.layoutLink must be initialized before it can be used.",
        );
      }
      return true;
    }());
    return true;
  }

  @protected
  LayoutClientType createLayoutClient();
}

mixin RenderLayoutLeaderMixin<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType
      extends LayoutLink<LeaderClientType, LayoutFollowerClient, LayoutLinkType>
>
    on
        RenderBox,
        RenderObjectWithLayoutLinkMixin<LayoutLinkType, LeaderClientType> {
  LayoutLinkHandle<LayoutLinkType, LeaderClientType>? _layoutLinkHandle;

  @override
  set layoutLink(LayoutLinkType value) {
    if (layoutLinkOrNull == value) return;
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
    if (attached) {
      _layoutLinkHandle = value.registerLeader(createLayoutClient());
    }
    super.layoutLink = value;
    markNeedsLayout();
  }

  @override
  LeaderClientType createLayoutClient();

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_layoutLinkHandle == null);
    _layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
  }

  @override
  void detach() {
    super.detach();
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
  }

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    if (_layoutLinkHandle case final layoutLinkHandle?) {
      layoutLink.didLeaderDoLayout(layoutLinkHandle.client);
    }
  }

  @override
  void performLayout() {
    super.performLayout();
    if (_layoutLinkHandle case final layoutLinkHandle?) {
      layoutLinkHandle.client.size = size;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    layoutLink.didLeaderDoPaint(_layoutLinkHandle?.client);
  }
}

mixin RenderLayoutFollowerMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType
      extends LayoutLink<LeaderClientType, FollowerClientType, LayoutLinkType>
>
    on
        RenderObject,
        RenderObjectWithLayoutLinkMixin<LayoutLinkType, LayoutFollowerClient> {
  LayoutLinkHandle<LayoutLinkType, FollowerClientType>? _layoutLinkHandle;

  @override
  set layoutLink(LayoutLinkType value) {
    if (layoutLinkOrNull == value) return;
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
    if (attached) {
      _layoutLinkHandle = value.registerFollower(createLayoutClient());
    }
    super.layoutLink = value;
    markNeedsLayout();
  }

  // late final _frameCallbackScheduler = FrameCallbackScheduler(_frameCallback);

  // final _lastLeaderTransforms = <LeaderClientType, Matrix4>{};
  // final _lastLeaderSizes = <LeaderClientType, Size>{};
  // var _isSchedulingPostFrameLayout = false;

  // void _frameCallback(Duration _) {
  //   assert(!debugDisposed!);
  //   // TODO: check leaders
  //   _frameCallbackScheduler.schedule();
  // }

  @override
  FollowerClientType createLayoutClient();

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_layoutLinkHandle == null);
    _layoutLinkHandle = layoutLink.registerFollower(createLayoutClient());
    // _frameCallbackScheduler.schedule();
  }

  @override
  void detach() {
    super.detach();
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
  }

  @override
  void redepthChildren() {
    final deepestLeader = layoutLink.leaders.fold<LeaderClientType?>(
      null,
      (result, leader) =>
          leader.renderObject.attached &&
              (result == null ||
                  leader.renderObject.depth > result.renderObject.depth)
          ? leader
          : result,
    );
    if (deepestLeader != null && depth <= deepestLeader.renderObject.depth) {
      deepestLeader.renderObject.redepthChild(this);
      // Return because leader's render object calls this function recursively.
      return;
    }
    super.redepthChildren();
  }

  // @mustCallSuper
  // @override
  // void performLayout() {
  //   _frameCallbackScheduler.schedule();
  // }
}

class LayoutLeader<
  LayoutLinkType extends LayoutLink<
    LayoutLeaderClient,
    LayoutFollowerClient,
    LayoutLinkType
  >
>
    extends SingleChildRenderObjectWidget {
  const LayoutLeader({super.key, required this.layoutLink, super.child});

  final LayoutLinkType layoutLink;

  @override
  RenderLayoutLeader<LayoutLinkType> createRenderObject(BuildContext context) =>
      RenderLayoutLeader(layoutLink: layoutLink);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLayoutLeader<LayoutLinkType> renderObject,
  ) {
    renderObject.layoutLink = layoutLink;
  }
}

class RenderLayoutLeader<
  LayoutLinkType extends LayoutLink<
    LayoutLeaderClient,
    LayoutFollowerClient,
    LayoutLinkType
  >
>
    extends RenderProxyBox
    with
        RenderObjectWithLayoutLinkMixin<LayoutLinkType, LayoutLeaderClient>,
        RenderLayoutLeaderMixin<LayoutLeaderClient, LayoutLinkType> {
  RenderLayoutLeader({required LayoutLinkType layoutLink, RenderBox? child})
    : super(child) {
    this.layoutLink = layoutLink;
  }

  @override
  LayoutLeaderClient<RenderLayoutLeader> createLayoutClient() =>
      DefaultLayoutLeaderClient(this);
}

class SlottedLayoutLeader<SlotType extends Object?>
    extends SingleChildRenderObjectWidget {
  const SlottedLayoutLeader({
    super.key,
    required this.layoutLink,
    required this.slot,
    super.child,
  });

  final SlottedMultiLeaderLayoutLink<SlotType> layoutLink;
  final SlotType slot;

  @override
  RenderSlottedLayoutLeader<SlotType> createRenderObject(
    BuildContext context,
  ) => RenderSlottedLayoutLeader(layoutLink: layoutLink, slot: slot);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSlottedLayoutLeader<SlotType> renderObject,
  ) {
    renderObject
      ..layoutLink = layoutLink
      ..slot = slot;
  }
}

class RenderSlottedLayoutLeader<SlotType extends Object?>
    extends RenderLayoutLeader<SlottedMultiLeaderLayoutLink<SlotType>> {
  RenderSlottedLayoutLeader({
    required super.layoutLink,
    required SlotType slot,
    super.child,
  }) : _slot = slot;

  SlotType _slot;

  SlotType get slot => _slot;

  set slot(SlotType value) {
    if (_slot == value) return;
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
    if (attached) {
      _layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
    }
    _slot = value;
    markNeedsLayout();
  }

  @override
  SlottedLayoutLeaderClient<RenderSlottedLayoutLeader<SlotType>, SlotType>
  createLayoutClient() => DefaultSlottedLayoutLeaderClient(this, slot);
}
