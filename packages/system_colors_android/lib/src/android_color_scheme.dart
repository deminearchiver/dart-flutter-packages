// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AndroidSystemColorScheme with Diagnosticable {
  const AndroidSystemColorScheme();

  const factory AndroidSystemColorScheme.fallback() = _AndroidSystemColorScheme;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {}

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is AndroidSystemColorScheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class _AndroidSystemColorScheme extends AndroidSystemColorScheme {
  const _AndroidSystemColorScheme();
}

abstract class AndroidSystemColorScheme34 extends AndroidSystemColorScheme {
  const AndroidSystemColorScheme34();

  const factory AndroidSystemColorScheme34.from({
    required Color primaryFixed,
    required Color primaryFixedDim,
    required Color onPrimaryFixed,
    required Color onPrimaryFixedVariant,
    required Color secondaryFixed,
    required Color secondaryFixedDim,
    required Color onSecondaryFixed,
    required Color onSecondaryFixedVariant,
    required Color tertiaryFixed,
    required Color tertiaryFixedDim,
    required Color onTertiaryFixed,
    required Color onTertiaryFixedVariant,
    required Color primaryPaletteKeyColorLight,
    required Color secondaryPaletteKeyColorLight,
    required Color tertiaryPaletteKeyColorLight,
    required Color neutralPaletteKeyColorLight,
    required Color neutralVariantPaletteKeyColorLight,
    required Color backgroundLight,
    required Color onBackgroundLight,
    required Color surfaceLight,
    required Color surfaceDimLight,
    required Color surfaceBrightLight,
    required Color surfaceContainerLowestLight,
    required Color surfaceContainerLowLight,
    required Color surfaceContainerLight,
    required Color surfaceContainerHighLight,
    required Color surfaceContainerHighestLight,
    required Color onSurfaceLight,
    required Color surfaceVariantLight,
    required Color onSurfaceVariantLight,
    required Color outlineLight,
    required Color outlineVariantLight,
    required Color inverseSurfaceLight,
    required Color inverseOnSurfaceLight,
    required Color shadowLight,
    required Color scrimLight,
    required Color surfaceTintLight,
    required Color primaryLight,
    required Color onPrimaryLight,
    required Color primaryContainerLight,
    required Color onPrimaryContainerLight,
    required Color inversePrimaryLight,
    required Color secondaryLight,
    required Color onSecondaryLight,
    required Color secondaryContainerLight,
    required Color onSecondaryContainerLight,
    required Color tertiaryLight,
    required Color onTertiaryLight,
    required Color tertiaryContainerLight,
    required Color onTertiaryContainerLight,
    required Color errorLight,
    required Color onErrorLight,
    required Color errorContainerLight,
    required Color onErrorContainerLight,
    required Color primaryPaletteKeyColorDark,
    required Color secondaryPaletteKeyColorDark,
    required Color tertiaryPaletteKeyColorDark,
    required Color neutralPaletteKeyColorDark,
    required Color neutralVariantPaletteKeyColorDark,
    required Color backgroundDark,
    required Color onBackgroundDark,
    required Color surfaceDark,
    required Color surfaceDimDark,
    required Color surfaceBrightDark,
    required Color surfaceContainerLowestDark,
    required Color surfaceContainerLowDark,
    required Color surfaceContainerDark,
    required Color surfaceContainerHighDark,
    required Color surfaceContainerHighestDark,
    required Color onSurfaceDark,
    required Color surfaceVariantDark,
    required Color onSurfaceVariantDark,
    required Color outlineDark,
    required Color outlineVariantDark,
    required Color inverseSurfaceDark,
    required Color inverseOnSurfaceDark,
    required Color shadowDark,
    required Color scrimDark,
    required Color surfaceTintDark,
    required Color primaryDark,
    required Color onPrimaryDark,
    required Color primaryContainerDark,
    required Color onPrimaryContainerDark,
    required Color inversePrimaryDark,
    required Color secondaryDark,
    required Color onSecondaryDark,
    required Color secondaryContainerDark,
    required Color onSecondaryContainerDark,
    required Color tertiaryDark,
    required Color onTertiaryDark,
    required Color tertiaryContainerDark,
    required Color onTertiaryContainerDark,
    required Color errorDark,
    required Color onErrorDark,
    required Color errorContainerDark,
    required Color onErrorContainerDark,
  }) = _AndroidSystemColorScheme34;

