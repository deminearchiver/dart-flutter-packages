import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

abstract final class SystemColors {
  static SystemColorsPlatform get platform => .instance;

  static set platform(SystemColorsPlatform value) {
    SystemColorsPlatform.instance = value;
  }

  static SystemColorsAndroidPlatform? get androidPlatform =>
      !kIsWeb && Platform.isAndroid ? .instance : null;

  static set androidPlatform(SystemColorsAndroidPlatform value) {
    if (kIsWeb || !Platform.isAndroid) return;
    SystemColorsAndroidPlatform.instance = value;
  }

  static SystemColorsIosPlatform? get iosPlatform =>
      !kIsWeb && Platform.isIOS ? .instance : null;

  static set iosPlatform(SystemColorsIosPlatform value) {
    if (kIsWeb || !Platform.isIOS) return;
    SystemColorsIosPlatform.instance = value;
  }

  static SystemColorsLinuxPlatform? get linuxPlatform =>
      !kIsWeb && Platform.isLinux ? .instance : null;

  static set linuxPlatform(SystemColorsLinuxPlatform value) {
    if (kIsWeb || !Platform.isLinux) return;
    SystemColorsLinuxPlatform.instance = value;
  }

  static SystemColorsMacosPlatform? get macosPlatform =>
      !kIsWeb && Platform.isMacOS ? .instance : null;

  static set macosPlatform(SystemColorsMacosPlatform value) {
    if (kIsWeb || !Platform.isMacOS) return;
    SystemColorsMacosPlatform.instance = value;
  }

  static SystemColorsWebPlatform? get webPlatform => kIsWeb ? .instance : null;

  static set webPlatform(SystemColorsWebPlatform value) {
    if (!kIsWeb) return;
    SystemColorsWebPlatform.instance = value;
  }

  static SystemColorsWindowsPlatform? get windowsPlatform =>
      !kIsWeb && Platform.isWindows ? .instance : null;

  static set windowsPlatform(SystemColorsWindowsPlatform value) {
    if (kIsWeb || !Platform.isWindows) return;
    SystemColorsWindowsPlatform.instance = value;
  }
}
