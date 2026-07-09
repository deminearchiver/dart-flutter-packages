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
    if (!enabled) {
      return size.contains(position) &&
          hitTestChildren(result, position: position);
    }
    return super.hitTest(result, position: position);
  }

  // static bool _debugAssertCanHitTest(RenderBox box) {
  //   assert(() {
  //     if (!box.hasSize) {
  //       if (box.debugNeedsLayout) {
  //         throw FlutterError.fromParts([
  //           ErrorSummary(
  //             "Cannot hit test a render box that has never been laid out.",
  //           ),
  //           box.describeForError(
  //             "The hitTest() method was called on this RenderBox",
  //           ),
  //           ErrorDescription(
  //             "Unfortunately, this object's geometry is not known at this time, "
  //             "probably because it has never been laid out. "
  //             "This means it cannot be accurately hit-tested.",
  //           ),
  //           ErrorHint(
  //             "If you are trying "
  //             "to perform a hit test during the layout phase itself, make sure "
  //             "you only hit test nodes that have completed layout (e.g. the node's "
  //             "children, after their layout() method has been called).",
  //           ),
  //         ]);
  //       }
  //       throw FlutterError.fromParts([
  //         ErrorSummary("Cannot hit test a render box with no size."),
  //         box.describeForError(
  //           "The hitTest() method was called on this RenderBox",
  //         ),
  //         ErrorDescription(
  //           "Although this node is not marked as needing layout, "
  //           "its size is not set.",
  //         ),
  //         ErrorHint(
  //           "A RenderBox object must have an "
  //           "explicit size before it can be hit-tested. Make sure "
  //           "that the RenderBox in question sets its size during layout.",
  //         ),
  //       ]);
  //     }
  //     return true;
  //   }());
  //   return true;
  // }
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
  bool containsIn(RenderBox ancestor, Offset position) {
    final transform = _renderObject.getTransformTo(ancestor);
    final inverse = Matrix4.tryInvert(transform);
    if (inverse == null) return false;
    final localPosition = MatrixUtils.transformPoint(inverse, position);
    return _renderObject._getLocalRect().contains(localPosition);
  }

  @override
  bool dryHitTestFrom(RenderBox ancestor) {
    final child = _renderObject.child;
    if (child == null) return false;

    final childParentData = child.parentData as BoxParentData?;
    final childOffset = childParentData?.offset ?? .zero;
    final childCenter = child.size.center(Offset.zero);
    final centerInLocal = childOffset + childCenter;

    final transform = _renderObject.getTransformTo(ancestor);
    final centerInAncestor = MatrixUtils.transformPoint(
      transform,
      centerInLocal,
    );

    final result = BoxHitTestResult();
    ancestor.hitTest(result, position: centerInAncestor);
    for (final HitTestEntry(:target) in result.path) {
      if (target is RenderObject && (hasOwn(target) || hasDescendant(target))) {
        return true;
      }
    }
    return false;
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
    final child = _renderObject.child;
    if (child == null) return false;

    final transform = _renderObject.getTransformTo(ancestor);
    final childCenter = child.size.center(Offset.zero);

    final isHit = result.addWithPaintTransform(
      transform: transform,
      position: position,
      hitTest: (result, localPosition) {
        final offset = localPosition - childCenter;
        return result.addWithRawTransform(
          transform: .translationValues(offset.dx, offset.dy, 0.0),
          position: childCenter,
          hitTest: (result, position) {
            assert(position == localPosition);
            return child.hitTest(result, position: childCenter);
          },
        );
      },
    );
    if (isHit) {
      result.add(BoxHitTestEntry(_renderObject, position));
    }
    return isHit;
  }

  @override
  bool hasOwn(RenderObject renderObject) => renderObject == _renderObject;

  @override
  bool hasDescendant(RenderObject renderObject) {
    if (renderObject == _renderObject) return false;
    if (renderObject.depth <= _renderObject.depth) return false;
    var current = renderObject.parent;
    while (current != null) {
      if (current == _renderObject) return true;
      if (current.depth < _renderObject.depth) break;
      current = current.parent;
    }
    return false;
  }

  @override
  bool hasAncestor(RenderObject renderObject) {
    if (renderObject == _renderObject) return false;
    if (renderObject.depth >= _renderObject.depth) return false;
    var current = _renderObject.parent;
    while (current != null) {
      if (current == renderObject) return true;
      if (current.depth < renderObject.depth) break;
      current = current.parent;
    }
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
    required this.minimumSize,
    this.alignment = .center,
    this.textDirection,
    required Widget super.child,
  });

  final TouchGroupRegistry? registry;
  final bool enabled;
  final Size minimumSize;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;

  @override
  RenderSizedTouchTarget createRenderObject(BuildContext context) =>
      RenderSizedTouchTarget(
        registry: registry ?? TouchGroup.of(context),
        enabled: enabled,
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
    required this._minimumSize,
    this._alignment = .center,
    this._textDirection,
    RenderBox? child,
  }) : super(child) {
    this.registry = registry;
  }

  @override
  bool _enabled;

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

    final alignment = _resolvedAlignment;

    final targetWidth = math.max(size.width, minimumSize.width);
    final targetHeight = math.max(size.height, minimumSize.height);

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

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      return child.getMinIntrinsicWidth(height);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      return child.getMaxIntrinsicWidth(height);
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      return child.getMinIntrinsicHeight(width);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      return child.getMaxIntrinsicHeight(width);
    }
    return 0.0;
  }

  Size _computeLayout(BoxConstraints constraints, ChildLayouter layoutChild) {
    if (child case final child?) {
      return layoutChild(child, constraints);
    }
    return .zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    if (child case final child?) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;
      (child.parentData! as BoxParentData).offset = .zero;
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
    this.padding = .zero,
    this.textDirection,
    required Widget super.child,
  });

  final TouchGroupRegistry? registry;

  final bool enabled;

  final EdgeInsetsGeometry padding;

  final TextDirection? textDirection;

  @override
  RenderPaddedTouchTarget createRenderObject(BuildContext context) =>
      RenderPaddedTouchTarget(
        registry: registry ?? TouchGroup.of(context),
        enabled: enabled,
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
    required this._padding,
    this._textDirection,
    RenderBox? child,
  }) : super(child) {
    this.registry = registry;
  }

  @override
  bool _enabled;

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

    final padding = _resolvedPadding;

    return .fromLTRB(
      -padding.left,
      -padding.top,
      size.width + padding.right,
      size.height + padding.bottom,
    );
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      return child.getMinIntrinsicWidth(height);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      return child.getMaxIntrinsicWidth(height);
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      return child.getMinIntrinsicHeight(width);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      return child.getMaxIntrinsicHeight(width);
    }
    return 0.0;
  }

  Size _computeLayout(BoxConstraints constraints, ChildLayouter layoutChild) {
    if (child case final child?) {
      return layoutChild(child, constraints);
    }
    return .zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    if (child case final child?) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;
      (child.parentData! as BoxParentData).offset = .zero;
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
