import 'package:flutter/foundation.dart';

abstract interface class BaseDeviceInfo {}

/// Information derived from `android.os.Build`.
///
/// See: https://developer.android.com/reference/android/os/Build.html
class AndroidDeviceInfo with Diagnosticable implements BaseDeviceInfo {
  AndroidDeviceInfo({
    required this.version,
    required this.board,
    required this.bootloader,
    required this.brand,
    required this.device,
    required this.display,
    required this.fingerprint,
    required this.hardware,
    required this.host,
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.product,
    required this.name,
    required List<String> supported32BitAbis,
    required List<String> supported64BitAbis,
    required List<String> supportedAbis,
    required this.tags,
    required this.type,
    required this.isPhysicalDevice,
    required this.freeDiskSize,
    required this.totalDiskSize,
    required List<String> systemFeatures,
    required this.isLowRamDevice,
    required this.physicalRamSize,
    required this.availableRamSize,
  }) : supported32BitAbis = List<String>.unmodifiable(supported32BitAbis),
       supported64BitAbis = List<String>.unmodifiable(supported64BitAbis),
       supportedAbis = List<String>.unmodifiable(supportedAbis),
       systemFeatures = List<String>.unmodifiable(systemFeatures);

  /// Android operating system version values derived from `android.os.Build.VERSION`.
  final AndroidBuildVersion version;

  /// The name of the underlying board, like "goldfish".
  /// https://developer.android.com/reference/android/os/Build#BOARD
  final String board;

  /// The system bootloader version number.
  /// https://developer.android.com/reference/android/os/Build#BOOTLOADER
  final String bootloader;

  /// The consumer-visible brand with which the product/hardware will be associated, if any.
  /// https://developer.android.com/reference/android/os/Build#BRAND
  final String brand;

  /// The name of the industrial design.
  /// https://developer.android.com/reference/android/os/Build#DEVICE
  final String device;

  /// A build ID string meant for displaying to the user.
  /// https://developer.android.com/reference/android/os/Build#DISPLAY
  final String display;

  /// A string that uniquely identifies this build.
  /// https://developer.android.com/reference/android/os/Build#FINGERPRINT
  final String fingerprint;

  /// The name of the hardware (from the kernel command line or /proc).
  /// https://developer.android.com/reference/android/os/Build#HARDWARE
  final String hardware;

  /// Hostname.
  /// https://developer.android.com/reference/android/os/Build#HOST
  final String host;

  /// Either a changelist number, or a label like "M4-rc20".
  /// https://developer.android.com/reference/android/os/Build#ID
  final String id;

  /// The manufacturer of the product/hardware.
  /// https://developer.android.com/reference/android/os/Build#MANUFACTURER
  final String manufacturer;

  /// The end-user-visible name for the end product.
  /// https://developer.android.com/reference/android/os/Build#MODEL
  final String model;

  /// The name of the overall product.
  /// https://developer.android.com/reference/android/os/Build#PRODUCT
  final String product;

  /// The name of the device.
  /// https://developer.android.com/reference/android/provider/Settings.Global#DEVICE_NAME
  final String name;

  /// An ordered list of 32 bit ABIs supported by this device.
  /// Available only on Android L (API 21) and newer
  /// https://developer.android.com/reference/android/os/Build#SUPPORTED_32_BIT_ABIS
  final List<String> supported32BitAbis;

  /// An ordered list of 64 bit ABIs supported by this device.
  /// Available only on Android L (API 21) and newer
  /// https://developer.android.com/reference/android/os/Build#SUPPORTED_64_BIT_ABIS
  final List<String> supported64BitAbis;

  /// An ordered list of ABIs supported by this device.
  /// Available only on Android L (API 21) and newer
  /// https://developer.android.com/reference/android/os/Build#SUPPORTED_ABIS
  final List<String> supportedAbis;

  /// Comma-separated tags describing the build, like "unsigned,debug".
  /// https://developer.android.com/reference/android/os/Build#TAGS
  final String tags;

  /// The type of build, like "user" or "eng".
  /// https://developer.android.com/reference/android/os/Build#TYPE
  final String type;

  /// `false` if the application is running in an emulator, `true` otherwise.
  final bool isPhysicalDevice;

