part of 'color_theme.dart';

mixin _ColorThemeDataFromPaletteMixin<
  T extends _ColorThemeDataFromPaletteMixin<T>
>
    on ColorThemeData {
  BaselinePaletteThemeData get _palette;
  ColorThemeDataPartial get _overrides;

  Brightness get _brightness;
  Color get _primaryPaletteKeyColor => primary;
  Color get _secondaryPaletteKeyColor => secondary;
  Color get _tertiaryPaletteKeyColor => tertiary;
  Color get _neutralPaletteKeyColor => surface;
  Color get _neutralVariantPaletteKeyColor => surfaceVariant;
  Color get _errorPaletteKeyColor => error;
  Color get _background => surface;
  Color get _onBackground => onSurface;
  Color get _surface;
  Color get _surfaceDim;
  Color get _surfaceBright;
  Color get _surfaceContainerLowest;
  Color get _surfaceContainerLow;
  Color get _surfaceContainer;
  Color get _surfaceContainerHigh;
  Color get _surfaceContainerHighest;
  Color get _onSurface;
  Color get _surfaceVariant;
  Color get _onSurfaceVariant;
  Color get _outline;
  Color get _outlineVariant;
  Color get _inverseSurface;
  Color get _inverseOnSurface;
  Color get _shadow => _palette.neutral0;
  Color get _scrim => _palette.neutral0;
  Color get _surfaceTint => primary;
  Color get _primary;
  Color get _primaryDim => primary;
  Color get _onPrimary;
  Color get _primaryContainer;
  Color get _onPrimaryContainer;
  Color get _primaryFixed;
  Color get _primaryFixedDim;
  Color get _onPrimaryFixed;
  Color get _onPrimaryFixedVariant;
  Color get _inversePrimary;
  Color get _secondary;
  Color get _secondaryDim => secondary;
  Color get _onSecondary;
  Color get _secondaryContainer;
  Color get _onSecondaryContainer;
  Color get _secondaryFixed;
  Color get _secondaryFixedDim;
  Color get _onSecondaryFixed;
  Color get _onSecondaryFixedVariant;
  Color get _tertiary;
  Color get _tertiaryDim => tertiary;
  Color get _onTertiary;
  Color get _tertiaryContainer;
  Color get _onTertiaryContainer;
  Color get _tertiaryFixed;
  Color get _tertiaryFixedDim;
  Color get _onTertiaryFixed;
  Color get _onTertiaryFixedVariant;
  Color get _error;
  Color get _errorDim => error;
  Color get _onError;
  Color get _errorContainer;
  Color get _onErrorContainer;

  T _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  });

  @override
  Brightness get brightness => _overrides.brightness ?? _brightness;

  @override
  Color get primaryPaletteKeyColor =>
      _overrides.primaryPaletteKeyColor ?? _primaryPaletteKeyColor;

  @override
  Color get secondaryPaletteKeyColor =>
      _overrides.secondaryPaletteKeyColor ?? _secondaryPaletteKeyColor;

  @override
  Color get tertiaryPaletteKeyColor =>
      _overrides.tertiaryPaletteKeyColor ?? _tertiaryPaletteKeyColor;

  @override
  Color get neutralPaletteKeyColor =>
      _overrides.neutralPaletteKeyColor ?? _neutralPaletteKeyColor;

  @override
  Color get neutralVariantPaletteKeyColor =>
      _overrides.neutralVariantPaletteKeyColor ??
      _neutralVariantPaletteKeyColor;

  @override
  Color get errorPaletteKeyColor =>
      _overrides.errorPaletteKeyColor ?? _errorPaletteKeyColor;

  @override
  Color get background => _overrides.background ?? _background;

  @override
  Color get onBackground => _overrides.onBackground ?? _onBackground;

  @override
  Color get surface => _overrides.surface ?? _surface;

  @override
  Color get surfaceDim => _overrides.surfaceDim ?? _surfaceDim;

  @override
  Color get surfaceBright => _overrides.surfaceBright ?? _surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _overrides.surfaceContainerLowest ?? _surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _overrides.surfaceContainerLow ?? _surfaceContainerLow;

  @override
  Color get surfaceContainer =>
      _overrides.surfaceContainer ?? _surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _overrides.surfaceContainerHigh ?? _surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _overrides.surfaceContainerHighest ?? _surfaceContainerHighest;

  @override
  Color get onSurface => _overrides.onSurface ?? _onSurface;

  @override
  Color get surfaceVariant => _overrides.surfaceVariant ?? _surfaceVariant;

  @override
  Color get onSurfaceVariant =>
      _overrides.onSurfaceVariant ?? _onSurfaceVariant;

  @override
  Color get outline => _overrides.outline ?? _outline;

  @override
  Color get outlineVariant => _overrides.outlineVariant ?? _outlineVariant;

  @override
  Color get inverseSurface => _overrides.inverseSurface ?? _inverseSurface;

  @override
  Color get inverseOnSurface =>
      _overrides.inverseOnSurface ?? _inverseOnSurface;

  @override
  Color get shadow => _overrides.shadow ?? _shadow;

  @override
  Color get scrim => _overrides.scrim ?? _scrim;

  @override
  Color get surfaceTint => _overrides.surfaceTint ?? _surfaceTint;

  @override
  Color get primary => _overrides.primary ?? _primary;

  @override
  Color get primaryDim => _overrides.primaryDim ?? _primaryDim;

  @override
  Color get onPrimary => _overrides.onPrimary ?? _onPrimary;

  @override
  Color get primaryContainer =>
      _overrides.primaryContainer ?? _primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _overrides.onPrimaryContainer ?? _onPrimaryContainer;

  @override
  Color get primaryFixed => _overrides.primaryFixed ?? _primaryFixed;

  @override
  Color get primaryFixedDim => _overrides.primaryFixedDim ?? _primaryFixedDim;

  @override
  Color get onPrimaryFixed => _overrides.onPrimaryFixed ?? _onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _overrides.onPrimaryFixedVariant ?? _onPrimaryFixedVariant;

  @override
  Color get inversePrimary => _overrides.inversePrimary ?? _inversePrimary;

  @override
  Color get secondary => _overrides.secondary ?? _secondary;

  @override
  Color get secondaryDim => _overrides.secondaryDim ?? _secondaryDim;

  @override
  Color get onSecondary => _overrides.onSecondary ?? _onSecondary;

  @override
  Color get secondaryContainer =>
      _overrides.secondaryContainer ?? _secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _overrides.onSecondaryContainer ?? _onSecondaryContainer;

  @override
  Color get secondaryFixed => _overrides.secondaryFixed ?? _secondaryFixed;

  @override
  Color get secondaryFixedDim =>
      _overrides.secondaryFixedDim ?? _secondaryFixedDim;

  @override
  Color get onSecondaryFixed =>
      _overrides.onSecondaryFixed ?? _onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _overrides.onSecondaryFixedVariant ?? _onSecondaryFixedVariant;

  @override
  Color get tertiary => _overrides.tertiary ?? _tertiary;

  @override
  Color get tertiaryDim => _overrides.tertiaryDim ?? _tertiaryDim;

  @override
  Color get onTertiary => _overrides.onTertiary ?? _onTertiary;

  @override
  Color get tertiaryContainer =>
      _overrides.tertiaryContainer ?? _tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _overrides.onTertiaryContainer ?? _onTertiaryContainer;

  @override
  Color get tertiaryFixed => _overrides.tertiaryFixed ?? _tertiaryFixed;

  @override
  Color get tertiaryFixedDim =>
      _overrides.tertiaryFixedDim ?? _tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => _overrides.onTertiaryFixed ?? _onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _overrides.onTertiaryFixedVariant ?? _onTertiaryFixedVariant;

  @override
  Color get error => _overrides.error ?? _error;

  @override
  Color get errorDim => _overrides.errorDim ?? _errorDim;

  @override
  Color get onError => _overrides.onError ?? _onError;

  @override
  Color get errorContainer => _overrides.errorContainer ?? _errorContainer;

  @override
  Color get onErrorContainer =>
      _overrides.onErrorContainer ?? _onErrorContainer;

  @override
  ColorThemeData copyWith({
    Brightness? brightness,
    Color? primaryPaletteKeyColor,
    Color? secondaryPaletteKeyColor,
    Color? tertiaryPaletteKeyColor,
    Color? neutralPaletteKeyColor,
    Color? neutralVariantPaletteKeyColor,
    Color? errorPaletteKeyColor,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? primary,
    Color? primaryDim,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
    Color? secondary,
    Color? secondaryDim,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? tertiaryDim,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? errorDim,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
  }) => _create(
    palette: _palette,
    overrides: _overrides.copyWith(
      brightness: brightness,
      primaryPaletteKeyColor: primaryPaletteKeyColor,
      secondaryPaletteKeyColor: secondaryPaletteKeyColor,
      tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
      neutralPaletteKeyColor: neutralPaletteKeyColor,
      neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
      errorPaletteKeyColor: errorPaletteKeyColor,
      background: background,
      onBackground: onBackground,
      surface: surface,
      surfaceDim: surfaceDim,
      surfaceBright: surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainer: surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      inverseSurface: inverseSurface,
      inverseOnSurface: inverseOnSurface,
      shadow: shadow,
      scrim: scrim,
      surfaceTint: surfaceTint,
      primary: primary,
      primaryDim: primaryDim,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      primaryFixed: primaryFixed,
      primaryFixedDim: primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed,
      onPrimaryFixedVariant: onPrimaryFixedVariant,
      inversePrimary: inversePrimary,
      secondary: secondary,
      secondaryDim: secondaryDim,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      secondaryFixed: secondaryFixed,
      secondaryFixedDim: secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed,
      onSecondaryFixedVariant: onSecondaryFixedVariant,
      tertiary: tertiary,
      tertiaryDim: tertiaryDim,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      tertiaryFixed: tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed,
      onTertiaryFixedVariant: onTertiaryFixedVariant,
      error: error,
      errorDim: errorDim,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
    ),
  );

  @override
  ColorThemeData maybeCopyWith({
    Brightness? brightness,
    Color? primaryPaletteKeyColor,
    Color? secondaryPaletteKeyColor,
    Color? tertiaryPaletteKeyColor,
    Color? neutralPaletteKeyColor,
    Color? neutralVariantPaletteKeyColor,
    Color? errorPaletteKeyColor,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? primary,
    Color? primaryDim,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
    Color? secondary,
    Color? secondaryDim,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? tertiaryDim,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? errorDim,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
  }) =>
      brightness != null &&
          primaryPaletteKeyColor != null &&
          secondaryPaletteKeyColor != null &&
          tertiaryPaletteKeyColor != null &&
          neutralPaletteKeyColor != null &&
          neutralVariantPaletteKeyColor != null &&
          errorPaletteKeyColor != null &&
          background != null &&
          onBackground != null &&
          surface != null &&
          surfaceDim != null &&
          surfaceBright != null &&
          surfaceContainerLowest != null &&
          surfaceContainerLow != null &&
          surfaceContainer != null &&
          surfaceContainerHigh != null &&
          surfaceContainerHighest != null &&
          onSurface != null &&
          surfaceVariant != null &&
          onSurfaceVariant != null &&
          outline != null &&
          outlineVariant != null &&
          inverseSurface != null &&
          inverseOnSurface != null &&
          shadow != null &&
          scrim != null &&
          surfaceTint != null &&
          primary != null &&
          primaryDim != null &&
          onPrimary != null &&
          primaryContainer != null &&
          onPrimaryContainer != null &&
          primaryFixed != null &&
          primaryFixedDim != null &&
          onPrimaryFixed != null &&
          onPrimaryFixedVariant != null &&
          inversePrimary != null &&
          secondary != null &&
          secondaryDim != null &&
          onSecondary != null &&
          secondaryContainer != null &&
          onSecondaryContainer != null &&
          secondaryFixed != null &&
          secondaryFixedDim != null &&
          onSecondaryFixed != null &&
          onSecondaryFixedVariant != null &&
          tertiary != null &&
          tertiaryDim != null &&
          onTertiary != null &&
          tertiaryContainer != null &&
          onTertiaryContainer != null &&
          tertiaryFixed != null &&
          tertiaryFixedDim != null &&
          onTertiaryFixed != null &&
          onTertiaryFixedVariant != null &&
          error != null &&
          errorDim != null &&
          onError != null &&
          errorContainer != null &&
          onErrorContainer != null
      ? .from(
          brightness: brightness,
          primaryPaletteKeyColor: primaryPaletteKeyColor,
          secondaryPaletteKeyColor: secondaryPaletteKeyColor,
          tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
          neutralPaletteKeyColor: neutralPaletteKeyColor,
          neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
          errorPaletteKeyColor: errorPaletteKeyColor,
          background: background,
          onBackground: onBackground,
          surface: surface,
          surfaceDim: surfaceDim,
          surfaceBright: surfaceBright,
          surfaceContainerLowest: surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow,
          surfaceContainer: surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh,
          surfaceContainerHighest: surfaceContainerHighest,
          onSurface: onSurface,
          surfaceVariant: surfaceVariant,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          outlineVariant: outlineVariant,
          inverseSurface: inverseSurface,
          inverseOnSurface: inverseOnSurface,
          shadow: shadow,
          scrim: scrim,
          surfaceTint: surfaceTint,
          primary: primary,
          primaryDim: primaryDim,
          onPrimary: onPrimary,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          inversePrimary: inversePrimary,
          secondary: secondary,
          secondaryDim: secondaryDim,
          onSecondary: onSecondary,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiary: tertiary,
          tertiaryDim: tertiaryDim,
          onTertiary: onTertiary,
          tertiaryContainer: tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          error: error,
          errorDim: errorDim,
          onError: onError,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
        )
      : brightness != null ||
            primaryPaletteKeyColor != null ||
            secondaryPaletteKeyColor != null ||
            tertiaryPaletteKeyColor != null ||
            neutralPaletteKeyColor != null ||
            neutralVariantPaletteKeyColor != null ||
            errorPaletteKeyColor != null ||
            background != null ||
            onBackground != null ||
            surface != null ||
            surfaceDim != null ||
            surfaceBright != null ||
            surfaceContainerLowest != null ||
            surfaceContainerLow != null ||
            surfaceContainer != null ||
            surfaceContainerHigh != null ||
            surfaceContainerHighest != null ||
            onSurface != null ||
            surfaceVariant != null ||
            onSurfaceVariant != null ||
            outline != null ||
            outlineVariant != null ||
            inverseSurface != null ||
            inverseOnSurface != null ||
            shadow != null ||
            scrim != null ||
            surfaceTint != null ||
            primary != null ||
            primaryDim != null ||
            onPrimary != null ||
            primaryContainer != null ||
            onPrimaryContainer != null ||
            primaryFixed != null ||
            primaryFixedDim != null ||
            onPrimaryFixed != null ||
            onPrimaryFixedVariant != null ||
            inversePrimary != null ||
            secondary != null ||
            secondaryDim != null ||
            onSecondary != null ||
            secondaryContainer != null ||
            onSecondaryContainer != null ||
            secondaryFixed != null ||
            secondaryFixedDim != null ||
            onSecondaryFixed != null ||
            onSecondaryFixedVariant != null ||
            tertiary != null ||
            tertiaryDim != null ||
            onTertiary != null ||
            tertiaryContainer != null ||
            onTertiaryContainer != null ||
            tertiaryFixed != null ||
            tertiaryFixedDim != null ||
            onTertiaryFixed != null ||
            onTertiaryFixedVariant != null ||
            error != null ||
            errorDim != null ||
            onError != null ||
            errorContainer != null ||
            onErrorContainer != null
      ? copyWith(
          brightness: brightness,
          primaryPaletteKeyColor: primaryPaletteKeyColor,
          secondaryPaletteKeyColor: secondaryPaletteKeyColor,
          tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
          neutralPaletteKeyColor: neutralPaletteKeyColor,
          neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
          errorPaletteKeyColor: errorPaletteKeyColor,
          background: background,
          onBackground: onBackground,
          surface: surface,
          surfaceDim: surfaceDim,
          surfaceBright: surfaceBright,
          surfaceContainerLowest: surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow,
          surfaceContainer: surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh,
          surfaceContainerHighest: surfaceContainerHighest,
          onSurface: onSurface,
          surfaceVariant: surfaceVariant,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          outlineVariant: outlineVariant,
          inverseSurface: inverseSurface,
          inverseOnSurface: inverseOnSurface,
          shadow: shadow,
          scrim: scrim,
          surfaceTint: surfaceTint,
          primary: primary,
          primaryDim: primaryDim,
          onPrimary: onPrimary,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          inversePrimary: inversePrimary,
          secondary: secondary,
          secondaryDim: secondaryDim,
          onSecondary: onSecondary,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiary: tertiary,
          tertiaryDim: tertiaryDim,
          onTertiary: onTertiary,
          tertiaryContainer: tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          error: error,
          errorDim: errorDim,
          onError: onError,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is T &&
          _palette == other._palette &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_palette, _overrides);
}

