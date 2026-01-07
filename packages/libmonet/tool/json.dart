// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libmonet/material_color_utilities.dart';
import 'package:libmonet/android_dynamic_colors.dart';

import 'color.dart';

part 'json.freezed.dart';
part 'json.g.dart';

@freezed
abstract class Figma with _$Figma {
  const factory Figma({
    @Default("") String description,
    @ColorConverter() required Color seed,
    required FigmaCoreColors coreColors,
    @Default([]) List<FigmaExtendedColor> extendedColors,
    required FigmaSchemes schemes,
    required FigmaPalettes palettes,
  }) = _Figma;

  factory Figma.fromJson(Map<String, Object?> json) => _$FigmaFromJson(json);
}

@freezed
abstract class FigmaCoreColors with _$FigmaCoreColors {
  const factory FigmaCoreColors({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutral,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutralVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
  }) = _FigmaCoreColors;

  factory FigmaCoreColors.fromJson(Map<String, Object?> json) =>
      _$FigmaCoreColorsFromJson(json);
}

@freezed
abstract class FigmaExtendedColor with _$FigmaExtendedColor {
  const factory FigmaExtendedColor({
    required String name,
    @ColorConverter() required Color color,
    @Default("") String description,
    @Default(false) bool harmonized,
  }) = _FigmaExtendedColor;

  factory FigmaExtendedColor.fromJson(Map<String, Object?> json) =>
      _$FigmaExtendedColorFromJson(json);
}

@freezed
abstract class FigmaSchemes with _$FigmaSchemes {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory FigmaSchemes({
    required FigmaScheme light,
    required FigmaScheme lightMediumContrast,
    required FigmaScheme lightHighContrast,
    required FigmaScheme dark,
    required FigmaScheme darkMediumContrast,
    required FigmaScheme darkHighContrast,
  }) = _FigmaSchemes;

  factory FigmaSchemes.fromDynamicSchemes({
    required DynamicScheme light,
    required DynamicScheme lightMediumContrast,
    required DynamicScheme lightHighContrast,
    required DynamicScheme dark,
    required DynamicScheme darkMediumContrast,
    required DynamicScheme darkHighContrast,
  }) {
    return FigmaSchemes(
      light: FigmaScheme.fromDynamicScheme(light),
      lightMediumContrast: FigmaScheme.fromDynamicScheme(lightMediumContrast),
      lightHighContrast: FigmaScheme.fromDynamicScheme(lightHighContrast),
      dark: FigmaScheme.fromDynamicScheme(dark),
      darkMediumContrast: FigmaScheme.fromDynamicScheme(darkMediumContrast),
      darkHighContrast: FigmaScheme.fromDynamicScheme(darkHighContrast),
    );
  }

  factory FigmaSchemes.fromJson(Map<String, Object?> json) =>
      _$FigmaSchemesFromJson(json);
}

@freezed
abstract class FigmaScheme with _$FigmaScheme {
  const factory FigmaScheme({
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? background,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceBright,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerLowest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outline,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outlineVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseOnSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? scrim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceTint,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inversePrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onError,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onErrorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlActivated,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlNormal,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlHighlight,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textHintInverse,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? widgetBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockHour,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockMinute,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockSecond,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? weatherTemp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onThemeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeAppRing,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeNotif,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandA,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandB,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandC,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandD,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? underSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeActive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeActive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeInactive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? overviewBackground,
  }) = _FigmaScheme;

