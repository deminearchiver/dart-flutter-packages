import 'package:material/src/material/flutter.dart';

abstract class SpringPartial with Diagnosticable {
  const SpringPartial();

  const factory SpringPartial.from({double? stiffness, double? damping}) =
      _SpringPartial;

  double? get stiffness;

  double? get damping;

  SpringPartial copy() => copyWith();

  SpringPartial copyWith({double? stiffness, double? damping}) => .from(
    stiffness: stiffness ?? this.stiffness,
    damping: damping ?? this.damping,
  );

  SpringPartial maybeCopyWith({double? stiffness, double? damping}) =>
      stiffness != null || damping != null
      ? copyWith(stiffness: stiffness, damping: damping)
      : this;

  SpringPartial merge(SpringPartial? other) => other != null
      ? copyWith(stiffness: other.stiffness, damping: other.damping)
      : copyWith();

  SpringPartial maybeMerge(SpringPartial? other) => other != null
      ? maybeCopyWith(stiffness: other.stiffness, damping: other.damping)
      : this;

  bool get isEmpty => stiffness == null && damping == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete => stiffness != null && damping != null;

  Spring? get asConcrete => isConcrete ? _SpringPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("stiffness", stiffness, defaultValue: null))
      ..add(DoubleProperty("damping", damping, defaultValue: null));
  }
}

final class _SpringPartial extends SpringPartial {
  const _SpringPartial({this.stiffness, this.damping});

  @override
  final double? stiffness;

  @override
  final double? damping;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpringPartial &&
          stiffness == other.stiffness &&
          damping == other.damping;

  @override
  int get hashCode => Object.hash(stiffness, damping);
}

final class _SpringPartialAsConcrete extends Spring {
  _SpringPartialAsConcrete(SpringPartial value)
    : assert(value.isConcrete),
      _value = value;

  final SpringPartial _value;

  @override
  double get stiffness => _value.stiffness!;

  @override
  double get damping => _value.damping!;

  @override
  Spring copyWith({double? stiffness, double? damping}) =>
      _SpringPartialAsConcrete(
        _value.copyWith(stiffness: stiffness, damping: damping),
      );

  @override
  Spring maybeCopyWith({double? stiffness, double? damping}) =>
      stiffness != null && damping != null
      ? .from(stiffness: stiffness, damping: damping)
      : stiffness != null || damping != null
      ? copyWith(stiffness: stiffness, damping: damping)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpringPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class Spring extends SpringPartial {
  const Spring();

  const factory Spring.from({
    required double stiffness,
    required double damping,
  }) = _Spring;

  @override
  double get stiffness;

  @override
  double get damping;

  @override
  Spring copy() => copyWith();

  @override
  Spring copyWith({double? stiffness, double? damping}) => .from(
    stiffness: stiffness ?? this.stiffness,
    damping: damping ?? this.damping,
  );

  @override
  Spring maybeCopyWith({double? stiffness, double? damping}) =>
      stiffness != null || damping != null
      ? copyWith(stiffness: stiffness, damping: damping)
      : this;

  @override
  Spring merge(SpringPartial? other) =>
      copyWith(stiffness: other?.stiffness, damping: other?.damping);

  @override
  Spring maybeMerge(SpringPartial? other) => other != null
      ? maybeCopyWith(stiffness: other.stiffness, damping: other.damping)
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  Spring get asConcrete => this;

  SpringDescription toSpringDescription() =>
      .withDampingRatio(mass: 1.0, stiffness: stiffness, ratio: damping);

  SpringMotion toMotion({bool snapToEnd = false}) =>
      .new(toSpringDescription(), snapToEnd: snapToEnd);

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("stiffness", stiffness))
      ..add(DoubleProperty("damping", damping));
  }
}

final class _Spring extends Spring {
  const _Spring({required this.stiffness, required this.damping});

  @override
  final double stiffness;

  @override
  final double damping;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Spring &&
          stiffness == other.stiffness &&
          damping == other.damping;

  @override
  int get hashCode => Object.hash(stiffness, damping);
}

abstract class SpringThemeDataPartial with Diagnosticable {
  const SpringThemeDataPartial();

