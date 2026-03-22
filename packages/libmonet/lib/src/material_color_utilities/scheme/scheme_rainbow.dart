import '../dynamiccolor/dynamic_scheme.dart';

/// A playful theme - the source color's hue does not appear in the theme.
class SchemeRainbow extends DynamicScheme {
  SchemeRainbow({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .rainbow);
}
