// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevation_theme.dart';

// **************************************************************************
// ThemeDataGenerator
// **************************************************************************

mixin _$ElevationThemeDataPartial on Diagnosticable {
  double? get level0;
  double? get level1;
  double? get level2;
  double? get level3;
  double? get level4;
  double? get level5;
  ElevationThemeDataPartial copy() => copyWith();
  ElevationThemeDataPartial copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => _ElevationThemeDataPartial(
    level0: level0 ?? this.level0,
    level1: level1 ?? this.level1,
    level2: level2 ?? this.level2,
    level3: level3 ?? this.level3,
    level4: level4 ?? this.level4,
    level5: level5 ?? this.level5,
  );
  ElevationThemeDataPartial maybeCopyWith({
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
      : this as ElevationThemeDataPartial;
}

final class _ElevationThemeDataPartial extends ElevationThemeDataPartial {
  const _ElevationThemeDataPartial({
    this.level0,
    this.level1,
    this.level2,
    this.level3,
    this.level4,
    this.level5,
  });
  @override
  final double? level0;
  @override
  final double? level1;
  @override
  final double? level2;
  @override
  final double? level3;
  @override
  final double? level4;
  @override
  final double? level5;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ElevationThemeDataPartial &&
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

mixin _$ElevationThemeData on Diagnosticable {
  double get level0;
  double get level1;
  double get level2;
  double get level3;
  double get level4;
  double get level5;
  ElevationThemeData copy() => copyWith();
  ElevationThemeData copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => _ElevationThemeData(
    level0: level0 ?? this.level0,
    level1: level1 ?? this.level1,
    level2: level2 ?? this.level2,
    level3: level3 ?? this.level3,
    level4: level4 ?? this.level4,
    level5: level5 ?? this.level5,
  );
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
      : this as ElevationThemeData;
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

mixin _$_ElevationThemeDataDefaults on ElevationThemeData {
  double? get _level0;
  double? get _level1;
  double? get _level2;
  double? get _level3;
  double? get _level4;
  double? get _level5;
}

final class __ElevationThemeDataDefaults extends _ElevationThemeDataDefaults {
  const __ElevationThemeDataDefaults({
    required this._colorTheme,
    ElevationThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const _ElevationThemeDataPartial(),
       super._();
  final ColorThemeData _colorTheme;
  final ElevationThemeDataPartial _overrides;
  @override
  double? get _level0 => _overrides.level0;
  @override
  double? get _level1 => _overrides.level1;
  @override
  double? get _level2 => _overrides.level2;
  @override
  double? get _level3 => _overrides.level3;
  @override
  double? get _level4 => _overrides.level4;
  @override
  double? get _level5 => _overrides.level5;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is __ElevationThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _overrides == other._overrides;
  @override
  int get hashCode => Object.hash(_colorTheme, _overrides);
}
