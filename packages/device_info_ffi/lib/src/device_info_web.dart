import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as html show window, Navigator;

import 'package:device_info_ffi/device_info_ffi.dart';

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

class DeviceInfoWeb extends DeviceInfoPlatform {
  DeviceInfoWeb(html.Navigator navigator) : _navigator = navigator;

  final html.Navigator _navigator;

  WebBrowserInfo? _cachedWebBrowserInfo;

  WebBrowserInfo _getInfo() => WebBrowserInfo(
    appCodeName: _navigator.appCodeName,
    appName: _navigator.appName,
    appVersion: _navigator.appVersion,
    deviceMemory: _navigator.safeDeviceMemory,
    language: _navigator.language,
    languages: _navigator.languages.toDart,
    platform: _navigator.platform,
    product: _navigator.product,
    productSub: _navigator.productSub,
    userAgent: _navigator.userAgent,
    vendor: _navigator.vendor,
    vendorSub: _navigator.vendorSub,
    maxTouchPoints: _navigator.maxTouchPoints,
    hardwareConcurrency: _navigator.hardwareConcurrency,
  );

  @override
  WebBrowserInfo deviceInfo() => _cachedWebBrowserInfo ??= _getInfo();

  static void registerWith(Registrar registar) {
    DeviceInfoPlatform.instance = DeviceInfoWeb(html.window.navigator);
  }
}

/// Some Navigator properties are not fully supported in all browsers.
/// However, package:web does not provide a safe way to access these properties,
/// and assumes they are always not null.
///
/// This extension provides a safe way to access these properties.
///
/// See: https://github.com/dart-lang/web/issues/326
///      https://github.com/fluttercommunity/plus_plugins/issues/3391
extension SafeNavigationGetterExtensions on html.Navigator {
  @JS("deviceMemory")
  external double? get safeDeviceMemory;
}
