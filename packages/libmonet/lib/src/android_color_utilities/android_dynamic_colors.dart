// ignore_for_file: recursive_getters

import 'package:libmonet/material_color_utilities.dart';

final _androidDynamicColors = AndroidDynamicColors._();

final class AndroidDynamicColors._() {
  factory() => _androidDynamicColors;

  final _materialDynamicColors = MaterialDynamicColors();

  // CLOCK COLORS

  /// Background color recommended for most Android widgets.
  DynamicColor get widgetBackground => DynamicColor(
    name: "widget_background",
    palette: (scheme) => scheme.secondaryPalette,
    tone: (scheme) => scheme.isDark ? 20.0 : 95.0,
    isBackground: true,
  );

  /// Clock hour color
  DynamicColor get clockHour => DynamicColor(
    name: "clock_hour",
    palette: (scheme) =>
        scheme.isDark ? scheme.primaryPalette : scheme.secondaryPalette,
    tone: (scheme) => scheme.isDark ? 80.0 : 30.0,
    isBackground: false,
    background: (_) => widgetBackground,
    contrastCurve: (_) => const ContrastCurve(4.0, 4.0, 5.0, 15.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: clockHour,
      roleB: clockMinute,
      delta: 10.0,
      polarity: .darker,
      constraint: .farther,
    ),
  );

  /// Clock minute color
  DynamicColor get clockMinute => DynamicColor(
    name: "clock_minute",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => scheme.isDark ? 90.0 : 40.0,
    isBackground: false,
    background: (_) => widgetBackground,
    contrastCurve: (_) => const ContrastCurve(6.5, 6.5, 10.0, 15.0),
  );

  /// Clock second color
  DynamicColor get clockSecond => DynamicColor(
    name: "clock_second",
    palette: (scheme) => scheme.tertiaryPalette,
    tone: (scheme) => scheme.isDark ? 90.0 : 40.0,
    isBackground: false,
    background: (_) => widgetBackground,
    contrastCurve: (_) => const ContrastCurve(5.0, 5.0, 7.0, 11.0),
  );

  /// Weather temperature color
  DynamicColor get weatherTemp => DynamicColor(
    name: "weather_temp",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => scheme.isDark ? 80.0 : 40.0,
    isBackground: false,
    background: (_) => widgetBackground,
    contrastCurve: (_) => const ContrastCurve(5.0, 5.0, 7.0, 11.0),
  );

  // THEME APP ICONS

  /// Background color of monochrome launcher icons containers.
  DynamicColor get themeApp => DynamicColor(
    name: "theme_app",
    palette: (scheme) =>
        scheme.isDark ? scheme.secondaryPalette : scheme.primaryPalette,
    tone: (scheme) => scheme.isDark
        ? switch (scheme.variant) {
            .tonalSpot ||
            .expressive => _tMinC(scheme.primaryPalette, 20.0, 93.0),
            .vibrant => _tMinC(scheme.primaryPalette, 66.0, 93.0),
            _ => 20.0,
          }
        : switch (scheme.variant) {
            .tonalSpot => _tMaxC(scheme.primaryPalette, 0.0, 90.0),
            .expressive =>
              Hct.isCyan(scheme.primaryPalette.hue)
                  ? 88.0
                  : _tMaxC(scheme.primaryPalette, 78.0, 90.0),
            .vibrant =>
              Hct.isCyan(scheme.primaryPalette.hue)
                  ? 88.0
                  : _tMaxC(scheme.primaryPalette, 0.0, 66.0),
            _ => 90.0,
          },
    isBackground: true,
  );

  /// Tint color that gets applied to monochrome launcher icons.
  DynamicColor get onThemeApp => DynamicColor(
    name: "on_theme_app",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => scheme.isDark ? 80.0 : 30.0,
    isBackground: false,
    background: (_) => themeApp,
    contrastCurve: (_) => const ContrastCurve(7.0, 7.0, 11.0, 21.0),
  );

  /// App suggestion ring color.
  DynamicColor get themeAppRing => DynamicColor(
    name: "theme_app_ring",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => switch (scheme.variant) {
      .tonalSpot || .expressive => _tMaxC(scheme.primaryPalette, 0.0, 70.0),
      .vibrant => _tMaxC(scheme.primaryPalette),
      _ => 70.0,
    },
    isBackground: true,
    background: (_) => _materialDynamicColors.surfaceContainerHigh,
    contrastCurve: (_) => const ContrastCurve(1.8, 1.8, 3.0, 4.5),
  );

