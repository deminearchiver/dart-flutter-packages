import 'quantizer_wsmeans.dart';
import 'quantizer_wu.dart';
import 'quantizer.dart';

/// An image quantizer that improves on the quality of a standard
/// K-Means algorithm by setting the K-Means initial state to the output of a
/// Wu quantizer, instead of random centroids. Improves on speed by several
/// optimizations, as implemented in Wsmeans, or Weighted Square Means,
/// K-Means with those optimizations.
///
/// This algorithm was designed by M. Emre Celebi,
/// and was found in their 2011 paper,
/// Improving the Performance of K-Means for Color Quantization.
/// https://arxiv.org/abs/1101.0395
final class QuantizerCelebi implements Quantizer {
  const QuantizerCelebi();

  /// Reduce the number of colors needed to represented the input, minimizing
  /// the difference between the original image and the recolored image.
  ///
  /// Returns a [Map] with keys of colors in ARGB format,
  /// and values of number of pixels in the original image that correspond
  /// to the color in the quantized image.
  @override
  QuantizerResult quantize(List<int> pixels, int maxColors) {
    final wu = QuantizerWu();
    final wuResult = wu.quantize(pixels, maxColors);
    final wuClusters = wuResult.colorToCount.keys.toList();
    const wsmeans = QuantizerWsmeans();
    return wsmeans.quantize(pixels, maxColors, startingClusters: wuClusters);
  }
}
