// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io' as io;

import 'package:change_case/change_case.dart';
import 'package:libmonet/libmonet.dart';
import 'package:path/path.dart' as p;

import 'src/figma.dart' as figma;

const _specVersionToVariants = <SpecVersion, Set<Variant>>{
  .spec2021: {
    .monochrome,
    .neutral,
    .tonalSpot,
    .vibrant,
    .expressive,
    .fidelity,
    .content,
    .rainbow,
    .fruitSalad,
  },
  .spec2025: {.neutral, .tonalSpot, .vibrant, .expressive},
  .spec2026: {.cmf},
};

const _specVersionToPlatforms = <SpecVersion, Set<Platform>>{
  .spec2021: {.phone},
  .spec2025: {.phone, .watch},
  .spec2026: {.phone},
};

extension type _SeedColors._(
  ({
    TonalPaletteSourceColor sourceColor,
    TonalPaletteSourceColor? primaryPaletteKeyColor,
    TonalPaletteSourceColor? secondaryPaletteKeyColor,
    TonalPaletteSourceColor? tertiaryPaletteKeyColor,
    TonalPaletteSourceColor? neutralPaletteKeyColor,
    TonalPaletteSourceColor? neutralVariantPaletteKeyColor,
    TonalPaletteSourceColor? errorPaletteKeyColor,
  })
  _,
) implements Object {
  const _SeedColors({
    required TonalPaletteSourceColor sourceColor,
    TonalPaletteSourceColor? primaryPaletteKeyColor,
    TonalPaletteSourceColor? secondaryPaletteKeyColor,
    TonalPaletteSourceColor? tertiaryPaletteKeyColor,
    TonalPaletteSourceColor? neutralPaletteKeyColor,
    TonalPaletteSourceColor? neutralVariantPaletteKeyColor,
    TonalPaletteSourceColor? errorPaletteKeyColor,
  }) : _ = (
         sourceColor: sourceColor,
         primaryPaletteKeyColor: primaryPaletteKeyColor,
         secondaryPaletteKeyColor: secondaryPaletteKeyColor,
         tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
         neutralPaletteKeyColor: neutralPaletteKeyColor,
         neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
         errorPaletteKeyColor: errorPaletteKeyColor,
       );

  TonalPaletteSourceColor get sourceColor => _.sourceColor;

  TonalPaletteSourceColor? get primaryPaletteKeyColor =>
      _.primaryPaletteKeyColor;

  TonalPaletteSourceColor? get secondaryPaletteKeyColor =>
      _.secondaryPaletteKeyColor;

  TonalPaletteSourceColor? get tertiaryPaletteKeyColor =>
      _.tertiaryPaletteKeyColor;

  TonalPaletteSourceColor? get neutralPaletteKeyColor =>
      _.neutralPaletteKeyColor;

  TonalPaletteSourceColor? get neutralVariantPaletteKeyColor =>
      _.neutralVariantPaletteKeyColor;

  TonalPaletteSourceColor? get errorPaletteKeyColor => _.errorPaletteKeyColor;
}

final seedColorsByName = <String, _SeedColors>{
  "baseline": .new(sourceColor: .fromArgb(0xFF6750A4)),
  // "nowinandroid": .new(
  //   sourceColor: .fromArgb(0xFF8C4190),
  //   primaryPaletteKeyColor: .fromArgb(0xFF8C4190),
  //   secondaryPaletteKeyColor: .fromArgb(0xFFFF8456),
  //   tertiaryPaletteKeyColor: .fromArgb(0xFFB3E9FF),
  //   neutralPaletteKeyColor: .fromArgb(0xFF201A1B),
  // ),
};

final _mdc = MaterialDynamicColors();
final _adc = AndroidDynamicColors();