  /// Available disk size in bytes
  ///
  /// https://developer.android.com/reference/android/os/StatFs#getFreeBytes()
  final int freeDiskSize;

  /// Total disk size in bytes
  ///
  /// https://developer.android.com/reference/android/os/StatFs#getTotalBytes()
  final int totalDiskSize;

  /// Describes what features are available on the current device.
  ///
  /// This can be used to check if the device has, for example, a front-facing
  /// camera, or a touchscreen. However, in many cases this is not the best
  /// API to use. For example, if you are interested in bluetooth, this API
  /// can tell you if the device has a bluetooth radio, but it cannot tell you
  /// if bluetooth is currently enabled, or if you have been granted the
  /// necessary permissions to use it. Please *only* use this if there is no
  /// other way to determine if a feature is supported.
  ///
  /// This data comes from Android's PackageManager.getSystemAvailableFeatures,
  /// and many of the common feature strings to look for are available in
  /// PackageManager's public documentation:
  /// https://developer.android.com/reference/android/content/pm/PackageManager
  final List<String> systemFeatures;

  /// `true` if the application is running on a low-RAM device, `false` otherwise.
  final bool isLowRamDevice;

  /// Total physical RAM size of the device in megabytes
  ///
  /// https://developer.android.com/reference/android/app/ActivityManager.MemoryInfo#totalMem
  final int physicalRamSize;

  /// Current unallocated RAM size of the device in megabytes
  ///
  /// https://developer.android.com/reference/android/app/ActivityManager.MemoryInfo#availMem
  final int availableRamSize;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<AndroidBuildVersion>("version", version))
      ..add(StringProperty("board", board))
      ..add(StringProperty("bootloader", bootloader))
      ..add(StringProperty("brand", brand))
      ..add(StringProperty("device", device))
      ..add(StringProperty("display", display))
      ..add(StringProperty("fingerprint", fingerprint))
      ..add(StringProperty("hardware", hardware))
      ..add(StringProperty("host", host))
      ..add(StringProperty("id", id))
      ..add(StringProperty("manufacturer", manufacturer))
      ..add(StringProperty("model", model))
      ..add(StringProperty("product", product))
      ..add(StringProperty("name", name, defaultValue: ""))
      ..add(
        IterableProperty<String>(
          "supported32BitAbis",
          supported32BitAbis,
          defaultValue: const [],
        ),
      )
      ..add(
        IterableProperty<String>(
          "supported64BitAbis",
          supported64BitAbis,
          defaultValue: const [],
        ),
      )
      ..add(
        IterableProperty<String>(
          "supportedAbis",
          supportedAbis,
          defaultValue: const [],
        ),
      )
      ..add(StringProperty("tags", tags))
      ..add(StringProperty("type", type))
      ..add(DiagnosticsProperty<bool>("isPhysicalDevice", isPhysicalDevice))
      ..add(IntProperty("freeDiskSize", freeDiskSize))
      ..add(IntProperty("totalDiskSize", totalDiskSize))
      ..add(IterableProperty<String>("systemFeatures", systemFeatures))
      ..add(DiagnosticsProperty<bool>("isLowRamDevice", isLowRamDevice))
      ..add(IntProperty("physicalRamSize", physicalRamSize))
      ..add(IntProperty("availableRamSize", availableRamSize));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidDeviceInfo &&
          version == other.version &&
          board == other.board &&
          bootloader == other.bootloader &&
          brand == other.brand &&
          device == other.device &&
          display == other.display &&
          fingerprint == other.fingerprint &&
          hardware == other.hardware &&
          host == other.host &&
          id == other.id &&
          manufacturer == other.manufacturer &&
          model == other.model &&
          product == other.product &&
          name == other.name &&
          listEquals(supported32BitAbis, other.supported32BitAbis) &&
          listEquals(supported64BitAbis, other.supported64BitAbis) &&
          listEquals(supportedAbis, other.supportedAbis) &&
          tags == other.tags &&
          type == other.type &&
          isPhysicalDevice == other.isPhysicalDevice &&
          freeDiskSize == other.freeDiskSize &&
          totalDiskSize == other.totalDiskSize &&
          listEquals(systemFeatures, other.systemFeatures) &&
          isLowRamDevice == other.isLowRamDevice &&
          physicalRamSize == other.physicalRamSize &&
          availableRamSize == other.availableRamSize;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    board,
    bootloader,
    brand,
    device,
    display,
    fingerprint,
    hardware,
    host,
    id,
    manufacturer,
    model,
    product,
    name,
    Object.hashAll(supported32BitAbis),
    Object.hashAll(supported64BitAbis),
    Object.hashAll(supportedAbis),
    tags,
    Object.hash(
      type,
      isPhysicalDevice,
      freeDiskSize,
      totalDiskSize,
      Object.hashAll(systemFeatures),
      isLowRamDevice,
      physicalRamSize,
      availableRamSize,
    ),
  );
}