  const factory SpringThemeDataPartial.from({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) = _SpringThemeDataPartial;

  SpringPartial? get fastSpatial;

  SpringPartial? get fastEffects;

  SpringPartial? get defaultSpatial;

  SpringPartial? get defaultEffects;

  SpringPartial? get slowSpatial;

  SpringPartial? get slowEffects;

  SpringThemeDataPartial copy() => copyWith();

  SpringThemeDataPartial copyWith({
    covariant SpringPartial? fastSpatial,
    covariant SpringPartial? fastEffects,
    covariant SpringPartial? defaultSpatial,
    covariant SpringPartial? defaultEffects,
    covariant SpringPartial? slowSpatial,
    covariant SpringPartial? slowEffects,
  }) => .from(
    fastSpatial: fastSpatial ?? this.fastSpatial,
    fastEffects: fastEffects ?? this.fastEffects,
    defaultSpatial: defaultSpatial ?? this.defaultSpatial,
    defaultEffects: defaultEffects ?? this.defaultEffects,
    slowSpatial: slowSpatial ?? this.slowSpatial,
    slowEffects: slowEffects ?? this.slowEffects,
  );

  SpringThemeDataPartial maybeCopyWith({
    covariant SpringPartial? fastSpatial,
    covariant SpringPartial? fastEffects,
    covariant SpringPartial? defaultSpatial,
    covariant SpringPartial? defaultEffects,
    covariant SpringPartial? slowSpatial,
    covariant SpringPartial? slowEffects,
  }) =>
      fastSpatial != null ||
          fastEffects != null ||
          defaultSpatial != null ||
          defaultEffects != null ||
          slowSpatial != null ||
          slowEffects != null
      ? copyWith(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : this;

  SpringThemeDataPartial mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) => .from(
    fastSpatial: this.fastSpatial?.merge(fastSpatial) ?? fastSpatial,
    fastEffects: this.fastEffects?.merge(fastEffects) ?? fastEffects,
    defaultSpatial:
        this.defaultSpatial?.merge(defaultSpatial) ?? defaultSpatial,
    defaultEffects:
        this.defaultEffects?.merge(defaultEffects) ?? defaultEffects,
    slowSpatial: this.slowSpatial?.merge(slowSpatial) ?? slowSpatial,
    slowEffects: this.slowEffects?.merge(slowEffects) ?? slowEffects,
  );

  SpringThemeDataPartial maybeMergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) =>
      fastSpatial != null ||
          fastEffects != null ||
          defaultSpatial != null ||
          defaultEffects != null ||
          slowSpatial != null ||
          slowEffects != null
      ? .from(
          fastSpatial: this.fastSpatial?.maybeMerge(fastSpatial) ?? fastSpatial,
          fastEffects: this.fastEffects?.maybeMerge(fastEffects) ?? fastEffects,
          defaultSpatial:
              this.defaultSpatial?.maybeMerge(defaultSpatial) ?? defaultSpatial,
          defaultEffects:
              this.defaultEffects?.maybeMerge(defaultEffects) ?? defaultEffects,
          slowSpatial: this.slowSpatial?.maybeMerge(slowSpatial) ?? slowSpatial,
          slowEffects: this.slowEffects?.maybeMerge(slowEffects) ?? slowEffects,
        )
      : this;

  SpringThemeDataPartial merge(SpringThemeDataPartial? other) => other != null
      ? mergeWith(
          fastSpatial: other.fastSpatial,
          fastEffects: other.fastEffects,
          defaultSpatial: other.defaultSpatial,
          defaultEffects: other.defaultEffects,
          slowSpatial: other.slowSpatial,
          slowEffects: other.slowEffects,
        )
      : copy();

  SpringThemeDataPartial maybeMerge(SpringThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          fastSpatial: other.fastSpatial,
          fastEffects: other.fastEffects,
          defaultSpatial: other.defaultSpatial,
          defaultEffects: other.defaultEffects,
          slowSpatial: other.slowSpatial,
          slowEffects: other.slowEffects,
        )
      : this;

