import '../dynamiccolor/dynamic_scheme.dart';

/// A playful theme - the source color's hue does not appear in the theme.
@Deprecated("Use DynamicScheme directly instead")
class SchemeRainbow extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .rainbow) instead.")
  SchemeRainbow({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .rainbow);
}
