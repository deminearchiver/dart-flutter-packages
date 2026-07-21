// ignore_for_file: deprecated_member_use

part of 'color_theme.dart';

abstract class ColorThemeData extends ColorThemeDataPartial {
  const ColorThemeData();

  const factory ColorThemeData.from({
    required Brightness brightness,
    required Color primaryPaletteKeyColor,
    required Color secondaryPaletteKeyColor,
    required Color tertiaryPaletteKeyColor,
    required Color neutralPaletteKeyColor,
    required Color neutralVariantPaletteKeyColor,
    required Color errorPaletteKeyColor,
    required Color background,
    required Color onBackground,
    required Color surface,
    required Color surfaceDim,
    required Color surfaceBright,
    required Color surfaceContainerLowest,
    required Color surfaceContainerLow,
    required Color surfaceContainer,
    required Color surfaceContainerHigh,
    required Color surfaceContainerHighest,
    required Color onSurface,
    required Color surfaceVariant,
    required Color onSurfaceVariant,
    required Color outline,
    required Color outlineVariant,
    required Color inverseSurface,
    required Color inverseOnSurface,
    required Color shadow,
    required Color scrim,
    required Color surfaceTint,
    required Color primary,
    required Color primaryDim,
    required Color onPrimary,
    required Color primaryContainer,
    required Color onPrimaryContainer,
    required Color primaryFixed,
    required Color primaryFixedDim,
    required Color onPrimaryFixed,
    required Color onPrimaryFixedVariant,
    required Color inversePrimary,
    required Color secondary,
    required Color secondaryDim,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color onSecondaryContainer,
    required Color secondaryFixed,
    required Color secondaryFixedDim,
    required Color onSecondaryFixed,
    required Color onSecondaryFixedVariant,
    required Color tertiary,
    required Color tertiaryDim,
    required Color onTertiary,
    required Color tertiaryContainer,
    required Color onTertiaryContainer,
    required Color tertiaryFixed,
    required Color tertiaryFixedDim,
    required Color onTertiaryFixed,
    required Color onTertiaryFixedVariant,
    required Color error,
    required Color errorDim,
    required Color onError,
    required Color errorContainer,
    required Color onErrorContainer,
  }) = _ColorThemeData;

  factory ColorThemeData.fromDynamicScheme(DynamicScheme scheme) =>
      _ColorThemeDataFromDynamicScheme(scheme);

  factory ColorThemeData.fromSeed({
    DynamicSchemeSourceColor? sourceColor,
    DynamicSchemeVariant variant = .tonalSpot,
    required Brightness brightness,
    DynamicSchemePlatform platform = DynamicScheme.defaultPlatform,
    double contrastLevel = 0.0,
    DynamicSchemeSpecVersion specVersion = DynamicScheme.defaultSpecVersion,
  }) {
    sourceColor ??= .fromArgb(0xFF6750A4);
    final scheme = DynamicScheme.withDefaults(
      sourceColor: sourceColor,
      variant: variant,
      isDark: brightness == .dark,
      platform: platform,
      contrastLevel: contrastLevel,
      specVersion: specVersion,
    );
    return .fromDynamicScheme(scheme);
  }

  factory ColorThemeData.defaults({
    required PaletteThemeData paletteTheme,
    required Brightness brightness,
    double contrastLevel = 0.0,
    ColorThemeDataPartial? overrides,
  }) {
    final isDark = brightness == .dark;
    late final normal = isDark
        ? _ColorThemeDataDefaultsDarkNormalContrast(
            palette: paletteTheme,
            overrides: overrides,
          )
        : _ColorThemeDataDefaultsLightNormalContrast(
            palette: paletteTheme,
            overrides: overrides,
          );
    late final medium = isDark
        ? _ColorThemeDataDefaultsDarkMediumContrast(
            palette: paletteTheme,
            overrides: overrides,
          )
        : _ColorThemeDataDefaultsLightMediumContrast(
            palette: paletteTheme,
            overrides: overrides,
          );
    late final high = isDark
        ? _ColorThemeDataDefaultsDarkHighContrast(
            palette: paletteTheme,
            overrides: overrides,
          )
        : _ColorThemeDataDefaultsLightHighContrast(
            palette: paletteTheme,
            overrides: overrides,
          );
    return switch (contrastLevel) {
      < 0.25 => normal,
      < 0.75 => medium,
      _ => high,
    };
    // TODO: explain why lerp can't be used here (breaks contrast ratio)
    // return switch (contrastLevel) {
    //   <= 0.0 => normal,
    //   0.5 => medium,
    //   < 0.5 => .lerp(normal, medium, contrastLevel / 0.5),
    //   < 1.0 => .lerp(medium, high, (contrastLevel - 0.5) / 0.5),
    //   _ => high,
    // };
  }

  factory ColorThemeData.defaultsOf(
    BuildContext context, {
    Brightness? brightness,
    double? contrastLevel,
    ColorThemeDataPartial? overrides,
  }) => .defaults(
    paletteTheme: PaletteTheme.of(context),
    brightness:
        brightness ??
        Theme.maybeBrightnessOf(context) ??
        MediaQuery.platformBrightnessOf(context),
    contrastLevel:
        contrastLevel ?? (MediaQuery.highContrastOf(context) ? 1.0 : 0.0),
    overrides: overrides,
  );

  @override
  Brightness get brightness;

  @override
  Color get primaryPaletteKeyColor;

  @override
  Color get secondaryPaletteKeyColor;

  @override
  Color get tertiaryPaletteKeyColor;

  @override
  Color get neutralPaletteKeyColor;

  @override
  Color get neutralVariantPaletteKeyColor;

  @override
  Color get errorPaletteKeyColor;

  @override
  Color get background;

  @override
  Color get onBackground;

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
  Color get shadow;

  @override
  Color get scrim;

  @override
  Color get surfaceTint;

  @override
  Color get primary;

  @override
  Color get primaryDim;

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
  Color get secondaryDim;

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
  Color get tertiaryDim;

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
  Color get errorDim;

  @override
  Color get onError;

  @override
  Color get errorContainer;

  @override
  Color get onErrorContainer;

