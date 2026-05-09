part of 'color_theme.dart';

abstract class _ColorThemeDataFromPalette extends ColorThemeData {
  const _ColorThemeDataFromPalette(
    BaselinePaletteThemeData palette, {
    ColorThemeDataPartial overrides = const .from(),
  }) : _palette = palette,
       _overrides = overrides;

  final BaselinePaletteThemeData _palette;
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get brightness;

  @override
  Color get primaryPaletteKeyColor => primary;

  @override
  Color get secondaryPaletteKeyColor => secondary;

  @override
  Color get tertiaryPaletteKeyColor => tertiary;

  @override
  Color get neutralPaletteKeyColor => surface;

  @override
  Color get neutralVariantPaletteKeyColor => surfaceVariant;

  @override
  Color get errorPaletteKeyColor => error;

  @override
  Color get background => surface;

  @override
  Color get onBackground => onSurface;

  @override
  Color get surface;

  @override
  Color get surfaceDim;

  @override
  Color get surfaceBright;

  @override
  Color get surfaceContainerLowest;

  @override
  Color get surfaceContainerLow;

  @override
  Color get surfaceContainer;

  @override
  Color get surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest;

  @override
  Color get onSurface;

  @override
  Color get surfaceVariant;

  @override
  Color get onSurfaceVariant;

  @override
  Color get outline;

  @override
  Color get outlineVariant;

  @override
  Color get inverseSurface;

  @override
  Color get inverseOnSurface;

  @override
  Color get shadow => _palette.neutral0;

  @override
  Color get scrim => _palette.neutral0;

  @override
  Color get surfaceTint => primary;

  @override
  Color get primary;

  @override
  Color get primaryDim => primary;

  @override
  Color get onPrimary;

  @override
  Color get primaryContainer;

  @override
  Color get onPrimaryContainer;

  @override
  Color get primaryFixed;

  @override
  Color get primaryFixedDim;

  @override
  Color get onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant;

  @override
  Color get inversePrimary;

  @override
  Color get secondary;

  @override
  Color get secondaryDim => secondary;

  @override
  Color get onSecondary;

  @override
  Color get secondaryContainer;

  @override
  Color get onSecondaryContainer;

  @override
  Color get secondaryFixed;

  @override
  Color get secondaryFixedDim;

  @override
  Color get onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant;

  @override
  Color get tertiary;

  @override
  Color get tertiaryDim => tertiary;

  @override
  Color get onTertiary;

  @override
  Color get tertiaryContainer;

  @override
  Color get onTertiaryContainer;

  @override
  Color get tertiaryFixed;

  @override
  Color get tertiaryFixedDim;

  @override
  Color get onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant;

  @override
  Color get error;

  @override
  Color get errorDim => error;

  @override
  Color get onError;

  @override
  Color get errorContainer;

  @override
  Color get onErrorContainer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorThemeDataFromPalette &&
          _palette == other._palette &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(runtimeType, _palette, _overrides);
}

class _ColorThemeDataFromPaletteLightDefaultContrast
    extends _ColorThemeDataFromPalette {
  const _ColorThemeDataFromPaletteLightDefaultContrast(super.palette);

  @override
  Brightness get brightness => .light;

  @override
  Color get primary => _palette.primary40;

  @override
  Color get onPrimary => _palette.primary100;

  @override
  Color get primaryContainer => _palette.primary90;

  @override
  Color get onPrimaryContainer => _palette.primary30;

  @override
  Color get secondary => _palette.secondary40;

  @override
  Color get onSecondary => _palette.secondary100;

  @override
  Color get secondaryContainer => _palette.secondary90;

  @override
  Color get onSecondaryContainer => _palette.secondary30;

  @override
  Color get tertiary => _palette.tertiary40;

  @override
  Color get onTertiary => _palette.tertiary100;

  @override
  Color get tertiaryContainer => _palette.tertiary90;

  @override
  Color get onTertiaryContainer => _palette.tertiary30;

  @override
  Color get error => _palette.error40;

  @override
  Color get onError => _palette.error100;

  @override
  Color get errorContainer => _palette.error90;

  @override
  Color get onErrorContainer => _palette.error30;

  @override
  Color get surface => _palette.neutral98;

  @override
  Color get onSurface => _palette.neutral10;

  @override
  Color get surfaceVariant => _palette.neutralVariant90;

  @override
  Color get onSurfaceVariant => _palette.neutralVariant30;

  @override
  Color get surfaceContainerHighest => _palette.neutral90;

  @override
  Color get surfaceContainerHigh => _palette.neutral92;

  @override
  Color get surfaceContainer => _palette.neutral94;

  @override
  Color get surfaceContainerLow => _palette.neutral96;

  @override
  Color get surfaceContainerLowest => _palette.neutral100;

  @override
  Color get inverseSurface => _palette.neutral20;

  @override
  Color get inverseOnSurface => _palette.neutral95;

  @override
  Color get outline => _palette.neutralVariant50;

  @override
  Color get outlineVariant => _palette.neutralVariant80;

  @override
  Color get primaryFixed => _palette.primary90;

  @override
  Color get onPrimaryFixed => _palette.primary10;

  @override
  Color get primaryFixedDim => _palette.primary80;

  @override
  Color get onPrimaryFixedVariant => _palette.primary30;

  @override
  Color get inversePrimary => _palette.primary80;

  @override
  Color get secondaryFixed => _palette.secondary90;

  @override
  Color get onSecondaryFixed => _palette.secondary10;

  @override
  Color get secondaryFixedDim => _palette.secondary80;

  @override
  Color get onSecondaryFixedVariant => _palette.secondary30;

  @override
  Color get tertiaryFixed => _palette.tertiary90;

  @override
  Color get onTertiaryFixed => _palette.tertiary10;

  @override
  Color get tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get onTertiaryFixedVariant => _palette.tertiary30;

  @override
  Color get surfaceBright => _palette.neutral98;

  @override
  Color get surfaceDim => _palette.neutral87;
}