final class _ColorThemeDataFromPaletteLightNormalContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteLightNormalContrast
        > {
  const _ColorThemeDataFromPaletteLightNormalContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .light;

  @override
  Color get _primary => _palette.primary40;

  @override
  Color get _onPrimary => _palette.primary100;

  @override
  Color get _primaryContainer => _palette.primary90;

  @override
  Color get _onPrimaryContainer => _palette.primary30;

  @override
  Color get _secondary => _palette.secondary40;

  @override
  Color get _onSecondary => _palette.secondary100;

  @override
  Color get _secondaryContainer => _palette.secondary90;

  @override
  Color get _onSecondaryContainer => _palette.secondary30;

  @override
  Color get _tertiary => _palette.tertiary40;

  @override
  Color get _onTertiary => _palette.tertiary100;

  @override
  Color get _tertiaryContainer => _palette.tertiary90;

  @override
  Color get _onTertiaryContainer => _palette.tertiary30;

  @override
  Color get _error => _palette.error40;

  @override
  Color get _onError => _palette.error100;

  @override
  Color get _errorContainer => _palette.error90;

  @override
  Color get _onErrorContainer => _palette.error30;

  @override
  Color get _surface => _palette.neutral98;

  @override
  Color get _onSurface => _palette.neutral10;

  @override
  Color get _surfaceVariant => _palette.neutralVariant90;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant30;

  @override
  Color get _surfaceContainerHighest => _palette.neutral90;

  @override
  Color get _surfaceContainerHigh => _palette.neutral92;

  @override
  Color get _surfaceContainer => _palette.neutral94;

  @override
  Color get _surfaceContainerLow => _palette.neutral96;

  @override
  Color get _surfaceContainerLowest => _palette.neutral100;

  @override
  Color get _inverseSurface => _palette.neutral20;

  @override
  Color get _inverseOnSurface => _palette.neutral95;

  @override
  Color get _outline => _palette.neutralVariant50;

  @override
  Color get _outlineVariant => _palette.neutralVariant80;

  @override
  Color get _primaryFixed => _palette.primary90;

  @override
  Color get _onPrimaryFixed => _palette.primary10;

  @override
  Color get _primaryFixedDim => _palette.primary80;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary30;

  @override
  Color get _inversePrimary => _palette.primary80;

  @override
  Color get _secondaryFixed => _palette.secondary90;

  @override
  Color get _onSecondaryFixed => _palette.secondary10;

  @override
  Color get _secondaryFixedDim => _palette.secondary80;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary30;

  @override
  Color get _tertiaryFixed => _palette.tertiary90;

  @override
  Color get _onTertiaryFixed => _palette.tertiary10;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary30;

  @override
  Color get _surfaceBright => _palette.neutral98;

  @override
  Color get _surfaceDim => _palette.neutral87;

  @override
  _ColorThemeDataFromPaletteLightNormalContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}

