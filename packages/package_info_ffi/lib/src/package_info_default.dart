import 'package:package_info_ffi/package_info_ffi_platform_interface.dart';

class PackageInfoDefault extends PackageInfoPlatform {
  @override
  PackageInfoData packageInfo({String? baseUrl}) => .from(
    appName: "",
    packageName: "",
    version: "",
    buildNumber: "",
    buildSignature: "",
  );
}
