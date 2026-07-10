import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsAndroidPlatform extends SystemColorsPlatform {
  SystemColorsAndroidPlatform();

  bool get isDynamicColorAvailable {
    throw UnimplementedError(
      "isDynamicColorAvailable has not been implemented.",
    );
  }

  static SystemColorsAndroidPlatform? get instance {
    final instance = SystemColorsPlatform.instance;
    return instance is SystemColorsAndroidPlatform ? instance : null;
  }

  static set instance(SystemColorsAndroidPlatform instance) {
    SystemColorsPlatform.instance = instance;
  }
}
