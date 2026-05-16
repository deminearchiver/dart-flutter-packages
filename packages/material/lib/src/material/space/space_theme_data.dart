part of 'space_theme.dart';

// ```css
// /*!
//  * Copyright 2026 Google LLC
//  * SPDX-License-Identifier: Apache-2.0
//  */
// --md-sys-space-unit: 8px;
// --md-sys-space-0: 0px;
// --md-sys-space-25: 2px;
// --md-sys-space-50: 4px;
// --md-sys-space-75: 6px;
// --md-sys-space-100: 8px;
// --md-sys-space-125: 10px;
// --md-sys-space-150: 12px;
// --md-sys-space-175: 14px;
// --md-sys-space-200: 16px;
// --md-sys-space-250: 20px;
// --md-sys-space-300: 24px;
// --md-sys-space-400: 32px;
// --md-sys-space-450: 36px;
// --md-sys-space-500: 40px;
// --md-sys-space-600: 48px;
// --md-sys-space-700: 56px;
// --md-sys-space-800: 64px;
// --md-sys-space-900: 72px;
// ```
//
// See: https://github.com/material-components/material-web/blob/95013d6621339322695f469ab6f5cf327869f3bb/labs/gb/styles/space/md-space-tokens.scss

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double _lerpDoubleConcrete(double a, double b, double t) {
  if (a == b) return a;
  if (t == 0.0) return a;
  if (t == 1.0) return b;
  return lerpDouble(a, b, t);
}

abstract class SpaceThemeData extends SpaceThemeDataPartial {
  const SpaceThemeData();

  const factory SpaceThemeData.from({
    required double unit,
    required double space0,
    required double space25,
    required double space50,
    required double space75,
    required double space100,
    required double space125,
    required double space150,
    required double space175,
    required double space200,
    required double space250,
    required double space300,
    required double space400,
    required double space450,
    required double space500,
    required double space600,
    required double space700,
    required double space800,
    required double space900,
  }) = _SpaceThemeData;

  const factory SpaceThemeData.defaults({SpaceThemeDataPartial? overrides}) =
      _SpaceThemeDataDefaults;

  @override
  double get unit;

  @override
  double get space0;

  @override
  double get space25;

  @override
  double get space50;

  @override
  double get space75;

  @override
  double get space100;

  @override
  double get space125;

  @override
  double get space150;

  @override
  double get space175;

  @override
  double get space200;

  @override
  double get space250;

  @override
  double get space300;

  @override
  double get space400;

  @override
  double get space450;

  @override
  double get space500;

  @override
  double get space600;

  @override
  double get space700;

  @override
  double get space800;

  @override
  double get space900;

  @override
  SpaceThemeData copy() => copyWith();

