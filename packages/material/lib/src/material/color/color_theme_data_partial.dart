// ignore_for_file: deprecated_member_use

part of 'color_theme.dart';

abstract class ColorThemeDataPartial with Diagnosticable {
  const ColorThemeDataPartial();

  const factory ColorThemeDataPartial.from({
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
  }) = _ColorThemeDataPartial;

  const factory ColorThemeDataPartial.fromLegacy(
    ColorSchemeLegacy colorScheme,
  ) = _ColorThemeDataPartialFromLegacy;

  Brightness? get brightness;

  Color? get primaryPaletteKeyColor;

  Color? get secondaryPaletteKeyColor;

  Color? get tertiaryPaletteKeyColor;

  Color? get neutralPaletteKeyColor;

  Color? get neutralVariantPaletteKeyColor;

  Color? get errorPaletteKeyColor;

  Color? get background;

  Color? get onBackground;

  Color? get surface;

  Color? get surfaceDim;

  Color? get surfaceBright;

  Color? get surfaceContainerLowest;

  Color? get surfaceContainerLow;

  Color? get surfaceContainer;

  Color? get surfaceContainerHigh;

  Color? get surfaceContainerHighest;

  Color? get onSurface;

  Color? get surfaceVariant;

  Color? get onSurfaceVariant;

  Color? get outline;

  Color? get outlineVariant;

  Color? get inverseSurface;

  Color? get inverseOnSurface;

  Color? get shadow;

  Color? get scrim;

  Color? get surfaceTint;

  Color? get primary;

  Color? get primaryDim;

  Color? get onPrimary;

  Color? get primaryContainer;

  Color? get onPrimaryContainer;

  Color? get primaryFixed;

  Color? get primaryFixedDim;

  Color? get onPrimaryFixed;

  Color? get onPrimaryFixedVariant;

  Color? get inversePrimary;

  Color? get secondary;

  Color? get secondaryDim;

  Color? get onSecondary;

  Color? get secondaryContainer;

  Color? get onSecondaryContainer;

  Color? get secondaryFixed;

  Color? get secondaryFixedDim;

  Color? get onSecondaryFixed;

  Color? get onSecondaryFixedVariant;

  Color? get tertiary;

  Color? get tertiaryDim;

  Color? get onTertiary;

  Color? get tertiaryContainer;

  Color? get onTertiaryContainer;

  Color? get tertiaryFixed;

  Color? get tertiaryFixedDim;

  Color? get onTertiaryFixed;

  Color? get onTertiaryFixedVariant;

  Color? get error;

  Color? get errorDim;

  Color? get onError;

  Color? get errorContainer;

  Color? get onErrorContainer;