  /// App notification badge color.
  DynamicColor get themeNotif => DynamicColor(
    name: "theme_notif",
    palette: (scheme) => scheme.tertiaryPalette,
    tone: (scheme) => _tMinC(scheme.tertiaryPalette, 80.0, 93.0),
    isBackground: false,
    background: (_) => themeAppRing,
    contrastCurve: (_) => const ContrastCurve(1.0, 1.0, 1.0, 1.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: themeNotif,
      roleB: themeAppRing,
      delta: 5.0,
      polarity: .relativeLighter,
      constraint: .farther,
    ),
  );

  // SUPER G COLORS

  /// One of the colors used in the Super G logo.
  /// Super G is the internal name of the multicolored Google "G" logomark.
  ///
  /// This color maps to the red part of the logo.
  DynamicColor get brandA => DynamicColor(
    name: "brand_a",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => scheme.isDark ? 80.0 : 40.0,
    background: (_) => _materialDynamicColors.surfaceContainerLow,
    contrastCurve: (scheme) => scheme.isDark
        ? const ContrastCurve(10.0, 10.0, 12.0, 13.0)
        : const ContrastCurve(6.0, 6.0, 9.0, 12.0),
  );

  /// One of the colors used in the Super G logo.
  /// Super G is the internal name of the multicolored Google "G" logomark.
  ///
  /// This color maps to the yellow part of the logo.
  DynamicColor get brandB => DynamicColor(
    name: "brand_b",
    palette: (scheme) => scheme.secondaryPalette,
    tone: (scheme) => scheme.isDark ? 98.0 : 70.0,
    background: (_) => _materialDynamicColors.surfaceContainerLow,
    contrastCurve: (scheme) => scheme.isDark
        ? const ContrastCurve(16.0, 16.0, 16.5, 17.0)
        : const ContrastCurve(2.0, 2.0, 3.0, 4.5),
  );

  /// One of the colors used in the Super G logo.
  /// Super G is the internal name of the multicolored Google "G" logomark.
  ///
  /// This color maps to the green part of the logo.
  DynamicColor get brandC => DynamicColor(
    name: "brand_c",
    palette: (scheme) => scheme.primaryPalette,
    tone: (scheme) => scheme.isDark ? 60.0 : 50.0,
    background: (_) => _materialDynamicColors.surfaceContainerLow,
    contrastCurve: (scheme) => scheme.isDark
        ? const ContrastCurve(6.0, 6.0, 9.0, 11.0)
        : const ContrastCurve(4.0, 4.0, 7.0, 8.0),
  );

  /// One of the colors used in the Super G logo.
  /// Super G is the internal name of the multicolored Google "G" logomark.
  ///
  /// This color maps to the blue part of the logo.
  DynamicColor get brandD => DynamicColor(
    name: "brand_d",
    palette: (scheme) => scheme.tertiaryPalette,
    tone: (scheme) => scheme.isDark ? 90.0 : 59.0,
    background: (_) => _materialDynamicColors.surfaceContainerLow,
    contrastCurve: (scheme) => scheme.isDark
        ? const ContrastCurve(13.0, 13.0, 14.0, 15.0)
        : const ContrastCurve(3.0, 3.0, 4.5, 6.0),
  );

  // QUICK SETTING TILES

  DynamicColor get underSurface => DynamicColor(
    name: "under_surface",
    palette: (scheme) => scheme.primaryPalette,
    tone: (_) => 0.0,
    isBackground: true,
  );

  DynamicColor get shadeActive => DynamicColor(
    name: "shade_active",
    palette: (scheme) => scheme.primaryPalette,
    tone: (_) => 90.0,
    isBackground: true,
    background: (_) => underSurface,
    contrastCurve: (_) => const ContrastCurve(3.0, 3.0, 4.5, 7.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: shadeActive,
      roleB: shadeInactive,
      delta: 30.0,
      polarity: .lighter,
      constraint: .farther,
    ),
  );

