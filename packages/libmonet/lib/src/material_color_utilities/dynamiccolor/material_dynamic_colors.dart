import 'color_spec_2026.dart';
import 'dynamic_color.dart';
import 'dynamic_scheme.dart';

final _materialDynamicColors = MaterialDynamicColors._();

/// Named colors, otherwise known as tokens, or roles,
/// in the Material Design system.
final class MaterialDynamicColors._() {
  factory() => _materialDynamicColors;

  final _colorSpec = const ColorSpec2026();

  DynamicColor highestSurface(DynamicScheme scheme) =>
      _colorSpec.highestSurface(scheme);

  DynamicColor get primaryPaletteKeyColor => _colorSpec.primaryPaletteKeyColor;

  DynamicColor get secondaryPaletteKeyColor =>
      _colorSpec.secondaryPaletteKeyColor;

  DynamicColor get tertiaryPaletteKeyColor =>
      _colorSpec.tertiaryPaletteKeyColor;

  DynamicColor get neutralPaletteKeyColor => _colorSpec.neutralPaletteKeyColor;

  DynamicColor get neutralVariantPaletteKeyColor =>
      _colorSpec.neutralVariantPaletteKeyColor;

  DynamicColor get errorPaletteKeyColor => _colorSpec.errorPaletteKeyColor;

  DynamicColor get background => _colorSpec.background;

  DynamicColor get onBackground => _colorSpec.onBackground;

  DynamicColor get surface => _colorSpec.surface;

  DynamicColor get surfaceDim => _colorSpec.surfaceDim;

  DynamicColor get surfaceBright => _colorSpec.surfaceBright;

  DynamicColor get surfaceContainerLowest => _colorSpec.surfaceContainerLowest;

  DynamicColor get surfaceContainerLow => _colorSpec.surfaceContainerLow;

  DynamicColor get surfaceContainer => _colorSpec.surfaceContainer;

  DynamicColor get surfaceContainerHigh => _colorSpec.surfaceContainerHigh;

  DynamicColor get surfaceContainerHighest =>
      _colorSpec.surfaceContainerHighest;

  DynamicColor get onSurface => _colorSpec.onSurface;

  DynamicColor get surfaceVariant => _colorSpec.surfaceVariant;

  DynamicColor get onSurfaceVariant => _colorSpec.onSurfaceVariant;

  DynamicColor get inverseSurface => _colorSpec.inverseSurface;

  DynamicColor get inverseOnSurface => _colorSpec.inverseOnSurface;

  DynamicColor get outline => _colorSpec.outline;

  DynamicColor get outlineVariant => _colorSpec.outlineVariant;

  DynamicColor get shadow => _colorSpec.shadow;

  DynamicColor get scrim => _colorSpec.scrim;

  DynamicColor get surfaceTint => _colorSpec.surfaceTint;

  DynamicColor get primary => _colorSpec.primary;

  DynamicColor get primaryDim => _colorSpec.primaryDim;

  DynamicColor get onPrimary => _colorSpec.onPrimary;

  DynamicColor get primaryContainer => _colorSpec.primaryContainer;

  DynamicColor get onPrimaryContainer => _colorSpec.onPrimaryContainer;

  DynamicColor get inversePrimary => _colorSpec.inversePrimary;

  DynamicColor get primaryFixed => _colorSpec.primaryFixed;

  DynamicColor get primaryFixedDim => _colorSpec.primaryFixedDim;

  DynamicColor get onPrimaryFixed => _colorSpec.onPrimaryFixed;

  DynamicColor get onPrimaryFixedVariant => _colorSpec.onPrimaryFixedVariant;

  DynamicColor get secondary => _colorSpec.secondary;

  DynamicColor get secondaryDim => _colorSpec.secondaryDim;

  DynamicColor get onSecondary => _colorSpec.onSecondary;

  DynamicColor get secondaryContainer => _colorSpec.secondaryContainer;

  DynamicColor get onSecondaryContainer => _colorSpec.onSecondaryContainer;

  DynamicColor get secondaryFixed => _colorSpec.secondaryFixed;

  DynamicColor get secondaryFixedDim => _colorSpec.secondaryFixedDim;

  DynamicColor get onSecondaryFixed => _colorSpec.onSecondaryFixed;

  DynamicColor get onSecondaryFixedVariant =>
      _colorSpec.onSecondaryFixedVariant;

  DynamicColor get tertiary => _colorSpec.tertiary;

  DynamicColor get tertiaryDim => _colorSpec.tertiaryDim;

  DynamicColor get onTertiary => _colorSpec.onTertiary;

  DynamicColor get tertiaryContainer => _colorSpec.tertiaryContainer;

  DynamicColor get onTertiaryContainer => _colorSpec.onTertiaryContainer;

  DynamicColor get tertiaryFixed => _colorSpec.tertiaryFixed;

  DynamicColor get tertiaryFixedDim => _colorSpec.tertiaryFixedDim;

  DynamicColor get onTertiaryFixed => _colorSpec.onTertiaryFixed;

