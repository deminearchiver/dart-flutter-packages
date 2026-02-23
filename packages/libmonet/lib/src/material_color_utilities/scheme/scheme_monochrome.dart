import '../dynamiccolor/dynamic_scheme.dart';

/// A monochrome theme, colors are purely black / white / gray.
@Deprecated("Use DynamicScheme directly instead")
class SchemeMonochrome extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .monochrome) instead.")
  SchemeMonochrome({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .monochrome);
}
