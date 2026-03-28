// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:libmonet/material_color_utilities.dart' show ColorUtils, Cam16;
import 'package:system_colors_android/system_colors_android.dart';

abstract class AndroidSystemTonalPalette with Diagnosticable {
  const AndroidSystemTonalPalette();

  const factory AndroidSystemTonalPalette.from({
    required Color primary0,
    required Color primary10,
    required Color primary20,
    required Color primary30,
    required Color primary40,
    required Color primary50,
    required Color primary60,
    required Color primary70,
    required Color primary80,
    required Color primary90,
    required Color primary95,
    required Color primary98,
    required Color primary99,
    required Color primary100,
    required Color secondary0,
    required Color secondary10,
    required Color secondary20,
    required Color secondary30,
    required Color secondary40,
    required Color secondary50,
    required Color secondary60,
    required Color secondary70,
    required Color secondary80,
    required Color secondary90,
    required Color secondary95,
    required Color secondary98,
    required Color secondary99,
    required Color secondary100,
    required Color tertiary0,
    required Color tertiary10,
    required Color tertiary20,
    required Color tertiary30,
    required Color tertiary40,
    required Color tertiary50,
    required Color tertiary60,
    required Color tertiary70,
    required Color tertiary80,
    required Color tertiary90,
    required Color tertiary95,
    required Color tertiary98,
    required Color tertiary99,
    required Color tertiary100,
    required Color neutral0,
    required Color neutral4,
    required Color neutral6,
    required Color neutral10,
    required Color neutral12,
    required Color neutral17,
    required Color neutral20,
    required Color neutral22,
    required Color neutral24,
    required Color neutral30,
    required Color neutral40,
    required Color neutral50,
    required Color neutral60,
    required Color neutral70,
    required Color neutral80,
    required Color neutral87,
    required Color neutral90,
    required Color neutral92,
    required Color neutral94,
    required Color neutral95,
    required Color neutral96,
    required Color neutral98,
    required Color neutral99,
    required Color neutral100,
    required Color neutralVariant0,
    required Color neutralVariant10,
    required Color neutralVariant20,
    required Color neutralVariant30,
    required Color neutralVariant40,
    required Color neutralVariant50,
    required Color neutralVariant60,
    required Color neutralVariant70,
    required Color neutralVariant80,
    required Color neutralVariant90,
    required Color neutralVariant95,
    required Color neutralVariant98,
    required Color neutralVariant99,
    required Color neutralVariant100,
    required Color error0,
    required Color error10,
    required Color error20,
    required Color error30,
    required Color error40,
    required Color error50,
    required Color error60,
    required Color error70,
    required Color error80,
    required Color error90,
    required Color error95,
    required Color error98,
    required Color error99,
    required Color error100,
  }) = _AndroidSystemTonalPalette;

  factory AndroidSystemTonalPalette.fromSystemPalette(
    AndroidSystemPalette palette,
  ) => switch (palette) {
    AndroidSystemPalette35() => ._fromSystemPalette35(palette),
    AndroidSystemPalette31() => ._fromSystemPalette31(palette),
    _ => _fallback,
  };