final class _ColorThemeDataFromPaletteLightMediumContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteLightMediumContrast
        > {
  const _ColorThemeDataFromPaletteLightMediumContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .light;

  @override
  Color get _primary => _palette.primary30;

  @override
  Color get _onPrimary => _palette.primary100;

  @override
  Color get _primaryContainer => _palette.primary40;

  @override
  Color get _onPrimaryContainer => _palette.primary100;

  @override
  Color get _secondary => _palette.secondary30;

  @override
  Color get _onSecondary => _palette.secondary100;

  @override
  Color get _secondaryContainer => _palette.secondary40;

  @override
  Color get _onSecondaryContainer => _palette.secondary100;

  @override
  Color get _tertiary => _palette.tertiary30;

  @override
  Color get _onTertiary => _palette.tertiary100;

  @override
  Color get _tertiaryContainer => _palette.tertiary40;

  @override
  Color get _onTertiaryContainer => _palette.tertiary100;

  @override
  Color get _error => _palette.error30;

  @override
  Color get _onError => _palette.error100;

  @override
  Color get _errorContainer => _palette.error40;

  @override
  Color get _onErrorContainer => _palette.error100;

  @override
  Color get _surface => _palette.neutral98;

  @override
  Color get _onSurface => _palette.neutral0;

  @override
  Color get _surfaceVariant => _palette.neutralVariant90;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant20;

  @override
  Color get _surfaceContainerHighest => _palette.neutral90;

  @override
  Color get _surfaceContainerHigh => _palette.neutral92;

  @override
  Color get _surfaceContainer => _palette.neutral94;

  @override
  Color get _surfaceContainerLow => _palette.neutral96;

  @override
  Color get _surfaceContainerLowest => _palette.neutral100;

  @override
  Color get _inverseSurface => _palette.neutral20;

  @override
  Color get _inverseOnSurface => _palette.neutral100;

  @override
  Color get _outline => _palette.neutralVariant30;

  @override
  Color get _outlineVariant => _palette.neutralVariant50;

  @override
  Color get _primaryFixed => _palette.primary40;

  @override
  Color get _onPrimaryFixed => _palette.primary100;

  @override
  Color get _primaryFixedDim => _palette.primary30;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary100;

  @override
  Color get _inversePrimary => _palette.primary80;

  @override
  Color get _secondaryFixed => _palette.secondary40;

  @override
  Color get _onSecondaryFixed => _palette.secondary100;

  @override
  Color get _secondaryFixedDim => _palette.secondary30;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary100;

  @override
  Color get _tertiaryFixed => _palette.tertiary40;

  @override
  Color get _onTertiaryFixed => _palette.tertiary100;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary30;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary100;

  @override
  Color get _surfaceBright => _palette.neutral98;

  @override
  Color get _surfaceDim => _palette.neutral87;

  @override
  _ColorThemeDataFromPaletteLightMediumContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}

