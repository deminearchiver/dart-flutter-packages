import 'package:permissions_ffi/permissions_ffi.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class PermissionsPlatform extends PlatformInterface {
  PermissionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PermissionsPlatform _instance = PermissionsDefault();

  static PermissionsPlatform get instance => _instance;

  static set instance(PermissionsPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }
}
