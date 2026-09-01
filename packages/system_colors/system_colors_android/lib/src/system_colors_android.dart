import 'package:system_colors_android/src/jni_bindings.g.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

class SystemColorsAndroid() extends SystemColorsPlatform {
  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsAndroid();
  }
}

// /// Set the luminance (tone) of this color. Chroma may decrease because chroma
// /// has a different maximum for any given hue and luminance.
// int _setLuminance(int argb, double newLuminance) {
//   if (newLuminance < 0.0001 || newLuminance > 99.9999) {
//     return ColorUtils.argbFromLstar(newLuminance);
//   }
//   // Base color.
//   final baseCam = Cam16.fromInt(argb);
//   return Cam16.getInt(baseCam.hue, baseCam.chroma, newLuminance);
// }