final class _ColorThemeDataFromPaletteLightHighContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteLightHighContrast
        > {
  const _ColorThemeDataFromPaletteLightHighContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .light;

  @override
  Color get _primary => _palette.primary20;

  @override
  Color get _onPrimary => _palette.primary100;

  @override
  Color get _primaryContainer => _palette.primary30;

  @override
  Color get _onPrimaryContainer => _palette.primary100;

  @override
  Color get _secondary => _palette.secondary20;

  @override
  Color get _onSecondary => _palette.secondary100;

  @override
  Color get _secondaryContainer => _palette.secondary30;

  @override
  Color get _onSecondaryContainer => _palette.secondary100;

  @override
  Color get _tertiary => _palette.tertiary20;

  @override
  Color get _onTertiary => _palette.tertiary100;

  @override
  Color get _tertiaryContainer => _palette.tertiary30;

  @override
  Color get _onTertiaryContainer => _palette.tertiary100;

  @override
  Color get _error => _palette.error20;

  @override
  Color get _onError => _palette.error100;

  @override
  Color get _errorContainer => _palette.error30;

  @override
  Color get _onErrorContainer => _palette.error100;

  @override
  Color get _surface => _palette.neutral98;

  @override
  Color get _onSurface => _palette.neutral0;

  @override
  Color get _surfaceVariant => _palette.neutralVariant90;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant0;

  @override
  Color get _surfaceContainerHighest => _palette.neutral90;

  @override
  Color get _surfaceContainerHigh => _palette.neutral92;

  @override
  Color get _surfaceContainer => _palette.neutral94;

  @override
  Color get _surfaceContainerLow => _palette.neutral96;

  @override
  Color get _surfaceContainerLowest => _palette.neutral100;

  @override
  Color get _inverseSurface => _palette.neutral20;

  @override
  Color get _inverseOnSurface => _palette.neutral100;

  @override
  Color get _outline => _palette.neutralVariant20;

  @override
  Color get _outlineVariant => _palette.neutralVariant30;

  @override
  Color get _primaryFixed => _palette.primary30;

  @override
  Color get _onPrimaryFixed => _palette.primary100;

  @override
  Color get _primaryFixedDim => _palette.primary20;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary100;

  @override
  Color get _inversePrimary => _palette.primary80;

  @override
  Color get _secondaryFixed => _palette.secondary30;

  @override
  Color get _onSecondaryFixed => _palette.secondary100;

  @override
  Color get _secondaryFixedDim => _palette.secondary20;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary100;

  @override
  Color get _tertiaryFixed => _palette.tertiary30;

  @override
  Color get _onTertiaryFixed => _palette.tertiary100;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary20;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary100;

  @override
  Color get _surfaceBright => _palette.neutral98;

  @override
  Color get _surfaceDim => _palette.neutral87;

  @override
  _ColorThemeDataFromPaletteLightHighContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}

