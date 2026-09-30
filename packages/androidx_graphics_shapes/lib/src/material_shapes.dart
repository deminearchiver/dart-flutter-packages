// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This code is a Dart port of the Compose Material 3 shape catalog:
// https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/MaterialShapes.kt

import 'dart:collection';
import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart';

import 'shapes/shapes.dart';

/// Holds predefined Material Design shapes as [RoundedPolygon]s that can be
/// used at various components as they are, or as part of a [Morph].
///
/// Note that each [RoundedPolygon] in this class is normalized.
///
/// https://developer.android.com/images/reference/androidx/compose/material3/shapes.png
///
/// <callout-box>
///
/// This example shows how to animate a [Morph] through every shape in [all].
///
// TODO(framework): Replace the following block with a @dartpad directive
// when it's supported. https://github.com/dart-lang/dartdoc/issues/4123
/// {@macro material_ui.dartpad_guide}
///
/// {@example /example/lib/material_shapes/material_shapes.0.dart#body}
///
/// </callout-box>
abstract final class MaterialShapes {
  static const _cornerRound15 = CornerRounding(radius: 0.15);
  static const _cornerRound20 = CornerRounding(radius: 0.2);
  static const _cornerRound30 = CornerRounding(radius: 0.3);
  static const _cornerRound50 = CornerRounding(radius: 0.5);
  static const _cornerRound100 = CornerRounding(radius: 1.0);

  static const _negative45Radians = -45.0 * math.pi / 180.0;
  static const _negative90Radians = -90.0 * math.pi / 180.0;
  static const _negative135Radians = -135.0 * math.pi / 180.0;

  /// A circle shape.
  static final circle = RoundedPolygon.circle(
    numVertices: 10,
    radius: 0.5,
    center: const .new(0.5, 0.5),
  );

  /// A square shape.
  static final square = RoundedPolygon.rectangle(
    width: 1.0,
    height: 1.0,
    rounding: _cornerRound30,
    center: const .new(0.5, 0.5),
  );

  /// A slanted square shape.
  static final slanted = _customPolygon(const [
    .new(.new(0.926, 0.970), .new(radius: 0.189, smoothing: 0.811)),
    .new(.new(-0.021, 0.967), .new(radius: 0.187, smoothing: 0.057)),
  ], 2).normalized();

  /// An arch shape.
  static final arch =
      RoundedPolygon(
            4,
            perVertexRounding: const [
              _cornerRound100,
              _cornerRound100,
              _cornerRound20,
              _cornerRound20,
            ],
          )
          .transformed(
            (Matrix4.identity()..rotateZ(_negative135Radians))
                .asPointTransformer(),
          )
          .normalized();

  /// A semi-circle shape.
  static final semiCircle = RoundedPolygon.rectangle(
    width: 1.6,
    height: 1.0,
    perVertexRounding: const [
      _cornerRound20,
      _cornerRound20,
      _cornerRound100,
      _cornerRound100,
    ],
  ).normalized();

  /// An oval shape.
  static final oval = RoundedPolygon.circle()
      .transformed(
        (Matrix4.identity()
              ..rotateZ(_negative45Radians)
              ..scaleByDouble(1.0, 0.64, 1.0, 1.0))
            .asPointTransformer(),
      )
      .normalized();

