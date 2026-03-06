import 'dart:convert';

import 'package:material/src/material/flutter.dart';

abstract class StateThemeDataPartial with Diagnosticable {
  const StateThemeDataPartial();

  const factory StateThemeDataPartial.from({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) = _StateThemeDataPartial;

  double? get disabledStateLayerOpacity;

  double? get draggedStateLayerOpacity;

  double? get focusStateLayerOpacity;

  double? get hoverStateLayerOpacity;

  double? get pressedStateLayerOpacity;

  StateThemeDataPartial copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) =>
      disabledStateLayerOpacity != null ||
          draggedStateLayerOpacity != null ||
          focusStateLayerOpacity != null ||
          hoverStateLayerOpacity != null ||
          pressedStateLayerOpacity != null
      ? .from(
          disabledStateLayerOpacity:
              disabledStateLayerOpacity ?? this.disabledStateLayerOpacity,
          draggedStateLayerOpacity:
              draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
          focusStateLayerOpacity:
              focusStateLayerOpacity ?? this.focusStateLayerOpacity,
          hoverStateLayerOpacity:
              hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
          pressedStateLayerOpacity:
              pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
        )
      : this;

  StateThemeDataPartial merge(StateThemeDataPartial? other) => other != null
      ? copyWith(
          disabledStateLayerOpacity: other.disabledStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
        )
      : this;

  WidgetStateProperty<double> get asWidgetStateLayerOpacity =>
      _WidgetStateLayerOpacityFromStateThemeDataPartial(this);

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DoubleProperty(
          "disabledStateLayerOpacity",
          disabledStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "draggedStateLayerOpacity",
          draggedStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "focusStateLayerOpacity",
          focusStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "hoverStateLayerOpacity",
          hoverStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "pressedStateLayerOpacity",
          pressedStateLayerOpacity,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateThemeDataPartial &&
          disabledStateLayerOpacity == other.disabledStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    disabledStateLayerOpacity,
    draggedStateLayerOpacity,
    focusStateLayerOpacity,
    hoverStateLayerOpacity,
    pressedStateLayerOpacity,
  );
}

class _StateThemeDataPartial extends StateThemeDataPartial {
  const _StateThemeDataPartial({
    this.disabledStateLayerOpacity,
    this.draggedStateLayerOpacity,
    this.focusStateLayerOpacity,
    this.hoverStateLayerOpacity,
    this.pressedStateLayerOpacity,
  });

  @override
  final double? disabledStateLayerOpacity;

  @override
  final double? draggedStateLayerOpacity;

  @override
  final double? focusStateLayerOpacity;

  @override
  final double? hoverStateLayerOpacity;

  @override
  final double? pressedStateLayerOpacity;
}

abstract class StateThemeData extends StateThemeDataPartial {
  const StateThemeData();

  const factory StateThemeData.from({
    required double disabledStateLayerOpacity,
    required double draggedStateLayerOpacity,
    required double focusStateLayerOpacity,
    required double hoverStateLayerOpacity,
    required double pressedStateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.fallback() = _StateThemeData.fallback;

  @override
  double get disabledStateLayerOpacity;

  @override
  double get draggedStateLayerOpacity;

  @override
  double get focusStateLayerOpacity;

  @override
  double get hoverStateLayerOpacity;

  @override
  double get pressedStateLayerOpacity;

  @override
  StateThemeData copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) =>
      disabledStateLayerOpacity != null ||
          draggedStateLayerOpacity != null ||
          focusStateLayerOpacity != null ||
          hoverStateLayerOpacity != null ||
          pressedStateLayerOpacity != null
      ? .from(
          disabledStateLayerOpacity:
              disabledStateLayerOpacity ?? this.disabledStateLayerOpacity,
          draggedStateLayerOpacity:
              draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
          focusStateLayerOpacity:
              focusStateLayerOpacity ?? this.focusStateLayerOpacity,
          hoverStateLayerOpacity:
              hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
          pressedStateLayerOpacity:
              pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
        )
      : this;

  @override
  StateThemeData merge(StateThemeDataPartial? other) => other != null
      ? copyWith(
          disabledStateLayerOpacity: other.disabledStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DoubleProperty("disabledStateLayerOpacity", disabledStateLayerOpacity),
      )
      ..add(
        DoubleProperty("draggedStateLayerOpacity", draggedStateLayerOpacity),
      )
      ..add(DoubleProperty("focusStateLayerOpacity", focusStateLayerOpacity))
      ..add(DoubleProperty("hoverStateLayerOpacity", hoverStateLayerOpacity))
      ..add(
        DoubleProperty("pressedStateLayerOpacity", pressedStateLayerOpacity),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateThemeData &&
          disabledStateLayerOpacity == other.disabledStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    disabledStateLayerOpacity,
    draggedStateLayerOpacity,
    focusStateLayerOpacity,
    hoverStateLayerOpacity,
    pressedStateLayerOpacity,
  );
}

class _StateThemeData extends StateThemeData {
  const _StateThemeData({
    required this.disabledStateLayerOpacity,
    required this.draggedStateLayerOpacity,
    required this.focusStateLayerOpacity,
    required this.hoverStateLayerOpacity,
    required this.pressedStateLayerOpacity,
  });

