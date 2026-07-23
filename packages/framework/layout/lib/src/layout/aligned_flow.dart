import 'dart:math' as math;

import 'package:layout/src/layout/flutter.dart';

class AligningFlow extends MultiChildRenderObjectWidget {
  const AligningFlow({
    super.key,
    required this.direction,
    this.alignment = .center,
    this.mainAxisSizeFactor = 1.0,
    this.spacing = 0.0,
    this.textDirection,
    required super.children,
  }) : assert(spacing >= 0.0);

  final Axis direction;

  final Alignment alignment;

  final double mainAxisSizeFactor;

  final double spacing;

  final TextDirection? textDirection;

  @override
  RenderAligningFlow createRenderObject(BuildContext context) => .new(
    direction: direction,
    alignment: alignment,
    mainAxisSizeFactor: mainAxisSizeFactor,
    spacing: spacing,
    textDirection: textDirection ?? Directionality.maybeOf(context),
  );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderAligningFlow renderObject,
  ) {
    renderObject
      ..direction = direction
      ..alignment = alignment
      ..mainAxisSizeFactor = mainAxisSizeFactor
      ..spacing = spacing
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Axis>("direction", direction))
      ..add(
        DoubleProperty(
          "mainAxisSizeFactor",
          mainAxisSizeFactor,
          defaultValue: 1.0,
        ),
      )
      ..add(
        DiagnosticsProperty<AlignmentGeometry>(
          "alignment",
          alignment,
          defaultValue: Alignment.center,
        ),
      )
      ..add(DoubleProperty("spacing", spacing, defaultValue: 0.0))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}

class FlowAlign extends ParentDataWidget<AligningFlowParentData> {
  const FlowAlign({
    super.key,
    this.alignment,
    this.textDirection,
    required super.child,
  });

  final AlignmentGeometry? alignment;

