import 'dart:math' as math;

import 'package:libmonet/material_color_utilities.dart';

class SchemeClockVibrant extends DynamicScheme {
  SchemeClockVibrant({
    required Hct sourceColorHct,
    required super.isDark,
    super.contrastLevel,
  }) : super.withDefaults(
         sourceColor: .fromHct(sourceColorHct),
         variant: .monochrome,
         primaryPalette: .fromHueAndChroma(
           sourceColorHct.hue,
           math.max(sourceColorHct.chroma, 70.0),
         ),
         secondaryPalette: .fromHueAndChroma(
           sourceColorHct.hue + 20.0,
           math.max(sourceColorHct.chroma, 70.0),
         ),
         tertiaryPalette: .fromHueAndChroma(
           sourceColorHct.hue + 60.0,
           math.max(sourceColorHct.chroma, 70.0),
         ),
         //not used
         neutralPalette: .fromHueAndChroma(sourceColorHct.hue, 0.0),
         neutralVariantPalette: .fromHueAndChroma(sourceColorHct.hue, 0.0),
       );
}
