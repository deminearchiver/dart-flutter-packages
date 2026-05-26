import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_targets/touch_targets.dart';

mixin TouchTargetDefaultsRenderObjectMixin
    on
        RenderBox,
        RenderObjectWithChildMixin<RenderBox>,
        TouchClientRenderObjectRequiredMixin {}

// mixin TouchTargetRenderObjectWidgetMixin on RenderObjectWidget {
//   @override
//   RenderTouchTargetMixin createRenderObject(BuildContext context);

//   @override
//   void updateRenderObject(
//     BuildContext context,
//     covariant RenderTouchTargetMixin renderObject,
//   );
// }

mixin _RenderDefaultTouchTargetMixin
    on RenderShiftedBox, TouchClientRenderObjectRequiredMixin {
  bool get _enabled;
  set _enabled(bool value);

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    // TODO: decide whether enabled should affect layout when fit is wrap
    markNeedsLayout();
  }

  TouchTargetFit get _fit;
  set _fit(TouchTargetFit value);

  TouchTargetFit get fit => _fit;

  set fit(TouchTargetFit value) {
    if (_fit == value) return;
    _fit = value;
    markNeedsLayout();
  }

  @override
  TouchClient createTouchClient() => _DefaultTouchTargetClient(this);

  Rect _getLocalRect();

  double _getDistanceToEdge(Offset localPosition) {
    final dx = localPosition.dx < 0.0
        ? -localPosition.dx
        : localPosition.dx > size.width
        ? localPosition.dx - size.width
        : 0.0;
    final dy = localPosition.dy < 0.0
        ? -localPosition.dy
        : localPosition.dy > size.height
        ? localPosition.dy - size.height
        : 0.0;
    return math.sqrt(dx * dx + dy * dy);
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    final child = this.child;
    if (child != null && enabled) {
      switch (fit) {
        case .wrap:
          if (size.contains(position)) {
            final childCenter = child.size.center(.zero);
            final childParentData = child.parentData! as BoxParentData;
            final childOffset = childParentData.offset;
            final forcedPosition = childOffset + childCenter;
            return result.addWithRawTransform(
              transform: MatrixUtils.forceToPoint(forcedPosition),
              position: position,
              hitTest: (result, position) {
                assert(position == forcedPosition);
                return child.hitTest(result, position: childCenter);
              },
            );
          }
        case .overflow:
          return super.hitTest(result, position: position);
      }
    }
    return super.hitTest(result, position: position);
  }
}

class _DefaultTouchTargetClient implements TouchClient {
  const _DefaultTouchTargetClient(this._renderObject);

  final _RenderDefaultTouchTargetMixin _renderObject;

  @override
  bool get isActive => _renderObject.attached && _renderObject.enabled;

  @override
  Size get innerSize {
    if (_renderObject.child case final child? when child.hasSize) {
      return child.size;
    }
    return _renderObject.hasSize ? _renderObject.size : .zero;
  }

  @override
  Rect getRectIn(RenderBox ancestor) {
    final transform = _renderObject.getTransformTo(ancestor);
    final localRect = _renderObject._getLocalRect();
    return MatrixUtils.transformRect(transform, localRect);
  }

  @override
  double getDistanceToEdgeIn(RenderBox ancestor, Offset position) {
    final transform = _renderObject.getTransformTo(ancestor);
    final inverse = Matrix4.tryInvert(transform);
    if (inverse == null) return .infinity;
    final localPosition = MatrixUtils.transformPoint(inverse, position);
    return _renderObject._getDistanceToEdge(localPosition);
  }

  @override
  bool hitTestInnerFrom(
    RenderBox ancestor,
    BoxHitTestResult result,
    Offset position,
  ) {
    final transform = _renderObject.getTransformTo(ancestor);
    final childCenter = _renderObject.child!.size.center(Offset.zero);
    final childParentData = _renderObject.child!.parentData! as BoxParentData;
    final childOffset = childParentData.offset;
    return result.addWithPaintTransform(
      transform: transform,
      position: position,
      hitTest: (result, localPosition) {
        final forcedPosition = childOffset + childCenter;
        return result.addWithRawTransform(
          transform: MatrixUtils.forceToPoint(forcedPosition),
          position: localPosition,
          hitTest: (result, hitPosition) {
            assert(hitPosition == forcedPosition);
            return _renderObject.child!.hitTest(result, position: childCenter);
          },
        );
      },
    );
  }

