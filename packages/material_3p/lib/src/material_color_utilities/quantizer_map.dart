import 'package:material_3p/material_color_utilities.dart';

/// Creates a dictionary with keys of colors, and values of count of the color.
final class QuantizerMap implements Quantizer {
  const QuantizerMap();

  @override
  QuantizerResult quantize(List<int> pixels, int maxColors) {
    final pixelByCount = <int, int>{};
    for (final pixel in pixels) {
      final alpha = ColorUtils.alphaFromArgb(pixel);
      if (alpha < 255) continue;
      pixelByCount.update(
        pixel,
        (currentPixelCount) => currentPixelCount + 1,
        ifAbsent: () => 1,
      );
    }
    return QuantizerResult(colorToCount: pixelByCount);
  }
}
