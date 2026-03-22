import '../dynamiccolor/dynamic_scheme.dart';

/// A calm theme, sedated colors that aren't particularly chromatic.
///
/// A Dynamic Color theme with low to medium colorfulness and a Tertiary
/// TonalPalette with a hue related to the source color.
///
/// The default Material You theme on Android 12 and 13.
class SchemeTonalSpot extends DynamicScheme {
  SchemeTonalSpot({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .tonalSpot);
}
