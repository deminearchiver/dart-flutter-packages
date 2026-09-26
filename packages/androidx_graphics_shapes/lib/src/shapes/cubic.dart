// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// @docImport 'morph.dart';
/// @docImport 'rounded_polygon.dart';
library;

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix4;

import 'point.dart';
import 'utils.dart';

/// A single cubic Bézier curve.
///
/// The curve runs from [anchor0] to [anchor1], and the control points
/// [control0] and [control1] determine its slope at either end.
@immutable
class CubicBezier {
  /// Creates a cubic Bézier curve running from [anchor0] to [anchor1], with
  /// [control0] and [control1] determining its slope at either end.
  new(Offset anchor0, Offset control0, Offset control1, Offset anchor1)
    : this.raw(
        anchor0.x,
        anchor0.y,
        control0.x,
        control0.y,
        control1.x,
        control1.y,
        anchor1.x,
        anchor1.y,
      );

  /// Creates a [CubicBezier] directly from its eight anchor and control point
  /// coordinates.
  @internal
  const new raw(
    this.anchor0X,
    this.anchor0Y,
    this.control0X,
    this.control0Y,
    this.control1X,
    this.control1Y,
    this.anchor1X,
    this.anchor1Y,
  );

  /// Generates a bezier curve that is a straight line between the given anchor
  /// points [p0] and [p1]. The control points lie 1/3 of the distance from
  /// their respective anchor points.
  factory straightLine(Offset p0, Offset p1) => .raw(
    p0.x,
    p0.y,
    lerp(p0.x, p1.x, 1.0 / 3.0),
    lerp(p0.y, p1.y, 1.0 / 3.0),
    lerp(p0.x, p1.x, 2.0 / 3.0),
    lerp(p0.y, p1.y, 2.0 / 3.0),
    p1.x,
    p1.y,
  );

  /// Generates a bezier curve that approximates a circular arc around [center],
  /// with [p0] and [p1] as the starting and ending anchor points. The curve
  /// generated is the smallest of the two possible arcs around the entire
  /// 360-degree circle. Arcs of greater than 180 degrees should use more than
  /// one arc together. Note that [p0] and [p1] should be equidistant from
  /// [center].
  factory circularArc(Offset center, Offset p0, Offset p1) {
    final p0FromCenter = p0 - center;
    final p1FromCenter = p1 - center;
    final p0d = p0FromCenter.unitVector;
    final p1d = p1FromCenter.unitVector;
    final rotatedP0 = p0d.rotate90();
    final rotatedP1 = p1d.rotate90();
    final clockwise = rotatedP0.dotProduct(p1FromCenter) >= 0.0;
    final cosa = p0d.dotProduct(p1d);

    // p0 ~= p1
    if (cosa > 0.999) {
      return .straightLine(p0, p1);
    }

    final k =
        p0FromCenter.distance *
        4.0 /
        3.0 *
        (math.sqrt(2.0 * (1.0 - cosa)) - math.sqrt(1.0 - cosa * cosa)) /
        (1.0 - cosa) *
        (clockwise ? 1.0 : -1.0);

    return .raw(
      p0.x,
      p0.y,
      p0.x + rotatedP0.x * k,
      p0.y + rotatedP0.y * k,
      p1.x - rotatedP1.x * k,
      p1.y - rotatedP1.y * k,
      p1.x,
      p1.y,
    );
  }

  /// Generates a zero-length [CubicBezier] at [point].
  ///
  /// Both anchor points and both control points coincide, so the curve has
  /// zero length. See [isZeroLength].
  new point(Offset point)
    : this.raw(
        point.x,
        point.y,
        point.x,
        point.y,
        point.x,
        point.y,
        point.x,
        point.y,
      );

  /// The eight coordinates of this curve as a flat, unmodifiable list, ordered
  /// as anchor0, control0, control1, anchor1.
  ///
  /// Equivalent to reading [anchor0X] through [anchor1Y] in order, and more
  /// convenient when serializing a curve or handing its coordinates to code
  /// that expects a coordinate buffer.
  ///
  /// A new list is created on every access. Prefer the individual coordinate
  /// fields when reading single values.
  List<double> get points => .unmodifiableOf([
    anchor0X,
    anchor0Y,
    control0X,
    control0Y,
    control1X,
    control1Y,
    anchor1X,
    anchor1Y,
  ]);

  /// The anchor point at the start of the curve.
  Offset get anchor0 => .new(anchor0X, anchor0Y);

  /// The control point closest to [anchor0].
  Offset get control0 => .new(control0X, control0Y);

  /// The control point closest to [anchor1].
  Offset get control1 => .new(control1X, control1Y);

  /// The anchor point at the end of the curve.
  Offset get anchor1 => .new(anchor1X, anchor1Y);

