import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart';

import '../shapes/shapes.dart';

@Deprecated("Use RoundedPolygonExtension instead.")
@internal
extension RoundedPolygonInternalExtension on RoundedPolygon {
  @Deprecated("Use RoundedPolygonExtension.transformedWithMatrix4 instead.")
  @internal
  RoundedPolygon transformedWithMatrix(Matrix4 matrix) =>
      transformedWithMatrix4(matrix);

  @Deprecated("Use RoundedPolygonExtension.toPath instead.")
  @internal
  Path toPathWith({
    Path? path,
    double startAngle = 270.0,
    bool repeatPath = false,
    bool closePath = true,
  }) => toPath(
    path: path,
    startAngle: startAngle,
    repeatPath: repeatPath,
    closePath: closePath,
  );
}

extension RoundedPolygonExtension on RoundedPolygon {
  // Matrix calculations inlined to avoid unnecessary memory allocation.

  RoundedPolygon _transformed2(Float64List matrix2) {
    final m00 = matrix2[0];
    final m10 = matrix2[1];
    final m01 = matrix2[2];
    final m11 = matrix2[3];
    return transformed((x, y) => (m00 * x + m01 * y, m10 * x + m11 * y));
  }

  RoundedPolygon _transformed3(Float64List matrix3) {
    final m00 = matrix3[0];
    final m10 = matrix3[1];
    final m01 = matrix3[3];
    final m11 = matrix3[4];
    final m02 = matrix3[6];
    final m12 = matrix3[7];
    return transformed(
      (x, y) => (m00 * x + m01 * y + m02, m10 * x + m11 * y + m12),
    );
  }

  RoundedPolygon _transformed4(Float64List matrix4) {
    final m00 = matrix4[0];
    final m01 = matrix4[1];
    final m03 = matrix4[3];
    final m10 = matrix4[4];
    final m11 = matrix4[5];
    final m13 = matrix4[7];
    final m30 = matrix4[12];
    final m31 = matrix4[13];
    final m33 = matrix4[15];
    return transformed((x, y) {
      final rx = m00 * x + m10 * y + m30;
      final ry = m01 * x + m11 * y + m31;
      var rw = m03 * x + m13 * y + m33;
      if (rw == 1.0) {
        return (rx, ry);
      } else {
        rw = 1.0 / rw;
        return (rx * rw, ry * rw);
      }
    });
  }

  RoundedPolygon transformedWithMatrix2(Matrix2 matrix) =>
      _transformed2(matrix.storage);

  RoundedPolygon transformedWithMatrix3(Matrix3 matrix) =>
      _transformed3(matrix.storage);

  RoundedPolygon transformedWithMatrix4(Matrix4 matrix) =>
      _transformed4(matrix.storage);

  Path toPath({
    Path? path,
    double startAngle = 0.0,
    bool repeatPath = false,
    bool closePath = true,
    double? rotationPivotX,
    double? rotationPivotY,
  }) => _pathFromCubics(
    path: path ?? Path(),
    startAngle: startAngle,
    repeatPath: repeatPath,
    closePath: closePath,
    cubics: cubics,
    rotationPivotX: rotationPivotX ?? centerX,
    rotationPivotY: rotationPivotY ?? centerY,
  );
}

@Deprecated("Use MorphExtension instead.")
@internal
extension MorphInternalExtension on Morph {
  @Deprecated("Use MorphExtension.toPath instead.")
  @internal
  Path toPathWith({
    required double progress,
    Path? path,
    double startAngle = 270.0, // 12 O'clock
    bool repeatPath = false,
    bool closePath = true,
    double rotationPivotX = 0.0,
    double rotationPivotY = 0.0,
  }) => toPath(
    progress: progress,
    path: path,
    startAngle: startAngle,
    repeatPath: repeatPath,
    closePath: closePath,
    rotationPivotX: rotationPivotX,
    rotationPivotY: rotationPivotY,
  );
}

