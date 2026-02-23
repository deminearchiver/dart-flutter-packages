import '../dynamiccolor/dynamic_scheme.dart';

/// A loud theme, colorfulness is maximum for Primary palette, increased for others.
///
/// A Dynamic Color theme that maxes out colorfulness at each position in the
/// Primary Tonal Palette.
@Deprecated("Use DynamicScheme directly instead")
class SchemeVibrant extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .vibrant) instead.")
  SchemeVibrant({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .vibrant);
}
