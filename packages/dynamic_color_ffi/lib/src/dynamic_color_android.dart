import 'dart:io';

import 'package:flutter/material.dart' show Brightness, Color;
import 'package:jni/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';
import 'package:dynamic_color_ffi/dynamic_color_ffi_platform_interface.dart';

import 'jni_bindings.dart' as jb;

class DynamicColorAndroid extends DynamicColorPlatform {
  DynamicColorAndroid();

  @override
  bool isDynamicColorAvailable() =>
      Platform.isAndroid && jb.DynamicColorPlugin.isDynamicColorAvailable;

  @override
  DynamicColorScheme? dynamicLightColorScheme() => Platform.isAndroid
      ? androidApplicationContext
            .use(jb.DynamicColorPlugin.dynamicLightColorScheme)
            .use(_dynamicLightColorSchemeFromNative)
      : null;

  @override
  DynamicColorScheme? dynamicDarkColorScheme() => Platform.isAndroid
      ? androidApplicationContext
            .use(jb.DynamicColorPlugin.dynamicDarkColorScheme)
            .use(_dynamicDarkColorSchemeFromNative)
      : null;

  static void registerWith() {
    DynamicColorPlatform.instance = DynamicColorAndroid();
  }

  static DynamicColorScheme _dynamicLightColorSchemeFromNative(
    jb.DynamicColorScheme object,
  ) => _dynamicColorSchemeFromNative(object, brightness: .light);

  static DynamicColorScheme _dynamicDarkColorSchemeFromNative(
    jb.DynamicColorScheme object,
  ) => _dynamicColorSchemeFromNative(object, brightness: .dark);

  static DynamicColorScheme _dynamicColorSchemeFromNative(
    jb.DynamicColorScheme object, {
    required Brightness brightness,
  }) => DynamicColorScheme.from(
    brightness: brightness,
    primaryPaletteKeyColor: object.primaryPaletteKeyColor?._toFlutterColor(
      releaseOriginal: true,
    ),
    secondaryPaletteKeyColor: object.secondaryPaletteKeyColor?._toFlutterColor(
      releaseOriginal: true,
    ),
    tertiaryPaletteKeyColor: object.tertiaryPaletteKeyColor?._toFlutterColor(
      releaseOriginal: true,
    ),
    neutralPaletteKeyColor: object.neutralPaletteKeyColor?._toFlutterColor(
      releaseOriginal: true,
    ),
    neutralVariantPaletteKeyColor: object.neutralVariantPaletteKeyColor
        ?._toFlutterColor(releaseOriginal: true),
    errorPaletteKeyColor: object.errorPaletteKeyColor?._toFlutterColor(
      releaseOriginal: true,
    ),
    background: object.background?._toFlutterColor(releaseOriginal: true),
    onBackground: object.onBackground?._toFlutterColor(releaseOriginal: true),
    surface: object.surface?._toFlutterColor(releaseOriginal: true),
    surfaceDim: object.surfaceDim?._toFlutterColor(releaseOriginal: true),
    surfaceBright: object.surfaceBright?._toFlutterColor(releaseOriginal: true),
    surfaceContainerLowest: object.surfaceContainerLowest?._toFlutterColor(
      releaseOriginal: true,
    ),
    surfaceContainerLow: object.surfaceContainerLow?._toFlutterColor(
      releaseOriginal: true,
    ),
    surfaceContainer: object.surfaceContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    surfaceContainerHigh: object.surfaceContainerHigh?._toFlutterColor(
      releaseOriginal: true,
    ),
    surfaceContainerHighest: object.surfaceContainerHighest?._toFlutterColor(
      releaseOriginal: true,
    ),
    onSurface: object.onSurface?._toFlutterColor(releaseOriginal: true),
    surfaceVariant: object.surfaceVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    onSurfaceVariant: object.onSurfaceVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    outline: object.outline?._toFlutterColor(releaseOriginal: true),
    outlineVariant: object.outlineVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    inverseSurface: object.inverseSurface?._toFlutterColor(
      releaseOriginal: true,
    ),
    inverseOnSurface: object.inverseOnSurface?._toFlutterColor(
      releaseOriginal: true,
    ),
    shadow: object.shadow?._toFlutterColor(releaseOriginal: true),
    scrim: object.scrim?._toFlutterColor(releaseOriginal: true),
    surfaceTint: object.surfaceTint?._toFlutterColor(releaseOriginal: true),
    primary: object.primary?._toFlutterColor(releaseOriginal: true),
    primaryDim: object.primaryDim?._toFlutterColor(releaseOriginal: true),
    onPrimary: object.onPrimary?._toFlutterColor(releaseOriginal: true),
    primaryContainer: object.primaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    onPrimaryContainer: object.onPrimaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    primaryFixed: object.primaryFixed?._toFlutterColor(releaseOriginal: true),
    primaryFixedDim: object.primaryFixedDim?._toFlutterColor(
      releaseOriginal: true,
    ),
    onPrimaryFixed: object.onPrimaryFixed?._toFlutterColor(
      releaseOriginal: true,
    ),
    onPrimaryFixedVariant: object.onPrimaryFixedVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    inversePrimary: object.inversePrimary?._toFlutterColor(
      releaseOriginal: true,
    ),
    secondary: object.secondary?._toFlutterColor(releaseOriginal: true),
    secondaryDim: object.secondaryDim?._toFlutterColor(releaseOriginal: true),
    onSecondary: object.onSecondary?._toFlutterColor(releaseOriginal: true),
    secondaryContainer: object.secondaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    onSecondaryContainer: object.onSecondaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    secondaryFixed: object.secondaryFixed?._toFlutterColor(
      releaseOriginal: true,
    ),
    secondaryFixedDim: object.secondaryFixedDim?._toFlutterColor(
      releaseOriginal: true,
    ),
    onSecondaryFixed: object.onSecondaryFixed?._toFlutterColor(
      releaseOriginal: true,
    ),
    onSecondaryFixedVariant: object.onSecondaryFixedVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    tertiary: object.tertiary?._toFlutterColor(releaseOriginal: true),
    tertiaryDim: object.tertiaryDim?._toFlutterColor(releaseOriginal: true),
    onTertiary: object.onTertiary?._toFlutterColor(releaseOriginal: true),
    tertiaryContainer: object.tertiaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    onTertiaryContainer: object.onTertiaryContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    tertiaryFixed: object.tertiaryFixed?._toFlutterColor(releaseOriginal: true),
    tertiaryFixedDim: object.tertiaryFixedDim?._toFlutterColor(
      releaseOriginal: true,
    ),
    onTertiaryFixed: object.onTertiaryFixed?._toFlutterColor(
      releaseOriginal: true,
    ),
    onTertiaryFixedVariant: object.onTertiaryFixedVariant?._toFlutterColor(
      releaseOriginal: true,
    ),
    error: object.error?._toFlutterColor(releaseOriginal: true),
    errorDim: object.errorDim?._toFlutterColor(releaseOriginal: true),
    onError: object.onError?._toFlutterColor(releaseOriginal: true),
    errorContainer: object.errorContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
    onErrorContainer: object.onErrorContainer?._toFlutterColor(
      releaseOriginal: true,
    ),
  );
}

extension on JInteger {
  @pragma("vm:prefer-inline")
  Color _toFlutterColor({bool releaseOriginal = false}) =>
      Color(toDartInt(releaseOriginal: true));
}