extension MorphExtension on Morph {
  Path toPath({
    required double progress,
    Path? path,
    double startAngle = 0.0,
    bool repeatPath = false,
    bool closePath = true,
    double rotationPivotX = 0.0,
    double rotationPivotY = 0.0,
  }) => _pathFromCubics(
    path: path ?? Path(),
    startAngle: startAngle,
    repeatPath: repeatPath,
    closePath: closePath,
    cubics: asCubics(progress),
    rotationPivotX: rotationPivotX,
    rotationPivotY: rotationPivotY,
  );
}

Path _pathFromCubics({
  required Path path,
  required double startAngle,
  required bool repeatPath,
  required bool closePath,
  required List<Cubic> cubics,
  required double rotationPivotX,
  required double rotationPivotY,
}) {
  path.reset();

  final cubicsLength = cubics.length;
  if (cubicsLength == 0) return path;

  final firstCubic = cubics.first;

  path.moveTo(firstCubic.anchor0X, firstCubic.anchor0Y);
  for (var i = 0; i < cubicsLength; i++) {
    final cubic = cubics[i];
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
    for (var i = 0; i < cubicsLength; i++) {
      final cubic = cubics[i];
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
    final angleToFirstCubicRadians = math.atan2(
      firstCubic.anchor0Y - rotationPivotY,
      firstCubic.anchor0X - rotationPivotX,
    );
    final startAngleRadians = startAngle._toRadians();

    // Rotate the Path to to start from the given angle.
    final matrix = Matrix4.rotationZ(
      -angleToFirstCubicRadians + startAngleRadians,
    );
    return path.transform(matrix.storage);
  }
  return path;
}

/// Holds predefined Material Design shapes as [RoundedPolygon]s that can be
/// used at various components as they are, or as part of a [Morph].
///
/// ![Shapes image](https://developer.android.com/images/reference/androidx/compose/material3/shapes.png)
///
/// Note that each [RoundedPolygon] in this class is normalized.
///
/// See [RoundedPolygon.normalized].
abstract final class MaterialShapes {
  // Cache various roundings for use below
  static const _cornerRound15 = CornerRounding(0.15);
  static const _cornerRound20 = CornerRounding(0.2);
  static const _cornerRound30 = CornerRounding(0.3);
  static const _cornerRound50 = CornerRounding(0.5);
  static const _cornerRound100 = CornerRounding(1.0);

  static final _rotateNeg45 = Matrix4.rotationZ(-math.pi * 0.25);
  static final _rotateNeg90 = Matrix4.rotationZ(-math.pi * 0.5);
  static final _rotateNeg135 = Matrix4.rotationZ(-math.pi * 0.75);

  /// A circle shape.
  static final circle = buildCircle().normalized();

  /// A rounded square shape.
  static final square = buildSquare().normalized();

  /// A slanted square shape.
  static final slanted = buildSlanted().normalized();

  /// An arch shape.
  static final arch = buildArch().normalized();

  /// A fan shape.
  static final fan = buildFan().normalized();

  /// An arrow shape.
  static final arrow = buildArrow().normalized();

  /// A semi-circle shape.
  static final semiCircle = buildSemiCircle().normalized();

  /// An oval shape.
  static final oval = buildOval().normalized();

  /// A pill shape.
  static final pill = buildPill().normalized();

  /// A rounded triangle shape.
  static final triangle = buildTriangle().normalized();

  /// A diamond shape.
  static final diamond = buildDiamond().normalized();

  /// A clam-shell shape.
  static final clamShell = buildClamShell().normalized();

  /// A pentagon shape.
  static final pentagon = buildPentagon().normalized();

  /// A gem shape.
  static final gem = buildGem().normalized();

  /// A sunny shape.
  static final verySunny = buildVerySunny().normalized();

  /// A very-sunny shape.
  static final sunny = buildSunny().normalized();

  /// A 4-sided cookie shape.
  static final cookie4Sided = buildCookie4Sided().normalized();

  /// A 6-sided cookie shape.
  static final cookie6Sided = buildCookie6Sided().normalized();

  /// A 7-sided cookie shape.
  static final cookie7Sided = buildCookie7Sided().normalized();

  /// A 9-sided cookie shape.
  static final cookie9Sided = buildCookie9Sided().normalized();

  /// A 12-sided cookie shape.
  static final cookie12Sided = buildCookie12Sided().normalized();

  /// A ghost-ish shape.
  static final ghostish = buildGhostish().normalized();

  /// A 4-leaf clover shape.
  static final clover4Leaf = buildClover4Leaf().normalized();

  /// An 8-leaf clover shape.
  static final clover8Leaf = buildClover8Leaf().normalized();

  /// A burst shape.
  static final burst = buildBurst().normalized();

  /// A soft-burst shape.
  static final softBurst = buildSoftBurst().normalized();

  /// A boom shape.
  static final boom = buildBoom().normalized();

  /// A soft-boom shape.
  static final softBoom = buildSoftBoom().normalized();

  /// A flower shape.
  static final flower = buildFlower().normalized();

  /// A puffy shape.
  static final puffy = buildPuffy().normalized();

  /// A puffy-diamond shape.
  static final puffyDiamond = buildPuffyDiamond().normalized();

  /// A pixel-circle shape.
  static final pixelCircle = buildPixelCircle().normalized();

  /// A pixel-triangle shape.
  static final pixelTriangle = buildPixelTriangle().normalized();

  /// A bun shape.
  static final bun = buildBun().normalized();

  /// A heart shape.
  static final heart = buildHeart().normalized();

  @internal
  static RoundedPolygon buildCircle({int numVertices = 10}) =>
      .circle(numVertices: numVertices);

  @internal
  static RoundedPolygon buildSquare() =>
      .rectangle(width: 1.0, height: 1.0, rounding: _cornerRound30);

  @internal
  static RoundedPolygon buildSlanted() => customPolygon(const [
    OffsetAndRounding(Offset(0.926, 0.970), CornerRounding(0.189, 0.811)),
    OffsetAndRounding(Offset(-0.021, 0.967), CornerRounding(0.187, 0.057)),
  ], reps: 2);

  @internal
  static RoundedPolygon buildArch() => .regular(
    numVertices: 4,
    perVertexRounding: const [
      _cornerRound100,
      _cornerRound100,
      _cornerRound20,
      _cornerRound20,
    ],
  ).transformedWithMatrix4(_rotateNeg135);

  @internal
  static RoundedPolygon buildFan() => customPolygon(const [
    OffsetAndRounding(Offset(1.004, 1.000), CornerRounding(0.148, 0.417)),
    OffsetAndRounding(Offset(0.000, 1.000), CornerRounding(0.151)),
    OffsetAndRounding(Offset(0.000, -0.003), CornerRounding(0.148)),
    OffsetAndRounding(Offset(0.978, 0.020), CornerRounding(0.803)),
  ], reps: 1);

  @internal
  static RoundedPolygon buildArrow() => customPolygon(const [
    OffsetAndRounding(Offset(0.500, 0.892), CornerRounding(0.313)),
    OffsetAndRounding(Offset(-0.216, 1.050), CornerRounding(0.207)),
    OffsetAndRounding(Offset(0.499, -0.160), CornerRounding(0.215, 1.000)),
    OffsetAndRounding(Offset(1.225, 1.060), CornerRounding(0.211)),
  ], reps: 1);

  @internal
  static RoundedPolygon buildSemiCircle() => .rectangle(
    width: 1.6,
    height: 1.0,
    perVertexRounding: const [
      _cornerRound20,
      _cornerRound20,
      _cornerRound100,
      _cornerRound100,
    ],
  );

  @internal
  static RoundedPolygon buildOval() => .circle()
      .transformedWithMatrix4(Matrix4.diagonal3Values(1.0, 0.64, 1.0))
      .transformedWithMatrix4(_rotateNeg45);

  @internal
  static RoundedPolygon buildPill() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.961, 0.039), CornerRounding(0.426)),
      OffsetAndRounding(Offset(1.001, 0.428)),
      OffsetAndRounding(Offset(1.000, 0.609), CornerRounding(1.000)),
    ],
    reps: 2,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildTriangle() => .regular(
    numVertices: 3,
    rounding: _cornerRound20,
  ).transformedWithMatrix4(_rotateNeg90);

  @internal
  static RoundedPolygon buildDiamond() => customPolygon(const [
    OffsetAndRounding(Offset(0.500, 1.096), CornerRounding(0.151, 0.524)),
    OffsetAndRounding(Offset(0.040, 0.500), CornerRounding(0.159)),
  ], reps: 2);

  @internal
  static RoundedPolygon buildClamShell() => customPolygon(const [
    OffsetAndRounding(Offset(0.171, 0.841), CornerRounding(0.159)),
    OffsetAndRounding(Offset(-0.020, 0.500), CornerRounding(0.140)),
    OffsetAndRounding(Offset(0.170, 0.159), CornerRounding(0.159)),
  ], reps: 2);

  @internal
  static RoundedPolygon buildPentagon() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, -0.009), CornerRounding(0.172)),
      OffsetAndRounding(Offset(1.030, 0.365), CornerRounding(0.164)),
      OffsetAndRounding(Offset(0.828, 0.970), CornerRounding(0.169)),
    ],
    reps: 1,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildGem() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.499, 1.023), CornerRounding(0.241, 0.778)),
      OffsetAndRounding(Offset(-0.005, 0.792), CornerRounding(0.208)),
      OffsetAndRounding(Offset(0.073, 0.258), CornerRounding(0.228)),
      OffsetAndRounding(Offset(0.433, -0.000), CornerRounding(0.491)),
    ],
    reps: 1,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildSunny() => .star(
    numVerticesPerRadius: 8,
    innerRadius: 0.8,
    rounding: _cornerRound15,
  );

  @internal
  static RoundedPolygon buildVerySunny() => customPolygon(const [
    OffsetAndRounding(Offset(0.500, 1.080), CornerRounding(0.085)),
    OffsetAndRounding(Offset(0.358, 0.843), CornerRounding(0.085)),
  ], reps: 8);

  @internal
  static RoundedPolygon buildCookie4Sided() => customPolygon(const [
    OffsetAndRounding(Offset(1.237, 1.236), CornerRounding(0.258)),
    OffsetAndRounding(Offset(0.500, 0.918), CornerRounding(0.233)),
  ], reps: 4);

  @internal
  static RoundedPolygon buildCookie6Sided() => customPolygon(const [
    OffsetAndRounding(Offset(0.723, 0.884), CornerRounding(0.394)),
    OffsetAndRounding(Offset(0.500, 1.099), CornerRounding(0.398)),
  ], reps: 6);

  @internal
  static RoundedPolygon buildCookie7Sided() => .star(
    numVerticesPerRadius: 7,
    innerRadius: 0.75,
    rounding: _cornerRound50,
  ).transformedWithMatrix4(_rotateNeg90);

  @internal
  static RoundedPolygon buildCookie9Sided() => .star(
    numVerticesPerRadius: 9,
    innerRadius: 0.8,
    rounding: _cornerRound50,
  ).transformedWithMatrix4(_rotateNeg90);

  @internal
  static RoundedPolygon buildCookie12Sided() => .star(
    numVerticesPerRadius: 12,
    innerRadius: 0.8,
    rounding: _cornerRound50,
  ).transformedWithMatrix4(_rotateNeg90);

  @internal
  static RoundedPolygon buildGhostish() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, 0.0), CornerRounding(1.000)),
      OffsetAndRounding(Offset(1.0, 0.0), CornerRounding(1.000)),
      OffsetAndRounding(Offset(1.0, 1.140), CornerRounding(0.254, 0.106)),
      OffsetAndRounding(Offset(0.575, 0.906), CornerRounding(0.253)),
    ],
    reps: 1,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildClover4Leaf() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, 0.074)),
      OffsetAndRounding(Offset(0.725, -0.099), CornerRounding(0.476)),
    ],
    reps: 4,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildClover8Leaf() => customPolygon(const [
    OffsetAndRounding(Offset(0.500, 0.036)),
    OffsetAndRounding(Offset(0.758, -0.101), CornerRounding(0.209)),
  ], reps: 8);

  @internal
  static RoundedPolygon buildBurst() => customPolygon(const [
    OffsetAndRounding(Offset(0.500, -0.006), CornerRounding(0.006)),
    OffsetAndRounding(Offset(0.592, 0.158), CornerRounding(0.006)),
  ], reps: 12);

  @internal
  static RoundedPolygon buildSoftBurst() => customPolygon(const [
    OffsetAndRounding(Offset(0.193, 0.277), CornerRounding(0.053)),
    OffsetAndRounding(Offset(0.176, 0.055), CornerRounding(0.053)),
  ], reps: 10);

  @internal
  static RoundedPolygon buildBoom() => customPolygon(const [
    OffsetAndRounding(Offset(0.457, 0.296), CornerRounding(0.007)),
    OffsetAndRounding(Offset(0.500, -0.051), CornerRounding(0.007)),
  ], reps: 15);

  @internal
  static RoundedPolygon buildSoftBoom() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.733, 0.454)),
      OffsetAndRounding(Offset(0.839, 0.437), CornerRounding(0.532)),
      OffsetAndRounding(Offset(0.949, 0.449), CornerRounding(0.439, 1.000)),
      OffsetAndRounding(Offset(0.998, 0.478), CornerRounding(0.174)),
    ],
    reps: 16,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildFlower() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.370, 0.187)),
      OffsetAndRounding(Offset(0.416, 0.049), CornerRounding(0.381)),
      OffsetAndRounding(Offset(0.479, 0.001), CornerRounding(0.095)),
    ],
    reps: 8,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildPuffy() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, 0.053)),
      OffsetAndRounding(Offset(0.545, -0.040), CornerRounding(0.405)),
      OffsetAndRounding(Offset(0.670, -0.035), CornerRounding(0.426)),
      OffsetAndRounding(Offset(0.717, 0.066), CornerRounding(0.574)),
      OffsetAndRounding(Offset(0.722, 0.128)),
      OffsetAndRounding(Offset(0.777, 0.002), CornerRounding(0.360)),
      OffsetAndRounding(Offset(0.914, 0.149), CornerRounding(0.660)),
      OffsetAndRounding(Offset(0.926, 0.289), CornerRounding(0.660)),
      OffsetAndRounding(Offset(0.881, 0.346)),
      OffsetAndRounding(Offset(0.940, 0.344), CornerRounding(0.126)),
      OffsetAndRounding(Offset(1.003, 0.437), CornerRounding(0.255)),
    ],
    reps: 2,
    mirroring: true,
  ).transformedWithMatrix4(Matrix4.diagonal3Values(1.0, 0.742, 1.0));

  @internal
  static RoundedPolygon buildPuffyDiamond() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.870, 0.130), CornerRounding(0.146)),
      OffsetAndRounding(Offset(0.818, 0.357)),
      OffsetAndRounding(Offset(1.000, 0.332), CornerRounding(0.853)),
    ],
    reps: 4,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildPixelCircle() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, 0.000)),
      OffsetAndRounding(Offset(0.704, 0.000)),
      OffsetAndRounding(Offset(0.704, 0.065)),
      OffsetAndRounding(Offset(0.843, 0.065)),
      OffsetAndRounding(Offset(0.843, 0.148)),
      OffsetAndRounding(Offset(0.926, 0.148)),
      OffsetAndRounding(Offset(0.926, 0.296)),
      OffsetAndRounding(Offset(1.000, 0.296)),
    ],
    reps: 2,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildPixelTriangle() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.110, 0.500)),
      OffsetAndRounding(Offset(0.113, 0.000)),
      OffsetAndRounding(Offset(0.287, 0.000)),
      OffsetAndRounding(Offset(0.287, 0.087)),
      OffsetAndRounding(Offset(0.421, 0.087)),
      OffsetAndRounding(Offset(0.421, 0.170)),
      OffsetAndRounding(Offset(0.560, 0.170)),
      OffsetAndRounding(Offset(0.560, 0.265)),
      OffsetAndRounding(Offset(0.674, 0.265)),
      OffsetAndRounding(Offset(0.675, 0.344)),
      OffsetAndRounding(Offset(0.789, 0.344)),
      OffsetAndRounding(Offset(0.789, 0.439)),
      OffsetAndRounding(Offset(0.888, 0.439)),
    ],
    reps: 1,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildBun() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.796, 0.500)),
      OffsetAndRounding(Offset(0.853, 0.518), CornerRounding(1.0)),
      OffsetAndRounding(Offset(0.992, 0.631), CornerRounding(1.0)),
      OffsetAndRounding(Offset(0.968, 1.000), CornerRounding(1.0)),
    ],
    reps: 2,
    mirroring: true,
  );

  @internal
  static RoundedPolygon buildHeart() => customPolygon(
    const [
      OffsetAndRounding(Offset(0.500, 0.268), CornerRounding(0.016)),
      OffsetAndRounding(Offset(0.792, -0.066), CornerRounding(0.958)),
      OffsetAndRounding(Offset(1.064, 0.276), CornerRounding(1.000)),
      OffsetAndRounding(Offset(0.501, 0.946), CornerRounding(0.129)),
    ],
    reps: 1,
    mirroring: true,
  );

  static List<OffsetAndRounding> _doRepeat(
    List<OffsetAndRounding> points,
    int reps,
    Offset center,
    bool mirroring,
  ) {
    final np = points.length;
    if (mirroring) {
      final result = <OffsetAndRounding>[];
      final deltas = <_RepeatDelta>[
        for (var i = 0; i < np; i++)
          .fromOffsetAndCenter(points[i].offset, center),
      ];
      final actualReps = reps * 2;
      final sectionAngle = math.pi * 2.0 / actualReps;
      for (var it = 0; it < actualReps; it++) {
        for (var index = 0; index < np; index++) {
          final i = it.isEven ? index : np - 1 - index;
          if (i > 0 || it.isEven) {
            final delta = deltas[i];
            final a =
                sectionAngle * it +
                (it.isEven
                    ? delta.angle
                    : sectionAngle - delta.angle + 2.0 * deltas[0].angle);
            final finalPoint =
                Offset(math.cos(a), math.sin(a)) * delta.distance + center;
            result.add(OffsetAndRounding(finalPoint, points[i].rounding));
          }
        }
      }
      return result;
    } else {
      final n = np * reps;
      return [
        for (var i = 0; i < n; i++)
          OffsetAndRounding(
            points[i % np].offset._rotateDegrees(
              (i ~/ np) * 360.0 / reps,
              center,
            ),
            points[i % np].rounding,
          ),
      ];
    }
  }

  @internal
  static RoundedPolygon customPolygon(
    List<OffsetAndRounding> pnr, {
    required int reps,
    Offset center = const Offset(0.5, 0.5),
    bool mirroring = false,
  }) {
    final actualPoints = _doRepeat(pnr, reps, center, mirroring);
    return .fromVertices(
      vertices: .generate(actualPoints.length * 2, (index) {
        final it = actualPoints[index ~/ 2].offset;
        return index.isEven ? it.dx : it.dy;
      }),
      perVertexRounding: [
        for (var i = 0; i < actualPoints.length; i++) actualPoints[i].rounding,
      ],
      centerX: center.dx,
      centerY: center.dy,
    );
  }
}