/// Version values of the current Android operating system build derived from
/// `android.os.Build.VERSION`.
///
/// See: https://developer.android.com/reference/android/os/Build.VERSION.html
class AndroidBuildVersion with Diagnosticable {
  const AndroidBuildVersion({
    this.baseOS,
    required this.codename,
    required this.incremental,
    required this.previewSdkInt,
    required this.release,
    required this.sdkInt,
    this.securityPatch,
  });

  /// The base OS build the product is based on.
  /// Available only on Android M (API 23) and newer
  final String? baseOS;

  /// The current development codename, or the string "REL" if this is a release build.
  final String codename;

  /// The internal value used by the underlying source control to represent this build.
  /// Available only on Android M (API 23) and newer
  final String incremental;

  /// The developer preview revision of a pre-release SDK.
  final int? previewSdkInt;

  /// The user-visible version string.
  final String release;

  /// The user-visible SDK version of the framework.
  ///
  /// Possible values are defined in: https://developer.android.com/reference/android/os/Build.VERSION_CODES.html
  final int sdkInt;

  /// The user-visible security patch level.
  /// Available only on Android M (API 23) and newer
  final String? securityPatch;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty("baseOS", baseOS, defaultValue: null))
      ..add(StringProperty("codename", codename))
      ..add(StringProperty("incremental", incremental))
      ..add(IntProperty("previewSdkInt", previewSdkInt, defaultValue: null))
      ..add(StringProperty("release", release))
      ..add(IntProperty("sdkInt", sdkInt))
      ..add(StringProperty("securityPatch", securityPatch, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidBuildVersion &&
          baseOS == other.baseOS &&
          codename == other.codename &&
          incremental == other.incremental &&
          previewSdkInt == other.previewSdkInt &&
          release == other.release &&
          sdkInt == other.sdkInt &&
          securityPatch == other.securityPatch;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseOS,
    codename,
    incremental,
    previewSdkInt,
    release,
    sdkInt,
    securityPatch,
  );
}

/// Device information for a Linux system.
///
/// See:
/// - https://www.freedesktop.org/software/systemd/man/os-release.html
/// - https://www.freedesktop.org/software/systemd/man/machine-id.html
class LinuxDeviceInfo with Diagnosticable implements BaseDeviceInfo {
  /// Constructs a LinuxDeviceInfo.
  const LinuxDeviceInfo({
    required this.name,
    this.version,
    required this.id,
    this.idLike,
    this.versionCodename,
    this.versionId,
    required this.prettyName,
    this.buildId,
    this.variant,
    this.variantId,
    required this.machineId,
  });

  /// A string identifying the operating system, without a version component,
  /// and suitable for presentation to the user.
  ///
  /// Examples: 'Fedora', 'Debian GNU/Linux'.
  ///
  /// If not set, defaults to 'Linux'.
  final String name;

  /// A string identifying the operating system version, excluding any OS name
  /// information, possibly including a release code name, and suitable for
  /// presentation to the user.
  ///
  /// Examples: '17', '17 (Beefy Miracle)'.
  ///
  /// This field is optional and may be null on some systems.
  final String? version;

  /// A lower-case string identifying the operating system, excluding any
  /// version information and suitable for processing by scripts or usage in
  /// generated filenames.
  ///
  /// The ID contains no spaces or other characters outside of 0–9, a–z, '.',
  /// '_' and '-'.
  ///
  /// Examples: 'fedora', 'debian'.
  ///
  /// If not set, defaults to 'linux'.
  final String id;