final class _ColorThemeDataFromPaletteDarkNormalContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteDarkNormalContrast
        > {
  const _ColorThemeDataFromPaletteDarkNormalContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .dark;

  @override
  Color get _primary => _palette.primary80;

  @override
  Color get _onPrimary => _palette.primary20;

  @override
  Color get _primaryContainer => _palette.primary30;

  @override
  Color get _onPrimaryContainer => _palette.primary90;

  @override
  Color get _secondary => _palette.secondary80;

  @override
  Color get _onSecondary => _palette.secondary20;

  @override
  Color get _secondaryContainer => _palette.secondary30;

  @override
  Color get _onSecondaryContainer => _palette.secondary90;

  @override
  Color get _tertiary => _palette.tertiary80;

  @override
  Color get _onTertiary => _palette.tertiary20;

  @override
  Color get _tertiaryContainer => _palette.tertiary30;

  @override
  Color get _onTertiaryContainer => _palette.tertiary90;

  @override
  Color get _error => _palette.error80;

  @override
  Color get _onError => _palette.error20;

  @override
  Color get _errorContainer => _palette.error30;

  @override
  Color get _onErrorContainer => _palette.error90;

  @override
  Color get _surface => _palette.neutral6;

  @override
  Color get _onSurface => _palette.neutral90;

  @override
  Color get _surfaceVariant => _palette.neutralVariant30;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant80;

  @override
  Color get _surfaceContainerHighest => _palette.neutral22;

  @override
  Color get _surfaceContainerHigh => _palette.neutral17;

  @override
  Color get _surfaceContainer => _palette.neutral12;

  @override
  Color get _surfaceContainerLow => _palette.neutral10;

  @override
  Color get _surfaceContainerLowest => _palette.neutral4;

  @override
  Color get _inverseSurface => _palette.neutral90;

  @override
  Color get _inverseOnSurface => _palette.neutral20;

  @override
  Color get _outline => _palette.neutralVariant60;

  @override
  Color get _outlineVariant => _palette.neutralVariant30;

  @override
  Color get _primaryFixed => _palette.primary90;

  @override
  Color get _onPrimaryFixed => _palette.primary10;

  @override
  Color get _primaryFixedDim => _palette.primary80;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary30;

  @override
  Color get _inversePrimary => _palette.primary40;

  @override
  Color get _secondaryFixed => _palette.secondary90;

  @override
  Color get _onSecondaryFixed => _palette.secondary10;

  @override
  Color get _secondaryFixedDim => _palette.secondary80;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary30;

  @override
  Color get _tertiaryFixed => _palette.tertiary90;

  @override
  Color get _onTertiaryFixed => _palette.tertiary10;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary30;

  @override
  Color get _surfaceBright => _palette.neutral24;

  @override
  Color get _surfaceDim => _palette.neutral6;

  @override
  _ColorThemeDataFromPaletteDarkNormalContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}