  @override
  bool hasLinealRelationWith(RenderObject hit) {
    // Direct hit.
    if (hit == _renderObject) return true;
    // TODO: evaluate if using depth is safe here
    if (hit.depth < _renderObject.depth) {
      // Check if hit is an ancestor.
      var current = _renderObject.parent;
      while (current != null && current.depth >= hit.depth) {
        if (current == hit) return true;
        current = current.parent;
      }
    } else if (hit.depth > _renderObject.depth) {
      // Check if hit is a descendant.
      var current = hit.parent;
      while (current != null && current.depth >= _renderObject.depth) {
        if (current == _renderObject) return true;
        current = current.parent;
      }
    }
    // Completely unrelated.
    return false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DefaultTouchTargetClient &&
          _renderObject == other._renderObject;

  @override
  int get hashCode => _renderObject.hashCode;
}

class SizedTouchTarget extends SingleChildRenderObjectWidget {
  const SizedTouchTarget({
    super.key,
    this.registry,
    this.enabled = true,
    required this.fit,
    required this.minimumSize,
    this.alignment = .center,
    this.textDirection,
    required Widget super.child,
  });

  final TouchGroupRegistry? registry;
  final bool enabled;
  final TouchTargetFit fit;
  final Size minimumSize;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;

  @override
  RenderSizedTouchTarget createRenderObject(BuildContext context) =>
      RenderSizedTouchTarget(
        registry: registry ?? TouchGroup.of(context),
        enabled: enabled,
        fit: fit,
        minimumSize: minimumSize,
        alignment: alignment,
        textDirection: textDirection ?? Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSizedTouchTarget renderObject,
  ) {
    renderObject
      ..registry = registry ?? TouchGroup.of(context)
      ..enabled = enabled
      ..fit = fit
      ..minimumSize = minimumSize
      ..alignment = alignment
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        FlagProperty(
          "enabled",
          value: enabled,
          ifTrue: "enabled",
          ifFalse: "disabled",
        ),
      )
      ..add(EnumProperty<TouchTargetFit>("fit", fit))
      ..add(DiagnosticsProperty<Size>("minimumSize", minimumSize))
      ..add(DiagnosticsProperty<AlignmentGeometry>("alignment", alignment))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}

class RenderSizedTouchTarget extends RenderShiftedBox
    with TouchClientRenderObjectRequiredMixin, _RenderDefaultTouchTargetMixin {
  RenderSizedTouchTarget({
    required TouchGroupRegistry registry,
    required this._enabled,
    required this._fit,
    required this._minimumSize,
    this._alignment = .center,
    this._textDirection,
    RenderBox? child,
  }) : super(child) {
    this.registry = registry;
  }

  @override
  bool _enabled;

  @override
  TouchTargetFit _fit;

  Size _minimumSize;

  Size get minimumSize => _minimumSize;

  set minimumSize(Size value) {
    if (_minimumSize == value) return;
    _minimumSize = value;
    markNeedsLayout();
  }

  AlignmentGeometry _alignment;

  /// How to align the child.
  ///
  /// The x and y values of the alignment control the horizontal and vertical
  /// alignment, respectively. An x value of -1.0 means that the left edge of
  /// the child is aligned with the left edge of the parent whereas an x value
  /// of 1.0 means that the right edge of the child is aligned with the right
  /// edge of the parent. Other values interpolate (and extrapolate) linearly.
  /// For example, a value of 0.0 means that the center of the child is aligned
  /// with the center of the parent.
  ///
  /// If this is set to an [AlignmentDirectional] object, then
  /// [textDirection] must not be null.
  AlignmentGeometry get alignment => _alignment;

  /// Sets the alignment to a new value, and triggers a layout update.
  set alignment(AlignmentGeometry value) {
    if (_alignment == value) return;
    _alignment = value;
    _markNeedsResolution();
  }

  TextDirection? _textDirection;

  /// The text direction with which to resolve [alignment].
  ///
  /// This may be changed to null, but only after [alignment] has been changed
  /// to a value that does not depend on the direction.
  TextDirection? get textDirection => _textDirection;

  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _markNeedsResolution();
  }

  Alignment? _resolvedAlignmentCache;

  Alignment get _resolvedAlignment =>
      _resolvedAlignmentCache ??= alignment.resolve(textDirection);

  void _markNeedsResolution() {
    _resolvedAlignmentCache = null;
    markNeedsLayout();
  }

