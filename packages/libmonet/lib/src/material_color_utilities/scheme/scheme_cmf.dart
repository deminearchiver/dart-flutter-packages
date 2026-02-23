import '../dynamiccolor/dynamic_scheme.dart';

/// A Dynamic Color theme with 2 source colors.
@Deprecated("Use DynamicScheme directly instead")
class SchemeCmf extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .cmf) instead.")
  SchemeCmf({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .cmf);
}