  Color get primaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixed;
  Color get onPrimaryFixedVariant;
  Color get secondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixed;
  Color get onSecondaryFixedVariant;
  Color get tertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixed;
  Color get onTertiaryFixedVariant;
  Color get primaryPaletteKeyColorLight;
  Color get secondaryPaletteKeyColorLight;
  Color get tertiaryPaletteKeyColorLight;
  Color get neutralPaletteKeyColorLight;
  Color get neutralVariantPaletteKeyColorLight;
  Color get backgroundLight;
  Color get onBackgroundLight;
  Color get surfaceLight;
  Color get surfaceDimLight;
  Color get surfaceBrightLight;
  Color get surfaceContainerLowestLight;
  Color get surfaceContainerLowLight;
  Color get surfaceContainerLight;
  Color get surfaceContainerHighLight;
  Color get surfaceContainerHighestLight;
  Color get onSurfaceLight;
  Color get surfaceVariantLight;
  Color get onSurfaceVariantLight;
  Color get outlineLight;
  Color get outlineVariantLight;
  Color get inverseSurfaceLight;
  Color get inverseOnSurfaceLight;
  Color get shadowLight;
  Color get scrimLight;
  Color get surfaceTintLight;
  Color get primaryLight;
  Color get onPrimaryLight;
  Color get primaryContainerLight;
  Color get onPrimaryContainerLight;
  Color get inversePrimaryLight;
  Color get secondaryLight;
  Color get onSecondaryLight;
  Color get secondaryContainerLight;
  Color get onSecondaryContainerLight;
  Color get tertiaryLight;
  Color get onTertiaryLight;
  Color get tertiaryContainerLight;
  Color get onTertiaryContainerLight;
  Color get errorLight;
  Color get onErrorLight;
  Color get errorContainerLight;
  Color get onErrorContainerLight;
  Color get primaryPaletteKeyColorDark;
  Color get secondaryPaletteKeyColorDark;
  Color get tertiaryPaletteKeyColorDark;
  Color get neutralPaletteKeyColorDark;
  Color get neutralVariantPaletteKeyColorDark;
  Color get backgroundDark;
  Color get onBackgroundDark;
  Color get surfaceDark;
  Color get surfaceDimDark;
  Color get surfaceBrightDark;
  Color get surfaceContainerLowestDark;
  Color get surfaceContainerLowDark;
  Color get surfaceContainerDark;
  Color get surfaceContainerHighDark;
  Color get surfaceContainerHighestDark;
  Color get onSurfaceDark;
  Color get surfaceVariantDark;
  Color get onSurfaceVariantDark;
  Color get outlineDark;
  Color get outlineVariantDark;
  Color get inverseSurfaceDark;
  Color get inverseOnSurfaceDark;
  Color get shadowDark;
  Color get scrimDark;
  Color get surfaceTintDark;
  Color get primaryDark;
  Color get onPrimaryDark;
  Color get primaryContainerDark;
  Color get onPrimaryContainerDark;
  Color get inversePrimaryDark;
  Color get secondaryDark;
  Color get onSecondaryDark;
  Color get secondaryContainerDark;
  Color get onSecondaryContainerDark;
  Color get tertiaryDark;
  Color get onTertiaryDark;
  Color get tertiaryContainerDark;
  Color get onTertiaryContainerDark;
  Color get errorDark;
  Color get onErrorDark;
  Color get errorContainerDark;
  Color get onErrorContainerDark;

