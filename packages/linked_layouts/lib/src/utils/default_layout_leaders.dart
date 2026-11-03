import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

class const SingleLayoutLeader({
  super.key,
  required final SingleLeaderLayoutLink<
    LayoutLeaderClient<Size>,
    LayoutFollowerClient
  >?
  layoutLink,
  super.child,
}) extends SingleChildRenderObjectWidget {
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
      DiagnosticsProperty<
        SingleLeaderLayoutLink<LayoutLeaderClient<Size>, LayoutFollowerClient>
      >("layoutLink", layoutLink),
    );
  }
}

class RenderSingleLayoutLeader({
  required var SingleLeaderLayoutLink<
    LayoutLeaderClient<Size>,
    LayoutFollowerClient
  >?
  _layoutLink,
  RenderBox? child,
}) extends RenderProxyBox
    with
        LayoutLeaderRenderObjectMixin<
          LayoutLeaderClient<Size>,
          LayoutFollowerClient,
          SingleLeaderLayoutLink<LayoutLeaderClient<Size>, LayoutFollowerClient>
        > {
  this : super(child) {
    updateLayoutLink(layoutLink);
  }

  SingleLeaderLayoutLink<LayoutLeaderClient<Size>, LayoutFollowerClient>?
  get layoutLink => _layoutLink;

  set layoutLink(
    SingleLeaderLayoutLink<LayoutLeaderClient<Size>, LayoutFollowerClient>?
    value,
  ) {
    if (_layoutLink == value) return;
    updateLayoutLink(value, () => _layoutLink = value);
    markNeedsLayout();
  }

  @override
  LayoutLeaderClient<Size> createLayoutClient({
    required LayoutLeaderClientGeometryGetter<Size> onTryGetGeometry,
  }) => .new(this, onTryGetGeometry: onTryGetGeometry);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<
        SingleLeaderLayoutLink<LayoutLeaderClient<Size>, LayoutFollowerClient>
      >("layoutLink", layoutLink),
    );
  }
}

class const SlottedLayoutLeader<SlotType extends Object?>({
  super.key,
  required final SlottedMultiLeaderLayoutLink<
    SlotType,
    SlottedLayoutLeaderClient<SlotType, Size>,
    LayoutFollowerClient
  >?
  layoutLink,
  required final SlotType slot,
  super.child,
}) extends SingleChildRenderObjectWidget {
  @override
  RenderSlottedLayoutLeader<SlotType> createRenderObject(
    BuildContext context,
  ) => .new(layoutLink: layoutLink, slot: slot);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSlottedLayoutLeader<SlotType> renderObject,
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
        DiagnosticsProperty<
          SlottedMultiLeaderLayoutLink<
            SlotType,
            SlottedLayoutLeaderClient<SlotType, Size>,
            LayoutFollowerClient
          >
        >("layoutLink", layoutLink),
      )
      ..add(DiagnosticsProperty<SlotType>("slot", slot));
  }
}

class RenderSlottedLayoutLeader<SlotType extends Object?>({
  required var SlottedMultiLeaderLayoutLink<
    SlotType,
    SlottedLayoutLeaderClient<SlotType, Size>,
    LayoutFollowerClient
  >?
  _layoutLink,
  required var SlotType _slot,
  RenderBox? child,
}) extends RenderProxyBox
    with
        LayoutLeaderRenderObjectMixin<
          SlottedLayoutLeaderClient<SlotType, Size>,
          LayoutFollowerClient,
          SlottedMultiLeaderLayoutLink<
            SlotType,
            SlottedLayoutLeaderClient<SlotType, Size>,
            LayoutFollowerClient
          >
        > {
  this : super(child) {
    updateLayoutLink(layoutLink);
  }

  SlottedMultiLeaderLayoutLink<
    SlotType,
    SlottedLayoutLeaderClient<SlotType, Size>,
    LayoutFollowerClient
  >?
  get layoutLink => _layoutLink;

  set layoutLink(
    SlottedMultiLeaderLayoutLink<
      SlotType,
      SlottedLayoutLeaderClient<SlotType, Size>,
      LayoutFollowerClient
    >?
    value,
  ) {
    if (_layoutLink == value) return;
    updateLayoutLink(value, () => _layoutLink = value);
    markNeedsLayout();
  }

  SlotType get slot => _slot;

  set slot(SlotType value) {
    if (_slot == value) return;
    updateLayoutLink(layoutLink, () => _slot = value);
    markNeedsLayout();
  }

  @override
  SlottedLayoutLeaderClient<SlotType, Size> createLayoutClient({
    required LayoutLeaderClientGeometryGetter<Size> onTryGetGeometry,
  }) => .new(this, slot, onTryGetGeometry: onTryGetGeometry);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<
          SlottedMultiLeaderLayoutLink<
            SlotType,
            SlottedLayoutLeaderClient<SlotType, Size>,
            LayoutFollowerClient
          >
        >("layoutLink", layoutLink),
      )
      ..add(DiagnosticsProperty<SlotType>("slot", slot));
  }
}
