part of 'system_colors_android.dart';

extension on Color {
  Color _withLuminance(double newLuminance) {
    assert(newLuminance >= 0.0 && newLuminance <= 100.0);
    if (newLuminance < 0.0001 || newLuminance > 99.9999) {
      return Color(ColorUtils.argbFromLstar(newLuminance));
    }
    final baseCam = Cam16.fromInt(toARGB32());
    final baseColor = Cam16.getInt(baseCam.hue, baseCam.chroma, newLuminance);
    return Color(baseColor);
  }
}