  ColorScheme toColorScheme({required Brightness brightness}) =>
      switch (brightness) {
        .light => ColorScheme(
          brightness: brightness,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          background: backgroundLight,
          onBackground: onBackgroundLight,
          surface: surfaceLight,
          surfaceDim: surfaceDimLight,
          surfaceBright: surfaceBrightLight,
          surfaceContainerLowest: surfaceContainerLowestLight,
          surfaceContainerLow: surfaceContainerLowLight,
          surfaceContainer: surfaceContainerLight,
          surfaceContainerHigh: surfaceContainerHighLight,
          surfaceContainerHighest: surfaceContainerHighestLight,
          onSurface: onSurfaceLight,
          surfaceVariant: surfaceVariantLight,
          onSurfaceVariant: onSurfaceVariantLight,
          outline: outlineLight,
          outlineVariant: outlineVariantLight,
          inverseSurface: inverseSurfaceLight,
          onInverseSurface: inverseOnSurfaceLight,
          shadow: shadowLight,
          scrim: scrimLight,
          surfaceTint: surfaceTintLight,
          primary: primaryLight,
          onPrimary: onPrimaryLight,
          primaryContainer: primaryContainerLight,
          onPrimaryContainer: onPrimaryContainerLight,
          inversePrimary: inversePrimaryLight,
          secondary: secondaryLight,
          onSecondary: onSecondaryLight,
          secondaryContainer: secondaryContainerLight,
          onSecondaryContainer: onSecondaryContainerLight,
          tertiary: tertiaryLight,
          onTertiary: onTertiaryLight,
          tertiaryContainer: tertiaryContainerLight,
          onTertiaryContainer: onTertiaryContainerLight,
          error: errorLight,
          onError: onErrorLight,
          errorContainer: errorContainerLight,
          onErrorContainer: onErrorContainerLight,
        ),
        .dark => ColorScheme(
          brightness: brightness,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          background: backgroundDark,
          onBackground: onBackgroundDark,
          surface: surfaceDark,
          surfaceDim: surfaceDimDark,
          surfaceBright: surfaceBrightDark,
          surfaceContainerLowest: surfaceContainerLowestDark,
          surfaceContainerLow: surfaceContainerLowDark,
          surfaceContainer: surfaceContainerDark,
          surfaceContainerHigh: surfaceContainerHighDark,
          surfaceContainerHighest: surfaceContainerHighestDark,
          onSurface: onSurfaceDark,
          surfaceVariant: surfaceVariantDark,
          onSurfaceVariant: onSurfaceVariantDark,
          outline: outlineDark,
          outlineVariant: outlineVariantDark,
          inverseSurface: inverseSurfaceDark,
          onInverseSurface: inverseOnSurfaceDark,
          shadow: shadowDark,
          scrim: scrimDark,
          surfaceTint: surfaceTintDark,
          primary: primaryDark,
          onPrimary: onPrimaryDark,
          primaryContainer: primaryContainerDark,
          onPrimaryContainer: onPrimaryContainerDark,
          inversePrimary: inversePrimaryDark,
          secondary: secondaryDark,
          onSecondary: onSecondaryDark,
          secondaryContainer: secondaryContainerDark,
          onSecondaryContainer: onSecondaryContainerDark,
          tertiary: tertiaryDark,
          onTertiary: onTertiaryDark,
          tertiaryContainer: tertiaryContainerDark,
          onTertiaryContainer: onTertiaryContainerDark,
          error: errorDark,
          onError: onErrorDark,
          errorContainer: errorContainerDark,
          onErrorContainer: onErrorContainerDark,
        ),
      };

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primaryFixed", primaryFixed))
      ..add(ColorProperty("primaryFixedDim", primaryFixedDim))
      ..add(ColorProperty("onPrimaryFixed", onPrimaryFixed))
      ..add(ColorProperty("onPrimaryFixedVariant", onPrimaryFixedVariant))
      ..add(ColorProperty("secondaryFixed", secondaryFixed))
      ..add(ColorProperty("secondaryFixedDim", secondaryFixedDim))
      ..add(ColorProperty("onSecondaryFixed", onSecondaryFixed))
      ..add(ColorProperty("onSecondaryFixedVariant", onSecondaryFixedVariant))
      ..add(ColorProperty("tertiaryFixed", tertiaryFixed))
      ..add(ColorProperty("tertiaryFixedDim", tertiaryFixedDim))
      ..add(ColorProperty("onTertiaryFixed", onTertiaryFixed))
      ..add(ColorProperty("onTertiaryFixedVariant", onTertiaryFixedVariant))
      ..add(
        ColorProperty(
          "primaryPaletteKeyColorLight",
          primaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorLight",
          secondaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorLight",
          tertiaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColorLight",
          neutralPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorLight",
          neutralVariantPaletteKeyColorLight,
        ),
      )
      ..add(ColorProperty("backgroundLight", backgroundLight))
      ..add(ColorProperty("onBackgroundLight", onBackgroundLight))
      ..add(ColorProperty("surfaceLight", surfaceLight))
      ..add(ColorProperty("surfaceDimLight", surfaceDimLight))
      ..add(ColorProperty("surfaceBrightLight", surfaceBrightLight))
      ..add(
        ColorProperty(
          "surfaceContainerLowestLight",
          surfaceContainerLowestLight,
        ),
      )
      ..add(ColorProperty("surfaceContainerLowLight", surfaceContainerLowLight))
      ..add(ColorProperty("surfaceContainerLight", surfaceContainerLight))
      ..add(
        ColorProperty("surfaceContainerHighLight", surfaceContainerHighLight),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighestLight",
          surfaceContainerHighestLight,
        ),
      )
      ..add(ColorProperty("onSurfaceLight", onSurfaceLight))
      ..add(ColorProperty("surfaceVariantLight", surfaceVariantLight))
      ..add(ColorProperty("onSurfaceVariantLight", onSurfaceVariantLight))
      ..add(ColorProperty("outlineLight", outlineLight))
      ..add(ColorProperty("outlineVariantLight", outlineVariantLight))
      ..add(ColorProperty("inverseSurfaceLight", inverseSurfaceLight))
      ..add(ColorProperty("inverseOnSurfaceLight", inverseOnSurfaceLight))
      ..add(ColorProperty("shadowLight", shadowLight))
      ..add(ColorProperty("scrimLight", scrimLight))
      ..add(ColorProperty("surfaceTintLight", surfaceTintLight))
      ..add(ColorProperty("primaryLight", primaryLight))
      ..add(ColorProperty("onPrimaryLight", onPrimaryLight))
      ..add(ColorProperty("primaryContainerLight", primaryContainerLight))
      ..add(ColorProperty("onPrimaryContainerLight", onPrimaryContainerLight))
      ..add(ColorProperty("inversePrimaryLight", inversePrimaryLight))
      ..add(ColorProperty("secondaryLight", secondaryLight))
      ..add(ColorProperty("onSecondaryLight", onSecondaryLight))
      ..add(ColorProperty("secondaryContainerLight", secondaryContainerLight))
      ..add(
        ColorProperty("onSecondaryContainerLight", onSecondaryContainerLight),
      )
      ..add(ColorProperty("tertiaryLight", tertiaryLight))
      ..add(ColorProperty("onTertiaryLight", onTertiaryLight))
      ..add(ColorProperty("tertiaryContainerLight", tertiaryContainerLight))
      ..add(ColorProperty("onTertiaryContainerLight", onTertiaryContainerLight))
      ..add(ColorProperty("errorLight", errorLight))
      ..add(ColorProperty("onErrorLight", onErrorLight))
      ..add(ColorProperty("errorContainerLight", errorContainerLight))
      ..add(ColorProperty("onErrorContainerLight", onErrorContainerLight))
      ..add(
        ColorProperty("primaryPaletteKeyColorDark", primaryPaletteKeyColorDark),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorDark",
          secondaryPaletteKeyColorDark,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorDark",
          tertiaryPaletteKeyColorDark,
        ),
      )
      ..add(
        ColorProperty("neutralPaletteKeyColorDark", neutralPaletteKeyColorDark),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorDark",
          neutralVariantPaletteKeyColorDark,
        ),
      )
      ..add(ColorProperty("backgroundDark", backgroundDark))
      ..add(ColorProperty("onBackgroundDark", onBackgroundDark))
      ..add(ColorProperty("surfaceDark", surfaceDark))
      ..add(ColorProperty("surfaceDimDark", surfaceDimDark))
      ..add(ColorProperty("surfaceBrightDark", surfaceBrightDark))
      ..add(
        ColorProperty("surfaceContainerLowestDark", surfaceContainerLowestDark),
      )
      ..add(ColorProperty("surfaceContainerLowDark", surfaceContainerLowDark))
      ..add(ColorProperty("surfaceContainerDark", surfaceContainerDark))
      ..add(ColorProperty("surfaceContainerHighDark", surfaceContainerHighDark))
      ..add(
        ColorProperty(
          "surfaceContainerHighestDark",
          surfaceContainerHighestDark,
        ),
      )
      ..add(ColorProperty("onSurfaceDark", onSurfaceDark))
      ..add(ColorProperty("surfaceVariantDark", surfaceVariantDark))
      ..add(ColorProperty("onSurfaceVariantDark", onSurfaceVariantDark))
      ..add(ColorProperty("outlineDark", outlineDark))
      ..add(ColorProperty("outlineVariantDark", outlineVariantDark))
      ..add(ColorProperty("inverseSurfaceDark", inverseSurfaceDark))
      ..add(ColorProperty("inverseOnSurfaceDark", inverseOnSurfaceDark))
      ..add(ColorProperty("shadowDark", shadowDark))
      ..add(ColorProperty("scrimDark", scrimDark))
      ..add(ColorProperty("surfaceTintDark", surfaceTintDark))
      ..add(ColorProperty("primaryDark", primaryDark))
      ..add(ColorProperty("onPrimaryDark", onPrimaryDark))
      ..add(ColorProperty("primaryContainerDark", primaryContainerDark))
      ..add(ColorProperty("onPrimaryContainerDark", onPrimaryContainerDark))
      ..add(ColorProperty("inversePrimaryDark", inversePrimaryDark))
      ..add(ColorProperty("secondaryDark", secondaryDark))
      ..add(ColorProperty("onSecondaryDark", onSecondaryDark))
      ..add(ColorProperty("secondaryContainerDark", secondaryContainerDark))
      ..add(ColorProperty("onSecondaryContainerDark", onSecondaryContainerDark))
      ..add(ColorProperty("tertiaryDark", tertiaryDark))
      ..add(ColorProperty("onTertiaryDark", onTertiaryDark))
      ..add(ColorProperty("tertiaryContainerDark", tertiaryContainerDark))
      ..add(ColorProperty("onTertiaryContainerDark", onTertiaryContainerDark))
      ..add(ColorProperty("errorDark", errorDark))
      ..add(ColorProperty("onErrorDark", onErrorDark))
      ..add(ColorProperty("errorContainerDark", errorContainerDark))
      ..add(ColorProperty("onErrorContainerDark", onErrorContainerDark));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidSystemColorScheme34 &&
          primaryFixed == other.primaryFixed &&
          primaryFixedDim == other.primaryFixedDim &&
          onPrimaryFixed == other.onPrimaryFixed &&
          onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
          secondaryFixed == other.secondaryFixed &&
          secondaryFixedDim == other.secondaryFixedDim &&
          onSecondaryFixed == other.onSecondaryFixed &&
          onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
          tertiaryFixed == other.tertiaryFixed &&
          tertiaryFixedDim == other.tertiaryFixedDim &&
          onTertiaryFixed == other.onTertiaryFixed &&
          onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
          primaryPaletteKeyColorLight == other.primaryPaletteKeyColorLight &&
          secondaryPaletteKeyColorLight ==
              other.secondaryPaletteKeyColorLight &&
          tertiaryPaletteKeyColorLight == other.tertiaryPaletteKeyColorLight &&
          neutralPaletteKeyColorLight == other.neutralPaletteKeyColorLight &&
          neutralVariantPaletteKeyColorLight ==
              other.neutralVariantPaletteKeyColorLight &&
          backgroundLight == other.backgroundLight &&
          onBackgroundLight == other.onBackgroundLight &&
          surfaceLight == other.surfaceLight &&
          surfaceDimLight == other.surfaceDimLight &&
          surfaceBrightLight == other.surfaceBrightLight &&
          surfaceContainerLowestLight == other.surfaceContainerLowestLight &&
          surfaceContainerLowLight == other.surfaceContainerLowLight &&
          surfaceContainerLight == other.surfaceContainerLight &&
          surfaceContainerHighLight == other.surfaceContainerHighLight &&
          surfaceContainerHighestLight == other.surfaceContainerHighestLight &&
          onSurfaceLight == other.onSurfaceLight &&
          surfaceVariantLight == other.surfaceVariantLight &&
          onSurfaceVariantLight == other.onSurfaceVariantLight &&
          outlineLight == other.outlineLight &&
          outlineVariantLight == other.outlineVariantLight &&
          inverseSurfaceLight == other.inverseSurfaceLight &&
          inverseOnSurfaceLight == other.inverseOnSurfaceLight &&
          shadowLight == other.shadowLight &&
          scrimLight == other.scrimLight &&
          surfaceTintLight == other.surfaceTintLight &&
          primaryLight == other.primaryLight &&
          onPrimaryLight == other.onPrimaryLight &&
          primaryContainerLight == other.primaryContainerLight &&
          onPrimaryContainerLight == other.onPrimaryContainerLight &&
          inversePrimaryLight == other.inversePrimaryLight &&
          secondaryLight == other.secondaryLight &&
          onSecondaryLight == other.onSecondaryLight &&
          secondaryContainerLight == other.secondaryContainerLight &&
          onSecondaryContainerLight == other.onSecondaryContainerLight &&
          tertiaryLight == other.tertiaryLight &&
          onTertiaryLight == other.onTertiaryLight &&
          tertiaryContainerLight == other.tertiaryContainerLight &&
          onTertiaryContainerLight == other.onTertiaryContainerLight &&
          errorLight == other.errorLight &&
          onErrorLight == other.onErrorLight &&
          errorContainerLight == other.errorContainerLight &&
          onErrorContainerLight == other.onErrorContainerLight &&
          primaryPaletteKeyColorDark == other.primaryPaletteKeyColorDark &&
          secondaryPaletteKeyColorDark == other.secondaryPaletteKeyColorDark &&
          tertiaryPaletteKeyColorDark == other.tertiaryPaletteKeyColorDark &&
          neutralPaletteKeyColorDark == other.neutralPaletteKeyColorDark &&
          neutralVariantPaletteKeyColorDark ==
              other.neutralVariantPaletteKeyColorDark &&
          backgroundDark == other.backgroundDark &&
          onBackgroundDark == other.onBackgroundDark &&
          surfaceDark == other.surfaceDark &&
          surfaceDimDark == other.surfaceDimDark &&
          surfaceBrightDark == other.surfaceBrightDark &&
          surfaceContainerLowestDark == other.surfaceContainerLowestDark &&
          surfaceContainerLowDark == other.surfaceContainerLowDark &&
          surfaceContainerDark == other.surfaceContainerDark &&
          surfaceContainerHighDark == other.surfaceContainerHighDark &&
          surfaceContainerHighestDark == other.surfaceContainerHighestDark &&
          onSurfaceDark == other.onSurfaceDark &&
          surfaceVariantDark == other.surfaceVariantDark &&
          onSurfaceVariantDark == other.onSurfaceVariantDark &&
          outlineDark == other.outlineDark &&
          outlineVariantDark == other.outlineVariantDark &&
          inverseSurfaceDark == other.inverseSurfaceDark &&
          inverseOnSurfaceDark == other.inverseOnSurfaceDark &&
          shadowDark == other.shadowDark &&
          scrimDark == other.scrimDark &&
          surfaceTintDark == other.surfaceTintDark &&
          primaryDark == other.primaryDark &&
          onPrimaryDark == other.onPrimaryDark &&
          primaryContainerDark == other.primaryContainerDark &&
          onPrimaryContainerDark == other.onPrimaryContainerDark &&
          inversePrimaryDark == other.inversePrimaryDark &&
          secondaryDark == other.secondaryDark &&
          onSecondaryDark == other.onSecondaryDark &&
          secondaryContainerDark == other.secondaryContainerDark &&
          onSecondaryContainerDark == other.onSecondaryContainerDark &&
          tertiaryDark == other.tertiaryDark &&
          onTertiaryDark == other.onTertiaryDark &&
          tertiaryContainerDark == other.tertiaryContainerDark &&
          onTertiaryContainerDark == other.onTertiaryContainerDark &&
          errorDark == other.errorDark &&
          onErrorDark == other.onErrorDark &&
          errorContainerDark == other.errorContainerDark &&
          onErrorContainerDark == other.onErrorContainerDark;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    primaryPaletteKeyColorLight,
    secondaryPaletteKeyColorLight,
    tertiaryPaletteKeyColorLight,
    neutralPaletteKeyColorLight,
    neutralVariantPaletteKeyColorLight,
    backgroundLight,
    Object.hash(
      onBackgroundLight,
      surfaceLight,
      surfaceDimLight,
      surfaceBrightLight,
      surfaceContainerLowestLight,
      surfaceContainerLowLight,
      surfaceContainerLight,
      surfaceContainerHighLight,
      surfaceContainerHighestLight,
      onSurfaceLight,
      surfaceVariantLight,
      onSurfaceVariantLight,
      outlineLight,
      outlineVariantLight,
      inverseSurfaceLight,
      inverseOnSurfaceLight,
      shadowLight,
      scrimLight,
      surfaceTintLight,
      Object.hash(
        primaryLight,
        onPrimaryLight,
        primaryContainerLight,
        onPrimaryContainerLight,
        inversePrimaryLight,
        secondaryLight,
        onSecondaryLight,
        secondaryContainerLight,
        onSecondaryContainerLight,
        tertiaryLight,
        onTertiaryLight,
        tertiaryContainerLight,
        onTertiaryContainerLight,
        errorLight,
        onErrorLight,
        errorContainerLight,
        onErrorContainerLight,
        primaryPaletteKeyColorDark,
        secondaryPaletteKeyColorDark,
        Object.hash(
          tertiaryPaletteKeyColorDark,
          neutralPaletteKeyColorDark,
          neutralVariantPaletteKeyColorDark,
          backgroundDark,
          onBackgroundDark,
          surfaceDark,
          surfaceDimDark,
          surfaceBrightDark,
          surfaceContainerLowestDark,
          surfaceContainerLowDark,
          surfaceContainerDark,
          surfaceContainerHighDark,
          surfaceContainerHighestDark,
          onSurfaceDark,
          surfaceVariantDark,
          onSurfaceVariantDark,
          outlineDark,
          outlineVariantDark,
          inverseSurfaceDark,
          Object.hash(
            inverseOnSurfaceDark,
            shadowDark,
            scrimDark,
            surfaceTintDark,
            primaryDark,
            onPrimaryDark,
            primaryContainerDark,
            onPrimaryContainerDark,
            inversePrimaryDark,
            secondaryDark,
            onSecondaryDark,
            secondaryContainerDark,
            onSecondaryContainerDark,
            tertiaryDark,
            onTertiaryDark,
            tertiaryContainerDark,
            onTertiaryContainerDark,
            errorDark,
            onErrorDark,
            Object.hash(errorContainerDark, onErrorContainerDark),
          ),
        ),
      ),
    ),
  );
}