extension type const _RepeatDelta._((double angle, double distance) _)
    implements Object {
  const _RepeatDelta({required double angle, required double distance})
    : this._((angle, distance));

  _RepeatDelta.from(double dx, double dy)
    : this(angle: math.atan2(dy, dx), distance: math.sqrt(dx * dx + dy * dy));

  _RepeatDelta.fromOffsetAndCenter(Offset offset, Offset center)
    : this.from(offset.dx - center.dx, offset.dy - center.dy);

  double get angle => _.$1;

  double get distance => _.$2;

  _RepeatDelta copyWith({double? angle, double? distance}) =>
      .new(angle: angle ?? this.angle, distance: distance ?? this.distance);
}

@internal
extension type const OffsetAndRounding._(
  (Offset offset, CornerRounding rounding) _
)
    implements Object {
  const OffsetAndRounding(Offset offset, [CornerRounding rounding = .unrounded])
    : this._((offset, rounding));

  const OffsetAndRounding.from({
    required Offset offset,
    CornerRounding rounding = .unrounded,
  }) : this(offset, rounding);

  Offset get offset => _.$1;

  CornerRounding get rounding => _.$2;

  OffsetAndRounding copyWith({Offset? offset, CornerRounding? rounding}) =>
      .new(offset ?? this.offset, rounding ?? this.rounding);
}