  /// A space-separated list of operating system identifiers in the same syntax
  /// as the [id] value. It lists identifiers of operating systems that are
  /// closely related to the local operating system in regards to packaging
  /// and programming interfaces, for example listing one or more OS identifiers
  /// the local OS is a derivative from.
  ///
  /// Examples: an operating system with [id] 'centos', would list 'rhel' and
  /// 'fedora', and an operating system with [id] 'ubuntu' would list 'debian'.
  ///
  /// This field is optional and may be null on some systems.
  final List<String>? idLike;

  /// A lower-case string identifying the operating system release code name,
  /// excluding any OS name information or release version, and suitable for
  /// processing by scripts or usage in generated filenames.
  ///
  /// The codename contains no spaces or other characters outside of 0–9, a–z,
  /// '.', '_' and '-'.
  ///
  /// Examples: 'buster', 'xenial'.
  ///
  /// This field is optional and may be null on some systems.
  final String? versionCodename;

  /// A lower-case string identifying the operating system version, excluding
  /// any OS name information or release code name, and suitable for processing
  /// by scripts or usage in generated filenames.
  ///
  /// The version is mostly numeric, and contains no spaces or other characters
  /// outside of 0–9, a–z, '.', '_' and '-'.
  ///
  /// Examples: '17', '11.04'.
  ///
  /// This field is optional and may be null on some systems.
  final String? versionId;

  /// A pretty operating system name in a format suitable for presentation to
  /// the user. May or may not contain a release code name or OS version of some
  /// kind, as suitable.
  ///
  /// Examples: 'Fedora 17 (Beefy Miracle)'.
  ///
  /// If not set, defaults to 'Linux'.
  final String prettyName;

  /// A string uniquely identifying the system image used as the origin for a
  /// distribution (it is not updated with system updates). The field can be
  /// identical between different [versionId]s as `buildId` is an only a unique
  /// identifier to a specific version.
  ///
  /// Examples: '2013-03-20.3', '201303203'.
  ///
  /// This field is optional and may be null on some systems.
  final String? buildId;

  /// A string identifying a specific variant or edition of the operating system
  /// suitable for presentation to the user. This field may be used to inform
  /// the user that the configuration of this system is subject to a specific
  /// divergent set of rules or default configuration settings.
  ///
  /// Examples: 'Server Edition', 'Smart Refrigerator Edition'.
  ///
  /// Note: this field is for display purposes only. The [variantId] field
  /// should be used for making programmatic decisions.
  ///
  /// This field is optional and may be null on some systems.
  final String? variant;

  /// A lower-case string identifying a specific variant or edition of the
  /// operating system. This may be interpreted in order to determine a
  /// divergent default configuration.
  ///
  /// The variant ID contains no spaces or other characters outside of 0–9, a–z,
  /// '.', '_' and '-'.
  ///
  /// Examples: 'server', 'embedded'.
  ///
  /// This field is optional and may be null on some systems.
  final String? variantId;

  /// A unique machine ID of the local system that is set during installation or
  /// boot. The machine ID is hexadecimal, 32-character, lowercase ID. When
  /// decoded from hexadecimal, this corresponds to a 16-byte/128-bit value.
  final String? machineId;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty("name", name))
      ..add(StringProperty("version", version, defaultValue: null))
      ..add(StringProperty("id", id))
      ..add(IterableProperty("idLike", idLike, defaultValue: null))
      ..add(
        StringProperty("versionCodename", versionCodename, defaultValue: null),
      )
      ..add(StringProperty("versionId", versionId, defaultValue: null))
      ..add(StringProperty("prettyName", prettyName))
      ..add(StringProperty("buildId", buildId, defaultValue: null))
      ..add(StringProperty("variant", variant, defaultValue: null))
      ..add(StringProperty("variantId", variantId, defaultValue: null))
      ..add(StringProperty("machineId", machineId, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is LinuxDeviceInfo &&
          name == other.name &&
          version == other.version &&
          id == other.id &&
          listEquals(idLike, other.idLike) &&
          versionCodename == other.versionCodename &&
          versionId == other.versionId &&
          prettyName == other.prettyName &&
          buildId == other.buildId &&
          variant == other.variant &&
          variantId == other.variantId &&
          machineId == other.machineId;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    version,
    id,
    idLike != null ? Object.hashAll(idLike!) : null,
    versionCodename,
    versionId,
    prettyName,
    buildId,
    variant,
    variantId,
    machineId,
  );
}

