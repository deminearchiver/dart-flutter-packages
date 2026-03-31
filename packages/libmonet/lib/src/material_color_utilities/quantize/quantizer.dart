import 'package:collection/collection.dart';

abstract interface class Quantizer {
  QuantizerResult quantize(List<int> pixels, int maxColors);
}

/// Represents the result of a quantizer run.
final class QuantizerResult {
  const QuantizerResult({
    required this.colorToCount,
    this.inputPixelToClusterPixel = const {},
  });

  final Map<int, int> colorToCount;
  final Map<int, int> inputPixelToClusterPixel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuantizerResult &&
          _mapEquality.equals(colorToCount, other.colorToCount) &&
          _mapEquality.equals(
            inputPixelToClusterPixel,
            other.inputPixelToClusterPixel,
          );

  @override
  int get hashCode => _mapEquality.hash(colorToCount);

  static const _mapEquality = MapEquality<int, int>();
}
