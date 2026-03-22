import '../dynamiccolor/dynamic_scheme.dart';

/// A loud theme, colorfulness is maximum for Primary palette, increased for others.
///
/// A Dynamic Color theme that maxes out colorfulness at each position in the
/// Primary Tonal Palette.
class SchemeVibrant extends DynamicScheme {
  SchemeVibrant({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .vibrant);
}