  DynamicColor get onTertiaryFixedVariant => _colorSpec.onTertiaryFixedVariant;

  DynamicColor get error => _colorSpec.error;

  DynamicColor get errorDim => _colorSpec.errorDim;

  DynamicColor get onError => _colorSpec.onError;

  DynamicColor get errorContainer => _colorSpec.errorContainer;

  DynamicColor get onErrorContainer => _colorSpec.onErrorContainer;

  DynamicColor get controlActivated => _colorSpec.controlActivated;

  DynamicColor get controlNormal => _colorSpec.controlNormal;

  DynamicColor get controlHighlight => _colorSpec.controlHighlight;

  DynamicColor get textPrimaryInverse => _colorSpec.textPrimaryInverse;

  DynamicColor get textSecondaryAndTertiaryInverse =>
      _colorSpec.textSecondaryAndTertiaryInverse;

  DynamicColor get textPrimaryInverseDisableOnly =>
      _colorSpec.textPrimaryInverseDisableOnly;

  DynamicColor get textSecondaryAndTertiaryInverseDisabled =>
      _colorSpec.textSecondaryAndTertiaryInverseDisabled;

  DynamicColor get textHintInverse => _colorSpec.textHintInverse;

  /// All dynamic colors in Material Design system.
  ///
  /// A list containing getters for all dynamic colors of this class.
  /// Iteration order is stable.
  late final allDynamicColors = List<DynamicColor Function()>.unmodifiableOf([
    () => primaryPaletteKeyColor,
    () => secondaryPaletteKeyColor,
    () => tertiaryPaletteKeyColor,
    () => neutralPaletteKeyColor,
    () => neutralVariantPaletteKeyColor,
    () => errorPaletteKeyColor,
    () => background,
    () => onBackground,
    () => surface,
    () => surfaceDim,
    () => surfaceBright,
    () => surfaceContainerLowest,
    () => surfaceContainerLow,
    () => surfaceContainer,
    () => surfaceContainerHigh,
    () => surfaceContainerHighest,
    () => onSurface,
    () => surfaceVariant,
    () => onSurfaceVariant,
    () => outline,
    () => outlineVariant,
    () => inverseSurface,
    () => inverseOnSurface,
    () => shadow,
    () => scrim,
    () => surfaceTint,
    () => primary,
    () => primaryDim,
    () => onPrimary,
    () => primaryContainer,
    () => onPrimaryContainer,
    () => primaryFixed,
    () => primaryFixedDim,
    () => onPrimaryFixed,
    () => onPrimaryFixedVariant,
    () => inversePrimary,
    () => secondary,
    () => secondaryDim,
    () => onSecondary,
    () => secondaryContainer,
    () => onSecondaryContainer,
    () => secondaryFixed,
    () => secondaryFixedDim,
    () => onSecondaryFixed,
    () => onSecondaryFixedVariant,
    () => tertiary,
    () => tertiaryDim,
    () => onTertiary,
    () => tertiaryContainer,
    () => onTertiaryContainer,
    () => tertiaryFixed,
    () => tertiaryFixedDim,
    () => onTertiaryFixed,
    () => onTertiaryFixedVariant,
    () => error,
    () => errorDim,
    () => onError,
    () => errorContainer,
    () => onErrorContainer,
    () => controlActivated,
    () => controlNormal,
    () => controlHighlight,
    () => textPrimaryInverse,
    () => textSecondaryAndTertiaryInverse,
    () => textPrimaryInverseDisableOnly,
    () => textSecondaryAndTertiaryInverseDisabled,
    () => textHintInverse,
  ]);
}

extension MaterialDynamicSchemeColorsExtension on DynamicScheme {
  int get primaryPaletteKeyColor =>
      getArgb(_materialDynamicColors.primaryPaletteKeyColor);

  int get secondaryPaletteKeyColor =>
      getArgb(_materialDynamicColors.secondaryPaletteKeyColor);

  int get tertiaryPaletteKeyColor =>
      getArgb(_materialDynamicColors.tertiaryPaletteKeyColor);

  int get neutralPaletteKeyColor =>
      getArgb(_materialDynamicColors.neutralPaletteKeyColor);

  int get neutralVariantPaletteKeyColor =>
      getArgb(_materialDynamicColors.neutralVariantPaletteKeyColor);

  int get errorPaletteKeyColor =>
      getArgb(_materialDynamicColors.errorPaletteKeyColor);

  int get background => getArgb(_materialDynamicColors.background);

  int get onBackground => getArgb(_materialDynamicColors.onBackground);

  int get surface => getArgb(_materialDynamicColors.surface);

  int get surfaceDim => getArgb(_materialDynamicColors.surfaceDim);

  int get surfaceBright => getArgb(_materialDynamicColors.surfaceBright);

  int get surfaceContainerLowest =>
      getArgb(_materialDynamicColors.surfaceContainerLowest);

  int get surfaceContainerLow =>
      getArgb(_materialDynamicColors.surfaceContainerLow);