  @override
  SpaceThemeData copyWith({
    double? unit,
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
    unit: unit ?? this.unit,
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

  @override
  SpaceThemeData maybeCopyWith({
    double? unit,
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
      unit != null ||
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
          unit: unit,
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
  SpaceThemeData merge(SpaceThemeDataPartial? other) => other != null
      ? copyWith(
          unit: unit,
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

  @override
  SpaceThemeData maybeMerge(SpaceThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          unit: unit,
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
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  SpaceThemeData get asConcrete => this;

  @override
  double get(double level) => switch (level) {
    <= 0.0 => space0,
    < 25.0 => _lerpDoubleConcrete(space0, space25, level / 25.0),
    < 50.0 => _lerpDoubleConcrete(space25, space50, (level - 25.0) / 25.0),
    < 75.0 => _lerpDoubleConcrete(space50, space75, (level - 50.0) / 25.0),
    < 100.0 => _lerpDoubleConcrete(space75, space100, (level - 75.0) / 25.0),
    < 125.0 => _lerpDoubleConcrete(space100, space125, (level - 100.0) / 25.0),
    < 150.0 => _lerpDoubleConcrete(space125, space150, (level - 125.0) / 25.0),
    < 175.0 => _lerpDoubleConcrete(space150, space175, (level - 150.0) / 25.0),
    < 200.0 => _lerpDoubleConcrete(space175, space200, (level - 175.0) / 25.0),
    < 250.0 => _lerpDoubleConcrete(space200, space250, (level - 200.0) / 50.0),
    < 300.0 => _lerpDoubleConcrete(space250, space300, (level - 250.0) / 50.0),
    < 400.0 => _lerpDoubleConcrete(space300, space400, (level - 300.0) / 100.0),
    < 450.0 => _lerpDoubleConcrete(space400, space450, (level - 400.0) / 50.0),
    < 500.0 => _lerpDoubleConcrete(space450, space500, (level - 450.0) / 50.0),
    < 600.0 => _lerpDoubleConcrete(space500, space600, (level - 500.0) / 100.0),
    < 700.0 => _lerpDoubleConcrete(space600, space700, (level - 600.0) / 100.0),
    < 800.0 => _lerpDoubleConcrete(space700, space800, (level - 700.0) / 100.0),
    < 900.0 => _lerpDoubleConcrete(space800, space900, (level - 800.0) / 100.0),
    _ => space900,
  };

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("unit", unit))
      ..add(DoubleProperty("space0", space0))
      ..add(DoubleProperty("space25", space25))
      ..add(DoubleProperty("space50", space50))
      ..add(DoubleProperty("space75", space75))
      ..add(DoubleProperty("space100", space100))
      ..add(DoubleProperty("space125", space125))
      ..add(DoubleProperty("space150", space150))
      ..add(DoubleProperty("space175", space175))
      ..add(DoubleProperty("space200", space200))
      ..add(DoubleProperty("space250", space250))
      ..add(DoubleProperty("space300", space300))
      ..add(DoubleProperty("space400", space400))
      ..add(DoubleProperty("space450", space450))
      ..add(DoubleProperty("space500", space500))
      ..add(DoubleProperty("space600", space600))
      ..add(DoubleProperty("space700", space700))
      ..add(DoubleProperty("space800", space800))
      ..add(DoubleProperty("space900", space900));
  }
}

final class _SpaceThemeData extends SpaceThemeData {
  const _SpaceThemeData({
    required this.unit,
    required this.space0,
    required this.space25,
    required this.space50,
    required this.space75,
    required this.space100,
    required this.space125,
    required this.space150,
    required this.space175,
    required this.space200,
    required this.space250,
    required this.space300,
    required this.space400,
    required this.space450,
    required this.space500,
    required this.space600,
    required this.space700,
    required this.space800,
    required this.space900,
  });

  @override
  final double unit;

  @override
  final double space0;

  @override
  final double space25;

  @override
  final double space50;

  @override
  final double space75;

  @override
  final double space100;

  @override
  final double space125;

  @override
  final double space150;

  @override
  final double space175;

  @override
  final double space200;

  @override
  final double space250;

  @override
  final double space300;

  @override
  final double space400;

  @override
  final double space450;

  @override
  final double space500;

  @override
  final double space600;

  @override
  final double space700;

  @override
  final double space800;

  @override
  final double space900;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SpaceThemeData &&
          unit == other.unit &&
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
    unit,
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

final class _SpaceThemeDataDefaults extends SpaceThemeData {
  const _SpaceThemeDataDefaults({SpaceThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final SpaceThemeDataPartial _overrides;

  @override
  double get unit => _overrides.unit ?? 8.0;

  @override
  double get space0 => _overrides.space0 ?? unit * 0.0;

  @override
  double get space25 => _overrides.space25 ?? unit * 0.25;

  @override
  double get space50 => _overrides.space50 ?? unit * 0.5;

  @override
  double get space75 => _overrides.space75 ?? unit * 0.75;

  @override
  double get space100 => _overrides.space100 ?? unit;

  @override
  double get space125 => _overrides.space125 ?? unit * 1.25;

  @override
  double get space150 => _overrides.space150 ?? unit * 1.5;

  @override
  double get space175 => _overrides.space175 ?? unit * 1.75;

  @override
  double get space200 => _overrides.space200 ?? unit * 2.0;

  @override
  double get space250 => _overrides.space250 ?? unit * 2.5;

  @override
  double get space300 => _overrides.space300 ?? unit * 3.0;

  @override
  double get space400 => _overrides.space400 ?? unit * 4.0;

  @override
  double get space450 => _overrides.space450 ?? unit * 4.5;

  @override
  double get space500 => _overrides.space500 ?? unit * 5.0;

  @override
  double get space600 => _overrides.space600 ?? unit * 6.0;

  @override
  double get space700 => _overrides.space700 ?? unit * 7.0;

  @override
  double get space800 => _overrides.space800 ?? unit * 8.0;

  @override
  double get space900 => _overrides.space900 ?? unit * 9.0;

  @override
  SpaceThemeData copyWith({
    double? unit,
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
  }) => _SpaceThemeDataDefaults(
    overrides: _overrides.copyWith(
      unit: unit,
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
  SpaceThemeData maybeCopyWith({
    double? unit,
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
      unit != null &&
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
          unit: unit,
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
      : unit != null ||
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
          unit: unit,
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
      other is _SpaceThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}
