import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libmonet/libmonet.dart';

part 'figma.freezed.dart';
part 'figma.g.dart';

class _ArgbHexConverter implements JsonConverter<int, String> {
  const _ArgbHexConverter();

  @override
  int fromJson(String json) {
    final result = _tryParse(json);
    assert(result != null);
    return result!;
  }

  @override
  String toJson(int object) => StringUtils.hexFromArgb(object);

  static int _argbFromComponents(int alpha, int red, int green, int blue) =>
      ((alpha & 255) << 24) |
      ((red & 255) << 16) |
      ((green & 255) << 8) |
      (blue & 255);

  static int? _parseSingleDigit(String digit) {
    final result = int.tryParse(digit, radix: 16);
    if (result == null) return null;
    return (result << 4) | result;
  }

  static int? _parseHex(String source) {
    final n = source.length;

    if (n == 3 || n == 4) {
      final r = _parseSingleDigit(source[0]);
      final g = _parseSingleDigit(source[1]);
      final b = _parseSingleDigit(source[2]);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 4 ? _parseSingleDigit(source[3]) : null;
      return _argbFromComponents(a ?? 255, r, g, b);
    } else if (n == 6 || n == 8) {
      final r = int.tryParse(source.substring(0, 2), radix: 16);
      final g = int.tryParse(source.substring(2, 4), radix: 16);
      final b = int.tryParse(source.substring(4, 6), radix: 16);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 8
          ? int.tryParse(source.substring(6, 8), radix: 16)
          : null;
      return _argbFromComponents(a ?? 255, r, g, b);
    }
    return null;
  }

  static int? _tryParse(String source) {
    // source = source.trim().replaceAll(r"\s", "");
    source = source.trim().toLowerCase();

    if (source == "transparent") {
      return 0x00000000;
    }

    // Hex format
    if (source.startsWith("#")) {
      final hex = source.substring(1);
      return _parseHex(hex);
    }

    // TODO(deminearchiver): add rgb / rgba formats here
    final i = source.indexOf("(");
    if (i != -1 && source.endsWith(")")) {
      final fname = source.substring(0, i).trimRight();
      source = source
          .substring(i + 1)
          .replaceAll(",", " ")
          .replaceAll("/", " ");
      final params = source.split(RegExp(r"\s+"));
      final pLen = params.length;

      switch (fname) {
        case "rgb" || "rgba":
          if (pLen != 3 && pLen != 4) {
            return null;
          }
        // final r = _parsePercentOr255(params[0]);
        // final g = _parsePercentOr255(params[1]);
        // final b = _parsePercentOr255(params[2]);
        // final a = pLen == 4 ? _parsePercentOrFloat(params[3]) : (1.0, true);
        // if ((r, g, b, a) case (
        //   (final r, final rFormat)?,
        //   (final g, final gFormat)?,
        //   (final b, final bFormat)?,
        //   (final a, _)?,
        // )) {
        //   if (rFormat == gFormat && gFormat == bFormat) {
        //     // return Color.rgba(r, g, b);
        //   }
        // }
        default:
          return null;
      }
    }

    // Hex format without prefix "#"
    return _parseHex(source);
  }
}

@freezed
abstract class Theme with _$Theme {
  const Theme._();

  const factory Theme({
    @Default("") String description,
    @_ArgbHexConverter() required int seed,
    required CoreColors coreColors,
    @Default([]) List<ExtendedColor> extendedColors,
    required Schemes schemes,
    // required FigmaPalettes palettes,
  }) = _Theme;

  factory Theme.fromJson(Map<String, Object?> json) => _$ThemeFromJson(json);
}

@freezed
abstract class CoreColors with _$CoreColors {
  const CoreColors._();

  const factory CoreColors({
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutral,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutralVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
  }) = _CoreColors;

  factory CoreColors.fromJson(Map<String, Object?> json) =>
      _$CoreColorsFromJson(json);
}

@freezed
abstract class ExtendedColor with _$ExtendedColor {
  const ExtendedColor._();

  const factory ExtendedColor({
    required String name,
    @_ArgbHexConverter() required int color,
    @Default("") String description,
    @Default(false) bool harmonized,
  }) = _ExtendedColor;

  factory ExtendedColor.fromJson(Map<String, Object?> json) =>
      _$ExtendedColorFromJson(json);
}

@freezed
abstract class Schemes with _$Schemes {
  const Schemes._();

  const factory Schemes({
    required Scheme light,
    required Scheme lightMediumContrast,
    required Scheme lightHighContrast,
    required Scheme dark,
    required Scheme darkMediumContrast,
    required Scheme darkHighContrast,
  }) = _Schemes;