/// List of supported browsers
enum BrowserName {
  /// Mozilla Firefox
  firefox,

  /// Samsumg Internet Browser
  samsungInternet,

  /// Opera Web Browser
  opera,

  /// Microsoft Internet Explorer
  msie,

  /// Microsoft Edge
  edge,

  /// Google Chrome
  chrome,

  /// Apple Safari
  safari,

  /// Unknown web browser
  unknown,
}

/// Information derived from `navigator`.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/API/Window/navigator
class WebBrowserInfo with Diagnosticable implements BaseDeviceInfo {
  /// Web Browser info class.
  const WebBrowserInfo({
    required this.appCodeName,
    required this.appName,
    required this.appVersion,
    required this.deviceMemory,
    required this.language,
    required this.languages,
    required this.platform,
    required this.product,
    required this.productSub,
    required this.userAgent,
    required this.vendor,
    required this.vendorSub,
    required this.maxTouchPoints,
    required this.hardwareConcurrency,
  });

  /// the name of the current browser.
  BrowserName get browserName => _parseUserAgentToBrowserName(userAgent);

  /// the internal "code" name of the current browser.
  /// Note: Do not rely on this property to return the correct value.
  final String? appCodeName;

  /// a DOMString with the official name of the browser.
  /// Note: Do not rely on this property to return the correct value.
  final String? appName;

  /// the version of the browser as a DOMString.
  /// Note: Do not rely on this property to return the correct value.
  final String? appVersion;

  /// the amount of device memory in gigabytes. This value is an approximation given by rounding to the nearest power of 2 and dividing that number by 1024.
  final double? deviceMemory;

  /// a DOMString representing the preferred language of the user, usually the language of the browser UI. The null value is returned when this is unknown.
  final String? language;

  /// an array of DOMString representing the languages known to the user, by order of preference.
  final List<Object>? languages;

  /// the version of the browser as a DOMString.
  /// Note: Do not rely on this property to return the correct value.
  final String? platform;

  /// Always returns 'Gecko', on any browser.
  /// Note: Do not rely on this property to return the correct value.
  /// This property is kept only for compatibility purpose.
  final String? product;

  /// the build number of the current browser
  /// Note: Do not rely on this property to return the correct value.
  final String? productSub;

  /// the build number of the current browser (e.g., "20060909")
  final String? userAgent;

  /// the vendor name of the current browser
  final String? vendor;

  /// Returns the vendor version number (e.g. "6.1")
  /// Note: Do not rely on this property to return the correct value.
  final String? vendorSub;

  /// the number of logical processor cores available.
  final int? hardwareConcurrency;

  /// the maximum number of simultaneous touch contact points are supported by the current device.
  final int? maxTouchPoints;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("appCodeName", appCodeName))
      ..add(StringProperty("appName", appName))
      ..add(StringProperty("appVersion", appVersion))
      ..add(DoubleProperty("deviceMemory", deviceMemory))
      ..add(StringProperty("language", language))
      ..add(IterableProperty<Object>("languages", languages))
      ..add(StringProperty("platform", platform))
      ..add(StringProperty("product", product))
      ..add(StringProperty("productSub", productSub))
      ..add(StringProperty("userAgent", userAgent))
      ..add(StringProperty("vendor", vendor))
      ..add(StringProperty("vendorSub", vendorSub))
      ..add(IntProperty("maxTouchPoints", maxTouchPoints))
      ..add(IntProperty("hardwareConcurrency", hardwareConcurrency));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is WebBrowserInfo &&
          appCodeName == other.appCodeName &&
          appName == other.appName &&
          appVersion == other.appVersion &&
          deviceMemory == other.deviceMemory &&
          language == other.language &&
          listEquals(languages, other.languages) &&
          platform == other.platform &&
          product == other.product &&
          productSub == other.productSub &&
          userAgent == other.userAgent &&
          vendor == other.vendor &&
          vendorSub == other.vendorSub &&
          maxTouchPoints == other.maxTouchPoints &&
          hardwareConcurrency == other.hardwareConcurrency;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    appCodeName,
    appName,
    appVersion,
    deviceMemory,
    language,
    languages != null ? Object.hashAll(languages!) : null,
    platform,
    product,
    productSub,
    userAgent,
    vendor,
    vendorSub,
    maxTouchPoints,
    hardwareConcurrency,
  );

  static BrowserName _parseUserAgentToBrowserName(String? userAgent) {
    if (userAgent == null) {
      return BrowserName.unknown;
    } else if (userAgent.contains("Firefox")) {
      return BrowserName.firefox;
      // "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
    } else if (userAgent.contains("SamsungBrowser")) {
      return BrowserName.samsungInternet;
      // "Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G955F Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.4 Chrome/67.0.3396.87 Mobile Safari/537.36
    } else if (userAgent.contains("Opera") || userAgent.contains("OPR")) {
      return BrowserName.opera;
      // "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 OPR/57.0.3098.106"
    } else if (userAgent.contains("Trident")) {
      return BrowserName.msie;
      // "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; Zoom 3.6.0; wbx 1.0.0; rv:11.0) like Gecko"
    } else if (userAgent.contains("Edg")) {
      return BrowserName.edge;
      // https://docs.microsoft.com/en-us/microsoft-edge/web-platform/user-agent-string
      // "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.74 Safari/537.36 Edg/79.0.309.43"
      // "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299"
    } else if (userAgent.contains("Chrome")) {
      return BrowserName.chrome;
      // "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.181 Chrome/66.0.3359.181 Safari/537.36"
    } else if (userAgent.contains("Safari")) {
      return BrowserName.safari;
      // "Mozilla/5.0 (iPhone; CPU iPhone OS 11_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.0 Mobile/15E148 Safari/604.1 980x1306"
    } else {
      return BrowserName.unknown;
    }
  }
}