final class _ColorThemeDataFromPaletteDarkMediumContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteDarkMediumContrast
        > {
  const _ColorThemeDataFromPaletteDarkMediumContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .dark;

  @override
  Color get _primary => _palette.primary90;

  @override
  Color get _onPrimary => _palette.primary10;

  @override
  Color get _primaryContainer => _palette.primary60;

  @override
  Color get _onPrimaryContainer => _palette.primary0;

  @override
  Color get _secondary => _palette.secondary90;

  @override
  Color get _onSecondary => _palette.secondary10;

  @override
  Color get _secondaryContainer => _palette.secondary60;

  @override
  Color get _onSecondaryContainer => _palette.secondary0;

  @override
  Color get _tertiary => _palette.tertiary90;

  @override
  Color get _onTertiary => _palette.tertiary10;

  @override
  Color get _tertiaryContainer => _palette.tertiary60;

  @override
  Color get _onTertiaryContainer => _palette.tertiary0;

  @override
  Color get _error => _palette.error90;

  @override
  Color get _onError => _palette.error10;

  @override
  Color get _errorContainer => _palette.error60;

  @override
  Color get _onErrorContainer => _palette.error0;

  @override
  Color get _surface => _palette.neutral6;

  @override
  Color get _onSurface => _palette.neutral100;

  @override
  Color get _surfaceVariant => _palette.neutralVariant30;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant90;

  @override
  Color get _surfaceContainerHighest => _palette.neutral22;

  @override
  Color get _surfaceContainerHigh => _palette.neutral17;

  @override
  Color get _surfaceContainer => _palette.neutral12;

  @override
  Color get _surfaceContainerLow => _palette.neutral10;

  @override
  Color get _surfaceContainerLowest => _palette.neutral4;

  @override
  Color get _inverseSurface => _palette.neutral90;

  @override
  Color get _inverseOnSurface => _palette.neutral10;

  @override
  Color get _outline => _palette.neutralVariant70;

  @override
  Color get _outlineVariant => _palette.neutralVariant60;

  @override
  Color get _primaryFixed => _palette.primary90;

  @override
  Color get _onPrimaryFixed => _palette.primary0;

  @override
  Color get _primaryFixedDim => _palette.primary80;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary20;

  @override
  Color get _inversePrimary => _palette.primary30;

  @override
  Color get _secondaryFixed => _palette.secondary90;

  @override
  Color get _onSecondaryFixed => _palette.secondary0;

  @override
  Color get _secondaryFixedDim => _palette.secondary80;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary20;

  @override
  Color get _tertiaryFixed => _palette.tertiary90;

  @override
  Color get _onTertiaryFixed => _palette.tertiary0;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary20;

  @override
  Color get _surfaceBright => _palette.neutral24;

  @override
  Color get _surfaceDim => _palette.neutral6;

  @override
  _ColorThemeDataFromPaletteDarkMediumContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}

