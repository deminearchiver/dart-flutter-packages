import 'dart:math' as math;

import 'package:libmonet/material_color_utilities.dart';

class SchemeClock extends DynamicScheme {
  SchemeClock({
    required Hct sourceColorHct,
    required super.isDark,
    super.contrastLevel,
  }) : super.withDefaults(
         sourceColor: .fromHct(sourceColorHct),
         variant: .monochrome,
         primaryPalette: .fromHueAndChroma(
           sourceColorHct.hue,
           math.max(sourceColorHct.chroma, 20.0),
         ),
         secondaryPalette: .fromHueAndChroma(
           sourceColorHct.hue + 10.0,
           MathUtils.clampDouble(17.0, 40.0, sourceColorHct.chroma * 0.85),
         ),
         tertiaryPalette: .fromHueAndChroma(
           sourceColorHct.hue + 20.0,
           math.max(sourceColorHct.chroma + 20.0, 50.0),
         ),
         //not used
         neutralPalette: .fromHueAndChroma(sourceColorHct.hue, 0.0),
         neutralVariantPalette: .fromHueAndChroma(sourceColorHct.hue, 0.0),
       );
}
