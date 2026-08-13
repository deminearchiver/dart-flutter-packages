import '../dynamiccolor/dynamic_scheme.dart';

import 'tonal_palette.dart';

/// Comprises foundational palettes to build a color scheme.
///
/// Generated from a source color, these palettes will then be part
/// of a [DynamicScheme] together with appearance preferences.
final class const CorePalettes({
  required final TonalPalette primary,
  required final TonalPalette secondary,
  required final TonalPalette tertiary,
  required final TonalPalette neutral,
  required final TonalPalette neutralVariant,
}) {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorePalettes &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          neutral == other.neutral &&
          neutralVariant == other.neutralVariant;

  @override
  int get hashCode =>
      Object.hash(primary, secondary, tertiary, neutral, neutralVariant);
}
