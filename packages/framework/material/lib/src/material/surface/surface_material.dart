import 'package:flutter/material.dart' as flutter;
import 'package:material/src/material/flutter.dart';

const ShapeBorder _kEmptyShape = _Border();

class _Border extends ShapeBorder {
  const _Border();

  @override
  EdgeInsetsGeometry get dimensions => .zero;

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRect(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRect(rect);

  @override
  bool get preferPaintInterior => true;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    canvas.drawRect(rect, paint);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is _Border) return a;
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is _Border) return this;
    return super.lerpTo(b, t);
  }

  @override
  String toString() => objectRuntimeType(this, "ShapeBorder");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Border;

  @override
  int get hashCode => runtimeType.hashCode;
}

class RawSurfaceMaterial extends StatelessWidget {
  const RawSurfaceMaterial({
    super.key,
    this.clipBehavior = .none,
    this.shape = _kEmptyShape,
    required this.child,
  });

  final Clip clipBehavior;

  final ShapeBorder shape;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final capturedTextStyle = DefaultTextStyle.of(context);
    return flutter.Material(
      animationDuration: .zero,
      animateColor: false,
      type: .transparency,
      clipBehavior: clipBehavior,
      borderOnForeground: false,
      borderRadius: null,
      shape: shape,
      color: null,
      elevation: 0.0,
      shadowColor: null,
      surfaceTintColor: Colors.transparent,
      textStyle: null,
      child: capturedTextStyle.wrap(context, child),
    );
  }

  /// The ink controller from the closest instance of this class that
  /// encloses the given context within the closest [LookupBoundary].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController? inkController = Material.maybeOf(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [RawSurfaceMaterial.of], which is similar to this method, but asserts if
  ///   no [RawSurfaceMaterial] ancestor is found.
  static MaterialInkController? maybeOf(BuildContext context) =>
      flutter.Material.maybeOf(context);

  /// The ink controller from the closest instance of [RawSurfaceMaterial] that
  /// encloses the given context within the closest [LookupBoundary].
  ///
  /// If no [RawSurfaceMaterial] widget ancestor can be found then this method will
  /// assert in debug mode, and throw an exception in release mode.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController inkController = Material.of(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [RawSurfaceMaterial.maybeOf], which is similar to this method, but returns
  ///   null if no [RawSurfaceMaterial] ancestor is found.
  static MaterialInkController of(BuildContext context) =>
      flutter.Material.of(context);
}
