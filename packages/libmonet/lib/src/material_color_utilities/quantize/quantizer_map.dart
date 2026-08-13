import 'quantizer.dart';

/// Creates a dictionary with keys of colors, and values of count of the color.
final class const QuantizerMap() implements Quantizer {
  @override
  QuantizerResult quantize(List<int> pixels, int maxColors) {
    final pixelByCount = <int, int>{};
    for (final pixel in pixels) {
      pixelByCount.update(
        pixel,
        (currentPixelCount) => currentPixelCount + 1,
        ifAbsent: () => 1,
      );
    }
    return QuantizerResult(colorToCount: pixelByCount);
  }
}
