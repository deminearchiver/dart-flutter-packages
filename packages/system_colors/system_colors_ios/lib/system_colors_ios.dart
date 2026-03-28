library;

import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

class SystemColorsIos extends SystemColorsPlatform {
  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsIos();
  }
}
