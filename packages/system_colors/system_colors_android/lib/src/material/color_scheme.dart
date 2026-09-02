import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
abstract class const MaterialColorScheme() with Diagnosticable {
  const factory from({
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
  }) = _MaterialColorScheme;

  Brightness get brightness;
  Color get primaryPaletteKeyColor;
  Color get secondaryPaletteKeyColor;
  Color get tertiaryPaletteKeyColor;
  Color get neutralPaletteKeyColor;
  Color get neutralVariantPaletteKeyColor;
  Color get errorPaletteKeyColor;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get outline;
  Color get outlineVariant;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get shadow;
  Color get scrim;
  Color get surfaceTint;
  Color get primary;
  Color get primaryDim;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get primaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixed;
  Color get onPrimaryFixedVariant;
  Color get inversePrimary;
  Color get secondary;
  Color get secondaryDim;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get secondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixed;
  Color get onSecondaryFixedVariant;
  Color get tertiary;
  Color get tertiaryDim;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get tertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixed;
  Color get onTertiaryFixedVariant;
  Color get error;
  Color get errorDim;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
}

final class const _MaterialColorScheme({
  @override required final Brightness brightness,
  @override required final Color primaryPaletteKeyColor,
  @override required final Color secondaryPaletteKeyColor,
  @override required final Color tertiaryPaletteKeyColor,
  @override required final Color neutralPaletteKeyColor,
  @override required final Color neutralVariantPaletteKeyColor,
  @override required final Color errorPaletteKeyColor,
  @override required final Color background,
  @override required final Color onBackground,
  @override required final Color surface,
  @override required final Color surfaceDim,
  @override required final Color surfaceBright,
  @override required final Color surfaceContainerLowest,
  @override required final Color surfaceContainerLow,
  @override required final Color surfaceContainer,
  @override required final Color surfaceContainerHigh,
  @override required final Color surfaceContainerHighest,
  @override required final Color onSurface,
  @override required final Color surfaceVariant,
  @override required final Color onSurfaceVariant,
  @override required final Color outline,
  @override required final Color outlineVariant,
  @override required final Color inverseSurface,
  @override required final Color inverseOnSurface,
  @override required final Color shadow,
  @override required final Color scrim,
  @override required final Color surfaceTint,
  @override required final Color primary,
  @override required final Color primaryDim,
  @override required final Color onPrimary,
  @override required final Color primaryContainer,
  @override required final Color onPrimaryContainer,
  @override required final Color primaryFixed,
  @override required final Color primaryFixedDim,
  @override required final Color onPrimaryFixed,
  @override required final Color onPrimaryFixedVariant,
  @override required final Color inversePrimary,
  @override required final Color secondary,
  @override required final Color secondaryDim,
  @override required final Color onSecondary,
  @override required final Color secondaryContainer,
  @override required final Color onSecondaryContainer,
  @override required final Color secondaryFixed,
  @override required final Color secondaryFixedDim,
  @override required final Color onSecondaryFixed,
  @override required final Color onSecondaryFixedVariant,
  @override required final Color tertiary,
  @override required final Color tertiaryDim,
  @override required final Color onTertiary,
  @override required final Color tertiaryContainer,
  @override required final Color onTertiaryContainer,
  @override required final Color tertiaryFixed,
  @override required final Color tertiaryFixedDim,
  @override required final Color onTertiaryFixed,
  @override required final Color onTertiaryFixedVariant,
  @override required final Color error,
  @override required final Color errorDim,
  @override required final Color onError,
  @override required final Color errorContainer,
  @override required final Color onErrorContainer,
}) extends MaterialColorScheme {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _MaterialColorScheme &&
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
  );
}