  factory AndroidSystemTonalPalette._fromSystemPalette31(
    AndroidSystemPalette31 palette,
  ) => .from(
    // Primary
    primary0: palette.primary1000,
    primary10: palette.primary900,
    primary20: palette.primary800,
    primary30: palette.primary700,
    primary40: palette.primary600,
    primary50: palette.primary500,
    primary60: palette.primary400,
    primary70: palette.primary300,
    primary80: palette.primary200,
    primary90: palette.primary100,
    primary95: palette.primary50,
    primary98: palette.primary600._setLuminance(98.0),
    primary99: palette.primary10,
    primary100: palette.primary0,
    // Secondary
    secondary0: palette.secondary1000,
    secondary10: palette.secondary900,
    secondary20: palette.secondary800,
    secondary30: palette.secondary700,
    secondary40: palette.secondary600,
    secondary50: palette.secondary500,
    secondary60: palette.secondary400,
    secondary70: palette.secondary300,
    secondary80: palette.secondary200,
    secondary90: palette.secondary100,
    secondary95: palette.secondary50,
    secondary98: palette.secondary600._setLuminance(98.0),
    secondary99: palette.secondary10,
    secondary100: palette.secondary0,
    // Tertiary
    tertiary0: palette.tertiary1000,
    tertiary10: palette.tertiary900,
    tertiary20: palette.tertiary800,
    tertiary30: palette.tertiary700,
    tertiary40: palette.tertiary600,
    tertiary50: palette.tertiary500,
    tertiary60: palette.tertiary400,
    tertiary70: palette.tertiary300,
    tertiary80: palette.tertiary200,
    tertiary90: palette.tertiary100,
    tertiary95: palette.tertiary50,
    tertiary98: palette.tertiary600._setLuminance(98.0),
    tertiary99: palette.tertiary10,
    tertiary100: palette.tertiary0,
    // Neutral
    neutral0: palette.neutral1000,
    neutral4: palette.neutral600._setLuminance(4.0),
    neutral6: palette.neutral600._setLuminance(6.0),
    neutral10: palette.neutral900,
    neutral12: palette.neutral600._setLuminance(12.0),
    neutral17: palette.neutral600._setLuminance(17.0),
    neutral20: palette.neutral800,
    neutral22: palette.neutral600._setLuminance(22.0),
    neutral24: palette.neutral600._setLuminance(24.0),
    neutral30: palette.neutral700,
    neutral40: palette.neutral600,
    neutral50: palette.neutral500,
    neutral60: palette.neutral400,
    neutral70: palette.neutral300,
    neutral80: palette.neutral200,
    neutral87: palette.neutral600._setLuminance(87.0),
    neutral90: palette.neutral100,
    neutral92: palette.neutral600._setLuminance(92.0),
    neutral94: palette.neutral600._setLuminance(94.0),
    neutral95: palette.neutral50,
    neutral96: palette.neutral600._setLuminance(96.0),
    neutral98: palette.neutral600._setLuminance(98.0),
    neutral99: palette.neutral10,
    neutral100: palette.neutral0,
    // Neutral variant
    neutralVariant0: palette.neutralVariant1000,
    neutralVariant10: palette.neutralVariant900,
    neutralVariant20: palette.neutralVariant800,
    neutralVariant30: palette.neutralVariant700,
    neutralVariant40: palette.neutralVariant600,
    neutralVariant50: palette.neutralVariant500,
    neutralVariant60: palette.neutralVariant400,
    neutralVariant70: palette.neutralVariant300,
    neutralVariant80: palette.neutralVariant200,
    neutralVariant90: palette.neutralVariant100,
    neutralVariant95: palette.neutralVariant50,
    neutralVariant98: palette.neutralVariant600._setLuminance(98.0),
    neutralVariant99: palette.neutralVariant10,
    neutralVariant100: palette.neutralVariant0,
    // Error
    error0: _fallback.error0,
    error10: _fallback.error10,
    error20: _fallback.error20,
    error30: _fallback.error30,
    error40: _fallback.error40,
    error50: _fallback.error50,
    error60: _fallback.error60,
    error70: _fallback.error70,
    error80: _fallback.error80,
    error90: _fallback.error90,
    error95: _fallback.error95,
    error98: _fallback.error98,
    error99: _fallback.error99,
    error100: _fallback.error100,
  );

  factory AndroidSystemTonalPalette._fromSystemPalette35(
    AndroidSystemPalette35 palette,
  ) => .from(
    // Primary
    primary0: palette.primary1000,
    primary10: palette.primary900,
    primary20: palette.primary800,
    primary30: palette.primary700,
    primary40: palette.primary600,
    primary50: palette.primary500,
    primary60: palette.primary400,
    primary70: palette.primary300,
    primary80: palette.primary200,
    primary90: palette.primary100,
    primary95: palette.primary50,
    primary98: palette.primary600._setLuminance(98.0),
    primary99: palette.primary10,
    primary100: palette.primary0,
    // Secondary
    secondary0: palette.secondary1000,
    secondary10: palette.secondary900,
    secondary20: palette.secondary800,
    secondary30: palette.secondary700,
    secondary40: palette.secondary600,
    secondary50: palette.secondary500,
    secondary60: palette.secondary400,
    secondary70: palette.secondary300,
    secondary80: palette.secondary200,
    secondary90: palette.secondary100,
    secondary95: palette.secondary50,
    secondary98: palette.secondary600._setLuminance(98.0),
    secondary99: palette.secondary10,
    secondary100: palette.secondary0,
    // Tertiary
    tertiary0: palette.tertiary1000,
    tertiary10: palette.tertiary900,
    tertiary20: palette.tertiary800,
    tertiary30: palette.tertiary700,
    tertiary40: palette.tertiary600,
    tertiary50: palette.tertiary500,
    tertiary60: palette.tertiary400,
    tertiary70: palette.tertiary300,
    tertiary80: palette.tertiary200,
    tertiary90: palette.tertiary100,
    tertiary95: palette.tertiary50,
    tertiary98: palette.tertiary600._setLuminance(98.0),
    tertiary99: palette.tertiary10,
    tertiary100: palette.tertiary0,
    // Neutral
    neutral0: palette.neutral1000,
    neutral4: palette.neutral600._setLuminance(4.0),
    neutral6: palette.neutral600._setLuminance(6.0),
    neutral10: palette.neutral900,
    neutral12: palette.neutral600._setLuminance(12.0),
    neutral17: palette.neutral600._setLuminance(17.0),
    neutral20: palette.neutral800,
    neutral22: palette.neutral600._setLuminance(22.0),
    neutral24: palette.neutral600._setLuminance(24.0),
    neutral30: palette.neutral700,
    neutral40: palette.neutral600,
    neutral50: palette.neutral500,
    neutral60: palette.neutral400,
    neutral70: palette.neutral300,
    neutral80: palette.neutral200,
    neutral87: palette.neutral600._setLuminance(87.0),
    neutral90: palette.neutral100,
    neutral92: palette.neutral600._setLuminance(92.0),
    neutral94: palette.neutral600._setLuminance(94.0),
    neutral95: palette.neutral50,
    neutral96: palette.neutral600._setLuminance(96.0),
    neutral98: palette.neutral600._setLuminance(98.0),
    neutral99: palette.neutral10,
    neutral100: palette.neutral0,
    // Neutral variant
    neutralVariant0: palette.neutralVariant1000,
    neutralVariant10: palette.neutralVariant900,
    neutralVariant20: palette.neutralVariant800,
    neutralVariant30: palette.neutralVariant700,
    neutralVariant40: palette.neutralVariant600,
    neutralVariant50: palette.neutralVariant500,
    neutralVariant60: palette.neutralVariant400,
    neutralVariant70: palette.neutralVariant300,
    neutralVariant80: palette.neutralVariant200,
    neutralVariant90: palette.neutralVariant100,
    neutralVariant95: palette.neutralVariant50,
    neutralVariant98: palette.neutralVariant600._setLuminance(98.0),
    neutralVariant99: palette.neutralVariant10,
    neutralVariant100: palette.neutralVariant0,
    // Error
    error0: palette.error1000,
    error10: palette.error900,
    error20: palette.error800,
    error30: palette.error700,
    error40: palette.error600,
    error50: palette.error500,
    error60: palette.error400,
    error70: palette.error300,
    error80: palette.error200,
    error90: palette.error100,
    error95: palette.error50,
    error98: palette.error600._setLuminance(98.0),
    error99: palette.error10,
    error100: palette.error0,
  );

