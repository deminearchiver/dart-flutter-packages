import 'dart:io';

import 'package:package_info_ffi/package_info_ffi_platform_interface.dart';

import 'file_attribute.dart';
import 'file_version_info.dart';

class PackageInfoWindows extends PackageInfoPlatform {
  PackageInfoWindows();

  PackageInfoData? _cachedWindowsPackageInfo;

  @override
  PackageInfoData packageInfo({String? baseUrl}) =>
      _cachedWindowsPackageInfo ??= _packageInfo();

  static void registerWith() {
    PackageInfoPlatform.instance = PackageInfoWindows();
  }

  static PackageInfoData _packageInfo() {
    String resolvedExecutable = Platform.resolvedExecutable;

    /// Workaround for https://github.com/dart-lang/sdk/issues/52309
    if (resolvedExecutable.startsWith(r"UNC\")) {
      resolvedExecutable = resolvedExecutable.replaceFirst(r"UNC\", r"\\");
    }

    final info = FileVersionInfo(resolvedExecutable);
    final attributes = FileAttributes(resolvedExecutable);
    final versions = info.productVersion.split('+');
    final data = PackageInfoData.from(
      appName: info.productName,
      packageName: info.internalName,
      version: versions.elementAtOrNull(0) ?? '',
      buildNumber: versions.elementAtOrNull(1) ?? '',
      buildSignature: '',
      installTime: attributes.creationTime ?? attributes.lastWriteTime,
      updateTime: attributes.lastWriteTime,
    );
    info.dispose();
    return data;
  }
}