/// Object encapsulating WINDOWS device information.
class WindowsDeviceInfo with Diagnosticable implements BaseDeviceInfo {
  /// Constructs a [WindowsDeviceInfo].
  const WindowsDeviceInfo({
    required this.computerName,
    required this.numberOfCores,
    required this.systemMemoryInMegabytes,
    required this.userName,
    required this.majorVersion,
    required this.minorVersion,
    required this.buildNumber,
    required this.platformId,
    required this.csdVersion,
    required this.servicePackMajor,
    required this.servicePackMinor,
    required this.suitMask,
    required this.productType,
    required this.reserved,
    required this.buildLab,
    required this.buildLabEx,
    required this.digitalProductId,
    required this.displayVersion,
    required this.editionId,
    required this.installDate,
    required this.productId,
    required this.productName,
    required this.registeredOwner,
    required this.releaseId,
    required this.deviceId,
  });

  /// The computer's fully-qualified DNS name, where available.
  final String computerName;

  /// Number of CPU cores on the local machine
  final int numberOfCores;

  /// The physically installed memory in the computer.
  /// This may not be the same as available memory.
  final int systemMemoryInMegabytes;

  final String userName;

  /// The major version number of the operating system.
  /// For example, for Windows 2000, the major version number is five.
  /// For more information, see the table in Remarks.
  /// https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ns-wdm-_osversioninfoexw#remarks
  final int majorVersion;

  /// The minor version number of the operating system.
  /// For example, for Windows 2000, the minor version number is zero.
  /// For more information, see the table in Remarks.
  /// https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ns-wdm-_osversioninfoexw#remarks
  final int minorVersion;

  /// The build number of the operating system.
  /// For example:
  /// - `22000` or greater for Windows 11.
  /// - `10240` or greator for Windows 10.
  final int buildNumber;

  /// The operating system platform. For Win32 on NT-based operating systems,
  /// RtlGetVersion returns the value `VER_PLATFORM_WIN32_NT`.
  final int platformId;

  /// The service-pack version string.
  ///
  /// This member contains a string, such as "Service Pack 3", which indicates
  /// the latest service pack installed on the system.
  final String csdVersion;

  /// The major version number of the latest service pack installed on the system.
  /// For example, for Service Pack 3, the major version number is three. If no
  /// service pack has been installed, the value is zero.
  final int servicePackMajor;

  /// The minor version number of the latest service pack installed on the
  /// system. For example, for Service Pack 3, the minor version number is zero.
  final int servicePackMinor;

  /// The product suites available on the system.
  final int suitMask;

  /// The product type. This member contains additional information about the
  /// system.
  final int productType;

