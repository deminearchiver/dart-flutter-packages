part of 'measurement_theme.dart';

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double? _lerpDoublePartial(double? a, double? b, double t) {
  if (a == null || b == null) return null;
  return _lerpDoubleConcrete(a, b, t);
}

abstract class MeasurementThemeDataPartial with Diagnosticable {
  const MeasurementThemeDataPartial();

  const factory MeasurementThemeDataPartial.from({
    double? space0,
    double? space25,
    double? space50,
    double? space75,
    double? space100,
    double? space125,
    double? space150,
    double? space175,
    double? space200,
    double? space250,
    double? space300,
    double? space400,
    double? space450,
    double? space500,
    double? space600,
    double? space700,
    double? space800,
    double? space900,
  }) = _MeasurementThemeDataPartial;

  double? get space0;
  double? get space25;
  double? get space50;
  double? get space75;
  double? get space100;
  double? get space125;
  double? get space150;
  double? get space175;
  double? get space200;
  double? get space250;
  double? get space300;
  double? get space400;
  double? get space450;
  double? get space500;
  double? get space600;
  double? get space700;
  double? get space800;
  double? get space900;

  MeasurementThemeDataPartial copy() => copyWith();

  MeasurementThemeDataPartial copyWith({
    double? space0,
    double? space25,
    double? space50,
    double? space75,
    double? space100,
    double? space125,
    double? space150,
    double? space175,
    double? space200,
    double? space250,
    double? space300,
    double? space400,
    double? space450,
    double? space500,
    double? space600,
    double? space700,
    double? space800,
    double? space900,
  }) => .from(
    space0: space0 ?? this.space0,
    space25: space25 ?? this.space25,
    space50: space50 ?? this.space50,
    space75: space75 ?? this.space75,
    space100: space100 ?? this.space100,
    space125: space125 ?? this.space125,
    space150: space150 ?? this.space150,
    space175: space175 ?? this.space175,
    space200: space200 ?? this.space200,
    space250: space250 ?? this.space250,
    space300: space300 ?? this.space300,
    space400: space400 ?? this.space400,
    space450: space450 ?? this.space450,
    space500: space500 ?? this.space500,
    space600: space600 ?? this.space600,
    space700: space700 ?? this.space700,
    space800: space800 ?? this.space800,
    space900: space900 ?? this.space900,
  );

  MeasurementThemeDataPartial maybeCopyWith({
    double? space0,
    double? space25,
    double? space50,
    double? space75,
    double? space100,
    double? space125,
    double? space150,
    double? space175,
    double? space200,
    double? space250,
    double? space300,
    double? space400,
    double? space450,
    double? space500,
    double? space600,
    double? space700,
    double? space800,
    double? space900,
  }) =>
      space0 != null ||
          space25 != null ||
          space50 != null ||
          space75 != null ||
          space100 != null ||
          space125 != null ||
          space150 != null ||
          space175 != null ||
          space200 != null ||
          space250 != null ||
          space300 != null ||
          space400 != null ||
          space450 != null ||
          space500 != null ||
          space600 != null ||
          space700 != null ||
          space800 != null ||
          space900 != null
      ? copyWith(
          space0: space0,
          space25: space25,
          space50: space50,
          space75: space75,
          space100: space100,
          space125: space125,
          space150: space150,
          space175: space175,
          space200: space200,
          space250: space250,
          space300: space300,
          space400: space400,
          space450: space450,
          space500: space500,
          space600: space600,
          space700: space700,
          space800: space800,
          space900: space900,
        )
      : this;

  MeasurementThemeDataPartial merge(MeasurementThemeDataPartial? other) =>
      other != null
      ? copyWith(
          space0: space0,
          space25: space25,
          space50: space50,
          space75: space75,
          space100: space100,
          space125: space125,
          space150: space150,
          space175: space175,
          space200: space200,
          space250: space250,
          space300: space300,
          space400: space400,
          space450: space450,
          space500: space500,
          space600: space600,
          space700: space700,
          space800: space800,
          space900: space900,
        )
      : copy();

  MeasurementThemeDataPartial maybeMerge(MeasurementThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          space0: space0,
          space25: space25,
          space50: space50,
          space75: space75,
          space100: space100,
          space125: space125,
          space150: space150,
          space175: space175,
          space200: space200,
          space250: space250,
          space300: space300,
          space400: space400,
          space450: space450,
          space500: space500,
          space600: space600,
          space700: space700,
          space800: space800,
          space900: space900,
        )
      : this;

