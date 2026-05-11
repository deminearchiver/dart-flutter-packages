// ignore_for_file: use_to_and_as_if_applicable

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:material/src/material/flutter.dart';

mixin StatesConstraint<S extends Object?> {
  /// Whether the provided [states] satisfy this object's criteria.
  bool isSatisfiedBy(S states);

  /// Combines two [StatesConstraint] values using logical "and".
  StatesConstraint<S> operator &(StatesConstraint<S> other) =>
      _StateAnd<S>(this, other);

  /// Combines two [StatesConstraint] values using logical "or".
  StatesConstraint<S> operator |(StatesConstraint<S> other) =>
      _StateOr<S>(this, other);

  /// Takes a StatesConstraint] and applies the logical "not".
  StatesConstraint<S> operator ~() => _StateNot<S>(this);

  static StatesConstraint<S> any<S extends Object?>() => _AnyStates<S>();
}

sealed class _StateCombo<S extends Object?> with StatesConstraint<S> {
  const _StateCombo(this.first, this.second);

  final StatesConstraint<S> first;
  final StatesConstraint<S> second;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateCombo<S> && first == other.first && second == other.second;

  @override
  int get hashCode => Object.hash(first, second);
}

class _StateAnd<S extends Object?> extends _StateCombo<S> {
  const _StateAnd(super.first, super.second);

  @override
  bool isSatisfiedBy(S states) =>
      first.isSatisfiedBy(states) && second.isSatisfiedBy(states);

  @override
  String toString() => "($first & $second)";
}

class _StateOr<S extends Object?> extends _StateCombo<S> {
  const _StateOr(super.first, super.second);

  @override
  bool isSatisfiedBy(S states) =>
      first.isSatisfiedBy(states) || second.isSatisfiedBy(states);

  @override
  String toString() => "($first | $second)";
}

class _StateNot<S extends Object?> with StatesConstraint<S> {
  const _StateNot(this.value);

  final StatesConstraint<S> value;

  @override
  bool isSatisfiedBy(S states) => !value.isSatisfiedBy(states);

  @override
  String toString() => "~$value";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _StateNot<S> && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

extension StatesConstraintExtension<S extends Object?> on StatesConstraint<S> {
  StatesConstraint<S> operator &(StatesConstraint<S> other) =>
      _StateAnd<S>(this, other);

  StatesConstraint<S> operator |(StatesConstraint<S> other) =>
      _StateOr<S>(this, other);

  StatesConstraint<S> operator ~() => _StateNot<S>(this);
}

class _AnyStates<S extends Object?> with StatesConstraint<S> {
  const _AnyStates();

  @override
  bool isSatisfiedBy(S states) => true;

  @override
  String toString() => "StatesConstraint.any<$S>()";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _AnyStates<S>;

  @override
  int get hashCode => runtimeType.hashCode;
}

typedef PropertyResolver<T extends Object?, S extends Object?> =
    T Function(S states);

typedef PropertyFactory<T extends Object?> = T Function();

typedef StateMap<T extends Object?, S extends Object?> =
    Map<StatesConstraint<S>, T>;

abstract class StateProperty<T extends Object?, S extends Object?> {
  const StateProperty();

  const factory StateProperty.fromMap(StateMap<T, S> map) = StateMapper;

  const factory StateProperty.resolveWith(PropertyResolver<T, S> callback) =
      _StatePropertyWith;

  factory StateProperty.resolveOnce(PropertyFactory<T> callback) =
      _StatePropertyOnce;

  const factory StateProperty.all(T value) = _StatePropertyAll;

  T resolve(S states);

  static T resolveAs<T, S>(T value, S states) =>
      value is StateProperty<T, S> ? value.resolve(states) : value;

