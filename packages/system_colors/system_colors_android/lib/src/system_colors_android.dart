import 'dart:ui';

import 'package:jni/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';
import 'package:system_colors_android/src/jni_bindings.g.dart' as jb;
import 'package:system_colors_android/system_colors_android.dart';
import 'package:system_colors_platform_interface/system_colors_platform_interface.dart';

const _sentinel = 0;

class SystemColorsAndroid() extends SystemColorsPlatform {
  AndroidColorScheme lightColorScheme() =>
      androidApplicationContext.use(_lightScheme).use(_lightFromNative);

  AndroidColorScheme darkColorScheme() =>
      androidApplicationContext.use(_darkScheme).use(_darkFromNative);

  AndroidColorScheme colorScheme(Brightness brightness) => switch (brightness) {
    .light => lightColorScheme(),
    .dark => darkColorScheme(),
  };

  static jb.DynamicColorScheme _lightScheme(JObject context) =>
      jb.SystemColorsPlugin.lightDynamicScheme(context, _sentinel);

  static jb.DynamicColorScheme _darkScheme(JObject context) =>
      jb.SystemColorsPlugin.darkDynamicScheme(context, _sentinel);

  static void registerWith() {
    SystemColorsPlatform.instance = SystemColorsAndroid();
  }
}