  bool get isEmpty =>
      space0 == null &&
      space25 == null &&
      space50 == null &&
      space75 == null &&
      space100 == null &&
      space125 == null &&
      space150 == null &&
      space175 == null &&
      space200 == null &&
      space250 == null &&
      space300 == null &&
      space400 == null &&
      space450 == null &&
      space500 == null &&
      space600 == null &&
      space700 == null &&
      space800 == null &&
      space900 == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      space0 != null &&
      space25 != null &&
      space50 != null &&
      space75 != null &&
      space100 != null &&
      space125 != null &&
      space150 != null &&
      space175 != null &&
      space200 != null &&
      space250 != null &&
      space300 != null &&
      space400 != null &&
      space450 != null &&
      space500 != null &&
      space600 != null &&
      space700 != null &&
      space800 != null &&
      space900 != null;

  MeasurementThemeData? get asConcrete =>
      isConcrete ? _MeasurementThemeDataPartialAsConcrete(this) : null;

  double? get(double level) => switch (level) {
    <= 0.0 => space0,
    < 25.0 => _lerpDoublePartial(space0, space25, level / 25.0),
    < 50.0 => _lerpDoublePartial(space25, space50, (level - 25.0) / 25.0),
    < 75.0 => _lerpDoublePartial(space50, space75, (level - 50.0) / 25.0),
    < 100.0 => _lerpDoublePartial(space75, space100, (level - 75.0) / 25.0),
    < 125.0 => _lerpDoublePartial(space100, space125, (level - 100.0) / 25.0),
    < 150.0 => _lerpDoublePartial(space125, space150, (level - 125.0) / 25.0),
    < 175.0 => _lerpDoublePartial(space150, space175, (level - 150.0) / 25.0),
    < 200.0 => _lerpDoublePartial(space175, space200, (level - 175.0) / 25.0),
    < 250.0 => _lerpDoublePartial(space200, space250, (level - 200.0) / 50.0),
    < 300.0 => _lerpDoublePartial(space250, space300, (level - 250.0) / 50.0),
    < 400.0 => _lerpDoublePartial(space300, space400, (level - 300.0) / 100.0),
    < 450.0 => _lerpDoublePartial(space400, space450, (level - 400.0) / 50.0),
    < 500.0 => _lerpDoublePartial(space450, space500, (level - 450.0) / 50.0),
    < 600.0 => _lerpDoublePartial(space500, space600, (level - 500.0) / 100.0),
    < 700.0 => _lerpDoublePartial(space600, space700, (level - 600.0) / 100.0),
    < 800.0 => _lerpDoublePartial(space700, space800, (level - 700.0) / 100.0),
    < 900.0 => _lerpDoublePartial(space800, space900, (level - 800.0) / 100.0),
    _ => space900,
  };

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("space0", space0, defaultValue: null))
      ..add(DoubleProperty("space25", space25, defaultValue: null))
      ..add(DoubleProperty("space50", space50, defaultValue: null))
      ..add(DoubleProperty("space75", space75, defaultValue: null))
      ..add(DoubleProperty("space100", space100, defaultValue: null))
      ..add(DoubleProperty("space125", space125, defaultValue: null))
      ..add(DoubleProperty("space150", space150, defaultValue: null))
      ..add(DoubleProperty("space175", space175, defaultValue: null))
      ..add(DoubleProperty("space200", space200, defaultValue: null))
      ..add(DoubleProperty("space250", space250, defaultValue: null))
      ..add(DoubleProperty("space300", space300, defaultValue: null))
      ..add(DoubleProperty("space400", space400, defaultValue: null))
      ..add(DoubleProperty("space450", space450, defaultValue: null))
      ..add(DoubleProperty("space500", space500, defaultValue: null))
      ..add(DoubleProperty("space600", space600, defaultValue: null))
      ..add(DoubleProperty("space700", space700, defaultValue: null))
      ..add(DoubleProperty("space800", space800, defaultValue: null))
      ..add(DoubleProperty("space900", space900, defaultValue: null));
  }
}

final class _MeasurementThemeDataPartial extends MeasurementThemeDataPartial {
  const _MeasurementThemeDataPartial({
    this.space0,
    this.space25,
    this.space50,
    this.space75,
    this.space100,
    this.space125,
    this.space150,
    this.space175,
    this.space200,
    this.space250,
    this.space300,
    this.space400,
    this.space450,
    this.space500,
    this.space600,
    this.space700,
    this.space800,
    this.space900,
  });

  @override
  final double? space0;

  @override
  final double? space25;

  @override
  final double? space50;

  @override
  final double? space75;

  @override
  final double? space100;

  @override
  final double? space125;

  @override
  final double? space150;

  @override
  final double? space175;

  @override
  final double? space200;

  @override
  final double? space250;

  @override
  final double? space300;

  @override
  final double? space400;

  @override
  final double? space450;

  @override
  final double? space500;

  @override
  final double? space600;

  @override
  final double? space700;

  @override
  final double? space800;

