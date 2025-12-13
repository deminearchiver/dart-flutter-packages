import 'dart:convert';
import 'dart:io';

import 'package:package_info_ffi/package_info_ffi_platform_interface.dart';
import 'package:path/path.dart' as path;

class PackageInfoLinux extends PackageInfoPlatform {
  PackageInfoLinux();

  PackageInfoData? _cachedLinuxPackageInfo;

  @override
  PackageInfoData packageInfo({String? baseUrl}) =>
      _cachedLinuxPackageInfo ??= _packageInfo();

  static void registerWith() {
    PackageInfoPlatform.instance = PackageInfoLinux();
  }

  static PackageInfoData _packageInfo() {
    final exePath = File("/proc/self/exe").resolveSymbolicLinksSync();
    final versionJson = _getVersionJson(exePath);
    final exeAttributes = _getExeAttributes(exePath);
    return .from(
      appName: versionJson["app_name"] ?? "",
      version: versionJson["version"] ?? "",
      buildNumber: versionJson["build_number"] ?? "",
      packageName: versionJson["package_name"] ?? "",
      buildSignature: "",
      installTime: exeAttributes.created,
      updateTime: exeAttributes.modified,
    );
  }

  static Map<String, dynamic> _getVersionJson(String exePath) {
    try {
      final appPath = path.dirname(exePath);
      final assetPath = path.join(appPath, "data", "flutter_assets");
      final versionPath = path.join(assetPath, "version.json");
      return jsonDecode(File(versionPath).readAsStringSync());
    } catch (_) {
      return <String, dynamic>{};
    }
  }

  static ({DateTime? created, DateTime? modified}) _getExeAttributes(
    String exePath,
  ) {
    try {
      final statResult = Process.runSync(
        "stat",
        // birth time and last modification time
        ["-c", "%W,%Y", exePath],
        stdoutEncoding: utf8,
      );

      if (statResult.exitCode != 0) {
        return _fallbackAttributes(exePath);
      }

      final String stdout = statResult.stdout is String
          ? statResult.stdout
          : "";

      if (stdout.split(",").length != 2) {
        return _fallbackAttributes(exePath);
      }

      final [creationMillis, modificationMillis] = stdout.split(",");

      // birth time is 0 if it is unknown
      final creationTime = _parseSecondsString(
        creationMillis,
        allowZero: false,
      );
      final modificationTime = _parseSecondsString(modificationMillis);

      return (created: creationTime, modified: modificationTime);
    } catch (_) {
      return (created: null, modified: null);
    }
  }

  static ({DateTime created, DateTime modified}) _fallbackAttributes(
    String exePath,
  ) {
    final modifiedTime = File(exePath).lastModifiedSync();
    return (created: modifiedTime, modified: modifiedTime);
  }

  static DateTime? _parseSecondsString(
    String? secondsString, {
    bool allowZero = true,
  }) {
    if (secondsString == null) return null;
    final millis = int.tryParse(secondsString);
    if (millis == null || millis == 0 && !allowZero) return null;
    return DateTime.fromMillisecondsSinceEpoch(millis * 1000);
  }
}
