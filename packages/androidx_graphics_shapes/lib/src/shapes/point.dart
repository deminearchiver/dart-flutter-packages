import 'dart:math' as math;

import 'package:meta/meta.dart';

import 'cubic.dart';
import 'utils.dart';

@internal
@immutable
extension type const Point._((double x, double y) _) {
  @internal
  const Point.fromRaw((double x, double y) value) : this._(value);

  const Point(double x, double y) : this.fromRaw((x, y));

  (double x, double y) get asRaw => _;

  double get x => _.$1;
  double get y => _.$2;

  Point copyWith({double? x, double? y}) =>
      x != null || y != null ? Point(x ?? this.x, y ?? this.y) : this;

  /// The magnitude of the Point, which is the distance of this point
  /// from (0, 0).
  ///
  /// If you need this value to compare it to another [Point]'s distance,
  /// consider using [distanceSquared] instead,
  /// since it is cheaper to compute.
  double get distance => math.sqrt(distanceSquared);

  /// The square of the magnitude (which is the distance of this point
  /// from (0, 0)) of the Point.
  ///
  /// This is cheaper than computing the [distance] itself.
  @pragma("vm:prefer-inline")
  double get distanceSquared => x * x + y * y;

  double dotProduct(Point other) => dotProductWith(other.x, other.y);

  @pragma("vm:prefer-inline")
  double dotProductWith(double otherX, double otherY) =>
      x * otherX + y * otherY;

  /// Compute the Z coordinate of the cross product of two vectors,
  /// to check if the second vector is going clockwise ( > 0 )
  /// or counterclockwise (< 0) compared with the first one. It could also be 0,
  /// if the vectors are co-linear.
  bool clockwise(Point other) => x * other.y - y * other.x >= 0.0;

  Point get direction {
    final d = distance;
    assert(d > 0.0, "Can't get the direction of a 0-length vector");
    return this / d;
  }

  Point transformed(PointTransformer f) => .fromRaw(f(x, y));

  Point operator -() => Point(-x, -y);

  Point operator -(Point other) => Point(x - other.x, y - other.y);

  Point operator +(Point other) => Point(x + other.x, y + other.y);

  Point operator *(double operand) => Point(x * operand, y * operand);

  Point operator /(double operand) => Point(x / operand, y / operand);

  Point operator %(double operand) => Point(x % operand, y % operand);

  static const zero = Point(0.0, 0.0);

  static Point interpolate(Point start, Point stop, double fraction) => Point(
    interpolateDouble(start.x, stop.x, fraction),
    interpolateDouble(start.y, stop.y, fraction),
  );
}