  @override
  final double? space900;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MeasurementThemeDataPartial &&
          space0 == other.space0 &&
          space25 == other.space25 &&
          space50 == other.space50 &&
          space75 == other.space75 &&
          space100 == other.space100 &&
          space125 == other.space125 &&
          space150 == other.space150 &&
          space175 == other.space175 &&
          space200 == other.space200 &&
          space250 == other.space250 &&
          space300 == other.space300 &&
          space400 == other.space400 &&
          space450 == other.space450 &&
          space500 == other.space500 &&
          space600 == other.space600 &&
          space700 == other.space700 &&
          space800 == other.space800 &&
          space900 == other.space900;

  @override
  int get hashCode => Object.hash(
    space0,
    space25,
    space50,
    space75,
    space100,
    space125,
    space150,
    space175,
    space200,
    space250,
    space300,
    space400,
    space450,
    space500,
    space600,
    space700,
    space800,
    space900,
  );
}

final class _MeasurementThemeDataPartialAsConcrete
    extends MeasurementThemeData {
  _MeasurementThemeDataPartialAsConcrete(MeasurementThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final MeasurementThemeDataPartial _value;

  @override
  double get space0 => _value.space0!;

  @override
  double get space25 => _value.space25!;

  @override
  double get space50 => _value.space50!;

  @override
  double get space75 => _value.space75!;

  @override
  double get space100 => _value.space100!;

  @override
  double get space125 => _value.space125!;

  @override
  double get space150 => _value.space150!;

  @override
  double get space175 => _value.space175!;

  @override
  double get space200 => _value.space200!;

  @override
  double get space250 => _value.space250!;

  @override
  double get space300 => _value.space300!;

  @override
  double get space400 => _value.space400!;

  @override
  double get space450 => _value.space450!;

  @override
  double get space500 => _value.space500!;

  @override
  double get space600 => _value.space600!;

  @override
  double get space700 => _value.space700!;

  @override
  double get space800 => _value.space800!;

  @override
  double get space900 => _value.space900!;

  @override
  MeasurementThemeData copyWith({
    double? space0,
    double? space25,
    double? space50,
    double? space75,
    double? space100,
    double? space125,
    double? space150,
    double? space175,
    double? space200,
    double? space250,
    double? space300,
    double? space400,
    double? space450,
    double? space500,
    double? space600,
    double? space700,
    double? space800,
    double? space900,
  }) => _MeasurementThemeDataPartialAsConcrete(
    _value.copyWith(
      space0: space0,
      space25: space25,
      space50: space50,
      space75: space75,
      space100: space100,
      space125: space125,
      space150: space150,
      space175: space175,
      space200: space200,
      space250: space250,
      space300: space300,
      space400: space400,
      space450: space450,
      space500: space500,
      space600: space600,
      space700: space700,
      space800: space800,
      space900: space900,
    ),
  );

  @override
  MeasurementThemeData maybeCopyWith({
    double? space0,
    double? space25,
    double? space50,
    double? space75,
    double? space100,
    double? space125,
    double? space150,
    double? space175,
    double? space200,
    double? space250,
    double? space300,
    double? space400,
    double? space450,
    double? space500,
    double? space600,
    double? space700,
    double? space800,
    double? space900,
  }) =>
      space0 != null &&
          space25 != null &&
          space50 != null &&
          space75 != null &&
          space100 != null &&
          space125 != null &&
          space150 != null &&
          space175 != null &&
          space200 != null &&
          space250 != null &&
          space300 != null &&
          space400 != null &&
          space450 != null &&
          space500 != null &&
          space600 != null &&
          space700 != null &&
          space800 != null &&
          space900 != null
      ? .from(
          space0: space0,
          space25: space25,
          space50: space50,
          space75: space75,
          space100: space100,
          space125: space125,
          space150: space150,
          space175: space175,
          space200: space200,
          space250: space250,
          space300: space300,
          space400: space400,
          space450: space450,
          space500: space500,
          space600: space600,
          space700: space700,
          space800: space800,
          space900: space900,
        )
      : space0 != null ||
            space25 != null ||
            space50 != null ||
            space75 != null ||
            space100 != null ||
            space125 != null ||
            space150 != null ||
            space175 != null ||
            space200 != null ||
            space250 != null ||
            space300 != null ||
            space400 != null ||
            space450 != null ||
            space500 != null ||
            space600 != null ||
            space700 != null ||
            space800 != null ||
            space900 != null
      ? copyWith(
          space0: space0,
          space25: space25,
          space50: space50,
          space75: space75,
          space100: space100,
          space125: space125,
          space150: space150,
          space175: space175,
          space200: space200,
          space250: space250,
          space300: space300,
          space400: space400,
          space450: space450,
          space500: space500,
          space600: space600,
          space700: space700,
          space800: space800,
          space900: space900,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MeasurementThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