  bool get isEmpty =>
      fastSpatial?.isEmpty != false &&
      fastEffects?.isEmpty != false &&
      defaultSpatial?.isEmpty != false &&
      defaultEffects?.isEmpty != false &&
      slowSpatial?.isEmpty != false &&
      slowEffects?.isEmpty != false;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      fastSpatial?.isConcrete == true &&
      fastEffects?.isConcrete == true &&
      defaultSpatial?.isConcrete == true &&
      defaultEffects?.isConcrete == true &&
      slowSpatial?.isConcrete == true &&
      slowEffects?.isConcrete == true;

  SpringThemeData? get asConcrete =>
      isConcrete ? _SpringThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "fastSpatial",
          fastSpatial,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "fastEffects",
          fastEffects,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "defaultSpatial",
          defaultSpatial,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "defaultEffects",
          defaultEffects,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "slowSpatial",
          slowSpatial,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<SpringPartial>(
          "slowEffects",
          slowEffects,
          defaultValue: null,
        ),
      );
  }
}

final class _SpringThemeDataPartial extends SpringThemeDataPartial {
  const _SpringThemeDataPartial({
    this.fastSpatial,
    this.fastEffects,
    this.defaultSpatial,
    this.defaultEffects,
    this.slowSpatial,
    this.slowEffects,
  });

  @override
  final SpringPartial? fastSpatial;

  @override
  final SpringPartial? fastEffects;

  @override
  final SpringPartial? defaultSpatial;

  @override
  final SpringPartial? defaultEffects;

  @override
  final SpringPartial? slowSpatial;

  @override
  final SpringPartial? slowEffects;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpringThemeDataPartial &&
          fastSpatial == other.fastSpatial &&
          fastEffects == other.fastEffects &&
          defaultSpatial == other.defaultSpatial &&
          defaultEffects == other.defaultEffects &&
          slowSpatial == other.slowSpatial &&
          slowEffects == other.slowEffects;

  @override
  int get hashCode => Object.hash(
    fastSpatial,
    fastEffects,
    defaultSpatial,
    defaultEffects,
    slowSpatial,
    slowEffects,
  );
}