  Color get primary0;
  Color get primary10;
  Color get primary20;
  Color get primary30;
  Color get primary40;
  Color get primary50;
  Color get primary60;
  Color get primary70;
  Color get primary80;
  Color get primary90;
  Color get primary95;
  Color get primary98;
  Color get primary99;
  Color get primary100;
  Color get secondary0;
  Color get secondary10;
  Color get secondary20;
  Color get secondary30;
  Color get secondary40;
  Color get secondary50;
  Color get secondary60;
  Color get secondary70;
  Color get secondary80;
  Color get secondary90;
  Color get secondary95;
  Color get secondary98;
  Color get secondary99;
  Color get secondary100;
  Color get tertiary0;
  Color get tertiary10;
  Color get tertiary20;
  Color get tertiary30;
  Color get tertiary40;
  Color get tertiary50;
  Color get tertiary60;
  Color get tertiary70;
  Color get tertiary80;
  Color get tertiary90;
  Color get tertiary95;
  Color get tertiary98;
  Color get tertiary99;
  Color get tertiary100;
  Color get neutral0;
  Color get neutral4;
  Color get neutral6;
  Color get neutral10;
  Color get neutral12;
  Color get neutral17;
  Color get neutral20;
  Color get neutral22;
  Color get neutral24;
  Color get neutral30;
  Color get neutral40;
  Color get neutral50;
  Color get neutral60;
  Color get neutral70;
  Color get neutral80;
  Color get neutral87;
  Color get neutral90;
  Color get neutral92;
  Color get neutral94;
  Color get neutral95;
  Color get neutral96;
  Color get neutral98;
  Color get neutral99;
  Color get neutral100;
  Color get neutralVariant0;
  Color get neutralVariant10;
  Color get neutralVariant20;
  Color get neutralVariant30;
  Color get neutralVariant40;
  Color get neutralVariant50;
  Color get neutralVariant60;
  Color get neutralVariant70;
  Color get neutralVariant80;
  Color get neutralVariant90;
  Color get neutralVariant95;
  Color get neutralVariant98;
  Color get neutralVariant99;
  Color get neutralVariant100;
  Color get error0;
  Color get error10;
  Color get error20;
  Color get error30;
  Color get error40;
  Color get error50;
  Color get error60;
  Color get error70;
  Color get error80;
  Color get error90;
  Color get error95;
  Color get error98;
  Color get error99;
  Color get error100;