  /// The X coordinate of the anchor point at the start of the curve.
  final double anchor0X;

  /// The Y coordinate of the anchor point at the start of the curve.
  final double anchor0Y;

  /// The X coordinate of the control point closest to [anchor0].
  final double control0X;

  /// The Y coordinate of the control point closest to [anchor0].
  final double control0Y;

  /// The X coordinate of the control point closest to [anchor1].
  final double control1X;

  /// The Y coordinate of the control point closest to [anchor1].
  final double control1Y;

  /// The X coordinate of the anchor point at the end of the curve.
  final double anchor1X;

  /// The Y coordinate of the anchor point at the end of the curve.
  final double anchor1Y;

  /// Returns the point on this curve at [t], the proportional distance along
  /// the curve from [anchor0] at 0 to [anchor1] at 1.
  Offset pointAt(double t) {
    final u = 1.0 - t;
    final uSq = u * u;
    final tSq = t * t;
    final threeUT = 3.0 * u * t;
    final uCb = uSq * u;
    final tCb = tSq * t;
    final threeTUSq = threeUT * u;
    final threeUTSq = threeUT * t;
    return .new(
      anchor0X * uCb +
          control0X * threeTUSq +
          control1X * threeUTSq +
          anchor1X * tCb,
      anchor0Y * uCb +
          control0Y * threeTUSq +
          control1Y * threeUTSq +
          anchor1Y * tCb,
    );
  }

  /// The X coordinate of the point on this curve at [t]. See [pointAt].
  double pointAtX(double t) {
    final u = 1.0 - t;
    final threeUT = 3.0 * u * t;
    return anchor0X * (u * u * u) +
        control0X * (threeUT * u) +
        control1X * (threeUT * t) +
        anchor1X * (t * t * t);
  }

  /// The Y coordinate of the point on this curve at [t]. See [pointAt].
  double pointAtY(double t) {
    final u = 1.0 - t;
    final threeUT = 3.0 * u * t;
    return anchor0Y * (u * u * u) +
        control0Y * (threeUT * u) +
        control1Y * (threeUT * t) +
        anchor1Y * (t * t * t);
  }

  /// Whether this curve's two anchor points coincide, and so the curve
  /// contributes nothing to an outline.
  ///
  /// Coincidence is measured with a small tolerance rather than exactly, so a
  /// curve whose anchors differ only by rounding error still counts as zero
  /// length. Note that the control points are not considered.
  bool get isZeroLength =>
      (anchor0X - anchor1X).abs() < distanceEpsilon &&
      (anchor0Y - anchor1Y).abs() < distanceEpsilon;

  /// Whether the corner formed by this curve and [next] turns convexly.
  @internal
  bool convexTo(CubicBezier next) => convex(anchor0, anchor1, next.anchor1);

  bool _zeroIsh(double value) => value.abs() < distanceEpsilon;

  /// The axis-aligned bounding box of this curve.
  ///
  /// This solves for the curve's actual extrema. See [approximateBounds] for a
  /// cheaper result that is never smaller than this one.
  Rect get bounds => _calculateBounds(approximate: false);

  /// A cheaper alternative to [bounds], which bounds the two anchor points and
  /// the two control points rather than solving for the curve's actual
  /// extrema.
  ///
  /// The result is never smaller than [bounds], but can be larger.
  Rect get approximateBounds => _calculateBounds(approximate: true);

