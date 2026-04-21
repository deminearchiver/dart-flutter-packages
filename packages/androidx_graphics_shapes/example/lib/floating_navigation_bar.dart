import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter/rendering.dart' as flutter;

/// Singature for a function that takes a [RenderBox] and specifies the child's
/// origin relative to the parent origin.
typedef _ChildPositioner = void Function(RenderBox child, Offset position);

/// A collection of static functions to layout a [RenderBox] child with the
/// given set of [BoxConstraints].
///
/// All of the functions adhere to the [ChildLayouter] signature.
abstract final class _ChildLayoutHelper {
  /// Returns the [Size] that the [RenderBox] would have if it were to
  /// be laid out with the given [BoxConstraints].
  ///
  /// This method calls [RenderBox.getDryLayout] on the given [RenderBox].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [layoutChild], which actually lays out the child with the given
  ///    constraints.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size dryLayoutChild(RenderBox child, BoxConstraints constraints) =>
      child.getDryLayout(constraints);

  /// Lays out the [RenderBox] with the given constraints and returns its
  /// [Size].
  ///
  /// This method calls [RenderBox.layout] on the given [RenderBox] with
  /// `parentUsesSize` set to true to receive its [Size].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [dryLayoutChild], which does not perform a real layout of the child.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size layoutChild(RenderBox child, BoxConstraints constraints) {
    child.layout(constraints, parentUsesSize: true);
    return child.size;
  }

  /// Convenience function that calls [RenderBox.getDryBaseline].
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getDryBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => child.getDryBaseline(constraints, baseline);

  /// Convenience function that calls [RenderBox.getDistanceToBaseline].
  ///
  /// The given `child` must be already laid out with `constraints`.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    assert(!child.debugNeedsLayout);
    assert(child.constraints == constraints);
    return child.getDistanceToBaseline(baseline, onlyReal: true);
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void dryPositionChild(RenderBox child, Offset position) {
    // Do nothing. Inlining should get rid of the function call.
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void positionChild(RenderBox child, Offset position) {
    assert(child.parentData != null && child.parentData! is BoxParentData);
    (child.parentData! as BoxParentData).offset = position;
  }
}

// P.S. - Thanks to [ButtonStyleButton] authors.