final _materialDynamicColors = <DynamicColor>{
  _mdc.primaryPaletteKeyColor,
  _mdc.secondaryPaletteKeyColor,
  _mdc.tertiaryPaletteKeyColor,
  _mdc.neutralPaletteKeyColor,
  _mdc.neutralVariantPaletteKeyColor,
  _mdc.errorPaletteKeyColor,
  _mdc.background,
  _mdc.onBackground,
  _mdc.surface,
  _mdc.surfaceDim,
  _mdc.surfaceBright,
  _mdc.surfaceContainerLowest,
  _mdc.surfaceContainerLow,
  _mdc.surfaceContainer,
  _mdc.surfaceContainerHigh,
  _mdc.surfaceContainerHighest,
  _mdc.onSurface,
  _mdc.surfaceVariant,
  _mdc.onSurfaceVariant,
  _mdc.outline,
  _mdc.outlineVariant,
  _mdc.inverseSurface,
  _mdc.inverseOnSurface,
  _mdc.shadow,
  _mdc.scrim,
  _mdc.surfaceTint,
  _mdc.primary,
  _mdc.primaryDim,
  _mdc.onPrimary,
  _mdc.primaryContainer,
  _mdc.onPrimaryContainer,
  _mdc.primaryFixed,
  _mdc.primaryFixedDim,
  _mdc.onPrimaryFixed,
  _mdc.onPrimaryFixedVariant,
  _mdc.inversePrimary,
  _mdc.secondary,
  _mdc.secondaryDim,
  _mdc.onSecondary,
  _mdc.secondaryContainer,
  _mdc.onSecondaryContainer,
  _mdc.secondaryFixed,
  _mdc.secondaryFixedDim,
  _mdc.onSecondaryFixed,
  _mdc.onSecondaryFixedVariant,
  _mdc.tertiary,
  _mdc.tertiaryDim,
  _mdc.onTertiary,
  _mdc.tertiaryContainer,
  _mdc.onTertiaryContainer,
  _mdc.tertiaryFixed,
  _mdc.tertiaryFixedDim,
  _mdc.onTertiaryFixed,
  _mdc.onTertiaryFixedVariant,
  _mdc.error,
  _mdc.errorDim,
  _mdc.onError,
  _mdc.errorContainer,
  _mdc.onErrorContainer,
};

final _androidOnlyDynamicColors = <DynamicColor>{
  _mdc.controlActivated,
  _mdc.controlNormal,
  _mdc.controlHighlight,
  _mdc.textPrimaryInverse,
  _mdc.textSecondaryAndTertiaryInverse,
  _mdc.textPrimaryInverseDisableOnly,
  _mdc.textSecondaryAndTertiaryInverseDisabled,
  _mdc.textHintInverse,
};

final _androidCustomDynamicColors = <DynamicColor>{
  _adc.widgetBackground,
  _adc.clockHour,
  _adc.clockMinute,
  _adc.clockSecond,
  _adc.weatherTemp,
  _adc.themeApp,
  _adc.onThemeApp,
  _adc.themeAppRing,
  _adc.themeNotif,
  _adc.brandA,
  _adc.brandB,
  _adc.brandC,
  _adc.brandD,
  _adc.underSurface,
  _adc.shadeActive,
  _adc.onShadeActive,
  _adc.onShadeActiveVariant,
  _adc.shadeInactive,
  _adc.onShadeInactive,
  _adc.onShadeInactiveVariant,
  _adc.shadeDisabled,
  _adc.overviewBackground,
  _adc.surfaceEffect0,
  _adc.surfaceEffect1,
  _adc.surfaceEffect2,
  _adc.surfaceEffect3,
  _adc.surfaceEffect0Fallback,
};

final _allDynamicColors = <DynamicColor>{
  ..._materialDynamicColors,
  ..._androidOnlyDynamicColors,
  ..._androidCustomDynamicColors,
};

extension type const _DynamicSchemeConfiguration._(
  ({Variant variant, Platform platform, SpecVersion specVersion}) _,
) implements Object {
  const _DynamicSchemeConfiguration({
    required Variant variant,
    required Platform platform,
    required SpecVersion specVersion,
  }) : _ = (variant: variant, platform: platform, specVersion: specVersion);

  Variant get variant => _.variant;

  Platform get platform => _.platform;

  SpecVersion get specVersion => _.specVersion;
}

String _cssHexFromArgb(int argb) {
  final rgbHex =
      "${ColorUtils.redFromArgb(argb).toRadixString(16).toUpperCase().padLeft(2, "0")}"
      "${ColorUtils.greenFromArgb(argb).toRadixString(16).toUpperCase().padLeft(2, "0")}"
      "${ColorUtils.blueFromArgb(argb).toRadixString(16).toUpperCase().padLeft(2, "0")}";
  return ColorUtils.isOpaque(argb)
      ? "#$rgbHex"
      : "#$rgbHex${ColorUtils.alphaFromArgb(argb).toRadixString(16).toUpperCase().padLeft(2, "0")}";
}

