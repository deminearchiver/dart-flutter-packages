// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import 'cubic.dart';
import 'feature_mapping.dart';
import 'features.dart';
import 'rounded_polygon.dart';
import 'utils.dart';

/// A [RoundedPolygon] whose cubics have been measured, so that each one is
/// associated with the [0..1] progress range it covers along the outline.
@internal
class MeasuredPolygon._({
  required final Measurer _measurer,
  required final List<ProgressableFeature> features,
  required List<CubicBezier> cubics,
  required List<double> outlineProgress,
}) {
  this
    : assert(
        outlineProgress.length == cubics.length + 1,
        "Outline progress length is expected to be the cubics length + 1",
      ),
      assert(
        outlineProgress.first == 0.0,
        "First outline progress value is expected to be zero",
      ),
      assert(
        outlineProgress.last == 1.0,
        "Last outline progress value is expected to be one",
      ) {
    final measuredCubics = <MeasuredCubic>[];
    var startOutlineProgress = 0.0;
    for (var i = 0; i < cubics.length; i++) {
      // Filter out "empty" cubics.
      if ((outlineProgress[i + 1] - outlineProgress[i]) > distanceEpsilon) {
        measuredCubics.add(
          MeasuredCubic(
            measurer: _measurer,
            cubic: cubics[i],
            startOutlineProgress: startOutlineProgress,
            endOutlineProgress: outlineProgress[i + 1],
          ),
        );
        // The next measured cubic will start exactly where this one ends.
        startOutlineProgress = outlineProgress[i + 1];
      }
    }
    // We could have removed empty cubics at the end. Ensure the last measured
    // cubic ends at 1.
    measuredCubics[measuredCubics.length - 1].updateProgressRange(
      endOutlineProgress: 1.0,
    );
    _cubics = measuredCubics;
  }

  factory measure(Measurer measurer, RoundedPolygon polygon) {
    final cubics = <CubicBezier>[];
    final featureToCubic = <(Feature, int)>[];

    // Get the cubics from the polygon, at the same time, extract the features
    // and keep a reference to the representative cubic we will use.
    for (
      var featureIndex = 0;
      featureIndex < polygon.features.length;
      featureIndex++
    ) {
      final feature = polygon.features[featureIndex];
      final featureCubics = feature.cubics;
      for (
        var cubicIndex = 0;
        cubicIndex < featureCubics.length;
        cubicIndex++
      ) {
        if (feature is CornerFeature &&
            cubicIndex == featureCubics.length ~/ 2) {
          featureToCubic.add((feature, cubics.length));
        }
        cubics.add(featureCubics[cubicIndex]);
      }
    }

    final measures = List<double>.filled(cubics.length + 1, 0.0);
    var totalMeasure = 0.0;

    for (var i = 0; i < cubics.length; i++) {
      final measure = measurer.measureCubic(cubics[i]);
      if (measure < 0.0) {
        throw StateError(
          "Measured cubic is expected to be greater or equal to zero",
        );
      }
      totalMeasure += measure;
      measures[i + 1] = totalMeasure;
    }

    final outlineProgress = List<double>.filled(measures.length, 0.0);
    if (totalMeasure < distanceEpsilon) {
      // A degenerate polygon, e.g. one with all of its points coincident, has
      // no measurable outline to divide by. Space the cubics evenly along the
      // progress range instead, so the polygon can still be morphed.
      for (var i = 0; i < measures.length; i++) {
        outlineProgress[i] = i / cubics.length;
      }
    } else {
      for (var i = 0; i < measures.length; i++) {
        outlineProgress[i] = measures[i] / totalMeasure;
      }
    }

    final features = List.generate(featureToCubic.length, (i) {
      final ix = featureToCubic[i].$2;
      return ProgressableFeature(
        positiveModulo(
          (outlineProgress[ix] + outlineProgress[ix + 1]) / 2.0,
          1.0,
        ),
        featureToCubic[i].$1,
      );
    });

    return ._(
      measurer: measurer,
      features: features,
      cubics: cubics,
      outlineProgress: outlineProgress,
    );
  }

  late final List<MeasuredCubic> _cubics;

  MeasuredCubic get first => _cubics.first;

  MeasuredCubic get last => _cubics.last;

  int get length => _cubics.length;

  MeasuredCubic operator [](int index) => _cubics[index];

  MeasuredCubic? cubicAtOrNull(int index) {
    final length = _cubics.length;

    if (index < 0 || index >= length) {
      return null;
    }

    return _cubics[index];
  }

  /// Finds the point in the input list of measured cubics that passes the
  /// given outline progress, and generates a new [MeasuredPolygon] (equivalent
  /// to this), that starts at that point.
  ///
  /// This usually means cutting the cubic that crosses the outline progress
  /// (unless the cut is at one of its ends).
  /// For example, given outline progress 0.4 and measured cubics on these
  /// outline progress ranges:
  ///
  /// c1 [0 -> 0.2] c2 [0.2 -> 0.5] c3 [0.5 -> 1.0]
  ///
  /// c2 will be cut in two, at the given outline progress, we can name these
  /// c2a [0.2 -> 0.4] and c2b [0.4 -> 0.5]
  ///
  /// The return then will have measured cubics [c2b, c3, c1, c2a], and they
  /// will have their outline progress ranges adjusted so the new list starts
  /// at 0.
  ///
  /// c2b [0 -> 0.1] c3 [0.1 -> 0.6] c1 [0.6 -> 0.8] c2a [0.8 -> 1.0]
  MeasuredPolygon cutAndShift(double cuttingPoint) {
    if (cuttingPoint < 0.0 || cuttingPoint > 1.0) {
      throw ArgumentError("Cutting point is expected to be between 0 and 1");
    }

    if (cuttingPoint < distanceEpsilon) {
      return this;
    }

    // Find the index of cubic we want to cut
    final targetIndex = _cubics.indexWhere(
      (c) =>
          cuttingPoint >= c._startOutlineProgress &&
          cuttingPoint <= c._endOutlineProgress,
    );
    final target = _cubics[targetIndex];

    // Cut the target cubic.
    // b1, b2 are two resulting cubics after cut
    final (b1, b2) = target.cutAtProgress(cuttingPoint);

    // Construct the list of the cubics we need:
    // * The second part of the target cubic (after the cut)
    // * All cubics after the target, until the end + All cubics from the
    //   start, before the target cubic
    // * The first part of the target cubic (before the cut)
    final retCubics = [b2.cubic];
    for (var i = 1; i < _cubics.length; i++) {
      retCubics.add(_cubics[(i + targetIndex) % _cubics.length].cubic);
    }
    retCubics.add(b1.cubic);

    // Construct the array of outline progress.
    // For example, if we have 3 cubics with outline progress [0 .. 0.3],
    // [0.3 .. 0.8] & [0.8 .. 1.0], and we cut + shift at 0.6:
    // 0.  0123456789
    //     |--|--/-|-|
    // The outline progresses will start at 0 (the cutting point, that shifts
    // to 0.0), then 0.8 - 0.6 = 0.2, then 1 - 0.6 = 0.4, then 0.3 - 0.6 + 1 =
    // 0.7, then 1 (the cutting point again), all together: (0.0, 0.2, 0.4,
    // 0.7, 1.0)
    final retOutlineProgress = List<double>.filled(_cubics.length + 2, 0.0);

    for (var i = 0; i < _cubics.length + 2; i++) {
      if (i == 0) {
        retOutlineProgress[i] = 0.0;
      } else if (i == _cubics.length + 1) {
        retOutlineProgress[i] = 1.0;
      } else {
        final cubicIndex = (targetIndex + i - 1) % _cubics.length;
        retOutlineProgress[i] = positiveModulo(
          _cubics[cubicIndex]._endOutlineProgress - cuttingPoint,
          1,
        );
      }
    }

    // Shift the feature's outline progress too.
    final newFeatures = <ProgressableFeature>[
      for (var i = 0; i < features.length; i++)
        .new(
          positiveModulo(features[i].progress - cuttingPoint, 1.0),
          features[i].feature,
        ),
    ];

    // Filter out all empty cubics (i.e. start and end anchor are (almost) the
    // same point.)
    return ._(
      measurer: _measurer,
      features: newFeatures,
      cubics: retCubics,
      outlineProgress: retOutlineProgress,
    );
  }
}

