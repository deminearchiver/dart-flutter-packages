import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/linked_layouts.dart';

typedef AbstractLayoutLeaderClientFactory<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
> = LeaderClientType Function(RenderBox renderObject);

abstract class AbstractLayoutLeader<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
>
    extends SingleChildRenderObjectWidget {
  const AbstractLayoutLeader({
    super.key,
    required this.layoutLink,
    super.child,
  });

  final LayoutLinkType layoutLink;

  LeaderClientType createLayoutClient(RenderBox renderObject);

  @override
  RenderAbstractLayoutLeader<LeaderClientType, LayoutLinkType>
  createRenderObject(BuildContext context) => RenderAbstractLayoutLeader(
    layoutClientFactory: createLayoutClient,
    layoutLink: layoutLink,
  );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderAbstractLayoutLeader<LeaderClientType, LayoutLinkType> renderObject,
  ) {
    renderObject
      ..layoutClientFactory = createLayoutClient
      ..layoutLink = layoutLink;
  }
}

class RenderAbstractLayoutLeader<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
>
    extends RenderProxyBox
    with
        RenderObjectWithLayoutLinkMixin<LeaderClientType, LayoutLinkType>,
        RenderLayoutLeaderMixin<LeaderClientType, LayoutLinkType> {
  RenderAbstractLayoutLeader({
    required AbstractLayoutLeaderClientFactory<LeaderClientType, LayoutLinkType>
    layoutClientFactory,
    required LayoutLinkType layoutLink,
    RenderBox? child,
  }) : _layoutClientFactory = layoutClientFactory,
       super(child) {
    this.layoutLink = layoutLink;
  }

  AbstractLayoutLeaderClientFactory<LeaderClientType, LayoutLinkType>
  _layoutClientFactory;

  AbstractLayoutLeaderClientFactory<LeaderClientType, LayoutLinkType>
  get layoutClientFactory => _layoutClientFactory;

  set layoutClientFactory(
    AbstractLayoutLeaderClientFactory<LeaderClientType, LayoutLinkType> value,
  ) {
    if (_layoutClientFactory == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
    }
    _layoutClientFactory = value;
    markNeedsLayout();
  }

  @override
  LeaderClientType createLayoutClientInternal() => layoutClientFactory(this);
}

class CustomLayoutLeader<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
>
    extends AbstractLayoutLeader<LeaderClientType, LayoutLinkType> {
  const CustomLayoutLeader({
    super.key,
    required this.layoutClientFactory,
    required super.layoutLink,
    super.child,
  });

  final AbstractLayoutLeaderClientFactory<LeaderClientType, LayoutLinkType>
  layoutClientFactory;

  @override
  LeaderClientType createLayoutClient(RenderBox renderObject) =>
      layoutClientFactory(renderObject);
}

class SingleLayoutLeader
    extends AbstractLayoutLeader<LayoutLeaderClient, SingleLeaderLayoutLink> {
  const SingleLayoutLeader({super.key, required super.layoutLink, super.child});

  @override
  LayoutLeaderClient<RenderBox> createLayoutClient(RenderBox renderObject) =>
      DefaultLayoutLeaderClient(renderObject);
}

class SlottedLayoutLeader<SlotType extends Object?>
    extends
        AbstractLayoutLeader<
          SlottedLayoutLeaderClient<RenderBox, SlotType>,
          SlottedMultiLeaderLayoutLink<SlotType>
        > {
  const SlottedLayoutLeader({
    super.key,
    required super.layoutLink,
    required this.slot,
    super.child,
  });

  final SlotType slot;

  @override
  SlottedLayoutLeaderClient<RenderBox, SlotType> createLayoutClient(
    RenderBox renderObject,
  ) => DefaultSlottedLayoutLeaderClient(renderObject, slot);

  @override
  RenderSlottedLayoutLeader<SlotType> createRenderObject(
    BuildContext context,
  ) => RenderSlottedLayoutLeader(
    layoutClientFactory: createLayoutClient,
    layoutLink: layoutLink,
    slot: slot,
  );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSlottedLayoutLeader<SlotType> renderObject,
  ) {
    renderObject
      ..layoutClientFactory = createLayoutClient
      ..layoutLink = layoutLink
      ..slot = slot;
  }
}

class RenderSlottedLayoutLeader<SlotType extends Object?>
    extends
        RenderAbstractLayoutLeader<
          SlottedLayoutLeaderClient<RenderBox, SlotType>,
          SlottedMultiLeaderLayoutLink<SlotType>
        > {
  RenderSlottedLayoutLeader({
    required super.layoutClientFactory,
    required super.layoutLink,
    required SlotType slot,
    super.child,
  }) : _slot = slot;

  SlotType _slot;

  SlotType get slot => _slot;

  set slot(SlotType value) {
    if (_slot == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
    }
    _slot = value;
    markNeedsLayout();
  }
}