  DynamicColor get onShadeActive => DynamicColor(
    name: "on_shade_active",
    palette: (scheme) => scheme.primaryPalette,
    tone: (_) => 10.0,
    isBackground: false,
    background: (_) => shadeActive,
    contrastCurve: (_) => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: onShadeActive,
      roleB: onShadeActiveVariant,
      delta: 20.0,
      polarity: .relativeLighter,
      constraint: .farther,
    ),
  );

  DynamicColor get onShadeActiveVariant => DynamicColor(
    name: "on_shade_active_variant",
    palette: (scheme) => scheme.primaryPalette,
    tone: (_) => 30.0,
    isBackground: false,
    background: (_) => shadeActive,
    contrastCurve: (_) => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
  );

  DynamicColor get shadeInactive => DynamicColor(
    name: "shade_inactive",
    palette: (scheme) => scheme.neutralPalette,
    tone: (_) => 20.0,
    isBackground: true,
    background: (_) => underSurface,
    contrastCurve: (_) => const ContrastCurve(1.0, 1.0, 1.0, 1.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: shadeInactive,
      roleB: shadeDisabled,
      delta: 15.0,
      polarity: .lighter,
      constraint: .farther,
    ),
  );

  DynamicColor get onShadeInactive => DynamicColor(
    name: "on_shade_inactive",
    palette: (scheme) => scheme.neutralVariantPalette,
    tone: (_) => 90.0,
    isBackground: false,
    background: (_) => shadeInactive,
    contrastCurve: (_) => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
    toneDeltaPair: (_) => ToneDeltaPair(
      roleA: onShadeInactive,
      roleB: onShadeInactiveVariant,
      delta: 10.0,
      polarity: .relativeLighter,
      constraint: .farther,
    ),
  );

  DynamicColor get onShadeInactiveVariant => DynamicColor(
    name: "on_shade_inactive_variant",
    palette: (scheme) => scheme.neutralVariantPalette,
    tone: (_) => 80.0,
    isBackground: false,
    background: (_) => shadeInactive,
    contrastCurve: (_) => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
  );

  DynamicColor get shadeDisabled => DynamicColor(
    name: "shade_disabled",
    palette: (scheme) => scheme.neutralPalette,
    tone: (_) => 4.0,
    isBackground: false,
    background: (_) => underSurface,
    contrastCurve: (_) => const ContrastCurve(1.0, 1.0, 1.0, 1.0),
  );

  DynamicColor get overviewBackground => DynamicColor(
    name: "overview_background",
    palette: (scheme) => scheme.neutralVariantPalette,
    tone: (scheme) => scheme.isDark ? 35.0 : 80.0,
    isBackground: true,
  );

  DynamicColor get surfaceEffect0 => DynamicColor(
    name: "surface_effect_0",
    palette: (s) => s.primaryPalette,
    tone: (s) => s.isDark ? 20.0 : 90.0,
    isBackground: true,
    opacity: (s) => .5,
  );

  DynamicColor get surfaceEffect1 => DynamicColor(
    name: "surface_effect_1",
    palette: (s) => s.neutralPalette,
    tone: (s) => s.isDark ? 6.0 : 98.0,
    isBackground: true,
    opacity: (s) => .54,
  );

  DynamicColor get surfaceEffect2 => DynamicColor(
    name: "surface_effect_2",
    palette: (s) => s.primaryPalette,
    tone: (s) => s.isDark ? 90.0 : 100.0,
    isBackground: true,
    opacity: (s) => s.isDark ? .15 : .32,
  );

  DynamicColor get surfaceEffect3 => DynamicColor(
    name: "surface_effect_3",
    palette: (s) => s.primaryPalette,
    tone: (s) => s.isDark ? 90.0 : 40.0,
    isBackground: true,
    opacity: (s) => s.isDark ? .10 : .15,
  );

  DynamicColor get surfaceEffect0Fallback => DynamicColor(
    name: "surface_effect_0_fallback",
    palette: (s) => s.secondaryPalette,
    tone: (s) => s.isDark ? 20.0 : 80.0,
    isBackground: true,
  );

  /// All dynamic colors in Android Design system.
  ///
  /// A list containing getters for all dynamic colors of this class.
  /// Iteration order is stable.
  late final allDynamicColors = List<DynamicColor Function()>.unmodifiableOf([
    () => widgetBackground,
    () => clockHour,
    () => clockMinute,
    () => clockSecond,
    () => weatherTemp,
    () => themeApp,
    () => onThemeApp,
    () => themeAppRing,
    () => themeNotif,
    () => brandA,
    () => brandB,
    () => brandC,
    () => brandD,
    () => underSurface,
    () => shadeActive,
    () => onShadeActive,
    () => onShadeActiveVariant,
    () => shadeInactive,
    () => onShadeInactive,
    () => onShadeInactiveVariant,
    () => shadeDisabled,
    () => overviewBackground,
    () => surfaceEffect0,
    () => surfaceEffect1,
    () => surfaceEffect2,
    () => surfaceEffect3,
    () => surfaceEffect0Fallback,
  ]);

  static double _findBestToneForChroma(
    double hue,
    double chroma,
    double tone,
    bool byDecreasingTone,
  ) {
    var answer = tone;
    var bestCandidate = Hct.from(hue, chroma, answer);
    while (bestCandidate.chroma < chroma) {
      if (tone < 0.0 || tone > 100.0) {
        break;
      }
      tone += byDecreasingTone ? -1.0 : 1.0;
      final newCandidate = Hct.from(hue, chroma, tone);
      if (bestCandidate.chroma < newCandidate.chroma) {
        bestCandidate = newCandidate;
        answer = tone;
      }
    }
    return answer;
  }

  static double _tMaxC(
    TonalPalette palette, [
    double lowerBound = 0.0,
    double upperBound = 100.0,
    double chromaMultiplier = 1.0,
  ]) => MathUtils.clampDouble(
    lowerBound,
    upperBound,
    _findBestToneForChroma(
      palette.hue,
      palette.chroma * chromaMultiplier,
      100.0,
      true,
    ),
  );

  static double _tMinC(
    TonalPalette palette, [
    double lowerBound = 0.0,
    double upperBound = 100.0,
  ]) => MathUtils.clampDouble(
    lowerBound,
    upperBound,
    _findBestToneForChroma(palette.hue, palette.chroma, 0.0, false),
  );
}

