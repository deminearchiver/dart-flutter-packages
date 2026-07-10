part of 'system_colors_platform_interface.dart';

abstract class MaterialSystemColorScheme extends SystemColorScheme {
  const MaterialSystemColorScheme();

  Color get primaryPaletteKeyColor;
  Color get secondaryPaletteKeyColor;
  Color get tertiaryPaletteKeyColor;
  Color get neutralPaletteKeyColor;
  Color get neutralVariantPaletteKeyColor;
  Color get errorPaletteKeyColor;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get outline;
  Color get outlineVariant;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get shadow;
  Color get scrim;
  Color get surfaceTint;
  Color get primary;
  Color get primaryDim;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get primaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixed;
  Color get onPrimaryFixedVariant;
  Color get inversePrimary;
  Color get secondary;
  Color get secondaryDim;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get secondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixed;
  Color get onSecondaryFixedVariant;
  Color get tertiary;
  Color get tertiaryDim;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get tertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixed;
  Color get onTertiaryFixedVariant;
  Color get error;
  Color get errorDim;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
  Color get controlActivated;
  Color get controlNormal;
  Color get controlHighlight;
  Color get textPrimaryInverse;
  Color get textSecondaryAndTertiaryInverse;
  Color get textPrimaryInverseDisableOnly;
  Color get textSecondaryAndTertiaryInverseDisabled;
  Color get textHintInverse;
}

abstract class AndroidSystemColorScheme extends MaterialSystemColorScheme {
  const AndroidSystemColorScheme();
}

abstract class WearosSystemColorScheme extends MaterialSystemColorScheme {
  const WearosSystemColorScheme();
}
