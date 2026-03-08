import 'dart:math' as math;

import 'package:libmonet/material_color_utilities.dart';

class SchemeClockVibrant extends DynamicScheme {
  SchemeClockVibrant({
    required TonalPaletteSourceColor sourceColor,
    required super.isDark,
    super.contrastLevel,
  }) : super.withDefaults(
         sourceColor: sourceColor,
         variant: .monochrome,
         primaryPalette: .fromHueAndChroma(
           sourceColor.asHct.hue,
           math.max(sourceColor.asHct.chroma, 70.0),
         ),
         secondaryPalette: .fromHueAndChroma(
           sourceColor.asHct.hue + 20.0,
           math.max(sourceColor.asHct.chroma, 70.0),
         ),
         tertiaryPalette: .fromHueAndChroma(
           sourceColor.asHct.hue + 60.0,
           math.max(sourceColor.asHct.chroma, 70.0),
         ),
         //not used
         neutralPalette: .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
         neutralVariantPalette: .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
       );
}
