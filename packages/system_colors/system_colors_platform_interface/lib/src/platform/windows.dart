import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsWindowsPlatform extends SystemColorsPlatform {
  SystemColorsWindowsPlatform();

  static SystemColorsWindowsPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsWindowsPlatform ? instance : null;
  }

  static set instance(SystemColorsWindowsPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
