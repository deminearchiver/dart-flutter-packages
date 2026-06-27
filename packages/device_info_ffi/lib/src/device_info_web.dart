import 'dart:js_interop';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as html show window, Navigator;

import 'package:device_info_ffi/device_info_ffi.dart';

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
