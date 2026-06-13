// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Theme _$ThemeFromJson(Map<String, dynamic> json) => _Theme(
  description: json['description'] as String? ?? "",
  seed: const _ArgbHexConverter().fromJson(json['seed'] as String),
  coreColors: CoreColors.fromJson(json['coreColors'] as Map<String, dynamic>),
  extendedColors:
      (json['extendedColors'] as List<dynamic>?)
          ?.map((e) => ExtendedColor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  schemes: Schemes.fromJson(json['schemes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ThemeToJson(_Theme instance) => <String, dynamic>{
  'description': instance.description,
  'seed': const _ArgbHexConverter().toJson(instance.seed),
  'coreColors': instance.coreColors,
  'extendedColors': instance.extendedColors,
  'schemes': instance.schemes,
};

_CoreColors _$CoreColorsFromJson(Map<String, dynamic> json) => _CoreColors(
  primary: _$JsonConverterFromJson<String, int>(
    json['primary'],
    const _ArgbHexConverter().fromJson,
  ),
  secondary: _$JsonConverterFromJson<String, int>(
    json['secondary'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiary: _$JsonConverterFromJson<String, int>(
    json['tertiary'],
    const _ArgbHexConverter().fromJson,
  ),
  neutral: _$JsonConverterFromJson<String, int>(
    json['neutral'],
    const _ArgbHexConverter().fromJson,
  ),
  neutralVariant: _$JsonConverterFromJson<String, int>(
    json['neutralVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  error: _$JsonConverterFromJson<String, int>(
    json['error'],
    const _ArgbHexConverter().fromJson,
  ),
);

Map<String, dynamic> _$CoreColorsToJson(_CoreColors instance) =>
    <String, dynamic>{
      'primary': ?_$JsonConverterToJson<String, int>(
        instance.primary,
        const _ArgbHexConverter().toJson,
      ),
      'secondary': ?_$JsonConverterToJson<String, int>(
        instance.secondary,
        const _ArgbHexConverter().toJson,
      ),
      'tertiary': ?_$JsonConverterToJson<String, int>(
        instance.tertiary,
        const _ArgbHexConverter().toJson,
      ),
      'neutral': ?_$JsonConverterToJson<String, int>(
        instance.neutral,
        const _ArgbHexConverter().toJson,
      ),
      'neutralVariant': ?_$JsonConverterToJson<String, int>(
        instance.neutralVariant,
        const _ArgbHexConverter().toJson,
      ),
      'error': ?_$JsonConverterToJson<String, int>(
        instance.error,
        const _ArgbHexConverter().toJson,
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

_ExtendedColor _$ExtendedColorFromJson(Map<String, dynamic> json) =>
    _ExtendedColor(
      name: json['name'] as String,
      color: const _ArgbHexConverter().fromJson(json['color'] as String),
      description: json['description'] as String? ?? "",
      harmonized: json['harmonized'] as bool? ?? false,
    );

Map<String, dynamic> _$ExtendedColorToJson(_ExtendedColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': const _ArgbHexConverter().toJson(instance.color),
      'description': instance.description,
      'harmonized': instance.harmonized,
    };

_Schemes _$SchemesFromJson(Map<String, dynamic> json) => _Schemes(
  light: Scheme.fromJson(json['light'] as Map<String, dynamic>),
  lightMediumContrast: Scheme.fromJson(
    json['lightMediumContrast'] as Map<String, dynamic>,
  ),
  lightHighContrast: Scheme.fromJson(
    json['lightHighContrast'] as Map<String, dynamic>,
  ),
  dark: Scheme.fromJson(json['dark'] as Map<String, dynamic>),
  darkMediumContrast: Scheme.fromJson(
    json['darkMediumContrast'] as Map<String, dynamic>,
  ),
  darkHighContrast: Scheme.fromJson(
    json['darkHighContrast'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SchemesToJson(_Schemes instance) => <String, dynamic>{
  'light': instance.light,
  'lightMediumContrast': instance.lightMediumContrast,
  'lightHighContrast': instance.lightHighContrast,
  'dark': instance.dark,
  'darkMediumContrast': instance.darkMediumContrast,
  'darkHighContrast': instance.darkHighContrast,
};

_Scheme _$SchemeFromJson(Map<String, dynamic> json) => _Scheme(
  primaryPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['primaryPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  secondaryPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['secondaryPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiaryPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['tertiaryPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  neutralPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['neutralPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  neutralVariantPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['neutralVariantPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  errorPaletteKeyColor: _$JsonConverterFromJson<String, int>(
    json['errorPaletteKeyColor'],
    const _ArgbHexConverter().fromJson,
  ),
  background: _$JsonConverterFromJson<String, int>(
    json['background'],
    const _ArgbHexConverter().fromJson,
  ),
  onBackground: _$JsonConverterFromJson<String, int>(
    json['onBackground'],
    const _ArgbHexConverter().fromJson,
  ),
  surface: _$JsonConverterFromJson<String, int>(
    json['surface'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceDim: _$JsonConverterFromJson<String, int>(
    json['surfaceDim'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceBright: _$JsonConverterFromJson<String, int>(
    json['surfaceBright'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceContainerLowest: _$JsonConverterFromJson<String, int>(
    json['surfaceContainerLowest'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceContainerLow: _$JsonConverterFromJson<String, int>(
    json['surfaceContainerLow'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceContainer: _$JsonConverterFromJson<String, int>(
    json['surfaceContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceContainerHigh: _$JsonConverterFromJson<String, int>(
    json['surfaceContainerHigh'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceContainerHighest: _$JsonConverterFromJson<String, int>(
    json['surfaceContainerHighest'],
    const _ArgbHexConverter().fromJson,
  ),
  onSurface: _$JsonConverterFromJson<String, int>(
    json['onSurface'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceVariant: _$JsonConverterFromJson<String, int>(
    json['surfaceVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  onSurfaceVariant: _$JsonConverterFromJson<String, int>(
    json['onSurfaceVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  outline: _$JsonConverterFromJson<String, int>(
    json['outline'],
    const _ArgbHexConverter().fromJson,
  ),
  outlineVariant: _$JsonConverterFromJson<String, int>(
    json['outlineVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  inverseSurface: _$JsonConverterFromJson<String, int>(
    json['inverseSurface'],
    const _ArgbHexConverter().fromJson,
  ),
  inverseOnSurface: _$JsonConverterFromJson<String, int>(
    json['inverseOnSurface'],
    const _ArgbHexConverter().fromJson,
  ),
  shadow: _$JsonConverterFromJson<String, int>(
    json['shadow'],
    const _ArgbHexConverter().fromJson,
  ),
  scrim: _$JsonConverterFromJson<String, int>(
    json['scrim'],
    const _ArgbHexConverter().fromJson,
  ),
  surfaceTint: _$JsonConverterFromJson<String, int>(
    json['surfaceTint'],
    const _ArgbHexConverter().fromJson,
  ),
  primary: _$JsonConverterFromJson<String, int>(
    json['primary'],
    const _ArgbHexConverter().fromJson,
  ),
  primaryDim: _$JsonConverterFromJson<String, int>(
    json['primaryDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onPrimary: _$JsonConverterFromJson<String, int>(
    json['onPrimary'],
    const _ArgbHexConverter().fromJson,
  ),
  primaryContainer: _$JsonConverterFromJson<String, int>(
    json['primaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  onPrimaryContainer: _$JsonConverterFromJson<String, int>(
    json['onPrimaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  primaryFixed: _$JsonConverterFromJson<String, int>(
    json['primaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  primaryFixedDim: _$JsonConverterFromJson<String, int>(
    json['primaryFixedDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onPrimaryFixed: _$JsonConverterFromJson<String, int>(
    json['onPrimaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  onPrimaryFixedVariant: _$JsonConverterFromJson<String, int>(
    json['onPrimaryFixedVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  inversePrimary: _$JsonConverterFromJson<String, int>(
    json['inversePrimary'],
    const _ArgbHexConverter().fromJson,
  ),
  secondary: _$JsonConverterFromJson<String, int>(
    json['secondary'],
    const _ArgbHexConverter().fromJson,
  ),
  secondaryDim: _$JsonConverterFromJson<String, int>(
    json['secondaryDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onSecondary: _$JsonConverterFromJson<String, int>(
    json['onSecondary'],
    const _ArgbHexConverter().fromJson,
  ),
  secondaryContainer: _$JsonConverterFromJson<String, int>(
    json['secondaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  onSecondaryContainer: _$JsonConverterFromJson<String, int>(
    json['onSecondaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  secondaryFixed: _$JsonConverterFromJson<String, int>(
    json['secondaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  secondaryFixedDim: _$JsonConverterFromJson<String, int>(
    json['secondaryFixedDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onSecondaryFixed: _$JsonConverterFromJson<String, int>(
    json['onSecondaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  onSecondaryFixedVariant: _$JsonConverterFromJson<String, int>(
    json['onSecondaryFixedVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiary: _$JsonConverterFromJson<String, int>(
    json['tertiary'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiaryDim: _$JsonConverterFromJson<String, int>(
    json['tertiaryDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onTertiary: _$JsonConverterFromJson<String, int>(
    json['onTertiary'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiaryContainer: _$JsonConverterFromJson<String, int>(
    json['tertiaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  onTertiaryContainer: _$JsonConverterFromJson<String, int>(
    json['onTertiaryContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiaryFixed: _$JsonConverterFromJson<String, int>(
    json['tertiaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  tertiaryFixedDim: _$JsonConverterFromJson<String, int>(
    json['tertiaryFixedDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onTertiaryFixed: _$JsonConverterFromJson<String, int>(
    json['onTertiaryFixed'],
    const _ArgbHexConverter().fromJson,
  ),
  onTertiaryFixedVariant: _$JsonConverterFromJson<String, int>(
    json['onTertiaryFixedVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  error: _$JsonConverterFromJson<String, int>(
    json['error'],
    const _ArgbHexConverter().fromJson,
  ),
  errorDim: _$JsonConverterFromJson<String, int>(
    json['errorDim'],
    const _ArgbHexConverter().fromJson,
  ),
  onError: _$JsonConverterFromJson<String, int>(
    json['onError'],
    const _ArgbHexConverter().fromJson,
  ),
  errorContainer: _$JsonConverterFromJson<String, int>(
    json['errorContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  onErrorContainer: _$JsonConverterFromJson<String, int>(
    json['onErrorContainer'],
    const _ArgbHexConverter().fromJson,
  ),
  controlActivated: _$JsonConverterFromJson<String, int>(
    json['controlActivated'],
    const _ArgbHexConverter().fromJson,
  ),
  controlNormal: _$JsonConverterFromJson<String, int>(
    json['controlNormal'],
    const _ArgbHexConverter().fromJson,
  ),
  controlHighlight: _$JsonConverterFromJson<String, int>(
    json['controlHighlight'],
    const _ArgbHexConverter().fromJson,
  ),
  textPrimaryInverse: _$JsonConverterFromJson<String, int>(
    json['textPrimaryInverse'],
    const _ArgbHexConverter().fromJson,
  ),
  textSecondaryAndTertiaryInverse: _$JsonConverterFromJson<String, int>(
    json['textSecondaryAndTertiaryInverse'],
    const _ArgbHexConverter().fromJson,
  ),
  textPrimaryInverseDisableOnly: _$JsonConverterFromJson<String, int>(
    json['textPrimaryInverseDisableOnly'],
    const _ArgbHexConverter().fromJson,
  ),
  textSecondaryAndTertiaryInverseDisabled: _$JsonConverterFromJson<String, int>(
    json['textSecondaryAndTertiaryInverseDisabled'],
    const _ArgbHexConverter().fromJson,
  ),
  textHintInverse: _$JsonConverterFromJson<String, int>(
    json['textHintInverse'],
    const _ArgbHexConverter().fromJson,
  ),
  widgetBackground: _$JsonConverterFromJson<String, int>(
    json['widgetBackground'],
    const _ArgbHexConverter().fromJson,
  ),
  clockHour: _$JsonConverterFromJson<String, int>(
    json['clockHour'],
    const _ArgbHexConverter().fromJson,
  ),
  clockMinute: _$JsonConverterFromJson<String, int>(
    json['clockMinute'],
    const _ArgbHexConverter().fromJson,
  ),
  clockSecond: _$JsonConverterFromJson<String, int>(
    json['clockSecond'],
    const _ArgbHexConverter().fromJson,
  ),
  weatherTemp: _$JsonConverterFromJson<String, int>(
    json['weatherTemp'],
    const _ArgbHexConverter().fromJson,
  ),
  themeApp: _$JsonConverterFromJson<String, int>(
    json['themeApp'],
    const _ArgbHexConverter().fromJson,
  ),
  onThemeApp: _$JsonConverterFromJson<String, int>(
    json['onThemeApp'],
    const _ArgbHexConverter().fromJson,
  ),
  themeAppRing: _$JsonConverterFromJson<String, int>(
    json['themeAppRing'],
    const _ArgbHexConverter().fromJson,
  ),
  themeNotif: _$JsonConverterFromJson<String, int>(
    json['themeNotif'],
    const _ArgbHexConverter().fromJson,
  ),
  brandA: _$JsonConverterFromJson<String, int>(
    json['brandA'],
    const _ArgbHexConverter().fromJson,
  ),
  brandB: _$JsonConverterFromJson<String, int>(
    json['brandB'],
    const _ArgbHexConverter().fromJson,
  ),
  brandC: _$JsonConverterFromJson<String, int>(
    json['brandC'],
    const _ArgbHexConverter().fromJson,
  ),
  brandD: _$JsonConverterFromJson<String, int>(
    json['brandD'],
    const _ArgbHexConverter().fromJson,
  ),
  underSurface: _$JsonConverterFromJson<String, int>(
    json['underSurface'],
    const _ArgbHexConverter().fromJson,
  ),
  shadeActive: _$JsonConverterFromJson<String, int>(
    json['shadeActive'],
    const _ArgbHexConverter().fromJson,
  ),
  onShadeActive: _$JsonConverterFromJson<String, int>(
    json['onShadeActive'],
    const _ArgbHexConverter().fromJson,
  ),
  onShadeActiveVariant: _$JsonConverterFromJson<String, int>(
    json['onShadeActiveVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  shadeInactive: _$JsonConverterFromJson<String, int>(
    json['shadeInactive'],
    const _ArgbHexConverter().fromJson,
  ),
  onShadeInactive: _$JsonConverterFromJson<String, int>(
    json['onShadeInactive'],
    const _ArgbHexConverter().fromJson,
  ),
  onShadeInactiveVariant: _$JsonConverterFromJson<String, int>(
    json['onShadeInactiveVariant'],
    const _ArgbHexConverter().fromJson,
  ),
  shadeDisabled: _$JsonConverterFromJson<String, int>(
    json['shadeDisabled'],
    const _ArgbHexConverter().fromJson,
  ),
  overviewBackground: _$JsonConverterFromJson<String, int>(
    json['overviewBackground'],
    const _ArgbHexConverter().fromJson,
  ),
);

Map<String, dynamic> _$SchemeToJson(_Scheme instance) => <String, dynamic>{
  'primaryPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.primaryPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'secondaryPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.secondaryPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'tertiaryPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.tertiaryPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'neutralPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.neutralPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'neutralVariantPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.neutralVariantPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'errorPaletteKeyColor': ?_$JsonConverterToJson<String, int>(
    instance.errorPaletteKeyColor,
    const _ArgbHexConverter().toJson,
  ),
  'background': ?_$JsonConverterToJson<String, int>(
    instance.background,
    const _ArgbHexConverter().toJson,
  ),
  'onBackground': ?_$JsonConverterToJson<String, int>(
    instance.onBackground,
    const _ArgbHexConverter().toJson,
  ),
  'surface': ?_$JsonConverterToJson<String, int>(
    instance.surface,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceDim': ?_$JsonConverterToJson<String, int>(
    instance.surfaceDim,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceBright': ?_$JsonConverterToJson<String, int>(
    instance.surfaceBright,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceContainerLowest': ?_$JsonConverterToJson<String, int>(
    instance.surfaceContainerLowest,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceContainerLow': ?_$JsonConverterToJson<String, int>(
    instance.surfaceContainerLow,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceContainer': ?_$JsonConverterToJson<String, int>(
    instance.surfaceContainer,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceContainerHigh': ?_$JsonConverterToJson<String, int>(
    instance.surfaceContainerHigh,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceContainerHighest': ?_$JsonConverterToJson<String, int>(
    instance.surfaceContainerHighest,
    const _ArgbHexConverter().toJson,
  ),
  'onSurface': ?_$JsonConverterToJson<String, int>(
    instance.onSurface,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceVariant': ?_$JsonConverterToJson<String, int>(
    instance.surfaceVariant,
    const _ArgbHexConverter().toJson,
  ),
  'onSurfaceVariant': ?_$JsonConverterToJson<String, int>(
    instance.onSurfaceVariant,
    const _ArgbHexConverter().toJson,
  ),
  'outline': ?_$JsonConverterToJson<String, int>(
    instance.outline,
    const _ArgbHexConverter().toJson,
  ),
  'outlineVariant': ?_$JsonConverterToJson<String, int>(
    instance.outlineVariant,
    const _ArgbHexConverter().toJson,
  ),
  'inverseSurface': ?_$JsonConverterToJson<String, int>(
    instance.inverseSurface,
    const _ArgbHexConverter().toJson,
  ),
  'inverseOnSurface': ?_$JsonConverterToJson<String, int>(
    instance.inverseOnSurface,
    const _ArgbHexConverter().toJson,
  ),
  'shadow': ?_$JsonConverterToJson<String, int>(
    instance.shadow,
    const _ArgbHexConverter().toJson,
  ),
  'scrim': ?_$JsonConverterToJson<String, int>(
    instance.scrim,
    const _ArgbHexConverter().toJson,
  ),
  'surfaceTint': ?_$JsonConverterToJson<String, int>(
    instance.surfaceTint,
    const _ArgbHexConverter().toJson,
  ),
  'primary': ?_$JsonConverterToJson<String, int>(
    instance.primary,
    const _ArgbHexConverter().toJson,
  ),
  'primaryDim': ?_$JsonConverterToJson<String, int>(
    instance.primaryDim,
    const _ArgbHexConverter().toJson,
  ),
  'onPrimary': ?_$JsonConverterToJson<String, int>(
    instance.onPrimary,
    const _ArgbHexConverter().toJson,
  ),
  'primaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.primaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'onPrimaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.onPrimaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'primaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.primaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'primaryFixedDim': ?_$JsonConverterToJson<String, int>(
    instance.primaryFixedDim,
    const _ArgbHexConverter().toJson,
  ),
  'onPrimaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.onPrimaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'onPrimaryFixedVariant': ?_$JsonConverterToJson<String, int>(
    instance.onPrimaryFixedVariant,
    const _ArgbHexConverter().toJson,
  ),
  'inversePrimary': ?_$JsonConverterToJson<String, int>(
    instance.inversePrimary,
    const _ArgbHexConverter().toJson,
  ),
  'secondary': ?_$JsonConverterToJson<String, int>(
    instance.secondary,
    const _ArgbHexConverter().toJson,
  ),
  'secondaryDim': ?_$JsonConverterToJson<String, int>(
    instance.secondaryDim,
    const _ArgbHexConverter().toJson,
  ),
  'onSecondary': ?_$JsonConverterToJson<String, int>(
    instance.onSecondary,
    const _ArgbHexConverter().toJson,
  ),
  'secondaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.secondaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'onSecondaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.onSecondaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'secondaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.secondaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'secondaryFixedDim': ?_$JsonConverterToJson<String, int>(
    instance.secondaryFixedDim,
    const _ArgbHexConverter().toJson,
  ),
  'onSecondaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.onSecondaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'onSecondaryFixedVariant': ?_$JsonConverterToJson<String, int>(
    instance.onSecondaryFixedVariant,
    const _ArgbHexConverter().toJson,
  ),
  'tertiary': ?_$JsonConverterToJson<String, int>(
    instance.tertiary,
    const _ArgbHexConverter().toJson,
  ),
  'tertiaryDim': ?_$JsonConverterToJson<String, int>(
    instance.tertiaryDim,
    const _ArgbHexConverter().toJson,
  ),
  'onTertiary': ?_$JsonConverterToJson<String, int>(
    instance.onTertiary,
    const _ArgbHexConverter().toJson,
  ),
  'tertiaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.tertiaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'onTertiaryContainer': ?_$JsonConverterToJson<String, int>(
    instance.onTertiaryContainer,
    const _ArgbHexConverter().toJson,
  ),
  'tertiaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.tertiaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'tertiaryFixedDim': ?_$JsonConverterToJson<String, int>(
    instance.tertiaryFixedDim,
    const _ArgbHexConverter().toJson,
  ),
  'onTertiaryFixed': ?_$JsonConverterToJson<String, int>(
    instance.onTertiaryFixed,
    const _ArgbHexConverter().toJson,
  ),
  'onTertiaryFixedVariant': ?_$JsonConverterToJson<String, int>(
    instance.onTertiaryFixedVariant,
    const _ArgbHexConverter().toJson,
  ),
  'error': ?_$JsonConverterToJson<String, int>(
    instance.error,
    const _ArgbHexConverter().toJson,
  ),
  'errorDim': ?_$JsonConverterToJson<String, int>(
    instance.errorDim,
    const _ArgbHexConverter().toJson,
  ),
  'onError': ?_$JsonConverterToJson<String, int>(
    instance.onError,
    const _ArgbHexConverter().toJson,
  ),
  'errorContainer': ?_$JsonConverterToJson<String, int>(
    instance.errorContainer,
    const _ArgbHexConverter().toJson,
  ),
  'onErrorContainer': ?_$JsonConverterToJson<String, int>(
    instance.onErrorContainer,
    const _ArgbHexConverter().toJson,
  ),
  'controlActivated': ?_$JsonConverterToJson<String, int>(
    instance.controlActivated,
    const _ArgbHexConverter().toJson,
  ),
  'controlNormal': ?_$JsonConverterToJson<String, int>(
    instance.controlNormal,
    const _ArgbHexConverter().toJson,
  ),
  'controlHighlight': ?_$JsonConverterToJson<String, int>(
    instance.controlHighlight,
    const _ArgbHexConverter().toJson,
  ),
  'textPrimaryInverse': ?_$JsonConverterToJson<String, int>(
    instance.textPrimaryInverse,
    const _ArgbHexConverter().toJson,
  ),
  'textSecondaryAndTertiaryInverse': ?_$JsonConverterToJson<String, int>(
    instance.textSecondaryAndTertiaryInverse,
    const _ArgbHexConverter().toJson,
  ),
  'textPrimaryInverseDisableOnly': ?_$JsonConverterToJson<String, int>(
    instance.textPrimaryInverseDisableOnly,
    const _ArgbHexConverter().toJson,
  ),
  'textSecondaryAndTertiaryInverseDisabled':
      ?_$JsonConverterToJson<String, int>(
        instance.textSecondaryAndTertiaryInverseDisabled,
        const _ArgbHexConverter().toJson,
      ),
  'textHintInverse': ?_$JsonConverterToJson<String, int>(
    instance.textHintInverse,
    const _ArgbHexConverter().toJson,
  ),
  'widgetBackground': ?_$JsonConverterToJson<String, int>(
    instance.widgetBackground,
    const _ArgbHexConverter().toJson,
  ),
  'clockHour': ?_$JsonConverterToJson<String, int>(
    instance.clockHour,
    const _ArgbHexConverter().toJson,
  ),
  'clockMinute': ?_$JsonConverterToJson<String, int>(
    instance.clockMinute,
    const _ArgbHexConverter().toJson,
  ),
  'clockSecond': ?_$JsonConverterToJson<String, int>(
    instance.clockSecond,
    const _ArgbHexConverter().toJson,
  ),
  'weatherTemp': ?_$JsonConverterToJson<String, int>(
    instance.weatherTemp,
    const _ArgbHexConverter().toJson,
  ),
  'themeApp': ?_$JsonConverterToJson<String, int>(
    instance.themeApp,
    const _ArgbHexConverter().toJson,
  ),
  'onThemeApp': ?_$JsonConverterToJson<String, int>(
    instance.onThemeApp,
    const _ArgbHexConverter().toJson,
  ),
  'themeAppRing': ?_$JsonConverterToJson<String, int>(
    instance.themeAppRing,
    const _ArgbHexConverter().toJson,
  ),
  'themeNotif': ?_$JsonConverterToJson<String, int>(
    instance.themeNotif,
    const _ArgbHexConverter().toJson,
  ),
  'brandA': ?_$JsonConverterToJson<String, int>(
    instance.brandA,
    const _ArgbHexConverter().toJson,
  ),
  'brandB': ?_$JsonConverterToJson<String, int>(
    instance.brandB,
    const _ArgbHexConverter().toJson,
  ),
  'brandC': ?_$JsonConverterToJson<String, int>(
    instance.brandC,
    const _ArgbHexConverter().toJson,
  ),
  'brandD': ?_$JsonConverterToJson<String, int>(
    instance.brandD,
    const _ArgbHexConverter().toJson,
  ),
  'underSurface': ?_$JsonConverterToJson<String, int>(
    instance.underSurface,
    const _ArgbHexConverter().toJson,
  ),
  'shadeActive': ?_$JsonConverterToJson<String, int>(
    instance.shadeActive,
    const _ArgbHexConverter().toJson,
  ),
  'onShadeActive': ?_$JsonConverterToJson<String, int>(
    instance.onShadeActive,
    const _ArgbHexConverter().toJson,
  ),
  'onShadeActiveVariant': ?_$JsonConverterToJson<String, int>(
    instance.onShadeActiveVariant,
    const _ArgbHexConverter().toJson,
  ),
  'shadeInactive': ?_$JsonConverterToJson<String, int>(
    instance.shadeInactive,
    const _ArgbHexConverter().toJson,
  ),
  'onShadeInactive': ?_$JsonConverterToJson<String, int>(
    instance.onShadeInactive,
    const _ArgbHexConverter().toJson,
  ),
  'onShadeInactiveVariant': ?_$JsonConverterToJson<String, int>(
    instance.onShadeInactiveVariant,
    const _ArgbHexConverter().toJson,
  ),
  'shadeDisabled': ?_$JsonConverterToJson<String, int>(
    instance.shadeDisabled,
    const _ArgbHexConverter().toJson,
  ),
  'overviewBackground': ?_$JsonConverterToJson<String, int>(
    instance.overviewBackground,
    const _ArgbHexConverter().toJson,
  ),
};