  int get surfaceContainer => getArgb(_materialDynamicColors.surfaceContainer);

  int get surfaceContainerHigh =>
      getArgb(_materialDynamicColors.surfaceContainerHigh);

  int get surfaceContainerHighest =>
      getArgb(_materialDynamicColors.surfaceContainerHighest);

  int get onSurface => getArgb(_materialDynamicColors.onSurface);

  int get surfaceVariant => getArgb(_materialDynamicColors.surfaceVariant);

  int get onSurfaceVariant => getArgb(_materialDynamicColors.onSurfaceVariant);

  int get outline => getArgb(_materialDynamicColors.outline);

  int get outlineVariant => getArgb(_materialDynamicColors.outlineVariant);

  int get inverseSurface => getArgb(_materialDynamicColors.inverseSurface);

  int get inverseOnSurface => getArgb(_materialDynamicColors.inverseOnSurface);

  int get shadow => getArgb(_materialDynamicColors.shadow);

  int get scrim => getArgb(_materialDynamicColors.scrim);

  int get surfaceTint => getArgb(_materialDynamicColors.surfaceTint);

  int get primary => getArgb(_materialDynamicColors.primary);

  int get primaryDim => getArgb(_materialDynamicColors.primaryDim);

  int get onPrimary => getArgb(_materialDynamicColors.onPrimary);

  int get primaryContainer => getArgb(_materialDynamicColors.primaryContainer);

  int get onPrimaryContainer =>
      getArgb(_materialDynamicColors.onPrimaryContainer);

  int get primaryFixed => getArgb(_materialDynamicColors.primaryFixed);

  int get primaryFixedDim => getArgb(_materialDynamicColors.primaryFixedDim);

  int get onPrimaryFixed => getArgb(_materialDynamicColors.onPrimaryFixed);

  int get onPrimaryFixedVariant =>
      getArgb(_materialDynamicColors.onPrimaryFixedVariant);

  int get inversePrimary => getArgb(_materialDynamicColors.inversePrimary);

  int get secondary => getArgb(_materialDynamicColors.secondary);

  int get secondaryDim => getArgb(_materialDynamicColors.secondaryDim);

  int get onSecondary => getArgb(_materialDynamicColors.onSecondary);

  int get secondaryContainer =>
      getArgb(_materialDynamicColors.secondaryContainer);

  int get onSecondaryContainer =>
      getArgb(_materialDynamicColors.onSecondaryContainer);

  int get secondaryFixed => getArgb(_materialDynamicColors.secondaryFixed);

  int get secondaryFixedDim =>
      getArgb(_materialDynamicColors.secondaryFixedDim);

  int get onSecondaryFixed => getArgb(_materialDynamicColors.onSecondaryFixed);

  int get onSecondaryFixedVariant =>
      getArgb(_materialDynamicColors.onSecondaryFixedVariant);

  int get tertiary => getArgb(_materialDynamicColors.tertiary);

  int get tertiaryDim => getArgb(_materialDynamicColors.tertiaryDim);

  int get onTertiary => getArgb(_materialDynamicColors.onTertiary);

  int get tertiaryContainer =>
      getArgb(_materialDynamicColors.tertiaryContainer);

  int get onTertiaryContainer =>
      getArgb(_materialDynamicColors.onTertiaryContainer);

  int get tertiaryFixed => getArgb(_materialDynamicColors.tertiaryFixed);

  int get tertiaryFixedDim => getArgb(_materialDynamicColors.tertiaryFixedDim);

  int get onTertiaryFixed => getArgb(_materialDynamicColors.onTertiaryFixed);

  int get onTertiaryFixedVariant =>
      getArgb(_materialDynamicColors.onTertiaryFixedVariant);

  int get error => getArgb(_materialDynamicColors.error);

  int get errorDim => getArgb(_materialDynamicColors.errorDim);

  int get onError => getArgb(_materialDynamicColors.onError);

  int get errorContainer => getArgb(_materialDynamicColors.errorContainer);

  int get onErrorContainer => getArgb(_materialDynamicColors.onErrorContainer);

  int get controlActivated => getArgb(_materialDynamicColors.controlActivated);

  int get controlNormal => getArgb(_materialDynamicColors.controlNormal);

  int get controlHighlight => getArgb(_materialDynamicColors.controlHighlight);

  int get textPrimaryInverse =>
      getArgb(_materialDynamicColors.textPrimaryInverse);

  int get textSecondaryAndTertiaryInverse =>
      getArgb(_materialDynamicColors.textSecondaryAndTertiaryInverse);

  int get textPrimaryInverseDisableOnly =>
      getArgb(_materialDynamicColors.textPrimaryInverseDisableOnly);

  int get textSecondaryAndTertiaryInverseDisabled =>
      getArgb(_materialDynamicColors.textSecondaryAndTertiaryInverseDisabled);

  int get textHintInverse => getArgb(_materialDynamicColors.textHintInverse);
}
