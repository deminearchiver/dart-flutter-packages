import '../dynamiccolor/dynamic_scheme.dart';

/// A theme that's slightly more chromatic than monochrome, which is purely black / white / gray.
class SchemeNeutral({
  super.sourceColor,
  super.isDark,
  super.contrastLevel,
  super.platform,
  super.specVersion,
}) extends DynamicScheme {
  this : super.withDefaults(variant: .neutral);
}