final class _SpringThemeDataPartialAsConcrete extends SpringThemeData {
  _SpringThemeDataPartialAsConcrete(SpringThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final SpringThemeDataPartial _value;

  @override
  Spring get fastSpatial => _value.fastSpatial!.asConcrete!;

  @override
  Spring get fastEffects => _value.fastEffects!.asConcrete!;

  @override
  Spring get defaultSpatial => _value.defaultSpatial!.asConcrete!;

  @override
  Spring get defaultEffects => _value.defaultEffects!.asConcrete!;

  @override
  Spring get slowSpatial => _value.slowSpatial!.asConcrete!;

  @override
  Spring get slowEffects => _value.slowEffects!.asConcrete!;

  @override
  SpringThemeData copyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) => _SpringThemeDataPartialAsConcrete(
    _value.copyWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    ),
  );

  @override
  SpringThemeData maybeCopyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) =>
      fastSpatial != null &&
          fastEffects != null &&
          defaultSpatial != null &&
          defaultEffects != null &&
          slowSpatial != null &&
          slowEffects != null
      ? .from(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : fastSpatial != null ||
            fastEffects != null ||
            defaultSpatial != null ||
            defaultEffects != null ||
            slowSpatial != null ||
            slowEffects != null
      ? copyWith(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : this;

  @override
  SpringThemeData mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) => _SpringThemeDataPartialAsConcrete(
    _value.mergeWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    ),
  );

  @override
  SpringThemeData maybeMergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) {
    final value = _value.maybeMergeWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    );
    return identical(_value, value)
        ? this
        : _SpringThemeDataPartialAsConcrete(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpringThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class SpringThemeData extends SpringThemeDataPartial {
  const SpringThemeData();

  const factory SpringThemeData.from({
    required Spring fastSpatial,
    required Spring fastEffects,
    required Spring defaultSpatial,
    required Spring defaultEffects,
    required Spring slowSpatial,
    required Spring slowEffects,
  }) = _SpringThemeData;

  const factory SpringThemeData.defaultsStandard({
    SpringThemeDataPartial? overrides,
  }) = _SpringThemeDataStandardDefaults;

  const factory SpringThemeData.defaultsExpressive({
    SpringThemeDataPartial? overrides,
  }) = _SpringThemeDataExpressiveDefaults;

  @override
  Spring get fastSpatial;

  @override
  Spring get fastEffects;

  @override
  Spring get defaultSpatial;

  @override
  Spring get defaultEffects;

  @override
  Spring get slowSpatial;

  @override
  Spring get slowEffects;

  @override
  SpringThemeData copy() => copyWith();

  @override
  SpringThemeData copyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) => .from(
    fastSpatial: fastSpatial ?? this.fastSpatial,
    fastEffects: fastEffects ?? this.fastEffects,
    defaultSpatial: defaultSpatial ?? this.defaultSpatial,
    defaultEffects: defaultEffects ?? this.defaultEffects,
    slowSpatial: slowSpatial ?? this.slowSpatial,
    slowEffects: slowEffects ?? this.slowEffects,
  );

  @override
  SpringThemeData maybeCopyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) =>
      fastSpatial != null ||
          fastEffects != null ||
          defaultSpatial != null ||
          defaultEffects != null ||
          slowSpatial != null ||
          slowEffects != null
      ? copyWith(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : this;

  @override
  SpringThemeData mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) => .from(
    fastSpatial: this.fastSpatial.merge(fastSpatial),
    fastEffects: this.fastEffects.merge(fastEffects),
    defaultSpatial: this.defaultSpatial.merge(defaultSpatial),
    defaultEffects: this.defaultEffects.merge(defaultEffects),
    slowSpatial: this.slowSpatial.merge(slowSpatial),
    slowEffects: this.slowEffects.merge(slowEffects),
  );

  @override
  SpringThemeData maybeMergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) =>
      fastSpatial != null ||
          fastEffects != null ||
          defaultSpatial != null ||
          defaultEffects != null ||
          slowSpatial != null ||
          slowEffects != null
      ? .from(
          fastSpatial: this.fastSpatial.maybeMerge(fastSpatial),
          fastEffects: this.fastEffects.maybeMerge(fastEffects),
          defaultSpatial: this.defaultSpatial.maybeMerge(defaultSpatial),
          defaultEffects: this.defaultEffects.maybeMerge(defaultEffects),
          slowSpatial: this.slowSpatial.maybeMerge(slowSpatial),
          slowEffects: this.slowEffects.maybeMerge(slowEffects),
        )
      : this;

  @override
  SpringThemeData merge(SpringThemeDataPartial? other) => other != null
      ? mergeWith(
          fastSpatial: other.fastSpatial,
          fastEffects: other.fastEffects,
          defaultSpatial: other.defaultSpatial,
          defaultEffects: other.defaultEffects,
          slowSpatial: other.slowSpatial,
          slowEffects: other.slowEffects,
        )
      : copy();

  @override
  SpringThemeData maybeMerge(SpringThemeDataPartial? other) => other != null
      ? maybeMergeWith(
          fastSpatial: other.fastSpatial,
          fastEffects: other.fastEffects,
          defaultSpatial: other.defaultSpatial,
          defaultEffects: other.defaultEffects,
          slowSpatial: other.slowSpatial,
          slowEffects: other.slowEffects,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  SpringThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Spring>("fastSpatial", fastSpatial))
      ..add(DiagnosticsProperty<Spring>("fastEffects", fastEffects))
      ..add(DiagnosticsProperty<Spring>("defaultSpatial", defaultSpatial))
      ..add(DiagnosticsProperty<Spring>("defaultEffects", defaultEffects))
      ..add(DiagnosticsProperty<Spring>("slowSpatial", slowSpatial))
      ..add(DiagnosticsProperty<Spring>("slowEffects", slowEffects));
  }
}

final class _SpringThemeData extends SpringThemeData {
  const _SpringThemeData({
    required this.fastSpatial,
    required this.fastEffects,
    required this.defaultSpatial,
    required this.defaultEffects,
    required this.slowSpatial,
    required this.slowEffects,
  });

  @override
  final Spring fastSpatial;

