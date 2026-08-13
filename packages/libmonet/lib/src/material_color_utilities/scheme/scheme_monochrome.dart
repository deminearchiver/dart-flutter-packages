import '../dynamiccolor/dynamic_scheme.dart';

/// A monochrome theme, colors are purely black / white / gray.
class SchemeMonochrome({
  super.sourceColor,
  super.isDark,
  super.contrastLevel,
  super.platform,
  super.specVersion,
}) extends DynamicScheme {
  this : super.withDefaults(variant: .monochrome);
}
