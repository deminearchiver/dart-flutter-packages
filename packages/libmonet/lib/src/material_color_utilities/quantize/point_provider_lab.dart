import '../utils/color_utils.dart';

import 'point_provider.dart';

/// Provides conversions needed for K-Means quantization.
/// Converting input to points, and converting the final state of the
/// K-Means algorithm to colors.
final class const PointProviderLab()
    implements PointProvider<(double, double, double)> {
  /// Convert a color represented in ARGB to a 3-element array
  /// of L*a*b* coordinates of the color.
  @override
  (double, double, double) fromInt(int argb) => ColorUtils.labFromArgb(argb);

  /// Convert a 3-element array to a color represented in ARGB.
  @override
  int toInt((double, double, double) lab) =>
      ColorUtils.argbFromLab(lab.$1, lab.$2, lab.$3);

  /// Standard CIE 1976 delta E formula also takes the square root,
  /// unneeded here. This method is used by quantization algorithms to compare
  /// distance, and the relative ordering is the same, with or without
  /// a square root.
  ///
  /// This relatively minor optimization is helpful
  /// because this method is called at least once for each pixel in an image.
  @override
  double distance((double, double, double) one, (double, double, double) two) {
    final dL = one.$1 - two.$1;
    final dA = one.$2 - two.$2;
    final dB = one.$3 - two.$3;
    return dL * dL + dA * dA + dB * dB;
  }
}