  ColorThemeDataPartial copy({
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

  ColorThemeDataPartial copyWith({
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
      ? copy(
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

  ColorThemeDataPartial merge(ColorThemeDataPartial? other) => other != null
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
      : this;

  bool get isEmpty =>
      brightness == null &&
      primaryPaletteKeyColor == null &&
      secondaryPaletteKeyColor == null &&
      tertiaryPaletteKeyColor == null &&
      neutralPaletteKeyColor == null &&
      neutralVariantPaletteKeyColor == null &&
      errorPaletteKeyColor == null &&
      background == null &&
      onBackground == null &&
      surface == null &&
      surfaceDim == null &&
      surfaceBright == null &&
      surfaceContainerLowest == null &&
      surfaceContainerLow == null &&
      surfaceContainer == null &&
      surfaceContainerHigh == null &&
      surfaceContainerHighest == null &&
      onSurface == null &&
      surfaceVariant == null &&
      onSurfaceVariant == null &&
      outline == null &&
      outlineVariant == null &&
      inverseSurface == null &&
      inverseOnSurface == null &&
      shadow == null &&
      scrim == null &&
      surfaceTint == null &&
      primary == null &&
      primaryDim == null &&
      onPrimary == null &&
      primaryContainer == null &&
      onPrimaryContainer == null &&
      primaryFixed == null &&
      primaryFixedDim == null &&
      onPrimaryFixed == null &&
      onPrimaryFixedVariant == null &&
      inversePrimary == null &&
      secondary == null &&
      secondaryDim == null &&
      onSecondary == null &&
      secondaryContainer == null &&
      onSecondaryContainer == null &&
      secondaryFixed == null &&
      secondaryFixedDim == null &&
      onSecondaryFixed == null &&
      onSecondaryFixedVariant == null &&
      tertiary == null &&
      tertiaryDim == null &&
      onTertiary == null &&
      tertiaryContainer == null &&
      onTertiaryContainer == null &&
      tertiaryFixed == null &&
      tertiaryFixedDim == null &&
      onTertiaryFixed == null &&
      onTertiaryFixedVariant == null &&
      error == null &&
      errorDim == null &&
      onError == null &&
      errorContainer == null &&
      onErrorContainer == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
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
      onErrorContainer != null;

  ColorThemeData? get asConcrete =>
      isConcrete ? _ColorThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        EnumProperty<Brightness>("brightness", brightness, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "primaryPaletteKeyColor",
          primaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColor",
          secondaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColor",
          tertiaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColor",
          neutralPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColor",
          neutralVariantPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "errorPaletteKeyColor",
          errorPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("background", background, defaultValue: null))
      ..add(ColorProperty("onBackground", onBackground, defaultValue: null))
      ..add(ColorProperty("surface", surface, defaultValue: null))
      ..add(ColorProperty("surfaceDim", surfaceDim, defaultValue: null))
      ..add(ColorProperty("surfaceBright", surfaceBright, defaultValue: null))
      ..add(
        ColorProperty(
          "surfaceContainerLowest",
          surfaceContainerLowest,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLow",
          surfaceContainerLow,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("surfaceContainer", surfaceContainer, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHigh",
          surfaceContainerHigh,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighest",
          surfaceContainerHighest,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("onSurface", onSurface, defaultValue: null))
      ..add(ColorProperty("surfaceVariant", surfaceVariant, defaultValue: null))
      ..add(
        ColorProperty("onSurfaceVariant", onSurfaceVariant, defaultValue: null),
      )
      ..add(ColorProperty("outline", outline, defaultValue: null))
      ..add(ColorProperty("outlineVariant", outlineVariant, defaultValue: null))
      ..add(ColorProperty("inverseSurface", inverseSurface, defaultValue: null))
      ..add(
        ColorProperty("inverseOnSurface", inverseOnSurface, defaultValue: null),
      )
      ..add(ColorProperty("shadow", shadow, defaultValue: null))
      ..add(ColorProperty("scrim", scrim, defaultValue: null))
      ..add(ColorProperty("surfaceTint", surfaceTint, defaultValue: null))
      ..add(ColorProperty("primary", primary, defaultValue: null))
      ..add(ColorProperty("primaryDim", primaryDim, defaultValue: null))
      ..add(ColorProperty("onPrimary", onPrimary, defaultValue: null))
      ..add(
        ColorProperty("primaryContainer", primaryContainer, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onPrimaryContainer",
          onPrimaryContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("primaryFixed", primaryFixed, defaultValue: null))
      ..add(
        ColorProperty("primaryFixedDim", primaryFixedDim, defaultValue: null),
      )
      ..add(ColorProperty("onPrimaryFixed", onPrimaryFixed, defaultValue: null))
      ..add(
        ColorProperty(
          "onPrimaryFixedVariant",
          onPrimaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("inversePrimary", inversePrimary, defaultValue: null))
      ..add(ColorProperty("secondary", secondary, defaultValue: null))
      ..add(ColorProperty("secondaryDim", secondaryDim, defaultValue: null))
      ..add(ColorProperty("onSecondary", onSecondary, defaultValue: null))
      ..add(
        ColorProperty(
          "secondaryContainer",
          secondaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryContainer",
          onSecondaryContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("secondaryFixed", secondaryFixed, defaultValue: null))
      ..add(
        ColorProperty(
          "secondaryFixedDim",
          secondaryFixedDim,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("onSecondaryFixed", onSecondaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onSecondaryFixedVariant",
          onSecondaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiary", tertiary, defaultValue: null))
      ..add(ColorProperty("tertiaryDim", tertiaryDim, defaultValue: null))
      ..add(ColorProperty("onTertiary", onTertiary, defaultValue: null))
      ..add(
        ColorProperty(
          "tertiaryContainer",
          tertiaryContainer,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onTertiaryContainer",
          onTertiaryContainer,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiaryFixed", tertiaryFixed, defaultValue: null))
      ..add(
        ColorProperty("tertiaryFixedDim", tertiaryFixedDim, defaultValue: null),
      )
      ..add(
        ColorProperty("onTertiaryFixed", onTertiaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onTertiaryFixedVariant",
          onTertiaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("error", error, defaultValue: null))
      ..add(ColorProperty("errorDim", errorDim, defaultValue: null))
      ..add(ColorProperty("onError", onError, defaultValue: null))
      ..add(ColorProperty("errorContainer", errorContainer, defaultValue: null))
      ..add(
        ColorProperty("onErrorContainer", onErrorContainer, defaultValue: null),
      );
  }
}

class _ColorThemeDataPartial extends ColorThemeDataPartial {
  const _ColorThemeDataPartial({
    this.brightness,
    this.primaryPaletteKeyColor,
    this.secondaryPaletteKeyColor,
    this.tertiaryPaletteKeyColor,
    this.neutralPaletteKeyColor,
    this.neutralVariantPaletteKeyColor,
    this.errorPaletteKeyColor,
    this.background,
    this.onBackground,
    this.surface,
    this.surfaceDim,
    this.surfaceBright,
    this.surfaceContainerLowest,
    this.surfaceContainerLow,
    this.surfaceContainer,
    this.surfaceContainerHigh,
    this.surfaceContainerHighest,
    this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.outline,
    this.outlineVariant,
    this.inverseSurface,
    this.inverseOnSurface,
    this.shadow,
    this.scrim,
    this.surfaceTint,
    this.primary,
    this.primaryDim,
    this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.primaryFixed,
    this.primaryFixedDim,
    this.onPrimaryFixed,
    this.onPrimaryFixedVariant,
    this.inversePrimary,
    this.secondary,
    this.secondaryDim,
    this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.secondaryFixed,
    this.secondaryFixedDim,
    this.onSecondaryFixed,
    this.onSecondaryFixedVariant,
    this.tertiary,
    this.tertiaryDim,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    this.tertiaryFixed,
    this.tertiaryFixedDim,
    this.onTertiaryFixed,
    this.onTertiaryFixedVariant,
    this.error,
    this.errorDim,
    this.onError,
    this.errorContainer,
    this.onErrorContainer,
  });

  @override
  final Brightness? brightness;

  @override
  final Color? primaryPaletteKeyColor;

  @override
  final Color? secondaryPaletteKeyColor;

  @override
  final Color? tertiaryPaletteKeyColor;

  @override
  final Color? neutralPaletteKeyColor;

  @override
  final Color? neutralVariantPaletteKeyColor;

  @override
  final Color? errorPaletteKeyColor;

  @override
  final Color? background;

  @override
  final Color? onBackground;

  @override
  final Color? surface;

  @override
  final Color? surfaceDim;

  @override
  final Color? surfaceBright;

  @override
  final Color? surfaceContainerLowest;

  @override
  final Color? surfaceContainerLow;

  @override
  final Color? surfaceContainer;

  @override
  final Color? surfaceContainerHigh;

  @override
  final Color? surfaceContainerHighest;

  @override
  final Color? onSurface;

  @override
  final Color? surfaceVariant;

  @override
  final Color? onSurfaceVariant;

  @override
  final Color? outline;

  @override
  final Color? outlineVariant;

  @override
  final Color? inverseSurface;

  @override
  final Color? inverseOnSurface;

  @override
  final Color? shadow;

  @override
  final Color? scrim;

  @override
  final Color? surfaceTint;

  @override
  final Color? primary;

  @override
  final Color? primaryDim;

  @override
  final Color? onPrimary;

  @override
  final Color? primaryContainer;

  @override
  final Color? onPrimaryContainer;

  @override
  final Color? primaryFixed;

  @override
  final Color? primaryFixedDim;

  @override
  final Color? onPrimaryFixed;

  @override
  final Color? onPrimaryFixedVariant;

  @override
  final Color? inversePrimary;

  @override
  final Color? secondary;

  @override
  final Color? secondaryDim;

  @override
  final Color? onSecondary;

  @override
  final Color? secondaryContainer;

  @override
  final Color? onSecondaryContainer;

  @override
  final Color? secondaryFixed;

  @override
  final Color? secondaryFixedDim;

  @override
  final Color? onSecondaryFixed;

  @override
  final Color? onSecondaryFixedVariant;

  @override
  final Color? tertiary;

  @override
  final Color? tertiaryDim;

  @override
  final Color? onTertiary;

  @override
  final Color? tertiaryContainer;

  @override
  final Color? onTertiaryContainer;

  @override
  final Color? tertiaryFixed;

  @override
  final Color? tertiaryFixedDim;

  @override
  final Color? onTertiaryFixed;

  @override
  final Color? onTertiaryFixedVariant;

  @override
  final Color? error;

  @override
  final Color? errorDim;

  @override
  final Color? onError;

  @override
  final Color? errorContainer;

  @override
  final Color? onErrorContainer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ColorThemeDataPartial &&
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

class _ColorThemeDataPartialFromLegacy extends ColorThemeDataPartial {
  const _ColorThemeDataPartialFromLegacy(
    ColorSchemeLegacy colorScheme, {
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
  }) : _colorScheme = colorScheme,
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

  final ColorSchemeLegacy _colorScheme;

  final Brightness? _brightness;
  final Color? _primaryPaletteKeyColor;
  final Color? _secondaryPaletteKeyColor;
  final Color? _tertiaryPaletteKeyColor;
  final Color? _neutralPaletteKeyColor;
  final Color? _neutralVariantPaletteKeyColor;
  final Color? _errorPaletteKeyColor;
  final Color? _background;
  final Color? _onBackground;
  final Color? _surface;
  final Color? _surfaceDim;
  final Color? _surfaceBright;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _onSurface;
  final Color? _surfaceVariant;
  final Color? _onSurfaceVariant;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _inverseSurface;
  final Color? _inverseOnSurface;
  final Color? _shadow;
  final Color? _scrim;
  final Color? _surfaceTint;
  final Color? _primary;
  final Color? _primaryDim;
  final Color? _onPrimary;
  final Color? _primaryContainer;
  final Color? _onPrimaryContainer;
  final Color? _primaryFixed;
  final Color? _primaryFixedDim;
  final Color? _onPrimaryFixed;
  final Color? _onPrimaryFixedVariant;
  final Color? _inversePrimary;
  final Color? _secondary;
  final Color? _secondaryDim;
  final Color? _onSecondary;
  final Color? _secondaryContainer;
  final Color? _onSecondaryContainer;
  final Color? _secondaryFixed;
  final Color? _secondaryFixedDim;
  final Color? _onSecondaryFixed;
  final Color? _onSecondaryFixedVariant;
  final Color? _tertiary;
  final Color? _tertiaryDim;
  final Color? _onTertiary;
  final Color? _tertiaryContainer;
  final Color? _onTertiaryContainer;
  final Color? _tertiaryFixed;
  final Color? _tertiaryFixedDim;
  final Color? _onTertiaryFixed;
  final Color? _onTertiaryFixedVariant;
  final Color? _error;
  final Color? _errorDim;
  final Color? _onError;
  final Color? _errorContainer;
  final Color? _onErrorContainer;

  @override
  Brightness? get brightness => _brightness ?? _colorScheme.brightness;

  @override
  Color? get primaryPaletteKeyColor => _primaryPaletteKeyColor;

  @override
  Color? get secondaryPaletteKeyColor => _secondaryPaletteKeyColor;

  @override
  Color? get tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor;

  @override
  Color? get neutralPaletteKeyColor => _neutralPaletteKeyColor;

  @override
  Color? get neutralVariantPaletteKeyColor => _neutralVariantPaletteKeyColor;

  @override
  Color? get errorPaletteKeyColor => _errorPaletteKeyColor;

  @override
  Color? get background => _background ?? _colorScheme.background;

  @override
  Color? get onBackground => _onBackground ?? _colorScheme.onBackground;

  @override
  Color? get surface => _surface ?? _colorScheme.surface;

  @override
  Color? get surfaceDim => _surfaceDim ?? _colorScheme.surfaceDim;

  @override
  Color? get surfaceBright => _surfaceBright ?? _colorScheme.surfaceBright;

  @override
  Color? get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _colorScheme.surfaceContainerLowest;

  @override
  Color? get surfaceContainerLow =>
      _surfaceContainerLow ?? _colorScheme.surfaceContainerLow;

  @override
  Color? get surfaceContainer =>
      _surfaceContainer ?? _colorScheme.surfaceContainer;

  @override
  Color? get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _colorScheme.surfaceContainerHigh;

  @override
  Color? get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _colorScheme.surfaceContainerHighest;

  @override
  Color? get onSurface => _onSurface ?? _colorScheme.onSurface;

  @override
  Color? get surfaceVariant => _surfaceVariant ?? _colorScheme.surfaceVariant;

  @override
  Color? get onSurfaceVariant =>
      _onSurfaceVariant ?? _colorScheme.onSurfaceVariant;

  @override
  Color? get outline => _outline ?? _colorScheme.outline;

  @override
  Color? get outlineVariant => _outlineVariant ?? _colorScheme.outlineVariant;

  @override
  Color? get inverseSurface => _inverseSurface ?? _colorScheme.inverseSurface;

  @override
  Color? get inverseOnSurface =>
      _inverseOnSurface ?? _colorScheme.onInverseSurface;

  @override
  Color? get shadow => _shadow ?? _colorScheme.shadow;

  @override
  Color? get scrim => _scrim ?? _colorScheme.scrim;

  @override
  Color? get surfaceTint => _surfaceTint ?? _colorScheme.surfaceTint;

  @override
  Color? get primary => _primary ?? _colorScheme.primary;

  @override
  Color? get primaryDim => _primaryDim;

  @override
  Color? get onPrimary => _onPrimary ?? _colorScheme.onPrimary;

  @override
  Color? get primaryContainer =>
      _primaryContainer ?? _colorScheme.primaryContainer;

  @override
  Color? get onPrimaryContainer =>
      _onPrimaryContainer ?? _colorScheme.onPrimaryContainer;

  @override
  Color? get primaryFixed => _primaryFixed ?? _colorScheme.primaryFixed;

  @override
  Color? get primaryFixedDim =>
      _primaryFixedDim ?? _colorScheme.primaryFixedDim;

  @override
  Color? get onPrimaryFixed => _onPrimaryFixed ?? _colorScheme.onPrimaryFixed;

  @override
  Color? get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _colorScheme.onPrimaryFixedVariant;

  @override
  Color? get inversePrimary => _inversePrimary ?? _colorScheme.inversePrimary;

  @override
  Color? get secondary => _secondary ?? _colorScheme.secondary;

  @override
  Color? get secondaryDim => _secondaryDim;

  @override
  Color? get onSecondary => _onSecondary ?? _colorScheme.onSecondary;

  @override
  Color? get secondaryContainer =>
      _secondaryContainer ?? _colorScheme.secondaryContainer;

  @override
  Color? get onSecondaryContainer =>
      _onSecondaryContainer ?? _colorScheme.onSecondaryContainer;

  @override
  Color? get secondaryFixed => _secondaryFixed ?? _colorScheme.secondaryFixed;

  @override
  Color? get secondaryFixedDim =>
      _secondaryFixedDim ?? _colorScheme.secondaryFixedDim;

  @override
  Color? get onSecondaryFixed =>
      _onSecondaryFixed ?? _colorScheme.onSecondaryFixed;

  @override
  Color? get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _colorScheme.onSecondaryFixedVariant;

  @override
  Color? get tertiary => _tertiary ?? _colorScheme.tertiary;

  @override
  Color? get tertiaryDim => _tertiaryDim;

  @override
  Color? get onTertiary => _onTertiary ?? _colorScheme.onTertiary;

  @override
  Color? get tertiaryContainer =>
      _tertiaryContainer ?? _colorScheme.tertiaryContainer;

  @override
  Color? get onTertiaryContainer =>
      _onTertiaryContainer ?? _colorScheme.onTertiaryContainer;

  @override
  Color? get tertiaryFixed => _tertiaryFixed ?? _colorScheme.tertiaryFixed;

  @override
  Color? get tertiaryFixedDim =>
      _tertiaryFixedDim ?? _colorScheme.tertiaryFixedDim;

  @override
  Color? get onTertiaryFixed =>
      _onTertiaryFixed ?? _colorScheme.onTertiaryFixed;

  @override
  Color? get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _colorScheme.onTertiaryFixedVariant;

  @override
  Color? get error => _error ?? _colorScheme.error;

  @override
  Color? get errorDim => _errorDim;

  @override
  Color? get onError => _onError ?? _colorScheme.onError;

  @override
  Color? get errorContainer => _errorContainer ?? _colorScheme.errorContainer;

  @override
  Color? get onErrorContainer =>
      _onErrorContainer ?? _colorScheme.onErrorContainer;

  @override
  ColorThemeDataPartial copyWith({
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
  }) {
    if (brightness == null &&
        primaryPaletteKeyColor == null &&
        secondaryPaletteKeyColor == null &&
        tertiaryPaletteKeyColor == null &&
        neutralPaletteKeyColor == null &&
        neutralVariantPaletteKeyColor == null &&
        errorPaletteKeyColor == null &&
        background == null &&
        onBackground == null &&
        surface == null &&
        surfaceDim == null &&
        surfaceBright == null &&
        surfaceContainerLowest == null &&
        surfaceContainerLow == null &&
        surfaceContainer == null &&
        surfaceContainerHigh == null &&
        surfaceContainerHighest == null &&
        onSurface == null &&
        surfaceVariant == null &&
        onSurfaceVariant == null &&
        outline == null &&
        outlineVariant == null &&
        inverseSurface == null &&
        inverseOnSurface == null &&
        shadow == null &&
        scrim == null &&
        surfaceTint == null &&
        primary == null &&
        primaryDim == null &&
        onPrimary == null &&
        primaryContainer == null &&
        onPrimaryContainer == null &&
        primaryFixed == null &&
        primaryFixedDim == null &&
        onPrimaryFixed == null &&
        onPrimaryFixedVariant == null &&
        inversePrimary == null &&
        secondary == null &&
        secondaryDim == null &&
        onSecondary == null &&
        secondaryContainer == null &&
        onSecondaryContainer == null &&
        secondaryFixed == null &&
        secondaryFixedDim == null &&
        onSecondaryFixed == null &&
        onSecondaryFixedVariant == null &&
        tertiary == null &&
        tertiaryDim == null &&
        onTertiary == null &&
        tertiaryContainer == null &&
        onTertiaryContainer == null &&
        tertiaryFixed == null &&
        tertiaryFixedDim == null &&
        onTertiaryFixed == null &&
        onTertiaryFixedVariant == null &&
        error == null &&
        errorDim == null &&
        onError == null &&
        errorContainer == null &&
        onErrorContainer == null) {
      return this;
    }
    if (brightness != null &&
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
        onErrorContainer != null) {
      return .from(
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
      );
    }
    return _ColorThemeDataPartialFromLegacy(
      _colorScheme,
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
    );
  }

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<ColorSchemeLegacy>("color scheme", _colorScheme),
      )
      ..add(
        EnumProperty<Brightness>("brightness", _brightness, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "primaryPaletteKeyColor",
          _primaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColor",
          _secondaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColor",
          _tertiaryPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColor",
          _neutralPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColor",
          _neutralVariantPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "errorPaletteKeyColor",
          _errorPaletteKeyColor,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("background", _background, defaultValue: null))
      ..add(ColorProperty("onBackground", _onBackground, defaultValue: null))
      ..add(ColorProperty("surface", _surface, defaultValue: null))
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
      ..add(ColorProperty("onSurface", _onSurface, defaultValue: null))
      ..add(
        ColorProperty("surfaceVariant", _surfaceVariant, defaultValue: null),
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
      ..add(
        ColorProperty("inverseSurface", _inverseSurface, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "inverseOnSurface",
          _inverseOnSurface,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("shadow", _shadow, defaultValue: null))
      ..add(ColorProperty("scrim", _scrim, defaultValue: null))
      ..add(ColorProperty("surfaceTint", _surfaceTint, defaultValue: null))
      ..add(ColorProperty("primary", _primary, defaultValue: null))
      ..add(ColorProperty("primaryDim", _primaryDim, defaultValue: null))
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
      ..add(
        ColorProperty("inversePrimary", _inversePrimary, defaultValue: null),
      )
      ..add(ColorProperty("secondary", _secondary, defaultValue: null))
      ..add(ColorProperty("secondaryDim", _secondaryDim, defaultValue: null))
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
      ..add(ColorProperty("tertiaryDim", _tertiaryDim, defaultValue: null))
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
      ..add(ColorProperty("errorDim", _errorDim, defaultValue: null))
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
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorThemeDataPartialFromLegacy &&
          _colorScheme == other._colorScheme &&
          _brightness == other._brightness &&
          _primaryPaletteKeyColor == other._primaryPaletteKeyColor &&
          _secondaryPaletteKeyColor == other._secondaryPaletteKeyColor &&
          _tertiaryPaletteKeyColor == other._tertiaryPaletteKeyColor &&
          _neutralPaletteKeyColor == other._neutralPaletteKeyColor &&
          _neutralVariantPaletteKeyColor ==
              other._neutralVariantPaletteKeyColor &&
          _errorPaletteKeyColor == other._errorPaletteKeyColor &&
          _background == other._background &&
          _onBackground == other._onBackground &&
          _surface == other._surface &&
          _surfaceDim == other._surfaceDim &&
          _surfaceBright == other._surfaceBright &&
          _surfaceContainerLowest == other._surfaceContainerLowest &&
          _surfaceContainerLow == other._surfaceContainerLow &&
          _surfaceContainer == other._surfaceContainer &&
          _surfaceContainerHigh == other._surfaceContainerHigh &&
          _surfaceContainerHighest == other._surfaceContainerHighest &&
          _onSurface == other._onSurface &&
          _surfaceVariant == other._surfaceVariant &&
          _onSurfaceVariant == other._onSurfaceVariant &&
          _outline == other._outline &&
          _outlineVariant == other._outlineVariant &&
          _inverseSurface == other._inverseSurface &&
          _inverseOnSurface == other._inverseOnSurface &&
          _shadow == other._shadow &&
          _scrim == other._scrim &&
          _surfaceTint == other._surfaceTint &&
          _primary == other._primary &&
          _primaryDim == other._primaryDim &&
          _onPrimary == other._onPrimary &&
          _primaryContainer == other._primaryContainer &&
          _onPrimaryContainer == other._onPrimaryContainer &&
          _primaryFixed == other._primaryFixed &&
          _primaryFixedDim == other._primaryFixedDim &&
          _onPrimaryFixed == other._onPrimaryFixed &&
          _onPrimaryFixedVariant == other._onPrimaryFixedVariant &&
          _inversePrimary == other._inversePrimary &&
          _secondary == other._secondary &&
          _secondaryDim == other._secondaryDim &&
          _onSecondary == other._onSecondary &&
          _secondaryContainer == other._secondaryContainer &&
          _onSecondaryContainer == other._onSecondaryContainer &&
          _secondaryFixed == other._secondaryFixed &&
          _secondaryFixedDim == other._secondaryFixedDim &&
          _onSecondaryFixed == other._onSecondaryFixed &&
          _onSecondaryFixedVariant == other._onSecondaryFixedVariant &&
          _tertiary == other._tertiary &&
          _tertiaryDim == other._tertiaryDim &&
          _onTertiary == other._onTertiary &&
          _tertiaryContainer == other._tertiaryContainer &&
          _onTertiaryContainer == other._onTertiaryContainer &&
          _tertiaryFixed == other._tertiaryFixed &&
          _tertiaryFixedDim == other._tertiaryFixedDim &&
          _onTertiaryFixed == other._onTertiaryFixed &&
          _onTertiaryFixedVariant == other._onTertiaryFixedVariant &&
          _error == other._error &&
          _errorDim == other._errorDim &&
          _onError == other._onError &&
          _errorContainer == other._errorContainer &&
          _onErrorContainer == other._onErrorContainer;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorScheme,
    _brightness,
    _primaryPaletteKeyColor,
    _secondaryPaletteKeyColor,
    _tertiaryPaletteKeyColor,
    _neutralPaletteKeyColor,
    _neutralVariantPaletteKeyColor,
    _errorPaletteKeyColor,
    _background,
    _onBackground,
    _surface,
    _surfaceDim,
    _surfaceBright,
    _surfaceContainerLowest,
    _surfaceContainerLow,
    _surfaceContainer,
    _surfaceContainerHigh,
    _surfaceContainerHighest,
    Object.hash(
      _onSurface,
      _surfaceVariant,
      _onSurfaceVariant,
      _outline,
      _outlineVariant,
      _inverseSurface,
      _inverseOnSurface,
      _shadow,
      _scrim,
      _surfaceTint,
      _primary,
      _primaryDim,
      _onPrimary,
      _primaryContainer,
      _onPrimaryContainer,
      _primaryFixed,
      _primaryFixedDim,
      _onPrimaryFixed,
      _onPrimaryFixedVariant,
      Object.hash(
        _inversePrimary,
        _secondary,
        _secondaryDim,
        _onSecondary,
        _secondaryContainer,
        _onSecondaryContainer,
        _secondaryFixed,
        _secondaryFixedDim,
        _onSecondaryFixed,
        _onSecondaryFixedVariant,
        _tertiary,
        _tertiaryDim,
        _onTertiary,
        _tertiaryContainer,
        _onTertiaryContainer,
        _tertiaryFixed,
        _tertiaryFixedDim,
        _onTertiaryFixed,
        _onTertiaryFixedVariant,
        Object.hash(
          _error,
          _errorDim,
          _onError,
          _errorContainer,
          _onErrorContainer,
        ),
      ),
    ),
  );
}

class _ColorThemeDataPartialAsConcrete extends ColorThemeData {
  _ColorThemeDataPartialAsConcrete(this._value) : assert(_value.isConcrete);

  final ColorThemeDataPartial _value;

  @override
  Brightness get brightness => _value.brightness!;

  @override
  Color get primaryPaletteKeyColor => _value.primaryPaletteKeyColor!;

  @override
  Color get secondaryPaletteKeyColor => _value.secondaryPaletteKeyColor!;

  @override
  Color get tertiaryPaletteKeyColor => _value.tertiaryPaletteKeyColor!;

  @override
  Color get neutralPaletteKeyColor => _value.neutralPaletteKeyColor!;

  @override
  Color get neutralVariantPaletteKeyColor =>
      _value.neutralVariantPaletteKeyColor!;

  @override
  Color get errorPaletteKeyColor => _value.errorPaletteKeyColor!;

  @override
  Color get background => _value.background!;

  @override
  Color get onBackground => _value.onBackground!;

  @override
  Color get surface => _value.surface!;

  @override
  Color get surfaceDim => _value.surfaceDim!;

  @override
  Color get surfaceBright => _value.surfaceBright!;

  @override
  Color get surfaceContainerLowest => _value.surfaceContainerLowest!;

  @override
  Color get surfaceContainerLow => _value.surfaceContainerLow!;

  @override
  Color get surfaceContainer => _value.surfaceContainer!;

  @override
  Color get surfaceContainerHigh => _value.surfaceContainerHigh!;

  @override
  Color get surfaceContainerHighest => _value.surfaceContainerHighest!;

  @override
  Color get onSurface => _value.onSurface!;

  @override
  Color get surfaceVariant => _value.surfaceVariant!;

  @override
  Color get onSurfaceVariant => _value.onSurfaceVariant!;

  @override
  Color get outline => _value.outline!;

  @override
  Color get outlineVariant => _value.outlineVariant!;

  @override
  Color get inverseSurface => _value.inverseSurface!;

  @override
  Color get inverseOnSurface => _value.inverseOnSurface!;

  @override
  Color get shadow => _value.shadow!;

  @override
  Color get scrim => _value.scrim!;

  @override
  Color get surfaceTint => _value.surfaceTint!;

  @override
  Color get primary => _value.primary!;

  @override
  Color get primaryDim => _value.primaryDim!;

  @override
  Color get onPrimary => _value.onPrimary!;

  @override
  Color get primaryContainer => _value.primaryContainer!;

  @override
  Color get onPrimaryContainer => _value.onPrimaryContainer!;

  @override
  Color get primaryFixed => _value.primaryFixed!;

  @override
  Color get primaryFixedDim => _value.primaryFixedDim!;

  @override
  Color get onPrimaryFixed => _value.onPrimaryFixed!;

  @override
  Color get onPrimaryFixedVariant => _value.onPrimaryFixedVariant!;

  @override
  Color get inversePrimary => _value.inversePrimary!;

  @override
  Color get secondary => _value.secondary!;

  @override
  Color get secondaryDim => _value.secondaryDim!;

  @override
  Color get onSecondary => _value.onSecondary!;

  @override
  Color get secondaryContainer => _value.secondaryContainer!;

  @override
  Color get onSecondaryContainer => _value.onSecondaryContainer!;

  @override
  Color get secondaryFixed => _value.secondaryFixed!;

  @override
  Color get secondaryFixedDim => _value.secondaryFixedDim!;

  @override
  Color get onSecondaryFixed => _value.onSecondaryFixed!;

  @override
  Color get onSecondaryFixedVariant => _value.onSecondaryFixedVariant!;

  @override
  Color get tertiary => _value.tertiary!;

  @override
  Color get tertiaryDim => _value.tertiaryDim!;

  @override
  Color get onTertiary => _value.onTertiary!;

  @override
  Color get tertiaryContainer => _value.tertiaryContainer!;

  @override
  Color get onTertiaryContainer => _value.onTertiaryContainer!;

  @override
  Color get tertiaryFixed => _value.tertiaryFixed!;

  @override
  Color get tertiaryFixedDim => _value.tertiaryFixedDim!;

  @override
  Color get onTertiaryFixed => _value.onTertiaryFixed!;

  @override
  Color get onTertiaryFixedVariant => _value.onTertiaryFixedVariant!;

  @override
  Color get error => _value.error!;

  @override
  Color get errorDim => _value.errorDim!;

  @override
  Color get onError => _value.onError!;

  @override
  Color get errorContainer => _value.errorContainer!;

  @override
  Color get onErrorContainer => _value.onErrorContainer!;

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
  }) {
    final all =
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
        onErrorContainer != null;

    if (all) {
      return .from(
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
      );
    }

    final some =
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
        onErrorContainer != null;
    return some
        ? _ColorThemeDataPartialAsConcrete(
            _value.copy(
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
          )
        : this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ColorThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
