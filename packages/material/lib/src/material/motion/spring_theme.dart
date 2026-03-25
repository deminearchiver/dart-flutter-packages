import 'package:material/src/material/flutter.dart';

abstract class SpringPartial with Diagnosticable {
  const SpringPartial();

  const factory SpringPartial.from({double? stiffness, double? damping}) =
      _SpringPartial.from;

  double? get stiffness;

  double? get damping;

  SpringPartial copyWith({double? stiffness, double? damping}) =>
      stiffness != null || damping != null
      ? SpringPartial.from(
          stiffness: stiffness ?? this.stiffness,
          damping: damping ?? this.damping,
        )
      : this;

  SpringPartial merge(SpringPartial? other) => other != null
      ? copyWith(stiffness: other.stiffness, damping: other.damping)
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("stiffness", stiffness, defaultValue: null))
      ..add(DoubleProperty("damping", damping, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SpringPartial &&
          stiffness == other.stiffness &&
          damping == other.damping;

  @override
  int get hashCode => Object.hash(runtimeType, stiffness, damping);
}

class _SpringPartial extends SpringPartial {
  const _SpringPartial.from({this.stiffness, this.damping});

  @override
  final double? stiffness;

  @override
  final double? damping;
}

abstract class Spring extends SpringPartial {
  const Spring();

  const factory Spring.from({
    required double stiffness,
    required double damping,
  }) = _Spring.from;

  @override
  double get stiffness;

  @override
  double get damping;

  @override
  Spring copyWith({double? stiffness, double? damping}) =>
      stiffness != null || damping != null
      ? .from(
          stiffness: stiffness ?? this.stiffness,
          damping: damping ?? this.damping,
        )
      : this;

  @override
  Spring merge(SpringPartial? other) => other != null
      ? copyWith(stiffness: other.stiffness, damping: other.damping)
      : this;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is Spring &&
          stiffness == other.stiffness &&
          damping == other.damping;

  @override
  int get hashCode => Object.hash(runtimeType, stiffness, damping);
}

class _Spring extends Spring {
  const _Spring.from({required this.stiffness, required this.damping});

  @override
  final double stiffness;

  @override
  final double damping;
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
  }) = _SpringThemeDataPartial.from;

  SpringPartial? get fastSpatial;

  SpringPartial? get fastEffects;

  SpringPartial? get defaultSpatial;

  SpringPartial? get defaultEffects;

  SpringPartial? get slowSpatial;

  SpringPartial? get slowEffects;

  SpringThemeDataPartial copyWith({
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
      ? .from(
          fastSpatial: fastSpatial ?? this.fastSpatial,
          fastEffects: fastEffects ?? this.fastEffects,
          defaultSpatial: defaultSpatial ?? this.defaultSpatial,
          defaultEffects: defaultEffects ?? this.defaultEffects,
          slowSpatial: slowSpatial ?? this.slowSpatial,
          slowEffects: slowEffects ?? this.slowEffects,
        )
      : this;

  SpringThemeDataPartial mergeWith({
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
      ? .from(
          fastSpatial: this.fastSpatial?.merge(fastSpatial) ?? fastSpatial,
          fastEffects: this.fastEffects?.merge(fastEffects) ?? fastEffects,
          defaultSpatial:
              this.defaultSpatial?.merge(defaultSpatial) ?? defaultSpatial,
          defaultEffects:
              this.defaultEffects?.merge(defaultEffects) ?? defaultEffects,
          slowSpatial: this.slowSpatial?.merge(slowSpatial) ?? slowSpatial,
          slowEffects: this.slowEffects?.merge(slowEffects) ?? slowEffects,
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SpringThemeDataPartial &&
          fastSpatial == other.fastSpatial &&
          fastEffects == other.fastEffects &&
          defaultSpatial == other.defaultSpatial &&
          defaultEffects == other.defaultEffects &&
          slowSpatial == other.slowSpatial &&
          slowEffects == other.slowEffects;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fastSpatial,
    fastEffects,
    defaultSpatial,
    defaultEffects,
    slowSpatial,
    slowEffects,
  );
}

class _SpringThemeDataPartial extends SpringThemeDataPartial {
  const _SpringThemeDataPartial.from({
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
  }) = _SpringThemeData.from;

  const factory SpringThemeData.standard() = _SpringThemeData.standard;

  const factory SpringThemeData.expressive() = _SpringThemeData.expressive;

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
  SpringThemeData copyWith({
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
      ? .from(
          fastSpatial: fastSpatial ?? this.fastSpatial,
          fastEffects: fastEffects ?? this.fastEffects,
          defaultSpatial: defaultSpatial ?? this.defaultSpatial,
          defaultEffects: defaultEffects ?? this.defaultEffects,
          slowSpatial: slowSpatial ?? this.slowSpatial,
          slowEffects: slowEffects ?? this.slowEffects,
        )
      : this;

  @override
  SpringThemeData mergeWith({
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
      ? .from(
          fastSpatial: this.fastSpatial.merge(fastSpatial),
          fastEffects: this.fastEffects.merge(fastEffects),
          defaultSpatial: this.defaultSpatial.merge(defaultSpatial),
          defaultEffects: this.defaultEffects.merge(defaultEffects),
          slowSpatial: this.slowSpatial.merge(slowSpatial),
          slowEffects: this.slowEffects.merge(slowEffects),
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SpringThemeData &&
          fastSpatial == other.fastSpatial &&
          fastEffects == other.fastEffects &&
          defaultSpatial == other.defaultSpatial &&
          defaultEffects == other.defaultEffects &&
          slowSpatial == other.slowSpatial &&
          slowEffects == other.slowEffects;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fastSpatial,
    fastEffects,
    defaultSpatial,
    defaultEffects,
    slowSpatial,
    slowEffects,
  );
}

class _SpringThemeData extends SpringThemeData {
  const _SpringThemeData.from({
    required this.fastSpatial,
    required this.fastEffects,
    required this.defaultSpatial,
    required this.defaultEffects,
    required this.slowSpatial,
    required this.slowEffects,
  });

  const _SpringThemeData.standard()
    : fastSpatial = const .from(stiffness: 1400.0, damping: 0.9),
      fastEffects = const .from(stiffness: 3800.0, damping: 1.0),
      defaultSpatial = const .from(stiffness: 700.0, damping: 0.9),
      defaultEffects = const .from(stiffness: 1600.0, damping: 1.0),
      slowSpatial = const .from(stiffness: 300.0, damping: 0.9),
      slowEffects = const .from(stiffness: 800.0, damping: 1.0);

  const _SpringThemeData.expressive()
    : fastSpatial = const .from(stiffness: 800.0, damping: 0.6),
      fastEffects = const .from(stiffness: 3800.0, damping: 1.0),
      defaultSpatial = const .from(stiffness: 380.0, damping: 0.8),
      defaultEffects = const .from(stiffness: 1600.0, damping: 1.0),
      slowSpatial = const .from(stiffness: 200.0, damping: 0.8),
      slowEffects = const .from(stiffness: 800.0, damping: 1.0);

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
}

class SpringTheme extends InheritedTheme {
  const SpringTheme({super.key, required this.data, required super.child});

  final SpringThemeData data;

  @override
  bool updateShouldNotify(SpringTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      SpringTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SpringThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required SpringThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        SpringTheme(key: key, data: of(context).merge(data), child: child),
  );

  static SpringThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SpringTheme>()?.data;

  static SpringThemeData of(BuildContext context) =>
      maybeOf(context) ?? const .expressive();
}
