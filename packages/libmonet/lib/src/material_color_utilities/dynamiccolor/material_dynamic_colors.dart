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
      scheme.isDark ? surfaceBright : surfaceDim;

  late final DynamicColor primaryPaletteKeyColor =
      _colorSpec.primaryPaletteKeyColor;

  late final DynamicColor secondaryPaletteKeyColor =
      _colorSpec.secondaryPaletteKeyColor;

  late final DynamicColor tertiaryPaletteKeyColor =
      _colorSpec.tertiaryPaletteKeyColor;

  late final DynamicColor neutralPaletteKeyColor =
      _colorSpec.neutralPaletteKeyColor;

  late final DynamicColor neutralVariantPaletteKeyColor =
      _colorSpec.neutralVariantPaletteKeyColor;

  late final DynamicColor errorPaletteKeyColor =
      _colorSpec.errorPaletteKeyColor;

  late final DynamicColor background = _colorSpec.background;

  late final DynamicColor onBackground = _colorSpec.onBackground;

  late final DynamicColor surface = _colorSpec.surface;

  late final DynamicColor surfaceDim = _colorSpec.surfaceDim;

  late final DynamicColor surfaceBright = _colorSpec.surfaceBright;

  late final DynamicColor surfaceContainerLowest =
      _colorSpec.surfaceContainerLowest;

  late final DynamicColor surfaceContainerLow = _colorSpec.surfaceContainerLow;

  late final DynamicColor surfaceContainer = _colorSpec.surfaceContainer;

  late final DynamicColor surfaceContainerHigh =
      _colorSpec.surfaceContainerHigh;

  late final DynamicColor surfaceContainerHighest =
      _colorSpec.surfaceContainerHighest;

  late final DynamicColor onSurface = _colorSpec.onSurface;

  late final DynamicColor surfaceVariant = _colorSpec.surfaceVariant;

  late final DynamicColor onSurfaceVariant = _colorSpec.onSurfaceVariant;

  late final DynamicColor inverseSurface = _colorSpec.inverseSurface;

  late final DynamicColor inverseOnSurface = _colorSpec.inverseOnSurface;

  late final DynamicColor outline = _colorSpec.outline;

  late final DynamicColor outlineVariant = _colorSpec.outlineVariant;

  late final DynamicColor shadow = _colorSpec.shadow;

  late final DynamicColor scrim = _colorSpec.scrim;

  late final DynamicColor surfaceTint = _colorSpec.surfaceTint;

  late final DynamicColor primary = _colorSpec.primary;

  late final DynamicColor primaryDim = _colorSpec.primaryDim;

  late final DynamicColor onPrimary = _colorSpec.onPrimary;

  late final DynamicColor primaryContainer = _colorSpec.primaryContainer;

  late final DynamicColor onPrimaryContainer = _colorSpec.onPrimaryContainer;

  late final DynamicColor inversePrimary = _colorSpec.inversePrimary;

  late final DynamicColor primaryFixed = _colorSpec.primaryFixed;

  late final DynamicColor primaryFixedDim = _colorSpec.primaryFixedDim;

  late final DynamicColor onPrimaryFixed = _colorSpec.onPrimaryFixed;

  late final DynamicColor onPrimaryFixedVariant =
      _colorSpec.onPrimaryFixedVariant;

  late final DynamicColor secondary = _colorSpec.secondary;

  late final DynamicColor secondaryDim = _colorSpec.secondaryDim;

  late final DynamicColor onSecondary = _colorSpec.onSecondary;

  late final DynamicColor secondaryContainer = _colorSpec.secondaryContainer;

  late final DynamicColor onSecondaryContainer =
      _colorSpec.onSecondaryContainer;

  late final DynamicColor secondaryFixed = _colorSpec.secondaryFixed;

  late final DynamicColor secondaryFixedDim = _colorSpec.secondaryFixedDim;

  late final DynamicColor onSecondaryFixed = _colorSpec.onSecondaryFixed;

  late final DynamicColor onSecondaryFixedVariant =
      _colorSpec.onSecondaryFixedVariant;

  late final DynamicColor tertiary = _colorSpec.tertiary;

  late final DynamicColor tertiaryDim = _colorSpec.tertiaryDim;

  late final DynamicColor onTertiary = _colorSpec.onTertiary;

  late final DynamicColor tertiaryContainer = _colorSpec.tertiaryContainer;

  late final DynamicColor onTertiaryContainer = _colorSpec.onTertiaryContainer;

  late final DynamicColor tertiaryFixed = _colorSpec.tertiaryFixed;

  late final DynamicColor tertiaryFixedDim = _colorSpec.tertiaryFixedDim;

  late final DynamicColor onTertiaryFixed = _colorSpec.onTertiaryFixed;

  late final DynamicColor onTertiaryFixedVariant =
      _colorSpec.onTertiaryFixedVariant;

  late final DynamicColor error = _colorSpec.error;

  late final DynamicColor errorDim = _colorSpec.errorDim;

  late final DynamicColor onError = _colorSpec.onError;

  late final DynamicColor errorContainer = _colorSpec.errorContainer;

  late final DynamicColor onErrorContainer = _colorSpec.onErrorContainer;

  late final DynamicColor controlActivated = _colorSpec.controlActivated;

  late final DynamicColor controlNormal = _colorSpec.controlNormal;

  late final DynamicColor controlHighlight = _colorSpec.controlHighlight;

  late final DynamicColor textPrimaryInverse = _colorSpec.textPrimaryInverse;

  late final DynamicColor textSecondaryAndTertiaryInverse =
      _colorSpec.textSecondaryAndTertiaryInverse;

  late final DynamicColor textPrimaryInverseDisableOnly =
      _colorSpec.textPrimaryInverseDisableOnly;

  late final DynamicColor textSecondaryAndTertiaryInverseDisabled =
      _colorSpec.textSecondaryAndTertiaryInverseDisabled;

  late final DynamicColor textHintInverse = _colorSpec.textHintInverse;

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
