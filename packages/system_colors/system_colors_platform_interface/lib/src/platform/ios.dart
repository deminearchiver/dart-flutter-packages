import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsIosPlatform extends SystemColorsPlatform {
  SystemColorsIosPlatform();

  static SystemColorsIosPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsIosPlatform ? instance : null;
  }

  static set instance(SystemColorsIosPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
