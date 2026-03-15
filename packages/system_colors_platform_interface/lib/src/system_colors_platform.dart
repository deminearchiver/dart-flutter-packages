import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract class SystemColorsPlatform extends PlatformInterface {
  SystemColorsPlatform() : super(token: _token);

  SystemColorScheme defaultColorScheme() {
    throw UnimplementedError("defaultColorScheme() has not been implemented.");
  }

  static final _token = Object();

  static SystemColorsPlatform _instance = SystemColorsDefault();

  static SystemColorsPlatform get instance => _instance;

  static set instance(SystemColorsPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }
}
