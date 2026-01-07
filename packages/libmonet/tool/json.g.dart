// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Figma _$FigmaFromJson(Map<String, dynamic> json) => _Figma(
  description: json['description'] as String? ?? "",
  seed: const ColorConverter().fromJson(json['seed'] as String),
  coreColors: FigmaCoreColors.fromJson(
    json['coreColors'] as Map<String, dynamic>,
  ),
  extendedColors:
      (json['extendedColors'] as List<dynamic>?)
          ?.map((e) => FigmaExtendedColor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  schemes: FigmaSchemes.fromJson(json['schemes'] as Map<String, dynamic>),
  palettes: FigmaPalettes.fromJson(json['palettes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FigmaToJson(_Figma instance) => <String, dynamic>{
  'description': instance.description,
  'seed': const ColorConverter().toJson(instance.seed),
  'coreColors': instance.coreColors,
  'extendedColors': instance.extendedColors,
  'schemes': instance.schemes,
  'palettes': instance.palettes,
};

_FigmaCoreColors _$FigmaCoreColorsFromJson(Map<String, dynamic> json) =>
    _FigmaCoreColors(
      primary: _$JsonConverterFromJson<String, Color>(
        json['primary'],
        const ColorConverter().fromJson,
      ),
      secondary: _$JsonConverterFromJson<String, Color>(
        json['secondary'],
        const ColorConverter().fromJson,
      ),
      tertiary: _$JsonConverterFromJson<String, Color>(
        json['tertiary'],
        const ColorConverter().fromJson,
      ),
      neutral: _$JsonConverterFromJson<String, Color>(
        json['neutral'],
        const ColorConverter().fromJson,
      ),
      neutralVariant: _$JsonConverterFromJson<String, Color>(
        json['neutralVariant'],
        const ColorConverter().fromJson,
      ),
      error: _$JsonConverterFromJson<String, Color>(
        json['error'],
        const ColorConverter().fromJson,
      ),
    );

Map<String, dynamic> _$FigmaCoreColorsToJson(_FigmaCoreColors instance) =>
    <String, dynamic>{
      'primary': ?_$JsonConverterToJson<String, Color>(
        instance.primary,
        const ColorConverter().toJson,
      ),
      'secondary': ?_$JsonConverterToJson<String, Color>(
        instance.secondary,
        const ColorConverter().toJson,
      ),
      'tertiary': ?_$JsonConverterToJson<String, Color>(
        instance.tertiary,
        const ColorConverter().toJson,
      ),
      'neutral': ?_$JsonConverterToJson<String, Color>(
        instance.neutral,
        const ColorConverter().toJson,
      ),
      'neutralVariant': ?_$JsonConverterToJson<String, Color>(
        instance.neutralVariant,
        const ColorConverter().toJson,
      ),
      'error': ?_$JsonConverterToJson<String, Color>(
        instance.error,
        const ColorConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_FigmaExtendedColor _$FigmaExtendedColorFromJson(Map<String, dynamic> json) =>
    _FigmaExtendedColor(
      name: json['name'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
      description: json['description'] as String? ?? "",
      harmonized: json['harmonized'] as bool? ?? false,
    );

Map<String, dynamic> _$FigmaExtendedColorToJson(_FigmaExtendedColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'description': instance.description,
      'harmonized': instance.harmonized,
    };

_FigmaSchemes _$FigmaSchemesFromJson(Map<String, dynamic> json) =>
    _FigmaSchemes(
      light: FigmaScheme.fromJson(json['light'] as Map<String, dynamic>),
      lightMediumContrast: FigmaScheme.fromJson(
        json['light-medium-contrast'] as Map<String, dynamic>,
      ),
      lightHighContrast: FigmaScheme.fromJson(
        json['light-high-contrast'] as Map<String, dynamic>,
      ),
      dark: FigmaScheme.fromJson(json['dark'] as Map<String, dynamic>),
      darkMediumContrast: FigmaScheme.fromJson(
        json['dark-medium-contrast'] as Map<String, dynamic>,
      ),
      darkHighContrast: FigmaScheme.fromJson(
        json['dark-high-contrast'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FigmaSchemesToJson(_FigmaSchemes instance) =>
    <String, dynamic>{
      'light': instance.light,
      'light-medium-contrast': instance.lightMediumContrast,
      'light-high-contrast': instance.lightHighContrast,
      'dark': instance.dark,
      'dark-medium-contrast': instance.darkMediumContrast,
      'dark-high-contrast': instance.darkHighContrast,
    };

_FigmaScheme _$FigmaSchemeFromJson(Map<String, dynamic> json) => _FigmaScheme(
  primaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['primaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  secondaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['secondaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  tertiaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['tertiaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralVariantPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralVariantPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  errorPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['errorPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  background: _$JsonConverterFromJson<String, Color>(
    json['background'],
    const ColorConverter().fromJson,
  ),
  onBackground: _$JsonConverterFromJson<String, Color>(
    json['onBackground'],
    const ColorConverter().fromJson,
  ),
  surface: _$JsonConverterFromJson<String, Color>(
    json['surface'],
    const ColorConverter().fromJson,
  ),
  surfaceDim: _$JsonConverterFromJson<String, Color>(
    json['surfaceDim'],
    const ColorConverter().fromJson,
  ),
  surfaceBright: _$JsonConverterFromJson<String, Color>(
    json['surfaceBright'],
    const ColorConverter().fromJson,
  ),
  surfaceContainerLowest: _$JsonConverterFromJson<String, Color>(
    json['surfaceContainerLowest'],
    const ColorConverter().fromJson,
  ),
  surfaceContainerLow: _$JsonConverterFromJson<String, Color>(
    json['surfaceContainerLow'],
    const ColorConverter().fromJson,
  ),
  surfaceContainer: _$JsonConverterFromJson<String, Color>(
    json['surfaceContainer'],
    const ColorConverter().fromJson,
  ),
  surfaceContainerHigh: _$JsonConverterFromJson<String, Color>(
    json['surfaceContainerHigh'],
    const ColorConverter().fromJson,
  ),
  surfaceContainerHighest: _$JsonConverterFromJson<String, Color>(
    json['surfaceContainerHighest'],
    const ColorConverter().fromJson,
  ),
  onSurface: _$JsonConverterFromJson<String, Color>(
    json['onSurface'],
    const ColorConverter().fromJson,
  ),
  surfaceVariant: _$JsonConverterFromJson<String, Color>(
    json['surfaceVariant'],
    const ColorConverter().fromJson,
  ),
  onSurfaceVariant: _$JsonConverterFromJson<String, Color>(
    json['onSurfaceVariant'],
    const ColorConverter().fromJson,
  ),
  outline: _$JsonConverterFromJson<String, Color>(
    json['outline'],
    const ColorConverter().fromJson,
  ),
  outlineVariant: _$JsonConverterFromJson<String, Color>(
    json['outlineVariant'],
    const ColorConverter().fromJson,
  ),
  inverseSurface: _$JsonConverterFromJson<String, Color>(
    json['inverseSurface'],
    const ColorConverter().fromJson,
  ),
  inverseOnSurface: _$JsonConverterFromJson<String, Color>(
    json['inverseOnSurface'],
    const ColorConverter().fromJson,
  ),
  shadow: _$JsonConverterFromJson<String, Color>(
    json['shadow'],
    const ColorConverter().fromJson,
  ),
  scrim: _$JsonConverterFromJson<String, Color>(
    json['scrim'],
    const ColorConverter().fromJson,
  ),
  surfaceTint: _$JsonConverterFromJson<String, Color>(
    json['surfaceTint'],
    const ColorConverter().fromJson,
  ),
  primary: _$JsonConverterFromJson<String, Color>(
    json['primary'],
    const ColorConverter().fromJson,
  ),
  primaryDim: _$JsonConverterFromJson<String, Color>(
    json['primaryDim'],
    const ColorConverter().fromJson,
  ),
  onPrimary: _$JsonConverterFromJson<String, Color>(
    json['onPrimary'],
    const ColorConverter().fromJson,
  ),
  primaryContainer: _$JsonConverterFromJson<String, Color>(
    json['primaryContainer'],
    const ColorConverter().fromJson,
  ),
  onPrimaryContainer: _$JsonConverterFromJson<String, Color>(
    json['onPrimaryContainer'],
    const ColorConverter().fromJson,
  ),
  primaryFixed: _$JsonConverterFromJson<String, Color>(
    json['primaryFixed'],
    const ColorConverter().fromJson,
  ),
  primaryFixedDim: _$JsonConverterFromJson<String, Color>(
    json['primaryFixedDim'],
    const ColorConverter().fromJson,
  ),
  onPrimaryFixed: _$JsonConverterFromJson<String, Color>(
    json['onPrimaryFixed'],
    const ColorConverter().fromJson,
  ),
  onPrimaryFixedVariant: _$JsonConverterFromJson<String, Color>(
    json['onPrimaryFixedVariant'],
    const ColorConverter().fromJson,
  ),
  inversePrimary: _$JsonConverterFromJson<String, Color>(
    json['inversePrimary'],
    const ColorConverter().fromJson,
  ),
  secondary: _$JsonConverterFromJson<String, Color>(
    json['secondary'],
    const ColorConverter().fromJson,
  ),
  secondaryDim: _$JsonConverterFromJson<String, Color>(
    json['secondaryDim'],
    const ColorConverter().fromJson,
  ),
  onSecondary: _$JsonConverterFromJson<String, Color>(
    json['onSecondary'],
    const ColorConverter().fromJson,
  ),
  secondaryContainer: _$JsonConverterFromJson<String, Color>(
    json['secondaryContainer'],
    const ColorConverter().fromJson,
  ),
  onSecondaryContainer: _$JsonConverterFromJson<String, Color>(
    json['onSecondaryContainer'],
    const ColorConverter().fromJson,
  ),
  secondaryFixed: _$JsonConverterFromJson<String, Color>(
    json['secondaryFixed'],
    const ColorConverter().fromJson,
  ),
  secondaryFixedDim: _$JsonConverterFromJson<String, Color>(
    json['secondaryFixedDim'],
    const ColorConverter().fromJson,
  ),
  onSecondaryFixed: _$JsonConverterFromJson<String, Color>(
    json['onSecondaryFixed'],
    const ColorConverter().fromJson,
  ),
  onSecondaryFixedVariant: _$JsonConverterFromJson<String, Color>(
    json['onSecondaryFixedVariant'],
    const ColorConverter().fromJson,
  ),
  tertiary: _$JsonConverterFromJson<String, Color>(
    json['tertiary'],
    const ColorConverter().fromJson,
  ),
  tertiaryDim: _$JsonConverterFromJson<String, Color>(
    json['tertiaryDim'],
    const ColorConverter().fromJson,
  ),
  onTertiary: _$JsonConverterFromJson<String, Color>(
    json['onTertiary'],
    const ColorConverter().fromJson,
  ),
  tertiaryContainer: _$JsonConverterFromJson<String, Color>(
    json['tertiaryContainer'],
    const ColorConverter().fromJson,
  ),
  onTertiaryContainer: _$JsonConverterFromJson<String, Color>(
    json['onTertiaryContainer'],
    const ColorConverter().fromJson,
  ),
  tertiaryFixed: _$JsonConverterFromJson<String, Color>(
    json['tertiaryFixed'],
    const ColorConverter().fromJson,
  ),
  tertiaryFixedDim: _$JsonConverterFromJson<String, Color>(
    json['tertiaryFixedDim'],
    const ColorConverter().fromJson,
  ),
  onTertiaryFixed: _$JsonConverterFromJson<String, Color>(
    json['onTertiaryFixed'],
    const ColorConverter().fromJson,
  ),
  onTertiaryFixedVariant: _$JsonConverterFromJson<String, Color>(
    json['onTertiaryFixedVariant'],
    const ColorConverter().fromJson,
  ),
  error: _$JsonConverterFromJson<String, Color>(
    json['error'],
    const ColorConverter().fromJson,
  ),
  errorDim: _$JsonConverterFromJson<String, Color>(
    json['errorDim'],
    const ColorConverter().fromJson,
  ),
  onError: _$JsonConverterFromJson<String, Color>(
    json['onError'],
    const ColorConverter().fromJson,
  ),
  errorContainer: _$JsonConverterFromJson<String, Color>(
    json['errorContainer'],
    const ColorConverter().fromJson,
  ),
  onErrorContainer: _$JsonConverterFromJson<String, Color>(
    json['onErrorContainer'],
    const ColorConverter().fromJson,
  ),
  controlActivated: _$JsonConverterFromJson<String, Color>(
    json['controlActivated'],
    const ColorConverter().fromJson,
  ),
  controlNormal: _$JsonConverterFromJson<String, Color>(
    json['controlNormal'],
    const ColorConverter().fromJson,
  ),
  controlHighlight: _$JsonConverterFromJson<String, Color>(
    json['controlHighlight'],
    const ColorConverter().fromJson,
  ),
  textPrimaryInverse: _$JsonConverterFromJson<String, Color>(
    json['textPrimaryInverse'],
    const ColorConverter().fromJson,
  ),
  textSecondaryAndTertiaryInverse: _$JsonConverterFromJson<String, Color>(
    json['textSecondaryAndTertiaryInverse'],
    const ColorConverter().fromJson,
  ),
  textPrimaryInverseDisableOnly: _$JsonConverterFromJson<String, Color>(
    json['textPrimaryInverseDisableOnly'],
    const ColorConverter().fromJson,
  ),
  textSecondaryAndTertiaryInverseDisabled:
      _$JsonConverterFromJson<String, Color>(
        json['textSecondaryAndTertiaryInverseDisabled'],
        const ColorConverter().fromJson,
      ),
  textHintInverse: _$JsonConverterFromJson<String, Color>(
    json['textHintInverse'],
    const ColorConverter().fromJson,
  ),
  widgetBackground: _$JsonConverterFromJson<String, Color>(
    json['widgetBackground'],
    const ColorConverter().fromJson,
  ),
  clockHour: _$JsonConverterFromJson<String, Color>(
    json['clockHour'],
    const ColorConverter().fromJson,
  ),
  clockMinute: _$JsonConverterFromJson<String, Color>(
    json['clockMinute'],
    const ColorConverter().fromJson,
  ),
  clockSecond: _$JsonConverterFromJson<String, Color>(
    json['clockSecond'],
    const ColorConverter().fromJson,
  ),
  weatherTemp: _$JsonConverterFromJson<String, Color>(
    json['weatherTemp'],
    const ColorConverter().fromJson,
  ),
  themeApp: _$JsonConverterFromJson<String, Color>(
    json['themeApp'],
    const ColorConverter().fromJson,
  ),
  onThemeApp: _$JsonConverterFromJson<String, Color>(
    json['onThemeApp'],
    const ColorConverter().fromJson,
  ),
  themeAppRing: _$JsonConverterFromJson<String, Color>(
    json['themeAppRing'],
    const ColorConverter().fromJson,
  ),
  themeNotif: _$JsonConverterFromJson<String, Color>(
    json['themeNotif'],
    const ColorConverter().fromJson,
  ),
  brandA: _$JsonConverterFromJson<String, Color>(
    json['brandA'],
    const ColorConverter().fromJson,
  ),
  brandB: _$JsonConverterFromJson<String, Color>(
    json['brandB'],
    const ColorConverter().fromJson,
  ),
  brandC: _$JsonConverterFromJson<String, Color>(
    json['brandC'],
    const ColorConverter().fromJson,
  ),
  brandD: _$JsonConverterFromJson<String, Color>(
    json['brandD'],
    const ColorConverter().fromJson,
  ),
  underSurface: _$JsonConverterFromJson<String, Color>(
    json['underSurface'],
    const ColorConverter().fromJson,
  ),
  shadeActive: _$JsonConverterFromJson<String, Color>(
    json['shadeActive'],
    const ColorConverter().fromJson,
  ),
  onShadeActive: _$JsonConverterFromJson<String, Color>(
    json['onShadeActive'],
    const ColorConverter().fromJson,
  ),
  onShadeActiveVariant: _$JsonConverterFromJson<String, Color>(
    json['onShadeActiveVariant'],
    const ColorConverter().fromJson,
  ),
  shadeInactive: _$JsonConverterFromJson<String, Color>(
    json['shadeInactive'],
    const ColorConverter().fromJson,
  ),
  onShadeInactive: _$JsonConverterFromJson<String, Color>(
    json['onShadeInactive'],
    const ColorConverter().fromJson,
  ),
  onShadeInactiveVariant: _$JsonConverterFromJson<String, Color>(
    json['onShadeInactiveVariant'],
    const ColorConverter().fromJson,
  ),
  shadeDisabled: _$JsonConverterFromJson<String, Color>(
    json['shadeDisabled'],
    const ColorConverter().fromJson,
  ),
  overviewBackground: _$JsonConverterFromJson<String, Color>(
    json['overviewBackground'],
    const ColorConverter().fromJson,
  ),
);

Map<String, dynamic> _$FigmaSchemeToJson(_FigmaScheme instance) =>
    <String, dynamic>{
      'primaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.primaryPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'secondaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.secondaryPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'tertiaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.tertiaryPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'neutralPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.neutralPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'neutralVariantPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.neutralVariantPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'errorPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
        instance.errorPaletteKeyColor,
        const ColorConverter().toJson,
      ),
      'background': ?_$JsonConverterToJson<String, Color>(
        instance.background,
        const ColorConverter().toJson,
      ),
      'onBackground': ?_$JsonConverterToJson<String, Color>(
        instance.onBackground,
        const ColorConverter().toJson,
      ),
      'surface': ?_$JsonConverterToJson<String, Color>(
        instance.surface,
        const ColorConverter().toJson,
      ),
      'surfaceDim': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceDim,
        const ColorConverter().toJson,
      ),
      'surfaceBright': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceBright,
        const ColorConverter().toJson,
      ),
      'surfaceContainerLowest': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceContainerLowest,
        const ColorConverter().toJson,
      ),
      'surfaceContainerLow': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceContainerLow,
        const ColorConverter().toJson,
      ),
      'surfaceContainer': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceContainer,
        const ColorConverter().toJson,
      ),
      'surfaceContainerHigh': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceContainerHigh,
        const ColorConverter().toJson,
      ),
      'surfaceContainerHighest': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceContainerHighest,
        const ColorConverter().toJson,
      ),
      'onSurface': ?_$JsonConverterToJson<String, Color>(
        instance.onSurface,
        const ColorConverter().toJson,
      ),
      'surfaceVariant': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceVariant,
        const ColorConverter().toJson,
      ),
      'onSurfaceVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onSurfaceVariant,
        const ColorConverter().toJson,
      ),
      'outline': ?_$JsonConverterToJson<String, Color>(
        instance.outline,
        const ColorConverter().toJson,
      ),
      'outlineVariant': ?_$JsonConverterToJson<String, Color>(
        instance.outlineVariant,
        const ColorConverter().toJson,
      ),
      'inverseSurface': ?_$JsonConverterToJson<String, Color>(
        instance.inverseSurface,
        const ColorConverter().toJson,
      ),
      'inverseOnSurface': ?_$JsonConverterToJson<String, Color>(
        instance.inverseOnSurface,
        const ColorConverter().toJson,
      ),
      'shadow': ?_$JsonConverterToJson<String, Color>(
        instance.shadow,
        const ColorConverter().toJson,
      ),
      'scrim': ?_$JsonConverterToJson<String, Color>(
        instance.scrim,
        const ColorConverter().toJson,
      ),
      'surfaceTint': ?_$JsonConverterToJson<String, Color>(
        instance.surfaceTint,
        const ColorConverter().toJson,
      ),
      'primary': ?_$JsonConverterToJson<String, Color>(
        instance.primary,
        const ColorConverter().toJson,
      ),
      'primaryDim': ?_$JsonConverterToJson<String, Color>(
        instance.primaryDim,
        const ColorConverter().toJson,
      ),
      'onPrimary': ?_$JsonConverterToJson<String, Color>(
        instance.onPrimary,
        const ColorConverter().toJson,
      ),
      'primaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.primaryContainer,
        const ColorConverter().toJson,
      ),
      'onPrimaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.onPrimaryContainer,
        const ColorConverter().toJson,
      ),
      'primaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.primaryFixed,
        const ColorConverter().toJson,
      ),
      'primaryFixedDim': ?_$JsonConverterToJson<String, Color>(
        instance.primaryFixedDim,
        const ColorConverter().toJson,
      ),
      'onPrimaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.onPrimaryFixed,
        const ColorConverter().toJson,
      ),
      'onPrimaryFixedVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onPrimaryFixedVariant,
        const ColorConverter().toJson,
      ),
      'inversePrimary': ?_$JsonConverterToJson<String, Color>(
        instance.inversePrimary,
        const ColorConverter().toJson,
      ),
      'secondary': ?_$JsonConverterToJson<String, Color>(
        instance.secondary,
        const ColorConverter().toJson,
      ),
      'secondaryDim': ?_$JsonConverterToJson<String, Color>(
        instance.secondaryDim,
        const ColorConverter().toJson,
      ),
      'onSecondary': ?_$JsonConverterToJson<String, Color>(
        instance.onSecondary,
        const ColorConverter().toJson,
      ),
      'secondaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.secondaryContainer,
        const ColorConverter().toJson,
      ),
      'onSecondaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.onSecondaryContainer,
        const ColorConverter().toJson,
      ),
      'secondaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.secondaryFixed,
        const ColorConverter().toJson,
      ),
      'secondaryFixedDim': ?_$JsonConverterToJson<String, Color>(
        instance.secondaryFixedDim,
        const ColorConverter().toJson,
      ),
      'onSecondaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.onSecondaryFixed,
        const ColorConverter().toJson,
      ),
      'onSecondaryFixedVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onSecondaryFixedVariant,
        const ColorConverter().toJson,
      ),
      'tertiary': ?_$JsonConverterToJson<String, Color>(
        instance.tertiary,
        const ColorConverter().toJson,
      ),
      'tertiaryDim': ?_$JsonConverterToJson<String, Color>(
        instance.tertiaryDim,
        const ColorConverter().toJson,
      ),
      'onTertiary': ?_$JsonConverterToJson<String, Color>(
        instance.onTertiary,
        const ColorConverter().toJson,
      ),
      'tertiaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.tertiaryContainer,
        const ColorConverter().toJson,
      ),
      'onTertiaryContainer': ?_$JsonConverterToJson<String, Color>(
        instance.onTertiaryContainer,
        const ColorConverter().toJson,
      ),
      'tertiaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.tertiaryFixed,
        const ColorConverter().toJson,
      ),
      'tertiaryFixedDim': ?_$JsonConverterToJson<String, Color>(
        instance.tertiaryFixedDim,
        const ColorConverter().toJson,
      ),
      'onTertiaryFixed': ?_$JsonConverterToJson<String, Color>(
        instance.onTertiaryFixed,
        const ColorConverter().toJson,
      ),
      'onTertiaryFixedVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onTertiaryFixedVariant,
        const ColorConverter().toJson,
      ),
      'error': ?_$JsonConverterToJson<String, Color>(
        instance.error,
        const ColorConverter().toJson,
      ),
      'errorDim': ?_$JsonConverterToJson<String, Color>(
        instance.errorDim,
        const ColorConverter().toJson,
      ),
      'onError': ?_$JsonConverterToJson<String, Color>(
        instance.onError,
        const ColorConverter().toJson,
      ),
      'errorContainer': ?_$JsonConverterToJson<String, Color>(
        instance.errorContainer,
        const ColorConverter().toJson,
      ),
      'onErrorContainer': ?_$JsonConverterToJson<String, Color>(
        instance.onErrorContainer,
        const ColorConverter().toJson,
      ),
      'controlActivated': ?_$JsonConverterToJson<String, Color>(
        instance.controlActivated,
        const ColorConverter().toJson,
      ),
      'controlNormal': ?_$JsonConverterToJson<String, Color>(
        instance.controlNormal,
        const ColorConverter().toJson,
      ),
      'controlHighlight': ?_$JsonConverterToJson<String, Color>(
        instance.controlHighlight,
        const ColorConverter().toJson,
      ),
      'textPrimaryInverse': ?_$JsonConverterToJson<String, Color>(
        instance.textPrimaryInverse,
        const ColorConverter().toJson,
      ),
      'textSecondaryAndTertiaryInverse': ?_$JsonConverterToJson<String, Color>(
        instance.textSecondaryAndTertiaryInverse,
        const ColorConverter().toJson,
      ),
      'textPrimaryInverseDisableOnly': ?_$JsonConverterToJson<String, Color>(
        instance.textPrimaryInverseDisableOnly,
        const ColorConverter().toJson,
      ),
      'textSecondaryAndTertiaryInverseDisabled':
          ?_$JsonConverterToJson<String, Color>(
            instance.textSecondaryAndTertiaryInverseDisabled,
            const ColorConverter().toJson,
          ),
      'textHintInverse': ?_$JsonConverterToJson<String, Color>(
        instance.textHintInverse,
        const ColorConverter().toJson,
      ),
      'widgetBackground': ?_$JsonConverterToJson<String, Color>(
        instance.widgetBackground,
        const ColorConverter().toJson,
      ),
      'clockHour': ?_$JsonConverterToJson<String, Color>(
        instance.clockHour,
        const ColorConverter().toJson,
      ),
      'clockMinute': ?_$JsonConverterToJson<String, Color>(
        instance.clockMinute,
        const ColorConverter().toJson,
      ),
      'clockSecond': ?_$JsonConverterToJson<String, Color>(
        instance.clockSecond,
        const ColorConverter().toJson,
      ),
      'weatherTemp': ?_$JsonConverterToJson<String, Color>(
        instance.weatherTemp,
        const ColorConverter().toJson,
      ),
      'themeApp': ?_$JsonConverterToJson<String, Color>(
        instance.themeApp,
        const ColorConverter().toJson,
      ),
      'onThemeApp': ?_$JsonConverterToJson<String, Color>(
        instance.onThemeApp,
        const ColorConverter().toJson,
      ),
      'themeAppRing': ?_$JsonConverterToJson<String, Color>(
        instance.themeAppRing,
        const ColorConverter().toJson,
      ),
      'themeNotif': ?_$JsonConverterToJson<String, Color>(
        instance.themeNotif,
        const ColorConverter().toJson,
      ),
      'brandA': ?_$JsonConverterToJson<String, Color>(
        instance.brandA,
        const ColorConverter().toJson,
      ),
      'brandB': ?_$JsonConverterToJson<String, Color>(
        instance.brandB,
        const ColorConverter().toJson,
      ),
      'brandC': ?_$JsonConverterToJson<String, Color>(
        instance.brandC,
        const ColorConverter().toJson,
      ),
      'brandD': ?_$JsonConverterToJson<String, Color>(
        instance.brandD,
        const ColorConverter().toJson,
      ),
      'underSurface': ?_$JsonConverterToJson<String, Color>(
        instance.underSurface,
        const ColorConverter().toJson,
      ),
      'shadeActive': ?_$JsonConverterToJson<String, Color>(
        instance.shadeActive,
        const ColorConverter().toJson,
      ),
      'onShadeActive': ?_$JsonConverterToJson<String, Color>(
        instance.onShadeActive,
        const ColorConverter().toJson,
      ),
      'onShadeActiveVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onShadeActiveVariant,
        const ColorConverter().toJson,
      ),
      'shadeInactive': ?_$JsonConverterToJson<String, Color>(
        instance.shadeInactive,
        const ColorConverter().toJson,
      ),
      'onShadeInactive': ?_$JsonConverterToJson<String, Color>(
        instance.onShadeInactive,
        const ColorConverter().toJson,
      ),
      'onShadeInactiveVariant': ?_$JsonConverterToJson<String, Color>(
        instance.onShadeInactiveVariant,
        const ColorConverter().toJson,
      ),
      'shadeDisabled': ?_$JsonConverterToJson<String, Color>(
        instance.shadeDisabled,
        const ColorConverter().toJson,
      ),
      'overviewBackground': ?_$JsonConverterToJson<String, Color>(
        instance.overviewBackground,
        const ColorConverter().toJson,
      ),
    };

