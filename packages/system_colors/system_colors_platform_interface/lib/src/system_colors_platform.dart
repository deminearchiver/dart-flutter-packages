import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class SystemColorsPlatform() extends PlatformInterface {
  this : super(token: _token);

  static final _token = Object();

  static SystemColorsPlatform _instance = SystemColorsDefault();

  static SystemColorsPlatform get instance => _instance;

  static set instance(SystemColorsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}

class SystemColorsDefault() extends SystemColorsPlatform {}
