import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsLinuxPlatform extends SystemColorsPlatform {
  SystemColorsLinuxPlatform();

  static SystemColorsLinuxPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsLinuxPlatform ? instance : null;
  }

  static set instance(SystemColorsLinuxPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
