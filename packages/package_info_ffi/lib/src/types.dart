/// Package info data.
abstract class PackageInfoData {
  const PackageInfoData();

  /// Constructs an instance with the given values for testing. [PackageInfoData]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  const factory PackageInfoData.from({
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String buildSignature,
    String? installerStore,
    DateTime? installTime,
    DateTime? updateTime,
  }) = _PackageInfoData;

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  String get appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  String get packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  String get version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  String get buildNumber;

  /// The build signature. Contains the signing key signature (hex) on Android and empty string on everything else.
  String get buildSignature;

  /// The installer store. Indicates through which store this application was installed.
  String? get installerStore;

  /// The time when the application was installed.
  ///
  /// - On Android, returns `PackageManager.firstInstallTime`
  /// - On iOS, return the creation date of the app default `NSDocumentDirectory`
  /// - On macOS, if the app is running in sandbox, return the creation date of the app default `NSDocumentDirectory`;
  ///   If the app is not running in sandbox, return the last modified date of the app main bundle
  /// - On Windows and Linux, returns the creation date of the app executable.
  ///   If the creation date is not available, returns the last modified date of the app executable.
  ///   If the last modified date is not available, returns `null`.
  /// - On web, returns `null`.
  DateTime? get installTime;

  /// The time when the application was last updated.
  ///
  /// - On Android, returns `PackageManager.lastUpdateTime`
  /// - On iOS and macOS, return the last modified date of the app main bundle
  /// - On Windows and Linux, returns the last modified date of the app executable.
  ///   If the last modified date is not available, returns `null`.
  /// - On web, returns `null`.
  DateTime? get updateTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is PackageInfoData &&
          appName == other.appName &&
          packageName == other.packageName &&
          version == other.version &&
          buildNumber == other.buildNumber &&
          buildSignature == other.buildSignature &&
          installerStore == other.installerStore &&
          installTime == other.installTime &&
          updateTime == other.updateTime;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    appName,
    packageName,
    version,
    buildNumber,
    buildSignature,
    installerStore,
    installTime,
    updateTime,
  );
}

class _PackageInfoData extends PackageInfoData {
  const _PackageInfoData({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    this.installerStore,
    this.installTime,
    this.updateTime,
  });

  @override
  final String appName;

  @override
  final String packageName;

  @override
  final String version;

  @override
  final String buildNumber;

  @override
  final String buildSignature;

  @override
  final String? installerStore;

  @override
  final DateTime? installTime;

  @override
  final DateTime? updateTime;
}
