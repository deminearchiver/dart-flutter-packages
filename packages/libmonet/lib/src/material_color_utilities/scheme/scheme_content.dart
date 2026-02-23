import '../dynamiccolor/dynamic_scheme.dart';

/// A scheme that places the source color in Scheme.primaryContainer.
///
/// Primary Container is the source color, adjusted for color relativity. It maintains constant
/// appearance in light mode and dark mode. This adds ~5 tone in light mode, and subtracts ~5 tone in
/// dark mode.
///
/// Tertiary Container is an analogous color, specifically, the analog of a color wheel divided
/// into 6, and the precise analog is the one found by increasing hue. This is a scientifically
/// grounded equivalent to rotating hue clockwise by 60 degrees. It also maintains constant
/// appearance.
@Deprecated("Use DynamicScheme directly instead")
class SchemeContent extends DynamicScheme {
  @Deprecated("Use DynamicScheme.withDefaults(variant: .content) instead.")
  SchemeContent({
    super.sourceColor,
    super.isDark,
    super.contrastLevel,
    super.platform,
    super.specVersion,
  }) : super.withDefaults(variant: .content);
}