  @override
  final Spring fastEffects;

  @override
  final Spring defaultSpatial;

  @override
  final Spring defaultEffects;

  @override
  final Spring slowSpatial;

  @override
  final Spring slowEffects;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpringThemeData &&
          fastSpatial == other.fastSpatial &&
          fastEffects == other.fastEffects &&
          defaultSpatial == other.defaultSpatial &&
          defaultEffects == other.defaultEffects &&
          slowSpatial == other.slowSpatial &&
          slowEffects == other.slowEffects;

  @override
  int get hashCode => Object.hash(
    fastSpatial,
    fastEffects,
    defaultSpatial,
    defaultEffects,
    slowSpatial,
    slowEffects,
  );
}

mixin _SpringThemeDataDefaultsMixin<T extends _SpringThemeDataDefaultsMixin<T>>
    on SpringThemeData {
  SpringThemeDataPartial get _overrides;

  Spring get _fastSpatial;
  Spring get _fastEffects;
  Spring get _defaultSpatial;
  Spring get _defaultEffects;
  Spring get _slowSpatial;
  Spring get _slowEffects;

  @override
  Spring get fastSpatial => _fastSpatial.maybeMerge(_overrides.fastSpatial);

  @override
  Spring get fastEffects => _fastEffects.maybeMerge(_overrides.fastEffects);

  @override
  Spring get defaultSpatial =>
      _defaultSpatial.maybeMerge(_overrides.defaultSpatial);

  @override
  Spring get defaultEffects =>
      _defaultEffects.maybeMerge(_overrides.defaultEffects);

  @override
  Spring get slowSpatial => _slowSpatial.maybeMerge(_overrides.slowSpatial);

  @override
  Spring get slowEffects => _slowEffects.maybeMerge(_overrides.slowEffects);

  T _create({SpringThemeDataPartial? overrides});

  @override
  SpringThemeData copyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) => _create(
    overrides: _overrides.copyWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    ),
  );

  @override
  SpringThemeData maybeCopyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  }) =>
      fastSpatial != null &&
          fastEffects != null &&
          defaultSpatial != null &&
          defaultEffects != null &&
          slowSpatial != null &&
          slowEffects != null
      ? .from(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : fastSpatial != null ||
            fastEffects != null ||
            defaultSpatial != null ||
            defaultEffects != null ||
            slowSpatial != null ||
            slowEffects != null
      ? copyWith(
          fastSpatial: fastSpatial,
          fastEffects: fastEffects,
          defaultSpatial: defaultSpatial,
          defaultEffects: defaultEffects,
          slowSpatial: slowSpatial,
          slowEffects: slowEffects,
        )
      : this;

  @override
  SpringThemeData mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) => _create(
    overrides: _overrides.mergeWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    ),
  );

  @override
  SpringThemeData maybeMergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) {
    final overrides = _overrides.maybeMergeWith(
      fastSpatial: fastSpatial,
      fastEffects: fastEffects,
      defaultSpatial: defaultSpatial,
      defaultEffects: defaultEffects,
      slowSpatial: slowSpatial,
      slowEffects: slowEffects,
    );
    return identical(_overrides, overrides)
        ? this
        : _create(overrides: overrides);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is T && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

final class _SpringThemeDataStandardDefaults extends SpringThemeData
    with _SpringThemeDataDefaultsMixin<_SpringThemeDataStandardDefaults> {
  const _SpringThemeDataStandardDefaults({SpringThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  @override
  final SpringThemeDataPartial _overrides;

  @override
  Spring get _fastSpatial => const Spring.from(stiffness: 1400.0, damping: 0.9);

  @override
  Spring get _fastEffects => const Spring.from(stiffness: 3800.0, damping: 1.0);

  @override
  Spring get _defaultSpatial =>
      const Spring.from(stiffness: 700.0, damping: 0.9);

  @override
  Spring get _defaultEffects =>
      const Spring.from(stiffness: 1600.0, damping: 1.0);

  @override
  Spring get _slowSpatial => const Spring.from(stiffness: 300.0, damping: 0.9);

  @override
  Spring get _slowEffects => const Spring.from(stiffness: 800.0, damping: 1.0);

  @override
  _SpringThemeDataStandardDefaults _create({
    SpringThemeDataPartial? overrides,
  }) => .new(overrides: overrides);
}

final class _SpringThemeDataExpressiveDefaults extends SpringThemeData
    with _SpringThemeDataDefaultsMixin<_SpringThemeDataExpressiveDefaults> {
  const _SpringThemeDataExpressiveDefaults({SpringThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  @override
  final SpringThemeDataPartial _overrides;

  @override
  Spring get _fastSpatial => const Spring.from(stiffness: 800.0, damping: 0.6);

  @override
  Spring get _fastEffects => const Spring.from(stiffness: 3800.0, damping: 1.0);

  @override
  Spring get _defaultSpatial =>
      const Spring.from(stiffness: 380.0, damping: 0.8);

  @override
  Spring get _defaultEffects =>
      const Spring.from(stiffness: 1600.0, damping: 1.0);

  @override
  Spring get _slowSpatial => const Spring.from(stiffness: 200.0, damping: 0.8);

  @override
  Spring get _slowEffects => const Spring.from(stiffness: 800.0, damping: 1.0);

  @override
  _SpringThemeDataExpressiveDefaults _create({
    SpringThemeDataPartial? overrides,
  }) => .new(overrides: overrides);
}

abstract class SpringTheme extends StatelessWidget implements ProxyWidget {
  const SpringTheme._({super.key, required this.child});

  const factory SpringTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<SpringThemeDataPartial> resolver,
    required Widget child,
  }) = _SpringThemeWithResolver<SpringThemeDataPartial>;

  const factory SpringTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<SpringThemeDataPartial> callback,
    required Widget child,
  }) = _SpringThemeWithCallback<SpringThemeDataPartial>;

  const factory SpringTheme.mergeWithData({
    Key? key,
    required SpringThemeDataPartial data,
    required Widget child,
  }) = _SpringThemeWithData<SpringThemeDataPartial>;

  const factory SpringTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<SpringThemeData> resolver,
    required Widget child,
  }) = _SpringThemeWithResolver<SpringThemeData>;

  const factory SpringTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<SpringThemeData> callback,
    required Widget child,
  }) = _SpringThemeWithCallback<SpringThemeData>;

  const factory SpringTheme.replaceWithData({
    Key? key,
    required SpringThemeData data,
    required Widget child,
  }) = _SpringThemeWithData<SpringThemeData>;

  ThemeResolver<SpringThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _SpringTheme(resolver: resolver, child: child);

  static SpringThemeData? maybeOf(BuildContext context) {
    final overrides = _SpringTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsStandard(overrides: overrides);
  }

  static SpringThemeData of(BuildContext context) =>
      .defaultsStandard(overrides: _SpringTheme.maybeOverridesOf(context));
}

class _SpringThemeWithResolver<T extends SpringThemeDataPartial>
    extends SpringTheme {
  const _SpringThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _SpringThemeWithCallback<T extends SpringThemeDataPartial>
    extends SpringTheme {
  const _SpringThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _SpringThemeWithData<T extends SpringThemeDataPartial>
    extends SpringTheme {
  const _SpringThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _SpringTheme
    extends
        InheritedThemeResolverWidget<
          SpringThemeDataPartial,
          _SpringTheme,
          _SpringThemeElement
        >
    implements InheritedTheme {
  const _SpringTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  SpringThemeDataPartial merge(
    SpringThemeDataPartial fallback,
    SpringThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _SpringThemeElement createElement() => _SpringThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _SpringTheme(resolver: resolver, child: child);

  static ThemeResolver<SpringThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        SpringThemeDataPartial,
        _SpringTheme,
        _SpringThemeElement
      >(context);

  static SpringThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        SpringThemeDataPartial,
        _SpringTheme,
        _SpringThemeElement
      >(context);
}

final class _SpringThemeElement
    extends
        InheritedThemeResolverElement<
          SpringThemeDataPartial,
          _SpringTheme,
          _SpringThemeElement
        > {
  _SpringThemeElement(super.widget);
}
