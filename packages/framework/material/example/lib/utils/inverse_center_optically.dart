import 'package:material_example/flutter.dart';

class const InverseCenterOptically({
  super.key,
  super.enabled,
  super.corners,
  super.maxOffsets,
  super.textDirection,
  super.child,
}) extends CenterOptically {
  @override
  RenderInverseCenterOptically createRenderObject(BuildContext context) =>
      RenderInverseCenterOptically(
        enabled: enabled,
        corners: corners,
        maxOffsets: maxOffsets,
        textDirection: textDirection ?? Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderInverseCenterOptically renderObject,
  ) {
    renderObject
      ..enabled = enabled
      ..corners = corners
      ..maxOffsets = maxOffsets
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }
}

class RenderInverseCenterOptically({
  super.enabled,
  super.corners,
  super.maxOffsets,
  super.textDirection,
  super.child,
}) extends RenderCenterOptically {
  @override
  double getHorizontalPaddingCorrection(BorderRadius borderRadius) =>
      -super.getHorizontalPaddingCorrection(borderRadius);

  @override
  double getVerticalPaddingCorrection(BorderRadius borderRadius) =>
      -super.getVerticalPaddingCorrection(borderRadius);
}