  /// A pill shape.
  static final pill = _customPolygon(
    [
      const .new(.new(0.961, 0.039), .new(radius: 0.426)),
      const .new(.new(1.001, 0.428)),
      const .new(.new(1.0, 0.609), .new(radius: 1.0)),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A triangle shape.
  static final triangle = RoundedPolygon(3, rounding: _cornerRound20)
      .transformed(
        (Matrix4.identity()..rotateZ(_negative90Radians)).asPointTransformer(),
      )
      .normalized();

  /// An arrow shape.
  static final arrow = _customPolygon([
    const .new(.new(0.5, 0.892), .new(radius: 0.313)),
    const .new(.new(-0.216, 1.05), .new(radius: 0.207)),
    const .new(.new(0.499, -0.16), .new(radius: 0.215, smoothing: 1.0)),
    const .new(.new(1.225, 1.06), .new(radius: 0.211)),
  ], 1).normalized();

  /// A fan shape.
  static final fan = _customPolygon([
    const .new(.new(1.004, 1.0), .new(radius: 0.148, smoothing: 0.417)),
    const .new(.new(0.0, 1.0), .new(radius: 0.151)),
    const .new(.new(0.0, -0.003), .new(radius: 0.148)),
    const .new(.new(0.978, 0.02), .new(radius: 0.803)),
  ], 1).normalized();

  /// A diamond shape.
  static final diamond = _customPolygon([
    const .new(.new(0.5, 1.096), .new(radius: 0.151, smoothing: 0.524)),
    const .new(.new(0.04, 0.5), .new(radius: .159)),
  ], 2).normalized();

  /// A clam-shell shape.
  static final clamShell = _customPolygon([
    const .new(.new(0.171, 0.841), .new(radius: 0.159)),
    const .new(.new(-0.02, 0.5), .new(radius: 0.140)),
    const .new(.new(0.17, 0.159), .new(radius: 0.159)),
  ], 2).normalized();

  /// A pentagon shape.
  static final pentagon = _customPolygon(
    [
      const .new(.new(0.5, -0.009), .new(radius: 0.172)),
      const .new(.new(1.03, 0.365), .new(radius: 0.164)),
      const .new(.new(0.828, 0.97), .new(radius: 0.169)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A gem shape.
  static final gem = _customPolygon(
    [
      const .new(.new(0.499, 1.023), .new(radius: 0.241, smoothing: 0.778)),
      const .new(.new(-0.005, 0.792), .new(radius: 0.208)),
      const .new(.new(0.073, 0.258), .new(radius: 0.228)),
      const .new(.new(0.433, -0.0), .new(radius: 0.491)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A sunny shape.
  static final sunny = RoundedPolygon.star(
    numVerticesPerRadius: 8,
    innerRadius: 0.8,
    rounding: _cornerRound15,
  ).normalized();

  /// A very-sunny shape.
  static final verySunny = _customPolygon([
    const .new(.new(0.5, 1.080), .new(radius: 0.085)),
    const .new(.new(0.358, 0.843), .new(radius: 0.085)),
  ], 8).normalized();

  /// A 4-sided cookie shape.
  static final cookie4Sided = _customPolygon([
    const .new(.new(1.237, 1.236), .new(radius: 0.258)),
    const .new(.new(0.5, 0.918), .new(radius: 0.233)),
  ], 4).normalized();

  /// A 6-sided cookie shape.
  static final cookie6Sided = _customPolygon([
    const .new(.new(0.723, 0.884), .new(radius: 0.394)),
    const .new(.new(0.5, 1.099), .new(radius: 0.398)),
  ], 6).normalized();

  /// A 7-sided cookie shape.
  static final cookie7Sided =
      RoundedPolygon.star(
            numVerticesPerRadius: 7,
            innerRadius: 0.75,
            rounding: _cornerRound50,
          )
          .transformed(
            (Matrix4.identity()..rotateZ(_negative90Radians))
                .asPointTransformer(),
          )
          .normalized();

  /// A 9-sided cookie shape.
  static final cookie9Sided =
      RoundedPolygon.star(
            numVerticesPerRadius: 9,
            innerRadius: 0.8,
            rounding: _cornerRound50,
          )
          .transformed(
            (Matrix4.identity()..rotateZ(_negative90Radians))
                .asPointTransformer(),
          )
          .normalized();

  /// A 12-sided cookie shape.
  static final cookie12Sided =
      RoundedPolygon.star(
            numVerticesPerRadius: 12,
            innerRadius: 0.8,
            rounding: _cornerRound50,
          )
          .transformed(
            (Matrix4.identity()..rotateZ(_negative90Radians))
                .asPointTransformer(),
          )
          .normalized();

  /// A 4-leaf clover shape.
  static final clover4Leaf = _customPolygon(
    [
      const .new(.new(0.5, 0.074)),
      const .new(.new(0.725, -0.099), .new(radius: 0.476)),
    ],
    4,
    mirroring: true,
  ).normalized();

  /// An 8-leaf clover shape.
  static final clover8Leaf = _customPolygon([
    const .new(.new(0.5, 0.036)),
    const .new(.new(0.758, -0.101), .new(radius: 0.209)),
  ], 8).normalized();

  /// A burst shape.
  static final burst = _customPolygon([
    const .new(.new(0.5, -0.006), .new(radius: 0.006)),
    const .new(.new(0.592, 0.158), .new(radius: 0.006)),
  ], 12).normalized();

  /// A soft-burst shape.
  static final softBurst = _customPolygon([
    const .new(.new(0.193, 0.277), .new(radius: 0.053)),
    const .new(.new(0.176, 0.055), .new(radius: 0.053)),
  ], 10).normalized();

  /// A boom shape.
  static final boom = _customPolygon([
    const .new(.new(0.457, 0.296), .new(radius: 0.007)),
    const .new(.new(0.5, -0.051), .new(radius: 0.007)),
  ], 15).normalized();

  /// A soft-boom shape.
  static final softBoom = _customPolygon(
    [
      const .new(.new(0.733, 0.454)),
      const .new(.new(0.839, 0.437), .new(radius: 0.532)),
      const .new(.new(0.949, 0.449), .new(radius: 0.439, smoothing: 1.0)),
      const .new(.new(0.998, 0.478), .new(radius: 0.174)),
    ],
    16,
    mirroring: true,
  ).normalized();

  /// A flower shape.
  static final flower = _customPolygon(
    [
      const .new(.new(0.370, 0.187)),
      const .new(.new(0.416, 0.049), .new(radius: 0.381)),
      const .new(.new(0.479, 0.001), .new(radius: 0.095)),
    ],
    8,
    mirroring: true,
  ).normalized();

  /// A puffy shape.
  static final puffy =
      _customPolygon(
            [
              const .new(.new(0.5, 0.053)),
              const .new(.new(0.545, -0.04), .new(radius: 0.405)),
              const .new(.new(0.670, -0.035), .new(radius: 0.426)),
              const .new(.new(0.717, 0.066), .new(radius: 0.574)),
              const .new(.new(0.722, 0.128)),
              const .new(.new(0.777, 0.002), .new(radius: 0.36)),
              const .new(.new(0.914, 0.149), .new(radius: 0.66)),
              const .new(.new(0.926, 0.289), .new(radius: 0.66)),
              const .new(.new(0.881, 0.346)),
              const .new(.new(0.940, 0.344), .new(radius: 0.126)),
              const .new(.new(1.003, 0.437), .new(radius: 0.255)),
            ],
            2,
            mirroring: true,
          )
          .transformed(
            (Matrix4.identity()..scale(1.0, 0.742)).asPointTransformer(),
          )
          .normalized();

  /// A puffy-diamond shape.
  static final puffyDiamond = _customPolygon(
    [
      const .new(.new(0.87, 0.13), .new(radius: 0.146)),
      const .new(.new(0.818, 0.357)),
      const .new(.new(1.0, 0.332), .new(radius: 0.853)),
    ],
    4,
    mirroring: true,
  ).normalized();

  /// A ghostish shape.
  static final ghostish = _customPolygon(
    [
      const .new(.new(0.5, 0.0), .new(radius: 1.0)),
      const .new(.new(1.0, 0.0), .new(radius: 1.0)),
      const .new(.new(1.0, 1.14), .new(radius: 0.254, smoothing: 0.106)),
      const .new(.new(0.575, 0.906), .new(radius: 0.253)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A pixel-circle shape.
  static final pixelCircle = _customPolygon(
    [
      const .new(.new(0.5, 0.0)),
      const .new(.new(0.704, 0.0)),
      const .new(.new(0.704, 0.065)),
      const .new(.new(0.843, 0.065)),
      const .new(.new(0.843, 0.148)),
      const .new(.new(0.926, 0.148)),
      const .new(.new(0.926, 0.296)),
      const .new(.new(1.0, 0.296)),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A pixel-triangle shape.
  static final pixelTriangle = _customPolygon(
    [
      const .new(.new(0.11, 0.5)),
      const .new(.new(0.113, 0.0)),
      const .new(.new(0.287, 0.0)),
      const .new(.new(0.287, 0.087)),
      const .new(.new(0.421, 0.087)),
      const .new(.new(0.421, 0.17)),
      const .new(.new(0.56, 0.17)),
      const .new(.new(0.56, 0.265)),
      const .new(.new(0.674, 0.265)),
      const .new(.new(0.675, 0.344)),
      const .new(.new(0.789, 0.344)),
      const .new(.new(0.789, 0.439)),
      const .new(.new(0.888, 0.439)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A bun shape.
  static final bun = _customPolygon(
    [
      const .new(.new(0.796, 0.5)),
      const .new(.new(0.853, 0.518), .new(radius: 1.0)),
      const .new(.new(0.992, 0.631), .new(radius: 1.0)),
      const .new(.new(0.968, 1.0), .new(radius: 1.0)),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A heart shape.
  static final heart = _customPolygon(
    [
      const .new(.new(0.5, 0.268), .new(radius: 0.016)),
      const .new(.new(0.792, -0.066), .new(radius: 0.958)),
      const .new(.new(1.064, 0.276), .new(radius: 1.0)),
      const .new(.new(0.501, 0.946), .new(radius: 0.129)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A list of all available shapes.
  static final all = UnmodifiableListView<RoundedPolygon>([
    MaterialShapes.circle,
    MaterialShapes.square,
    MaterialShapes.slanted,
    MaterialShapes.arch,
    MaterialShapes.semiCircle,
    MaterialShapes.oval,
    MaterialShapes.pill,
    MaterialShapes.triangle,
    MaterialShapes.arrow,
    MaterialShapes.fan,
    MaterialShapes.diamond,
    MaterialShapes.clamShell,
    MaterialShapes.pentagon,
    MaterialShapes.gem,
    MaterialShapes.sunny,
    MaterialShapes.verySunny,
    MaterialShapes.cookie4Sided,
    MaterialShapes.cookie6Sided,
    MaterialShapes.cookie7Sided,
    MaterialShapes.cookie9Sided,
    MaterialShapes.cookie12Sided,
    MaterialShapes.clover4Leaf,
    MaterialShapes.clover8Leaf,
    MaterialShapes.burst,
    MaterialShapes.softBurst,
    MaterialShapes.boom,
    MaterialShapes.softBoom,
    MaterialShapes.flower,
    MaterialShapes.puffy,
    MaterialShapes.puffyDiamond,
    MaterialShapes.ghostish,
    MaterialShapes.pixelCircle,
    MaterialShapes.pixelTriangle,
    MaterialShapes.bun,
    MaterialShapes.heart,
  ]);

  static RoundedPolygon _customPolygon(
    List<_PointNRound> pnr,
    int reps, {
    Point center = const .new(0.5, 0.5),
    bool mirroring = false,
  }) {
    final actualPoints = _doRepeat(pnr, reps, center, mirroring);

    return .fromVertices(
      actualPoints.map((ap) => ap.p).toList(),
      perVertexRounding: actualPoints.map((ap) => ap.r).toList(),
      center: center,
    );
  }

  static List<_PointNRound> _doRepeat(
    List<_PointNRound> points,
    int reps,
    Point center,
    bool mirroring,
  ) {
    final result = <_PointNRound>[];

    if (mirroring) {
      final measures = List<({double angle, double distance})>.generate(
        points.length,
        (i) {
          final point = points[i];
          final off = point.p - center;
          return (angle: off.direction, distance: off.distance);
        },
      );
      final actualReps = reps * 2.0;
      final sectionAngle = math.pi * 2.0 / actualReps;

      for (var r = 0; r < actualReps; r++) {
        for (var index = 0; index < points.length; index++) {
          final i = (r.isEven) ? index : points.length - 1 - index;
          if (i > 0 || r.isEven) {
            final a =
                sectionAngle * r +
                (r.isEven
                    ? measures[i].angle
                    : sectionAngle - measures[i].angle + 2 * measures[0].angle);

            final finalPoint =
                Point(math.cos(a), math.sin(a)) * measures[i].distance + center;

            result.add(.new(finalPoint, points[i].r));
          }
        }
      }
    } else {
      final np = points.length;
      for (var i = 0; i < np * reps; i++) {
        final point = points[i % np].p.rotate(
          (i ~/ np) * 360.0 / reps,
          center: center,
        );
        result.add(_PointNRound(point, points[i % np].r));
      }
    }

    return result;
  }
}

class const _PointNRound(final Point p, [final CornerRounding r = .unrounded]);
