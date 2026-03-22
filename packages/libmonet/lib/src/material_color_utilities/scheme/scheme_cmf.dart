import '../dynamiccolor/dynamic_scheme.dart';

/// A Dynamic Color theme with 2 source colors.
class SchemeCmf extends DynamicScheme {
  SchemeCmf({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .cmf);
}
