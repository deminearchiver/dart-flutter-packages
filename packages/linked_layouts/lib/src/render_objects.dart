import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/linked_layouts.dart';

class LayoutLeader<
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
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
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    extends RenderProxyBox
    with
        RenderObjectWithLayoutLinkMixin<LayoutLeaderClient, LayoutLinkType>,
        RenderLayoutLeaderMixin<LayoutLeaderClient, LayoutLinkType> {
  RenderLayoutLeader({required LayoutLinkType layoutLink, RenderBox? child})
    : super(child) {
    this.layoutLink = layoutLink;
  }

  @override
  LayoutLeaderClient<RenderLayoutLeader<LayoutLinkType>> createLayoutClient() =>
      DefaultLayoutLeaderClient(this);
}

class SlottedLayoutLeader<SlotType extends Object?>
    extends LayoutLeader<SlottedMultiLeaderLayoutLink<SlotType>> {
  const SlottedLayoutLeader({
    super.key,
    required super.layoutLink,
    required this.slot,
    super.child,
  });

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
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      layoutLinkHandle = layoutLink.registerLeader(createLayoutClient());
    }
    _slot = value;
    markNeedsLayout();
  }

  @override
  SlottedLayoutLeaderClient<RenderSlottedLayoutLeader<SlotType>, SlotType>
  createLayoutClient() => DefaultSlottedLayoutLeaderClient(this, slot);
}
