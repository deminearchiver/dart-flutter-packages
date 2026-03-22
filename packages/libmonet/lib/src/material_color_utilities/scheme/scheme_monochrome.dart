import '../dynamiccolor/dynamic_scheme.dart';

/// A monochrome theme, colors are purely black / white / gray.
class SchemeMonochrome extends DynamicScheme {
  SchemeMonochrome({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .monochrome);
}
