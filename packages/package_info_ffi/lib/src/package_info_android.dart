import 'package:jni/jni.dart';
import 'package:package_info_ffi/package_info_ffi_platform_interface.dart';

import 'jni_bindings.dart' as jb;

class PackageInfoAndroid extends PackageInfoPlatform {
  PackageInfoAndroid();

  PackageInfoData? _cachedAndroidPackageInfo;

  @override
  PackageInfoData packageInfo({String? baseUrl}) =>
      _cachedAndroidPackageInfo ??= _packageInfo();

  static void registerWith() {
    PackageInfoPlatform.instance = PackageInfoAndroid();
  }

  static PackageInfoData _packageInfo() => Jni.androidApplicationContext
      .use(jb.PackageInfoPlugin.getPackageInfo)
      .use(_packageInfoFromNative);

  static PackageInfoData _packageInfoFromNative(
    jb.PackageInfoData object,
  ) => .from(
    appName: object.getAppName().toDartString(releaseOriginal: true),
    packageName: object.getPackageName().toDartString(releaseOriginal: true),
    version: object.getVersion().toDartString(releaseOriginal: true),
    buildNumber: object.getBuildNumber().toDartString(releaseOriginal: true),
    buildSignature:
        object.getBuildSignature()?.toDartString(releaseOriginal: true) ?? "",
    installerStore: object.getInstallerStore()?.toDartString(
      releaseOriginal: true,
    ),
    installTime: .fromMillisecondsSinceEpoch(object.getInstallTime()),
    updateTime: .fromMicrosecondsSinceEpoch(object.getUpdateTime()),
  );
}
