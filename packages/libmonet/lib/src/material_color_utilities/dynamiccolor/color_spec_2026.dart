// ignore_for_file: recursive_getters

import 'dart:math' as math;

import '../hct.dart';
import '../palettes/tonal_palette.dart';
import '../utils/math_utils.dart';
import 'color_spec.dart';
import 'color_spec_2025.dart';
import 'contrast_curve.dart';
import 'dynamic_color.dart';
import 'dynamic_scheme.dart';
import 'tone_delta_pair.dart';
import 'variant.dart';

/// [ColorSpec] implementation for the 2026 spec.
class ColorSpec2026 extends ColorSpec2025 {
  const ColorSpec2026();

  @override
  DynamicColor get surface {
    final color2026 = DynamicColor(
      name: "surface",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 4.0
                : 98.0
          : 0.0,
      isBackground: true,
    );
    return super.surface.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceDim {
    final color2026 = DynamicColor(
      name: "surface_dim",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 4.0
                : 87.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 1.0
                : 1.7
          : 0.0,
    );
    return super.surfaceDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceBright {
    final color2026 = DynamicColor(
      name: "surface_bright",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 18.0
                : 98.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 1.7
                : 1.0
          : 0.0,
    );
    return super.surfaceBright.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceContainerLowest {
    final color2026 = DynamicColor(
      name: "surface_container_lowest",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 0.0
                : 100.0
          : 0.0,
      isBackground: true,
    );
    return super.surfaceContainerLowest.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceContainerLow {
    final color2026 = DynamicColor(
      name: "surface_container_low",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 6.0
                : 96.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.25 : 0.0,
    );
    return super.surfaceContainerLow.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceContainer {
    final color2026 = DynamicColor(
      name: "surface_container",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 9.0
                : 94.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.4 : 0.0,
    );
    return super.surfaceContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceContainerHigh {
    final color2026 = DynamicColor(
      name: "surface_container_high",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 12.0
                : 92.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.5 : 0.0,
    );
    return super.surfaceContainerHigh.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get surfaceContainerHighest {
    final color2026 = DynamicColor(
      name: "surface_container_highest",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.variant == .cmf
          ? scheme.isDark
                ? 15.0
                : 90.0
          : 0.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
    );
    return super.surfaceContainerHighest.extendSpecVersion(
      .spec2026,
      color2026,
    );
  }

  @override
  DynamicColor get onSurface {
    final color2026 = DynamicColor(
      name: "on_surface",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(scheme.isDark ? 11.0 : 9.0),
    );
    return super.onSurface.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onSurfaceVariant {
    final color2026 = DynamicColor(
      name: "on_surface_variant",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(scheme.isDark ? 6.0 : 4.5),
    );
    return super.onSurfaceVariant.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get outline {
    final color2026 = DynamicColor(
      name: "outline",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(3.0),
    );
    return super.outline.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get outlineVariant {
    final color2026 = DynamicColor(
      name: "outline_variant",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(1.5),
    );
    return super.outlineVariant.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get inverseSurface {
    final color2026 = DynamicColor(
      name: "inverse_surface",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.isDark ? 98.0 : 4.0,
      isBackground: true,
      chromaMultiplier: (scheme) => scheme.variant == .cmf ? 1.7 : 0.0,
    );
    return super.inverseSurface.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get inverseOnSurface {
    final color2026 = DynamicColor(
      name: "inverse_on_surface",
      palette: (scheme) => scheme.neutralPalette,
      background: (scheme) => inverseSurface,
      contrastCurve: (scheme) => _getContrastCurve(7.0),
    );
    return super.inverseOnSurface.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get primary {
    final color2026 = DynamicColor(
      name: "primary",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => scheme.sourceColorHct.chroma <= 12
          ? scheme.isDark
                ? 80.0
                : 40.0
          : scheme.sourceColorHct.tone,
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: primaryContainer,
              roleB: primary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.primary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get primaryDim {
    // Remapped to primary in 2026 spec.
    final color2026 = primary.copyWith(name: "primary_dim");
    return super.primaryDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onPrimary {
    final color2026 = DynamicColor(
      name: "on_primary",
      palette: (scheme) => scheme.primaryPalette,
      background: (scheme) => primary,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onPrimary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get primaryContainer {
    final color2026 = DynamicColor(
      name: "primary_container",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => !scheme.isDark && scheme.sourceColorHct.chroma <= 12
          ? 90.0
          : scheme.sourceColorHct.tone > 55
          ? MathUtils.clampDouble(61.0, 90.0, scheme.sourceColorHct.tone)
          : MathUtils.clampDouble(30.0, 49.0, scheme.sourceColorHct.tone),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.primaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onPrimaryContainer {
    final color2026 = DynamicColor(
      name: "on_primary_container",
      palette: (scheme) => scheme.primaryPalette,
      background: (scheme) => primaryContainer,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onPrimaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get primaryFixed {
    final color2026 = DynamicColor(
      name: "primary_fixed",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => primaryContainer.getTone(
        scheme.copyWith(isDark: false, contrastLevel: 0.0),
      ),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.primaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get primaryFixedDim {
    final color2026 = DynamicColor(
      name: "primary_fixed_dim",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => primaryFixed.getTone(scheme),
      isBackground: true,
      background: highestSurface,
      toneDeltaPair: (scheme) => ToneDeltaPair(
        roleA: primaryFixedDim,
        roleB: primaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.primaryFixedDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onPrimaryFixed {
    final color2026 = DynamicColor(
      name: "on_primary_fixed",
      palette: (scheme) => scheme.primaryPalette,
      background: (scheme) =>
          primaryFixed.getTone(scheme) > 57.0 ? primaryFixedDim : primaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(7.0),
    );
    return super.onPrimaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onPrimaryFixedVariant {
    final color2026 = DynamicColor(
      name: "on_primary_fixed_variant",
      palette: (scheme) => scheme.primaryPalette,
      background: (scheme) =>
          primaryFixed.getTone(scheme) > 57.0 ? primaryFixedDim : primaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
    );
    return super.onPrimaryFixedVariant.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get secondary {
    final color2026 = DynamicColor(
      name: "secondary",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => scheme.isDark
          ? _tMinC(scheme.secondaryPalette)
          : _tMaxC(scheme.secondaryPalette),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: secondaryContainer,
              roleB: secondary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.secondary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get secondaryDim {
    // Remapped to secondary in 2026 spec.
    final color2026 = secondary.copyWith(name: "secondary_dim");
    return super.secondaryDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onSecondary {
    final color2026 = DynamicColor(
      name: "on_secondary",
      palette: (scheme) => scheme.secondaryPalette,
      background: (scheme) => secondary,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onSecondary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get secondaryContainer {
    final color2026 = DynamicColor(
      name: "secondary_container",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => scheme.isDark
          ? _tMinC(scheme.secondaryPalette, 20.0, 49.0)
          : _tMaxC(scheme.secondaryPalette, 61.0, 90.0),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.secondaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onSecondaryContainer {
    final color2026 = DynamicColor(
      name: "on_secondary_container",
      palette: (scheme) => scheme.secondaryPalette,
      background: (scheme) => secondaryContainer,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onSecondaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get secondaryFixed {
    final color2026 = DynamicColor(
      name: "secondary_fixed",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => secondaryContainer.getTone(
        scheme.copyWith(isDark: false, contrastLevel: 0.0),
      ),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.secondaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get secondaryFixedDim {
    final color2026 = DynamicColor(
      name: "secondary_fixed_dim",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => secondaryFixed.getTone(scheme),
      isBackground: true,
      background: highestSurface,
      toneDeltaPair: (scheme) => ToneDeltaPair(
        roleA: secondaryFixedDim,
        roleB: secondaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.secondaryFixedDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onSecondaryFixed {
    final color2026 = DynamicColor(
      name: "on_secondary_fixed",
      palette: (scheme) => scheme.secondaryPalette,
      background: (scheme) => secondaryFixed.getTone(scheme) > 57.0
          ? secondaryFixedDim
          : secondaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(7.0),
    );
    return super.onSecondaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onSecondaryFixedVariant {
    final color2026 = DynamicColor(
      name: "on_secondary_fixed_variant",
      palette: (scheme) => scheme.secondaryPalette,
      background: (scheme) => secondaryFixed.getTone(scheme) > 57.0
          ? secondaryFixedDim
          : secondaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
    );
    return super.onSecondaryFixedVariant.extendSpecVersion(
      .spec2026,
      color2026,
    );
  }

  @override
  DynamicColor get tertiary {
    final color2026 = DynamicColor(
      name: "tertiary",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) =>
          scheme.sourceColorHctList.elementAtOrNull(1)?.tone ??
          scheme.sourceColorHct.tone,
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: tertiaryContainer,
              roleB: tertiary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.tertiary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get tertiaryDim {
    // Remapped to tertiary in 2026 spec.
    final color2026 = tertiary.copyWith(name: "tertiary_dim");
    return super.tertiaryDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onTertiary {
    final color2026 = DynamicColor(
      name: "on_tertiary",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (scheme) => tertiary,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onTertiary.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get tertiaryContainer {
    final color2026 = DynamicColor(
      name: "tertiary_container",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) {
        final secondarySourceColorHct =
            scheme.sourceColorHctList.elementAtOrNull(1) ??
            scheme.sourceColorHct;
        return secondarySourceColorHct.tone > 55.0
            ? MathUtils.clampDouble(61.0, 90.0, secondarySourceColorHct.tone)
            : MathUtils.clampDouble(20.0, 49.0, secondarySourceColorHct.tone);
      },
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.tertiaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onTertiaryContainer {
    final color2026 = DynamicColor(
      name: "on_tertiary_container",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (scheme) => tertiaryContainer,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onTertiaryContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get tertiaryFixed {
    final color2026 = DynamicColor(
      name: "tertiary_fixed",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) {
        final tempS = scheme.copyWith(isDark: false, contrastLevel: 0.0);
        return tertiaryContainer.getTone(tempS);
      },
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.tertiaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get tertiaryFixedDim {
    final color2026 = DynamicColor(
      name: "tertiary_fixed_dim",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) => tertiaryFixed.getTone(scheme),
      isBackground: true,
      background: highestSurface,
      toneDeltaPair: (scheme) => ToneDeltaPair(
        roleA: tertiaryFixedDim,
        roleB: tertiaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.tertiaryFixedDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onTertiaryFixed {
    final color2026 = DynamicColor(
      name: "on_tertiary_fixed",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (scheme) => tertiaryFixed.getTone(scheme) > 57.0
          ? tertiaryFixedDim
          : tertiaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(7.0),
    );
    return super.onTertiaryFixed.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onTertiaryFixedVariant {
    final color2026 = DynamicColor(
      name: "on_tertiary_fixed_variant",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (scheme) => tertiaryFixed.getTone(scheme) > 57.0
          ? tertiaryFixedDim
          : tertiaryFixed,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
    );
    return super.onTertiaryFixedVariant.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get error {
    final color2026 = DynamicColor(
      name: "error",
      palette: (scheme) => scheme.errorPalette,
      tone: (scheme) => _tMaxC(scheme.errorPalette),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) => _getContrastCurve(4.5),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: errorContainer,
              roleB: error,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.error.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get errorDim {
    // Remapped to error in 2026 spec.
    final color2026 = error.copyWith(name: "error_dim");
    return super.errorDim.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onError {
    final color2026 = DynamicColor(
      name: "on_error",
      palette: (scheme) => scheme.errorPalette,
      background: (scheme) => error,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onError.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get errorContainer {
    final color2026 = DynamicColor(
      name: "error_container",
      palette: (scheme) => scheme.errorPalette,
      tone: (scheme) => scheme.isDark
          ? _tMinC(scheme.errorPalette)
          : _tMaxC(scheme.errorPalette),
      isBackground: true,
      background: highestSurface,
      contrastCurve: (scheme) =>
          scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null,
    );
    return super.errorContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  DynamicColor get onErrorContainer {
    final color2026 = DynamicColor(
      name: "on_error_container",
      palette: (scheme) => scheme.errorPalette,
      background: (scheme) => errorContainer,
      contrastCurve: (scheme) => _getContrastCurve(6.0),
    );
    return super.onErrorContainer.extendSpecVersion(.spec2026, color2026);
  }

  @override
  TonalPalette getPrimaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(sourceColor.asHct.hue, sourceColor.asHct.chroma),
    _ => super.getPrimaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getSecondaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.5,
    ),
    _ => super.getSecondaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getTertiaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => _tertiaryPalette(sourceColor),
    _ => super.getTertiaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getNeutralPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.2,
    ),
    _ => super.getNeutralPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getNeutralVariantPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.2,
    ),
    _ => super.getNeutralVariantPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getErrorPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      _getErrorHue(sourceColor.asHct.hue, _tertiaryPalette(sourceColor).hue),
      math.max(sourceColor.asHct.chroma, 50.0),
    ),
    _ => super.getErrorPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  static double _findBestToneForChroma(
    double hue,
    double chroma,
    double tone,
    bool byDecreasingTone,
  ) {
    var answer = tone;
    var bestCandidate = Hct.from(hue, chroma, answer);
    while (bestCandidate.chroma < chroma) {
      if (tone < 0 || tone > 100) break;
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

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static ContrastCurve _getContrastCurve(double defaultContrast) =>
      switch (defaultContrast) {
        1.5 => const ContrastCurve(1.5, 1.5, 3.0, 5.5),
        3.0 => const ContrastCurve(3.0, 3.0, 4.5, 7.0),
        4.5 => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
        6.0 => const ContrastCurve(6.0, 6.0, 7.0, 11.0),
        7.0 => const ContrastCurve(7.0, 7.0, 11.0, 21.0),
        9.0 => const ContrastCurve(9.0, 9.0, 11.0, 21.0),
        11.0 => const ContrastCurve(11.0, 11.0, 21.0, 21.0),
        21.0 => const ContrastCurve(21.0, 21.0, 21.0, 21.0),
        _ => ContrastCurve(defaultContrast, defaultContrast, 7.0, 21.0),
      };

  static double _getErrorHue(double primaryHue, double tertiaryHue) {
    if (primaryHue <= 8.0) {
      return tertiaryHue <= 24.0
          ? 28.0
          : tertiaryHue <= 32.0
          ? 16.0
          : 20.0;
    } else if (primaryHue <= 16.0) {
      return tertiaryHue <= 24.0
          ? 32.0
          : tertiaryHue <= 32.0
          ? 20.0
          : 24.0;
    } else if (primaryHue <= 20.0) {
      return tertiaryHue <= 28.0
          ? 32.0
          : tertiaryHue <= 32.0
          ? 24.0
          : 28.0;
    } else if (primaryHue <= 28.0) {
      return tertiaryHue <= 24.0 ? 32.0 : 16.0;
    } else if (primaryHue <= 32.0) {
      return tertiaryHue <= 20.0
          ? 24.0
          : tertiaryHue <= 28.0
          ? 16.0
          : 20.0;
    } else if (primaryHue <= 40.0) {
      return tertiaryHue > 20.0 && tertiaryHue <= 28.0 ? 16.0 : 24.0;
    } else if (primaryHue <= 152.0) {
      return tertiaryHue > 24.0 && tertiaryHue <= 36.0 ? 20.0 : 32.0;
    } else if (primaryHue <= 272.0) {
      return tertiaryHue > 20.0 && tertiaryHue <= 28.0 ? 16.0 : 24.0;
    } else {
      return tertiaryHue > 12.0 && tertiaryHue <= 28.0 ? 32.0 : 16.0;
    }
  }

  static TonalPalette _tertiaryPalette(TonalPaletteSourceColor sourceColor) {
    final sourceColorHctList = sourceColor.asHctList;
    final sourceColorHct = sourceColor.asHct;
    final secondarySourceColorHct =
        sourceColorHctList.elementAtOrNull(1) ?? sourceColorHct;
    return sourceColorHct.toInt() == secondarySourceColorHct.toInt()
        ? .fromHueAndChroma(sourceColorHct.hue, sourceColorHct.chroma * 0.75)
        : .fromHueAndChroma(
            secondarySourceColorHct.hue,
            secondarySourceColorHct.chroma,
          );
  }
}
