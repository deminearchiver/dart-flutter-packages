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

  /// `md.sys.state.disabled.state-layer-opacity`
  double? get disabledStateLayerOpacity;

  /// `md.sys.state.dragged.state-layer-opacity`
  double? get draggedStateLayerOpacity;

  /// `md.sys.state.focus.state-layer-opacity`
  double? get focusStateLayerOpacity;

  /// `md.sys.state.hover.state-layer-opacity`
  double? get hoverStateLayerOpacity;

  /// `md.sys.state.pressed.state-layer-opacity`
  double? get pressedStateLayerOpacity;

  StateThemeDataPartial copy() => maybeCopyWith();

  StateThemeDataPartial copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) => .from(
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
  );

  StateThemeDataPartial maybeCopyWith({
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
      ? copyWith(
          disabledStateLayerOpacity: disabledStateLayerOpacity,
          draggedStateLayerOpacity: draggedStateLayerOpacity,
          focusStateLayerOpacity: focusStateLayerOpacity,
          hoverStateLayerOpacity: hoverStateLayerOpacity,
          pressedStateLayerOpacity: pressedStateLayerOpacity,
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
      : copy();

  StateThemeDataPartial maybeMerge(StateThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          disabledStateLayerOpacity: other.disabledStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
        )
      : this;

  bool get isEmpty =>
      disabledStateLayerOpacity == null &&
      draggedStateLayerOpacity == null &&
      focusStateLayerOpacity == null &&
      hoverStateLayerOpacity == null &&
      pressedStateLayerOpacity == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      disabledStateLayerOpacity != null &&
      draggedStateLayerOpacity != null &&
      focusStateLayerOpacity != null &&
      hoverStateLayerOpacity != null &&
      pressedStateLayerOpacity != null;

  StateThemeData? get asConcrete =>
      isConcrete ? _StateThemeDataPartialAsConcrete(this) : null;

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
}

final class _StateThemeDataPartial extends StateThemeDataPartial {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateThemeDataPartial &&
          disabledStateLayerOpacity == other.disabledStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    disabledStateLayerOpacity,
    draggedStateLayerOpacity,
    focusStateLayerOpacity,
    hoverStateLayerOpacity,
    pressedStateLayerOpacity,
  );
}

final class _StateThemeDataPartialAsConcrete extends StateThemeData {
  _StateThemeDataPartialAsConcrete(StateThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final StateThemeDataPartial _value;

  @override
  double get disabledStateLayerOpacity => _value.disabledStateLayerOpacity!;

  @override
  double get draggedStateLayerOpacity => _value.draggedStateLayerOpacity!;

  @override
  double get focusStateLayerOpacity => _value.focusStateLayerOpacity!;

  @override
  double get hoverStateLayerOpacity => _value.hoverStateLayerOpacity!;

  @override
  double get pressedStateLayerOpacity => _value.pressedStateLayerOpacity!;

  @override
  StateThemeData copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) => _StateThemeDataPartialAsConcrete(
    _value.copyWith(
      disabledStateLayerOpacity: disabledStateLayerOpacity,
      draggedStateLayerOpacity: draggedStateLayerOpacity,
      focusStateLayerOpacity: focusStateLayerOpacity,
      hoverStateLayerOpacity: hoverStateLayerOpacity,
      pressedStateLayerOpacity: pressedStateLayerOpacity,
    ),
  );

  @override
  StateThemeData maybeCopyWith({
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
      : disabledStateLayerOpacity != null ||
            draggedStateLayerOpacity != null ||
            focusStateLayerOpacity != null ||
            hoverStateLayerOpacity != null ||
            pressedStateLayerOpacity != null
      ? copyWith(
          disabledStateLayerOpacity: disabledStateLayerOpacity,
          draggedStateLayerOpacity: draggedStateLayerOpacity,
          focusStateLayerOpacity: focusStateLayerOpacity,
          hoverStateLayerOpacity: hoverStateLayerOpacity,
          pressedStateLayerOpacity: pressedStateLayerOpacity,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

final class _WidgetStateLayerOpacityFromStateThemeDataPartial
    implements WidgetStateProperty<double> {
  const _WidgetStateLayerOpacityFromStateThemeDataPartial(
    StateThemeDataPartial stateTheme,
  ) : _stateTheme = stateTheme;

  final StateThemeDataPartial _stateTheme;

  @override
  double resolve(WidgetStates states) {
    states as StrictSet<WidgetState>;
    if (states.contains(.disabled)) {
      return 0.0;
    }
    if (states.contains(.dragged)) {
      final result = _stateTheme.draggedStateLayerOpacity;
      if (result != null) return result;
    }
    if (states.contains(.pressed)) {
      final result = _stateTheme.pressedStateLayerOpacity;
      if (result != null) return result;
    }
    if (states.contains(.focused)) {
      final result = _stateTheme.focusStateLayerOpacity;
      if (result != null) return result;
    }
    if (states.contains(.hovered)) {
      final result = _stateTheme.hoverStateLayerOpacity;
      if (result != null) return result;
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

abstract class StateThemeData extends StateThemeDataPartial {
  const StateThemeData();

  const factory StateThemeData.from({
    required double disabledStateLayerOpacity,
    required double draggedStateLayerOpacity,
    required double focusStateLayerOpacity,
    required double hoverStateLayerOpacity,
    required double pressedStateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.defaults({StateThemeDataPartial? overrides}) =
      _StateThemeDataDefaults;

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
  StateThemeData copy() => maybeCopyWith();

  @override
  StateThemeData copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) => .from(
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
  );

  @override
  StateThemeData maybeCopyWith({
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
      ? copyWith(
          disabledStateLayerOpacity: disabledStateLayerOpacity,
          draggedStateLayerOpacity: draggedStateLayerOpacity,
          focusStateLayerOpacity: focusStateLayerOpacity,
          hoverStateLayerOpacity: hoverStateLayerOpacity,
          pressedStateLayerOpacity: pressedStateLayerOpacity,
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
      : copy();

  @override
  StateThemeData maybeMerge(StateThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          disabledStateLayerOpacity: other.disabledStateLayerOpacity,
          draggedStateLayerOpacity: other.draggedStateLayerOpacity,
          focusStateLayerOpacity: other.focusStateLayerOpacity,
          hoverStateLayerOpacity: other.hoverStateLayerOpacity,
          pressedStateLayerOpacity: other.pressedStateLayerOpacity,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  StateThemeData? get asConcrete => this;

  @override
  WidgetStateProperty<double> get asWidgetStateLayerOpacity =>
      _WidgetStateLayerOpacityFromStateThemeData(this);

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
}

final class _StateThemeData extends StateThemeData {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateThemeData &&
          disabledStateLayerOpacity == other.disabledStateLayerOpacity &&
          draggedStateLayerOpacity == other.draggedStateLayerOpacity &&
          focusStateLayerOpacity == other.focusStateLayerOpacity &&
          hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
          pressedStateLayerOpacity == other.pressedStateLayerOpacity;

  @override
  int get hashCode => Object.hash(
    disabledStateLayerOpacity,
    draggedStateLayerOpacity,
    focusStateLayerOpacity,
    hoverStateLayerOpacity,
    pressedStateLayerOpacity,
  );
}

final class _StateThemeDataDefaults extends StateThemeData {
  const _StateThemeDataDefaults({StateThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final StateThemeDataPartial _overrides;

  @override
  double get disabledStateLayerOpacity =>
      _overrides.disabledStateLayerOpacity ?? 0.38;

  @override
  double get draggedStateLayerOpacity =>
      _overrides.draggedStateLayerOpacity ?? 0.16;

  @override
  double get focusStateLayerOpacity => _overrides.focusStateLayerOpacity ?? 0.1;

  @override
  double get hoverStateLayerOpacity =>
      _overrides.hoverStateLayerOpacity ?? 0.08;

  @override
  double get pressedStateLayerOpacity =>
      _overrides.pressedStateLayerOpacity ?? 0.1;

  @override
  StateThemeData copyWith({
    double? disabledStateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) => _StateThemeDataDefaults(
    overrides: _overrides.copyWith(
      disabledStateLayerOpacity: disabledStateLayerOpacity,
      draggedStateLayerOpacity: draggedStateLayerOpacity,
      focusStateLayerOpacity: focusStateLayerOpacity,
      hoverStateLayerOpacity: hoverStateLayerOpacity,
      pressedStateLayerOpacity: pressedStateLayerOpacity,
    ),
  );

  @override
  StateThemeData maybeCopyWith({
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
      : disabledStateLayerOpacity != null ||
            draggedStateLayerOpacity != null ||
            focusStateLayerOpacity != null ||
            hoverStateLayerOpacity != null ||
            pressedStateLayerOpacity != null
      ? copyWith(
          disabledStateLayerOpacity: disabledStateLayerOpacity,
          draggedStateLayerOpacity: draggedStateLayerOpacity,
          focusStateLayerOpacity: focusStateLayerOpacity,
          hoverStateLayerOpacity: hoverStateLayerOpacity,
          pressedStateLayerOpacity: pressedStateLayerOpacity,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

final class _WidgetStateLayerOpacityFromStateThemeData
    extends _WidgetStateLayerOpacityFromStateThemeDataPartial {
  const _WidgetStateLayerOpacityFromStateThemeData(
    StateThemeData super.stateTheme,
  );

  @override
  StateThemeData get _stateTheme => super._stateTheme as StateThemeData;

  @override
  double resolve(WidgetStates states) {
    states as StrictSet<WidgetState>;
    if (states.contains(.disabled)) {
      return 0.0;
    }
    if (states.contains(.dragged)) {
      return _stateTheme.draggedStateLayerOpacity;
    }
    if (states.contains(.pressed)) {
      return _stateTheme.pressedStateLayerOpacity;
    }
    if (states.contains(.focused)) {
      return _stateTheme.focusStateLayerOpacity;
    }
    if (states.contains(.hovered)) {
      return _stateTheme.hoverStateLayerOpacity;
    }
    return 0.0;
  }
}

abstract class StateTheme extends SingleChildStatelessWidget {
  const StateTheme._({super.key, super.child});

  const factory StateTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<StateThemeDataPartial> resolver,
    Widget? child,
  }) = _StateThemeWithResolver<StateThemeDataPartial>;

  const factory StateTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<StateThemeDataPartial> callback,
    Widget? child,
  }) = _StateThemeWithCallback<StateThemeDataPartial>;

  const factory StateTheme.mergeWithData({
    Key? key,
    required StateThemeDataPartial data,
    Widget? child,
  }) = _StateThemeWithData<StateThemeDataPartial>;

  const factory StateTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<StateThemeData> resolver,
    Widget? child,
  }) = _StateThemeWithResolver<StateThemeData>;

  const factory StateTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<StateThemeData> callback,
    Widget? child,
  }) = _StateThemeWithCallback<StateThemeData>;

  const factory StateTheme.replaceWithData({
    Key? key,
    required StateThemeData data,
    Widget? child,
  }) = _StateThemeWithData<StateThemeData>;

  ThemeResolver<StateThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _StateTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static StateThemeData? maybeOf(BuildContext context) {
    final overrides = _StateTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static StateThemeData of(BuildContext context) =>
      .defaults(overrides: _StateTheme.maybeOverridesOf(context));
}

class _StateThemeWithResolver<T extends StateThemeDataPartial>
    extends StateTheme {
  const _StateThemeWithResolver({
    super.key,
    required this.resolver,
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _StateThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _StateThemeWithCallback<T extends StateThemeDataPartial>
    extends StateTheme {
  const _StateThemeWithCallback({
    super.key,
    required this.callback,
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _StateThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _StateThemeWithData<T extends StateThemeDataPartial> extends StateTheme {
  const _StateThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _StateThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _StateTheme
    extends
        InheritedThemeResolverWidget<
          StateThemeDataPartial,
          _StateTheme,
          _StateThemeElement
        >
    implements InheritedTheme {
  const _StateTheme({super.key, required super.resolver, required super.child});

  @override
  StateThemeDataPartial merge(
    StateThemeDataPartial fallback,
    StateThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(StateThemeDataPartial data) => data.isConcrete;

  @override
  _StateThemeElement createElement() => _StateThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _StateTheme(resolver: resolver, child: child);

  static ThemeResolver<StateThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        StateThemeDataPartial,
        _StateTheme,
        _StateThemeElement
      >(context);

  static StateThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        StateThemeDataPartial,
        _StateTheme,
        _StateThemeElement
      >(context);
}

final class _StateThemeElement
    extends
        InheritedThemeResolverElement<
          StateThemeDataPartial,
          _StateTheme,
          _StateThemeElement
        > {
  _StateThemeElement(super.widget);
}
