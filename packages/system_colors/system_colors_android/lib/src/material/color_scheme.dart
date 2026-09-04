import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:libmonet/libmonet.dart';
import 'package:system_colors_android/system_colors_android.dart';

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

  factory fromAndroidColorScheme(
    AndroidColorScheme androidScheme,
    DynamicScheme fallbackScheme,
  ) = _MaterialColorSchemeWithFallback;

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

final class _DynamicSchemeCache(final DynamicScheme _scheme) {
  late final Color primaryPaletteKeyColor = Color(
    _scheme.primaryPaletteKeyColor,
  );

  late final Color secondaryPaletteKeyColor = Color(
    _scheme.secondaryPaletteKeyColor,
  );

  late final Color tertiaryPaletteKeyColor = Color(
    _scheme.tertiaryPaletteKeyColor,
  );

  late final Color neutralPaletteKeyColor = Color(
    _scheme.neutralPaletteKeyColor,
  );

  late final Color neutralVariantPaletteKeyColor = Color(
    _scheme.neutralVariantPaletteKeyColor,
  );

  late final Color errorPaletteKeyColor = Color(_scheme.errorPaletteKeyColor);

  late final Color background = Color(_scheme.background);

  late final Color onBackground = Color(_scheme.onBackground);

  late final Color surface = Color(_scheme.surface);

  late final Color surfaceDim = Color(_scheme.surfaceDim);

  late final Color surfaceBright = Color(_scheme.surfaceBright);

  late final Color surfaceContainerLowest = Color(
    _scheme.surfaceContainerLowest,
  );

  late final Color surfaceContainerLow = Color(_scheme.surfaceContainerLow);

  late final Color surfaceContainer = Color(_scheme.surfaceContainer);

  late final Color surfaceContainerHigh = Color(_scheme.surfaceContainerHigh);

  late final Color surfaceContainerHighest = Color(
    _scheme.surfaceContainerHighest,
  );

  late final Color onSurface = Color(_scheme.onSurface);

  late final Color surfaceVariant = Color(_scheme.surfaceVariant);

  late final Color onSurfaceVariant = Color(_scheme.onSurfaceVariant);

  late final Color outline = Color(_scheme.outline);

  late final Color outlineVariant = Color(_scheme.outlineVariant);

  late final Color inverseSurface = Color(_scheme.inverseSurface);

  late final Color inverseOnSurface = Color(_scheme.inverseOnSurface);

  late final Color shadow = Color(_scheme.shadow);

  late final Color scrim = Color(_scheme.scrim);

  late final Color surfaceTint = Color(_scheme.surfaceTint);

  late final Color primary = Color(_scheme.primary);

  late final Color primaryDim = Color(_scheme.primaryDim);

  late final Color onPrimary = Color(_scheme.onPrimary);

  late final Color primaryContainer = Color(_scheme.primaryContainer);

  late final Color onPrimaryContainer = Color(_scheme.onPrimaryContainer);

  late final Color primaryFixed = Color(_scheme.primaryFixed);

  late final Color primaryFixedDim = Color(_scheme.primaryFixedDim);

  late final Color onPrimaryFixed = Color(_scheme.onPrimaryFixed);

  late final Color onPrimaryFixedVariant = Color(_scheme.onPrimaryFixedVariant);

  late final Color inversePrimary = Color(_scheme.inversePrimary);

  late final Color secondary = Color(_scheme.secondary);

  late final Color secondaryDim = Color(_scheme.secondaryDim);

  late final Color onSecondary = Color(_scheme.onSecondary);

  late final Color secondaryContainer = Color(_scheme.secondaryContainer);

  late final Color onSecondaryContainer = Color(_scheme.onSecondaryContainer);

  late final Color secondaryFixed = Color(_scheme.secondaryFixed);

  late final Color secondaryFixedDim = Color(_scheme.secondaryFixedDim);

  late final Color onSecondaryFixed = Color(_scheme.onSecondaryFixed);

  late final Color onSecondaryFixedVariant = Color(
    _scheme.onSecondaryFixedVariant,
  );

  late final Color tertiary = Color(_scheme.tertiary);

  late final Color tertiaryDim = Color(_scheme.tertiaryDim);

  late final Color onTertiary = Color(_scheme.onTertiary);

