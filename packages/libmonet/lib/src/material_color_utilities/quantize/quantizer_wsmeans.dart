import 'dart:math' as math;

import 'point_provider_lab.dart';
import 'quantizer.dart';

const _maxIterations = 10;
const _minMovementDistance = 3.0;

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
  }) {
    final random = math.Random(0x42688);

    final pixelToCount = <int, int>{};
    final points = List<List<double>>.generate(
      inputPixels.length,
      (index) => [],
    );
    final pixels = List<int>.filled(inputPixels.length, 0);
    const pointProvider = PointProviderLab();

    var pointCount = 0;
    for (final inputPixel in inputPixels) {
      pixelToCount.update(
        inputPixel,
        (value) => value + 1,
        ifAbsent: () {
          points[pointCount] = pointProvider.fromInt(inputPixel);
          pixels[pointCount] = inputPixel;
          pointCount++;
          return 1;
        },
      );
    }

    final counts = List<int>.filled(pointCount, 0);
    for (var i = 0; i < pointCount; i++) {
      final pixel = pixels[i];
      final count = pixelToCount[pixel];
      assert(count != null);
      counts[i] = count!;
    }

    var clusterCount = math.min(maxColors, pointCount);
    if (startingClusters.isNotEmpty) {
      clusterCount = math.min(clusterCount, startingClusters.length);
    }

    final clusters = startingClusters
        .map((startingCluster) => pointProvider.fromInt(startingCluster))
        .toList();
    final clustersCreated = clusters.length;

    final additionalClustersNeeded = clusterCount - clustersCreated;
    if (additionalClustersNeeded > 0) {
      for (var i = 0; i < additionalClustersNeeded; i++) {
        // TODO(deminearchiver): implement (Java and Kotlin implementation missing)
      }
    }

    final clusterIndices = List<int>.generate(
      pointCount,
      (_) => random.nextInt(clusterCount),
    );

    final indexMatrix = List.generate(
      clusterCount,
      (index) => List<int>.filled(clusterCount, 0),
    );

    final distanceToIndexMatrix = List<List<_Distance>>.generate(
      clusterCount,
      (index) => List.generate(clusterCount, (_) => _Distance()),
    );

    var pixelCountSums = <int>[];
    for (var iteration = 0; iteration < _maxIterations; iteration++) {
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

      var pointsMoved = 0;
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
          final distanceChange =
              (math.sqrt(minimumDistance) - math.sqrt(previousDistance)).abs();
          if (distanceChange > _minMovementDistance) {
            pointsMoved++;
            clusterIndices[i] = newClusterIndex;
          }
        }
      }
      if (pointsMoved == 0 && iteration != 0) {
        break;
      }

      final componentASums = List<double>.filled(clusterCount, 0.0);
      final componentBSums = List<double>.filled(clusterCount, 0.0);
      final componentCSums = List<double>.filled(clusterCount, 0.0);
      pixelCountSums = List.filled(clusterCount, 0);
      for (var i = 0; i < pointCount; i++) {
        final clusterIndex = clusterIndices[i];
        final point = points[i];
        final count = counts[i];
        pixelCountSums[clusterIndex] += count;
        componentASums[clusterIndex] += point[0] * count;
        componentBSums[clusterIndex] += point[1] * count;
        componentCSums[clusterIndex] += point[2] * count;
      }

      for (var i = 0; i < clusterCount; i++) {
        final count = pixelCountSums[i];
        if (count == 0) {
          clusters[i] = [0.0, 0.0, 0.0];
          continue;
        }
        final a = componentASums[i] / count;
        final b = componentBSums[i] / count;
        final c = componentCSums[i] / count;
        clusters[i][0] = a;
        clusters[i][1] = b;
        clusters[i][2] = c;
      }
    }
    final argbToPopulation = <int, int>{};
    for (var i = 0; i < clusterCount; i++) {
      final count = pixelCountSums[i];
      if (count == 0) {
        continue;
      }

      final possibleNewCluster = pointProvider.toInt(clusters[i]);
      if (argbToPopulation.containsKey(possibleNewCluster)) {
        continue;
      }

      argbToPopulation[possibleNewCluster] = count;
    }
    return QuantizerResult(colorToCount: argbToPopulation);
  }
}

class _Distance() implements Comparable<_Distance> {
  int index = -1;
  double distance = -1.0;

  @override
  int compareTo(_Distance other) => distance.compareTo(other.distance);
}
