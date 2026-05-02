import 'package:flutter/widgets.dart';
import 'package:linked_layouts/linked_layouts.dart';

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
    _slot = value;
    if (attached) {
      layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
    }
    markNeedsLayout();
  }
}