  Rect _calculateBounds({required bool approximate}) {
    // A curve might be of zero-length, with both anchors co-located.
    // Just return the point itself.
    if (isZeroLength) {
      return .fromLTRB(anchor0X, anchor0Y, anchor0X, anchor0Y);
    }

    var minX = math.min(anchor0X, anchor1X);
    var minY = math.min(anchor0Y, anchor1Y);
    var maxX = math.max(anchor0X, anchor1X);
    var maxY = math.max(anchor0Y, anchor1Y);

    if (approximate) {
      // Approximate bounds use the bounding box of all anchors and
      // controls.
      return .fromLTRB(
        math.min(minX, math.min(control0X, control1X)),
        math.min(minY, math.min(control0Y, control1Y)),
        math.max(maxX, math.max(control0X, control1X)),
        math.max(maxY, math.max(control0Y, control1Y)),
      );
    }

    // Find the derivative, which is a quadratic Bezier. Then we can solve
    // for t using the quadratic formula.
    final xa = -anchor0X + 3.0 * control0X - 3.0 * control1X + anchor1X;
    final xb = 2.0 * anchor0X - 4.0 * control0X + 2.0 * control1X;
    final xc = -anchor0X + control0X;

    if (_zeroIsh(xa)) {
      // Try Muller's method instead; it can find a single root when a is 0.
      if (xb != 0.0) {
        final t = 2.0 * xc / (-2.0 * xb);
        if (t >= 0.0 && t <= 1.0) {
          final x = pointAtX(t);
          if (x < minX) {
            minX = x;
          }
          if (x > maxX) {
            maxX = x;
          }
        }
      }
    } else {
      final xs = xb * xb - 4.0 * xa * xc;
      if (xs >= 0.0) {
        final sqrtXs = math.sqrt(xs);

        final t1 = (-xb + sqrtXs) / (2.0 * xa);
        if (t1 >= 0.0 && t1 <= 1.0) {
          final x = pointAtX(t1);
          if (x < minX) {
            minX = x;
          }
          if (x > maxX) {
            maxX = x;
          }
        }

        final t2 = (-xb - sqrtXs) / (2.0 * xa);
        if (t2 >= 0.0 && t2 <= 1.0) {
          final x = pointAtX(t2);
          if (x < minX) {
            minX = x;
          }
          if (x > maxX) {
            maxX = x;
          }
        }
      }
    }

    // Repeat the above for y coordinate
    final ya = -anchor0Y + 3.0 * control0Y - 3.0 * control1Y + anchor1Y;
    final yb = 2.0 * anchor0Y - 4.0 * control0Y + 2.0 * control1Y;
    final yc = -anchor0Y + control0Y;

    if (_zeroIsh(ya)) {
      if (yb != 0.0) {
        final t = 2.0 * yc / (-2.0 * yb);
        if (t >= 0.0 && t <= 1.0) {
          final y = pointAtY(t);
          if (y < minY) {
            minY = y;
          }
          if (y > maxY) {
            maxY = y;
          }
        }
      }
    } else {
      final ys = yb * yb - 4.0 * ya * yc;
      if (ys >= 0.0) {
        final sqrtYs = math.sqrt(ys);

        final t1 = (-yb + sqrtYs) / (2.0 * ya);
        if (t1 >= 0.0 && t1 <= 1.0) {
          final y = pointAtY(t1);
          if (y < minY) {
            minY = y;
          }
          if (y > maxY) {
            maxY = y;
          }
        }

        final t2 = (-yb - sqrtYs) / (2.0 * ya);
        if (t2 >= 0.0 && t2 <= 1.0) {
          final y = pointAtY(t2);
          if (y < minY) {
            minY = y;
          }
          if (y > maxY) {
            maxY = y;
          }
        }
      }
    }

    return .fromLTRB(minX, minY, maxX, maxY);
  }

  /// Returns two [CubicBezier]s, created by splitting this curve at the given
  /// distance of [t] between the original starting and ending anchor points.
  (CubicBezier, CubicBezier) split(double t) {
    final u = 1.0 - t;

    final p01X = anchor0X * u + control0X * t;
    final p01Y = anchor0Y * u + control0Y * t;

    final p12X = control0X * u + control1X * t;
    final p12Y = control0Y * u + control1Y * t;

    final p23X = control1X * u + anchor1X * t;
    final p23Y = control1Y * u + anchor1Y * t;

    final p012X = p01X * u + p12X * t;
    final p012Y = p01Y * u + p12Y * t;

    final p123X = p12X * u + p23X * t;
    final p123Y = p12Y * u + p23Y * t;

    final p0123X = p012X * u + p123X * t;
    final p0123Y = p012Y * u + p123Y * t;

    return (
      .raw(anchor0X, anchor0Y, p01X, p01Y, p012X, p012Y, p0123X, p0123Y),
      .raw(p0123X, p0123Y, p123X, p123Y, p23X, p23Y, anchor1X, anchor1Y),
    );
  }

  /// This curve with its control and anchor points in reverse order, so it
  /// runs from [anchor1] to [anchor0].
  CubicBezier get reversed => .raw(
    anchor1X,
    anchor1Y,
    control1X,
    control1Y,
    control0X,
    control0Y,
    anchor0X,
    anchor0Y,
  );

  /// Returns a curve whose coordinates are the sums of this curve's and [o]'s
  /// corresponding coordinates.
  CubicBezier operator +(CubicBezier o) => .raw(
    anchor0X + o.anchor0X,
    anchor0Y + o.anchor0Y,
    control0X + o.control0X,
    control0Y + o.control0Y,
    control1X + o.control1X,
    control1Y + o.control1Y,
    anchor1X + o.anchor1X,
    anchor1Y + o.anchor1Y,
  );

  /// Returns a curve whose coordinates are this curve's multiplied by [x].
  CubicBezier operator *(double x) => .raw(
    anchor0X * x,
    anchor0Y * x,
    control0X * x,
    control0Y * x,
    control1X * x,
    control1Y * x,
    anchor1X * x,
    anchor1Y * x,
  );

