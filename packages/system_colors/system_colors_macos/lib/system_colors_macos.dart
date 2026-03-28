library;

import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

class SystemColorsMacos extends SystemColorsPlatform {
  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsMacos();
  }
}