extension on Offset {
  Offset _rotateRadians(double angle, [Offset center = .zero]) {
    final x = dx - center.dx;
    final y = dy - center.dy;
    final cos = math.cos(angle);
    final sin = math.sin(angle);
    return Offset(x * cos - y * sin + center.dx, x * sin + y * cos + center.dy);
  }

  Offset _rotateDegrees(double angle, [Offset center = .zero]) =>
      _rotateRadians(angle._toRadians(), center);
}

extension on double {
  double _toRadians() => this * (math.pi / 180.0);
}

abstract class PathBorder extends OutlinedBorder {
  const PathBorder({super.side, this.squash = 0.0});

  /// How much of the aspect ratio of the attached widget to take on.
  ///
  /// If [squash] is non-zero, the border will match the aspect ratio of the
  /// bounding box of the widget that it is attached to, which can give a
  /// squashed appearance.
  ///
  /// The [squash] parameter lets you control how much of that aspect ratio this
  /// border takes on.
  ///
  /// A value of zero means that the border will be drawn with a square aspect
  /// ratio at the size of the shortest side of the bounding rectangle, ignoring
  /// the aspect ratio of the widget, and a value of one means it will be drawn
  /// with the aspect ratio of the widget. The value of [squash] has no effect
  /// if the widget is square to begin with.
  ///
  /// Defaults to zero, and must be between zero and one, inclusive.
  final double squash;