  // TODO: add contrast level
  ColorScheme toColorScheme({required Brightness brightness}) =>
      switch (brightness) {
        .light => ColorScheme(
          brightness: brightness,
          primary: primary40,
          onPrimary: primary100,
          primaryContainer: primary90,
          onPrimaryContainer: primary30,
          secondary: secondary40,
          onSecondary: secondary100,
          secondaryContainer: secondary90,
          onSecondaryContainer: secondary30,
          tertiary: tertiary40,
          onTertiary: tertiary100,
          tertiaryContainer: tertiary90,
          onTertiaryContainer: tertiary30,
          error: error40,
          onError: error100,
          errorContainer: error90,
          onErrorContainer: error30,
          surface: neutral98,
          onSurface: neutral10,
          surfaceVariant: neutralVariant90,
          onSurfaceVariant: neutralVariant30,
          surfaceContainerHighest: neutral90,
          surfaceContainerHigh: neutral92,
          surfaceContainer: neutral94,
          surfaceContainerLow: neutral96,
          surfaceContainerLowest: neutral100,
          inverseSurface: neutral20,
          onInverseSurface: neutral95,
          outline: neutralVariant50,
          outlineVariant: neutralVariant80,
          primaryFixed: primary90,
          onPrimaryFixed: primary10,
          primaryFixedDim: primary80,
          onPrimaryFixedVariant: primary30,
          inversePrimary: primary80,
          secondaryFixed: secondary90,
          onSecondaryFixed: secondary10,
          secondaryFixedDim: secondary80,
          onSecondaryFixedVariant: secondary30,
          tertiaryFixed: tertiary90,
          onTertiaryFixed: tertiary10,
          tertiaryFixedDim: tertiary80,
          onTertiaryFixedVariant: tertiary30,
          surfaceBright: neutral98,
          surfaceDim: neutral87,
        ),
        .dark => ColorScheme(
          brightness: brightness,
          primary: primary80,
          onPrimary: primary20,
          primaryContainer: primary30,
          onPrimaryContainer: primary90,
          secondary: secondary80,
          onSecondary: secondary20,
          secondaryContainer: secondary30,
          onSecondaryContainer: secondary90,
          tertiary: tertiary80,
          onTertiary: tertiary20,
          tertiaryContainer: tertiary30,
          onTertiaryContainer: tertiary90,
          error: error80,
          onError: error20,
          errorContainer: error30,
          onErrorContainer: error90,
          surface: neutral6,
          onSurface: neutral90,
          surfaceVariant: neutralVariant30,
          onSurfaceVariant: neutralVariant80,
          surfaceContainerHighest: neutral22,
          surfaceContainerHigh: neutral17,
          surfaceContainer: neutral12,
          surfaceContainerLow: neutral10,
          surfaceContainerLowest: neutral4,
          inverseSurface: neutral90,
          onInverseSurface: neutral20,
          outline: neutralVariant60,
          outlineVariant: neutralVariant30,
          primaryFixed: primary90,
          onPrimaryFixed: primary10,
          primaryFixedDim: primary80,
          onPrimaryFixedVariant: primary30,
          inversePrimary: primary40,
          secondaryFixed: secondary90,
          onSecondaryFixed: secondary10,
          secondaryFixedDim: secondary80,
          onSecondaryFixedVariant: secondary30,
          tertiaryFixed: tertiary90,
          onTertiaryFixed: tertiary10,
          tertiaryFixedDim: tertiary80,
          onTertiaryFixedVariant: tertiary30,
          surfaceBright: neutral24,
          surfaceDim: neutral6,
        ),
      };

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primary0", primary0))
      ..add(ColorProperty("primary10", primary10))
      ..add(ColorProperty("primary20", primary20))
      ..add(ColorProperty("primary30", primary30))
      ..add(ColorProperty("primary40", primary40))
      ..add(ColorProperty("primary50", primary50))
      ..add(ColorProperty("primary60", primary60))
      ..add(ColorProperty("primary70", primary70))
      ..add(ColorProperty("primary80", primary80))
      ..add(ColorProperty("primary90", primary90))
      ..add(ColorProperty("primary95", primary95))
      ..add(ColorProperty("primary98", primary98))
      ..add(ColorProperty("primary99", primary99))
      ..add(ColorProperty("primary100", primary100))
      ..add(ColorProperty("secondary0", secondary0))
      ..add(ColorProperty("secondary10", secondary10))
      ..add(ColorProperty("secondary20", secondary20))
      ..add(ColorProperty("secondary30", secondary30))
      ..add(ColorProperty("secondary40", secondary40))
      ..add(ColorProperty("secondary50", secondary50))
      ..add(ColorProperty("secondary60", secondary60))
      ..add(ColorProperty("secondary70", secondary70))
      ..add(ColorProperty("secondary80", secondary80))
      ..add(ColorProperty("secondary90", secondary90))
      ..add(ColorProperty("secondary95", secondary95))
      ..add(ColorProperty("secondary98", secondary98))
      ..add(ColorProperty("secondary99", secondary99))
      ..add(ColorProperty("secondary100", secondary100))
      ..add(ColorProperty("tertiary0", tertiary0))
      ..add(ColorProperty("tertiary10", tertiary10))
      ..add(ColorProperty("tertiary20", tertiary20))
      ..add(ColorProperty("tertiary30", tertiary30))
      ..add(ColorProperty("tertiary40", tertiary40))
      ..add(ColorProperty("tertiary50", tertiary50))
      ..add(ColorProperty("tertiary60", tertiary60))
      ..add(ColorProperty("tertiary70", tertiary70))
      ..add(ColorProperty("tertiary80", tertiary80))
      ..add(ColorProperty("tertiary90", tertiary90))
      ..add(ColorProperty("tertiary95", tertiary95))
      ..add(ColorProperty("tertiary98", tertiary98))
      ..add(ColorProperty("tertiary99", tertiary99))
      ..add(ColorProperty("tertiary100", tertiary100))
      ..add(ColorProperty("neutral0", neutral0))
      ..add(ColorProperty("neutral4", neutral4))
      ..add(ColorProperty("neutral6", neutral6))
      ..add(ColorProperty("neutral10", neutral10))
      ..add(ColorProperty("neutral12", neutral12))
      ..add(ColorProperty("neutral17", neutral17))
      ..add(ColorProperty("neutral20", neutral20))
      ..add(ColorProperty("neutral22", neutral22))
      ..add(ColorProperty("neutral24", neutral24))
      ..add(ColorProperty("neutral30", neutral30))
      ..add(ColorProperty("neutral40", neutral40))
      ..add(ColorProperty("neutral50", neutral50))
      ..add(ColorProperty("neutral60", neutral60))
      ..add(ColorProperty("neutral70", neutral70))
      ..add(ColorProperty("neutral80", neutral80))
      ..add(ColorProperty("neutral87", neutral87))
      ..add(ColorProperty("neutral90", neutral90))
      ..add(ColorProperty("neutral92", neutral92))
      ..add(ColorProperty("neutral94", neutral94))
      ..add(ColorProperty("neutral95", neutral95))
      ..add(ColorProperty("neutral96", neutral96))
      ..add(ColorProperty("neutral98", neutral98))
      ..add(ColorProperty("neutral99", neutral99))
      ..add(ColorProperty("neutral100", neutral100))
      ..add(ColorProperty("neutralVariant0", neutralVariant0))
      ..add(ColorProperty("neutralVariant10", neutralVariant10))
      ..add(ColorProperty("neutralVariant20", neutralVariant20))
      ..add(ColorProperty("neutralVariant30", neutralVariant30))
      ..add(ColorProperty("neutralVariant40", neutralVariant40))
      ..add(ColorProperty("neutralVariant50", neutralVariant50))
      ..add(ColorProperty("neutralVariant60", neutralVariant60))
      ..add(ColorProperty("neutralVariant70", neutralVariant70))
      ..add(ColorProperty("neutralVariant80", neutralVariant80))
      ..add(ColorProperty("neutralVariant90", neutralVariant90))
      ..add(ColorProperty("neutralVariant95", neutralVariant95))
      ..add(ColorProperty("neutralVariant98", neutralVariant98))
      ..add(ColorProperty("neutralVariant99", neutralVariant99))
      ..add(ColorProperty("neutralVariant100", neutralVariant100))
      ..add(ColorProperty("error0", error0))
      ..add(ColorProperty("error10", error10))
      ..add(ColorProperty("error20", error20))
      ..add(ColorProperty("error30", error30))
      ..add(ColorProperty("error40", error40))
      ..add(ColorProperty("error50", error50))
      ..add(ColorProperty("error60", error60))
      ..add(ColorProperty("error70", error70))
      ..add(ColorProperty("error80", error80))
      ..add(ColorProperty("error90", error90))
      ..add(ColorProperty("error95", error95))
      ..add(ColorProperty("error98", error98))
      ..add(ColorProperty("error99", error99))
      ..add(ColorProperty("error100", error100));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidSystemTonalPalette &&
          primary0 == other.primary0 &&
          primary10 == other.primary10 &&
          primary20 == other.primary20 &&
          primary30 == other.primary30 &&
          primary40 == other.primary40 &&
          primary50 == other.primary50 &&
          primary60 == other.primary60 &&
          primary70 == other.primary70 &&
          primary80 == other.primary80 &&
          primary90 == other.primary90 &&
          primary95 == other.primary95 &&
          primary98 == other.primary98 &&
          primary99 == other.primary99 &&
          primary100 == other.primary100 &&
          secondary0 == other.secondary0 &&
          secondary10 == other.secondary10 &&
          secondary20 == other.secondary20 &&
          secondary30 == other.secondary30 &&
          secondary40 == other.secondary40 &&
          secondary50 == other.secondary50 &&
          secondary60 == other.secondary60 &&
          secondary70 == other.secondary70 &&
          secondary80 == other.secondary80 &&
          secondary90 == other.secondary90 &&
          secondary95 == other.secondary95 &&
          secondary98 == other.secondary98 &&
          secondary99 == other.secondary99 &&
          secondary100 == other.secondary100 &&
          tertiary0 == other.tertiary0 &&
          tertiary10 == other.tertiary10 &&
          tertiary20 == other.tertiary20 &&
          tertiary30 == other.tertiary30 &&
          tertiary40 == other.tertiary40 &&
          tertiary50 == other.tertiary50 &&
          tertiary60 == other.tertiary60 &&
          tertiary70 == other.tertiary70 &&
          tertiary80 == other.tertiary80 &&
          tertiary90 == other.tertiary90 &&
          tertiary95 == other.tertiary95 &&
          tertiary98 == other.tertiary98 &&
          tertiary99 == other.tertiary99 &&
          tertiary100 == other.tertiary100 &&
          neutral0 == other.neutral0 &&
          neutral4 == other.neutral4 &&
          neutral6 == other.neutral6 &&
          neutral10 == other.neutral10 &&
          neutral12 == other.neutral12 &&
          neutral17 == other.neutral17 &&
          neutral20 == other.neutral20 &&
          neutral22 == other.neutral22 &&
          neutral24 == other.neutral24 &&
          neutral30 == other.neutral30 &&
          neutral40 == other.neutral40 &&
          neutral50 == other.neutral50 &&
          neutral60 == other.neutral60 &&
          neutral70 == other.neutral70 &&
          neutral80 == other.neutral80 &&
          neutral87 == other.neutral87 &&
          neutral90 == other.neutral90 &&
          neutral92 == other.neutral92 &&
          neutral94 == other.neutral94 &&
          neutral95 == other.neutral95 &&
          neutral96 == other.neutral96 &&
          neutral98 == other.neutral98 &&
          neutral99 == other.neutral99 &&
          neutral100 == other.neutral100 &&
          neutralVariant0 == other.neutralVariant0 &&
          neutralVariant10 == other.neutralVariant10 &&
          neutralVariant20 == other.neutralVariant20 &&
          neutralVariant30 == other.neutralVariant30 &&
          neutralVariant40 == other.neutralVariant40 &&
          neutralVariant50 == other.neutralVariant50 &&
          neutralVariant60 == other.neutralVariant60 &&
          neutralVariant70 == other.neutralVariant70 &&
          neutralVariant80 == other.neutralVariant80 &&
          neutralVariant90 == other.neutralVariant90 &&
          neutralVariant95 == other.neutralVariant95 &&
          neutralVariant98 == other.neutralVariant98 &&
          neutralVariant99 == other.neutralVariant99 &&
          neutralVariant100 == other.neutralVariant100 &&
          error0 == other.error0 &&
          error10 == other.error10 &&
          error20 == other.error20 &&
          error30 == other.error30 &&
          error40 == other.error40 &&
          error50 == other.error50 &&
          error60 == other.error60 &&
          error70 == other.error70 &&
          error80 == other.error80 &&
          error90 == other.error90 &&
          error95 == other.error95 &&
          error98 == other.error98 &&
          error99 == other.error99 &&
          error100 == other.error100;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary0,
    primary10,
    primary20,
    primary30,
    primary40,
    primary50,
    primary60,
    primary70,
    primary80,
    primary90,
    primary95,
    primary98,
    primary99,
    primary100,
    secondary0,
    secondary10,
    secondary20,
    secondary30,
    Object.hash(
      secondary40,
      secondary50,
      secondary60,
      secondary70,
      secondary80,
      secondary90,
      secondary95,
      secondary98,
      secondary99,
      secondary100,
      tertiary0,
      tertiary10,
      tertiary20,
      tertiary30,
      tertiary40,
      tertiary50,
      tertiary60,
      tertiary70,
      tertiary80,
      Object.hash(
        tertiary90,
        tertiary95,
        tertiary98,
        tertiary99,
        tertiary100,
        neutral0,
        neutral4,
        neutral6,
        neutral10,
        neutral12,
        neutral17,
        neutral20,
        neutral22,
        neutral24,
        neutral30,
        neutral40,
        neutral50,
        neutral60,
        neutral70,
        Object.hash(
          neutral80,
          neutral87,
          neutral90,
          neutral92,
          neutral94,
          neutral95,
          neutral96,
          neutral98,
          neutral99,
          neutral100,
          neutralVariant0,
          neutralVariant10,
          neutralVariant20,
          neutralVariant30,
          neutralVariant40,
          neutralVariant50,
          neutralVariant60,
          neutralVariant70,
          neutralVariant80,
          Object.hash(
            neutralVariant90,
            neutralVariant95,
            neutralVariant98,
            neutralVariant99,
            neutralVariant100,
            error0,
            error10,
            error20,
            error30,
            error40,
            error50,
            error60,
            error70,
            error80,
            error90,
            error95,
            error98,
            error99,
            error100,
          ),
        ),
      ),
    ),
  );

  static const _fallback = AndroidSystemTonalPalette.from(
    primary0: Color(0xFF000000),
    primary10: Color(0xFF21005D),
    primary20: Color(0xFF381E72),
    primary30: Color(0xFF4F378B),
    primary40: Color(0xFF6750A4),
    primary50: Color(0xFF7F67BE),
    primary60: Color(0xFF9A82DB),
    primary70: Color(0xFFB69DF8),
    primary80: Color(0xFFD0BCFF),
    primary90: Color(0xFFEADDFF),
    primary95: Color(0xFFF6EDFF),
    primary98: Color(0xFFFEF7FF),
    primary99: Color(0xFFFFFBFE),
    primary100: Color(0xFFFFFFFF),
    secondary0: Color(0xFF000000),
    secondary10: Color(0xFF1D192B),
    secondary20: Color(0xFF332D41),
    secondary30: Color(0xFF4A4458),
    secondary40: Color(0xFF625B71),
    secondary50: Color(0xFF7A7289),
    secondary60: Color(0xFF958DA5),
    secondary70: Color(0xFFB0A7C0),
    secondary80: Color(0xFFCCC2DC),
    secondary90: Color(0xFFE8DEF8),
    secondary95: Color(0xFFF6EDFF),
    secondary98: Color(0xFFFEF7FF),
    secondary99: Color(0xFFFFFBFE),
    secondary100: Color(0xFFFFFFFF),
    tertiary0: Color(0xFF000000),
    tertiary10: Color(0xFF31111D),
    tertiary20: Color(0xFF492532),
    tertiary30: Color(0xFF633B48),
    tertiary40: Color(0xFF7D5260),
    tertiary50: Color(0xFF986977),
    tertiary60: Color(0xFFB58392),
    tertiary70: Color(0xFFD29DAC),
    tertiary80: Color(0xFFEFB8C8),
    tertiary90: Color(0xFFFFD8E4),
    tertiary95: Color(0xFFFFECF1),
    tertiary98: Color(0xFFFFF8F8),
    tertiary99: Color(0xFFFFFBFA),
    tertiary100: Color(0xFFFFFFFF),
    neutral0: Color(0xFF000000),
    neutral4: Color(0xFF0F0D13),
    neutral6: Color(0xFF141218),
    neutral10: Color(0xFF1D1B20),
    neutral12: Color(0xFF211F26),
    neutral17: Color(0xFF2B2930),
    neutral20: Color(0xFF322F35),
    neutral22: Color(0xFF36343B),
    neutral24: Color(0xFF3B383E),
    neutral30: Color(0xFF48464C),
    neutral40: Color(0xFF605D64),
    neutral50: Color(0xFF79767D),
    neutral60: Color(0xFF938F96),
    neutral70: Color(0xFFAEA9B1),
    neutral80: Color(0xFFCAC5CD),
    neutral87: Color(0xFFDED8E1),
    neutral90: Color(0xFFE6E0E9),
    neutral92: Color(0xFFECE6F0),
    neutral94: Color(0xFFF3EDF7),
    neutral95: Color(0xFFF5EFF7),
    neutral96: Color(0xFFF7F2FA),
    neutral98: Color(0xFFFEF7FF),
    neutral99: Color(0xFFFFFBFF),
    neutral100: Color(0xFFFFFFFF),
    neutralVariant0: Color(0xFF000000),
    neutralVariant10: Color(0xFF1D1A22),
    neutralVariant20: Color(0xFF322F37),
    neutralVariant30: Color(0xFF49454F),
    neutralVariant40: Color(0xFF605D66),
    neutralVariant50: Color(0xFF79747E),
    neutralVariant60: Color(0xFF938F99),
    neutralVariant70: Color(0xFFAEA9B4),
    neutralVariant80: Color(0xFFCAC4D0),
    neutralVariant90: Color(0xFFE7E0EC),
    neutralVariant95: Color(0xFFF5EEFA),
    neutralVariant98: Color(0xFFFDF7FF),
    neutralVariant99: Color(0xFFFFFBFE),
    neutralVariant100: Color(0xFFFFFFFF),
    error0: Color(0xFF000000),
    error10: Color(0xFF410E0B),
    error20: Color(0xFF601410),
    error30: Color(0xFF8C1D18),
    error40: Color(0xFFB3261E),
    error50: Color(0xFFDC362E),
    error60: Color(0xFFE46962),
    error70: Color(0xFFEC928E),
    error80: Color(0xFFF2B8B5),
    error90: Color(0xFFF9DEDC),
    error95: Color(0xFFFCEEEE),
    error98: Color(0xFFFFF8F7),
    error99: Color(0xFFFFFBF9),
    error100: Color(0xFFFFFFFF),
  );
}