  /// Reserved for future use.
  final int reserved;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\BuildLab` registry key. For example:
  /// `22000.co_release.210604-1628`.
  final String buildLab;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\BuildLabEx` registry key. For example:
  /// `22000.1.amd64fre.co_release.210604-1628`.
  final String buildLabEx;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\DigitalProductId` registry key.
  final Uint8List digitalProductId;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\DisplayVersion` registry key. For example: `21H2`.
  final String displayVersion;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\EditionID` registry key.
  final String editionId;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\InstallDate` registry key.
  final DateTime installDate;

  /// Displayed as "Product ID" in Windows Settings. Value of the
  /// `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\ProductId` registry key. For example:
  /// `00000-00000-0000-AAAAA`.
  final String productId;

  /// Value of `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\ProductName` registry key. For example: `Windows 10 Home
  /// Single Language`.
  final String productName;

  /// Value of the `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\RegisteredOwner` registry key. For example: `Microsoft
  /// Corporation`.
  final String registeredOwner;

  /// Value of the `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  /// NT\CurrentVersion\ReleaseId` registry key. For example: `1903`.
  final String releaseId;

  /// Displayed as "Device ID" in Windows Settings. Value of
  /// `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient\MachineId` registry key.
  final String deviceId;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty("computerName", computerName))
      ..add(IntProperty("numberOfCores", numberOfCores))
      ..add(IntProperty("systemMemoryInMegabytes", systemMemoryInMegabytes))
      ..add(StringProperty("userName", userName))
      ..add(IntProperty("majorVersion", majorVersion))
      ..add(IntProperty("minorVersion", minorVersion))
      ..add(IntProperty("buildNumber", buildNumber))
      ..add(IntProperty("platformId", platformId))
      ..add(StringProperty("csdVersion", csdVersion))
      ..add(IntProperty("servicePackMajor", servicePackMajor))
      ..add(IntProperty("servicePackMinor", servicePackMinor))
      ..add(IntProperty("suitMask", suitMask))
      ..add(IntProperty("productType", productType))
      ..add(IntProperty("reserved", reserved))
      ..add(StringProperty("buildLab", buildLab))
      ..add(StringProperty("buildLabEx", buildLabEx))
      ..add(IterableProperty("digitalProductId", digitalProductId))
      ..add(StringProperty("displayVersion", displayVersion))
      ..add(StringProperty("editionId", editionId))
      ..add(DiagnosticsProperty<DateTime>("installDate", installDate))
      ..add(StringProperty("productId", productId))
      ..add(StringProperty("productName", productName))
      ..add(StringProperty("registeredOwner", registeredOwner))
      ..add(StringProperty("releaseId", releaseId))
      ..add(StringProperty("deviceId", deviceId));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is WindowsDeviceInfo &&
          computerName == other.computerName &&
          numberOfCores == other.numberOfCores &&
          systemMemoryInMegabytes == other.systemMemoryInMegabytes &&
          userName == other.userName &&
          majorVersion == other.majorVersion &&
          minorVersion == other.minorVersion &&
          buildNumber == other.buildNumber &&
          platformId == other.platformId &&
          csdVersion == other.csdVersion &&
          servicePackMajor == other.servicePackMajor &&
          servicePackMinor == other.servicePackMinor &&
          suitMask == other.suitMask &&
          productType == other.productType &&
          reserved == other.reserved &&
          buildLab == other.buildLab &&
          buildLabEx == other.buildLabEx &&
          listEquals(digitalProductId, other.digitalProductId) &&
          displayVersion == other.displayVersion &&
          editionId == other.editionId &&
          installDate == other.installDate &&
          productId == other.productId &&
          productName == other.productName &&
          registeredOwner == other.registeredOwner &&
          releaseId == other.releaseId &&
          deviceId == other.deviceId;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    computerName,
    numberOfCores,
    systemMemoryInMegabytes,
    userName,
    majorVersion,
    minorVersion,
    buildNumber,
    platformId,
    csdVersion,
    servicePackMajor,
    servicePackMinor,
    suitMask,
    productType,
    reserved,
    buildLab,
    buildLabEx,
    Object.hashAll(digitalProductId),
    displayVersion,
    Object.hash(
      editionId,
      installDate,
      productId,
      productName,
      registeredOwner,
      releaseId,
      deviceId,
    ),
  );
}
