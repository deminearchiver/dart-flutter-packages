import 'package:device_info_ffi/device_info_ffi.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';

class DeviceInfoLinux extends DeviceInfoPlatform {
  final FileSystem _fileSystem = const LocalFileSystem();

  LinuxDeviceInfo? _cachedLinuxDeviceInfo;

  LinuxDeviceInfo _getInfo() {
    final os = _getOsRelease() ?? const {};
    final lsb = _getLsbRelease() ?? const {};
    final machineId = _getMachineId();
    return LinuxDeviceInfo(
      name: os["NAME"] ?? "Linux",
      version: os["VERSION"] ?? lsb["LSB_VERSION"],
      id: os["ID"] ?? lsb["DISTRIB_ID"] ?? "linux",
      idLike: os["ID_LIKE"]?.split(" "),
      versionCodename: os["VERSION_CODENAME"] ?? lsb["DISTRIB_CODENAME"],
      versionId: os["VERSION_ID"] ?? lsb["DISTRIB_RELEASE"],
      prettyName: os["PRETTY_NAME"] ?? lsb["DISTRIB_DESCRIPTION"] ?? "Linux",
      buildId: os["BUILD_ID"],
      variant: os["VARIANT"],
      variantId: os["VARIANT_ID"],
      machineId: machineId,
    );
  }

  Map<String, String?>? _getOsRelease() =>
      _tryReadKeyValues("/etc/os-release") ??
      _tryReadKeyValues("/usr/lib/os-release");

  Map<String, String?>? _getLsbRelease() =>
      _tryReadKeyValues("/etc/lsb-release");

  String? _getMachineId() => _tryReadValue("/etc/machine-id");

  String? _tryReadValue(String path) {
    try {
      return _fileSystem.file(path).readAsStringSync().trim();
    } on Object catch (_) {
      return null;
    }
  }

  Map<String, String?>? _tryReadKeyValues(String path) {
    try {
      return _fileSystem.file(path).readAsLinesSync()._toKeyValues();
    } on Object catch (_) {
      return null;
    }
  }

  @override
  LinuxDeviceInfo deviceInfo() => _cachedLinuxDeviceInfo ??= _getInfo();

  static void registerWith() {
    DeviceInfoPlatform.instance = DeviceInfoLinux();
  }
}

extension on String {
  String _removePrefix(String prefix) =>
      startsWith(prefix) ? substring(prefix.length) : this;

  String _removeSuffix(String suffix) =>
      endsWith(suffix) ? substring(0, length - suffix.length) : this;

  String _unquote() => _removePrefix("\"")._removeSuffix("\"");
}

extension on List<String> {
  Map<String, String?> _toKeyValues() => Map.fromEntries(
    map((line) {
      final parts = line.split("=");
      if (parts.length != 2) return MapEntry(line, null);
      return MapEntry(parts.first, parts.last._unquote());
    }),
  );
}
