import 'package:material/src/material/flutter.dart';

const double _kCenterOpticallyCoefficient = 0.11;

class CenterOptically extends SingleChildRenderObjectWidget {
  const CenterOptically({
    super.key,
    this.enabled = true,
    this.corners = .zero,
    this.maxOffsets = .zero,
    this.textDirection,
    super.child,
  });

  final bool enabled;
  final CornersGeometry corners;
  final EdgeInsetsGeometry maxOffsets;
  final TextDirection? textDirection;

  @override
  RenderCenterOptically createRenderObject(BuildContext context) =>
      RenderCenterOptically(
        enabled: enabled,
        corners: corners,
        maxOffsets: maxOffsets,
        textDirection: textDirection ?? Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderCenterOptically renderObject,
  ) {
    renderObject
      ..enabled = enabled
      ..corners = corners
      ..maxOffsets = maxOffsets
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("enabled", enabled))
      ..add(DiagnosticsProperty<CornersGeometry>("corners", corners))
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>(
          "maxOffsets",
          maxOffsets,
          defaultValue: EdgeInsets.zero,
        ),
      )
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}

class RenderCenterOptically extends RenderShiftedBox {
  RenderCenterOptically({
    bool enabled = true,
    CornersGeometry corners = .zero,
    EdgeInsetsGeometry maxOffsets = .zero,
    TextDirection? textDirection,
    RenderBox? child,
  }) : _enabled = enabled,
       _corners = corners,
       _maxOffsets = maxOffsets,
       _textDirection = textDirection,
       super(child);

  Corners? _resolvedCornersCache;
  Corners get _resolvedCorners =>
      _resolvedCornersCache ??= corners.resolve(textDirection);

  EdgeInsets? _resolvedMaxOffsetsCache;
  EdgeInsets get _resolvedMaxOffsets =>
      _resolvedMaxOffsetsCache ??= maxOffsets.resolve(textDirection);

  void _markNeedResolution() {
    _resolvedCornersCache = null;
    _resolvedMaxOffsetsCache = null;
    markNeedsLayout();
  }

  bool _enabled;
  bool get enabled => _enabled;
  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    markNeedsLayout();
  }

  CornersGeometry _corners;
  CornersGeometry get corners => _corners;
  set corners(CornersGeometry value) {
    if (_corners == value) return;
    _corners = value;
    _markNeedResolution();
  }

  EdgeInsetsGeometry _maxOffsets;
  EdgeInsetsGeometry get maxOffsets => _maxOffsets;
  set maxOffsets(EdgeInsetsGeometry value) {
    if (_maxOffsets == value) return;
    _maxOffsets = value;
    _markNeedResolution();
  }

  TextDirection? _textDirection;
  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _markNeedResolution();
  }

  @protected
  double computeHorizontalPaddingCorrection(BorderRadius borderRadius) =>
      _kCenterOpticallyCoefficient /
      2.0 *
      (borderRadius.topLeft.x +
          borderRadius.bottomLeft.x -
          borderRadius.topRight.x -
          borderRadius.bottomRight.x);

  @protected
  double computeVerticalPaddingCorrection(BorderRadius borderRadius) =>
      _kCenterOpticallyCoefficient /
      2.0 *
      (borderRadius.topLeft.x +
          borderRadius.topRight.x -
          borderRadius.bottomLeft.x -
          borderRadius.bottomRight.x);

  double getHorizontalPaddingCorrection(BorderRadius borderRadius) {
    final maxOffsets = _resolvedMaxOffsets;
    if (maxOffsets.left == 0.0 && maxOffsets.right == 0.0) return 0.0;
    return clampDouble(
      computeHorizontalPaddingCorrection(borderRadius),
      -maxOffsets.left,
      maxOffsets.right,
    );
  }

  double getVerticalPaddingCorrection(BorderRadius borderRadius) {
    final maxOffsets = _resolvedMaxOffsets;
    if (maxOffsets.top == 0.0 && maxOffsets.bottom == 0.0) return 0.0;
    return clampDouble(
      computeVerticalPaddingCorrection(borderRadius),
      -maxOffsets.top,
      maxOffsets.bottom,
    );
  }

  Offset _getPaddingCorrection(BorderRadius borderRadius) => Offset(
    getHorizontalPaddingCorrection(borderRadius),
    getVerticalPaddingCorrection(borderRadius),
  );

  Size _computeLayout(
    BoxChildLayoutStrategy strategy,
    BoxConstraints constraints,
  ) {
    final child = this.child;
    if (child == null) return constraints.smallest;
    final childSize = strategy.layoutChildForSize(child, constraints);
    final paddingCorrection = enabled
        ? _getPaddingCorrection(_resolvedCorners.toBorderRadius(childSize))
        : Offset.zero;
    if (strategy.affectsLayoutState) {
      strategy.positionChild(child, paddingCorrection);
    }
    return childSize;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(.dry, constraints);

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final child = this.child;
    if (child == null) return null;

    final childBaseline = child.getDryBaseline(constraints, baseline);
    if (childBaseline == null) return null;

    final childSize = child.getDryLayout(constraints);
    final paddingCorrection = enabled
        ? _getPaddingCorrection(_resolvedCorners.toBorderRadius(childSize))
        : Offset.zero;

    return childBaseline + paddingCorrection.dy;
  }

  @override
  void performLayout() {
    size = _computeLayout(.wet, constraints);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("enabled", enabled, defaultValue: true))
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "corners",
          corners,
          defaultValue: CornersGeometry.zero,
        ),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>(
          "maxOffsets",
          maxOffsets,
          defaultValue: EdgeInsets.zero,
        ),
      )
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }

  static double calculatePaddingCorrection(
    double averageStart,
    double averageEnd,
    double maxStartOffset,
    double maxEndOffset,
  ) => clampDouble(
    _kCenterOpticallyCoefficient * (averageStart - averageEnd),
    -maxStartOffset,
    maxEndOffset,
  );
}
