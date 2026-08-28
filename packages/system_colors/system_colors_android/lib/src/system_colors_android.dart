import 'package:system_colors_android/src/jni_bindings.g.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

class SystemColorsAndroid() extends SystemColorsPlatform {
  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsAndroid();
  }
}