  factory FigmaScheme.fromDynamicScheme(DynamicScheme scheme) => FigmaScheme(
    primaryPaletteKeyColor: Color.argb(
      _mdc.primaryPaletteKeyColor.getArgb(scheme),
    ),
    secondaryPaletteKeyColor: Color.argb(
      _mdc.secondaryPaletteKeyColor.getArgb(scheme),
    ),
    tertiaryPaletteKeyColor: Color.argb(
      _mdc.tertiaryPaletteKeyColor.getArgb(scheme),
    ),
    neutralPaletteKeyColor: Color.argb(
      _mdc.neutralPaletteKeyColor.getArgb(scheme),
    ),
    neutralVariantPaletteKeyColor: Color.argb(
      _mdc.neutralVariantPaletteKeyColor.getArgb(scheme),
    ),
    errorPaletteKeyColor: Color.argb(_mdc.errorPaletteKeyColor.getArgb(scheme)),
    background: Color.argb(_mdc.background.getArgb(scheme)),
    onBackground: Color.argb(_mdc.onBackground.getArgb(scheme)),
    surface: Color.argb(_mdc.surface.getArgb(scheme)),
    surfaceDim: Color.argb(_mdc.surfaceDim.getArgb(scheme)),
    surfaceBright: Color.argb(_mdc.surfaceBright.getArgb(scheme)),
    surfaceContainerLowest: Color.argb(
      _mdc.surfaceContainerLowest.getArgb(scheme),
    ),
    surfaceContainerLow: Color.argb(_mdc.surfaceContainerLow.getArgb(scheme)),
    surfaceContainer: Color.argb(_mdc.surfaceContainer.getArgb(scheme)),
    surfaceContainerHigh: Color.argb(_mdc.surfaceContainerHigh.getArgb(scheme)),
    surfaceContainerHighest: Color.argb(
      _mdc.surfaceContainerHighest.getArgb(scheme),
    ),
    onSurface: Color.argb(_mdc.onSurface.getArgb(scheme)),
    surfaceVariant: Color.argb(_mdc.surfaceVariant.getArgb(scheme)),
    onSurfaceVariant: Color.argb(_mdc.onSurfaceVariant.getArgb(scheme)),
    outline: Color.argb(_mdc.outline.getArgb(scheme)),
    outlineVariant: Color.argb(_mdc.outlineVariant.getArgb(scheme)),
    inverseSurface: Color.argb(_mdc.inverseSurface.getArgb(scheme)),
    inverseOnSurface: Color.argb(_mdc.inverseOnSurface.getArgb(scheme)),
    shadow: Color.argb(_mdc.shadow.getArgb(scheme)),
    scrim: Color.argb(_mdc.scrim.getArgb(scheme)),
    surfaceTint: Color.argb(_mdc.surfaceTint.getArgb(scheme)),
    primary: Color.argb(_mdc.primary.getArgb(scheme)),
    primaryDim: Color.argb(_mdc.primaryDim.getArgb(scheme)),
    onPrimary: Color.argb(_mdc.onPrimary.getArgb(scheme)),
    primaryContainer: Color.argb(_mdc.primaryContainer.getArgb(scheme)),
    onPrimaryContainer: Color.argb(_mdc.onPrimaryContainer.getArgb(scheme)),
    primaryFixed: Color.argb(_mdc.primaryFixed.getArgb(scheme)),
    primaryFixedDim: Color.argb(_mdc.primaryFixedDim.getArgb(scheme)),
    onPrimaryFixed: Color.argb(_mdc.onPrimaryFixed.getArgb(scheme)),
    onPrimaryFixedVariant: Color.argb(
      _mdc.onPrimaryFixedVariant.getArgb(scheme),
    ),
    inversePrimary: Color.argb(_mdc.inversePrimary.getArgb(scheme)),
    secondary: Color.argb(_mdc.secondary.getArgb(scheme)),
    secondaryDim: Color.argb(_mdc.secondaryDim.getArgb(scheme)),
    onSecondary: Color.argb(_mdc.onSecondary.getArgb(scheme)),
    secondaryContainer: Color.argb(_mdc.secondaryContainer.getArgb(scheme)),
    onSecondaryContainer: Color.argb(_mdc.onSecondaryContainer.getArgb(scheme)),
    secondaryFixed: Color.argb(_mdc.secondaryFixed.getArgb(scheme)),
    secondaryFixedDim: Color.argb(_mdc.secondaryFixedDim.getArgb(scheme)),
    onSecondaryFixed: Color.argb(_mdc.onSecondaryFixed.getArgb(scheme)),
    onSecondaryFixedVariant: Color.argb(
      _mdc.onSecondaryFixedVariant.getArgb(scheme),
    ),
    tertiary: Color.argb(_mdc.tertiary.getArgb(scheme)),
    tertiaryDim: Color.argb(_mdc.tertiaryDim.getArgb(scheme)),
    onTertiary: Color.argb(_mdc.onTertiary.getArgb(scheme)),
    tertiaryContainer: Color.argb(_mdc.tertiaryContainer.getArgb(scheme)),
    onTertiaryContainer: Color.argb(_mdc.onTertiaryContainer.getArgb(scheme)),
    tertiaryFixed: Color.argb(_mdc.tertiaryFixed.getArgb(scheme)),
    tertiaryFixedDim: Color.argb(_mdc.tertiaryFixedDim.getArgb(scheme)),
    onTertiaryFixed: Color.argb(_mdc.onTertiaryFixed.getArgb(scheme)),
    onTertiaryFixedVariant: Color.argb(
      _mdc.onTertiaryFixedVariant.getArgb(scheme),
    ),
    error: Color.argb(_mdc.error.getArgb(scheme)),
    errorDim: Color.argb(_mdc.errorDim.getArgb(scheme)),
    onError: Color.argb(_mdc.onError.getArgb(scheme)),
    errorContainer: Color.argb(_mdc.errorContainer.getArgb(scheme)),
    onErrorContainer: Color.argb(_mdc.onErrorContainer.getArgb(scheme)),
    controlActivated: Color.argb(_mdc.controlActivated.getArgb(scheme)),
    controlNormal: Color.argb(_mdc.controlNormal.getArgb(scheme)),
    controlHighlight: Color.argb(_mdc.controlHighlight.getArgb(scheme)),
    textPrimaryInverse: Color.argb(_mdc.textPrimaryInverse.getArgb(scheme)),
    textSecondaryAndTertiaryInverse: Color.argb(
      _mdc.textSecondaryAndTertiaryInverse.getArgb(scheme),
    ),
    textPrimaryInverseDisableOnly: Color.argb(
      _mdc.textPrimaryInverseDisableOnly.getArgb(scheme),
    ),
    textSecondaryAndTertiaryInverseDisabled: Color.argb(
      _mdc.textSecondaryAndTertiaryInverseDisabled.getArgb(scheme),
    ),
    textHintInverse: Color.argb(_mdc.textHintInverse.getArgb(scheme)),
    widgetBackground: Color.argb(_adc.widgetBackground.getArgb(scheme)),
    clockHour: Color.argb(_adc.clockHour.getArgb(scheme)),
    clockMinute: Color.argb(_adc.clockMinute.getArgb(scheme)),
    clockSecond: Color.argb(_adc.clockSecond.getArgb(scheme)),
    weatherTemp: Color.argb(_adc.weatherTemp.getArgb(scheme)),
    themeApp: Color.argb(_adc.themeApp.getArgb(scheme)),
    onThemeApp: Color.argb(_adc.onThemeApp.getArgb(scheme)),
    themeAppRing: Color.argb(_adc.themeAppRing.getArgb(scheme)),
    themeNotif: Color.argb(_adc.themeNotif.getArgb(scheme)),
    brandA: Color.argb(_adc.brandA.getArgb(scheme)),
    brandB: Color.argb(_adc.brandB.getArgb(scheme)),
    brandC: Color.argb(_adc.brandC.getArgb(scheme)),
    brandD: Color.argb(_adc.brandD.getArgb(scheme)),
    underSurface: Color.argb(_adc.underSurface.getArgb(scheme)),
    shadeActive: Color.argb(_adc.shadeActive.getArgb(scheme)),
    onShadeActive: Color.argb(_adc.onShadeActive.getArgb(scheme)),
    onShadeActiveVariant: Color.argb(_adc.onShadeActiveVariant.getArgb(scheme)),
    shadeInactive: Color.argb(_adc.shadeInactive.getArgb(scheme)),
    onShadeInactive: Color.argb(_adc.onShadeInactive.getArgb(scheme)),
    onShadeInactiveVariant: Color.argb(
      _adc.onShadeInactiveVariant.getArgb(scheme),
    ),
    shadeDisabled: Color.argb(_adc.shadeDisabled.getArgb(scheme)),
    overviewBackground: Color.argb(_adc.overviewBackground.getArgb(scheme)),
  );