class _AndroidSystemTonalPalette extends AndroidSystemTonalPalette {
  const _AndroidSystemTonalPalette({
    required this.primary0,
    required this.primary10,
    required this.primary20,
    required this.primary30,
    required this.primary40,
    required this.primary50,
    required this.primary60,
    required this.primary70,
    required this.primary80,
    required this.primary90,
    required this.primary95,
    required this.primary98,
    required this.primary99,
    required this.primary100,
    required this.secondary0,
    required this.secondary10,
    required this.secondary20,
    required this.secondary30,
    required this.secondary40,
    required this.secondary50,
    required this.secondary60,
    required this.secondary70,
    required this.secondary80,
    required this.secondary90,
    required this.secondary95,
    required this.secondary98,
    required this.secondary99,
    required this.secondary100,
    required this.tertiary0,
    required this.tertiary10,
    required this.tertiary20,
    required this.tertiary30,
    required this.tertiary40,
    required this.tertiary50,
    required this.tertiary60,
    required this.tertiary70,
    required this.tertiary80,
    required this.tertiary90,
    required this.tertiary95,
    required this.tertiary98,
    required this.tertiary99,
    required this.tertiary100,
    required this.neutral0,
    required this.neutral4,
    required this.neutral6,
    required this.neutral10,
    required this.neutral12,
    required this.neutral17,
    required this.neutral20,
    required this.neutral22,
    required this.neutral24,
    required this.neutral30,
    required this.neutral40,
    required this.neutral50,
    required this.neutral60,
    required this.neutral70,
    required this.neutral80,
    required this.neutral87,
    required this.neutral90,
    required this.neutral92,
    required this.neutral94,
    required this.neutral95,
    required this.neutral96,
    required this.neutral98,
    required this.neutral99,
    required this.neutral100,
    required this.neutralVariant0,
    required this.neutralVariant10,
    required this.neutralVariant20,
    required this.neutralVariant30,
    required this.neutralVariant40,
    required this.neutralVariant50,
    required this.neutralVariant60,
    required this.neutralVariant70,
    required this.neutralVariant80,
    required this.neutralVariant90,
    required this.neutralVariant95,
    required this.neutralVariant98,
    required this.neutralVariant99,
    required this.neutralVariant100,
    required this.error0,
    required this.error10,
    required this.error20,
    required this.error30,
    required this.error40,
    required this.error50,
    required this.error60,
    required this.error70,
    required this.error80,
    required this.error90,
    required this.error95,
    required this.error98,
    required this.error99,
    required this.error100,
  });

