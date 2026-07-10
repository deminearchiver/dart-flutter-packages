import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsMacosPlatform extends SystemColorsPlatform {
  SystemColorsMacosPlatform();

  static SystemColorsMacosPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsMacosPlatform ? instance : null;
  }

  static set instance(SystemColorsMacosPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
