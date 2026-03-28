library;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

import 'package:web/web.dart' as web;

class SystemColorsWeb extends SystemColorsPlatform {
  static void registerWith(Registrar registar) {
    SystemColorsPlatform.instance = SystemColorsWeb();
  }
}