class _AndroidSystemColorScheme34 extends AndroidSystemColorScheme34 {
  const _AndroidSystemColorScheme34({
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.primaryPaletteKeyColorLight,
    required this.secondaryPaletteKeyColorLight,
    required this.tertiaryPaletteKeyColorLight,
    required this.neutralPaletteKeyColorLight,
    required this.neutralVariantPaletteKeyColorLight,
    required this.backgroundLight,
    required this.onBackgroundLight,
    required this.surfaceLight,
    required this.surfaceDimLight,
    required this.surfaceBrightLight,
    required this.surfaceContainerLowestLight,
    required this.surfaceContainerLowLight,
    required this.surfaceContainerLight,
    required this.surfaceContainerHighLight,
    required this.surfaceContainerHighestLight,
    required this.onSurfaceLight,
    required this.surfaceVariantLight,
    required this.onSurfaceVariantLight,
    required this.outlineLight,
    required this.outlineVariantLight,
    required this.inverseSurfaceLight,
    required this.inverseOnSurfaceLight,
    required this.shadowLight,
    required this.scrimLight,
    required this.surfaceTintLight,
    required this.primaryLight,
    required this.onPrimaryLight,
    required this.primaryContainerLight,
    required this.onPrimaryContainerLight,
    required this.inversePrimaryLight,
    required this.secondaryLight,
    required this.onSecondaryLight,
    required this.secondaryContainerLight,
    required this.onSecondaryContainerLight,
    required this.tertiaryLight,
    required this.onTertiaryLight,
    required this.tertiaryContainerLight,
    required this.onTertiaryContainerLight,
    required this.errorLight,
    required this.onErrorLight,
    required this.errorContainerLight,
    required this.onErrorContainerLight,
    required this.primaryPaletteKeyColorDark,
    required this.secondaryPaletteKeyColorDark,
    required this.tertiaryPaletteKeyColorDark,
    required this.neutralPaletteKeyColorDark,
    required this.neutralVariantPaletteKeyColorDark,
    required this.backgroundDark,
    required this.onBackgroundDark,
    required this.surfaceDark,
    required this.surfaceDimDark,
    required this.surfaceBrightDark,
    required this.surfaceContainerLowestDark,
    required this.surfaceContainerLowDark,
    required this.surfaceContainerDark,
    required this.surfaceContainerHighDark,
    required this.surfaceContainerHighestDark,
    required this.onSurfaceDark,
    required this.surfaceVariantDark,
    required this.onSurfaceVariantDark,
    required this.outlineDark,
    required this.outlineVariantDark,
    required this.inverseSurfaceDark,
    required this.inverseOnSurfaceDark,
    required this.shadowDark,
    required this.scrimDark,
    required this.surfaceTintDark,
    required this.primaryDark,
    required this.onPrimaryDark,
    required this.primaryContainerDark,
    required this.onPrimaryContainerDark,
    required this.inversePrimaryDark,
    required this.secondaryDark,
    required this.onSecondaryDark,
    required this.secondaryContainerDark,
    required this.onSecondaryContainerDark,
    required this.tertiaryDark,
    required this.onTertiaryDark,
    required this.tertiaryContainerDark,
    required this.onTertiaryContainerDark,
    required this.errorDark,
    required this.onErrorDark,
    required this.errorContainerDark,
    required this.onErrorContainerDark,
  });

