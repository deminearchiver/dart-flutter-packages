import '../dynamiccolor/dynamic_scheme.dart';

/// A theme that's slightly more chromatic than monochrome, which is purely black / white / gray.
@Deprecated("Use DynamicScheme directly instead")
class SchemeNeutral extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .neutral) instead.")
  SchemeNeutral({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .neutral);
}