  @override
  Rect _getLocalRect() {
    if (!enabled) return Offset.zero & size;
    switch (fit) {
      case .wrap:
        return Offset.zero & size;
      case .overflow:
        final targetWidth = math.max(size.width, minimumSize.width);
        final targetHeight = math.max(size.height, minimumSize.height);
        final alignment = _resolvedAlignment;
        final childRelativeX =
            (targetWidth - size.width) * (alignment.x + 1.0) / 2.0;
        final childRelativeY =
            (targetHeight - size.height) * (alignment.y + 1.0) / 2.0;
        return .fromLTWH(
          -childRelativeX,
          -childRelativeY,
          targetWidth,
          targetHeight,
        );
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      final childWidth = child.getMinIntrinsicWidth(height);
      if (!enabled) return childWidth;
      switch (fit) {
        case .wrap:
          return math.max(childWidth, minimumSize.width);
        case .overflow:
          return childWidth;
      }
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      final childWidth = child.getMaxIntrinsicWidth(height);
      if (!enabled) return childWidth;
      switch (fit) {
        case .wrap:
          return math.max(childWidth, minimumSize.width);
        case .overflow:
          return childWidth;
      }
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      final childHeight = child.getMinIntrinsicHeight(width);
      if (!enabled) return childHeight;
      switch (fit) {
        case .wrap:
          return math.max(childHeight, minimumSize.height);
        case .overflow:
          return childHeight;
      }
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      final childHeight = child.getMaxIntrinsicHeight(width);
      if (!enabled) return childHeight;
      switch (fit) {
        case .wrap:
          return math.max(childHeight, minimumSize.height);
        case .overflow:
          return childHeight;
      }
    }
    return 0.0;
  }

  Size _computeLayout(BoxConstraints constraints, ChildLayouter layoutChild) {
    if (child != null) {
      final childSizeValue = layoutChild(child!, constraints);
      if (enabled) {
        switch (fit) {
          case .wrap:
            final width = math.max(childSizeValue.width, minimumSize.width);
            final height = math.max(childSizeValue.height, minimumSize.height);
            return constraints.constrain(Size(width, height));
          case .overflow:
            return childSizeValue;
        }
      }
      return childSizeValue;
    }
    return .zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    if (child case final child?) {
      final childParentData = child.parentData! as BoxParentData;
      if (enabled) {
        switch (fit) {
          case .wrap:
            child.layout(constraints, parentUsesSize: true);
            final width = math.max(child.size.width, minimumSize.width);
            final height = math.max(child.size.height, minimumSize.height);
            size = constraints.constrain(Size(width, height));
            final alignment = _resolvedAlignment;
            childParentData.offset = alignment.alongOffset(
              size - child.size as Offset,
            );
          case .overflow:
            child.layout(constraints, parentUsesSize: true);
            size = child.size;
            childParentData.offset = .zero;
        }
      } else {
        child.layout(constraints, parentUsesSize: true);
        size = child.size;
        childParentData.offset = .zero;
      }
    } else {
      size = constraints.constrain(.zero);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        FlagProperty(
          "enabled",
          value: enabled,
          ifTrue: "enabled",
          ifFalse: "disabled",
        ),
      )
      ..add(EnumProperty<TouchTargetFit>("fit", fit))
      ..add(DiagnosticsProperty<Size>("minimumSize", minimumSize))
      ..add(DiagnosticsProperty<AlignmentGeometry>("alignment", alignment))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}

class PaddedTouchTarget extends SingleChildRenderObjectWidget {
  const PaddedTouchTarget({
    super.key,
    this.registry,
    this.enabled = true,
    required this.fit,
    this.padding = .zero,
    this.textDirection,
    required Widget super.child,
  });

  final TouchGroupRegistry? registry;
  final bool enabled;
  final TouchTargetFit fit;
  final EdgeInsetsGeometry padding;
  final TextDirection? textDirection;

