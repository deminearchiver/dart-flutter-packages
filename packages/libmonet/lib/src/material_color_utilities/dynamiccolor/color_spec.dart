import '../hct/hct.dart';
import '../palettes/tonal_palette.dart';

import 'color_spec_2021.dart';
import 'color_spec_2025.dart';
import 'color_spec_2026.dart';
import 'dynamic_color.dart';
import 'dynamic_scheme.dart';
import 'variant.dart';

/// All available spec versions.
enum SpecVersion(final int year) implements Comparable<SpecVersion> {
  spec2021(2021),
  spec2025(2025),
  spec2026(2026);

  bool operator >(SpecVersion other) => year > other.year;
  bool operator >=(SpecVersion other) => year >= other.year;
  bool operator <(SpecVersion other) => year < other.year;
  bool operator <=(SpecVersion other) => year <= other.year;

  @override
  int compareTo(SpecVersion other) => year.compareTo(other.year);
}

/// An interface defining all the necessary methods that could be different
/// between specs.
abstract interface class ColorSpec {
  /// Get the correct color spec for a given spec version.
  factory fromSpecVersion(SpecVersion specVersion) => switch (specVersion) {
    .spec2021 => const ColorSpec2021(),
    .spec2025 => const ColorSpec2025(),
    .spec2026 => const ColorSpec2026(),
  };

  // ////////////////////////////////////////////////////////////////
  // Main Palettes //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get primaryPaletteKeyColor;
  DynamicColor get secondaryPaletteKeyColor;
  DynamicColor get tertiaryPaletteKeyColor;
  DynamicColor get neutralPaletteKeyColor;
  DynamicColor get neutralVariantPaletteKeyColor;
  DynamicColor get errorPaletteKeyColor;

  // ////////////////////////////////////////////////////////////////
  // Surfaces [S] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get background;
  DynamicColor get onBackground;
  DynamicColor get surface;
  DynamicColor get surfaceDim;
  DynamicColor get surfaceBright;
  DynamicColor get surfaceContainerLowest;
  DynamicColor get surfaceContainerLow;
  DynamicColor get surfaceContainer;
  DynamicColor get surfaceContainerHigh;
  DynamicColor get surfaceContainerHighest;
  DynamicColor get onSurface;
  DynamicColor get surfaceVariant;
  DynamicColor get onSurfaceVariant;
  DynamicColor get inverseSurface;
  DynamicColor get inverseOnSurface;
  DynamicColor get outline;
  DynamicColor get outlineVariant;
  DynamicColor get shadow;
  DynamicColor get scrim;
  DynamicColor get surfaceTint;

  // ////////////////////////////////////////////////////////////////
  // Primaries [P] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get primary;
  DynamicColor? get primaryDim;
  DynamicColor get onPrimary;
  DynamicColor get primaryContainer;
  DynamicColor get onPrimaryContainer;
  DynamicColor get inversePrimary;

  // ////////////////////////////////////////////////////////////////
  // Secondaries [Q] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get secondary;
  DynamicColor? get secondaryDim;
  DynamicColor get onSecondary;
  DynamicColor get secondaryContainer;
  DynamicColor get onSecondaryContainer;

  // ////////////////////////////////////////////////////////////////
  // Tertiaries [T] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get tertiary;
  DynamicColor? get tertiaryDim;
  DynamicColor get onTertiary;
  DynamicColor get tertiaryContainer;
  DynamicColor get onTertiaryContainer;

  // ////////////////////////////////////////////////////////////////
  // Errors [E] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get error;
  DynamicColor? get errorDim;
  DynamicColor get onError;
  DynamicColor get errorContainer;
  DynamicColor get onErrorContainer;

  // ////////////////////////////////////////////////////////////////
  // Primary Fixed Colors [PF] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get primaryFixed;
  DynamicColor get primaryFixedDim;
  DynamicColor get onPrimaryFixed;
  DynamicColor get onPrimaryFixedVariant;

  // ////////////////////////////////////////////////////////////////
  // Secondary Fixed Colors [QF] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get secondaryFixed;
  DynamicColor get secondaryFixedDim;
  DynamicColor get onSecondaryFixed;
  DynamicColor get onSecondaryFixedVariant;

  // ////////////////////////////////////////////////////////////////
  // Tertiary Fixed Colors [TF] //
  // ////////////////////////////////////////////////////////////////
  DynamicColor get tertiaryFixed;
  DynamicColor get tertiaryFixedDim;
  DynamicColor get onTertiaryFixed;
  DynamicColor get onTertiaryFixedVariant;

  // ////////////////////////////////////////////////////////////////
  // Android-only Colors //
  // ////////////////////////////////////////////////////////////////

  DynamicColor get controlActivated;
  DynamicColor get controlNormal;
  DynamicColor get controlHighlight;
  DynamicColor get textPrimaryInverse;
  DynamicColor get textSecondaryAndTertiaryInverse;
  DynamicColor get textPrimaryInverseDisableOnly;
  DynamicColor get textSecondaryAndTertiaryInverseDisabled;
  DynamicColor get textHintInverse;

  // ////////////////////////////////////////////////////////////////
  // Other //
  // ////////////////////////////////////////////////////////////////

  DynamicColor highestSurface(DynamicScheme scheme);

  // ////////////////////////////////////////////////////////////////
  // Color value calculations //
  // ////////////////////////////////////////////////////////////////

  Hct getHct(DynamicScheme scheme, DynamicColor color);

  double getTone(DynamicScheme scheme, DynamicColor color);

  // ////////////////////////////////////////////////////////////////
  // Scheme Palettes //
  // ////////////////////////////////////////////////////////////////

  TonalPalette getPrimaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );

  TonalPalette getSecondaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );

  TonalPalette getTertiaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );

  TonalPalette getNeutralPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );

  TonalPalette getNeutralVariantPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );

  TonalPalette getErrorPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  );
}