_FigmaPalettes _$FigmaPalettesFromJson(Map<String, dynamic> json) =>
    _FigmaPalettes(
      primary: json['primary'] == null
          ? null
          : FigmaPalette.fromJson(json['primary'] as Map<String, dynamic>),
      secondary: json['secondary'] == null
          ? null
          : FigmaPalette.fromJson(json['secondary'] as Map<String, dynamic>),
      tertiary: json['tertiary'] == null
          ? null
          : FigmaPalette.fromJson(json['tertiary'] as Map<String, dynamic>),
      neutral: json['neutral'] == null
          ? null
          : FigmaPalette.fromJson(json['neutral'] as Map<String, dynamic>),
      neutralVariant: json['neutral-variant'] == null
          ? null
          : FigmaPalette.fromJson(
              json['neutral-variant'] as Map<String, dynamic>,
            ),
      error: json['error'] == null
          ? null
          : FigmaPalette.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FigmaPalettesToJson(_FigmaPalettes instance) =>
    <String, dynamic>{
      'primary': ?instance.primary,
      'secondary': ?instance.secondary,
      'tertiary': ?instance.tertiary,
      'neutral': ?instance.neutral,
      'neutral-variant': ?instance.neutralVariant,
      'error': ?instance.error,
    };

_FigmaPalette _$FigmaPaletteFromJson(Map<String, dynamic> json) =>
    _FigmaPalette(
      t0: const ColorConverter().fromJson(json['0'] as String),
      t5: const ColorConverter().fromJson(json['5'] as String),
      t10: const ColorConverter().fromJson(json['10'] as String),
      t15: const ColorConverter().fromJson(json['15'] as String),
      t20: const ColorConverter().fromJson(json['20'] as String),
      t25: const ColorConverter().fromJson(json['25'] as String),
      t30: const ColorConverter().fromJson(json['30'] as String),
      t35: const ColorConverter().fromJson(json['35'] as String),
      t40: const ColorConverter().fromJson(json['40'] as String),
      t50: const ColorConverter().fromJson(json['50'] as String),
      t60: const ColorConverter().fromJson(json['60'] as String),
      t70: const ColorConverter().fromJson(json['70'] as String),
      t80: const ColorConverter().fromJson(json['80'] as String),
      t90: const ColorConverter().fromJson(json['90'] as String),
      t95: const ColorConverter().fromJson(json['95'] as String),
      t98: const ColorConverter().fromJson(json['98'] as String),
      t99: const ColorConverter().fromJson(json['99'] as String),
      t100: const ColorConverter().fromJson(json['100'] as String),
    );

Map<String, dynamic> _$FigmaPaletteToJson(_FigmaPalette instance) =>
    <String, dynamic>{
      '0': const ColorConverter().toJson(instance.t0),
      '5': const ColorConverter().toJson(instance.t5),
      '10': const ColorConverter().toJson(instance.t10),
      '15': const ColorConverter().toJson(instance.t15),
      '20': const ColorConverter().toJson(instance.t20),
      '25': const ColorConverter().toJson(instance.t25),
      '30': const ColorConverter().toJson(instance.t30),
      '35': const ColorConverter().toJson(instance.t35),
      '40': const ColorConverter().toJson(instance.t40),
      '50': const ColorConverter().toJson(instance.t50),
      '60': const ColorConverter().toJson(instance.t60),
      '70': const ColorConverter().toJson(instance.t70),
      '80': const ColorConverter().toJson(instance.t80),
      '90': const ColorConverter().toJson(instance.t90),
      '95': const ColorConverter().toJson(instance.t95),
      '98': const ColorConverter().toJson(instance.t98),
      '99': const ColorConverter().toJson(instance.t99),
      '100': const ColorConverter().toJson(instance.t100),
    };

_Template _$TemplateFromJson(Map<String, dynamic> json) => _Template(
  sourceColor: _$JsonConverterFromJson<String, Color>(
    json['sourceColor'],
    const ColorConverter().fromJson,
  ),
  primaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['primaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  secondaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['secondaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  tertiaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['tertiaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralVariantPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralVariantPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  errorPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['errorPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
);

Map<String, dynamic> _$TemplateToJson(_Template instance) => <String, dynamic>{
  'sourceColor': ?_$JsonConverterToJson<String, Color>(
    instance.sourceColor,
    const ColorConverter().toJson,
  ),
  'primaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.primaryPaletteKeyColor,
    const ColorConverter().toJson,
  ),
  'secondaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.secondaryPaletteKeyColor,
    const ColorConverter().toJson,
  ),
  'tertiaryPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.tertiaryPaletteKeyColor,
    const ColorConverter().toJson,
  ),
  'neutralPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.neutralPaletteKeyColor,
    const ColorConverter().toJson,
  ),
  'neutralVariantPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.neutralVariantPaletteKeyColor,
    const ColorConverter().toJson,
  ),
  'errorPaletteKeyColor': ?_$JsonConverterToJson<String, Color>(
    instance.errorPaletteKeyColor,
    const ColorConverter().toJson,
  ),
};