/// Redirect taps that occur in the padded area around the child to the center
/// of the child. This increases the size of the button and the button's
/// "tap target", but not its material or its ink splashes.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({super.child, required this.minTapTargetSize});

  final Size minTapTargetSize;

  @override
  _RenderInputPadding createRenderObject(BuildContext context) =>
      _RenderInputPadding(minTapTargetSize: minTapTargetSize);

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderInputPadding renderObject,
  ) {
    renderObject.minTapTargetSize = minTapTargetSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding({required Size minTapTargetSize, RenderBox? child})
    : _minTapTargetSize = minTapTargetSize,
      super(child);

  Size _minTapTargetSize;

  Size get minTapTargetSize => _minTapTargetSize;

  set minTapTargetSize(Size value) {
    if (_minTapTargetSize == value) return;
    _minTapTargetSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      return math.max(
        child.getMinIntrinsicWidth(height),
        minTapTargetSize.width,
      );
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      return math.max(
        child.getMinIntrinsicHeight(width),
        minTapTargetSize.height,
      );
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      return math.max(
        child.getMaxIntrinsicWidth(height),
        minTapTargetSize.width,
      );
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      return math.max(
        child.getMaxIntrinsicHeight(width),
        minTapTargetSize.height,
      );
    }
    return 0.0;
  }

  Size _layout({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
    required _ChildPositioner positionChild,
  }) {
    if (child case final child?) {
      final childSize = layoutChild(child, constraints);
      final size = constraints.constrain(
        Size(
          math.max(childSize.width, minTapTargetSize.width),
          math.max(childSize.height, minTapTargetSize.height),
        ),
      );

      final offset = Alignment.center.alongOffset(size - childSize as Offset);
      positionChild(child, offset);

      return size;
    }
    return .zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) => _layout(
    constraints: constraints,
    layoutChild: _ChildLayoutHelper.dryLayoutChild,
    positionChild: _ChildLayoutHelper.dryPositionChild,
  );

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final child = this.child;
    if (child == null) return null;
    final result = child.getDryBaseline(constraints, baseline);
    if (result == null) return null;
    final childSize = child.getDryLayout(constraints);
    return result +
        Alignment.center
            .alongOffset(getDryLayout(constraints) - childSize as Offset)
            .dy;
  }

  @override
  void performLayout() {
    size = _layout(
      constraints: constraints,
      layoutChild: _ChildLayoutHelper.layoutChild,
      positionChild: _ChildLayoutHelper.positionChild,
    );
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) return true;
    if (child case final child?) {
      final center = child.size.center(Offset.zero);
      return result.addWithRawTransform(
        transform: MatrixUtils.forceToPoint(center),
        position: center,
        hitTest: (result, position) {
          assert(position == center);
          return child.hitTest(result, position: center);
        },
      );
    }
    return false;
  }
}

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
class _Padding extends SingleChildRenderObjectWidget
    implements flutter.Padding {
  /// Creates a widget that insets its child.
  const _Padding({super.key, required this.padding, super.child});

  /// The amount of space by which to inset the child.
  @override
  final EdgeInsetsGeometry padding;

  @override
  _RenderPadding createRenderObject(BuildContext context) => _RenderPadding(
    padding: padding,
    textDirection: Directionality.maybeOf(context),
  );

  @override
  void updateRenderObject(BuildContext context, _RenderPadding renderObject) {
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
class _RenderPadding extends RenderShiftedBox implements flutter.RenderPadding {
  /// Creates a render object that insets its child.
  _RenderPadding({
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
    required _ChildPositioner positionChild,
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
    layoutChild: _ChildLayoutHelper.dryLayoutChild,
    positionChild: _ChildLayoutHelper.dryPositionChild,
  );

  @override
  void performLayout() {
    size = _layout(
      constraints: constraints,
      layoutChild: _ChildLayoutHelper.layoutChild,
      positionChild: _ChildLayoutHelper.positionChild,
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

extension type const FloatingNavigationBarDestination._(
  ({Widget icon, Widget label, String? tooltip}) _
)
    implements Object {
  const FloatingNavigationBarDestination({
    required Widget icon,
    required Widget label,
    String? tooltip,
  }) : this._((icon: icon, label: label, tooltip: tooltip));

  Widget get icon => _.icon;

  Widget get label => _.label;

  String? get tooltip => _.tooltip;
}

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({
    super.key,
    required this.onSelectedIndexChanged,
    required this.selectedIndex,
    required this.destinations,
  }) : assert(selectedIndex >= 0 && selectedIndex < destinations.length),
       assert(destinations.length > 1);

  final ValueChanged<int> onSelectedIndexChanged;
  final int selectedIndex;
  final List<FloatingNavigationBarDestination> destinations;

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return SizedBox(
      height: 64.0,
      child: Material(
        animationDuration: .zero,
        clipBehavior: .antiAlias,
        shape: const StadiumBorder(),
        color: colorScheme.surfaceContainerHighest,
        elevation: 6.0,
        shadowColor: colorScheme.shadow,
        child: _Padding(
          padding: const .all(12.0 - 4.0),
          child: Row(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 12.0 - 4.0 - 4.0,
            children: widget.destinations
                .mapIndexed(
                  (index, destination) => _FloatingNavigationBarDestination(
                    isSelected: index == widget.selectedIndex,
                    onTap: () => widget.onSelectedIndexChanged(index),
                    icon: destination.icon,
                    label: destination.label,
                    unselectedTooltip: destination.tooltip,
                  ),
                )
                .toList(growable: false),
          ),
        ),
      ),
    );
  }
}

class _FloatingNavigationBarDestination extends StatefulWidget {
  const _FloatingNavigationBarDestination({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.label,
    this.unselectedTooltip,
    this.selectedTooltip,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;
  final Widget label;
  final String? unselectedTooltip;
  final String? selectedTooltip;

  @override
  State<_FloatingNavigationBarDestination> createState() =>
      _FloatingNavigationBarDestinationState();
}

class _FloatingNavigationBarDestinationState
    extends State<_FloatingNavigationBarDestination>
    with TickerProviderStateMixin {
  late AnimationController _spatialController;
  late AnimationController _effectsController;

  final Tween<double> _widthFactorTween = Tween<double>();
  late Animation<double> _widthFactorAnimation;

  final Tween<EdgeInsetsGeometry?> _paddingTween = EdgeInsetsGeometryTween();
  late Animation<EdgeInsetsGeometry?> _paddingAnimation;

  final Tween<double> _iconLabelSpaceTween = Tween<double>();
  late Animation<double> _iconLabelSpaceAnimation;

  final Tween<Color?> _containerColorTween = ColorTween();
  late Animation<Color?> _containerColorAnimation;

  final Tween<IconThemeData?> _iconThemeTween = _IconThemeDataTween();
  late Animation<IconThemeData?> _iconThemeAnimation;

  final Tween<TextStyle?> _labelTextStyleTween = _TextStyleTween();
  late Animation<TextStyle?> _labelTextStyleAnimation;

  void _updateEffectsAnimations({
    required IconThemeData iconTheme,
    required TextStyle labelTextStyle,
  }) {
    if (iconTheme == _iconThemeTween.end &&
        labelTextStyle == _labelTextStyleTween.end) {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _spatialController = AnimationController.unbounded(vsync: this, value: 1.0);
    _effectsController = AnimationController(vsync: this, value: 1.0);

    _widthFactorAnimation = _widthFactorTween.animate(_spatialController);
    _paddingAnimation = _paddingTween.animate(_spatialController);
    _iconLabelSpaceAnimation = _iconLabelSpaceTween.animate(_spatialController);
  }

  @override
  void didUpdateWidget(covariant _FloatingNavigationBarDestination oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _effectsController.dispose();
    _spatialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;

    final textDirection = Directionality.maybeOf(context);
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final defaultIconTheme = IconTheme.of(context);

    final widthFactor = isSelected ? 1.0 : 0.0;
    final EdgeInsets padding = widget.isSelected
        ? const .symmetric(horizontal: 16.0, vertical: 8.0)
        : const .symmetric(horizontal: 8.0, vertical: 8.0);

    final containerColor = isSelected
        ? colorScheme.secondaryContainer
        : colorScheme.secondaryContainer.withValues(alpha: 0.0);
    final contentColor = isSelected
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurfaceVariant;

    _widthFactorTween.begin ??= widthFactor;
    _widthFactorTween.end ??= widthFactor;
    _widthFactorTween.begin = _widthFactorAnimation.value;
    _widthFactorTween.end = widthFactor;

    _paddingTween.begin ??= padding;
    _paddingTween.end ??= padding;
    _paddingTween.begin = _paddingAnimation.value;
    _paddingTween.end = padding;

    unawaited(
      _spatialController.animateWith(
        SpringSimulation(
          _kSpringExpressiveDefaultSpatial,
          0.0,
          1.0,
          0.0,
          snapToEnd: true,
        ),
      ),
    );

    const minTapTargetSize = 48.0;
    const containerSize = 40.0;

    return Tooltip(
      message:
          (isSelected ? widget.selectedTooltip : widget.unselectedTooltip) ??
          "",
      child: RepaintBoundary(
        child: Semantics(
          container: true,
          button: true,
          enabled: true,
          child: _InputPadding(
            minTapTargetSize: const .square(minTapTargetSize),
            child: _Padding(
              padding: const .all((minTapTargetSize - containerSize) / 2.0),
              child: SizedBox(
                height: containerSize,
                child: AnimatedBuilder(
                  animation: _effectsController,
                  builder: (context, child) => Material(
                    animationDuration: .zero,
                    clipBehavior: .antiAlias,
                    shape: const StadiumBorder(),
                    color: containerColor,
                    elevation: 0.0,
                    shadowColor: colorScheme.shadow,
                    child: InkWell(onTap: widget.onTap, child: child),
                  ),
                  child: Center(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: DefaultTextStyle(
                      style: textTheme.labelMedium!.copyWith(
                        fontWeight: isSelected ? .w600 : .w500,
                        color: contentColor,
                      ),
                      child: IconTheme.merge(
                        data: IconThemeData(
                          opticalSize: 24.0,
                          fill: isSelected ? 1.0 : 0.0,
                          size: 24.0,
                          color: contentColor,
                        ),
                        child: AnimatedBuilder(
                          animation: _spatialController,
                          builder: (context, child) => _Padding(
                            padding: _paddingAnimation.value!.resolve(
                              textDirection,
                            ),
                            child: child,
                          ),
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              widget.icon,
                              AnimatedBuilder(
                                animation: _spatialController,
                                builder: (context, child) => Visibility(
                                  visible: _widthFactorAnimation.value > 0.0,
                                  child: Opacity(
                                    opacity: clampDouble(
                                      _widthFactorAnimation.value,
                                      0.0,
                                      1.0,
                                    ),
                                    child: Align(
                                      alignment: .centerStart,
                                      widthFactor: math.max(
                                        0.0,
                                        _widthFactorAnimation.value,
                                      ),
                                      child: _Padding(
                                        padding: const .directional(start: 4.0),
                                        child: child,
                                      ),
                                    ),
                                  ),
                                ),
                                child: widget.label,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconThemeDataTween extends Tween<IconThemeData?> {
  _IconThemeDataTween({super.begin, super.end});

  @override
  IconThemeData? lerp(double t) => IconThemeData.lerp(begin, end, t);
}

class _TextStyleTween extends Tween<TextStyle?> {
  _TextStyleTween({super.begin, super.end});

  @override
  TextStyle? lerp(double t) => TextStyle.lerp(begin, end, t);
}

final _kSpringExpressiveFastSpatial = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 800.0,
  ratio: 0.6,
);
final _kSpringExpressiveDefaultSpatial = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 380.0,
  ratio: 0.8,
);
final _kSpringExpressiveSlowSpatial = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 200.0,
  ratio: 0.8,
);

final _kSpringExpressiveFastEffects = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 800.0,
  ratio: 1.0,
);

final _kSpringExpressiveDefaultEffects = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 1600.0,
  ratio: 1.0,
);

final _kSpringExpressiveSlowEffects = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: 800.0,
  ratio: 1.0,
);
