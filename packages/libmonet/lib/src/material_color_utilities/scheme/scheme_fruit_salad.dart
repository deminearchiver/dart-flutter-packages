import '../dynamiccolor/dynamic_scheme.dart';

/// A playful theme - the source color's hue does not appear in the theme.
class SchemeFruitSalad extends DynamicScheme {
  SchemeFruitSalad({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .fruitSalad);
}
