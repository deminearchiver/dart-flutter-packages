import 'package:package_info_ffi/package_info_ffi.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class PackageInfoPlatform extends PlatformInterface {
  PackageInfoPlatform() : super(token: _token);

  PackageInfoData packageInfo({String? baseUrl}) {
    throw UnimplementedError("packageInfo() has not been implemented.");
  }

  static final Object _token = Object();

  static PackageInfoPlatform _instance = PackageInfoDefault();

  static PackageInfoPlatform get instance => _instance;

  static set instance(PackageInfoPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }
}
