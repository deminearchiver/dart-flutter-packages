import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:system_colors_android/system_colors_android.dart';

@immutable
abstract class const AndroidColorScheme() with Diagnosticable {
  const factory from({
    required Brightness brightness,
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
    Color? controlActivated,
    Color? controlNormal,
    Color? controlHighlight,
    Color? textPrimaryInverse,
    Color? textSecondaryAndTertiaryInverse,
    Color? textPrimaryInverseDisableOnly,
    Color? textSecondaryAndTertiaryInverseDisabled,
    Color? textHintInverse,
  }) = _AndroidColorScheme;

  Brightness get brightness;
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
  Color? get controlActivated;
  Color? get controlNormal;
  Color? get controlHighlight;
  Color? get textPrimaryInverse;
  Color? get textSecondaryAndTertiaryInverse;
  Color? get textPrimaryInverseDisableOnly;
  Color? get textSecondaryAndTertiaryInverseDisabled;
  Color? get textHintInverse;

  MaterialColorScheme resolve() => .from(
    brightness: brightness,
    primaryPaletteKeyColor: primaryPaletteKeyColor ?? Colors.transparent,
    secondaryPaletteKeyColor: secondaryPaletteKeyColor ?? Colors.transparent,
    tertiaryPaletteKeyColor: tertiaryPaletteKeyColor ?? Colors.transparent,
    neutralPaletteKeyColor: neutralPaletteKeyColor ?? Colors.transparent,
    neutralVariantPaletteKeyColor:
        neutralVariantPaletteKeyColor ?? Colors.transparent,
    errorPaletteKeyColor: errorPaletteKeyColor ?? Colors.transparent,
    background: background ?? Colors.transparent,
    onBackground: onBackground ?? Colors.transparent,
    surface: surface ?? Colors.transparent,
    surfaceDim: surfaceDim ?? Colors.transparent,
    surfaceBright: surfaceBright ?? Colors.transparent,
    surfaceContainerLowest: surfaceContainerLowest ?? Colors.transparent,
    surfaceContainerLow: surfaceContainerLow ?? Colors.transparent,
    surfaceContainer: surfaceContainer ?? Colors.transparent,
    surfaceContainerHigh: surfaceContainerHigh ?? Colors.transparent,
    surfaceContainerHighest: surfaceContainerHighest ?? Colors.transparent,
    onSurface: onSurface ?? Colors.transparent,
    surfaceVariant: surfaceVariant ?? Colors.transparent,
    onSurfaceVariant: onSurfaceVariant ?? Colors.transparent,
    outline: outline ?? Colors.transparent,
    outlineVariant: outlineVariant ?? Colors.transparent,
    inverseSurface: inverseSurface ?? Colors.transparent,
    inverseOnSurface: inverseOnSurface ?? Colors.transparent,
    shadow: shadow ?? Colors.transparent,
    scrim: scrim ?? Colors.transparent,
    surfaceTint: surfaceTint ?? Colors.transparent,
    primary: primary ?? Colors.transparent,
    primaryDim: primaryDim ?? Colors.transparent,
    onPrimary: onPrimary ?? Colors.transparent,
    primaryContainer: primaryContainer ?? Colors.transparent,
    onPrimaryContainer: onPrimaryContainer ?? Colors.transparent,
    primaryFixed: primaryFixed ?? Colors.transparent,
    primaryFixedDim: primaryFixedDim ?? Colors.transparent,
    onPrimaryFixed: onPrimaryFixed ?? Colors.transparent,
    onPrimaryFixedVariant: onPrimaryFixedVariant ?? Colors.transparent,
    inversePrimary: inversePrimary ?? Colors.transparent,
    secondary: secondary ?? Colors.transparent,
    secondaryDim: secondaryDim ?? Colors.transparent,
    onSecondary: onSecondary ?? Colors.transparent,
    secondaryContainer: secondaryContainer ?? Colors.transparent,
    onSecondaryContainer: onSecondaryContainer ?? Colors.transparent,
    secondaryFixed: secondaryFixed ?? Colors.transparent,
    secondaryFixedDim: secondaryFixedDim ?? Colors.transparent,
    onSecondaryFixed: onSecondaryFixed ?? Colors.transparent,
    onSecondaryFixedVariant: onSecondaryFixedVariant ?? Colors.transparent,
    tertiary: tertiary ?? Colors.transparent,
    tertiaryDim: tertiaryDim ?? Colors.transparent,
    onTertiary: onTertiary ?? Colors.transparent,
    tertiaryContainer: tertiaryContainer ?? Colors.transparent,
    onTertiaryContainer: onTertiaryContainer ?? Colors.transparent,
    tertiaryFixed: tertiaryFixed ?? Colors.transparent,
    tertiaryFixedDim: tertiaryFixedDim ?? Colors.transparent,
    onTertiaryFixed: onTertiaryFixed ?? Colors.transparent,
    onTertiaryFixedVariant: onTertiaryFixedVariant ?? Colors.transparent,
    error: error ?? Colors.transparent,
    errorDim: errorDim ?? Colors.transparent,
    onError: onError ?? Colors.transparent,
    errorContainer: errorContainer ?? Colors.transparent,
    onErrorContainer: onErrorContainer ?? Colors.transparent,
  );
}

