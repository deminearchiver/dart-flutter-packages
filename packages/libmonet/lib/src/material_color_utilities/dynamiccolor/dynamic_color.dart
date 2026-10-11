import 'package:meta/meta.dart';

import '../contrast/contrast.dart';
import '../hct/hct.dart';
import '../palettes/tonal_palette.dart';
import '../utils/math_utils.dart';

import '../utils/string_utils.dart';
import 'color_spec.dart';
import 'tone_delta_pair.dart';
import 'contrast_curve.dart';
import 'dynamic_scheme.dart';

typedef DynamicSchemeCallback<T> = T Function(DynamicScheme scheme);

@immutable
abstract class const DynamicColor() {
  factory fromHct(String name, Hct hct) = _DynamicColor.fromHct;

  factory fromArgb(String name, int argb) = _DynamicColor.fromArgb;

  const factory extended(
    DynamicColor baseColor,
    SpecVersion specVersion,
    DynamicColor extendedColor,
  ) = _ExtendedDynamicColor;

  const factory custom({
    required String name,
    required DynamicSchemeCallback<TonalPalette> palette,
    bool isBackground,
    DynamicSchemeCallback<double>? chromaMultiplier,
    DynamicSchemeCallback<DynamicColor?>? background,
    DynamicSchemeCallback<double>? tone,
    DynamicSchemeCallback<DynamicColor?>? secondBackground,
    DynamicSchemeCallback<ContrastCurve?>? contrastCurve,
    DynamicSchemeCallback<ToneDeltaPair?>? toneDeltaPair,
    DynamicSchemeCallback<double?>? opacity,
  }) = _CustomDynamicColor;

  // this {
  //   if (background == null && secondBackground != null) {
  //     throw ArgumentError(
  //       "Color $name has secondBackground defined, "
  //       "but background is not defined.",
  //     );
  //   }
  //   if (background == null && contrastCurve != null) {
  //     throw ArgumentError(
  //       "Color $name has contrastCurve defined, "
  //       "but background is not defined.",
  //     );
  //   }
  //   if (background != null && contrastCurve == null) {
  //     throw ArgumentError(
  //       "Color $name has background defined, "
  //       "but contrastCurve is not defined.",
  //     );
  //   }
  // }

  String get name;

  TonalPalette palette(DynamicScheme scheme);

  bool get isBackground => false;

  double chromaMultiplier(DynamicScheme scheme) => 1.0;

  DynamicColor? background(DynamicScheme scheme) => null;

  double tone(DynamicScheme scheme) =>
      background(scheme)?.getTone(scheme) ?? 50.0;

  DynamicColor? secondBackground(DynamicScheme scheme) => null;

  ContrastCurve? contrastCurve(DynamicScheme scheme) => null;

  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => null;

  double? opacity(DynamicScheme scheme) => null;

  int getArgb(DynamicScheme scheme) {
    final argb = getHct(scheme).toInt();

    final opacityPercentage = opacity(scheme);
    if (opacityPercentage == null) return argb;

    final alpha = MathUtils.clamp((opacityPercentage * 255.0).round(), 0, 255);
    return (argb & 0x00ffffff) | (alpha << 24);
  }

  Hct getHct(DynamicScheme scheme) =>
      ColorSpec.fromSpecVersion(scheme.specVersion).getHct(scheme, this);

  double getTone(DynamicScheme scheme) =>
      ColorSpec.fromSpecVersion(scheme.specVersion).getTone(scheme, this);

  @override
  String toString() => "DynamicColor($name)";

  static double foregroundTone(double bgTone, double ratio) {
    final lighterTone = Contrast.lighterUnsafe(bgTone, ratio);
    final darkerTone = Contrast.darkerUnsafe(bgTone, ratio);
    final lighterRatio = Contrast.ratioOfTones(lighterTone, bgTone);
    final darkerRatio = Contrast.ratioOfTones(darkerTone, bgTone);
    final preferLighter = tonePrefersLightForeground(bgTone);

    if (preferLighter) {
      // "Neglible difference" handles an edge case where
      // the initial contrast ratio is high (ex. 13.0),
      // and the ratio passed to the function is that high ratio,
      // and both the lighter
      // and darker ratio fails to pass that ratio.
      //
      // This was observed with Tonal Spot's On Primary Container
      // turning black momentarily between high and max contrast in light mode.
      // PC's standard tone was T90, OPC's was T10, it was light mode,
      // and the contrast level was 0.6568521221032331.
      final negligibleDifference =
          (lighterRatio - darkerRatio).abs() < 0.1 &&
          lighterRatio < ratio &&
          darkerRatio < ratio;
      if (lighterRatio >= ratio ||
          lighterRatio >= darkerRatio ||
          negligibleDifference) {
        return lighterTone;
      } else {
        return darkerTone;
      }
    } else {
      return darkerRatio >= ratio || darkerRatio >= lighterRatio
          ? darkerTone
          : lighterTone;
    }
  }

