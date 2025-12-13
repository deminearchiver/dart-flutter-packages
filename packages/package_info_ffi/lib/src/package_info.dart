import 'package:package_info_ffi/package_info_ffi.dart';

abstract class PackageInfo extends PackageInfoData {
  const PackageInfo();

  const factory PackageInfo.from(PackageInfoData data) = _PackageInfo;

  factory PackageInfo.fromPlatform({String? baseUrl}) =>
      .from(_platform.packageInfo(baseUrl: baseUrl));

  static PackageInfoPlatform get _platform => .instance;
}

class _PackageInfo extends PackageInfo {
  const _PackageInfo(this._data);

  final PackageInfoData _data;

  @override
  String get appName => _data.appName;

  @override
  String get packageName => _data.packageName;

  @override
  String get version => _data.version;

  @override
  String get buildNumber => _data.buildNumber;

  @override
  String get buildSignature => _data.buildSignature;

  @override
  String? get installerStore => _data.installerStore;

  @override
  DateTime? get installTime => _data.installTime;

  @override
  DateTime? get updateTime => _data.updateTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _PackageInfo &&
          _data == other._data;

  @override
  int get hashCode => Object.hash(runtimeType, _data);
}