/// A [MeasuredCubic] holds information about the cubic itself, the feature
/// (if any) associated with it, and the outline progress values (start and
/// end) for the cubic.
///
/// This information is used to match cubics between shapes that lie at similar
/// outline progress positions along their respective shapes (after matching
/// features and shifting).
///
/// Outline progress is a value in [0..1) that represents the distance traveled
/// along the overall outline path of the shape.
@internal
class MeasuredCubic({
  required final Measurer measurer,
  required final CubicBezier cubic,
  required var double _startOutlineProgress,
  required var double _endOutlineProgress,
}) {
  this
    : assert(
        _startOutlineProgress >= 0.0 && _startOutlineProgress <= 1.0,
        "startOutlineProgress has to be in [0..1] range",
      ),
      assert(
        _endOutlineProgress >= 0.0 && _endOutlineProgress <= 1.0,
        "endOutlineProgress has to be in range [0..1]",
      ),
      assert(
        _endOutlineProgress >= _startOutlineProgress,
        "endOutlineProgress is expected to be equal or greater than "
        "startOutlineProgress",
      ) {
    measuredSize = measurer.measureCubic(cubic);
  }

  late final double measuredSize;

  double get startOutlineProgress => _startOutlineProgress;

  double get endOutlineProgress => _endOutlineProgress;

  void updateProgressRange({
    double? startOutlineProgress,
    double? endOutlineProgress,
  }) {
    startOutlineProgress ??= _startOutlineProgress;
    endOutlineProgress ??= _endOutlineProgress;

    if (endOutlineProgress < startOutlineProgress) {
      throw ArgumentError(
        "endOutlineProgress is expected to be equal or greater than "
        "startOutlineProgress",
      );
    }

    _startOutlineProgress = startOutlineProgress;
    _endOutlineProgress = endOutlineProgress;
  }

  /// Cuts this [MeasuredCubic] into two at the given outline progress value.
  (MeasuredCubic, MeasuredCubic) cutAtProgress(double cutOutlineProgress) {
    // Floating point errors further up can cause cutOutlineProgress to land
    // just slightly outside of the start/end progress for this cubic, so we
    // limit it to those bounds to avoid further errors later
    final boundedCutOutlineProgress = clampDouble(
      cutOutlineProgress,
      _startOutlineProgress,
      _endOutlineProgress,
    );
    final outlineProgressSize = _endOutlineProgress - _startOutlineProgress;
    final progressFromStart = boundedCutOutlineProgress - _startOutlineProgress;

    // Note that in earlier parts of the computation, we have empty
    // MeasuredCubics (cubics with progressSize == 0), but those cubics are
    // filtered out before this method is called.
    final relativeProgress = progressFromStart / outlineProgressSize;
    final t = measurer.findCubicCutPoint(
      cubic,
      relativeProgress * measuredSize,
    );

    if (t < 0.0 || t > 1.0) {
      throw ArgumentError(
        "CubicBezier cut point is expected to be between 0 and 1.",
      );
    }

    // c1/c2 are the two new cubics, then we return MeasuredCubics created
    // from them.
    final (c1, c2) = cubic.split(t);
    return (
      .new(
        measurer: measurer,
        cubic: c1,
        startOutlineProgress: _startOutlineProgress,
        endOutlineProgress: boundedCutOutlineProgress,
      ),
      .new(
        measurer: measurer,
        cubic: c2,
        startOutlineProgress: boundedCutOutlineProgress,
        endOutlineProgress: _endOutlineProgress,
      ),
    );
  }

  @override
  String toString() =>
      "MeasuredCubic(outlineProgress="
      "[$_startOutlineProgress .. $_endOutlineProgress], "
      "size=$measuredSize, cubic=$cubic)";
}