  @override
  RenderPaddedTouchTarget createRenderObject(BuildContext context) =>
      RenderPaddedTouchTarget(
        registry: registry ?? TouchGroup.of(context),
        enabled: enabled,
        fit: fit,
        padding: padding,
        textDirection: textDirection ?? Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderPaddedTouchTarget renderObject,
  ) {
    renderObject
      ..registry = registry ?? TouchGroup.of(context)
      ..enabled = enabled
      ..fit = fit
      ..padding = padding
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        FlagProperty(
          "enabled",
          value: enabled,
          ifTrue: "enabled",
          ifFalse: "disabled",
        ),
      )
      ..add(EnumProperty<TouchTargetFit>("fit", fit))
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

class RenderPaddedTouchTarget extends RenderShiftedBox
    with TouchClientRenderObjectRequiredMixin, _RenderDefaultTouchTargetMixin
    implements RenderPadding {
  RenderPaddedTouchTarget({
    required TouchGroupRegistry registry,
    required this._enabled,
    required this._fit,
    required this._padding,
    this._textDirection,
    RenderBox? child,
  }) : super(child) {
    this.registry = registry;
  }

  @override
  bool _enabled;

  @override
  TouchTargetFit _fit;

  EdgeInsetsGeometry _padding;

  /// The amount to pad the child in each dimension.
  ///
  /// If this is set to an [EdgeInsetsDirectional] object, then [textDirection]
  /// must not be null.
  @override
  EdgeInsetsGeometry get padding => _padding;

  @override
  set padding(EdgeInsetsGeometry value) {
    assert(value.isNonNegative);
    if (_padding == value) return;
    _padding = value;
    _markNeedsResolution();
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
    _markNeedsResolution();
  }

  EdgeInsets? _resolvedPaddingCache;

  EdgeInsets get _resolvedPadding {
    final result = _resolvedPaddingCache ??= padding.resolve(textDirection);
    assert(result.isNonNegative);
    return result;
  }

  void _markNeedsResolution() {
    _resolvedPaddingCache = null;
    markNeedsLayout();
  }

  // TODO: investigate if layout logic should match RenderPadding

  @override
  Rect _getLocalRect() {
    if (!enabled) return Offset.zero & size;
    switch (fit) {
      case .wrap:
        return Offset.zero & size;
      case .overflow:
        final padding = _resolvedPadding;
        return .fromLTRB(
          -padding.left,
          -padding.top,
          size.width + padding.right,
          size.height + padding.bottom,
        );
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      final childWidth = child.getMinIntrinsicWidth(height);
      if (!enabled) return childWidth;
      switch (fit) {
        case .wrap:
          final padding = _resolvedPadding;
          return childWidth + padding.horizontal;
        case .overflow:
          return childWidth;
      }
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      final childWidth = child.getMaxIntrinsicWidth(height);
      if (!enabled) return childWidth;
      switch (fit) {
        case .wrap:
          final padding = _resolvedPadding;
          return childWidth + padding.horizontal;
        case .overflow:
          return childWidth;
      }
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      final childHeight = child.getMinIntrinsicHeight(width);
      if (!enabled) return childHeight;
      switch (fit) {
        case .wrap:
          final padding = _resolvedPadding;
          return childHeight + padding.vertical;
        case .overflow:
          return childHeight;
      }
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      final childHeight = child.getMaxIntrinsicHeight(width);
      if (!enabled) return childHeight;
      switch (fit) {
        case .wrap:
          final padding = _resolvedPadding;
          return childHeight + padding.vertical;
        case .overflow:
          return childHeight;
      }
    }
    return 0.0;
  }

  Size _computeLayout(BoxConstraints constraints, ChildLayouter layoutChild) {
    if (child case final child?) {
      final chilSize = layoutChild(child, constraints);
      if (enabled) {
        switch (fit) {
          case .wrap:
            final padding = _resolvedPadding;
            final width = chilSize.width + padding.horizontal;
            final height = chilSize.height + padding.vertical;
            return constraints.constrain(Size(width, height));
          case .overflow:
            return chilSize;
        }
      }
      return chilSize;
    }
    return .zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    if (child case final child?) {
      final childParentData = child.parentData! as BoxParentData;
      if (enabled) {
        switch (fit) {
          case .wrap:
            child.layout(constraints, parentUsesSize: true);
            final padding = _resolvedPadding;
            final width = child.size.width + padding.horizontal;
            final height = child.size.height + padding.vertical;
            size = constraints.constrain(Size(width, height));
            childParentData.offset = Offset(padding.left, padding.top);
          case .overflow:
            child.layout(constraints, parentUsesSize: true);
            size = child.size;
            childParentData.offset = .zero;
        }
      } else {
        child.layout(constraints, parentUsesSize: true);
        size = child.size;
        childParentData.offset = .zero;
      }
    } else {
      size = constraints.constrain(.zero);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        FlagProperty(
          "enabled",
          value: enabled,
          ifTrue: "enabled",
          ifFalse: "disabled",
        ),
      )
      ..add(EnumProperty<TouchTargetFit>("fit", fit))
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
