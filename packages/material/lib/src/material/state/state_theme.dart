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

  const factory StateThemeData.defaults() = _StateThemeDataDefaults;

  const factory StateThemeData._defaults({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) = _StateThemeDataDefaults;

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

class _StateThemeDataDefaults extends StateThemeData {
  const _StateThemeDataDefaults({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) : _disabledStateLayerOpacity = disabledStateLayerOpacity,
       _draggedStateLayerOpacity = draggedStateLayerOpacity,
       _focusStateLayerOpacity = focusStateLayerOpacity,
       _hoverStateLayerOpacity = hoverStateLayerOpacity,
       _pressedStateLayerOpacity = pressedStateLayerOpacity;

  final double? _disabledStateLayerOpacity;
  final double? _draggedStateLayerOpacity;
  final double? _focusStateLayerOpacity;
  final double? _hoverStateLayerOpacity;
  final double? _pressedStateLayerOpacity;

  @override
  double get disabledStateLayerOpacity => _disabledStateLayerOpacity ?? 0.38;

  @override
  double get draggedStateLayerOpacity => _draggedStateLayerOpacity ?? 0.16;

  @override
  double get focusStateLayerOpacity => _focusStateLayerOpacity ?? 0.1;

  @override
  double get hoverStateLayerOpacity => _hoverStateLayerOpacity ?? 0.08;

  @override
  double get pressedStateLayerOpacity => _pressedStateLayerOpacity ?? 0.1;

  @override
  StateThemeData copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) =>
      disabledStateLayerOpacity != null &&
          draggedStateLayerOpacity != null &&
          focusStateLayerOpacity != null &&
          hoverStateLayerOpacity != null &&
          pressedStateLayerOpacity != null
      ? .from(
          disabledStateLayerOpacity: disabledStateLayerOpacity,
          draggedStateLayerOpacity: draggedStateLayerOpacity,
          focusStateLayerOpacity: focusStateLayerOpacity,
          hoverStateLayerOpacity: hoverStateLayerOpacity,
          pressedStateLayerOpacity: pressedStateLayerOpacity,
        )
      : _StateThemeDataDefaults(
          disabledStateLayerOpacity:
              disabledStateLayerOpacity ?? _disabledStateLayerOpacity,
          draggedStateLayerOpacity:
              draggedStateLayerOpacity ?? _draggedStateLayerOpacity,
          focusStateLayerOpacity:
              focusStateLayerOpacity ?? _focusStateLayerOpacity,
          hoverStateLayerOpacity:
              hoverStateLayerOpacity ?? _hoverStateLayerOpacity,
          pressedStateLayerOpacity:
              pressedStateLayerOpacity ?? _pressedStateLayerOpacity,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _StateThemeDataDefaults &&
          _disabledStateLayerOpacity == other._disabledStateLayerOpacity &&
          _draggedStateLayerOpacity == other._draggedStateLayerOpacity &&
          _focusStateLayerOpacity == other._focusStateLayerOpacity &&
          _hoverStateLayerOpacity == other._hoverStateLayerOpacity &&
          _pressedStateLayerOpacity == other._pressedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _disabledStateLayerOpacity,
    _draggedStateLayerOpacity,
    _focusStateLayerOpacity,
    _hoverStateLayerOpacity,
    _pressedStateLayerOpacity,
  );
}

typedef StateThemeResolver = ThemeResolver<StateThemeDataPartial>;

typedef StateThemeResolverCallback =
    ThemeResolverCallback<StateThemeDataPartial>;

class _StateThemeResolver
    extends CombiningThemeResolver<StateThemeDataPartial> {
  const _StateThemeResolver(super.a, super.b);

  @override
  StateThemeDataPartial combine(
    StateThemeDataPartial a,
    StateThemeDataPartial b,
  ) => a.merge(b);
}

abstract class StateTheme extends StatelessWidget implements ProxyWidget {
  const StateTheme._({super.key, required this.child});

  const factory StateTheme.withResolver({
    Key? key,
    required StateThemeResolver resolver,
    required Widget child,
  }) = _StateThemeWithResolver;

  const factory StateTheme.withCallback({
    Key? key,
    required StateThemeResolverCallback callback,
    required Widget child,
  }) = _StateThemeWithCallback;

  const factory StateTheme.withData({
    Key? key,
    required StateThemeDataPartial data,
    required Widget child,
  }) = _StateThemeWithData;

  StateThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _StateTheme.maybeResolverOf(context);
    return _StateTheme(
      resolver: inherited != null
          ? _StateThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static StateThemeData of(BuildContext context) {
    final resolver = _StateTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        disabledStateLayerOpacity: data.disabledStateLayerOpacity,
        draggedStateLayerOpacity: data.draggedStateLayerOpacity,
        focusStateLayerOpacity: data.focusStateLayerOpacity,
        hoverStateLayerOpacity: data.hoverStateLayerOpacity,
        pressedStateLayerOpacity: data.pressedStateLayerOpacity,
      );
    }
    return const .defaults();
  }
}

class _StateThemeWithResolver extends StateTheme {
  const _StateThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final StateThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<StateThemeResolver>("resolver", resolver),
    );
  }
}

class _StateThemeWithCallback extends StateTheme {
  const _StateThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final StateThemeResolverCallback callback;

  @override
  StateThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<StateThemeResolverCallback>("callback", callback),
    );
  }
}

class _StateThemeWithData extends StateTheme {
  const _StateThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final StateThemeDataPartial data;

  @override
  StateThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StateThemeDataPartial>("data", data));
  }
}

class _StateTheme extends InheritedTheme {
  const _StateTheme({super.key, required this.resolver, required super.child});

  final StateThemeResolver resolver;

  @override
  bool updateShouldNotify(_StateTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _StateTheme(resolver: resolver, child: child);

  static StateThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_StateTheme>()?.resolver;
}

class _WidgetStateLayerOpacityFromStateThemeDataPartial
    implements WidgetStateProperty<double> {
  const _WidgetStateLayerOpacityFromStateThemeDataPartial(this._stateTheme);

  final StateThemeDataPartial _stateTheme;

  @override
  double resolve(WidgetStates states) {
    states as StrictSet<WidgetState>;
    if (states.contains(.disabled)) {
      return 0.0;
    }
    if (states.contains(.dragged)) {
      return _stateTheme.draggedStateLayerOpacity ?? 0.0;
    }
    if (states.contains(.pressed)) {
      return _stateTheme.pressedStateLayerOpacity ?? 0.0;
    }
    if (states.contains(.focused)) {
      return _stateTheme.focusStateLayerOpacity ?? 0.0;
    }
    if (states.contains(.hovered)) {
      return _stateTheme.hoverStateLayerOpacity ?? 0.0;
    }
    return 0.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _WidgetStateLayerOpacityFromStateThemeDataPartial &&
          _stateTheme == other._stateTheme;

  @override
  int get hashCode => _stateTheme.hashCode;
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
