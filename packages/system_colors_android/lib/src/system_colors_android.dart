import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

import 'jni_bindings.g.dart' as jb;

class SystemColorsAndroid extends SystemColorsPlatform {
  SystemColorsAndroid();

  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsAndroid();
  }
}