  final TextDirection? textDirection;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is AligningFlowParentData);
    final parentData = renderObject.parentData! as AligningFlowParentData;

    var needsLayout = false;

    if (parentData.alignment != alignment) {
      parentData
        ..alignment = alignment
        .._resolvedAlignmentCache = null;
      needsLayout = true;
    }

    if (parentData.textDirection != textDirection) {
      parentData
        ..textDirection = textDirection
        .._resolvedAlignmentCache = null;
      needsLayout = true;
    }

    if (needsLayout) {
      renderObject.parent?.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => AligningFlow;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<AlignmentGeometry>(
          "alignment",
          alignment,
          defaultValue: Alignment.center,
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

class AligningFlowParentData extends ContainerBoxParentData<RenderBox> {
  AlignmentGeometry? alignment;
  TextDirection? textDirection;

  Alignment? _resolvedAlignmentCache;

  Alignment _resolveAlignment(
    Alignment defaultAlignment,
    TextDirection? defaultTextDirection,
  ) => _resolvedAlignmentCache ??=
      alignment?.resolve(textDirection ?? defaultTextDirection) ??
      defaultAlignment;
}

class RenderAligningFlow extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, AligningFlowParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, AligningFlowParentData> {
  RenderAligningFlow({
    required this._direction,
    this._alignment = .center,
    this._mainAxisSizeFactor = 1.0,
    this._spacing = 0.0,
    this._textDirection,
    List<RenderBox>? children,
  }) : assert(_spacing >= 0.0) {
    addAll(children);
  }

  Axis _direction;

  Axis get direction => _direction;

  set direction(Axis value) {
    if (_direction == value) return;
    _direction = value;
    markNeedsLayout();
  }

  AlignmentGeometry _alignment;

  AlignmentGeometry get alignment => _alignment;

  set alignment(AlignmentGeometry value) {
    if (_alignment == value) return;
    _alignment = value;
    _resolvedAlignmentCache = null;
    markNeedsLayout();
  }

  double _mainAxisSizeFactor;

  double get mainAxisSizeFactor => _mainAxisSizeFactor;

  set mainAxisSizeFactor(double value) {
    if (_mainAxisSizeFactor == value) return;
    _mainAxisSizeFactor = value;
    markNeedsLayout();
  }

  double _spacing;

  double get spacing => _spacing;

  set spacing(double value) {
    if (_spacing == value) return;
    _spacing = value;
    markNeedsLayout();
  }

  TextDirection? _textDirection;

  TextDirection? get textDirection => _textDirection;

  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _resolvedAlignmentCache = null;
    markNeedsLayout();
  }

  Alignment? _resolvedAlignmentCache;

  Alignment get _resolvedAlignment =>
      _resolvedAlignmentCache ??= alignment.resolve(textDirection);

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! AligningFlowParentData) {
      child.parentData = AligningFlowParentData();
    }
  }

  AligningFlowParentData _childParentData(RenderBox child) {
    assert(child.parent == this);
    assert(child.parentData is AligningFlowParentData);
    return child.parentData! as AligningFlowParentData;
  }

  double _getIntrinsicSize({
    required Axis sizingDirection,
    required double extent,
    required double Function(RenderBox child, double extent) childSize,
  }) {
    if (sizingDirection == direction) {
      var totalMainAxisSize = spacing * (childCount - 1);
      for (var child = firstChild; child != null; child = childAfter(child)) {
        totalMainAxisSize += childSize(child, extent);
      }
      return math.max(0.0, totalMainAxisSize * mainAxisSizeFactor);
    } else {
      var maxCrossAxisSize = 0.0;
      for (var child = firstChild; child != null; child = childAfter(child)) {
        maxCrossAxisSize = math.max(maxCrossAxisSize, childSize(child, extent));
      }
      return maxCrossAxisSize;
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) => _getIntrinsicSize(
    sizingDirection: .horizontal,
    extent: height,
    childSize: (child, extent) => child.getMinIntrinsicWidth(extent),
  );

  @override
  double computeMaxIntrinsicWidth(double height) => _getIntrinsicSize(
    sizingDirection: .horizontal,
    extent: height,
    childSize: (child, extent) => child.getMaxIntrinsicWidth(extent),
  );

  @override
  double computeMinIntrinsicHeight(double width) => _getIntrinsicSize(
    sizingDirection: .vertical,
    extent: width,
    childSize: (child, extent) => child.getMinIntrinsicHeight(extent),
  );

  @override
  double computeMaxIntrinsicHeight(double width) => _getIntrinsicSize(
    sizingDirection: .vertical,
    extent: width,
    childSize: (child, extent) => child.getMaxIntrinsicHeight(extent),
  );

  Size _computeLayout(
    BoxChildLayoutStrategy strategy,
    BoxConstraints constraints,
  ) {
    final mainAxisSizeFactor = this.mainAxisSizeFactor;
    final spacing = this.spacing * mainAxisSizeFactor;

    final Size size;

    {
      var totalMainAxisSize = 0.0;
      var maxCrossAxisSize = 0.0;

      final childConstraints = switch (direction) {
        .horizontal => constraints.heightConstraints(),
        .vertical => constraints.widthConstraints(),
      };

      for (var child = firstChild; child != null; child = childAfter(child)) {
        final childSize = strategy.layoutChildForSize(child, childConstraints);
        switch (direction) {
          case .horizontal:
            totalMainAxisSize += childSize.width;
            maxCrossAxisSize = math.max(maxCrossAxisSize, childSize.height);
          case .vertical:
            totalMainAxisSize += childSize.height;
            maxCrossAxisSize = math.max(maxCrossAxisSize, childSize.width);
        }
      }

      final totalSpacing = spacing * (childCount - 1);

      final mainAxisSize =
          totalMainAxisSize * mainAxisSizeFactor + totalSpacing;

      size = switch (direction) {
        .horizontal => constraints.constrainDimensions(
          mainAxisSize,
          maxCrossAxisSize,
        ),
        .vertical => constraints.constrainDimensions(
          maxCrossAxisSize,
          mainAxisSize,
        ),
      };
    }

    if (strategy.affectsLayoutState) {
      final alignment = _resolvedAlignment;
      var currentMainAxisPosition = 0.0;
      for (var child = firstChild; child != null; child = childAfter(child)) {
        final childParentData = _childParentData(child);
        final childAlignment = childParentData._resolveAlignment(
          alignment,
          textDirection,
        );
        final childSize = child.size;

        final double mainAxisExtent;
        final double centerX;
        final double centerY;

        switch (direction) {
          case .horizontal:
            mainAxisExtent = childSize.width * mainAxisSizeFactor;
            centerX = (mainAxisExtent - childSize.width) / 2.0;
            centerY = (size.height - childSize.height) / 2.0;
          case .vertical:
            mainAxisExtent = childSize.height * mainAxisSizeFactor;
            centerX = (size.width - childSize.width) / 2.0;
            centerY = (mainAxisExtent - childSize.height) / 2.0;
        }

        final childOffsetX = centerX + childAlignment.x * centerX;
        final childOffsetY = centerY + childAlignment.y * centerY;

        final childPosition = switch (direction) {
          .horizontal => Offset(
            currentMainAxisPosition + childOffsetX,
            childOffsetY,
          ),
          .vertical => Offset(
            childOffsetX,
            currentMainAxisPosition + childOffsetY,
          ),
        };

        strategy.positionChild(child, childPosition);

        currentMainAxisPosition += mainAxisExtent + spacing;
      }
    }

    return size;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _computeLayout(.dry, constraints);

  @override
  void performLayout() {
    size = _computeLayout(.wet, constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    for (var child = firstChild; child != null; child = childAfter(child)) {
      context.paintChild(child, offset + _childParentData(child).offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    for (var child = lastChild; child != null; child = childBefore(child)) {
      final childParentData = _childParentData(child);
      final isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (result, transformed) {
          assert(transformed == position - childParentData.offset);
          return child!.hitTest(result, position: transformed);
        },
      );
      if (isHit) return true;
    }
    return false;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Axis>("direction", direction))
      ..add(
        DoubleProperty(
          "mainAxisSizeFactor",
          mainAxisSizeFactor,
          defaultValue: 1.0,
        ),
      )
      ..add(
        DiagnosticsProperty<AlignmentGeometry>(
          "alignment",
          alignment,
          defaultValue: Alignment.center,
        ),
      )
      ..add(DoubleProperty("spacing", spacing, defaultValue: 0.0))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}