  static double enableLightForeground(double tone) =>
      tonePrefersLightForeground(tone) && !toneAllowsLightForeground(tone)
      ? 49.0
      : tone;

  static bool tonePrefersLightForeground(double tone) => tone.round() < 60.0;

  static bool toneAllowsLightForeground(double tone) => tone.round() <= 49.0;

  // TODO: REMOVE AFTER MIGRATING
  // static DynamicSchemeCallback<double> getInitialToneFromBackground(
  //   DynamicSchemeCallback<DynamicColor?>? background,
  // ) => background != null
  //     ? (scheme) => background(scheme)?.getTone(scheme) ?? 50.0
  //     : (_) => 50.0;
}

// ignore: prefer_const_constructors_in_immutables
final class _DynamicColor.fromHct(@override final String name, final Hct _hct)
    extends DynamicColor {
  new fromArgb(String name, int argb) : this.fromHct(name, .fromInt(argb));

  final _palette = TonalPalette.fromHct(_hct);

  @override
  TonalPalette palette(DynamicScheme scheme) => _palette;

  @override
  double tone(DynamicScheme scheme) => _hct.tone;

  @override
  String toString() =>
      "DynamicColor($name, ${StringUtils.hexFromArgb(_hct.toInt())})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DynamicColor && name == other.name && _hct == other._hct;

  @override
  int get hashCode => Object.hash(name, _hct);
}

final class const _ExtendedDynamicColor(
  final DynamicColor _baseColor,
  final SpecVersion _specVersion,
  final DynamicColor _extendedColor,
) extends DynamicColor {
  @override
  String get name => _baseColor.name;

  @override
  bool get isBackground => _baseColor.isBackground;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  DynamicColor _dynamicColor(DynamicScheme scheme) =>
      scheme.specVersion >= _specVersion ? _extendedColor : _baseColor;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  TonalPalette palette(DynamicScheme scheme) =>
      _dynamicColor(scheme).palette(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  double tone(DynamicScheme scheme) => _dynamicColor(scheme).tone(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      _dynamicColor(scheme).chromaMultiplier(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _dynamicColor(scheme).background(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  DynamicColor? secondBackground(DynamicScheme scheme) =>
      _dynamicColor(scheme).secondBackground(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      _dynamicColor(scheme).contrastCurve(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      _dynamicColor(scheme).toneDeltaPair(scheme);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  @override
  double? opacity(DynamicScheme scheme) =>
      _dynamicColor(scheme).opacity(scheme);

  @override
  String toString() =>
      "$_baseColor.extendSpecVersion($_specVersion, $_extendedColor)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ExtendedDynamicColor &&
          _baseColor == other._baseColor &&
          _specVersion == other._specVersion &&
          _extendedColor == other._extendedColor;

  @override
  int get hashCode => Object.hash(_baseColor, _specVersion, _extendedColor);
}

// TODO: IMPLEMENT EQUALITY

final class const _CustomDynamicColor({
  @override required final String name,

  required final DynamicSchemeCallback<TonalPalette> _palette,

  @override final bool isBackground = false,

  final DynamicSchemeCallback<double>? _chromaMultiplier,

  final DynamicSchemeCallback<DynamicColor?>? _background,

  final DynamicSchemeCallback<double>? _tone,

  final DynamicSchemeCallback<DynamicColor?>? _secondBackground,

  final DynamicSchemeCallback<ContrastCurve?>? _contrastCurve,

  final DynamicSchemeCallback<ToneDeltaPair?>? _toneDeltaPair,

  final DynamicSchemeCallback<double?>? _opacity,
}) extends DynamicColor {
  @override
  TonalPalette palette(DynamicScheme scheme) => _palette(scheme);

  @override
  double tone(DynamicScheme scheme) =>
      _tone?.call(scheme) ?? background(scheme)?.getTone(scheme) ?? 50.0;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      _chromaMultiplier?.call(scheme) ?? 1.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _background?.call(scheme);

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) =>
      _secondBackground?.call(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      _contrastCurve?.call(scheme);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      _toneDeltaPair?.call(scheme);

  @override
  double? opacity(DynamicScheme scheme) => _opacity?.call(scheme);
}