  /// Returns a curve whose coordinates are this curve's divided by [x].
  CubicBezier operator /(double x) => this * (1.0 / x);

  /// Returns a copy of this curve with [transformer] applied to each of its
  /// anchor and control points.
  CubicBezier transformed(PointTransformer transformer) {
    final (a0X, a0Y) = transformer(anchor0X, anchor0Y);
    final (c0X, c0Y) = transformer(control0X, control0Y);
    final (c1X, c1Y) = transformer(control1X, control1Y);
    final (a1X, a1Y) = transformer(anchor1X, anchor1Y);
    return .raw(a0X, a0Y, c0X, c0Y, c1X, c1Y, a1X, a1Y);
  }

  @override
  String toString() =>
      "${objectRuntimeType(this, "CubicBezier")}"
      "(anchor0: (${anchor0X.toStringAsFixed(1)}, ${anchor0Y.toStringAsFixed(1)}), "
      "control0: (${control0X.toStringAsFixed(1)}, ${control0Y.toStringAsFixed(1)}), "
      "control1: (${control1X.toStringAsFixed(1)}, ${control1Y.toStringAsFixed(1)}), "
      "anchor1: (${anchor1X.toStringAsFixed(1)}, ${anchor1Y.toStringAsFixed(1)}))";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is CubicBezier &&
          anchor0X == other.anchor0X &&
          anchor0Y == other.anchor0Y &&
          control0X == other.control0X &&
          control0Y == other.control0Y &&
          control1X == other.control1X &&
          control1Y == other.control1Y &&
          anchor1X == other.anchor1X &&
          anchor1Y == other.anchor1Y;

  @override
  int get hashCode => Object.hash(
    anchor0X,
    anchor0Y,
    control0X,
    control0Y,
    control1X,
    control1Y,
    anchor1X,
    anchor1Y,
  );
}

/// Returns a [Path] built from the given [cubics].
///
/// This is the building block behind [RoundedPolygon.toPath] and
/// [Morph.toPath], and is useful when working with a list of curves obtained
/// from [Morph.toCubics] directly.
///
/// [startAngle] places the start point of the first curve at that angle, in
/// radians, around [rotationPivot], rotating the whole path to get it there.
/// Zero is to the right of the pivot and `pi / 2` below it, since y grows
/// downwards.
/// The default of zero is special: it skips the rotation entirely and leaves
/// the curves as given.
///
/// If [repeatPath] is true, the curves are added twice before the [Path] is
/// closed. This is useful when the caller would like to draw parts of the path
/// while offsetting the start and stop positions, for example when phasing and
/// rotating a path to simulate motion as a star-shaped circular progress
/// indicator advances.
///
/// If [closePath] is false, the returned [Path] is left open.
///
/// [rotationPivot] is the point [startAngle] rotates the path around, and the
/// point its angle is measured from. It defaults to the origin, which suits
/// curves laid out around [Offset.zero].
Path pathFromCubics(
  List<CubicBezier> cubics, {
  double startAngle = 0.0,
  bool repeatPath = false,
  bool closePath = true,
  Offset rotationPivot = .zero,
  Path? path,
}) {
  if (path != null) {
    path.reset();
  } else {
    path = Path();
  }

  if (cubics.isEmpty) return path;

  final firstCubic = cubics.first;
  path.moveTo(firstCubic.anchor0X, firstCubic.anchor0Y);

  for (final cubic in cubics) {
    path.cubicTo(
      cubic.control0X,
      cubic.control0Y,
      cubic.control1X,
      cubic.control1Y,
      cubic.anchor1X,
      cubic.anchor1Y,
    );
  }

  if (repeatPath) {
    path.lineTo(firstCubic.anchor0X, firstCubic.anchor0Y);
    for (final cubic in cubics) {
      path.cubicTo(
        cubic.control0X,
        cubic.control0Y,
        cubic.control1X,
        cubic.control1Y,
        cubic.anchor1X,
        cubic.anchor1Y,
      );
    }
  }

  if (closePath) path.close();

  if (startAngle != 0.0) {
    final angleToFirstCubic = math.atan2(
      firstCubic.anchor0Y - rotationPivot.dy,
      firstCubic.anchor0X - rotationPivot.dx,
    );
    // Rotate the path around the pivot so that it starts from the given angle.
    path = path.transform(
      (Matrix4.identity()
            ..translateByDouble(rotationPivot.dx, rotationPivot.dy, 0.0, 1.0)
            ..rotateZ(-angleToFirstCubic + startAngle)
            ..translateByDouble(-rotationPivot.dx, -rotationPivot.dy, 0.0, 1.0))
          .storage,
    );
  }

  return path;
}