  @override
  ColorThemeData copy() => copyWith();

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
  }) => .from(
    brightness: brightness ?? this.brightness,
    primaryPaletteKeyColor:
        primaryPaletteKeyColor ?? this.primaryPaletteKeyColor,
    secondaryPaletteKeyColor:
        secondaryPaletteKeyColor ?? this.secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor:
        tertiaryPaletteKeyColor ?? this.tertiaryPaletteKeyColor,
    neutralPaletteKeyColor:
        neutralPaletteKeyColor ?? this.neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor:
        neutralVariantPaletteKeyColor ?? this.neutralVariantPaletteKeyColor,
    errorPaletteKeyColor: errorPaletteKeyColor ?? this.errorPaletteKeyColor,
    background: background ?? this.background,
    onBackground: onBackground ?? this.onBackground,
    surface: surface ?? this.surface,
    surfaceDim: surfaceDim ?? this.surfaceDim,
    surfaceBright: surfaceBright ?? this.surfaceBright,
    surfaceContainerLowest:
        surfaceContainerLowest ?? this.surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
    surfaceContainer: surfaceContainer ?? this.surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
    surfaceContainerHighest:
        surfaceContainerHighest ?? this.surfaceContainerHighest,
    onSurface: onSurface ?? this.onSurface,
    surfaceVariant: surfaceVariant ?? this.surfaceVariant,
    onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    outline: outline ?? this.outline,
    outlineVariant: outlineVariant ?? this.outlineVariant,
    inverseSurface: inverseSurface ?? this.inverseSurface,
    inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
    shadow: shadow ?? this.shadow,
    scrim: scrim ?? this.scrim,
    surfaceTint: surfaceTint ?? this.surfaceTint,
    primary: primary ?? this.primary,
    primaryDim: primaryDim ?? this.primaryDim,
    onPrimary: onPrimary ?? this.onPrimary,
    primaryContainer: primaryContainer ?? this.primaryContainer,
    onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
    primaryFixed: primaryFixed ?? this.primaryFixed,
    primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
    onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
    onPrimaryFixedVariant: onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
    inversePrimary: inversePrimary ?? this.inversePrimary,
    secondary: secondary ?? this.secondary,
    secondaryDim: secondaryDim ?? this.secondaryDim,
    onSecondary: onSecondary ?? this.onSecondary,
    secondaryContainer: secondaryContainer ?? this.secondaryContainer,
    onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
    secondaryFixed: secondaryFixed ?? this.secondaryFixed,
    secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
    onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
    onSecondaryFixedVariant:
        onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
    tertiary: tertiary ?? this.tertiary,
    tertiaryDim: tertiaryDim ?? this.tertiaryDim,
    onTertiary: onTertiary ?? this.onTertiary,
    tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
    tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
    tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
    onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
    onTertiaryFixedVariant:
        onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
    error: error ?? this.error,
    errorDim: errorDim ?? this.errorDim,
    onError: onError ?? this.onError,
    errorContainer: errorContainer ?? this.errorContainer,
    onErrorContainer: onErrorContainer ?? this.onErrorContainer,
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
      brightness != null ||
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
  ColorThemeData merge(ColorThemeDataPartial? other) => other != null
      ? copyWith(
          brightness: other.brightness,
          primaryPaletteKeyColor: other.primaryPaletteKeyColor,
          secondaryPaletteKeyColor: other.secondaryPaletteKeyColor,
          tertiaryPaletteKeyColor: other.tertiaryPaletteKeyColor,
          neutralPaletteKeyColor: other.neutralPaletteKeyColor,
          neutralVariantPaletteKeyColor: other.neutralVariantPaletteKeyColor,
          errorPaletteKeyColor: other.errorPaletteKeyColor,
          background: other.background,
          onBackground: other.onBackground,
          surface: other.surface,
          surfaceDim: other.surfaceDim,
          surfaceBright: other.surfaceBright,
          surfaceContainerLowest: other.surfaceContainerLowest,
          surfaceContainerLow: other.surfaceContainerLow,
          surfaceContainer: other.surfaceContainer,
          surfaceContainerHigh: other.surfaceContainerHigh,
          surfaceContainerHighest: other.surfaceContainerHighest,
          onSurface: other.onSurface,
          surfaceVariant: other.surfaceVariant,
          onSurfaceVariant: other.onSurfaceVariant,
          outline: other.outline,
          outlineVariant: other.outlineVariant,
          inverseSurface: other.inverseSurface,
          inverseOnSurface: other.inverseOnSurface,
          shadow: other.shadow,
          scrim: other.scrim,
          surfaceTint: other.surfaceTint,
          primary: other.primary,
          primaryDim: other.primaryDim,
          onPrimary: other.onPrimary,
          primaryContainer: other.primaryContainer,
          onPrimaryContainer: other.onPrimaryContainer,
          primaryFixed: other.primaryFixed,
          primaryFixedDim: other.primaryFixedDim,
          onPrimaryFixed: other.onPrimaryFixed,
          onPrimaryFixedVariant: other.onPrimaryFixedVariant,
          inversePrimary: other.inversePrimary,
          secondary: other.secondary,
          secondaryDim: other.secondaryDim,
          onSecondary: other.onSecondary,
          secondaryContainer: other.secondaryContainer,
          onSecondaryContainer: other.onSecondaryContainer,
          secondaryFixed: other.secondaryFixed,
          secondaryFixedDim: other.secondaryFixedDim,
          onSecondaryFixed: other.onSecondaryFixed,
          onSecondaryFixedVariant: other.onSecondaryFixedVariant,
          tertiary: other.tertiary,
          tertiaryDim: other.tertiaryDim,
          onTertiary: other.onTertiary,
          tertiaryContainer: other.tertiaryContainer,
          onTertiaryContainer: other.onTertiaryContainer,
          tertiaryFixed: other.tertiaryFixed,
          tertiaryFixedDim: other.tertiaryFixedDim,
          onTertiaryFixed: other.onTertiaryFixed,
          onTertiaryFixedVariant: other.onTertiaryFixedVariant,
          error: other.error,
          errorDim: other.errorDim,
          onError: other.onError,
          errorContainer: other.errorContainer,
          onErrorContainer: other.onErrorContainer,
        )
      : copy();

  @override
  ColorThemeData maybeMerge(ColorThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          brightness: other.brightness,
          primaryPaletteKeyColor: other.primaryPaletteKeyColor,
          secondaryPaletteKeyColor: other.secondaryPaletteKeyColor,
          tertiaryPaletteKeyColor: other.tertiaryPaletteKeyColor,
          neutralPaletteKeyColor: other.neutralPaletteKeyColor,
          neutralVariantPaletteKeyColor: other.neutralVariantPaletteKeyColor,
          errorPaletteKeyColor: other.errorPaletteKeyColor,
          background: other.background,
          onBackground: other.onBackground,
          surface: other.surface,
          surfaceDim: other.surfaceDim,
          surfaceBright: other.surfaceBright,
          surfaceContainerLowest: other.surfaceContainerLowest,
          surfaceContainerLow: other.surfaceContainerLow,
          surfaceContainer: other.surfaceContainer,
          surfaceContainerHigh: other.surfaceContainerHigh,
          surfaceContainerHighest: other.surfaceContainerHighest,
          onSurface: other.onSurface,
          surfaceVariant: other.surfaceVariant,
          onSurfaceVariant: other.onSurfaceVariant,
          outline: other.outline,
          outlineVariant: other.outlineVariant,
          inverseSurface: other.inverseSurface,
          inverseOnSurface: other.inverseOnSurface,
          shadow: other.shadow,
          scrim: other.scrim,
          surfaceTint: other.surfaceTint,
          primary: other.primary,
          primaryDim: other.primaryDim,
          onPrimary: other.onPrimary,
          primaryContainer: other.primaryContainer,
          onPrimaryContainer: other.onPrimaryContainer,
          primaryFixed: other.primaryFixed,
          primaryFixedDim: other.primaryFixedDim,
          onPrimaryFixed: other.onPrimaryFixed,
          onPrimaryFixedVariant: other.onPrimaryFixedVariant,
          inversePrimary: other.inversePrimary,
          secondary: other.secondary,
          secondaryDim: other.secondaryDim,
          onSecondary: other.onSecondary,
          secondaryContainer: other.secondaryContainer,
          onSecondaryContainer: other.onSecondaryContainer,
          secondaryFixed: other.secondaryFixed,
          secondaryFixedDim: other.secondaryFixedDim,
          onSecondaryFixed: other.onSecondaryFixed,
          onSecondaryFixedVariant: other.onSecondaryFixedVariant,
          tertiary: other.tertiary,
          tertiaryDim: other.tertiaryDim,
          onTertiary: other.onTertiary,
          tertiaryContainer: other.tertiaryContainer,
          onTertiaryContainer: other.onTertiaryContainer,
          tertiaryFixed: other.tertiaryFixed,
          tertiaryFixedDim: other.tertiaryFixedDim,
          onTertiaryFixed: other.onTertiaryFixed,
          onTertiaryFixedVariant: other.onTertiaryFixedVariant,
          error: other.error,
          errorDim: other.errorDim,
          onError: other.onError,
          errorContainer: other.errorContainer,
          onErrorContainer: other.onErrorContainer,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  ColorThemeData get asConcrete => this;

  ColorSchemeLegacy get asLegacy => _ColorThemeDataAsLegacy(this);

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(EnumProperty<Brightness>("brightness", brightness))
      ..add(ColorProperty("primaryPaletteKeyColor", primaryPaletteKeyColor))
      ..add(ColorProperty("secondaryPaletteKeyColor", secondaryPaletteKeyColor))
      ..add(ColorProperty("tertiaryPaletteKeyColor", tertiaryPaletteKeyColor))
      ..add(ColorProperty("neutralPaletteKeyColor", neutralPaletteKeyColor))
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColor",
          neutralVariantPaletteKeyColor,
        ),
      )
      ..add(ColorProperty("errorPaletteKeyColor", errorPaletteKeyColor))
      ..add(ColorProperty("background", background))
      ..add(ColorProperty("onBackground", onBackground))
      ..add(ColorProperty("surface", surface))
      ..add(ColorProperty("surfaceDim", surfaceDim))
      ..add(ColorProperty("surfaceBright", surfaceBright))
      ..add(ColorProperty("surfaceContainerLowest", surfaceContainerLowest))
      ..add(ColorProperty("surfaceContainerLow", surfaceContainerLow))
      ..add(ColorProperty("surfaceContainer", surfaceContainer))
      ..add(ColorProperty("surfaceContainerHigh", surfaceContainerHigh))
      ..add(ColorProperty("surfaceContainerHighest", surfaceContainerHighest))
      ..add(ColorProperty("onSurface", onSurface))
      ..add(ColorProperty("surfaceVariant", surfaceVariant))
      ..add(ColorProperty("onSurfaceVariant", onSurfaceVariant))
      ..add(ColorProperty("outline", outline))
      ..add(ColorProperty("outlineVariant", outlineVariant))
      ..add(ColorProperty("inverseSurface", inverseSurface))
      ..add(ColorProperty("inverseOnSurface", inverseOnSurface))
      ..add(ColorProperty("shadow", shadow))
      ..add(ColorProperty("scrim", scrim))
      ..add(ColorProperty("surfaceTint", surfaceTint))
      ..add(ColorProperty("primary", primary))
      ..add(ColorProperty("primaryDim", primaryDim))
      ..add(ColorProperty("onPrimary", onPrimary))
      ..add(ColorProperty("primaryContainer", primaryContainer))
      ..add(ColorProperty("onPrimaryContainer", onPrimaryContainer))
      ..add(ColorProperty("primaryFixed", primaryFixed))
      ..add(ColorProperty("primaryFixedDim", primaryFixedDim))
      ..add(ColorProperty("onPrimaryFixed", onPrimaryFixed))
      ..add(ColorProperty("onPrimaryFixedVariant", onPrimaryFixedVariant))
      ..add(ColorProperty("inversePrimary", inversePrimary))
      ..add(ColorProperty("secondary", secondary))
      ..add(ColorProperty("secondaryDim", secondaryDim))
      ..add(ColorProperty("onSecondary", onSecondary))
      ..add(ColorProperty("secondaryContainer", secondaryContainer))
      ..add(ColorProperty("onSecondaryContainer", onSecondaryContainer))
      ..add(ColorProperty("secondaryFixed", secondaryFixed))
      ..add(ColorProperty("secondaryFixedDim", secondaryFixedDim))
      ..add(ColorProperty("onSecondaryFixed", onSecondaryFixed))
      ..add(ColorProperty("onSecondaryFixedVariant", onSecondaryFixedVariant))
      ..add(ColorProperty("tertiary", tertiary))
      ..add(ColorProperty("tertiaryDim", tertiaryDim))
      ..add(ColorProperty("onTertiary", onTertiary))
      ..add(ColorProperty("tertiaryContainer", tertiaryContainer))
      ..add(ColorProperty("onTertiaryContainer", onTertiaryContainer))
      ..add(ColorProperty("tertiaryFixed", tertiaryFixed))
      ..add(ColorProperty("tertiaryFixedDim", tertiaryFixedDim))
      ..add(ColorProperty("onTertiaryFixed", onTertiaryFixed))
      ..add(ColorProperty("onTertiaryFixedVariant", onTertiaryFixedVariant))
      ..add(ColorProperty("error", error))
      ..add(ColorProperty("errorDim", errorDim))
      ..add(ColorProperty("onError", onError))
      ..add(ColorProperty("errorContainer", errorContainer))
      ..add(ColorProperty("onErrorContainer", onErrorContainer));
  }

  static Future<ColorThemeData> fromImage({
    required ImageProvider image,
    DynamicSchemeVariant variant = .tonalSpot,
    required Brightness brightness,
    DynamicSchemePlatform platform = DynamicScheme.defaultPlatform,
    double contrastLevel = 0.0,
    DynamicSchemeSpecVersion specVersion = DynamicScheme.defaultSpecVersion,
  }) async => .fromSeed(
    sourceColor: .fromArgb(await _contentBasedSourceColor(image)),
    variant: variant,
    brightness: brightness,
    platform: platform,
    contrastLevel: contrastLevel,
    specVersion: specVersion,
  );

  /// Extracts dominant colors from an image and scores them for color scheme
  /// suitability, returning the most suitable color.
  static Future<int> _contentBasedSourceColor(ImageProvider image) async {
    final colorToCount = await _extractColorsFromImageProvider(image).then(
      (result) => result.colorToCount.map(
        (key, value) => MapEntry(_getArgbFromAbgr(key), value),
      ),
    );
    return Score.score(colorToCount, desired: 1).first;
  }

  /// Extracts bytes from an [ImageProvider] and returns a [QuantizerResult]
  /// containing the most dominant colors.
  static Future<QuantizerResult> _extractColorsFromImageProvider(
    ImageProvider imageProvider,
  ) async {
    final scaledImage = await _imageProviderToScaled(imageProvider);
    final imageBytes = await scaledImage.toByteData();

    final quantizerResult = const QuantizerCelebi().quantize(
      imageBytes!.buffer.asUint32List(),
      128,
      returnInputPixelToClusterPixel: true,
    );
    return quantizerResult;
  }

  /// Scale image size down to reduce computation time of color extraction.
  static Future<ui.Image> _imageProviderToScaled(
    ImageProvider imageProvider,
  ) async {
    const maxDimension = 112.0;
    final stream = imageProvider.resolve(
      const .new(size: .square(maxDimension)),
    );
    final imageCompleter = Completer<ui.Image>();
    late ImageStreamListener listener;
    late ui.Image scaledImage;
    Timer? loadFailureTimeout;

    listener = ImageStreamListener(
      (info, sync) async {
        loadFailureTimeout?.cancel();
        stream.removeListener(listener);
        final image = info.image;
        final width = image.width;
        final height = image.height;
        var paintWidth = width.toDouble();
        var paintHeight = height.toDouble();
        assert(width > 0 && height > 0);

        final rescale = width > maxDimension || height > maxDimension;
        if (rescale) {
          paintWidth = (width > height)
              ? maxDimension
              : (maxDimension / height) * width;
          paintHeight = (height > width)
              ? maxDimension
              : (maxDimension / width) * height;
        }
        final pictureRecorder = ui.PictureRecorder();
        final canvas = Canvas(pictureRecorder);
        paintImage(
          canvas: canvas,
          rect: .fromLTRB(0.0, 0.0, paintWidth, paintHeight),
          image: image,
          filterQuality: .none,
        );

        final picture = pictureRecorder.endRecording();
        scaledImage = await picture.toImage(
          paintWidth.toInt(),
          paintHeight.toInt(),
        );
        imageCompleter.complete(info.image);
      },
      onError: (exception, stackTrace) {
        loadFailureTimeout?.cancel();
        stream.removeListener(listener);
        imageCompleter.completeError(
          Exception("Failed to render image: $exception"),
          stackTrace,
        );
      },
    );

    loadFailureTimeout = Timer(const Duration(seconds: 5), () {
      stream.removeListener(listener);
      imageCompleter.completeError(
        TimeoutException("Timeout occurred trying to load image"),
      );
    });

    stream.addListener(listener);
    await imageCompleter.future;
    return scaledImage;
  }

  /// Converts AABBGGRR color int to AARRGGBB format.
  static int _getArgbFromAbgr(int abgr) {
    const exceptRMask = 0xFF00FFFF;
    const onlyRMask = ~exceptRMask;
    const exceptBMask = 0xFFFFFF00;
    const onlyBMask = ~exceptBMask;
    final r = (abgr & onlyRMask) >> 16;
    final b = abgr & onlyBMask;
    return (abgr & exceptRMask & exceptBMask) | (b << 16) | r;
  }

  static ColorThemeData lerp(ColorThemeData a, ColorThemeData b, double t) {
    if (identical(a, b)) return a;
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    if (a == b) return a;
    return .from(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      primaryPaletteKeyColor: Color.lerp(
        a.primaryPaletteKeyColor,
        b.primaryPaletteKeyColor,
        t,
      )!,
      secondaryPaletteKeyColor: Color.lerp(
        a.secondaryPaletteKeyColor,
        b.secondaryPaletteKeyColor,
        t,
      )!,
      tertiaryPaletteKeyColor: Color.lerp(
        a.tertiaryPaletteKeyColor,
        b.tertiaryPaletteKeyColor,
        t,
      )!,
      neutralPaletteKeyColor: Color.lerp(
        a.neutralPaletteKeyColor,
        b.neutralPaletteKeyColor,
        t,
      )!,
      neutralVariantPaletteKeyColor: Color.lerp(
        a.neutralVariantPaletteKeyColor,
        b.neutralVariantPaletteKeyColor,
        t,
      )!,
      errorPaletteKeyColor: Color.lerp(
        a.errorPaletteKeyColor,
        b.errorPaletteKeyColor,
        t,
      )!,
      background: Color.lerp(a.background, b.background, t)!,
      onBackground: Color.lerp(a.onBackground, b.onBackground, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      surfaceDim: Color.lerp(a.surfaceDim, b.surfaceDim, t)!,
      surfaceBright: Color.lerp(a.surfaceBright, b.surfaceBright, t)!,
      surfaceContainerLowest: Color.lerp(
        a.surfaceContainerLowest,
        b.surfaceContainerLowest,
        t,
      )!,
      surfaceContainerLow: Color.lerp(
        a.surfaceContainerLow,
        b.surfaceContainerLow,
        t,
      )!,
      surfaceContainer: Color.lerp(a.surfaceContainer, b.surfaceContainer, t)!,
      surfaceContainerHigh: Color.lerp(
        a.surfaceContainerHigh,
        b.surfaceContainerHigh,
        t,
      )!,
      surfaceContainerHighest: Color.lerp(
        a.surfaceContainerHighest,
        b.surfaceContainerHighest,
        t,
      )!,
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      surfaceVariant: Color.lerp(a.surfaceVariant, b.surfaceVariant, t)!,
      onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      outlineVariant: Color.lerp(a.outlineVariant, b.outlineVariant, t)!,
      inverseSurface: Color.lerp(a.inverseSurface, b.inverseSurface, t)!,
      inverseOnSurface: Color.lerp(a.inverseOnSurface, b.inverseOnSurface, t)!,
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
      scrim: Color.lerp(a.scrim, b.scrim, t)!,
      surfaceTint: Color.lerp(a.surfaceTint, b.surfaceTint, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      primaryDim: Color.lerp(a.primaryDim, b.primaryDim, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      primaryContainer: Color.lerp(a.primaryContainer, b.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(
        a.onPrimaryContainer,
        b.onPrimaryContainer,
        t,
      )!,
      primaryFixed: Color.lerp(a.primaryFixed, b.primaryFixed, t)!,
      primaryFixedDim: Color.lerp(a.primaryFixedDim, b.primaryFixedDim, t)!,
      onPrimaryFixed: Color.lerp(a.onPrimaryFixed, b.onPrimaryFixed, t)!,
      onPrimaryFixedVariant: Color.lerp(
        a.onPrimaryFixedVariant,
        b.onPrimaryFixedVariant,
        t,
      )!,
      inversePrimary: Color.lerp(a.inversePrimary, b.inversePrimary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      secondaryDim: Color.lerp(a.secondaryDim, b.secondaryDim, t)!,
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t)!,
      secondaryContainer: Color.lerp(
        a.secondaryContainer,
        b.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: Color.lerp(
        a.onSecondaryContainer,
        b.onSecondaryContainer,
        t,
      )!,
      secondaryFixed: Color.lerp(a.secondaryFixed, b.secondaryFixed, t)!,
      secondaryFixedDim: Color.lerp(
        a.secondaryFixedDim,
        b.secondaryFixedDim,
        t,
      )!,
      onSecondaryFixed: Color.lerp(a.onSecondaryFixed, b.onSecondaryFixed, t)!,
      onSecondaryFixedVariant: Color.lerp(
        a.onSecondaryFixedVariant,
        b.onSecondaryFixedVariant,
        t,
      )!,
      tertiary: Color.lerp(a.tertiary, b.tertiary, t)!,
      tertiaryDim: Color.lerp(a.tertiaryDim, b.tertiaryDim, t)!,
      onTertiary: Color.lerp(a.onTertiary, b.onTertiary, t)!,
      tertiaryContainer: Color.lerp(
        a.tertiaryContainer,
        b.tertiaryContainer,
        t,
      )!,
      onTertiaryContainer: Color.lerp(
        a.onTertiaryContainer,
        b.onTertiaryContainer,
        t,
      )!,
      tertiaryFixed: Color.lerp(a.tertiaryFixed, b.tertiaryFixed, t)!,
      tertiaryFixedDim: Color.lerp(a.tertiaryFixedDim, b.tertiaryFixedDim, t)!,
      onTertiaryFixed: Color.lerp(a.onTertiaryFixed, b.onTertiaryFixed, t)!,
      onTertiaryFixedVariant: Color.lerp(
        a.onTertiaryFixedVariant,
        b.onTertiaryFixedVariant,
        t,
      )!,
      error: Color.lerp(a.error, b.error, t)!,
      errorDim: Color.lerp(a.errorDim, b.errorDim, t)!,
      onError: Color.lerp(a.onError, b.onError, t)!,
      errorContainer: Color.lerp(a.errorContainer, b.errorContainer, t)!,
      onErrorContainer: Color.lerp(a.onErrorContainer, b.onErrorContainer, t)!,
    );
  }
}

final class _ColorThemeData extends ColorThemeData {
  const _ColorThemeData({
    required this.brightness,
    required this.primaryPaletteKeyColor,
    required this.secondaryPaletteKeyColor,
    required this.tertiaryPaletteKeyColor,
    required this.neutralPaletteKeyColor,
    required this.neutralVariantPaletteKeyColor,
    required this.errorPaletteKeyColor,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.shadow,
    required this.scrim,
    required this.surfaceTint,
    required this.primary,
    required this.primaryDim,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.inversePrimary,
    required this.secondary,
    required this.secondaryDim,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiary,
    required this.tertiaryDim,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.error,
    required this.errorDim,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
  });

  @override
  final Brightness brightness;

  @override
  final Color primaryPaletteKeyColor;

  @override
  final Color secondaryPaletteKeyColor;

  @override
  final Color tertiaryPaletteKeyColor;

  @override
  final Color neutralPaletteKeyColor;

  @override
  final Color neutralVariantPaletteKeyColor;

  @override
  final Color errorPaletteKeyColor;

  @override
  final Color background;

  @override
  final Color onBackground;

  @override
  final Color surface;

  @override
  final Color surfaceDim;

  @override
  final Color surfaceBright;

  @override
  final Color surfaceContainerLowest;

  @override
  final Color surfaceContainerLow;

  @override
  final Color surfaceContainer;

  @override
  final Color surfaceContainerHigh;

  @override
  final Color surfaceContainerHighest;

  @override
  final Color onSurface;

  @override
  final Color surfaceVariant;

  @override
  final Color onSurfaceVariant;

  @override
  final Color outline;

  @override
  final Color outlineVariant;

  @override
  final Color inverseSurface;

  @override
  final Color inverseOnSurface;

  @override
  final Color shadow;

  @override
  final Color scrim;

  @override
  final Color surfaceTint;

  @override
  final Color primary;

  @override
  final Color primaryDim;

  @override
  final Color onPrimary;

  @override
  final Color primaryContainer;

  @override
  final Color onPrimaryContainer;

  @override
  final Color primaryFixed;

  @override
  final Color primaryFixedDim;

  @override
  final Color onPrimaryFixed;

  @override
  final Color onPrimaryFixedVariant;

  @override
  final Color inversePrimary;

  @override
  final Color secondary;

  @override
  final Color secondaryDim;

  @override
  final Color onSecondary;

  @override
  final Color secondaryContainer;

  @override
  final Color onSecondaryContainer;

  @override
  final Color secondaryFixed;

  @override
  final Color secondaryFixedDim;

  @override
  final Color onSecondaryFixed;

  @override
  final Color onSecondaryFixedVariant;

  @override
  final Color tertiary;

  @override
  final Color tertiaryDim;

  @override
  final Color onTertiary;

  @override
  final Color tertiaryContainer;

  @override
  final Color onTertiaryContainer;

  @override
  final Color tertiaryFixed;

  @override
  final Color tertiaryFixedDim;

  @override
  final Color onTertiaryFixed;

  @override
  final Color onTertiaryFixedVariant;

  @override
  final Color error;

  @override
  final Color errorDim;

  @override
  final Color onError;

  @override
  final Color errorContainer;

  @override
  final Color onErrorContainer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ColorThemeData &&
          brightness == other.brightness &&
          primaryPaletteKeyColor == other.primaryPaletteKeyColor &&
          secondaryPaletteKeyColor == other.secondaryPaletteKeyColor &&
          tertiaryPaletteKeyColor == other.tertiaryPaletteKeyColor &&
          neutralPaletteKeyColor == other.neutralPaletteKeyColor &&
          neutralVariantPaletteKeyColor ==
              other.neutralVariantPaletteKeyColor &&
          errorPaletteKeyColor == other.errorPaletteKeyColor &&
          background == other.background &&
          onBackground == other.onBackground &&
          surface == other.surface &&
          surfaceDim == other.surfaceDim &&
          surfaceBright == other.surfaceBright &&
          surfaceContainerLowest == other.surfaceContainerLowest &&
          surfaceContainerLow == other.surfaceContainerLow &&
          surfaceContainer == other.surfaceContainer &&
          surfaceContainerHigh == other.surfaceContainerHigh &&
          surfaceContainerHighest == other.surfaceContainerHighest &&
          onSurface == other.onSurface &&
          surfaceVariant == other.surfaceVariant &&
          onSurfaceVariant == other.onSurfaceVariant &&
          outline == other.outline &&
          outlineVariant == other.outlineVariant &&
          inverseSurface == other.inverseSurface &&
          inverseOnSurface == other.inverseOnSurface &&
          shadow == other.shadow &&
          scrim == other.scrim &&
          surfaceTint == other.surfaceTint &&
          primary == other.primary &&
          primaryDim == other.primaryDim &&
          onPrimary == other.onPrimary &&
          primaryContainer == other.primaryContainer &&
          onPrimaryContainer == other.onPrimaryContainer &&
          primaryFixed == other.primaryFixed &&
          primaryFixedDim == other.primaryFixedDim &&
          onPrimaryFixed == other.onPrimaryFixed &&
          onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
          inversePrimary == other.inversePrimary &&
          secondary == other.secondary &&
          secondaryDim == other.secondaryDim &&
          onSecondary == other.onSecondary &&
          secondaryContainer == other.secondaryContainer &&
          onSecondaryContainer == other.onSecondaryContainer &&
          secondaryFixed == other.secondaryFixed &&
          secondaryFixedDim == other.secondaryFixedDim &&
          onSecondaryFixed == other.onSecondaryFixed &&
          onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
          tertiary == other.tertiary &&
          tertiaryDim == other.tertiaryDim &&
          onTertiary == other.onTertiary &&
          tertiaryContainer == other.tertiaryContainer &&
          onTertiaryContainer == other.onTertiaryContainer &&
          tertiaryFixed == other.tertiaryFixed &&
          tertiaryFixedDim == other.tertiaryFixedDim &&
          onTertiaryFixed == other.onTertiaryFixed &&
          onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
          error == other.error &&
          errorDim == other.errorDim &&
          onError == other.onError &&
          errorContainer == other.errorContainer &&
          onErrorContainer == other.onErrorContainer;

  @override
  int get hashCode => Object.hash(
    brightness,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
    background,
    onBackground,
    surface,
    surfaceDim,
    surfaceBright,
    surfaceContainerLowest,
    surfaceContainerLow,
    surfaceContainer,
    surfaceContainerHigh,
    surfaceContainerHighest,
    onSurface,
    surfaceVariant,
    Object.hash(
      onSurfaceVariant,
      outline,
      outlineVariant,
      inverseSurface,
      inverseOnSurface,
      shadow,
      scrim,
      surfaceTint,
      primary,
      primaryDim,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      primaryFixed,
      primaryFixedDim,
      onPrimaryFixed,
      onPrimaryFixedVariant,
      inversePrimary,
      secondary,
      Object.hash(
        secondaryDim,
        onSecondary,
        secondaryContainer,
        onSecondaryContainer,
        secondaryFixed,
        secondaryFixedDim,
        onSecondaryFixed,
        onSecondaryFixedVariant,
        tertiary,
        tertiaryDim,
        onTertiary,
        tertiaryContainer,
        onTertiaryContainer,
        tertiaryFixed,
        tertiaryFixedDim,
        onTertiaryFixed,
        onTertiaryFixedVariant,
        error,
        errorDim,
        Object.hash(onError, errorContainer, onErrorContainer),
      ),
    ),
  );
}

final class _ColorThemeDataFromDynamicSchemeCache {
  _ColorThemeDataFromDynamicSchemeCache(
    DynamicScheme scheme, {
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
  }) : _scheme = scheme,
       _brightness = brightness,
       _primaryPaletteKeyColor = primaryPaletteKeyColor,
       _secondaryPaletteKeyColor = secondaryPaletteKeyColor,
       _tertiaryPaletteKeyColor = tertiaryPaletteKeyColor,
       _neutralPaletteKeyColor = neutralPaletteKeyColor,
       _neutralVariantPaletteKeyColor = neutralVariantPaletteKeyColor,
       _errorPaletteKeyColor = errorPaletteKeyColor,
       _background = background,
       _onBackground = onBackground,
       _surface = surface,
       _surfaceDim = surfaceDim,
       _surfaceBright = surfaceBright,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _onSurface = onSurface,
       _surfaceVariant = surfaceVariant,
       _onSurfaceVariant = onSurfaceVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _inverseSurface = inverseSurface,
       _inverseOnSurface = inverseOnSurface,
       _shadow = shadow,
       _scrim = scrim,
       _surfaceTint = surfaceTint,
       _primary = primary,
       _primaryDim = primaryDim,
       _onPrimary = onPrimary,
       _primaryContainer = primaryContainer,
       _onPrimaryContainer = onPrimaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _inversePrimary = inversePrimary,
       _secondary = secondary,
       _secondaryDim = secondaryDim,
       _onSecondary = onSecondary,
       _secondaryContainer = secondaryContainer,
       _onSecondaryContainer = onSecondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _tertiary = tertiary,
       _tertiaryDim = tertiaryDim,
       _onTertiary = onTertiary,
       _tertiaryContainer = tertiaryContainer,
       _onTertiaryContainer = onTertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _error = error,
       _errorDim = errorDim,
       _onError = onError,
       _errorContainer = errorContainer,
       _onErrorContainer = onErrorContainer;

  final DynamicScheme _scheme;

  Brightness? _brightness;
  Color? _primaryPaletteKeyColor;
  Color? _secondaryPaletteKeyColor;
  Color? _tertiaryPaletteKeyColor;
  Color? _neutralPaletteKeyColor;
  Color? _neutralVariantPaletteKeyColor;
  Color? _errorPaletteKeyColor;
  Color? _background;
  Color? _onBackground;
  Color? _surface;
  Color? _surfaceDim;
  Color? _surfaceBright;
  Color? _surfaceContainerLowest;
  Color? _surfaceContainerLow;
  Color? _surfaceContainer;
  Color? _surfaceContainerHigh;
  Color? _surfaceContainerHighest;
  Color? _onSurface;
  Color? _surfaceVariant;
  Color? _onSurfaceVariant;
  Color? _outline;
  Color? _outlineVariant;
  Color? _inverseSurface;
  Color? _inverseOnSurface;
  Color? _shadow;
  Color? _scrim;
  Color? _surfaceTint;
  Color? _primary;
  Color? _primaryDim;
  Color? _onPrimary;
  Color? _primaryContainer;
  Color? _onPrimaryContainer;
  Color? _primaryFixed;
  Color? _primaryFixedDim;
  Color? _onPrimaryFixed;
  Color? _onPrimaryFixedVariant;
  Color? _inversePrimary;
  Color? _secondary;
  Color? _secondaryDim;
  Color? _onSecondary;
  Color? _secondaryContainer;
  Color? _onSecondaryContainer;
  Color? _secondaryFixed;
  Color? _secondaryFixedDim;
  Color? _onSecondaryFixed;
  Color? _onSecondaryFixedVariant;
  Color? _tertiary;
  Color? _tertiaryDim;
  Color? _onTertiary;
  Color? _tertiaryContainer;
  Color? _onTertiaryContainer;
  Color? _tertiaryFixed;
  Color? _tertiaryFixedDim;
  Color? _onTertiaryFixed;
  Color? _onTertiaryFixedVariant;
  Color? _error;
  Color? _errorDim;
  Color? _onError;
  Color? _errorContainer;
  Color? _onErrorContainer;

  Brightness get brightness =>
      _brightness ??= (_scheme.isDark ? .dark : .light);

  Color get primaryPaletteKeyColor =>
      _primaryPaletteKeyColor ??= Color(_scheme.primaryPaletteKeyColor);

  Color get secondaryPaletteKeyColor =>
      _secondaryPaletteKeyColor ??= Color(_scheme.secondaryPaletteKeyColor);

  Color get tertiaryPaletteKeyColor =>
      _tertiaryPaletteKeyColor ??= Color(_scheme.tertiaryPaletteKeyColor);

  Color get neutralPaletteKeyColor =>
      _neutralPaletteKeyColor ??= Color(_scheme.neutralPaletteKeyColor);

  Color get neutralVariantPaletteKeyColor => _neutralVariantPaletteKeyColor ??=
      Color(_scheme.neutralVariantPaletteKeyColor);

  Color get errorPaletteKeyColor =>
      _errorPaletteKeyColor ??= Color(_scheme.errorPaletteKeyColor);

  Color get background => _background ??= Color(_scheme.background);

  Color get onBackground => _onBackground ??= Color(_scheme.onBackground);

  Color get surface => _surface ??= Color(_scheme.surface);

  Color get surfaceDim => _surfaceDim ??= Color(_scheme.surfaceDim);

  Color get surfaceBright => _surfaceBright ??= Color(_scheme.surfaceBright);

  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ??= Color(_scheme.surfaceContainerLowest);

  Color get surfaceContainerLow =>
      _surfaceContainerLow ??= Color(_scheme.surfaceContainerLow);

  Color get surfaceContainer =>
      _surfaceContainer ??= Color(_scheme.surfaceContainer);

  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ??= Color(_scheme.surfaceContainerHigh);

  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ??= Color(_scheme.surfaceContainerHighest);

  Color get onSurface => _onSurface ??= Color(_scheme.onSurface);

  Color get surfaceVariant => _surfaceVariant ??= Color(_scheme.surfaceVariant);

  Color get onSurfaceVariant =>
      _onSurfaceVariant ??= Color(_scheme.onSurfaceVariant);

  Color get outline => _outline ??= Color(_scheme.outline);

  Color get outlineVariant => _outlineVariant ??= Color(_scheme.outlineVariant);

  Color get inverseSurface => _inverseSurface ??= Color(_scheme.inverseSurface);

  Color get inverseOnSurface =>
      _inverseOnSurface ??= Color(_scheme.inverseOnSurface);

  Color get shadow => _shadow ??= Color(_scheme.shadow);

  Color get scrim => _scrim ??= Color(_scheme.scrim);

  Color get surfaceTint => _surfaceTint ??= Color(_scheme.surfaceTint);

  Color get primary => _primary ??= Color(_scheme.primary);

  Color get primaryDim => _primaryDim ??= Color(_scheme.primaryDim);

  Color get onPrimary => _onPrimary ??= Color(_scheme.onPrimary);

  Color get primaryContainer =>
      _primaryContainer ??= Color(_scheme.primaryContainer);

  Color get onPrimaryContainer =>
      _onPrimaryContainer ??= Color(_scheme.onPrimaryContainer);

  Color get primaryFixed => _primaryFixed ??= Color(_scheme.primaryFixed);

  Color get primaryFixedDim =>
      _primaryFixedDim ??= Color(_scheme.primaryFixedDim);

  Color get onPrimaryFixed => _onPrimaryFixed ??= Color(_scheme.onPrimaryFixed);

  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ??= Color(_scheme.onPrimaryFixedVariant);

  Color get inversePrimary => _inversePrimary ??= Color(_scheme.inversePrimary);

  Color get secondary => _secondary ??= Color(_scheme.secondary);

  Color get secondaryDim => _secondaryDim ??= Color(_scheme.secondaryDim);

  Color get onSecondary => _onSecondary ??= Color(_scheme.onSecondary);

  Color get secondaryContainer =>
      _secondaryContainer ??= Color(_scheme.secondaryContainer);

  Color get onSecondaryContainer =>
      _onSecondaryContainer ??= Color(_scheme.onSecondaryContainer);

  Color get secondaryFixed => _secondaryFixed ??= Color(_scheme.secondaryFixed);

  Color get secondaryFixedDim =>
      _secondaryFixedDim ??= Color(_scheme.secondaryFixedDim);

  Color get onSecondaryFixed =>
      _onSecondaryFixed ??= Color(_scheme.onSecondaryFixed);

  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ??= Color(_scheme.onSecondaryFixedVariant);

  Color get tertiary => _tertiary ??= Color(_scheme.tertiary);

  Color get tertiaryDim => _tertiaryDim ??= Color(_scheme.tertiaryDim);

  Color get onTertiary => _onTertiary ??= Color(_scheme.onTertiary);

  Color get tertiaryContainer =>
      _tertiaryContainer ??= Color(_scheme.tertiaryContainer);

  Color get onTertiaryContainer =>
      _onTertiaryContainer ??= Color(_scheme.onTertiaryContainer);

  Color get tertiaryFixed => _tertiaryFixed ??= Color(_scheme.tertiaryFixed);

  Color get tertiaryFixedDim =>
      _tertiaryFixedDim ??= Color(_scheme.tertiaryFixedDim);

  Color get onTertiaryFixed =>
      _onTertiaryFixed ??= Color(_scheme.onTertiaryFixed);

  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ??= Color(_scheme.onTertiaryFixedVariant);

  Color get error => _error ??= Color(_scheme.error);

  Color get errorDim => _errorDim ??= Color(_scheme.errorDim);

  Color get onError => _onError ??= Color(_scheme.onError);

  Color get errorContainer => _errorContainer ??= Color(_scheme.errorContainer);

  Color get onErrorContainer =>
      _onErrorContainer ??= Color(_scheme.onErrorContainer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ColorThemeDataFromDynamicSchemeCache &&
          _scheme == other._scheme;

  @override
  int get hashCode => _scheme.hashCode;
}

final class _ColorThemeDataFromDynamicScheme extends ColorThemeData {
  const _ColorThemeDataFromDynamicScheme._({
    required _ColorThemeDataFromDynamicSchemeCache cache,
    required ColorThemeDataPartial overrides,
  }) : _cache = cache,
       _overrides = overrides;

  _ColorThemeDataFromDynamicScheme(DynamicScheme scheme)
    : this._(
        cache: _ColorThemeDataFromDynamicSchemeCache(scheme),
        overrides: const .from(),
      );

  final _ColorThemeDataFromDynamicSchemeCache _cache;

  final ColorThemeDataPartial _overrides;

  @override
  Brightness get brightness => _overrides.brightness ?? _cache.brightness;

  @override
  Color get primaryPaletteKeyColor =>
      _overrides.primaryPaletteKeyColor ?? _cache.primaryPaletteKeyColor;

  @override
  Color get secondaryPaletteKeyColor =>
      _overrides.secondaryPaletteKeyColor ?? _cache.secondaryPaletteKeyColor;

  @override
  Color get tertiaryPaletteKeyColor =>
      _overrides.tertiaryPaletteKeyColor ?? _cache.tertiaryPaletteKeyColor;

  @override
  Color get neutralPaletteKeyColor =>
      _overrides.neutralPaletteKeyColor ?? _cache.neutralPaletteKeyColor;

  @override
  Color get neutralVariantPaletteKeyColor =>
      _overrides.neutralVariantPaletteKeyColor ??
      _cache.neutralVariantPaletteKeyColor;

  @override
  Color get errorPaletteKeyColor =>
      _overrides.errorPaletteKeyColor ?? _cache.errorPaletteKeyColor;

  @override
  Color get background => _overrides.background ?? _cache.background;

  @override
  Color get onBackground => _overrides.onBackground ?? _cache.onBackground;

  @override
  Color get surface => _overrides.surface ?? _cache.surface;

  @override
  Color get surfaceDim => _overrides.surfaceDim ?? _cache.surfaceDim;

  @override
  Color get surfaceBright => _overrides.surfaceBright ?? _cache.surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _overrides.surfaceContainerLowest ?? _cache.surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _overrides.surfaceContainerLow ?? _cache.surfaceContainerLow;

  @override
  Color get surfaceContainer =>
      _overrides.surfaceContainer ?? _cache.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _overrides.surfaceContainerHigh ?? _cache.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _overrides.surfaceContainerHighest ?? _cache.surfaceContainerHighest;

  @override
  Color get onSurface => _overrides.onSurface ?? _cache.onSurface;

  @override
  Color get surfaceVariant =>
      _overrides.surfaceVariant ?? _cache.surfaceVariant;

  @override
  Color get onSurfaceVariant =>
      _overrides.onSurfaceVariant ?? _cache.onSurfaceVariant;

  @override
  Color get outline => _overrides.outline ?? _cache.outline;

  @override
  Color get outlineVariant =>
      _overrides.outlineVariant ?? _cache.outlineVariant;

  @override
  Color get inverseSurface =>
      _overrides.inverseSurface ?? _cache.inverseSurface;

  @override
  Color get inverseOnSurface =>
      _overrides.inverseOnSurface ?? _cache.inverseOnSurface;

  @override
  Color get shadow => _overrides.shadow ?? _cache.shadow;

  @override
  Color get scrim => _overrides.scrim ?? _cache.scrim;

  @override
  Color get surfaceTint => _overrides.surfaceTint ?? _cache.surfaceTint;

  @override
  Color get primary => _overrides.primary ?? _cache.primary;

  @override
  Color get primaryDim => _overrides.primaryDim ?? _cache.primaryDim;

  @override
  Color get onPrimary => _overrides.onPrimary ?? _cache.onPrimary;

  @override
  Color get primaryContainer =>
      _overrides.primaryContainer ?? _cache.primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _overrides.onPrimaryContainer ?? _cache.onPrimaryContainer;

  @override
  Color get primaryFixed => _overrides.primaryFixed ?? _cache.primaryFixed;

  @override
  Color get primaryFixedDim =>
      _overrides.primaryFixedDim ?? _cache.primaryFixedDim;

  @override
  Color get onPrimaryFixed =>
      _overrides.onPrimaryFixed ?? _cache.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _overrides.onPrimaryFixedVariant ?? _cache.onPrimaryFixedVariant;

  @override
  Color get inversePrimary =>
      _overrides.inversePrimary ?? _cache.inversePrimary;

  @override
  Color get secondary => _overrides.secondary ?? _cache.secondary;

  @override
  Color get secondaryDim => _overrides.secondaryDim ?? _cache.secondaryDim;

  @override
  Color get onSecondary => _overrides.onSecondary ?? _cache.onSecondary;

  @override
  Color get secondaryContainer =>
      _overrides.secondaryContainer ?? _cache.secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _overrides.onSecondaryContainer ?? _cache.onSecondaryContainer;

  @override
  Color get secondaryFixed =>
      _overrides.secondaryFixed ?? _cache.secondaryFixed;

  @override
  Color get secondaryFixedDim =>
      _overrides.secondaryFixedDim ?? _cache.secondaryFixedDim;

  @override
  Color get onSecondaryFixed =>
      _overrides.onSecondaryFixed ?? _cache.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _overrides.onSecondaryFixedVariant ?? _cache.onSecondaryFixedVariant;

  @override
  Color get tertiary => _overrides.tertiary ?? _cache.tertiary;

  @override
  Color get tertiaryDim => _overrides.tertiaryDim ?? _cache.tertiaryDim;

  @override
  Color get onTertiary => _overrides.onTertiary ?? _cache.onTertiary;

  @override
  Color get tertiaryContainer =>
      _overrides.tertiaryContainer ?? _cache.tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _overrides.onTertiaryContainer ?? _cache.onTertiaryContainer;

  @override
  Color get tertiaryFixed => _overrides.tertiaryFixed ?? _cache.tertiaryFixed;

  @override
  Color get tertiaryFixedDim =>
      _overrides.tertiaryFixedDim ?? _cache.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed =>
      _overrides.onTertiaryFixed ?? _cache.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _overrides.onTertiaryFixedVariant ?? _cache.onTertiaryFixedVariant;

  @override
  Color get error => _overrides.error ?? _cache.error;

  @override
  Color get errorDim => _overrides.errorDim ?? _cache.errorDim;

  @override
  Color get onError => _overrides.onError ?? _cache.onError;

  @override
  Color get errorContainer =>
      _overrides.errorContainer ?? _cache.errorContainer;

  @override
  Color get onErrorContainer =>
      _overrides.onErrorContainer ?? _cache.onErrorContainer;

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
  }) => _ColorThemeDataFromDynamicScheme._(
    cache: _cache,
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
      other is _ColorThemeDataFromDynamicScheme &&
          _cache == other._cache &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_cache, _overrides);
}

final class _ColorThemeDataAsLegacy
    with Diagnosticable
    implements ColorSchemeLegacy {
  const _ColorThemeDataAsLegacy(
    ColorThemeData value, {
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
    Color? background,
    Color? onBackground,
    Color? surfaceVariant,
  }) : _value = value,
       _brightness = brightness,
       _primary = primary,
       _onPrimary = onPrimary,
       _primaryContainer = primaryContainer,
       _onPrimaryContainer = onPrimaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _secondary = secondary,
       _onSecondary = onSecondary,
       _secondaryContainer = secondaryContainer,
       _onSecondaryContainer = onSecondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _tertiary = tertiary,
       _onTertiary = onTertiary,
       _tertiaryContainer = tertiaryContainer,
       _onTertiaryContainer = onTertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _error = error,
       _onError = onError,
       _errorContainer = errorContainer,
       _onErrorContainer = onErrorContainer,
       _surface = surface,
       _onSurface = onSurface,
       _surfaceDim = surfaceDim,
       _surfaceBright = surfaceBright,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _onSurfaceVariant = onSurfaceVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _shadow = shadow,
       _scrim = scrim,
       _inverseSurface = inverseSurface,
       _onInverseSurface = onInverseSurface,
       _inversePrimary = inversePrimary,
       _surfaceTint = surfaceTint,
       _background = background,
       _onBackground = onBackground,
       _surfaceVariant = surfaceVariant;

  final ColorThemeData _value;

  final Brightness? _brightness;
  final Color? _primary;
  final Color? _onPrimary;
  final Color? _primaryContainer;
  final Color? _onPrimaryContainer;
  final Color? _primaryFixed;
  final Color? _primaryFixedDim;
  final Color? _onPrimaryFixed;
  final Color? _onPrimaryFixedVariant;
  final Color? _secondary;
  final Color? _onSecondary;
  final Color? _secondaryContainer;
  final Color? _onSecondaryContainer;
  final Color? _secondaryFixed;
  final Color? _secondaryFixedDim;
  final Color? _onSecondaryFixed;
  final Color? _onSecondaryFixedVariant;
  final Color? _tertiary;
  final Color? _onTertiary;
  final Color? _tertiaryContainer;
  final Color? _onTertiaryContainer;
  final Color? _tertiaryFixed;
  final Color? _tertiaryFixedDim;
  final Color? _onTertiaryFixed;
  final Color? _onTertiaryFixedVariant;
  final Color? _error;
  final Color? _onError;
  final Color? _errorContainer;
  final Color? _onErrorContainer;
  final Color? _surface;
  final Color? _onSurface;
  final Color? _surfaceDim;
  final Color? _surfaceBright;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _onSurfaceVariant;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _shadow;
  final Color? _scrim;
  final Color? _inverseSurface;
  final Color? _onInverseSurface;
  final Color? _inversePrimary;
  final Color? _surfaceTint;
  final Color? _background;
  final Color? _onBackground;
  final Color? _surfaceVariant;

  @override
  Brightness get brightness => _brightness ?? _value.brightness;

  @override
  Color get primary => _primary ?? _value.primary;

  @override
  Color get onPrimary => _onPrimary ?? _value.onPrimary;

  @override
  Color get primaryContainer => _primaryContainer ?? _value.primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _onPrimaryContainer ?? _value.onPrimaryContainer;

  @override
  Color get primaryFixed => _primaryFixed ?? _value.primaryFixed;

  @override
  Color get primaryFixedDim => _primaryFixedDim ?? _value.primaryFixedDim;

  @override
  Color get onPrimaryFixed => _onPrimaryFixed ?? _value.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _value.onPrimaryFixedVariant;

  @override
  Color get secondary => _secondary ?? _value.secondary;

  @override
  Color get onSecondary => _onSecondary ?? _value.onSecondary;

  @override
  Color get secondaryContainer =>
      _secondaryContainer ?? _value.secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _onSecondaryContainer ?? _value.onSecondaryContainer;

  @override
  Color get secondaryFixed => _secondaryFixed ?? _value.secondaryFixed;

  @override
  Color get secondaryFixedDim => _secondaryFixedDim ?? _value.secondaryFixedDim;

  @override
  Color get onSecondaryFixed => _onSecondaryFixed ?? _value.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _value.onSecondaryFixedVariant;

  @override
  Color get tertiary => _tertiary ?? _value.tertiary;

  @override
  Color get onTertiary => _onTertiary ?? _value.onTertiary;

  @override
  Color get tertiaryContainer => _tertiaryContainer ?? _value.tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _onTertiaryContainer ?? _value.onTertiaryContainer;

  @override
  Color get tertiaryFixed => _tertiaryFixed ?? _value.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => _tertiaryFixedDim ?? _value.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => _onTertiaryFixed ?? _value.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _value.onTertiaryFixedVariant;

  @override
  Color get error => _error ?? _value.error;

  @override
  Color get onError => _onError ?? _value.onError;

  @override
  Color get errorContainer => _errorContainer ?? _value.errorContainer;

  @override
  Color get onErrorContainer => _onErrorContainer ?? _value.onErrorContainer;

  @override
  Color get surface => _surface ?? _value.surface;

  @override
  Color get onSurface => _onSurface ?? _value.onSurface;

  @override
  Color get surfaceDim => _surfaceDim ?? _value.surfaceDim;

  @override
  Color get surfaceBright => _surfaceBright ?? _value.surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _value.surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _surfaceContainerLow ?? _value.surfaceContainerLow;

  @override
  Color get surfaceContainer => _surfaceContainer ?? _value.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _value.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _value.surfaceContainerHighest;

  @override
  Color get onSurfaceVariant => _onSurfaceVariant ?? _value.onSurfaceVariant;

  @override
  Color get outline => _outline ?? _value.outline;

  @override
  Color get outlineVariant => _outlineVariant ?? _value.outlineVariant;

  @override
  Color get shadow => _shadow ?? _value.shadow;

  @override
  Color get scrim => _scrim ?? _value.scrim;

  @override
  Color get inverseSurface => _inverseSurface ?? _value.inverseSurface;

  @override
  Color get onInverseSurface => _onInverseSurface ?? _value.inverseOnSurface;

  @override
  Color get inversePrimary => _inversePrimary ?? _value.inversePrimary;

  @override
  Color get surfaceTint => _surfaceTint ?? _value.surfaceTint;

  @override
  Color get background => _background ?? _value.background;

  @override
  Color get onBackground => _onBackground ?? _value.onBackground;

  @override
  Color get surfaceVariant => _surfaceVariant ?? _value.surfaceVariant;

  @override
  ColorSchemeLegacy copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
    Color? background,
    Color? onBackground,
    Color? surfaceVariant,
  }) =>
      brightness != null &&
          primary != null &&
          onPrimary != null &&
          primaryContainer != null &&
          onPrimaryContainer != null &&
          primaryFixed != null &&
          primaryFixedDim != null &&
          onPrimaryFixed != null &&
          onPrimaryFixedVariant != null &&
          secondary != null &&
          onSecondary != null &&
          secondaryContainer != null &&
          onSecondaryContainer != null &&
          secondaryFixed != null &&
          secondaryFixedDim != null &&
          onSecondaryFixed != null &&
          onSecondaryFixedVariant != null &&
          tertiary != null &&
          onTertiary != null &&
          tertiaryContainer != null &&
          onTertiaryContainer != null &&
          tertiaryFixed != null &&
          tertiaryFixedDim != null &&
          onTertiaryFixed != null &&
          onTertiaryFixedVariant != null &&
          error != null &&
          onError != null &&
          errorContainer != null &&
          onErrorContainer != null &&
          surface != null &&
          onSurface != null &&
          surfaceDim != null &&
          surfaceBright != null &&
          surfaceContainerLowest != null &&
          surfaceContainerLow != null &&
          surfaceContainer != null &&
          surfaceContainerHigh != null &&
          surfaceContainerHighest != null &&
          onSurfaceVariant != null &&
          outline != null &&
          outlineVariant != null &&
          shadow != null &&
          scrim != null &&
          inverseSurface != null &&
          onInverseSurface != null &&
          inversePrimary != null &&
          surfaceTint != null &&
          background != null &&
          onBackground != null &&
          surfaceVariant != null
      ? .new(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          secondary: secondary,
          onSecondary: onSecondary,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiary: tertiary,
          onTertiary: onTertiary,
          tertiaryContainer: tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          error: error,
          onError: onError,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
          surface: surface,
          onSurface: onSurface,
          surfaceDim: surfaceDim,
          surfaceBright: surfaceBright,
          surfaceContainerLowest: surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow,
          surfaceContainer: surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh,
          surfaceContainerHighest: surfaceContainerHighest,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          outlineVariant: outlineVariant,
          shadow: shadow,
          scrim: scrim,
          inverseSurface: inverseSurface,
          onInverseSurface: onInverseSurface,
          inversePrimary: inversePrimary,
          surfaceTint: surfaceTint,
          background: background,
          onBackground: onBackground,
          surfaceVariant: surfaceVariant,
        )
      : brightness != null ||
            primary != null ||
            onPrimary != null ||
            primaryContainer != null ||
            onPrimaryContainer != null ||
            primaryFixed != null ||
            primaryFixedDim != null ||
            onPrimaryFixed != null ||
            onPrimaryFixedVariant != null ||
            secondary != null ||
            onSecondary != null ||
            secondaryContainer != null ||
            onSecondaryContainer != null ||
            secondaryFixed != null ||
            secondaryFixedDim != null ||
            onSecondaryFixed != null ||
            onSecondaryFixedVariant != null ||
            tertiary != null ||
            onTertiary != null ||
            tertiaryContainer != null ||
            onTertiaryContainer != null ||
            tertiaryFixed != null ||
            tertiaryFixedDim != null ||
            onTertiaryFixed != null ||
            onTertiaryFixedVariant != null ||
            error != null ||
            onError != null ||
            errorContainer != null ||
            onErrorContainer != null ||
            surface != null ||
            onSurface != null ||
            surfaceDim != null ||
            surfaceBright != null ||
            surfaceContainerLowest != null ||
            surfaceContainerLow != null ||
            surfaceContainer != null ||
            surfaceContainerHigh != null ||
            surfaceContainerHighest != null ||
            onSurfaceVariant != null ||
            outline != null ||
            outlineVariant != null ||
            shadow != null ||
            scrim != null ||
            inverseSurface != null ||
            onInverseSurface != null ||
            inversePrimary != null ||
            surfaceTint != null ||
            background != null ||
            onBackground != null ||
            surfaceVariant != null
      ? _ColorThemeDataAsLegacy(
          _value,
          brightness: brightness ?? _brightness,
          primary: primary ?? _primary,
          onPrimary: onPrimary ?? _onPrimary,
          primaryContainer: primaryContainer ?? _primaryContainer,
          onPrimaryContainer: onPrimaryContainer ?? _onPrimaryContainer,
          primaryFixed: primaryFixed ?? _primaryFixed,
          primaryFixedDim: primaryFixedDim ?? _primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed ?? _onPrimaryFixed,
          onPrimaryFixedVariant:
              onPrimaryFixedVariant ?? _onPrimaryFixedVariant,
          secondary: secondary ?? _secondary,
          onSecondary: onSecondary ?? _onSecondary,
          secondaryContainer: secondaryContainer ?? _secondaryContainer,
          onSecondaryContainer: onSecondaryContainer ?? _onSecondaryContainer,
          secondaryFixed: secondaryFixed ?? _secondaryFixed,
          secondaryFixedDim: secondaryFixedDim ?? _secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed ?? _onSecondaryFixed,
          onSecondaryFixedVariant:
              onSecondaryFixedVariant ?? _onSecondaryFixedVariant,
          tertiary: tertiary ?? _tertiary,
          onTertiary: onTertiary ?? _onTertiary,
          tertiaryContainer: tertiaryContainer ?? _tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer ?? _onTertiaryContainer,
          tertiaryFixed: tertiaryFixed ?? _tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim ?? _tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed ?? _onTertiaryFixed,
          onTertiaryFixedVariant:
              onTertiaryFixedVariant ?? _onTertiaryFixedVariant,
          error: error ?? _error,
          onError: onError ?? _onError,
          errorContainer: errorContainer ?? _errorContainer,
          onErrorContainer: onErrorContainer ?? _onErrorContainer,
          surface: surface ?? _surface,
          onSurface: onSurface ?? _onSurface,
          surfaceDim: surfaceDim ?? _surfaceDim,
          surfaceBright: surfaceBright ?? _surfaceBright,
          surfaceContainerLowest:
              surfaceContainerLowest ?? _surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow ?? _surfaceContainerLow,
          surfaceContainer: surfaceContainer ?? _surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh ?? _surfaceContainerHigh,
          surfaceContainerHighest:
              surfaceContainerHighest ?? _surfaceContainerHighest,
          onSurfaceVariant: onSurfaceVariant ?? _onSurfaceVariant,
          outline: outline ?? _outline,
          outlineVariant: outlineVariant ?? _outlineVariant,
          shadow: shadow ?? _shadow,
          scrim: scrim ?? _scrim,
          inverseSurface: inverseSurface ?? _inverseSurface,
          onInverseSurface: onInverseSurface ?? _onInverseSurface,
          inversePrimary: inversePrimary ?? _inversePrimary,
          surfaceTint: surfaceTint ?? _surfaceTint,
          background: background ?? _background,
          onBackground: onBackground ?? _onBackground,
          surfaceVariant: surfaceVariant ?? _surfaceVariant,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<ColorThemeData>("color theme", _value))
      ..add(
        EnumProperty<Brightness>("brightness", _brightness, defaultValue: null),
      )
      ..add(ColorProperty("primary", _primary, defaultValue: null))
      ..add(ColorProperty("onPrimary", _onPrimary, defaultValue: null))
      ..add(
        ColorProperty(
          "primaryContainer",
          _primaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onPrimaryContainer",
          _onPrimaryContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("primaryFixed", _primaryFixed, defaultValue: null))
      ..add(
        ColorProperty("primaryFixedDim", _primaryFixedDim, defaultValue: null),
      )
      ..add(
        ColorProperty("onPrimaryFixed", _onPrimaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onPrimaryFixedVariant",
          _onPrimaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("secondary", _secondary, defaultValue: null))
      ..add(ColorProperty("onSecondary", _onSecondary, defaultValue: null))
      ..add(
        ColorProperty(
          "secondaryContainer",
          _secondaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryContainer",
          _onSecondaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("secondaryFixed", _secondaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "secondaryFixedDim",
          _secondaryFixedDim,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryFixed",
          _onSecondaryFixed,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryFixedVariant",
          _onSecondaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiary", _tertiary, defaultValue: null))
      ..add(ColorProperty("onTertiary", _onTertiary, defaultValue: null))
      ..add(
        ColorProperty(
          "tertiaryContainer",
          _tertiaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onTertiaryContainer",
          _onTertiaryContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiaryFixed", _tertiaryFixed, defaultValue: null))
      ..add(
        ColorProperty(
          "tertiaryFixedDim",
          _tertiaryFixedDim,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("onTertiaryFixed", _onTertiaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onTertiaryFixedVariant",
          _onTertiaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("error", _error, defaultValue: null))
      ..add(ColorProperty("onError", _onError, defaultValue: null))
      ..add(
        ColorProperty("errorContainer", _errorContainer, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onErrorContainer",
          _onErrorContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("surface", _surface, defaultValue: null))
      ..add(ColorProperty("onSurface", _onSurface, defaultValue: null))
      ..add(ColorProperty("surfaceDim", _surfaceDim, defaultValue: null))
      ..add(ColorProperty("surfaceBright", _surfaceBright, defaultValue: null))
      ..add(
        ColorProperty(
          "surfaceContainerLowest",
          _surfaceContainerLowest,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLow",
          _surfaceContainerLow,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainer",
          _surfaceContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHigh",
          _surfaceContainerHigh,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighest",
          _surfaceContainerHighest,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSurfaceVariant",
          _onSurfaceVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("outline", _outline, defaultValue: null))
      ..add(
        ColorProperty("outlineVariant", _outlineVariant, defaultValue: null),
      )
      ..add(ColorProperty("shadow", _shadow, defaultValue: null))
      ..add(ColorProperty("scrim", _scrim, defaultValue: null))
      ..add(
        ColorProperty("inverseSurface", _inverseSurface, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onInverseSurface",
          _onInverseSurface,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("inversePrimary", _inversePrimary, defaultValue: null),
      )
      ..add(ColorProperty("surfaceTint", _surfaceTint, defaultValue: null))
      ..add(ColorProperty("background", _background, defaultValue: null))
      ..add(ColorProperty("onBackground", _onBackground, defaultValue: null))
      ..add(
        ColorProperty("surfaceVariant", _surfaceVariant, defaultValue: null),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ColorThemeDataAsLegacy &&
          _value == other._value &&
          _brightness == other._brightness &&
          _primary == other._primary &&
          _onPrimary == other._onPrimary &&
          _primaryContainer == other._primaryContainer &&
          _onPrimaryContainer == other._onPrimaryContainer &&
          _primaryFixed == other._primaryFixed &&
          _primaryFixedDim == other._primaryFixedDim &&
          _onPrimaryFixed == other._onPrimaryFixed &&
          _onPrimaryFixedVariant == other._onPrimaryFixedVariant &&
          _secondary == other._secondary &&
          _onSecondary == other._onSecondary &&
          _secondaryContainer == other._secondaryContainer &&
          _onSecondaryContainer == other._onSecondaryContainer &&
          _secondaryFixed == other._secondaryFixed &&
          _secondaryFixedDim == other._secondaryFixedDim &&
          _onSecondaryFixed == other._onSecondaryFixed &&
          _onSecondaryFixedVariant == other._onSecondaryFixedVariant &&
          _tertiary == other._tertiary &&
          _onTertiary == other._onTertiary &&
          _tertiaryContainer == other._tertiaryContainer &&
          _onTertiaryContainer == other._onTertiaryContainer &&
          _tertiaryFixed == other._tertiaryFixed &&
          _tertiaryFixedDim == other._tertiaryFixedDim &&
          _onTertiaryFixed == other._onTertiaryFixed &&
          _onTertiaryFixedVariant == other._onTertiaryFixedVariant &&
          _error == other._error &&
          _onError == other._onError &&
          _errorContainer == other._errorContainer &&
          _onErrorContainer == other._onErrorContainer &&
          _surface == other._surface &&
          _onSurface == other._onSurface &&
          _surfaceDim == other._surfaceDim &&
          _surfaceBright == other._surfaceBright &&
          _surfaceContainerLowest == other._surfaceContainerLowest &&
          _surfaceContainerLow == other._surfaceContainerLow &&
          _surfaceContainer == other._surfaceContainer &&
          _surfaceContainerHigh == other._surfaceContainerHigh &&
          _surfaceContainerHighest == other._surfaceContainerHighest &&
          _onSurfaceVariant == other._onSurfaceVariant &&
          _outline == other._outline &&
          _outlineVariant == other._outlineVariant &&
          _shadow == other._shadow &&
          _scrim == other._scrim &&
          _inverseSurface == other._inverseSurface &&
          _onInverseSurface == other._onInverseSurface &&
          _inversePrimary == other._inversePrimary &&
          _surfaceTint == other._surfaceTint &&
          _background == other._background &&
          _onBackground == other._onBackground &&
          _surfaceVariant == other._surfaceVariant;

  @override
  int get hashCode => Object.hash(
    _value,
    _brightness,
    _primary,
    _onPrimary,
    _primaryContainer,
    _onPrimaryContainer,
    _primaryFixed,
    _primaryFixedDim,
    _onPrimaryFixed,
    _onPrimaryFixedVariant,
    _secondary,
    _onSecondary,
    _secondaryContainer,
    _onSecondaryContainer,
    _secondaryFixed,
    _secondaryFixedDim,
    _onSecondaryFixed,
    _onSecondaryFixedVariant,
    Object.hash(
      _tertiary,
      _onTertiary,
      _tertiaryContainer,
      _onTertiaryContainer,
      _tertiaryFixed,
      _tertiaryFixedDim,
      _onTertiaryFixed,
      _onTertiaryFixedVariant,
      _error,
      _onError,
      _errorContainer,
      _onErrorContainer,
      _surface,
      _onSurface,
      _surfaceDim,
      _surfaceBright,
      _surfaceContainerLowest,
      _surfaceContainerLow,
      _surfaceContainer,
      Object.hash(
        _surfaceContainerHigh,
        _surfaceContainerHighest,
        _onSurfaceVariant,
        _outline,
        _outlineVariant,
        _shadow,
        _scrim,
        _inverseSurface,
        _onInverseSurface,
        _inversePrimary,
        _surfaceTint,
        _background,
        _onBackground,
        _surfaceVariant,
      ),
    ),
  );
}