final class const _AndroidColorScheme({
  @override required final Brightness brightness,
  @override final Color? primaryPaletteKeyColor,
  @override final Color? secondaryPaletteKeyColor,
  @override final Color? tertiaryPaletteKeyColor,
  @override final Color? neutralPaletteKeyColor,
  @override final Color? neutralVariantPaletteKeyColor,
  @override final Color? errorPaletteKeyColor,
  @override final Color? background,
  @override final Color? onBackground,
  @override final Color? surface,
  @override final Color? surfaceDim,
  @override final Color? surfaceBright,
  @override final Color? surfaceContainerLowest,
  @override final Color? surfaceContainerLow,
  @override final Color? surfaceContainer,
  @override final Color? surfaceContainerHigh,
  @override final Color? surfaceContainerHighest,
  @override final Color? onSurface,
  @override final Color? surfaceVariant,
  @override final Color? onSurfaceVariant,
  @override final Color? outline,
  @override final Color? outlineVariant,
  @override final Color? inverseSurface,
  @override final Color? inverseOnSurface,
  @override final Color? shadow,
  @override final Color? scrim,
  @override final Color? surfaceTint,
  @override final Color? primary,
  @override final Color? primaryDim,
  @override final Color? onPrimary,
  @override final Color? primaryContainer,
  @override final Color? onPrimaryContainer,
  @override final Color? primaryFixed,
  @override final Color? primaryFixedDim,
  @override final Color? onPrimaryFixed,
  @override final Color? onPrimaryFixedVariant,
  @override final Color? inversePrimary,
  @override final Color? secondary,
  @override final Color? secondaryDim,
  @override final Color? onSecondary,
  @override final Color? secondaryContainer,
  @override final Color? onSecondaryContainer,
  @override final Color? secondaryFixed,
  @override final Color? secondaryFixedDim,
  @override final Color? onSecondaryFixed,
  @override final Color? onSecondaryFixedVariant,
  @override final Color? tertiary,
  @override final Color? tertiaryDim,
  @override final Color? onTertiary,
  @override final Color? tertiaryContainer,
  @override final Color? onTertiaryContainer,
  @override final Color? tertiaryFixed,
  @override final Color? tertiaryFixedDim,
  @override final Color? onTertiaryFixed,
  @override final Color? onTertiaryFixedVariant,
  @override final Color? error,
  @override final Color? errorDim,
  @override final Color? onError,
  @override final Color? errorContainer,
  @override final Color? onErrorContainer,
  @override final Color? controlActivated,
  @override final Color? controlNormal,
  @override final Color? controlHighlight,
  @override final Color? textPrimaryInverse,
  @override final Color? textSecondaryAndTertiaryInverse,
  @override final Color? textPrimaryInverseDisableOnly,
  @override final Color? textSecondaryAndTertiaryInverseDisabled,
  @override final Color? textHintInverse,
}) extends AndroidColorScheme {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _AndroidColorScheme &&
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
          onErrorContainer == other.onErrorContainer &&
          controlActivated == other.controlActivated &&
          controlNormal == other.controlNormal &&
          controlHighlight == other.controlHighlight &&
          textPrimaryInverse == other.textPrimaryInverse &&
          textSecondaryAndTertiaryInverse ==
              other.textSecondaryAndTertiaryInverse &&
          textPrimaryInverseDisableOnly ==
              other.textPrimaryInverseDisableOnly &&
          textSecondaryAndTertiaryInverseDisabled ==
              other.textSecondaryAndTertiaryInverseDisabled &&
          textHintInverse == other.textHintInverse;

  @override
  int get hashCode => Object.hash(
    Object.hash(
      Object.hash(
        Object.hash(
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
          onSurfaceVariant,
        ),
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
        secondaryDim,
      ),
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
      onError,
    ),
    errorContainer,
    onErrorContainer,
    controlActivated,
    controlNormal,
    controlHighlight,
    textPrimaryInverse,
    textSecondaryAndTertiaryInverse,
    textPrimaryInverseDisableOnly,
    textSecondaryAndTertiaryInverseDisabled,
    textHintInverse,
  );
}