  @override
  final Color primaryFixed;

  @override
  final Color primaryFixedDim;

  @override
  final Color onPrimaryFixed;

  @override
  final Color onPrimaryFixedVariant;

  @override
  final Color secondaryFixed;

  @override
  final Color secondaryFixedDim;

  @override
  final Color onSecondaryFixed;

  @override
  final Color onSecondaryFixedVariant;

  @override
  final Color tertiaryFixed;

  @override
  final Color tertiaryFixedDim;

  @override
  final Color onTertiaryFixed;

  @override
  final Color onTertiaryFixedVariant;

  @override
  final Color primaryPaletteKeyColorLight;

  @override
  final Color secondaryPaletteKeyColorLight;

  @override
  final Color tertiaryPaletteKeyColorLight;

  @override
  final Color neutralPaletteKeyColorLight;

  @override
  final Color neutralVariantPaletteKeyColorLight;

  @override
  final Color backgroundLight;

  @override
  final Color onBackgroundLight;

  @override
  final Color surfaceLight;

  @override
  final Color surfaceDimLight;

  @override
  final Color surfaceBrightLight;

  @override
  final Color surfaceContainerLowestLight;

  @override
  final Color surfaceContainerLowLight;

  @override
  final Color surfaceContainerLight;

  @override
  final Color surfaceContainerHighLight;