  factory Schemes.fromDynamicSchemes({
    required DynamicScheme light,
    required DynamicScheme lightMediumContrast,
    required DynamicScheme lightHighContrast,
    required DynamicScheme dark,
    required DynamicScheme darkMediumContrast,
    required DynamicScheme darkHighContrast,
  }) => Schemes(
    light: Scheme.fromDynamicScheme(light),
    lightMediumContrast: Scheme.fromDynamicScheme(lightMediumContrast),
    lightHighContrast: Scheme.fromDynamicScheme(lightHighContrast),
    dark: Scheme.fromDynamicScheme(dark),
    darkMediumContrast: Scheme.fromDynamicScheme(darkMediumContrast),
    darkHighContrast: Scheme.fromDynamicScheme(darkHighContrast),
  );

  factory Schemes.fromJson(Map<String, Object?> json) =>
      _$SchemesFromJson(json);
}

@freezed
abstract class Scheme with _$Scheme {
  const Scheme._();

  const factory Scheme({
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? background,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceBright,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLowest,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outline,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outlineVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseOnSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? scrim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceTint,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inversePrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onError,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onErrorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlActivated,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlNormal,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlHighlight,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textHintInverse,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? widgetBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockHour,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockMinute,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockSecond,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? weatherTemp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onThemeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeAppRing,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeNotif,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandA,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandB,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandC,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandD,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? underSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeActive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeActive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeInactive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? overviewBackground,
  }) = _Scheme;

