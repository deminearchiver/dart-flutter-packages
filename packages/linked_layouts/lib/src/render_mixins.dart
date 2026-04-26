import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderObjectWithLayoutLinkMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
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

  @protected
  LayoutLinkHandle<LayoutClientType>? layoutLinkHandle;

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
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
>
    on
        RenderBox,
        RenderObjectWithLayoutLinkMixin<LeaderClientType, LayoutLinkType> {
  @override
  set layoutLink(LayoutLinkType value) {
    if (layoutLinkOrNull == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      layoutLinkHandle = value.registerLeader(createLayoutClient());
    }
    super.layoutLink = value;
    markNeedsLayout();
  }

  @override
  LeaderClientType createLayoutClient();

  @mustCallSuper
  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(layoutLinkHandle == null);
    layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
  }

  @mustCallSuper
  @override
  void detach() {
    super.detach();
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
  }

  @mustCallSuper
  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    if (layoutLinkHandle case final layoutLinkHandle?) {
      layoutLink.didLeaderDoLayout(layoutLinkHandle.client);
    }
  }

  @mustCallSuper
  @override
  void performLayout() {
    super.performLayout();
    if (layoutLinkHandle case final layoutLinkHandle?) {
      layoutLinkHandle.client.size = size;
    }
  }

  @mustCallSuper
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    layoutLink.didLeaderDoPaint(layoutLinkHandle?.client);
  }
}

mixin RenderLayoutFollowerMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, FollowerClientType>
>
    on
        RenderObject,
        RenderObjectWithLayoutLinkMixin<LayoutFollowerClient, LayoutLinkType> {
  @override
  set layoutLink(LayoutLinkType value) {
    if (layoutLinkOrNull == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      layoutLinkHandle = value.registerFollower(createLayoutClient());
    }
    super.layoutLink = value;
    markNeedsLayout();
  }

  @override
  FollowerClientType createLayoutClient();

  @mustCallSuper
  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(layoutLinkHandle == null);
    layoutLinkHandle = layoutLink.registerFollower(createLayoutClient());
  }

  @mustCallSuper
  @override
  void detach() {
    super.detach();
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
  }

  @mustCallSuper
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
}
