import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsWebPlatform extends SystemColorsPlatform {
  SystemColorsWebPlatform();

  static SystemColorsWebPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsWebPlatform ? instance : null;
  }

  static set instance(SystemColorsWebPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
