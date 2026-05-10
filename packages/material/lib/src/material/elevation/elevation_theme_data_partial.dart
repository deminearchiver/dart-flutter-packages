part of 'elevation_theme.dart';

abstract class ElevationThemeDataPartial with Diagnosticable {
  const ElevationThemeDataPartial();

  const factory ElevationThemeDataPartial.from({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) = _ElevationThemeDataPartial;

  /// `md.sys.elevation.level0`
  double? get level0;

  /// `md.sys.elevation.level1`
  double? get level1;

  /// `md.sys.elevation.level2`
  double? get level2;

  /// `md.sys.elevation.level3`
  double? get level3;

  /// `md.sys.elevation.level4`
  double? get level4;

  /// `md.sys.elevation.level5`
  double? get level5;

  ElevationThemeDataPartial copy() => copyWith();

  ElevationThemeDataPartial copyWith({
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
      : this;

  ElevationThemeDataPartial merge(ElevationThemeDataPartial? other) =>
      other != null
      ? copyWith(
          level0: other.level0,
          level1: other.level1,
          level2: other.level2,
          level3: other.level3,
          level4: other.level4,
          level5: other.level5,
        )
      : copy();

  ElevationThemeDataPartial maybeMerge(ElevationThemeDataPartial? other) =>
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

  bool get isEmpty =>
      level0 == null &&
      level1 == null &&
      level2 == null &&
      level3 == null &&
      level4 == null &&
      level5 == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      level0 != null &&
      level1 != null &&
      level2 != null &&
      level3 != null &&
      level4 != null &&
      level5 != null;

  ElevationThemeData? get asConcrete =>
      isConcrete ? _ElevationThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("level0", level0, defaultValue: null))
      ..add(DoubleProperty("level1", level1, defaultValue: null))
      ..add(DoubleProperty("level2", level2, defaultValue: null))
      ..add(DoubleProperty("level3", level3, defaultValue: null))
      ..add(DoubleProperty("level4", level4, defaultValue: null))
      ..add(DoubleProperty("level5", level5, defaultValue: null));
  }
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

final class _ElevationThemeDataPartialAsConcrete extends ElevationThemeData {
  _ElevationThemeDataPartialAsConcrete(ElevationThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final ElevationThemeDataPartial _value;

  @override
  double get level0 => _value.level0!;

  @override
  double get level1 => _value.level1!;

  @override
  double get level2 => _value.level2!;

  @override
  double get level3 => _value.level3!;

  @override
  double get level4 => _value.level4!;

  @override
  double get level5 => _value.level5!;

  @override
  ElevationThemeData copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => _ElevationThemeDataPartialAsConcrete(
    _value.copyWith(
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
      other is _ElevationThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
