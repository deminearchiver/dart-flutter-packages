part of 'elevation_theme.dart';

abstract class ElevationThemeData extends ElevationThemeDataPartial {
  const ElevationThemeData();

  const factory ElevationThemeData.from({
    required double level0,
    required double level1,
    required double level2,
    required double level3,
    required double level4,
    required double level5,
  }) = _ElevationThemeData;

  const factory ElevationThemeData.defaults({
    ElevationThemeDataPartial? overrides,
  }) = _ElevationThemeDataDefaults;

  @override
  double get level0;

  @override
  double get level1;

  @override
  double get level2;

  @override
  double get level3;

  @override
  double get level4;

  @override
  double get level5;

  @override
  ElevationThemeData copy() => copyWith();

  @override
  ElevationThemeData copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => .from(
    level0: level0 ?? this.level0,
    level1: level1 ?? this.level1,
    level2: level2 ?? this.level2,
    level3: level3 ?? this.level3,
    level4: level4 ?? this.level4,
    level5: level5 ?? this.level5,
  );

  @override
  ElevationThemeData maybeCopyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) =>
      level0 != null ||
          level1 != null ||
          level2 != null ||
          level3 != null ||
          level4 != null ||
          level5 != null
      ? copyWith(
          level0: level0,
          level1: level1,
          level2: level2,
          level3: level3,
          level4: level4,
          level5: level5,
        )
      : this;

  @override
  ElevationThemeData merge(ElevationThemeDataPartial? other) => other != null
      ? copyWith(
          level0: other.level0,
          level1: other.level1,
          level2: other.level2,
          level3: other.level3,
          level4: other.level4,
          level5: other.level5,
        )
      : copy();

  @override
  ElevationThemeData maybeMerge(ElevationThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          level0: other.level0,
          level1: other.level1,
          level2: other.level2,
          level3: other.level3,
          level4: other.level4,
          level5: other.level5,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  ElevationThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("level0", level0))
      ..add(DoubleProperty("level1", level1))
      ..add(DoubleProperty("level2", level2))
      ..add(DoubleProperty("level3", level3))
      ..add(DoubleProperty("level4", level4))
      ..add(DoubleProperty("level5", level5));
  }
}

final class _ElevationThemeData extends ElevationThemeData {
  const _ElevationThemeData({
    required this.level0,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
  });

  @override
  final double level0;

  @override
  final double level1;

  @override
  final double level2;

  @override
  final double level3;

  @override
  final double level4;

  @override
  final double level5;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ElevationThemeData &&
          level0 == other.level0 &&
          level1 == other.level1 &&
          level2 == other.level2 &&
          level3 == other.level3 &&
          level4 == other.level4 &&
          level5 == other.level5;

  @override
  int get hashCode =>
      Object.hash(level0, level1, level2, level3, level4, level5);
}

final class _ElevationThemeDataDefaults extends ElevationThemeData {
  const _ElevationThemeDataDefaults({ElevationThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final ElevationThemeDataPartial _overrides;

  @override
  double get level0 => _overrides.level0 ?? 0.0;

  @override
  double get level1 => _overrides.level1 ?? 1.0;

  @override
  double get level2 => _overrides.level2 ?? 3.0;

  @override
  double get level3 => _overrides.level3 ?? 6.0;

  @override
  double get level4 => _overrides.level4 ?? 8.0;

  @override
  double get level5 => _overrides.level5 ?? 12.0;

  @override
  ElevationThemeData copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => _ElevationThemeDataDefaults(
    overrides: _overrides.copyWith(
      level0: level0,
      level1: level1,
      level2: level2,
      level3: level3,
      level4: level4,
      level5: level5,
    ),
  );

  @override
  ElevationThemeData maybeCopyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) =>
      level0 != null &&
          level1 != null &&
          level2 != null &&
          level3 != null &&
          level4 != null &&
          level5 != null
      ? .from(
          level0: level0,
          level1: level1,
          level2: level2,
          level3: level3,
          level4: level4,
          level5: level5,
        )
      : level0 != null ||
            level1 != null ||
            level2 != null ||
            level3 != null ||
            level4 != null ||
            level5 != null
      ? copyWith(
          level0: level0,
          level1: level1,
          level2: level2,
          level3: level3,
          level4: level4,
          level5: level5,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ElevationThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}