  factory Scheme.fromDynamicScheme(DynamicScheme scheme) => .new(
    primaryPaletteKeyColor: _mdc.primaryPaletteKeyColor.getArgb(scheme),
    secondaryPaletteKeyColor: _mdc.secondaryPaletteKeyColor.getArgb(scheme),
    tertiaryPaletteKeyColor: _mdc.tertiaryPaletteKeyColor.getArgb(scheme),
    neutralPaletteKeyColor: _mdc.neutralPaletteKeyColor.getArgb(scheme),
    neutralVariantPaletteKeyColor: _mdc.neutralVariantPaletteKeyColor.getArgb(
      scheme,
    ),
    errorPaletteKeyColor: _mdc.errorPaletteKeyColor.getArgb(scheme),
    background: _mdc.background.getArgb(scheme),
    onBackground: _mdc.onBackground.getArgb(scheme),
    surface: _mdc.surface.getArgb(scheme),
    surfaceDim: _mdc.surfaceDim.getArgb(scheme),
    surfaceBright: _mdc.surfaceBright.getArgb(scheme),
    surfaceContainerLowest: _mdc.surfaceContainerLowest.getArgb(scheme),
    surfaceContainerLow: _mdc.surfaceContainerLow.getArgb(scheme),
    surfaceContainer: _mdc.surfaceContainer.getArgb(scheme),
    surfaceContainerHigh: _mdc.surfaceContainerHigh.getArgb(scheme),
    surfaceContainerHighest: _mdc.surfaceContainerHighest.getArgb(scheme),
    onSurface: _mdc.onSurface.getArgb(scheme),
    surfaceVariant: _mdc.surfaceVariant.getArgb(scheme),
    onSurfaceVariant: _mdc.onSurfaceVariant.getArgb(scheme),
    outline: _mdc.outline.getArgb(scheme),
    outlineVariant: _mdc.outlineVariant.getArgb(scheme),
    inverseSurface: _mdc.inverseSurface.getArgb(scheme),
    inverseOnSurface: _mdc.inverseOnSurface.getArgb(scheme),
    shadow: _mdc.shadow.getArgb(scheme),
    scrim: _mdc.scrim.getArgb(scheme),
    surfaceTint: _mdc.surfaceTint.getArgb(scheme),
    primary: _mdc.primary.getArgb(scheme),
    primaryDim: _mdc.primaryDim.getArgb(scheme),
    onPrimary: _mdc.onPrimary.getArgb(scheme),
    primaryContainer: _mdc.primaryContainer.getArgb(scheme),
    onPrimaryContainer: _mdc.onPrimaryContainer.getArgb(scheme),
    primaryFixed: _mdc.primaryFixed.getArgb(scheme),
    primaryFixedDim: _mdc.primaryFixedDim.getArgb(scheme),
    onPrimaryFixed: _mdc.onPrimaryFixed.getArgb(scheme),
    onPrimaryFixedVariant: _mdc.onPrimaryFixedVariant.getArgb(scheme),
    inversePrimary: _mdc.inversePrimary.getArgb(scheme),
    secondary: _mdc.secondary.getArgb(scheme),
    secondaryDim: _mdc.secondaryDim.getArgb(scheme),
    onSecondary: _mdc.onSecondary.getArgb(scheme),
    secondaryContainer: _mdc.secondaryContainer.getArgb(scheme),
    onSecondaryContainer: _mdc.onSecondaryContainer.getArgb(scheme),
    secondaryFixed: _mdc.secondaryFixed.getArgb(scheme),
    secondaryFixedDim: _mdc.secondaryFixedDim.getArgb(scheme),
    onSecondaryFixed: _mdc.onSecondaryFixed.getArgb(scheme),
    onSecondaryFixedVariant: _mdc.onSecondaryFixedVariant.getArgb(scheme),
    tertiary: _mdc.tertiary.getArgb(scheme),
    tertiaryDim: _mdc.tertiaryDim.getArgb(scheme),
    onTertiary: _mdc.onTertiary.getArgb(scheme),
    tertiaryContainer: _mdc.tertiaryContainer.getArgb(scheme),
    onTertiaryContainer: _mdc.onTertiaryContainer.getArgb(scheme),
    tertiaryFixed: _mdc.tertiaryFixed.getArgb(scheme),
    tertiaryFixedDim: _mdc.tertiaryFixedDim.getArgb(scheme),
    onTertiaryFixed: _mdc.onTertiaryFixed.getArgb(scheme),
    onTertiaryFixedVariant: _mdc.onTertiaryFixedVariant.getArgb(scheme),
    error: _mdc.error.getArgb(scheme),
    errorDim: _mdc.errorDim.getArgb(scheme),
    onError: _mdc.onError.getArgb(scheme),
    errorContainer: _mdc.errorContainer.getArgb(scheme),
    onErrorContainer: _mdc.onErrorContainer.getArgb(scheme),
    controlActivated: _mdc.controlActivated.getArgb(scheme),
    controlNormal: _mdc.controlNormal.getArgb(scheme),
    controlHighlight: _mdc.controlHighlight.getArgb(scheme),
    textPrimaryInverse: _mdc.textPrimaryInverse.getArgb(scheme),
    textSecondaryAndTertiaryInverse: _mdc.textSecondaryAndTertiaryInverse
        .getArgb(scheme),
    textPrimaryInverseDisableOnly: _mdc.textPrimaryInverseDisableOnly.getArgb(
      scheme,
    ),
    textSecondaryAndTertiaryInverseDisabled: _mdc
        .textSecondaryAndTertiaryInverseDisabled
        .getArgb(scheme),
    textHintInverse: _mdc.textHintInverse.getArgb(scheme),
    widgetBackground: _adc.widgetBackground.getArgb(scheme),
    clockHour: _adc.clockHour.getArgb(scheme),
    clockMinute: _adc.clockMinute.getArgb(scheme),
    clockSecond: _adc.clockSecond.getArgb(scheme),
    weatherTemp: _adc.weatherTemp.getArgb(scheme),
    themeApp: _adc.themeApp.getArgb(scheme),
    onThemeApp: _adc.onThemeApp.getArgb(scheme),
    themeAppRing: _adc.themeAppRing.getArgb(scheme),
    themeNotif: _adc.themeNotif.getArgb(scheme),
    brandA: _adc.brandA.getArgb(scheme),
    brandB: _adc.brandB.getArgb(scheme),
    brandC: _adc.brandC.getArgb(scheme),
    brandD: _adc.brandD.getArgb(scheme),
    underSurface: _adc.underSurface.getArgb(scheme),
    shadeActive: _adc.shadeActive.getArgb(scheme),
    onShadeActive: _adc.onShadeActive.getArgb(scheme),
    onShadeActiveVariant: _adc.onShadeActiveVariant.getArgb(scheme),
    shadeInactive: _adc.shadeInactive.getArgb(scheme),
    onShadeInactive: _adc.onShadeInactive.getArgb(scheme),
    onShadeInactiveVariant: _adc.onShadeInactiveVariant.getArgb(scheme),
    shadeDisabled: _adc.shadeDisabled.getArgb(scheme),
    overviewBackground: _adc.overviewBackground.getArgb(scheme),
  );

  factory Scheme.fromJson(Map<String, Object?> json) => _$SchemeFromJson(json);

  static final _mdc = MaterialDynamicColors();
  static final _adc = AndroidDynamicColors();
}
