import 'dart:math' as math;

import 'package:layout/src/layout/flutter.dart';
import 'package:flutter/rendering.dart' as flutter;
import 'package:flutter/widgets.dart' as flutter;

/// A widget that insets its child by the given padding.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=oD5RtLhhubg}
///
/// When passing layout constraints to its child, padding shrinks the
/// constraints by the given padding, causing the child to layout at a smaller
/// size. Padding then sizes itself to its child's size, inflated by the
/// padding, effectively creating empty space around the child.
///
/// {@tool snippet}
///
/// This snippet creates "Hello World!" [Text] inside a [Card] that is indented
/// by sixteen pixels in each direction.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/padding.png)
///
/// ```dart
/// const Card(
///   child: Padding(
///     padding: EdgeInsets.all(16.0),
///     child: Text('Hello World!'),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [EdgeInsets], the class that is used to describe the padding dimensions.
///  * [SliverPadding], the sliver equivalent of this widget.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
class Padding extends SingleChildRenderObjectWidget implements flutter.Padding {
  /// Creates a widget that insets its child.
  const Padding({super.key, required this.padding, super.child});

  /// The amount of space by which to inset the child.
  @override
  final EdgeInsetsGeometry padding;

  @override
  RenderPadding createRenderObject(BuildContext context) => RenderPadding(
    padding: padding,
    textDirection: Directionality.maybeOf(context),
  );

  @override
  void updateRenderObject(BuildContext context, RenderPadding renderObject) {
    renderObject
      ..padding = padding
      ..textDirection = Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding));
  }
}

/// Insets its child by the given padding.
///
/// When passing layout constraints to its child, padding shrinks the
/// constraints by the given padding, causing the child to layout at a smaller
/// size. Padding then sizes itself to its child's size, inflated by the
/// padding, effectively creating empty space around the child.
class RenderPadding extends RenderShiftedBox implements flutter.RenderPadding {
  /// Creates a render object that insets its child.
  RenderPadding({
    required EdgeInsetsGeometry padding,
    TextDirection? textDirection,
    RenderBox? child,
  }) : _padding = padding,
       _textDirection = textDirection,
       super(child);

  EdgeInsets? _resolvedPaddingCache;
  EdgeInsets get _resolvedPadding =>
      _resolvedPaddingCache ??= padding.resolve(textDirection);

  void _markNeedResolution() {
    _resolvedPaddingCache = null;
    markNeedsLayout();
  }

  EdgeInsetsGeometry _padding;

  /// The amount to pad the child in each dimension.
  ///
  /// If this is set to an [EdgeInsetsDirectional] object, then [textDirection]
  /// must not be null.
  @override
  EdgeInsetsGeometry get padding => _padding;

  @override
  set padding(EdgeInsetsGeometry value) {
    if (_padding == value) return;
    _padding = value;
    _markNeedResolution();
  }

  TextDirection? _textDirection;

  /// The text direction with which to resolve [padding].
  ///
  /// This may be changed to null, but only after the [padding] has been changed
  /// to a value that does not depend on the direction.
  @override
  TextDirection? get textDirection => _textDirection;

  @override
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _markNeedResolution();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final padding = _resolvedPadding;
    var result = padding.horizontal;
    if (child case final child?) {
      // Relies on double.infinity absorption.
      result += child.getMinIntrinsicWidth(
        math.max(0.0, height - padding.vertical),
      );
    }
    return math.max(0.0, result);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final padding = _resolvedPadding;
    var result = padding.horizontal;
    if (child case final child?) {
      // Relies on double.infinity absorption.
      result += child.getMaxIntrinsicWidth(
        math.max(0.0, height - padding.vertical),
      );
    }
    return math.max(0.0, result);
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final padding = _resolvedPadding;
    var result = padding.vertical;
    if (child case final child?) {
      // Relies on double.infinity absorption.
      result += child.getMinIntrinsicHeight(
        math.max(0.0, width - padding.horizontal),
      );
    }
    return math.max(0.0, result);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final padding = _resolvedPadding;
    var result = padding.vertical;
    if (child case final child?) {
      // Relies on double.infinity absorption.
      result += child.getMaxIntrinsicHeight(
        math.max(0.0, width - padding.horizontal),
      );
    }
    return math.max(0.0, result);
  }

  Size _layout({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
    required ChildPositioner positionChild,
  }) {
    final padding = _resolvedPadding;
    var width = padding.horizontal;
    var height = padding.vertical;
    if (child case final child?) {
      final innerConstraints = constraints.deflate(padding);
      final childSize = layoutChild(child, innerConstraints);
      positionChild(child, Offset(padding.left, padding.top));
      width += childSize.width;
      height += childSize.height;
    }
    return constraints.constrain(
      Size(math.max(0.0, width), math.max(0.0, height)),
    );
  }

  @override
  @protected
  Size computeDryLayout(covariant BoxConstraints constraints) => _layout(
    constraints: constraints,
    layoutChild: ChildLayoutHelper.dryLayoutChild,
    positionChild: ChildLayoutHelper.dryPositionChild,
  );

  @override
  void performLayout() {
    size = _layout(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
      positionChild: ChildLayoutHelper.positionChild,
    );
  }

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    if (child case final child?) {
      final padding = _resolvedPadding;
      final innerConstraints = constraints.deflate(padding);
      final childBaseline = child.getDryBaseline(innerConstraints, baseline);
      return (BaselineOffset(childBaseline) + padding.top).offset;
    } else {
      return null;
    }
  }

  @override
  void debugPaintSize(PaintingContext context, Offset offset) {
    super.debugPaintSize(context, offset);
    assert(() {
      final outerRect = offset & size;
      debugPaintPadding(
        context.canvas,
        outerRect,
        child != null ? _resolvedPaddingCache!.deflateRect(outerRect) : null,
      );
      return true;
    }());
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}
