import 'package:jni/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';
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

  static PackageInfoData _packageInfo() => androidApplicationContext
      .use(jb.PackageInfoPlugin.getPackageInfo)
      .use(_packageInfoFromNative);

  static PackageInfoData _packageInfoFromNative(jb.PackageInfoData object) =>
      .from(
        appName: object.appName.toDartString(releaseOriginal: true),
        packageName: object.packageName.toDartString(releaseOriginal: true),
        version: object.version.toDartString(releaseOriginal: true),
        buildNumber: object.buildNumber.toDartString(releaseOriginal: true),
        buildSignature:
            object.buildSignature?.toDartString(releaseOriginal: true) ?? "",
        installerStore: object.installerStore?.toDartString(
          releaseOriginal: true,
        ),
        installTime: .fromMillisecondsSinceEpoch(object.installTime),
        updateTime: .fromMicrosecondsSinceEpoch(object.updateTime),
      );
}
