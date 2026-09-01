import 'dart:math' as math;

import 'package:material/material_color_utilities.dart'
    show PointProvider, PointProviderLab, Quantizer, QuantizerResult;

/// An image quantizer that improves on the speed of a standard K-Means
/// algorithm by implementing several optimizations, including deduping
/// identical pixels and a triangle inequality rule that reduces the number
/// of comparisons needed to identify which cluster a point should be moved to.
///
/// Wsmeans stands for Weighted Square Means.
///
/// This algorithm was designed by M. Emre Celebi,
/// and was found in their 2011 paper,
/// Improving the Performance of K-Means for Color Quantization.
/// https://arxiv.org/abs/1101.0395
final class const QuantizerWsmeans() implements Quantizer {
  /// Reduce the number of colors needed to represented the input, minimizing
  /// the difference between the original image and the recolored image.
  ///
  /// Returns a [Map] with keys of colors in ARGB format,
  /// values of how many of the input pixels belong to the color.
  @override
  QuantizerResult quantize(
    List<int> inputPixels,
    int maxColors, {
    List<int> startingClusters = const [],
    int maxIterations = 5,
    bool returnInputPixelToClusterPixel = false,
  }) {
    const pointProvider = PointProviderLab();
    final pixelToCount = <int, int>{};
    final points = <(double, double, double)>[];
    final pixels = <int>[];
    var pointCount = 0;
    for (final inputPixel in inputPixels) {
      final pixelCount = pixelToCount.update(
        inputPixel,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
      if (pixelCount == 1) {
        pointCount++;
        points.add(pointProvider.fromInt(inputPixel));
        pixels.add(inputPixel);
      }
    }

    final counts = List<int>.filled(pointCount, 0);
    for (var i = 0; i < pointCount; i++) {
      final pixel = pixels[i];
      final count = pixelToCount[pixel]!;
      counts[i] = count;
    }

    final clusterCount = math.min(maxColors, pointCount);

    final clusters = startingClusters
        .map((e) => pointProvider.fromInt(e))
        .toList();
    final additionalClustersNeeded = clusterCount - clusters.length;
    if (additionalClustersNeeded > 0) {
      final random = math.Random(0x42688);
      final indices = <int>[];
      for (var i = 0; i < additionalClustersNeeded; i++) {
        // Use existing points rather than generating random centroids.
        //
        // KMeans is extremely sensitive to initial clusters. This quantizer
        // is meant to be used with a Wu quantizer that provides initial
        // centroids, but Wu is very slow on unscaled images and when extracting
        // more than 256 colors.
        //
        // Here, we can safely assume that more than 256 colors were requested
        // for extraction. Generating random centroids tends to lead to many
        // "empty" centroids, as the random centroids are nowhere near any pixels
        // in the image, and the centroids from Wu are very refined and close
        // to pixels in the image.
        //
        // Rather than generate random centroids, we'll pick centroids that
        // are actual pixels in the image, and avoid duplicating centroids.

        var index = random.nextInt(points.length);
        while (indices.contains(index)) {
          index = random.nextInt(points.length);
        }
        indices.add(index);
      }

      for (final index in indices) {
        clusters.add(points[index]);
      }
    }

    final clusterIndices = List<int>.generate(
      pointCount,
      (index) => index % clusterCount,
    );
    final indexMatrix = List<List<int>>.generate(
      clusterCount,
      (_) => List.filled(clusterCount, 0),
    );

    final distanceToIndexMatrix = List<List<_DistanceAndIndex>>.generate(
      clusterCount,
      (index) => List<_DistanceAndIndex>.generate(
        clusterCount,
        (index) => _DistanceAndIndex(distance: 0.0, index: index),
      ),
    );

    final pixelCountSums = List<int>.filled(clusterCount, 0);
    for (var iteration = 0; iteration < maxIterations; iteration++) {
      var pointsMoved = 0;
      for (var i = 0; i < clusterCount; i++) {
        for (var j = i + 1; j < clusterCount; j++) {
          final distance = pointProvider.distance(clusters[i], clusters[j]);
          distanceToIndexMatrix[j][i].distance = distance;
          distanceToIndexMatrix[j][i].index = i;
          distanceToIndexMatrix[i][j].distance = distance;
          distanceToIndexMatrix[i][j].index = j;
        }
        distanceToIndexMatrix[i].sort();
        for (var j = 0; j < clusterCount; j++) {
          indexMatrix[i][j] = distanceToIndexMatrix[i][j].index;
        }
      }

      for (var i = 0; i < pointCount; i++) {
        final point = points[i];
        final previousClusterIndex = clusterIndices[i];
        final previousCluster = clusters[previousClusterIndex];
        final previousDistance = pointProvider.distance(point, previousCluster);
        var minimumDistance = previousDistance;
        var newClusterIndex = -1;
        for (var j = 0; j < clusterCount; j++) {
          if (distanceToIndexMatrix[previousClusterIndex][j].distance >=
              4 * previousDistance) {
            continue;
          }
          final distance = pointProvider.distance(point, clusters[j]);
          if (distance < minimumDistance) {
            minimumDistance = distance;
            newClusterIndex = j;
          }
        }
        if (newClusterIndex != -1) {
          pointsMoved++;
          clusterIndices[i] = newClusterIndex;
        }
      }

      if (pointsMoved == 0 && iteration > 0) {
        break;
      }

      final componentASums = List<double>.filled(clusterCount, 0);
      final componentBSums = List<double>.filled(clusterCount, 0);
      final componentCSums = List<double>.filled(clusterCount, 0);

      for (var i = 0; i < clusterCount; i++) {
        pixelCountSums[i] = 0;
      }
      for (var i = 0; i < pointCount; i++) {
        final clusterIndex = clusterIndices[i];
        final point = points[i];
        final count = counts[i];
        pixelCountSums[clusterIndex] += count;
        componentASums[clusterIndex] += point.$1 * count;
        componentBSums[clusterIndex] += point.$2 * count;
        componentCSums[clusterIndex] += point.$3 * count;
      }
      for (var i = 0; i < clusterCount; i++) {
        final count = pixelCountSums[i];
        if (count == 0) {
          clusters[i] = (0.0, 0.0, 0.0);
          continue;
        }
        final a = componentASums[i] / count;
        final b = componentBSums[i] / count;
        final c = componentCSums[i] / count;
        clusters[i] = (a, b, c);
      }
    }

    final clusterArgbs = <int>[];
    final clusterPopulations = <int>[];
    for (var i = 0; i < clusterCount; i++) {
      final count = pixelCountSums[i];
      if (count == 0) {
        continue;
      }

      final possibleNewCluster = pointProvider.toInt(clusters[i]);
      if (clusterArgbs.contains(possibleNewCluster)) {
        continue;
      }

      clusterArgbs.add(possibleNewCluster);
      clusterPopulations.add(count);
    }

    final inputPixelToClusterPixel = <int, int>{};
    if (returnInputPixelToClusterPixel) {
      for (var i = 0; i < pixels.length; i++) {
        final inputPixel = pixels[i];
        final clusterIndex = clusterIndices[i];
        final cluster = clusters[clusterIndex];
        final clusterPixel = pointProvider.toInt(cluster);
        inputPixelToClusterPixel[inputPixel] = clusterPixel;
      }
    }

    return QuantizerResult(
      colorToCount: Map.fromIterables(clusterArgbs, clusterPopulations),
      inputPixelToClusterPixel: inputPixelToClusterPixel,
    );
  }
}

class _DistanceAndIndex implements Comparable<_DistanceAndIndex> {
  _DistanceAndIndex({required this.distance, required this.index});

  double distance;
  int index;

  @override
  int compareTo(_DistanceAndIndex other) => distance.compareTo(other.distance);
}
