// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// @docImport 'morph.dart';
library;

import 'package:flutter/foundation.dart';

import 'cubic.dart';
import 'point.dart';

/// While a polygon's shape can be drawn solely using a list of [CubicBezier]
/// objects representing its raw curves and lines, features add an extra layer
/// of context to groups of cubics. Features group cubics into (straight) edges,
/// convex corners, or concave corners. For example, rounding a rectangle adds
/// many cubics around its edges, but the rectangle's overall number of corners
/// remains the same. [Morph] therefore uses this grouping for several reasons:
///   - Noise Reduction: Grouping cubics reduces the amount of noise introduced
///     by individual cubics (as seen in the rounded rectangle example).
///   - Mapping Base: The grouping serves as the base set for [Morph]'s mapping
///     process.
///   - Curve Type Mapping: [Morph] maps similar curve types (convex, concave)
///     together. Note that edges or features created with
///     [Feature.ignorable] are ignored in the default mapping.
///
/// By using features, you can manipulate polygon shapes with more context and
/// control.
@immutable
// ignore: prefer_const_constructors_in_immutables
abstract class Feature._(List<CubicBezier> cubics) {
  /// Creates a [Feature] spanning the given [cubics].
  ///
  /// The list is defensively copied into an unmodifiable one, so later changes
  /// to [cubics] do not affect this feature, and [Feature.cubics] can return
  /// the stored list directly instead of allocating a wrapper per call.
  this;

  /// Groups a list of [CubicBezier] objects into a feature that should be
  /// ignored in the default [Morph] mapping. The feature can have any
  /// indentation.
  ///
  /// Sometimes, it's helpful to ignore certain features when morphing shapes.
  /// This is because only the features you mark as important will be smoothly
  /// transitioned between the start and end shapes. Additionally, the default
  /// morph algorithm will try to match convex corners to convex corners and
  /// concave to concave. Marking features as ignorable will influence this
  /// matching.
  ///
  /// For example, given a 12-pointed star, marking all concave corners as
  /// ignorable will create a [Morph] that only considers the outer corners of
  /// the star. As a result, depending on the morphed to shape, the animation
  /// may have fewer intersections and rotations. Another example for the other
  /// way around is a [Morph] between a pointed up triangle to a square.
  /// Marking the square's top edge as a convex corner matches it to the
  /// triangle's upper corner. Instead of moving triangle's upper corner to one
  /// of rectangle's corners, the animation now splits the triangle to match
  /// squares' outer corners.
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics.
  factory ignorable(List<CubicBezier> cubics) =>
      _validated(EdgeFeature(cubics));

  /// Groups a [CubicBezier] object into an edge (neither inward nor outward
  /// indentation in a shape).
  factory edge(CubicBezier cubic) => EdgeFeature([cubic]);

  /// Groups a list of [CubicBezier] objects into a convex corner (outward
  /// indentation in a shape).
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics.
  factory convexCorner(List<CubicBezier> cubics) =>
      _validated(CornerFeature(cubics));

  /// Groups a list of [CubicBezier] objects into a concave corner (inward
  /// indentation in a shape).
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics.
  factory concaveCorner(List<CubicBezier> cubics) =>
      _validated(CornerFeature(cubics, convex: false));

  static Feature _validated(Feature feature) {
    if (feature.cubics.isEmpty) {
      throw ArgumentError("Features need at least one cubic.");
    }

    if (!_isContinuous(feature)) {
      throw ArgumentError(
        "Feature must be continuous, with the anchor points of all cubics "
        "matching the anchor points of the preceding and succeeding cubics",
      );
    }

    return feature;
  }

  static bool _isContinuous(Feature feature) {
    const distanceEpsilon = 1e-5;
    var prevCubic = feature.cubics.first;
    for (var i = 1; i < feature.cubics.length; i++) {
      final cubic = feature.cubics[i];
      if ((cubic.anchor0X - prevCubic.anchor1X).abs() > distanceEpsilon ||
          (cubic.anchor0Y - prevCubic.anchor1Y).abs() > distanceEpsilon) {
        return false;
      }
      prevCubic = cubic;
    }
    return true;
  }

  /// The cubic curves defining this feature, as an unmodifiable list.
  final cubics = List.unmodifiableOf(cubics);

  /// Whether this Feature gets ignored in the [Morph] mapping.
  ///
  /// See [Feature.ignorable] for more details.
  bool get isIgnorable;

  /// Whether this Feature is an Edge with no inward or outward indentation.
  bool get isEdge;

  /// Whether this Feature is a corner.
  bool get isCorner;

  /// Whether this Feature is a convex corner (outward indentation in a shape).
  bool get isConvexCorner;

  /// Whether this Feature is a concave corner (inward indentation in a shape).
  bool get isConcaveCorner;

  /// Transforms the points in this [Feature] with the given [transformer] and
  /// returns a new [Feature].
  Feature transformed(PointTransformer transformer);

  /// A new [Feature] with the points that define the shape of this [Feature]
  /// in reversed order.
  Feature get reversed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is Feature &&
          listEquals(cubics, other.cubics);

  @override
  int get hashCode => Object.hashAll(cubics);
}

/// Edges have only a list of the cubic curves which make up the edge. Edges
/// lie between corners and have no vertex or concavity; the curves are simply
/// straight lines (represented by [CubicBezier] curves).
@internal
class EdgeFeature(super.cubics) extends Feature {
  /// Creates an [EdgeFeature] from the given cubics.
  this : super._();

  @override
  EdgeFeature transformed(PointTransformer transformer) =>
      .new(.generate(cubics.length, (i) => cubics[i].transformed(transformer)));

  @override
  EdgeFeature get reversed => .new(
    .generate(cubics.length, (i) => cubics[cubics.length - 1 - i].reversed),
  );

  @override
  bool get isIgnorable => true;

  @override
  bool get isEdge => true;

  @override
  bool get isCorner => false;

  @override
  bool get isConvexCorner => false;

  @override
  bool get isConcaveCorner => false;

  @override
  String toString() =>
      "${objectRuntimeType(this, "EdgeFeature")}(cubics: $cubics)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is EdgeFeature &&
          listEquals(cubics, other.cubics);

  @override
  int get hashCode => Object.hashAll(cubics);
}

/// Corners contain the list of cubic curves which describe how the corner is
/// rounded (or not), and a flag indicating whether the corner is convex. A
/// regular polygon has all convex corners, while a star polygon generally
/// (but not necessarily) has both convex (outer) and concave (inner) corners.
@internal
class CornerFeature(
  super.cubics, {

  /// Whether this corner is convex.
  final bool convex = true,
}) extends Feature {
  /// Creates a [CornerFeature] from the given cubics.
  this : super._();

  @override
  CornerFeature transformed(PointTransformer transformer) => .new(
    .generate(cubics.length, (i) => cubics[i].transformed(transformer)),
    convex: convex,
  );

  @override
  CornerFeature get reversed => .new(
    .generate(cubics.length, (i) => cubics[cubics.length - 1 - i].reversed),
    convex: !convex,
  );

  @override
  bool get isIgnorable => false;

  @override
  bool get isEdge => false;

  @override
  bool get isCorner => true;

  @override
  bool get isConvexCorner => convex;

  @override
  bool get isConcaveCorner => !convex;

  @override
  String toString() =>
      "${objectRuntimeType(this, "CornerFeature")}"
      "(cubics: $cubics, convex: $convex)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is CornerFeature &&
          listEquals(cubics, other.cubics) &&
          convex == other.convex;

  @override
  int get hashCode => Object.hash(Object.hashAll(cubics), convex);
}
