import 'package:material/src/material/flutter.dart';

abstract class StateThemeDataPartial with Diagnosticable {
  const StateThemeDataPartial();

  const factory StateThemeDataPartial.from({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  }) = _StateThemeDataPartial;

  double? get hoverStateLayerOpacity;

  double? get focusStateLayerOpacity;

  double? get pressedStateLayerOpacity;

  double? get draggedStateLayerOpacity;

  StateThemeDataPartial copyWith({
    covariant double? hoverStateLayerOpacity,
    covariant double? focusStateLayerOpacity,
    covariant double? pressedStateLayerOpacity,
    covariant double? draggedStateLayerOpacity,
  }) =>
      hoverStateLayerOpacity != null ||
          focusStateLayerOpacity != null ||
          pressedStateLayerOpacity != null ||
          draggedStateLayerOpacity != null
      ? StateThemeDataPartial.from(
          hoverStateLayerOpacity:
              hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
          focusStateLayerOpacity:
              focusStateLayerOpacity ?? this.focusStateLayerOpacity,
          pressedStateLayerOpacity:
              pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
          draggedStateLayerOpacity:
              draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
        )
      : this;

  StateThemeDataPartial merge(StateThemeDataPartial? other) => other != null
      ? copyWith(
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
        )
      : this;