AndroidColorScheme _fromNative(
  jb.DynamicColorScheme scheme, {
  required Brightness brightness,
}) {
  final jb.DynamicColorScheme(
    :primaryPaletteKeyColor,
    :secondaryPaletteKeyColor,
    :tertiaryPaletteKeyColor,
    :neutralPaletteKeyColor,
    :neutralVariantPaletteKeyColor,
    :errorPaletteKeyColor,
    :background,
    :onBackground,
    :surface,
    :surfaceDim,
    :surfaceBright,
    :surfaceContainerLowest,
    :surfaceContainerLow,
    :surfaceContainer,
    :surfaceContainerHigh,
    :surfaceContainerHighest,
    :onSurface,
    :surfaceVariant,
    :onSurfaceVariant,
    :outline,
    :outlineVariant,
    :inverseSurface,
    :inverseOnSurface,
    :shadow,
    :scrim,
    :surfaceTint,
    :primary,
    :primaryDim,
    :onPrimary,
    :primaryContainer,
    :onPrimaryContainer,
    :primaryFixed,
    :primaryFixedDim,
    :onPrimaryFixed,
    :onPrimaryFixedVariant,
    :inversePrimary,
    :secondary,
    :secondaryDim,
    :onSecondary,
    :secondaryContainer,
    :onSecondaryContainer,
    :secondaryFixed,
    :secondaryFixedDim,
    :onSecondaryFixed,
    :onSecondaryFixedVariant,
    :tertiary,
    :tertiaryDim,
    :onTertiary,
    :tertiaryContainer,
    :onTertiaryContainer,
    :tertiaryFixed,
    :tertiaryFixedDim,
    :onTertiaryFixed,
    :onTertiaryFixedVariant,
    :error,
    :errorDim,
    :onError,
    :errorContainer,
    :onErrorContainer,
    :controlActivated,
    :controlNormal,
    :controlHighlight,
    :textPrimaryInverse,
    :textSecondaryAndTertiaryInverse,
    :textPrimaryInverseDisableOnly,
    :textSecondaryAndTertiaryInverseDisabled,
    :textHintInverse,
  ) = scheme;
  return .from(
    brightness: brightness,
    primaryPaletteKeyColor: primaryPaletteKeyColor != _sentinel
        ? Color(primaryPaletteKeyColor)
        : null,
    secondaryPaletteKeyColor: secondaryPaletteKeyColor != _sentinel
        ? Color(secondaryPaletteKeyColor)
        : null,
    tertiaryPaletteKeyColor: tertiaryPaletteKeyColor != _sentinel
        ? Color(tertiaryPaletteKeyColor)
        : null,
    neutralPaletteKeyColor: neutralPaletteKeyColor != _sentinel
        ? Color(neutralPaletteKeyColor)
        : null,
    neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor != _sentinel
        ? Color(neutralVariantPaletteKeyColor)
        : null,
    errorPaletteKeyColor: errorPaletteKeyColor != _sentinel
        ? Color(errorPaletteKeyColor)
        : null,
    background: background != _sentinel ? Color(background) : null,
    onBackground: onBackground != _sentinel ? Color(onBackground) : null,
    surface: surface != _sentinel ? Color(surface) : null,
    surfaceDim: surfaceDim != _sentinel ? Color(surfaceDim) : null,
    surfaceBright: surfaceBright != _sentinel ? Color(surfaceBright) : null,
    surfaceContainerLowest: surfaceContainerLowest != _sentinel
        ? Color(surfaceContainerLowest)
        : null,
    surfaceContainerLow: surfaceContainerLow != _sentinel
        ? Color(surfaceContainerLow)
        : null,
    surfaceContainer: surfaceContainer != _sentinel
        ? Color(surfaceContainer)
        : null,
    surfaceContainerHigh: surfaceContainerHigh != _sentinel
        ? Color(surfaceContainerHigh)
        : null,
    surfaceContainerHighest: surfaceContainerHighest != _sentinel
        ? Color(surfaceContainerHighest)
        : null,
    onSurface: onSurface != _sentinel ? Color(onSurface) : null,
    surfaceVariant: surfaceVariant != _sentinel ? Color(surfaceVariant) : null,
    onSurfaceVariant: onSurfaceVariant != _sentinel
        ? Color(onSurfaceVariant)
        : null,
    outline: outline != _sentinel ? Color(outline) : null,
    outlineVariant: outlineVariant != _sentinel ? Color(outlineVariant) : null,
    inverseSurface: inverseSurface != _sentinel ? Color(inverseSurface) : null,
    inverseOnSurface: inverseOnSurface != _sentinel
        ? Color(inverseOnSurface)
        : null,
    shadow: shadow != _sentinel ? Color(shadow) : null,
    scrim: scrim != _sentinel ? Color(scrim) : null,
    surfaceTint: surfaceTint != _sentinel ? Color(surfaceTint) : null,
    primary: primary != _sentinel ? Color(primary) : null,
    primaryDim: primaryDim != _sentinel ? Color(primaryDim) : null,
    onPrimary: onPrimary != _sentinel ? Color(onPrimary) : null,
    primaryContainer: primaryContainer != _sentinel
        ? Color(primaryContainer)
        : null,
    onPrimaryContainer: onPrimaryContainer != _sentinel
        ? Color(onPrimaryContainer)
        : null,
    primaryFixed: primaryFixed != _sentinel ? Color(primaryFixed) : null,
    primaryFixedDim: primaryFixedDim != _sentinel
        ? Color(primaryFixedDim)
        : null,
    onPrimaryFixed: onPrimaryFixed != _sentinel ? Color(onPrimaryFixed) : null,
    onPrimaryFixedVariant: onPrimaryFixedVariant != _sentinel
        ? Color(onPrimaryFixedVariant)
        : null,
    inversePrimary: inversePrimary != _sentinel ? Color(inversePrimary) : null,
    secondary: secondary != _sentinel ? Color(secondary) : null,
    secondaryDim: secondaryDim != _sentinel ? Color(secondaryDim) : null,
    onSecondary: onSecondary != _sentinel ? Color(onSecondary) : null,
    secondaryContainer: secondaryContainer != _sentinel
        ? Color(secondaryContainer)
        : null,
    onSecondaryContainer: onSecondaryContainer != _sentinel
        ? Color(onSecondaryContainer)
        : null,
    secondaryFixed: secondaryFixed != _sentinel ? Color(secondaryFixed) : null,
    secondaryFixedDim: secondaryFixedDim != _sentinel
        ? Color(secondaryFixedDim)
        : null,
    onSecondaryFixed: onSecondaryFixed != _sentinel
        ? Color(onSecondaryFixed)
        : null,
    onSecondaryFixedVariant: onSecondaryFixedVariant != _sentinel
        ? Color(onSecondaryFixedVariant)
        : null,
    tertiary: tertiary != _sentinel ? Color(tertiary) : null,
    tertiaryDim: tertiaryDim != _sentinel ? Color(tertiaryDim) : null,
    onTertiary: onTertiary != _sentinel ? Color(onTertiary) : null,
    tertiaryContainer: tertiaryContainer != _sentinel
        ? Color(tertiaryContainer)
        : null,
    onTertiaryContainer: onTertiaryContainer != _sentinel
        ? Color(onTertiaryContainer)
        : null,
    tertiaryFixed: tertiaryFixed != _sentinel ? Color(tertiaryFixed) : null,
    tertiaryFixedDim: tertiaryFixedDim != _sentinel
        ? Color(tertiaryFixedDim)
        : null,
    onTertiaryFixed: onTertiaryFixed != _sentinel
        ? Color(onTertiaryFixed)
        : null,
    onTertiaryFixedVariant: onTertiaryFixedVariant != _sentinel
        ? Color(onTertiaryFixedVariant)
        : null,
    error: error != _sentinel ? Color(error) : null,
    errorDim: errorDim != _sentinel ? Color(errorDim) : null,
    onError: onError != _sentinel ? Color(onError) : null,
    errorContainer: errorContainer != _sentinel ? Color(errorContainer) : null,
    onErrorContainer: onErrorContainer != _sentinel
        ? Color(onErrorContainer)
        : null,
    controlActivated: controlActivated != _sentinel
        ? Color(controlActivated)
        : null,
    controlNormal: controlNormal != _sentinel ? Color(controlNormal) : null,
    controlHighlight: controlHighlight != _sentinel
        ? Color(controlHighlight)
        : null,
    textPrimaryInverse: textPrimaryInverse != _sentinel
        ? Color(textPrimaryInverse)
        : null,
    textSecondaryAndTertiaryInverse:
        textSecondaryAndTertiaryInverse != _sentinel
        ? Color(textSecondaryAndTertiaryInverse)
        : null,
    textPrimaryInverseDisableOnly: textPrimaryInverseDisableOnly != _sentinel
        ? Color(textPrimaryInverseDisableOnly)
        : null,
    textSecondaryAndTertiaryInverseDisabled:
        textSecondaryAndTertiaryInverseDisabled != _sentinel
        ? Color(textSecondaryAndTertiaryInverseDisabled)
        : null,
    textHintInverse: textHintInverse != _sentinel
        ? Color(textHintInverse)
        : null,
  );
}

AndroidColorScheme _lightFromNative(jb.DynamicColorScheme scheme) =>
    _fromNative(scheme, brightness: .light);

AndroidColorScheme _darkFromNative(jb.DynamicColorScheme scheme) =>
    _fromNative(scheme, brightness: .dark);

// /// Set the luminance (tone) of this color. Chroma may decrease because chroma
// /// has a different maximum for any given hue and luminance.
// int _setLuminance(int argb, double newLuminance) {
//   if (newLuminance < 0.0001 || newLuminance > 99.9999) {
//     return ColorUtils.argbFromLstar(newLuminance);
//   }
//   // Base color.
//   final baseCam = Cam16.fromInt(argb);
//   return Cam16.getInt(baseCam.hue, baseCam.chroma, newLuminance);
// }