extension AndroidDynamicSchemeColorsExtension on DynamicScheme {
  int get widgetBackground => getArgb(_androidDynamicColors.widgetBackground);

  int get clockHour => getArgb(_androidDynamicColors.clockHour);

  int get clockMinute => getArgb(_androidDynamicColors.clockMinute);

  int get clockSecond => getArgb(_androidDynamicColors.clockSecond);

  int get weatherTemp => getArgb(_androidDynamicColors.weatherTemp);

  int get themeApp => getArgb(_androidDynamicColors.themeApp);

  int get onThemeApp => getArgb(_androidDynamicColors.onThemeApp);

  int get themeAppRing => getArgb(_androidDynamicColors.themeAppRing);

  int get themeNotif => getArgb(_androidDynamicColors.themeNotif);

  int get brandA => getArgb(_androidDynamicColors.brandA);

  int get brandB => getArgb(_androidDynamicColors.brandB);

  int get brandC => getArgb(_androidDynamicColors.brandC);

  int get brandD => getArgb(_androidDynamicColors.brandD);

  int get underSurface => getArgb(_androidDynamicColors.underSurface);

  int get shadeActive => getArgb(_androidDynamicColors.shadeActive);

  int get onShadeActive => getArgb(_androidDynamicColors.onShadeActive);

  int get onShadeActiveVariant =>
      getArgb(_androidDynamicColors.onShadeActiveVariant);

  int get shadeInactive => getArgb(_androidDynamicColors.shadeInactive);

  int get onShadeInactive => getArgb(_androidDynamicColors.onShadeInactive);

  int get onShadeInactiveVariant =>
      getArgb(_androidDynamicColors.onShadeInactiveVariant);

  int get shadeDisabled => getArgb(_androidDynamicColors.shadeDisabled);

  int get overviewBackground =>
      getArgb(_androidDynamicColors.overviewBackground);

  int get surfaceEffect0 => getArgb(_androidDynamicColors.surfaceEffect0);

  int get surfaceEffect1 => getArgb(_androidDynamicColors.surfaceEffect1);

  int get surfaceEffect2 => getArgb(_androidDynamicColors.surfaceEffect2);

  int get surfaceEffect3 => getArgb(_androidDynamicColors.surfaceEffect3);

  int get surfaceEffect0Fallback =>
      getArgb(_androidDynamicColors.surfaceEffect0Fallback);
}