  WidgetStateProperty<double> get asWidgetStateLayerOpacity =>
      _WidgetStateLayerOpacityFromStateThemeDataPartial(this);

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<double>(
          "hoverStateLayerOpacity",
          hoverStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<double>(
          "focusStateLayerOpacity",
          focusStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<double>(
          "pressedStateLayerOpacity",
          pressedStateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<double>(
          "draggedStateLayerOpacity",
          draggedStateLayerOpacity,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateThemeDataPartial &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoverStateLayerOpacity,
    focusStateLayerOpacity,
    pressedStateLayerOpacity,
    draggedStateLayerOpacity,
  );
}

class _StateThemeDataPartial extends StateThemeDataPartial {
  const _StateThemeDataPartial({
    this.hoverStateLayerOpacity,
    this.focusStateLayerOpacity,
    this.pressedStateLayerOpacity,
    this.draggedStateLayerOpacity,
  });

  @override
  final double? hoverStateLayerOpacity;

  @override
  final double? focusStateLayerOpacity;

  @override
  final double? pressedStateLayerOpacity;

  @override
  final double? draggedStateLayerOpacity;
}

abstract class StateThemeData extends StateThemeDataPartial {
  const StateThemeData();

  const factory StateThemeData.from({
    required double hoverStateLayerOpacity,
    required double focusStateLayerOpacity,
    required double pressedStateLayerOpacity,
    required double draggedStateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.fallback() = _StateThemeData.fallback;

  @override
  double get hoverStateLayerOpacity;

  @override
  double get focusStateLayerOpacity;

  @override
  double get pressedStateLayerOpacity;

  @override
  double get draggedStateLayerOpacity;

  @override
  StateThemeData copyWith({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  }) =>
      hoverStateLayerOpacity != null ||
          focusStateLayerOpacity != null ||
          pressedStateLayerOpacity != null ||
          draggedStateLayerOpacity != null
      ? StateThemeData.from(
          hoverStateLayerOpacity:
              hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
          focusStateLayerOpacity:
              focusStateLayerOpacity ?? this.focusStateLayerOpacity,
          pressedStateLayerOpacity:
              pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
          draggedStateLayerOpacity:
              draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
        )
      : this;

  @override
  StateThemeData merge(StateThemeDataPartial? other) => other != null
      ? copyWith(
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("hoverStateLayerOpacity", hoverStateLayerOpacity))
      ..add(DoubleProperty("focusStateLayerOpacity", focusStateLayerOpacity))
      ..add(
        DoubleProperty("pressedStateLayerOpacity", pressedStateLayerOpacity),
      )
      ..add(
        DoubleProperty("draggedStateLayerOpacity", draggedStateLayerOpacity),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateThemeData &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoverStateLayerOpacity,
    focusStateLayerOpacity,
    pressedStateLayerOpacity,
    draggedStateLayerOpacity,
  );
}

class _StateThemeData extends StateThemeData {
  const _StateThemeData({
    required this.hoverStateLayerOpacity,
    required this.focusStateLayerOpacity,
    required this.pressedStateLayerOpacity,
    required this.draggedStateLayerOpacity,
  });

  const _StateThemeData.fallback()
    : hoverStateLayerOpacity = 0.08,
      focusStateLayerOpacity = 0.10,
      pressedStateLayerOpacity = 0.10,
      draggedStateLayerOpacity = 0.16;

  @override
  final double hoverStateLayerOpacity;

  @override
  final double focusStateLayerOpacity;

  @override
  final double pressedStateLayerOpacity;

  @override
  final double draggedStateLayerOpacity;
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
      maybeOf(context) ?? const StateThemeData.fallback();
}

class _WidgetStateLayerOpacityFromStateThemeDataPartial
    implements WidgetStateProperty<double> {
  const _WidgetStateLayerOpacityFromStateThemeDataPartial(this._stateTheme);

  final StateThemeDataPartial _stateTheme;

  @override
  double resolve(WidgetStates states) => switch (_stateTheme) {
    _ when states.contains(WidgetState.disabled) => 0.0,
    StateThemeDataPartial(:final draggedStateLayerOpacity?)
        when states.contains(WidgetState.dragged) =>
      draggedStateLayerOpacity,
    StateThemeDataPartial(:final pressedStateLayerOpacity?)
        when states.contains(WidgetState.pressed) =>
      pressedStateLayerOpacity,
    StateThemeDataPartial(:final focusStateLayerOpacity?)
        when states.contains(WidgetState.focused) =>
      focusStateLayerOpacity,
    StateThemeDataPartial(:final hoverStateLayerOpacity?)
        when states.contains(WidgetState.hovered) =>
      hoverStateLayerOpacity,
    _ => 0.0,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _WidgetStateLayerOpacityFromStateThemeDataPartial &&
          _stateTheme == other._stateTheme;

  @override
  int get hashCode => Object.hash(runtimeType, _stateTheme);
}

extension StateThemeDataPartialExtension on StateThemeDataPartial {
  @Deprecated("Use asWidgetStateLayerOpacity instead.")
  WidgetStateProperty<double> get stateLayerOpacity =>
      asWidgetStateLayerOpacity;
}

extension StateThemeDataExtension on StateThemeData {
  @Deprecated("Use asWidgetStateLayerOpacity instead.")
  WidgetStateProperty<double> get stateLayerOpacity =>
      asWidgetStateLayerOpacity;
}

class StateLayerColor<S extends Object?> implements StateProperty<Color, S> {
  const StateLayerColor({this.color, this.opacity});

  final StateProperty<Color?, S>? color;
  final StateProperty<double?, S>? opacity;

  @override
  Color resolve(S states) {
    final resolvedColor = color?.resolve(states);
    if (resolvedColor == null) return Colors.transparent;
    if (resolvedColor.a <= 0.0) return resolvedColor;

    final resolvedOpacity = opacity?.resolve(states) ?? 0.0;
    return resolvedOpacity > 0.0
        ? resolvedColor.withValues(alpha: resolvedColor.a * resolvedOpacity)
        : resolvedColor.withAlpha(0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateLayerColor<S> &&
          color == other.color &&
          opacity == other.opacity;

  @override
  int get hashCode => Object.hash(runtimeType, color, opacity);
}

class WidgetStateLayerColor extends StateLayerColor<WidgetStates>
    implements WidgetStateProperty<Color> {
  const WidgetStateLayerColor({super.color, super.opacity});
}