  const _StateThemeData.fallback()
    : disabledStateLayerOpacity = 0.38,
      draggedStateLayerOpacity = 0.16,
      focusStateLayerOpacity = 0.1,
      hoverStateLayerOpacity = 0.08,
      pressedStateLayerOpacity = 0.1;

  @override
  final double disabledStateLayerOpacity;

  @override
  final double draggedStateLayerOpacity;

  @override
  final double focusStateLayerOpacity;

  @override
  final double hoverStateLayerOpacity;

  @override
  final double pressedStateLayerOpacity;
}

class StateTheme extends InheritedTheme {
  const StateTheme({super.key, required this.data, required super.child});

  final StateThemeData data;

  @override
  bool updateShouldNotify(StateTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      StateTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StateThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required StateThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        StateTheme(key: key, data: of(context).merge(data), child: child),
  );

  static StateThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StateTheme>()?.data;

  static StateThemeData of(BuildContext context) =>
      maybeOf(context) ?? const .fallback();
}

class _WidgetStateLayerOpacityFromStateThemeDataPartial
    implements WidgetStateProperty<double> {
  const _WidgetStateLayerOpacityFromStateThemeDataPartial(this._stateTheme);

  final StateThemeDataPartial _stateTheme;

  @override
  double resolve(WidgetStates states) {
    states as StrictSet<WidgetState>;
    return switch (_stateTheme) {
      _ when states.contains(.disabled) => 0.0,
      StateThemeDataPartial(:final draggedStateLayerOpacity?)
          when states.contains(.dragged) =>
        draggedStateLayerOpacity,
      StateThemeDataPartial(:final pressedStateLayerOpacity?)
          when states.contains(.pressed) =>
        pressedStateLayerOpacity,
      StateThemeDataPartial(:final focusStateLayerOpacity?)
          when states.contains(.focused) =>
        focusStateLayerOpacity,
      StateThemeDataPartial(:final hoverStateLayerOpacity?)
          when states.contains(.hovered) =>
        hoverStateLayerOpacity,
      _ => 0.0,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _WidgetStateLayerOpacityFromStateThemeDataPartial &&
          _stateTheme == other._stateTheme;

  @override
  int get hashCode => Object.hash(runtimeType, _stateTheme);
}

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

class _StateLayerColor<S extends Object?> implements StateLayerColor<S> {
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
      runtimeType == other.runtimeType &&
          other is _StateLayerColor<S> &&
          _color == other._color &&
          _opacity == other._opacity;

  @override
  int get hashCode => Object.hash(runtimeType, _color, _opacity);
}

abstract interface class WidgetStateLayerColor
    implements WidgetStateProperty<Color>, StateLayerColor<WidgetStates> {
  const factory WidgetStateLayerColor({
    WidgetStateProperty<Color?>? color,
    WidgetStateProperty<double?>? opacity,
  }) = _WidgetStateLayerColor;
}

class _WidgetStateLayerColor extends _StateLayerColor<WidgetStates>
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is MixedWidgetStateLayerColor<S> &&
          _color == other._color &&
          _opacity == other._opacity;

  @override
  int get hashCode => Object.hash(runtimeType, _color, _opacity);
}

class _CustomWidgetStateLayerColorWithCallback<S extends Object?>
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
      runtimeType == other.runtimeType &&
          other is _CustomWidgetStateLayerColorWithCallback<S> &&
          _color == other._color &&
          _opacity == other._opacity &&
          _transformer == other._transformer;

  @override
  int get hashCode => Object.hash(runtimeType, _color, _opacity, _transformer);
}

class _CustomWidgetStateLayerColorWithConverter<S extends Object?>
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
      runtimeType == other.runtimeType &&
          other is _CustomWidgetStateLayerColorWithConverter<S> &&
          _color == other._color &&
          _opacity == other._opacity &&
          _converter == other._converter;

  @override
  int get hashCode => Object.hash(runtimeType, _color, _opacity, _converter);
}