  factory FigmaScheme.fromJson(Map<String, Object?> json) =>
      _$FigmaSchemeFromJson(json);

  // ignore: prefer_const_constructors
  static final MaterialDynamicColors _mdc = MaterialDynamicColors();
  static final AndroidDynamicColors _adc = AndroidDynamicColors();
}

@freezed
abstract class FigmaPalettes with _$FigmaPalettes {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory FigmaPalettes({
    @JsonKey(includeIfNull: false) FigmaPalette? primary,
    @JsonKey(includeIfNull: false) FigmaPalette? secondary,
    @JsonKey(includeIfNull: false) FigmaPalette? tertiary,
    @JsonKey(includeIfNull: false) FigmaPalette? neutral,
    @JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,
    @JsonKey(includeIfNull: false) FigmaPalette? error,
  }) = _FigmaPalettes;

  factory FigmaPalettes.fromTonalPalettes({
    TonalPalette? primary,
    TonalPalette? secondary,
    TonalPalette? tertiary,
    TonalPalette? neutral,
    TonalPalette? neutralVariant,
    TonalPalette? error,
  }) {
    return FigmaPalettes(
      primary: primary != null ? FigmaPalette.fromTonalPalette(primary) : null,
      secondary: secondary != null
          ? FigmaPalette.fromTonalPalette(secondary)
          : null,
      tertiary: tertiary != null
          ? FigmaPalette.fromTonalPalette(tertiary)
          : null,
      neutral: neutral != null ? FigmaPalette.fromTonalPalette(neutral) : null,
      neutralVariant: neutralVariant != null
          ? FigmaPalette.fromTonalPalette(neutralVariant)
          : null,
      error: error != null ? FigmaPalette.fromTonalPalette(error) : null,
    );
  }

