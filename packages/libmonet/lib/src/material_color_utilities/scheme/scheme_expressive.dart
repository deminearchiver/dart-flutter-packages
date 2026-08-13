import '../dynamiccolor/dynamic_scheme.dart';

/// A playful theme - the source color's hue does not appear in the theme.
class SchemeExpressive({
  super.sourceColor,
  super.isDark,
  super.contrastLevel,
  super.platform,
  super.specVersion,
}) extends DynamicScheme {
  this : super.withDefaults(variant: .expressive);
}
