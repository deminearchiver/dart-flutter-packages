import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:system_colors_android/system_colors_android.dart';

extension MaterialColorSchemeExtension on MaterialColorScheme {
  ColorScheme toColorScheme({bool lazy = false}) => lazy
      ? _LazyColorScheme(this)
      : ColorScheme(
          brightness: brightness,
          // ignore: deprecated_member_use
          background: background,
          // ignore: deprecated_member_use
          onBackground: onBackground,
          surface: surface,
          surfaceDim: surfaceDim,
          surfaceBright: surfaceBright,
          surfaceContainerLowest: surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow,
          surfaceContainer: surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh,
          surfaceContainerHighest: surfaceContainerHighest,
          onSurface: onSurface,
          // ignore: deprecated_member_use
          surfaceVariant: surfaceVariant,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          outlineVariant: outlineVariant,
          inverseSurface: inverseSurface,
          onInverseSurface: inverseOnSurface,
          shadow: shadow,
          scrim: scrim,
          surfaceTint: surfaceTint,
          primary: primary,
          onPrimary: onPrimary,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          inversePrimary: inversePrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiary: tertiary,
          onTertiary: onTertiary,
          tertiaryContainer: tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          error: error,
          onError: onError,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
        );
}

final class const _LazyColorScheme(
  final MaterialColorScheme _scheme, {
  final Brightness? _brightness,
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
  final Color? _onInverseSurface,
  final Color? _shadow,
  final Color? _scrim,
  final Color? _surfaceTint,
  final Color? _primary,
  final Color? _onPrimary,
  final Color? _primaryContainer,
  final Color? _onPrimaryContainer,
  final Color? _primaryFixed,
  final Color? _primaryFixedDim,
  final Color? _onPrimaryFixed,
  final Color? _onPrimaryFixedVariant,
  final Color? _inversePrimary,
  final Color? _secondary,
  final Color? _onSecondary,
  final Color? _secondaryContainer,
  final Color? _onSecondaryContainer,
  final Color? _secondaryFixed,
  final Color? _secondaryFixedDim,
  final Color? _onSecondaryFixed,
  final Color? _onSecondaryFixedVariant,
  final Color? _tertiary,
  final Color? _onTertiary,
  final Color? _tertiaryContainer,
  final Color? _onTertiaryContainer,
  final Color? _tertiaryFixed,
  final Color? _tertiaryFixedDim,
  final Color? _onTertiaryFixed,
  final Color? _onTertiaryFixedVariant,
  final Color? _error,
  final Color? _onError,
  final Color? _errorContainer,
  final Color? _onErrorContainer,
}) with Diagnosticable implements ColorScheme {
  @override
  Brightness get brightness => _brightness ?? _scheme.brightness;

  @override
  Color get background => _background ?? _scheme.background;

  @override
  Color get onBackground => _onBackground ?? _scheme.onBackground;

  @override
  Color get surface => _surface ?? _scheme.surface;

  @override
  Color get surfaceDim => _surfaceDim ?? _scheme.surfaceDim;

  @override
  Color get surfaceBright => _surfaceBright ?? _scheme.surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _scheme.surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _surfaceContainerLow ?? _scheme.surfaceContainerLow;

  @override
  Color get surfaceContainer => _surfaceContainer ?? _scheme.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _scheme.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _scheme.surfaceContainerHighest;

  @override
  Color get onSurface => _onSurface ?? _scheme.onSurface;

  @override
  Color get surfaceVariant => _surfaceVariant ?? _scheme.surfaceVariant;

  @override
  Color get onSurfaceVariant => _onSurfaceVariant ?? _scheme.onSurfaceVariant;

  @override
  Color get outline => _outline ?? _scheme.outline;

  @override
  Color get outlineVariant => _outlineVariant ?? _scheme.outlineVariant;

  @override
  Color get inverseSurface => _inverseSurface ?? _scheme.inverseSurface;

  @override
  Color get onInverseSurface => _onInverseSurface ?? _scheme.inverseOnSurface;

  @override
  Color get shadow => _shadow ?? _scheme.shadow;

  @override
  Color get scrim => _scrim ?? _scheme.scrim;

  @override
  Color get surfaceTint => _surfaceTint ?? _scheme.surfaceTint;

  @override
  Color get primary => _primary ?? _scheme.primary;

  @override
  Color get onPrimary => _onPrimary ?? _scheme.onPrimary;

  @override
  Color get primaryContainer => _primaryContainer ?? _scheme.primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _onPrimaryContainer ?? _scheme.onPrimaryContainer;

  @override
  Color get primaryFixed => _primaryFixed ?? _scheme.primaryFixed;

  @override
  Color get primaryFixedDim => _primaryFixedDim ?? _scheme.primaryFixedDim;

  @override
  Color get onPrimaryFixed => _onPrimaryFixed ?? _scheme.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _scheme.onPrimaryFixedVariant;

  @override
  Color get inversePrimary => _inversePrimary ?? _scheme.inversePrimary;

  @override
  Color get secondary => _secondary ?? _scheme.secondary;

  @override
  Color get onSecondary => _onSecondary ?? _scheme.onSecondary;

  @override
  Color get secondaryContainer =>
      _secondaryContainer ?? _scheme.secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _onSecondaryContainer ?? _scheme.onSecondaryContainer;

  @override
  Color get secondaryFixed => _secondaryFixed ?? _scheme.secondaryFixed;

  @override
  Color get secondaryFixedDim =>
      _secondaryFixedDim ?? _scheme.secondaryFixedDim;

  @override
  Color get onSecondaryFixed => _onSecondaryFixed ?? _scheme.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _scheme.onSecondaryFixedVariant;

  @override
  Color get tertiary => _tertiary ?? _scheme.tertiary;

  @override
  Color get onTertiary => _onTertiary ?? _scheme.onTertiary;

  @override
  Color get tertiaryContainer =>
      _tertiaryContainer ?? _scheme.tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _onTertiaryContainer ?? _scheme.onTertiaryContainer;

  @override
  Color get tertiaryFixed => _tertiaryFixed ?? _scheme.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => _tertiaryFixedDim ?? _scheme.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => _onTertiaryFixed ?? _scheme.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _scheme.onTertiaryFixedVariant;

  @override
  Color get error => _error ?? _scheme.error;

  @override
  Color get onError => _onError ?? _scheme.onError;

  @override
  Color get errorContainer => _errorContainer ?? _scheme.errorContainer;

  @override
  Color get onErrorContainer => _onErrorContainer ?? _scheme.onErrorContainer;

  @override
  ColorScheme copyWith({
    Brightness? brightness,
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
    Color? onInverseSurface,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
  }) =>
      brightness != null &&
          background != null &&
          onBackground != null &&
          surface != null &&
          surfaceDim != null &&
          surfaceBright != null &&
          surfaceContainerLowest != null &&
          surfaceContainerLow != null &&
          surfaceContainer != null &&
          surfaceContainerHigh != null &&
          surfaceContainerHighest != null &&
          onSurface != null &&
          surfaceVariant != null &&
          onSurfaceVariant != null &&
          outline != null &&
          outlineVariant != null &&
          inverseSurface != null &&
          onInverseSurface != null &&
          shadow != null &&
          scrim != null &&
          surfaceTint != null &&
          primary != null &&
          onPrimary != null &&
          primaryContainer != null &&
          onPrimaryContainer != null &&
          primaryFixed != null &&
          primaryFixedDim != null &&
          onPrimaryFixed != null &&
          onPrimaryFixedVariant != null &&
          inversePrimary != null &&
          secondary != null &&
          onSecondary != null &&
          secondaryContainer != null &&
          onSecondaryContainer != null &&
          secondaryFixed != null &&
          secondaryFixedDim != null &&
          onSecondaryFixed != null &&
          onSecondaryFixedVariant != null &&
          tertiary != null &&
          onTertiary != null &&
          tertiaryContainer != null &&
          onTertiaryContainer != null &&
          tertiaryFixed != null &&
          tertiaryFixedDim != null &&
          onTertiaryFixed != null &&
          onTertiaryFixedVariant != null &&
          error != null &&
          onError != null &&
          errorContainer != null &&
          onErrorContainer != null
      ? ColorScheme(
          brightness: brightness,
          // ignore: deprecated_member_use
          background: background,
          // ignore: deprecated_member_use
          onBackground: onBackground,
          surface: surface,
          surfaceDim: surfaceDim,
          surfaceBright: surfaceBright,
          surfaceContainerLowest: surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow,
          surfaceContainer: surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh,
          surfaceContainerHighest: surfaceContainerHighest,
          onSurface: onSurface,
          // ignore: deprecated_member_use
          surfaceVariant: surfaceVariant,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          outlineVariant: outlineVariant,
          inverseSurface: inverseSurface,
          onInverseSurface: onInverseSurface,
          shadow: shadow,
          scrim: scrim,
          surfaceTint: surfaceTint,
          primary: primary,
          onPrimary: onPrimary,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          primaryFixed: primaryFixed,
          primaryFixedDim: primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed,
          onPrimaryFixedVariant: onPrimaryFixedVariant,
          inversePrimary: inversePrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          secondaryFixed: secondaryFixed,
          secondaryFixedDim: secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed,
          onSecondaryFixedVariant: onSecondaryFixedVariant,
          tertiary: tertiary,
          onTertiary: onTertiary,
          tertiaryContainer: tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer,
          tertiaryFixed: tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed,
          onTertiaryFixedVariant: onTertiaryFixedVariant,
          error: error,
          onError: onError,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
        )
      : brightness != null ||
            background != null ||
            onBackground != null ||
            surface != null ||
            surfaceDim != null ||
            surfaceBright != null ||
            surfaceContainerLowest != null ||
            surfaceContainerLow != null ||
            surfaceContainer != null ||
            surfaceContainerHigh != null ||
            surfaceContainerHighest != null ||
            onSurface != null ||
            surfaceVariant != null ||
            onSurfaceVariant != null ||
            outline != null ||
            outlineVariant != null ||
            inverseSurface != null ||
            onInverseSurface != null ||
            shadow != null ||
            scrim != null ||
            surfaceTint != null ||
            primary != null ||
            onPrimary != null ||
            primaryContainer != null ||
            onPrimaryContainer != null ||
            primaryFixed != null ||
            primaryFixedDim != null ||
            onPrimaryFixed != null ||
            onPrimaryFixedVariant != null ||
            inversePrimary != null ||
            secondary != null ||
            onSecondary != null ||
            secondaryContainer != null ||
            onSecondaryContainer != null ||
            secondaryFixed != null ||
            secondaryFixedDim != null ||
            onSecondaryFixed != null ||
            onSecondaryFixedVariant != null ||
            tertiary != null ||
            onTertiary != null ||
            tertiaryContainer != null ||
            onTertiaryContainer != null ||
            tertiaryFixed != null ||
            tertiaryFixedDim != null ||
            onTertiaryFixed != null ||
            onTertiaryFixedVariant != null ||
            error != null ||
            onError != null ||
            errorContainer != null ||
            onErrorContainer != null
      ? _LazyColorScheme(
          _scheme,
          brightness: brightness ?? _brightness,
          background: background ?? _background,
          onBackground: onBackground ?? _onBackground,
          surface: surface ?? _surface,
          surfaceDim: surfaceDim ?? _surfaceDim,
          surfaceBright: surfaceBright ?? _surfaceBright,
          surfaceContainerLowest:
              surfaceContainerLowest ?? _surfaceContainerLowest,
          surfaceContainerLow: surfaceContainerLow ?? _surfaceContainerLow,
          surfaceContainer: surfaceContainer ?? _surfaceContainer,
          surfaceContainerHigh: surfaceContainerHigh ?? _surfaceContainerHigh,
          surfaceContainerHighest:
              surfaceContainerHighest ?? _surfaceContainerHighest,
          onSurface: onSurface ?? _onSurface,
          surfaceVariant: surfaceVariant ?? _surfaceVariant,
          onSurfaceVariant: onSurfaceVariant ?? _onSurfaceVariant,
          outline: outline ?? _outline,
          outlineVariant: outlineVariant ?? _outlineVariant,
          inverseSurface: inverseSurface ?? _inverseSurface,
          onInverseSurface: onInverseSurface ?? _onInverseSurface,
          shadow: shadow ?? _shadow,
          scrim: scrim ?? _scrim,
          surfaceTint: surfaceTint ?? _surfaceTint,
          primary: primary ?? _primary,
          onPrimary: onPrimary ?? _onPrimary,
          primaryContainer: primaryContainer ?? _primaryContainer,
          onPrimaryContainer: onPrimaryContainer ?? _onPrimaryContainer,
          primaryFixed: primaryFixed ?? _primaryFixed,
          primaryFixedDim: primaryFixedDim ?? _primaryFixedDim,
          onPrimaryFixed: onPrimaryFixed ?? _onPrimaryFixed,
          onPrimaryFixedVariant:
              onPrimaryFixedVariant ?? _onPrimaryFixedVariant,
          inversePrimary: inversePrimary ?? _inversePrimary,
          secondary: secondary ?? _secondary,
          onSecondary: onSecondary ?? _onSecondary,
          secondaryContainer: secondaryContainer ?? _secondaryContainer,
          onSecondaryContainer: onSecondaryContainer ?? _onSecondaryContainer,
          secondaryFixed: secondaryFixed ?? _secondaryFixed,
          secondaryFixedDim: secondaryFixedDim ?? _secondaryFixedDim,
          onSecondaryFixed: onSecondaryFixed ?? _onSecondaryFixed,
          onSecondaryFixedVariant:
              onSecondaryFixedVariant ?? _onSecondaryFixedVariant,
          tertiary: tertiary ?? _tertiary,
          onTertiary: onTertiary ?? _onTertiary,
          tertiaryContainer: tertiaryContainer ?? _tertiaryContainer,
          onTertiaryContainer: onTertiaryContainer ?? _onTertiaryContainer,
          tertiaryFixed: tertiaryFixed ?? _tertiaryFixed,
          tertiaryFixedDim: tertiaryFixedDim ?? _tertiaryFixedDim,
          onTertiaryFixed: onTertiaryFixed ?? _onTertiaryFixed,
          onTertiaryFixedVariant:
              onTertiaryFixedVariant ?? _onTertiaryFixedVariant,
          error: error ?? _error,
          onError: onError ?? _onError,
          errorContainer: errorContainer ?? _errorContainer,
          onErrorContainer: onErrorContainer ?? _onErrorContainer,
        )
      : this;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(_LazyEnumProperty<Brightness>("brightness", () => brightness))
      ..add(_LazyColorProperty("background", () => background))
      ..add(_LazyColorProperty("onBackground", () => onBackground))
      ..add(_LazyColorProperty("surface", () => surface))
      ..add(_LazyColorProperty("surfaceDim", () => surfaceDim))
      ..add(_LazyColorProperty("surfaceBright", () => surfaceBright))
      ..add(
        _LazyColorProperty(
          "surfaceContainerLowest",
          () => surfaceContainerLowest,
        ),
      )
      ..add(
        _LazyColorProperty("surfaceContainerLow", () => surfaceContainerLow),
      )
      ..add(_LazyColorProperty("surfaceContainer", () => surfaceContainer))
      ..add(
        _LazyColorProperty("surfaceContainerHigh", () => surfaceContainerHigh),
      )
      ..add(
        _LazyColorProperty(
          "surfaceContainerHighest",
          () => surfaceContainerHighest,
        ),
      )
      ..add(_LazyColorProperty("onSurface", () => onSurface))
      ..add(_LazyColorProperty("surfaceVariant", () => surfaceVariant))
      ..add(_LazyColorProperty("onSurfaceVariant", () => onSurfaceVariant))
      ..add(_LazyColorProperty("outline", () => outline))
      ..add(_LazyColorProperty("outlineVariant", () => outlineVariant))
      ..add(_LazyColorProperty("inverseSurface", () => inverseSurface))
      ..add(_LazyColorProperty("onInverseSurface", () => onInverseSurface))
      ..add(_LazyColorProperty("shadow", () => shadow))
      ..add(_LazyColorProperty("scrim", () => scrim))
      ..add(_LazyColorProperty("surfaceTint", () => surfaceTint))
      ..add(_LazyColorProperty("primary", () => primary))
      ..add(_LazyColorProperty("onPrimary", () => onPrimary))
      ..add(_LazyColorProperty("primaryContainer", () => primaryContainer))
      ..add(_LazyColorProperty("onPrimaryContainer", () => onPrimaryContainer))
      ..add(_LazyColorProperty("primaryFixed", () => primaryFixed))
      ..add(_LazyColorProperty("primaryFixedDim", () => primaryFixedDim))
      ..add(_LazyColorProperty("onPrimaryFixed", () => onPrimaryFixed))
      ..add(
        _LazyColorProperty(
          "onPrimaryFixedVariant",
          () => onPrimaryFixedVariant,
        ),
      )
      ..add(_LazyColorProperty("inversePrimary", () => inversePrimary))
      ..add(_LazyColorProperty("secondary", () => secondary))
      ..add(_LazyColorProperty("onSecondary", () => onSecondary))
      ..add(_LazyColorProperty("secondaryContainer", () => secondaryContainer))
      ..add(
        _LazyColorProperty("onSecondaryContainer", () => onSecondaryContainer),
      )
      ..add(_LazyColorProperty("secondaryFixed", () => secondaryFixed))
      ..add(_LazyColorProperty("secondaryFixedDim", () => secondaryFixedDim))
      ..add(_LazyColorProperty("onSecondaryFixed", () => onSecondaryFixed))
      ..add(
        _LazyColorProperty(
          "onSecondaryFixedVariant",
          () => onSecondaryFixedVariant,
        ),
      )
      ..add(_LazyColorProperty("tertiary", () => tertiary))
      ..add(_LazyColorProperty("onTertiary", () => onTertiary))
      ..add(_LazyColorProperty("tertiaryContainer", () => tertiaryContainer))
      ..add(
        _LazyColorProperty("onTertiaryContainer", () => onTertiaryContainer),
      )
      ..add(_LazyColorProperty("tertiaryFixed", () => tertiaryFixed))
      ..add(_LazyColorProperty("tertiaryFixedDim", () => tertiaryFixedDim))
      ..add(_LazyColorProperty("onTertiaryFixed", () => onTertiaryFixed))
      ..add(
        _LazyColorProperty(
          "onTertiaryFixedVariant",
          () => onTertiaryFixedVariant,
        ),
      )
      ..add(_LazyColorProperty("error", () => error))
      ..add(_LazyColorProperty("onError", () => onError))
      ..add(_LazyColorProperty("errorContainer", () => errorContainer))
      ..add(_LazyColorProperty("onErrorContainer", () => onErrorContainer));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _LazyColorScheme &&
          _scheme == other._scheme &&
          _brightness == other._brightness &&
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
          _onInverseSurface == other._onInverseSurface &&
          _shadow == other._shadow &&
          _scrim == other._scrim &&
          _surfaceTint == other._surfaceTint &&
          _primary == other._primary &&
          _onPrimary == other._onPrimary &&
          _primaryContainer == other._primaryContainer &&
          _onPrimaryContainer == other._onPrimaryContainer &&
          _primaryFixed == other._primaryFixed &&
          _primaryFixedDim == other._primaryFixedDim &&
          _onPrimaryFixed == other._onPrimaryFixed &&
          _onPrimaryFixedVariant == other._onPrimaryFixedVariant &&
          _inversePrimary == other._inversePrimary &&
          _secondary == other._secondary &&
          _onSecondary == other._onSecondary &&
          _secondaryContainer == other._secondaryContainer &&
          _onSecondaryContainer == other._onSecondaryContainer &&
          _secondaryFixed == other._secondaryFixed &&
          _secondaryFixedDim == other._secondaryFixedDim &&
          _onSecondaryFixed == other._onSecondaryFixed &&
          _onSecondaryFixedVariant == other._onSecondaryFixedVariant &&
          _tertiary == other._tertiary &&
          _onTertiary == other._onTertiary &&
          _tertiaryContainer == other._tertiaryContainer &&
          _onTertiaryContainer == other._onTertiaryContainer &&
          _tertiaryFixed == other._tertiaryFixed &&
          _tertiaryFixedDim == other._tertiaryFixedDim &&
          _onTertiaryFixed == other._onTertiaryFixed &&
          _onTertiaryFixedVariant == other._onTertiaryFixedVariant &&
          _error == other._error &&
          _onError == other._onError &&
          _errorContainer == other._errorContainer &&
          _onErrorContainer == other._onErrorContainer;

  @override
  int get hashCode => Object.hash(
    Object.hash(
      Object.hash(
        _brightness,
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
        _surfaceVariant,
        _onSurfaceVariant,
        _outline,
        _outlineVariant,
        _inverseSurface,
        _onInverseSurface,
        _shadow,
        _scrim,
      ),
      _surfaceTint,
      _primary,
      _onPrimary,
      _primaryContainer,
      _onPrimaryContainer,
      _primaryFixed,
      _primaryFixedDim,
      _onPrimaryFixed,
      _onPrimaryFixedVariant,
      _inversePrimary,
      _secondary,
      _onSecondary,
      _secondaryContainer,
      _onSecondaryContainer,
      _secondaryFixed,
      _secondaryFixedDim,
      _onSecondaryFixed,
      _onSecondaryFixedVariant,
      _tertiary,
    ),
    _onTertiary,
    _tertiaryContainer,
    _onTertiaryContainer,
    _tertiaryFixed,
    _tertiaryFixedDim,
    _onTertiaryFixed,
    _onTertiaryFixedVariant,
    _error,
    _onError,
    _errorContainer,
    _onErrorContainer,
  );
}

class _LazyEnumProperty<T extends Enum?>(String super.name, super.computeValue)
    extends DiagnosticsProperty<T> {
  this : super.lazy();

  @override
  String valueToString({TextTreeConfiguration? parentConfiguration}) =>
      value?.name ?? "null";
}

class _LazyColorProperty(String super.name, super.computeValue)
    extends DiagnosticsProperty<Color> {
  this : super.lazy();

  @override
  Map<String, Object?> toJsonMap(DiagnosticsSerializationDelegate delegate) {
    final json = super.toJsonMap(delegate);
    if (value != null) {
      json["valueProperties"] = <String, Object>{
        "red": (value!.r * 255.0).round().clamp(0, 255),
        "green": (value!.g * 255.0).round().clamp(0, 255),
        "blue": (value!.b * 255.0).round().clamp(0, 255),
        "alpha": (value!.a * 255.0).round().clamp(0, 255),
      };
    }
    return json;
  }
}
