import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

@immutable
abstract class ProxyShapeBorder extends ShapeBorder {
  const ProxyShapeBorder(this.shape);

  final ShapeBorder shape;

  @override
  EdgeInsetsGeometry get dimensions => shape.dimensions;

  ProxyShapeBorder copyWith({ShapeBorder? shape});

  @override
  ProxyShapeBorder scale(double t);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      shape.getOuterPath(rect, textDirection: textDirection);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      shape.getInnerPath(rect, textDirection: textDirection);

  @override
  bool get preferPaintInterior => shape.preferPaintInterior;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    shape.paintInterior(canvas, rect, paint, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    shape.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a == null) return scale(t);
    return null;
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b == null) return scale(1.0 - t);
    return null;
  }

  @override
  String toString() => "${objectRuntimeType(this, "ProxyShapeBorder")}($shape)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ProxyShapeBorder &&
          shape == other.shape;

  @override
  int get hashCode => shape.hashCode;
}

@immutable
abstract class ProxyOutlinedBorder extends ProxyShapeBorder
    implements OutlinedBorder {
  const ProxyOutlinedBorder(super.shape);

  @override
  BorderSide get side => switch (shape) {
    OutlinedBorder(:final side) => side,
    _ => .none,
  };

  @override
  EdgeInsetsGeometry get dimensions => shape.dimensions;

  @override
  ProxyOutlinedBorder copyWith({BorderSide? side, ShapeBorder? shape});

  @override
  ProxyOutlinedBorder scale(double t);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      shape.getOuterPath(rect, textDirection: textDirection);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      shape.getInnerPath(rect, textDirection: textDirection);

  @override
  bool get preferPaintInterior => shape.preferPaintInterior;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    shape.paintInterior(canvas, rect, paint, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    shape.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  String toString() =>
      "${objectRuntimeType(this, "ProxyOutlinedBorder")}($shape)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ProxyOutlinedBorder &&
          shape == other.shape;

  @override
  int get hashCode => shape.hashCode;
}