  @protected
  Path get path;

  Path _transformPath(Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;
    assert(width >= 0.0 && height >= 0.0);

    final size = width <= height
        ? Size(width, squash * height + (1.0 - squash) * width)
        : Size(squash * width + (1.0 - squash) * height, height);

    final matrix = Matrix4.identity()
      ..translateByDouble(
        rect.left + (width - size.width) / 2.0,
        rect.top + (height - size.height) / 2.0,
        0.0,
        1.0,
      )
      ..scaleByDouble(size.width, size.height, 1.0, 1.0);
    return path.transform(matrix.storage);
  }

  @override
  PathBorder copyWith({BorderSide? side, double? squash});

  @override
  PathBorder scale(double t);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = rect.deflate(side.strokeInset);
    return _transformPath(adjustedRect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = rect.inflate(side.strokeOutset);
    return _transformPath(adjustedRect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case .none:
        return;
      case .solid:
        final adjustedRect = rect.inflate(side.strokeOffset / 2.0);
        final path = _transformPath(adjustedRect);
        canvas.drawPath(path, side.toPaint());
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is PathBorder &&
          side == other.side &&
          squash == other.squash;

  @override
  int get hashCode => Object.hash(runtimeType, side, squash);
}

// abstract class _CubicsBorder extends _PathBorder {
//   const _CubicsBorder({super.side, super.squash, required this.cubics});

//   final List<Cubic> cubics;

//   @override
//   Path get path;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       runtimeType == other.runtimeType &&
//           other is _CubicsBorder &&
//           side == other.side &&
//           squash == other.squash &&
//           listEquals(cubics, other.cubics);

//   @override
//   int get hashCode =>
//       Object.hash(runtimeType, side, squash, Object.hashAll(cubics));
// }

class RoundedPolygonBorder extends PathBorder {
  RoundedPolygonBorder({
    super.side,
    super.squash,
    required this.polygon,
    this.startAngle = 0.0,
  }) : path = polygon.toPath(startAngle: startAngle);

  final RoundedPolygon polygon;
  final double startAngle;

  @override
  final Path path;

  @override
  RoundedPolygonBorder copyWith({
    BorderSide? side,
    double? squash,
    RoundedPolygon? polygon,
    double? startAngle,
  }) => RoundedPolygonBorder(
    side: side ?? this.side,
    squash: squash ?? this.squash,
    polygon: polygon ?? this.polygon,
    startAngle: startAngle ?? this.startAngle,
  );

  @override
  RoundedPolygonBorder scale(double t) => RoundedPolygonBorder(
    side: side.scale(t),
    squash: squash,
    polygon: polygon,
    startAngle: startAngle,
  );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is RoundedPolygonBorder) {
      return MorphBorder(
        side: BorderSide.lerp(a.side, side, t),
        squash: interpolateDouble(a.squash, squash, t),
        morph: Morph(a.polygon, polygon),
        progress: t,
        startAngle: interpolateDouble(a.startAngle, startAngle, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is RoundedPolygonBorder) {
      return MorphBorder(
        side: BorderSide.lerp(side, b.side, t),
        squash: interpolateDouble(squash, b.squash, t),
        morph: Morph(polygon, b.polygon),
        progress: t,
        startAngle: interpolateDouble(startAngle, b.startAngle, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is RoundedPolygonBorder &&
          side == other.side &&
          squash == other.squash &&
          polygon == other.polygon &&
          startAngle == other.startAngle;

  @override
  int get hashCode =>
      Object.hash(runtimeType, squash, side, polygon, startAngle);
}

class MorphBorder extends PathBorder {
  MorphBorder({
    super.side,
    super.squash,
    required this.morph,
    required this.progress,
    this.startAngle = 0.0,
  }) : path = morph.toPath(progress: progress, startAngle: startAngle);

  final Morph morph;
  final double progress;
  final double startAngle;

  @override
  final Path path;

  @override
  MorphBorder copyWith({
    BorderSide? side,
    double? squash,
    Morph? morph,
    double? progress,
    double? startAngle,
  }) => MorphBorder(
    side: side ?? this.side,
    squash: squash ?? this.squash,
    morph: morph ?? this.morph,
    progress: progress ?? this.progress,
    startAngle: startAngle ?? this.startAngle,
  );

  @override
  MorphBorder scale(double t) => MorphBorder(
    side: side.scale(t),
    squash: squash,
    morph: morph,
    progress: progress,
    startAngle: startAngle,
  );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MorphBorder) {
      return MorphBorder(
        side: BorderSide.lerp(a.side, side, t),
        squash: interpolateDouble(a.squash, squash, t),
        morph: t < 0.5 ? a.morph : morph,
        progress: interpolateDouble(a.progress, progress, t),
        startAngle: interpolateDouble(a.startAngle, startAngle, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MorphBorder) {
      return MorphBorder(
        side: BorderSide.lerp(side, b.side, t),
        squash: interpolateDouble(squash, b.squash, t),
        morph: t < 0.5 ? morph : b.morph,
        progress: interpolateDouble(progress, b.progress, t),
        startAngle: interpolateDouble(startAngle, b.startAngle, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is MorphBorder &&
          side == other.side &&
          squash == other.squash &&
          morph == other.morph &&
          progress == other.progress &&
          startAngle == other.startAngle;

  @override
  int get hashCode =>
      Object.hash(runtimeType, side, squash, morph, progress, startAngle);
}
