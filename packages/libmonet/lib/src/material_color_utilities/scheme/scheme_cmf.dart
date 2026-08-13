import '../dynamiccolor/dynamic_scheme.dart';

/// A Dynamic Color theme with 2 source colors.
class SchemeCmf({
  super.sourceColor,
  super.isDark,
  super.contrastLevel,
  super.platform,
  super.specVersion,
}) extends DynamicScheme {
  this : super.withDefaults(variant: .cmf);
}