  static StateProperty<T?, S>? lerp<T extends Object, S extends Object?>(
    StateProperty<T?, S>? a,
    StateProperty<T?, S>? b,
    double t,
    LerpFunction<T> lerpFunction,
  ) =>
      a != null || b != null ? _StatePropertyLerp(a, b, t, lerpFunction) : null;
}

typedef LerpFunction<T extends Object?> = T? Function(T? a, T? b, double t);

class _StatePropertyLerp<T extends Object, S extends Object?>
    implements StateProperty<T?, S> {
  const _StatePropertyLerp(this._a, this._b, this._t, this._lerpFunction);

  final StateProperty<T?, S>? _a;
  final StateProperty<T?, S>? _b;
  final double _t;
  final LerpFunction<T> _lerpFunction;

  @override
  T? resolve(S states) =>
      _lerpFunction(_a?.resolve(states), _b?.resolve(states), _t);
}

class StatePropertyTween<T extends Object, S extends Object?>
    extends Tween<StateProperty<T?, S>?> {
  StatePropertyTween({
    required LerpFunction<T> lerpFunction,
    super.begin,
    super.end,
  }) : _lerpFunction = lerpFunction;

  final LerpFunction<T> _lerpFunction;

  @override
  StateProperty<T?, S>? lerp(double t) => .lerp(begin, end, t, _lerpFunction);
}

class StateMapper<T extends Object?, S extends Object?>
    with Diagnosticable
    implements StateProperty<T, S> {
  /// Creates a [WidgetStateProperty] object that can resolve
  /// to a value of type [T] using the provided [map].
  const StateMapper(StateMap<T, S> map) : _map = map;

  final StateMap<T, S> _map;

  @override
  T resolve(S states) {
    for (final entry in _map.entries) {
      if (entry.key.isSatisfiedBy(states)) {
        return entry.value;
      }
    }

    try {
      return null as T;
    } on TypeError {
      rethrow;
      // throw ArgumentError(
      //   "The current states are $value.\n"
      //   "None of the provided map keys matched this set, "
      //   "and the type \"$T\" is non-nullable.\n"
      //   "Consider using \"WidgetCustomStateProperty<$T?>.fromMap()", "
      //   "or adding the \"WidgetState.any\" key to this map.",
      // );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StateMap<T, S>>("map", _map));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) =>
      "CustomStateMapper<$T, $S>($_map)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateMapper<T, S> &&
          mapEquals(_map, other._map);

  @override
  int get hashCode => MapEquality<StatesConstraint<S>, T>().hash(_map);
}

class _StatePropertyWith<T extends Object?, S extends Object?>
    implements StateProperty<T, S> {
  const _StatePropertyWith(this._resolve);

  final PropertyResolver<T, S> _resolve;

  @override
  T resolve(S states) => _resolve(states);
}

class _StatePropertyOnce<T extends Object?, S extends Object?>
    implements StateProperty<T, S> {
  _StatePropertyOnce(this._resolve);

  final PropertyFactory<T> _resolve;
  T? _value;

  @override
  T resolve(S _) => _value ??= _resolve();

  @override
  String toString() => "CustomStateProperty.resolveOnce<$T, $S>()";
}

class _StatePropertyAll<T extends Object?, S extends Object?>
    implements StateProperty<T, S> {
  const _StatePropertyAll(this.value);

  final T value;

  @override
  T resolve(S _) => value;

  @override
  String toString() => "CustomStateProperty.all($value)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StatePropertyAll<T, S> && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

extension StatePropertyExtension1<T extends Object?, S extends Object?>
    on StateProperty<T, S> {
  StateProperty<U, S> mapValue<U extends Object?>(
    U Function(S states, T value) callback,
  ) => _MapValueWithStatesAndValue(this, callback);

  StateProperty<T, S> mapStates(S Function(S states) callback) =>
      _MapStatesWithStates(this, callback);

  WidgetStateProperty<T> toLegacy(WidgetPropertyResolver<S> callback) =>
      _LegacyFromCallback(this, callback);
}

extension StatePropertyExtension2<T extends Object, S extends Object?>
    on StateProperty<T?, S> {
  StateProperty<T, S> or(T defaultValue) =>
      mapValue((_, value) => value ?? defaultValue);

  StateProperty<T, S> orElse(PropertyResolver<T, S> callback) =>
      mapValue((states, value) => value ?? callback(states));

  StateProperty<T?, S> orElseMaybe(PropertyResolver<T?, S>? callback) =>
      callback != null
      ? mapValue((states, value) => value ?? callback(states))
      : this;

  StateProperty<T, S> orWith(StateProperty<T, S> property) =>
      mapValue((states, value) => value ?? property.resolve(states));

  StateProperty<T?, S> orWithMaybe(StateProperty<T?, S>? property) =>
      property != null
      ? mapValue((states, value) => value ?? property.resolve(states))
      : this;
}

extension StatePropertyExtenion3<T extends Object?>
    on StateProperty<T, WidgetStates> {
  flutter.WidgetStateProperty<T> get asLegacy => _Legacy(this);
}

extension StatePropertyExtension4<T extends Object, S extends Object?>
    on StateProperty<T?, S>? {
  StateProperty<T?, S>? maybeMergeNullable(StateProperty<T?, S>? other) =>
      other != null
      ? other.mapValue((states, value) => value ?? this?.resolve(states))
      : this;

  StateProperty<T?, S>? maybeCombineNullable(
    StateProperty<T?, S>? other,
    T Function(T a, T? b) combine,
  ) => other != null
      ? other.mapValue((states, b) {
          final a = this?.resolve(states);
          return a != null ? combine(a, b) : b;
        })
      : this;
}

extension StatePropertyExtension5<T extends Object, S extends Object?>
    on StateProperty<T, S> {
  StateProperty<T, S> maybeMerge(StateProperty<T?, S>? other) => other != null
      ? other.mapValue((states, value) => value ?? resolve(states))
      : this;

  StateProperty<T, S> maybeCombine<U extends Object>(
    StateProperty<U?, S>? other,
    T Function(T a, U? b) combine,
  ) => other != null
      ? other.mapValue((states, b) {
          final a = resolve(states);
          return combine(a, b);
        })
      : this;
}

class _MapValueWithStatesAndValue<
  T extends Object?,
  S extends Object?,
  U extends Object?
>
    implements StateProperty<U, S> {
  const _MapValueWithStatesAndValue(this._parent, this._callback);

  final StateProperty<T, S> _parent;
  final U Function(S states, T value) _callback;

  @override
  U resolve(S states) => _callback(states, _parent.resolve(states));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MapValueWithStatesAndValue<T, S, U> &&
          _parent == other._parent &&
          _callback == other._callback;

  @override
  int get hashCode => Object.hash(_parent, _callback);
}

class _MapStatesWithStates<T, S> implements StateProperty<T, S> {
  const _MapStatesWithStates(this._parent, this._callback);

  final StateProperty<T, S> _parent;
  final S Function(S states) _callback;

  @override
  T resolve(S states) => _parent.resolve(_callback(states));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MapStatesWithStates<T, S> &&
          _parent == other._parent &&
          _callback == other._callback;

  @override
  int get hashCode => Object.hash(_parent, _callback);
}

// class _Merged<T1, T2, S, U> implements StateProperty<U, S> {
//   const _Merged(this._a, this._b, this._callback);

//   final StateProperty<T1, S> _a;
//   final StateProperty<T2, S> _b;
//   final U Function(S states, T1 a, T2 b) _callback;

//   @override
//   U resolve(S states) =>
//       _callback(states, _a.resolve(states), _b.resolve(states));
// }

class _Legacy<T extends Object?> implements flutter.WidgetStateProperty<T> {
  const _Legacy(this._parent);

  final StateProperty<T, WidgetStates> _parent;

  @override
  T resolve(Set<WidgetState> states) => _parent.resolve(states);
}

class _LegacyFromCallback<T, S> implements WidgetStateProperty<T> {
  const _LegacyFromCallback(this._parent, this._callback);

  final StateProperty<T, S> _parent;
  final WidgetPropertyResolver<S> _callback;

  @override
  T resolve(Set<WidgetState> states) => _parent.resolve(_callback(states));
}

typedef WidgetStates = Set<WidgetState>;

abstract class WidgetStateProperty<T extends Object?>
    implements StateProperty<T, WidgetStates>, flutter.WidgetStateProperty<T> {
  WidgetStateProperty();

  const factory WidgetStateProperty.all(T value) = WidgetStatePropertyAll<T>;

  /// Convenience method for creating a [WidgetStateProperty] from a
  /// [WidgetPropertyResolver] function alone.
  const factory WidgetStateProperty.resolveWith(
    WidgetPropertyResolver<T> callback,
  ) = _WidgetStatePropertyWith<T>;

  const factory WidgetStateProperty.fromMap(WidgetStateMap<T> map) =
      WidgetStateMapper<T>;

  static T resolveAs<T>(T value, Set<WidgetState> states) {
    if (value is WidgetStateProperty<T>) {
      return value.resolve(states);
    }
    if (value is flutter.WidgetStateProperty<T>) {
      return value.resolve(states);
    }
    return value;
  }

  /// Returns a value of type `T` that depends on [states].
  ///
  /// Widgets like [TextButton] and [ElevatedButton] apply this method to their
  /// current [WidgetState]s to compute colors and other visual parameters
  /// at build time.
  @override
  T resolve(WidgetStates states);
}

typedef WidgetStateMap<T extends Object?> = StateMap<T, WidgetStates>;

class WidgetStateMapper<T extends Object?> extends StateMapper<T, WidgetStates>
    implements WidgetStateProperty<T>, flutter.WidgetStateMapper<T> {
  const WidgetStateMapper(super.map);

  @override
  void debugFillProperties(
    DiagnosticPropertiesBuilder properties, {
    String prefix = '',
  }) {
    super.debugFillProperties(properties);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) =>
      "WidgetStateMapper<$T>($_map)";

  @override
  Never noSuchMethod(Invocation invocation) {
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'There was an attempt to access the "${invocation.memberName}" '
        'field of a WidgetStateMapper<$T> object.',
      ),
      ErrorDescription('$this'),
      ErrorDescription(
        'WidgetStateProperty objects should only be used '
        'in places that document their support.',
      ),
      ErrorHint(
        'Double-check whether the map was used in a place that '
        'documents support for WidgetStateProperty objects. If so, '
        'please file a bug report. (The https://pub.dev/ page for a package '
        'contains a link to "View/report issues".)',
      ),
    ]);
  }
}

class WidgetStatePropertyAll<T extends Object?>
    extends _StatePropertyAll<T, WidgetStates>
    implements WidgetStateProperty<T>, flutter.WidgetStatePropertyAll<T> {
  const WidgetStatePropertyAll(super.value);

  @override
  String toString() => value is double
      ? "WidgetStatePropertyAll(${debugFormatDouble(value as double)})"
      : "WidgetStatePropertyAll($value)";
}

class _WidgetStatePropertyWith<T extends Object?>
    extends _StatePropertyWith<T, WidgetStates>
    implements WidgetStateProperty<T> {
  const _WidgetStatePropertyWith(super._resolve);
}

abstract interface class StatesController<S extends Object?>
    implements flutter.WidgetStatesController {
  const factory StatesController.fromCallbacks(
    ValueNotifier<S> states, {
    required WidgetStates Function(S states) encode,
    required S Function(WidgetStates states) decode,
  }) = _StatesControllerFromCallbacks;

  const factory StatesController.fromCodec(
    ValueNotifier<S> states, {
    required WidgetStatesCodec<S> codec,
  }) = _StatesControllerFromCodec;
}

class WidgetStatesController
    with ChangeNotifier
    implements StatesController<WidgetStates> {
  WidgetStatesController([WidgetStates? value])
    : _value = <WidgetState>{...?value} {
    if (kFlutterMemoryAllocationsEnabled) {
      ChangeNotifier.maybeDispatchObjectCreation(this);
    }
  }

  WidgetStates _value;

  @override
  WidgetStates get value => _value;

  @override
  set value(WidgetStates newValue) {
    // TODO: consider using setEquals
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  void update(WidgetState state, bool add) {
    final valueChanged = add ? _value.add(state) : _value.remove(state);
    if (valueChanged) {
      notifyListeners();
    }
  }

  @override
  String toString() => "${describeIdentity(this)}($value)";
}

mixin _StatesControllerWithParentMixin<S extends Object?>
    implements StatesController<S> {
  ValueNotifier<S> get parent;

  @protected
  WidgetStates encode(S states);

  @protected
  S decode(WidgetStates states);

  @override
  void addListener(VoidCallback listener) {
    parent.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    parent.removeListener(listener);
  }

  @override
  void notifyListeners() {
    parent.notifyListeners();
  }

  @override
  bool get hasListeners => parent.hasListeners;

  @override
  void dispose() {}

  @override
  Set<WidgetState> get value => encode(parent.value);

  @override
  set value(Set<WidgetState> value) {
    parent.value = decode(value);
  }

  @override
  void update(WidgetState state, bool add) {}
}

class _StatesControllerFromCallbacks<S extends Object?>
    with _StatesControllerWithParentMixin<S>
    implements StatesController<S> {
  const _StatesControllerFromCallbacks(
    ValueNotifier<S> states, {
    required WidgetStates Function(S states) encode,
    required S Function(WidgetStates states) decode,
  }) : parent = states,
       _encode = encode,
       _decode = decode;

  final WidgetStates Function(S states) _encode;
  final S Function(WidgetStates states) _decode;

  @override
  final ValueNotifier<S> parent;

  @override
  WidgetStates encode(S states) => _encode(states);

  @override
  S decode(WidgetStates states) => _decode(states);

  @override
  String toString() => "${describeIdentity(this)}($value)";
}

class _StatesControllerFromCodec<S extends Object?>
    with _StatesControllerWithParentMixin<S>
    implements StatesController<S> {
  const _StatesControllerFromCodec(
    ValueNotifier<S> states, {
    required WidgetStatesCodec<S> codec,
  }) : parent = states,
       _codec = codec;

  final WidgetStatesCodec<S> _codec;

  @override
  final ValueNotifier<S> parent;

  @override
  WidgetStates encode(S states) => _codec.encode(states);

  @override
  S decode(WidgetStates states) => _codec.decode(states);

  @override
  String toString() => "${describeIdentity(this)}($value)";
}

typedef WidgetStatesCodec<S extends Object?> = Codec<S, WidgetStates>;