final class _ColorThemeDataFromPaletteDarkHighContrast extends ColorThemeData
    with
        _ColorThemeDataFromPaletteMixin<
          _ColorThemeDataFromPaletteDarkHighContrast
        > {
  const _ColorThemeDataFromPaletteDarkHighContrast({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) : _palette = palette,
       _overrides = overrides ?? const .from();

  @override
  final BaselinePaletteThemeData _palette;

  @override
  final ColorThemeDataPartial _overrides;

  @override
  Brightness get _brightness => .dark;

  @override
  Color get _primary => _palette.primary95;

  @override
  Color get _onPrimary => _palette.primary0;

  @override
  Color get _primaryContainer => _palette.primary80;

  @override
  Color get _onPrimaryContainer => _palette.primary0;

  @override
  Color get _secondary => _palette.secondary95;

  @override
  Color get _onSecondary => _palette.secondary0;

  @override
  Color get _secondaryContainer => _palette.secondary80;

  @override
  Color get _onSecondaryContainer => _palette.secondary0;

  @override
  Color get _tertiary => _palette.tertiary95;

  @override
  Color get _onTertiary => _palette.tertiary0;

  @override
  Color get _tertiaryContainer => _palette.tertiary80;

  @override
  Color get _onTertiaryContainer => _palette.tertiary0;

  @override
  Color get _error => _palette.error95;

  @override
  Color get _onError => _palette.error0;

  @override
  Color get _errorContainer => _palette.error80;

  @override
  Color get _onErrorContainer => _palette.error0;

  @override
  Color get _surface => _palette.neutral6;

  @override
  Color get _onSurface => _palette.neutral100;

  @override
  Color get _surfaceVariant => _palette.neutralVariant30;

  @override
  Color get _onSurfaceVariant => _palette.neutralVariant100;

  @override
  Color get _surfaceContainerHighest => _palette.neutral22;

  @override
  Color get _surfaceContainerHigh => _palette.neutral17;

  @override
  Color get _surfaceContainer => _palette.neutral12;

  @override
  Color get _surfaceContainerLow => _palette.neutral10;

  @override
  Color get _surfaceContainerLowest => _palette.neutral4;

  @override
  Color get _inverseSurface => _palette.neutral90;

  @override
  Color get _inverseOnSurface => _palette.neutral0;

  @override
  Color get _outline => _palette.neutralVariant95;

  @override
  Color get _outlineVariant => _palette.neutralVariant80;

  @override
  Color get _primaryFixed => _palette.primary90;

  @override
  Color get _onPrimaryFixed => _palette.primary0;

  @override
  Color get _primaryFixedDim => _palette.primary80;

  @override
  Color get _onPrimaryFixedVariant => _palette.primary0;

  @override
  Color get _inversePrimary => _palette.primary20;

  @override
  Color get _secondaryFixed => _palette.secondary90;

  @override
  Color get _onSecondaryFixed => _palette.secondary0;

  @override
  Color get _secondaryFixedDim => _palette.secondary80;

  @override
  Color get _onSecondaryFixedVariant => _palette.secondary0;

  @override
  Color get _tertiaryFixed => _palette.tertiary90;

  @override
  Color get _onTertiaryFixed => _palette.tertiary0;

  @override
  Color get _tertiaryFixedDim => _palette.tertiary80;

  @override
  Color get _onTertiaryFixedVariant => _palette.tertiary0;

  @override
  Color get _surfaceBright => _palette.neutral24;

  @override
  Color get _surfaceDim => _palette.neutral6;

  @override
  _ColorThemeDataFromPaletteDarkHighContrast _create({
    required BaselinePaletteThemeData palette,
    ColorThemeDataPartial? overrides,
  }) => .new(palette: palette, overrides: overrides);
}