  late final Color tertiaryContainer = Color(_scheme.tertiaryContainer);

  late final Color onTertiaryContainer = Color(_scheme.onTertiaryContainer);

  late final Color tertiaryFixed = Color(_scheme.tertiaryFixed);

  late final Color tertiaryFixedDim = Color(_scheme.tertiaryFixedDim);

  late final Color onTertiaryFixed = Color(_scheme.onTertiaryFixed);

  late final Color onTertiaryFixedVariant = Color(
    _scheme.onTertiaryFixedVariant,
  );

  late final Color error = Color(_scheme.error);

  late final Color errorDim = Color(_scheme.errorDim);

  late final Color onError = Color(_scheme.onError);

  late final Color errorContainer = Color(_scheme.errorContainer);

  late final Color onErrorContainer = Color(_scheme.onErrorContainer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DynamicSchemeCache && _scheme == other._scheme;

  @override
  int get hashCode => _scheme.hashCode;
}

final class const _MaterialColorSchemeWithFallback._({
  required final AndroidColorScheme _androidScheme,
  required final _DynamicSchemeCache _cache,
  final Brightness? _brightness,
  final Color? _primaryPaletteKeyColor,
  final Color? _secondaryPaletteKeyColor,
  final Color? _tertiaryPaletteKeyColor,
  final Color? _neutralPaletteKeyColor,
  final Color? _neutralVariantPaletteKeyColor,
  final Color? _errorPaletteKeyColor,
  final Color? _background,
  final Color? _onBackground,
  final Color? _surface,
  final Color? _surfaceDim,
  final Color? _surfaceBright,
  final Color? _surfaceContainerLowest,
  final Color? _surfaceContainerLow,
  final Color? _surfaceContainer,
  final Color? _surfaceContainerHigh,
  final Color? _surfaceContainerHighest,
  final Color? _onSurface,
  final Color? _surfaceVariant,
  final Color? _onSurfaceVariant,
  final Color? _outline,
  final Color? _outlineVariant,
  final Color? _inverseSurface,
  final Color? _inverseOnSurface,
  final Color? _shadow,
  final Color? _scrim,
  final Color? _surfaceTint,
  final Color? _primary,
  final Color? _primaryDim,
  final Color? _onPrimary,
  final Color? _primaryContainer,
  final Color? _onPrimaryContainer,
  final Color? _primaryFixed,
  final Color? _primaryFixedDim,
  final Color? _onPrimaryFixed,
  final Color? _onPrimaryFixedVariant,
  final Color? _inversePrimary,
  final Color? _secondary,
  final Color? _secondaryDim,
  final Color? _onSecondary,
  final Color? _secondaryContainer,
  final Color? _onSecondaryContainer,
  final Color? _secondaryFixed,
  final Color? _secondaryFixedDim,
  final Color? _onSecondaryFixed,
  final Color? _onSecondaryFixedVariant,
  final Color? _tertiary,
  final Color? _tertiaryDim,
  final Color? _onTertiary,
  final Color? _tertiaryContainer,
  final Color? _onTertiaryContainer,
  final Color? _tertiaryFixed,
  final Color? _tertiaryFixedDim,
  final Color? _onTertiaryFixed,
  final Color? _onTertiaryFixedVariant,
  final Color? _error,
  final Color? _errorDim,
  final Color? _onError,
  final Color? _errorContainer,
  final Color? _onErrorContainer,
}) extends MaterialColorScheme {
  new(AndroidColorScheme androidScheme, DynamicScheme fallbackScheme)
    : this._(androidScheme: androidScheme, cache: .new(fallbackScheme));

  @override
  Brightness get brightness => _brightness ?? _androidScheme.brightness;

  @override
  Color get primaryPaletteKeyColor =>
      _primaryPaletteKeyColor ??
      _androidScheme.primaryPaletteKeyColor ??
      _cache.primaryPaletteKeyColor;

  @override
  Color get secondaryPaletteKeyColor =>
      _secondaryPaletteKeyColor ??
      _androidScheme.secondaryPaletteKeyColor ??
      _cache.secondaryPaletteKeyColor;

  @override
  Color get tertiaryPaletteKeyColor =>
      _tertiaryPaletteKeyColor ??
      _androidScheme.tertiaryPaletteKeyColor ??
      _cache.tertiaryPaletteKeyColor;

  @override
  Color get neutralPaletteKeyColor =>
      _neutralPaletteKeyColor ??
      _androidScheme.neutralPaletteKeyColor ??
      _cache.neutralPaletteKeyColor;

  @override
  Color get neutralVariantPaletteKeyColor =>
      _neutralVariantPaletteKeyColor ??
      _androidScheme.neutralVariantPaletteKeyColor ??
      _cache.neutralVariantPaletteKeyColor;

  @override
  Color get errorPaletteKeyColor =>
      _errorPaletteKeyColor ??
      _androidScheme.errorPaletteKeyColor ??
      _cache.errorPaletteKeyColor;

  @override
  Color get background =>
      _background ?? _androidScheme.background ?? _cache.background;

  @override
  Color get onBackground =>
      _onBackground ?? _androidScheme.onBackground ?? _cache.onBackground;

  @override
  Color get surface => _surface ?? _androidScheme.surface ?? _cache.surface;

  @override
  Color get surfaceDim =>
      _surfaceDim ?? _androidScheme.surfaceDim ?? _cache.surfaceDim;

  @override
  Color get surfaceBright =>
      _surfaceBright ?? _androidScheme.surfaceBright ?? _cache.surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ??
      _androidScheme.surfaceContainerLowest ??
      _cache.surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _surfaceContainerLow ??
      _androidScheme.surfaceContainerLow ??
      _cache.surfaceContainerLow;

  @override
  Color get surfaceContainer =>
      _surfaceContainer ??
      _androidScheme.surfaceContainer ??
      _cache.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ??
      _androidScheme.surfaceContainerHigh ??
      _cache.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ??
      _androidScheme.surfaceContainerHighest ??
      _cache.surfaceContainerHighest;

  @override
  Color get onSurface =>
      _onSurface ?? _androidScheme.onSurface ?? _cache.onSurface;

  @override
  Color get surfaceVariant =>
      _surfaceVariant ?? _androidScheme.surfaceVariant ?? _cache.surfaceVariant;

  @override
  Color get onSurfaceVariant =>
      _onSurfaceVariant ??
      _androidScheme.onSurfaceVariant ??
      _cache.onSurfaceVariant;

  @override
  Color get outline => _outline ?? _androidScheme.outline ?? _cache.outline;

  @override
  Color get outlineVariant =>
      _outlineVariant ?? _androidScheme.outlineVariant ?? _cache.outlineVariant;

  @override
  Color get inverseSurface =>
      _inverseSurface ?? _androidScheme.inverseSurface ?? _cache.inverseSurface;

  @override
  Color get inverseOnSurface =>
      _inverseOnSurface ??
      _androidScheme.inverseOnSurface ??
      _cache.inverseOnSurface;

  @override
  Color get shadow => _shadow ?? _androidScheme.shadow ?? _cache.shadow;

  @override
  Color get scrim => _scrim ?? _androidScheme.scrim ?? _cache.scrim;

  @override
  Color get surfaceTint =>
      _surfaceTint ?? _androidScheme.surfaceTint ?? _cache.surfaceTint;

  @override
  Color get primary => _primary ?? _androidScheme.primary ?? _cache.primary;

  @override
  Color get primaryDim =>
      _primaryDim ?? _androidScheme.primaryDim ?? _cache.primaryDim;

  @override
  Color get onPrimary =>
      _onPrimary ?? _androidScheme.onPrimary ?? _cache.onPrimary;

  @override
  Color get primaryContainer =>
      _primaryContainer ??
      _androidScheme.primaryContainer ??
      _cache.primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _onPrimaryContainer ??
      _androidScheme.onPrimaryContainer ??
      _cache.onPrimaryContainer;

  @override
  Color get primaryFixed =>
      _primaryFixed ?? _androidScheme.primaryFixed ?? _cache.primaryFixed;

  @override
  Color get primaryFixedDim =>
      _primaryFixedDim ??
      _androidScheme.primaryFixedDim ??
      _cache.primaryFixedDim;

  @override
  Color get onPrimaryFixed =>
      _onPrimaryFixed ?? _androidScheme.onPrimaryFixed ?? _cache.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ??
      _androidScheme.onPrimaryFixedVariant ??
      _cache.onPrimaryFixedVariant;

  @override
  Color get inversePrimary =>
      _inversePrimary ?? _androidScheme.inversePrimary ?? _cache.inversePrimary;

  @override
  Color get secondary =>
      _secondary ?? _androidScheme.secondary ?? _cache.secondary;

  @override
  Color get secondaryDim =>
      _secondaryDim ?? _androidScheme.secondaryDim ?? _cache.secondaryDim;

  @override
  Color get onSecondary =>
      _onSecondary ?? _androidScheme.onSecondary ?? _cache.onSecondary;

  @override
  Color get secondaryContainer =>
      _secondaryContainer ??
      _androidScheme.secondaryContainer ??
      _cache.secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _onSecondaryContainer ??
      _androidScheme.onSecondaryContainer ??
      _cache.onSecondaryContainer;

  @override
  Color get secondaryFixed =>
      _secondaryFixed ?? _androidScheme.secondaryFixed ?? _cache.secondaryFixed;

  @override
  Color get secondaryFixedDim =>
      _secondaryFixedDim ??
      _androidScheme.secondaryFixedDim ??
      _cache.secondaryFixedDim;

  @override
  Color get onSecondaryFixed =>
      _onSecondaryFixed ??
      _androidScheme.onSecondaryFixed ??
      _cache.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ??
      _androidScheme.onSecondaryFixedVariant ??
      _cache.onSecondaryFixedVariant;

  @override
  Color get tertiary => _tertiary ?? _androidScheme.tertiary ?? _cache.tertiary;

  @override
  Color get tertiaryDim =>
      _tertiaryDim ?? _androidScheme.tertiaryDim ?? _cache.tertiaryDim;

  @override
  Color get onTertiary =>
      _onTertiary ?? _androidScheme.onTertiary ?? _cache.onTertiary;

  @override
  Color get tertiaryContainer =>
      _tertiaryContainer ??
      _androidScheme.tertiaryContainer ??
      _cache.tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _onTertiaryContainer ??
      _androidScheme.onTertiaryContainer ??
      _cache.onTertiaryContainer;

  @override
  Color get tertiaryFixed =>
      _tertiaryFixed ?? _androidScheme.tertiaryFixed ?? _cache.tertiaryFixed;

  @override
  Color get tertiaryFixedDim =>
      _tertiaryFixedDim ??
      _androidScheme.tertiaryFixedDim ??
      _cache.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed =>
      _onTertiaryFixed ??
      _androidScheme.onTertiaryFixed ??
      _cache.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ??
      _androidScheme.onTertiaryFixedVariant ??
      _cache.onTertiaryFixedVariant;

  @override
  Color get error => _error ?? _androidScheme.error ?? _cache.error;

  @override
  Color get errorDim => _errorDim ?? _androidScheme.errorDim ?? _cache.errorDim;

  @override
  Color get onError => _onError ?? _androidScheme.onError ?? _cache.onError;

  @override
  Color get errorContainer =>
      _errorContainer ?? _androidScheme.errorContainer ?? _cache.errorContainer;

  @override
  Color get onErrorContainer =>
      _onErrorContainer ??
      _androidScheme.onErrorContainer ??
      _cache.onErrorContainer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MaterialColorSchemeWithFallback &&
          _androidScheme == other._androidScheme &&
          _cache == other._cache &&
          _brightness == other._brightness &&
          _primaryPaletteKeyColor == other._primaryPaletteKeyColor &&
          _secondaryPaletteKeyColor == other._secondaryPaletteKeyColor &&
          _tertiaryPaletteKeyColor == other._tertiaryPaletteKeyColor &&
          _neutralPaletteKeyColor == other._neutralPaletteKeyColor &&
          _neutralVariantPaletteKeyColor ==
              other._neutralVariantPaletteKeyColor &&
          _errorPaletteKeyColor == other._errorPaletteKeyColor &&
          _background == other._background &&
          _onBackground == other._onBackground &&
          _surface == other._surface &&
          _surfaceDim == other._surfaceDim &&
          _surfaceBright == other._surfaceBright &&
          _surfaceContainerLowest == other._surfaceContainerLowest &&
          _surfaceContainerLow == other._surfaceContainerLow &&
          _surfaceContainer == other._surfaceContainer &&
          _surfaceContainerHigh == other._surfaceContainerHigh &&
          _surfaceContainerHighest == other._surfaceContainerHighest &&
          _onSurface == other._onSurface &&
          _surfaceVariant == other._surfaceVariant &&
          _onSurfaceVariant == other._onSurfaceVariant &&
          _outline == other._outline &&
          _outlineVariant == other._outlineVariant &&
          _inverseSurface == other._inverseSurface &&
          _inverseOnSurface == other._inverseOnSurface &&
          _shadow == other._shadow &&
          _scrim == other._scrim &&
          _surfaceTint == other._surfaceTint &&
          _primary == other._primary &&
          _primaryDim == other._primaryDim &&
          _onPrimary == other._onPrimary &&
          _primaryContainer == other._primaryContainer &&
          _onPrimaryContainer == other._onPrimaryContainer &&
          _primaryFixed == other._primaryFixed &&
          _primaryFixedDim == other._primaryFixedDim &&
          _onPrimaryFixed == other._onPrimaryFixed &&
          _onPrimaryFixedVariant == other._onPrimaryFixedVariant &&
          _inversePrimary == other._inversePrimary &&
          _secondary == other._secondary &&
          _secondaryDim == other._secondaryDim &&
          _onSecondary == other._onSecondary &&
          _secondaryContainer == other._secondaryContainer &&
          _onSecondaryContainer == other._onSecondaryContainer &&
          _secondaryFixed == other._secondaryFixed &&
          _secondaryFixedDim == other._secondaryFixedDim &&
          _onSecondaryFixed == other._onSecondaryFixed &&
          _onSecondaryFixedVariant == other._onSecondaryFixedVariant &&
          _tertiary == other._tertiary &&
          _tertiaryDim == other._tertiaryDim &&
          _onTertiary == other._onTertiary &&
          _tertiaryContainer == other._tertiaryContainer &&
          _onTertiaryContainer == other._onTertiaryContainer &&
          _tertiaryFixed == other._tertiaryFixed &&
          _tertiaryFixedDim == other._tertiaryFixedDim &&
          _onTertiaryFixed == other._onTertiaryFixed &&
          _onTertiaryFixedVariant == other._onTertiaryFixedVariant &&
          _error == other._error &&
          _errorDim == other._errorDim &&
          _onError == other._onError &&
          _errorContainer == other._errorContainer &&
          _onErrorContainer == other._onErrorContainer;

  @override
  int get hashCode => Object.hash(
    Object.hash(
      Object.hash(
        Object.hash(
          _androidScheme,
          _cache,
          _brightness,
          _primaryPaletteKeyColor,
          _secondaryPaletteKeyColor,
          _tertiaryPaletteKeyColor,
          _neutralPaletteKeyColor,
          _neutralVariantPaletteKeyColor,
          _errorPaletteKeyColor,
          _background,
          _onBackground,
          _surface,
          _surfaceDim,
          _surfaceBright,
          _surfaceContainerLowest,
          _surfaceContainerLow,
          _surfaceContainer,
          _surfaceContainerHigh,
          _surfaceContainerHighest,
          _onSurface,
        ),
        _surfaceVariant,
        _onSurfaceVariant,
        _outline,
        _outlineVariant,
        _inverseSurface,
        _inverseOnSurface,
        _shadow,
        _scrim,
        _surfaceTint,
        _primary,
        _primaryDim,
        _onPrimary,
        _primaryContainer,
        _onPrimaryContainer,
        _primaryFixed,
        _primaryFixedDim,
        _onPrimaryFixed,
        _onPrimaryFixedVariant,
        _inversePrimary,
      ),
      _secondary,
      _secondaryDim,
      _onSecondary,
      _secondaryContainer,
      _onSecondaryContainer,
      _secondaryFixed,
      _secondaryFixedDim,
      _onSecondaryFixed,
      _onSecondaryFixedVariant,
      _tertiary,
      _tertiaryDim,
      _onTertiary,
      _tertiaryContainer,
      _onTertiaryContainer,
      _tertiaryFixed,
      _tertiaryFixedDim,
      _onTertiaryFixed,
      _onTertiaryFixedVariant,
      _error,
    ),
    _errorDim,
    _onError,
    _errorContainer,
    _onErrorContainer,
  );
}

// DynamicScheme _createFallbackScheme() {}