  @override
  final Color surfaceContainerHighestLight;

  @override
  final Color onSurfaceLight;

  @override
  final Color surfaceVariantLight;

  @override
  final Color onSurfaceVariantLight;

  @override
  final Color outlineLight;

  @override
  final Color outlineVariantLight;

  @override
  final Color inverseSurfaceLight;

  @override
  final Color inverseOnSurfaceLight;

  @override
  final Color shadowLight;

  @override
  final Color scrimLight;

  @override
  final Color surfaceTintLight;

  @override
  final Color primaryLight;

  @override
  final Color onPrimaryLight;

  @override
  final Color primaryContainerLight;

  @override
  final Color onPrimaryContainerLight;

  @override
  final Color inversePrimaryLight;

  @override
  final Color secondaryLight;

  @override
  final Color onSecondaryLight;

  @override
  final Color secondaryContainerLight;

  @override
  final Color onSecondaryContainerLight;

  @override
  final Color tertiaryLight;

  @override
  final Color onTertiaryLight;

  @override
  final Color tertiaryContainerLight;

  @override
  final Color onTertiaryContainerLight;

  @override
  final Color errorLight;

  @override
  final Color onErrorLight;

  @override
  final Color errorContainerLight;

  @override
  final Color onErrorContainerLight;

  @override
  final Color primaryPaletteKeyColorDark;

