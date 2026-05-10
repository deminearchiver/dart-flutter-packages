import 'dart:convert';

import 'package:material/src/material/flutter.dart';

abstract interface class StateLayerColor<S extends Object?>
    implements StateProperty<Color, S> {
  const factory StateLayerColor({
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) = _StateLayerColor;

  static Color defaultResolver<S extends Object?>(
    S states, {
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) {
    final resolvedColor = color?.resolve(states);
    if (resolvedColor == null) return Colors.transparent;
    if (resolvedColor.a <= 0.0) return resolvedColor;
    final resolvedOpacity = opacity?.resolve(states) ?? 0.0;
    return resolvedOpacity > 0.0
        ? resolvedColor.withValues(alpha: resolvedColor.a * resolvedOpacity)
        : resolvedColor.withAlpha(0);
  }
}

final class _StateLayerColor<S extends Object?> implements StateLayerColor<S> {
  const _StateLayerColor({
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) : _color = color,
       _opacity = opacity;

  final StateProperty<Color?, S>? _color;
  final StateProperty<double?, S>? _opacity;

  @override
  Color resolve(S states) =>
      StateLayerColor.defaultResolver(states, color: _color, opacity: _opacity);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateLayerColor<S> &&
          _color == other._color &&
          _opacity == other._opacity;

  @override
  int get hashCode => Object.hash(_color, _opacity);
}

abstract interface class WidgetStateLayerColor
    implements WidgetStateProperty<Color>, StateLayerColor<WidgetStates> {
  const factory WidgetStateLayerColor({
    WidgetStateProperty<Color?>? color,
    WidgetStateProperty<double?>? opacity,
  }) = _WidgetStateLayerColor;
}

final class _WidgetStateLayerColor extends _StateLayerColor<WidgetStates>
    implements WidgetStateLayerColor {
  const _WidgetStateLayerColor({super.color, super.opacity});
}

abstract class MixedWidgetStateLayerColor<S extends Object?>
    implements WidgetStateLayerColor {
  const MixedWidgetStateLayerColor({
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) : _color = color,
       _opacity = opacity;

  const factory MixedWidgetStateLayerColor.from(
    S Function(WidgetStates widgetStates) transformer, {
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) = _CustomWidgetStateLayerColorWithCallback;

  const factory MixedWidgetStateLayerColor.withConverter(
    Converter<WidgetStates, S> converter, {
    StateProperty<Color?, S>? color,
    StateProperty<double?, S>? opacity,
  }) = _CustomWidgetStateLayerColorWithConverter;

  final StateProperty<Color?, S>? _color;
  final StateProperty<double?, S>? _opacity;

  @protected
  S resolveStates(WidgetStates widgetStates);

  @override
  Color resolve(WidgetStates widgetStates) => StateLayerColor.defaultResolver(
    resolveStates(widgetStates),
    color: _color,
    opacity: _opacity,
  );
}

final class _CustomWidgetStateLayerColorWithCallback<S extends Object?>
    extends MixedWidgetStateLayerColor<S> {
  const _CustomWidgetStateLayerColorWithCallback(
    S Function(WidgetStates widgetStates) transformer, {
    super.color,
    super.opacity,
  }) : _transformer = transformer;

  final S Function(WidgetStates widgetStates) _transformer;

  @override
  S resolveStates(WidgetStates widgetStates) => _transformer(widgetStates);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CustomWidgetStateLayerColorWithCallback<S> &&
          _color == other._color &&
          _opacity == other._opacity &&
          _transformer == other._transformer;

  @override
  int get hashCode => Object.hash(_color, _opacity, _transformer);
}

final class _CustomWidgetStateLayerColorWithConverter<S extends Object?>
    extends MixedWidgetStateLayerColor<S> {
  const _CustomWidgetStateLayerColorWithConverter(
    Converter<WidgetStates, S> converter, {
    super.color,
    super.opacity,
  }) : _converter = converter;

  final Converter<WidgetStates, S> _converter;

  @override
  S resolveStates(WidgetStates widgetStates) =>
      _converter.convert(widgetStates);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CustomWidgetStateLayerColorWithConverter<S> &&
          _color == other._color &&
          _opacity == other._opacity &&
          _converter == other._converter;

  @override
  int get hashCode => Object.hash(_color, _opacity, _converter);
}