  @override
  final Color primary0;

  @override
  final Color primary10;

  @override
  final Color primary20;

  @override
  final Color primary30;

  @override
  final Color primary40;

  @override
  final Color primary50;

  @override
  final Color primary60;

  @override
  final Color primary70;

  @override
  final Color primary80;

  @override
  final Color primary90;

  @override
  final Color primary95;

  @override
  final Color primary98;

  @override
  final Color primary99;

  @override
  final Color primary100;

  @override
  final Color secondary0;

  @override
  final Color secondary10;

  @override
  final Color secondary20;

  @override
  final Color secondary30;

  @override
  final Color secondary40;

  @override
  final Color secondary50;

  @override
  final Color secondary60;

  @override
  final Color secondary70;

  @override
  final Color secondary80;

  @override
  final Color secondary90;

  @override
  final Color secondary95;

  @override
  final Color secondary98;

  @override
  final Color secondary99;

  @override
  final Color secondary100;

  @override
  final Color tertiary0;

  @override
  final Color tertiary10;

  @override
  final Color tertiary20;

  @override
  final Color tertiary30;

  @override
  final Color tertiary40;

  @override
  final Color tertiary50;

  @override
  final Color tertiary60;

  @override
  final Color tertiary70;

  @override
  final Color tertiary80;

