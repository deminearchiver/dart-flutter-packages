import 'dart:math' as math;

import 'package:libmonet/material_color_utilities.dart';

class SchemeClock({
  required TonalPaletteSourceColor sourceColor,
  required super.isDark,
  super.contrastLevel,
}) extends DynamicScheme {
  this
    : super.withDefaults(
        sourceColor: sourceColor,
        variant: .monochrome,
        primaryPalette: .fromHueAndChroma(
          sourceColor.asHct.hue,
          math.max(sourceColor.asHct.chroma, 20.0),
        ),
        secondaryPalette: .fromHueAndChroma(
          sourceColor.asHct.hue + 10.0,
          MathUtils.clampDouble(17.0, 40.0, sourceColor.asHct.chroma * 0.85),
        ),
        tertiaryPalette: .fromHueAndChroma(
          sourceColor.asHct.hue + 20.0,
          math.max(sourceColor.asHct.chroma + 20.0, 50.0),
        ),
        //not used
        neutralPalette: .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
        neutralVariantPalette: .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
      );
}