/// Interface for measuring a cubic. Implementations can use whatever algorithm
/// desired to produce these measurement values.
@internal
abstract interface class const Measurer() {
  /// Abstract const constructor.
  this;

  /// Returns size of given cubic, according to however the implementation
  /// wants to measure the size (angle, length, etc). It has to be greater or
  /// equal to 0.
  double measureCubic(CubicBezier cubic);

  /// Given a cubic and a measure that should be between 0 and the value
  /// returned by [measureCubic] (if not, it will be capped), finds the
  /// parameter t of the cubic at which that measure is reached.
  double findCubicCutPoint(CubicBezier cubic, double measure);
}

/// Approximates the arc lengths of cubics by splitting the arc into segments
/// and calculating their sizes. The more segments, the more accurate the
/// result will be to the true arc length. The default implementation has at
/// least 98.5% accuracy on the case of a circular arc, which is the
/// worst case for our standard shapes.
@internal
class const LengthMeasurer() implements Measurer {
  /// Creates a [LengthMeasurer].
  this;

  // The minimum number needed to achieve up to 98.5% accuracy from the true
  // arc length.
  static const _segments = 3;

  @override
  double measureCubic(CubicBezier cubic) =>
      _closestProgressTo(cubic, .infinity).$2;

  @override
  double findCubicCutPoint(CubicBezier cubic, double measure) =>
      _closestProgressTo(cubic, measure).$1;

  (double, double) _closestProgressTo(CubicBezier cubic, double threshold) {
    if (threshold <= 0.0) {
      return (0.0, 0.0);
    }

    var total = 0.0;
    var remainder = threshold;
    var prevX = cubic.anchor0X;
    var prevY = cubic.anchor0Y;

    for (var i = 1; i <= _segments; i++) {
      final progress = i / _segments;
      final x = cubic.pointAtX(progress);
      final y = cubic.pointAtY(progress);
      final dx = x - prevX;
      final dy = y - prevY;
      final segment = math.sqrt(dx * dx + dy * dy);

      if (segment >= remainder) {
        return (progress - (1.0 - remainder / segment) / _segments, threshold);
      }

      remainder -= segment;
      total += segment;
      prevX = x;
      prevY = y;
    }

    return (1.0, total);
  }
}