void main() {
  for (final MapEntry(key: name, value: seed) in seedColorsByName.entries) {
    final configurations = <_DynamicSchemeConfiguration>{};
    for (final rawSpecVersion in SpecVersion.values) {
      for (final rawPlatform in Platform.values) {
        for (final rawVariant in Variant.values) {
          final DynamicScheme(
            :variant,
            :platform,
            :specVersion,
          ) = DynamicScheme.withDefaults(
            variant: rawVariant,
            platform: rawPlatform,
            specVersion: rawSpecVersion,
          );
          final configuration = _DynamicSchemeConfiguration(
            variant: variant,
            platform: platform,
            specVersion: specVersion,
          );
          if (!configurations.add(configuration)) continue;

          final lightNormalContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: false,
            contrastLevel: 0.0,
            platform: platform,
            specVersion: specVersion,
          );
          final lightMediumContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: false,
            contrastLevel: 0.5,
            platform: platform,
            specVersion: specVersion,
          );
          final lightHighContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: false,
            contrastLevel: 1.0,
            platform: platform,
            specVersion: specVersion,
          );
          final darkNormalContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: true,
            contrastLevel: 0.0,
            platform: platform,
            specVersion: specVersion,
          );
          final darkMediumContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: true,
            contrastLevel: 0.5,
            platform: platform,
            specVersion: specVersion,
          );
          final darkHighContrast = DynamicScheme.withDefaults(
            sourceColor: seed.sourceColor,
            variant: variant,
            isDark: true,
            contrastLevel: 1.0,
            platform: platform,
            specVersion: specVersion,
          );

          final fileNameWithoutExtension =
              "${name}_${variant.name.toLowerCase()}_${specVersion.year}_${platform.name.toLowerCase()}";
          final packageRoot = io.Platform.script.resolve("../").toFilePath();

          {
            final theme = figma.Theme(
              description:
                  "TYPE: CUSTOM\n"
                  "Material Theme Builder export",
              seed: seed.sourceColor.asArgb,
              coreColors: figma.CoreColors(
                primary:
                    (seed.primaryPaletteKeyColor ?? seed.sourceColor).asArgb,
                secondary: seed.secondaryPaletteKeyColor?.asArgb,
                tertiary: seed.tertiaryPaletteKeyColor?.asArgb,
                neutral: seed.neutralPaletteKeyColor?.asArgb,
                neutralVariant: seed.neutralVariantPaletteKeyColor?.asArgb,
                error: seed.errorPaletteKeyColor?.asArgb,
              ),
              schemes: figma.Schemes.fromDynamicSchemes(
                light: lightNormalContrast,
                lightMediumContrast: lightMediumContrast,
                lightHighContrast: lightHighContrast,
                dark: darkNormalContrast,
                darkMediumContrast: darkMediumContrast,
                darkHighContrast: darkHighContrast,
              ),
            );
            final json = theme.toJson();
            final encoder = JsonEncoder.withIndent(" " * 2);
            final encoded = encoder.convert(json);

            print("$fileNameWithoutExtension / Figma");
            io.File(
                p.join(
                  packageRoot,
                  "example/generated/figma",
                  name,
                  "$fileNameWithoutExtension.json",
                ),
              )
              ..createSync(recursive: true)
              ..writeAsStringSync(encoded);
          }

          {
            final css = StringBuffer();

            void writeCssBuffer(String selector, DynamicScheme scheme) {
              css.writeln("$selector {");
              for (final dynamicColor in _allDynamicColors) {
                final variableName =
                    "md-sys-color-${dynamicColor.name.toKebabCase()}";
                final variableProperty = "--$variableName";
                final variableValue = _cssHexFromArgb(
                  dynamicColor.getArgb(scheme),
                );
                css.writeln("  $variableProperty: $variableValue;");
              }
              css.writeln("}");
            }

            writeCssBuffer(".light", lightNormalContrast);
            writeCssBuffer(".light-medium-contrast", lightMediumContrast);
            writeCssBuffer(".light-high-contrast", lightHighContrast);
            writeCssBuffer(".dark", darkNormalContrast);
            writeCssBuffer(".dark-medium-contrast", darkMediumContrast);
            writeCssBuffer(".dark-high-contrast", darkHighContrast);

            print("$fileNameWithoutExtension / CSS");

            io.File(
                p.join(
                  packageRoot,
                  "example/generated/css",
                  name,
                  "$fileNameWithoutExtension.css",
                ),
              )
              ..createSync(recursive: true)
              ..writeAsStringSync(css.toString());
          }
        }
      }
    }
  }
}