  @override
  final Color secondaryPaletteKeyColorDark;

  @override
  final Color tertiaryPaletteKeyColorDark;

  @override
  final Color neutralPaletteKeyColorDark;

  @override
  final Color neutralVariantPaletteKeyColorDark;

  @override
  final Color backgroundDark;

  @override
  final Color onBackgroundDark;

  @override
  final Color surfaceDark;

  @override
  final Color surfaceDimDark;

  @override
  final Color surfaceBrightDark;

  @override
  final Color surfaceContainerLowestDark;

  @override
  final Color surfaceContainerLowDark;

  @override
  final Color surfaceContainerDark;

  @override
  final Color surfaceContainerHighDark;

  @override
  final Color surfaceContainerHighestDark;

  @override
  final Color onSurfaceDark;

  @override
  final Color surfaceVariantDark;

  @override
  final Color onSurfaceVariantDark;

  @override
  final Color outlineDark;

  @override
  final Color outlineVariantDark;

  @override
  final Color inverseSurfaceDark;

  @override
  final Color inverseOnSurfaceDark;

  @override
  final Color shadowDark;

  @override
  final Color scrimDark;

  @override
  final Color surfaceTintDark;

  @override
  final Color primaryDark;

  @override
  final Color onPrimaryDark;

  @override
  final Color primaryContainerDark;

  @override
  final Color onPrimaryContainerDark;

  @override
  final Color inversePrimaryDark;

  @override
  final Color secondaryDark;

  @override
  final Color onSecondaryDark;

  @override
  final Color secondaryContainerDark;

  @override
  final Color onSecondaryContainerDark;

  @override
  final Color tertiaryDark;

  @override
  final Color onTertiaryDark;

  @override
  final Color tertiaryContainerDark;

  @override
  final Color onTertiaryContainerDark;

  @override
  final Color errorDark;

  @override
  final Color onErrorDark;

  @override
  final Color errorContainerDark;

  @override
  final Color onErrorContainerDark;
}
