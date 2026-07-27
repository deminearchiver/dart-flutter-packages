import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

class SingleLayoutLeader extends SingleChildRenderObjectWidget {
  const SingleLayoutLeader({super.key, required this.layoutLink, super.child});

  final SingleLeaderLayoutLink? layoutLink;

  @override
  RenderSingleLayoutLeader createRenderObject(BuildContext context) =>
      .new(layoutLink: layoutLink);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSingleLayoutLeader renderObject,
  ) {
    renderObject.layoutLink = layoutLink;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SingleLeaderLayoutLink>("layoutLink", layoutLink),
    );
  }
}

class RenderSingleLayoutLeader extends RenderProxyBox
    with
        LayoutLeaderRenderObjectMixin<
          LayoutLeaderClient,
          LayoutFollowerClient,
          SingleLeaderLayoutLink
        > {
  RenderSingleLayoutLeader({required this._layoutLink, RenderBox? child})
    : super(child) {
    updateLayoutLink(layoutLink);
  }

  SingleLeaderLayoutLink? _layoutLink;

  SingleLeaderLayoutLink? get layoutLink => _layoutLink;

  set layoutLink(SingleLeaderLayoutLink? value) {
    if (_layoutLink == value) return;
    updateLayoutLink(value, () => _layoutLink = value);
    markNeedsLayout();
  }

  @override
  LayoutLeaderClient createLayoutClient({
    required LayoutLeaderClientSizeGetter onTryGetSize,
  }) => .new(this, onTryGetSize: onTryGetSize);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SingleLeaderLayoutLink>("layoutLink", layoutLink),
    );
  }
}

class SlottedLayoutLeader<SlotType extends Object?>
    extends SingleChildRenderObjectWidget {
  const SlottedLayoutLeader({
    super.key,
    required this.layoutLink,
    required this.slot,
    super.child,
  });

  final SlottedMultiLeaderLayoutLink<SlotType>? layoutLink;
  final SlotType slot;

  @override
  RenderSlottedLayoutLeader<SlotType> createRenderObject(
    BuildContext context,
  ) => .new(layoutLink: layoutLink, slot: slot);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSlottedLayoutLeader renderObject,
  ) {
    renderObject
      ..layoutLink = layoutLink
      ..slot = slot;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<SlottedMultiLeaderLayoutLink<SlotType>>(
          "layoutLink",
          layoutLink,
        ),
      )
      ..add(DiagnosticsProperty<SlotType>("slot", slot));
  }
}

class RenderSlottedLayoutLeader<SlotType extends Object?> extends RenderProxyBox
    with
        LayoutLeaderRenderObjectMixin<
          SlottedLayoutLeaderClient<SlotType>,
          LayoutFollowerClient,
          SlottedMultiLeaderLayoutLink<SlotType>
        > {
  RenderSlottedLayoutLeader({
    required this._layoutLink,
    required this._slot,
    RenderBox? child,
  }) : super(child) {
    updateLayoutLink(layoutLink);
  }

  SlottedMultiLeaderLayoutLink<SlotType>? _layoutLink;

  SlottedMultiLeaderLayoutLink<SlotType>? get layoutLink => _layoutLink;

  set layoutLink(SlottedMultiLeaderLayoutLink<SlotType>? value) {
    if (_layoutLink == value) return;
    updateLayoutLink(value, () => _layoutLink = value);
    markNeedsLayout();
  }

  SlotType _slot;

  SlotType get slot => _slot;

  set slot(SlotType value) {
    if (_slot == value) return;
    updateLayoutLink(layoutLink, () => _slot = value);
    markNeedsLayout();
  }

  @override
  SlottedLayoutLeaderClient<SlotType> createLayoutClient({
    required LayoutLeaderClientSizeGetter onTryGetSize,
  }) => .new(this, slot, onTryGetSize: onTryGetSize);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<SlottedMultiLeaderLayoutLink<SlotType>>(
          "layoutLink",
          layoutLink,
        ),
      )
      ..add(DiagnosticsProperty<SlotType>("slot", slot));
  }
}