class _ColorThemeDataFromPaletteDarkDefaultContrast
    extends _ColorThemeDataFromPalette {
  const _ColorThemeDataFromPaletteDarkDefaultContrast(super.palette);

  @override
  Brightness get brightness => .dark;

  @override
  Color get primary => _palette.primary80;

  @override
  Color get onPrimary => _palette.primary20;

  @override
  Color get primaryContainer => _palette.primary30;

  @override
  Color get onPrimaryContainer => _palette.primary90;

  @override
  Color get secondary => _palette.secondary80;

  @override
  Color get onSecondary => _palette.secondary20;

  @override
  Color get secondaryContainer => _palette.secondary30;

  @override
  Color get onSecondaryContainer => _palette.secondary90;

  @override
  Color get tertiary => _palette.tertiary80;

  @override
  Color get onTertiary => _palette.tertiary20;

  @override
  Color get tertiaryContainer => _palette.tertiary30;

  @override
  Color get onTertiaryContainer => _palette.tertiary90;

  @override
  Color get error => _palette.error80;

  @override
  Color get onError => _palette.error20;

  @override
  Color get errorContainer => _palette.error30;

  @override
  Color get onErrorContainer => _palette.error90;

  @override
  Color get surface => _palette.neutral6;

  @override
  Color get onSurface => _palette.neutral90;

  @override
  Color get surfaceVariant => _palette.neutralVariant30;

  @override
  Color get onSurfaceVariant => _palette.neutralVariant80;

  @override
  Color get surfaceContainerHighest => _palette.neutral22;

  @override
  Color get surfaceContainerHigh => _palette.neutral17;

  @override
  Color get surfaceContainer => _palette.neutral12;

  @override
  Color get surfaceContainerLow => _palette.neutral10;

  @override
  Color get surfaceContainerLowest => _palette.neutral4;

  @override
  Color get inverseSurface => _palette.neutral90;

  @override
  Color get inverseOnSurface => _palette.neutral20;

  @override
  Color get outline => _palette.neutralVariant60;

  @override
  Color get outlineVariant => _palette.neutralVariant30;

  @override
  Color get primaryFixed => _palette.primary90;

  @override
  Color get onPrimaryFixed => _palette.primary10;

  @override
  Color get primaryFixedDim => _palette.primary80;

  @override
  Color get onPrimaryFixedVariant => _palette.primary30;

  @override
  Color get inversePrimary => _palette.primary40;

  @override
  Color get secondaryFixed => _palette.secondary90;

  @override
  Color get onSecondaryFixed => _palette.secondary10;

  @override
  Color get secondaryFixedDim => _palette.secondary80;

  @override
  Color get onSecondaryFixedVariant => _palette.secondary30;

  @override
  Color get tertiaryFixed => _palette.tertiary90;

  @override
  Color get onTertiaryFixed => _palette.tertiary10;

  @override
  Color get tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get onTertiaryFixedVariant => _palette.tertiary30;

  @override
  Color get surfaceBright => _palette.neutral24;

  @override
  Color get surfaceDim => _palette.neutral6;
}
