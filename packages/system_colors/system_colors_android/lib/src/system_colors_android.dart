import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jni/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';
import 'package:libmonet/libmonet.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

import 'jni_bindings.g.dart' as jb;

part 'color_scheme_data.dart';
part 'extensions.dart';
part 'material_tonal_palette.dart';
part 'tonal_palette_data.dart';

class SystemColorsAndroid extends SystemColorsAndroidPlatform {
  SystemColorsAndroid();

  @override
  bool get isDynamicColorAvailable => jb.SystemColors.isDynamicColorAvailable;

  _TonalPaletteData get _tonalPaletteData => androidApplicationContext
      .use(jb.TonalPalette.fromContext$1)
      .use(_TonalPaletteData.fromNative);

  _ColorSchemeData get _colorSchemeData => androidApplicationContext
      .use(jb.ColorScheme.fromContext$1)
      .use(_ColorSchemeData.fromNative);

  static void registerWith() {
    SystemColorsAndroidPlatform.instance = SystemColorsAndroid();
  }
}