  factory FigmaPalettes.fromDynamicScheme(DynamicScheme scheme) {
    return FigmaPalettes.fromTonalPalettes(
      primary: scheme.primaryPalette,
      secondary: scheme.secondaryPalette,
      tertiary: scheme.tertiaryPalette,
      neutral: scheme.neutralPalette,
      neutralVariant: scheme.neutralVariantPalette,
      error: scheme.errorPalette,
    );
  }

  factory FigmaPalettes.fromJson(Map<String, Object?> json) =>
      _$FigmaPalettesFromJson(json);
}

@freezed
abstract class FigmaPalette with _$FigmaPalette {
  const FigmaPalette._();
  const factory FigmaPalette({
    @JsonKey(name: "0") @ColorConverter() required Color t0,
    @JsonKey(name: "5") @ColorConverter() required Color t5,
    @JsonKey(name: "10") @ColorConverter() required Color t10,
    @JsonKey(name: "15") @ColorConverter() required Color t15,
    @JsonKey(name: "20") @ColorConverter() required Color t20,
    @JsonKey(name: "25") @ColorConverter() required Color t25,
    @JsonKey(name: "30") @ColorConverter() required Color t30,
    @JsonKey(name: "35") @ColorConverter() required Color t35,
    @JsonKey(name: "40") @ColorConverter() required Color t40,
    @JsonKey(name: "50") @ColorConverter() required Color t50,
    @JsonKey(name: "60") @ColorConverter() required Color t60,
    @JsonKey(name: "70") @ColorConverter() required Color t70,
    @JsonKey(name: "80") @ColorConverter() required Color t80,
    @JsonKey(name: "90") @ColorConverter() required Color t90,
    @JsonKey(name: "95") @ColorConverter() required Color t95,
    @JsonKey(name: "98") @ColorConverter() required Color t98,
    @JsonKey(name: "99") @ColorConverter() required Color t99,
    @JsonKey(name: "100") @ColorConverter() required Color t100,
  }) = _FigmaPalette;

  factory FigmaPalette.fromTonalPalette(TonalPalette palette) {
    return FigmaPalette(
      t0: Color.argb(palette.getHct(0).toInt()),
      t5: Color.argb(palette.getHct(5).toInt()),
      t10: Color.argb(palette.getHct(10).toInt()),
      t15: Color.argb(palette.getHct(15).toInt()),
      t20: Color.argb(palette.getHct(20).toInt()),
      t25: Color.argb(palette.getHct(25).toInt()),
      t30: Color.argb(palette.getHct(30).toInt()),
      t35: Color.argb(palette.getHct(35).toInt()),
      t40: Color.argb(palette.getHct(40).toInt()),
      t50: Color.argb(palette.getHct(50).toInt()),
      t60: Color.argb(palette.getHct(60).toInt()),
      t70: Color.argb(palette.getHct(70).toInt()),
      t80: Color.argb(palette.getHct(80).toInt()),
      t90: Color.argb(palette.getHct(90).toInt()),
      t95: Color.argb(palette.getHct(95).toInt()),
      t98: Color.argb(palette.getHct(98).toInt()),
      t99: Color.argb(palette.getHct(99).toInt()),
      t100: Color.argb(palette.getHct(100).toInt()),
    );
  }

  factory FigmaPalette.fromJson(Map<String, Object?> json) =>
      _$FigmaPaletteFromJson(json);
}

@freezed
abstract class Template with _$Template {
  const factory Template({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? sourceColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
  }) = _Template;

  factory Template.fromJson(Map<String, Object?> json) =>
      _$TemplateFromJson(json);

  static const Template baseline = Template(
    sourceColor: Color.argb(0xFF6750A4),
  );
  static const Template nowInAndroid = Template(
    sourceColor: Color.argb(0xFF8C4190),
    primaryPaletteKeyColor: Color.argb(0xFF8C4190),
    secondaryPaletteKeyColor: Color.argb(0xFFFF8456),
    tertiaryPaletteKeyColor: Color.argb(0xFFB3E9FF),
    neutralPaletteKeyColor: Color.argb(0xFF201A1B),
  );
}