  @override
  final Color tertiary90;

  @override
  final Color tertiary95;

  @override
  final Color tertiary98;

  @override
  final Color tertiary99;

  @override
  final Color tertiary100;

  @override
  final Color neutral0;

  @override
  final Color neutral4;

  @override
  final Color neutral6;

  @override
  final Color neutral10;

  @override
  final Color neutral12;

  @override
  final Color neutral17;

  @override
  final Color neutral20;

  @override
  final Color neutral22;

  @override
  final Color neutral24;

  @override
  final Color neutral30;

  @override
  final Color neutral40;

  @override
  final Color neutral50;

  @override
  final Color neutral60;

  @override
  final Color neutral70;

  @override
  final Color neutral80;

  @override
  final Color neutral87;

  @override
  final Color neutral90;

  @override
  final Color neutral92;

  @override
  final Color neutral94;

  @override
  final Color neutral95;

  @override
  final Color neutral96;

  @override
  final Color neutral98;

  @override
  final Color neutral99;

  @override
  final Color neutral100;

  @override
  final Color neutralVariant0;

  @override
  final Color neutralVariant10;

  @override
  final Color neutralVariant20;

  @override
  final Color neutralVariant30;

  @override
  final Color neutralVariant40;

  @override
  final Color neutralVariant50;

  @override
  final Color neutralVariant60;

  @override
  final Color neutralVariant70;

  @override
  final Color neutralVariant80;

  @override
  final Color neutralVariant90;

  @override
  final Color neutralVariant95;

  @override
  final Color neutralVariant98;

  @override
  final Color neutralVariant99;

  @override
  final Color neutralVariant100;

  @override
  final Color error0;

  @override
  final Color error10;

  @override
  final Color error20;

  @override
  final Color error30;

  @override
  final Color error40;

  @override
  final Color error50;

  @override
  final Color error60;

  @override
  final Color error70;

  @override
  final Color error80;

  @override
  final Color error90;

  @override
  final Color error95;

  @override
  final Color error98;

  @override
  final Color error99;

  @override
  final Color error100;
}

extension on Color {
  Color _setLuminance(double newLuminance) {
    assert(newLuminance >= 0.0 && newLuminance <= 100.0);
    if (newLuminance < 0.0001 || newLuminance > 99.9999) {
      return Color(ColorUtils.argbFromLstar(newLuminance));
    }
    final baseCam = Cam16.fromInt(toARGB32());
    final baseColor = Cam16.getInt(baseCam.hue, baseCam.chroma, newLuminance);
    return Color(baseColor);
  }
}
