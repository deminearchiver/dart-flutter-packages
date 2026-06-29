import 'package:material/src/material/flutter.dart';

abstract class DurationThemeDataPartial with Diagnosticable {
  const DurationThemeDataPartial();

  const factory DurationThemeDataPartial.from({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) = _DurationThemeDataPartial;

  Duration? get short1;

  Duration? get short2;

  Duration? get short3;

  Duration? get short4;

  Duration? get medium1;

  Duration? get medium2;

  Duration? get medium3;

  Duration? get medium4;

  Duration? get long1;

  Duration? get long2;

  Duration? get long3;

  Duration? get long4;

  Duration? get extraLong1;

  Duration? get extraLong2;

  Duration? get extraLong3;

  Duration? get extraLong4;

  DurationThemeDataPartial copy() => copyWith();

  DurationThemeDataPartial copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) => .from(
    short1: short1 ?? this.short1,
    short2: short2 ?? this.short2,
    short3: short3 ?? this.short3,
    short4: short4 ?? this.short4,
    medium1: medium1 ?? this.medium1,
    medium2: medium2 ?? this.medium2,
    medium3: medium3 ?? this.medium3,
    medium4: medium4 ?? this.medium4,
    long1: long1 ?? this.long1,
    long2: long2 ?? this.long2,
    long3: long3 ?? this.long3,
    long4: long4 ?? this.long4,
    extraLong1: extraLong1 ?? this.extraLong1,
    extraLong2: extraLong2 ?? this.extraLong2,
    extraLong3: extraLong3 ?? this.extraLong3,
    extraLong4: extraLong4 ?? this.extraLong4,
  );

  DurationThemeDataPartial maybeCopyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null ||
          short2 != null ||
          short3 != null ||
          short4 != null ||
          medium1 != null ||
          medium2 != null ||
          medium3 != null ||
          medium4 != null ||
          long1 != null ||
          long2 != null ||
          long3 != null ||
          long4 != null ||
          extraLong1 != null ||
          extraLong2 != null ||
          extraLong3 != null ||
          extraLong4 != null
      ? copyWith(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : this;

  DurationThemeDataPartial merge(DurationThemeDataPartial? other) =>
      other != null
      ? copyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : copy();

  DurationThemeDataPartial maybeMerge(DurationThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : this;

  bool get isEmpty =>
      short1 == null &&
      short2 == null &&
      short3 == null &&
      short4 == null &&
      medium1 == null &&
      medium2 == null &&
      medium3 == null &&
      medium4 == null &&
      long1 == null &&
      long2 == null &&
      long3 == null &&
      long4 == null &&
      extraLong1 == null &&
      extraLong2 == null &&
      extraLong3 == null &&
      extraLong4 == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      short1 != null &&
      short2 != null &&
      short3 != null &&
      short4 != null &&
      medium1 != null &&
      medium2 != null &&
      medium3 != null &&
      medium4 != null &&
      long1 != null &&
      long2 != null &&
      long3 != null &&
      long4 != null &&
      extraLong1 != null &&
      extraLong2 != null &&
      extraLong3 != null &&
      extraLong4 != null;

  DurationThemeData? get asConcrete =>
      isConcrete ? _DurationThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Duration>("short1", short1, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short2", short2, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short3", short3, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short4", short4, defaultValue: null))
      ..add(
        DiagnosticsProperty<Duration>("medium1", medium1, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium2", medium2, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium3", medium3, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium4", medium4, defaultValue: null),
      )
      ..add(DiagnosticsProperty<Duration>("long1", long1, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long2", long2, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long3", long3, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long4", long4, defaultValue: null))
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong1",
          extraLong1,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong2",
          extraLong2,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong3",
          extraLong3,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong4",
          extraLong4,
          defaultValue: null,
        ),
      );
  }
}

final class _DurationThemeDataPartial extends DurationThemeDataPartial {
  const _DurationThemeDataPartial({
    this.short1,
    this.short2,
    this.short3,
    this.short4,
    this.medium1,
    this.medium2,
    this.medium3,
    this.medium4,
    this.long1,
    this.long2,
    this.long3,
    this.long4,
    this.extraLong1,
    this.extraLong2,
    this.extraLong3,
    this.extraLong4,
  });

  @override
  final Duration? short1;

  @override
  final Duration? short2;

  @override
  final Duration? short3;

  @override
  final Duration? short4;

  @override
  final Duration? medium1;

  @override
  final Duration? medium2;

  @override
  final Duration? medium3;

  @override
  final Duration? medium4;

  @override
  final Duration? long1;

  @override
  final Duration? long2;

  @override
  final Duration? long3;

  @override
  final Duration? long4;

  @override
  final Duration? extraLong1;

  @override
  final Duration? extraLong2;

  @override
  final Duration? extraLong3;

  @override
  final Duration? extraLong4;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DurationThemeDataPartial &&
          short1 == other.short1 &&
          short2 == other.short2 &&
          short3 == other.short3 &&
          short4 == other.short4 &&
          medium1 == other.medium1 &&
          medium2 == other.medium2 &&
          medium3 == other.medium3 &&
          medium4 == other.medium4 &&
          long1 == other.long1 &&
          long2 == other.long2 &&
          long3 == other.long3 &&
          long4 == other.long4 &&
          extraLong1 == other.extraLong1 &&
          extraLong2 == other.extraLong2 &&
          extraLong3 == other.extraLong3 &&
          extraLong4 == other.extraLong4;

  @override
  int get hashCode => Object.hash(
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

final class _DurationThemeDataPartialAsConcrete extends DurationThemeData {
  _DurationThemeDataPartialAsConcrete(DurationThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final DurationThemeDataPartial _value;

  @override
  Duration get short1 => _value.short1!;

  @override
  Duration get short2 => _value.short2!;

  @override
  Duration get short3 => _value.short3!;

  @override
  Duration get short4 => _value.short4!;

  @override
  Duration get medium1 => _value.medium1!;

  @override
  Duration get medium2 => _value.medium2!;

  @override
  Duration get medium3 => _value.medium3!;

  @override
  Duration get medium4 => _value.medium4!;

  @override
  Duration get long1 => _value.long1!;

  @override
  Duration get long2 => _value.long2!;

  @override
  Duration get long3 => _value.long3!;

  @override
  Duration get long4 => _value.long4!;

  @override
  Duration get extraLong1 => _value.extraLong1!;

  @override
  Duration get extraLong2 => _value.extraLong2!;

  @override
  Duration get extraLong3 => _value.extraLong3!;

  @override
  Duration get extraLong4 => _value.extraLong4!;

  @override
  DurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) => _DurationThemeDataPartialAsConcrete(
    _value.copyWith(
      short1: short1,
      short2: short2,
      short3: short3,
      short4: short4,
      medium1: medium1,
      medium2: medium2,
      medium3: medium3,
      medium4: medium4,
      long1: long1,
      long2: long2,
      long3: long3,
      long4: long4,
      extraLong1: extraLong1,
      extraLong2: extraLong2,
      extraLong3: extraLong3,
      extraLong4: extraLong4,
    ),
  );

  @override
  DurationThemeData maybeCopyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null &&
          short2 != null &&
          short3 != null &&
          short4 != null &&
          medium1 != null &&
          medium2 != null &&
          medium3 != null &&
          medium4 != null &&
          long1 != null &&
          long2 != null &&
          long3 != null &&
          long4 != null &&
          extraLong1 != null &&
          extraLong2 != null &&
          extraLong3 != null &&
          extraLong4 != null
      ? .from(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : short1 != null ||
            short2 != null ||
            short3 != null ||
            short4 != null ||
            medium1 != null ||
            medium2 != null ||
            medium3 != null ||
            medium4 != null ||
            long1 != null ||
            long2 != null ||
            long3 != null ||
            long4 != null ||
            extraLong1 != null ||
            extraLong2 != null ||
            extraLong3 != null ||
            extraLong4 != null
      ? copyWith(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DurationThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class DurationThemeData extends DurationThemeDataPartial {
  const DurationThemeData();

  const factory DurationThemeData.from({
    required Duration short1,
    required Duration short2,
    required Duration short3,
    required Duration short4,
    required Duration medium1,
    required Duration medium2,
    required Duration medium3,
    required Duration medium4,
    required Duration long1,
    required Duration long2,
    required Duration long3,
    required Duration long4,
    required Duration extraLong1,
    required Duration extraLong2,
    required Duration extraLong3,
    required Duration extraLong4,
  }) = _DurationThemeData;

  const factory DurationThemeData.defaults({
    DurationThemeDataPartial? overrides,
  }) = _DurationThemeDataDefaults;

  @override
  Duration get short1;

  @override
  Duration get short2;

  @override
  Duration get short3;

  @override
  Duration get short4;

  @override
  Duration get medium1;

  @override
  Duration get medium2;

  @override
  Duration get medium3;

  @override
  Duration get medium4;

  @override
  Duration get long1;

  @override
  Duration get long2;

  @override
  Duration get long3;

  @override
  Duration get long4;

  @override
  Duration get extraLong1;

  @override
  Duration get extraLong2;

  @override
  Duration get extraLong3;

  @override
  Duration get extraLong4;

  @override
  DurationThemeData copy() => copyWith();

  @override
  DurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) => .from(
    short1: short1 ?? this.short1,
    short2: short2 ?? this.short2,
    short3: short3 ?? this.short3,
    short4: short4 ?? this.short4,
    medium1: medium1 ?? this.medium1,
    medium2: medium2 ?? this.medium2,
    medium3: medium3 ?? this.medium3,
    medium4: medium4 ?? this.medium4,
    long1: long1 ?? this.long1,
    long2: long2 ?? this.long2,
    long3: long3 ?? this.long3,
    long4: long4 ?? this.long4,
    extraLong1: extraLong1 ?? this.extraLong1,
    extraLong2: extraLong2 ?? this.extraLong2,
    extraLong3: extraLong3 ?? this.extraLong3,
    extraLong4: extraLong4 ?? this.extraLong4,
  );

  @override
  DurationThemeData maybeCopyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null ||
          short2 != null ||
          short3 != null ||
          short4 != null ||
          medium1 != null ||
          medium2 != null ||
          medium3 != null ||
          medium4 != null ||
          long1 != null ||
          long2 != null ||
          long3 != null ||
          long4 != null ||
          extraLong1 != null ||
          extraLong2 != null ||
          extraLong3 != null ||
          extraLong4 != null
      ? copyWith(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : this;

  @override
  DurationThemeData merge(DurationThemeDataPartial? other) => other != null
      ? copyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : copy();

  @override
  DurationThemeData maybeMerge(DurationThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  DurationThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Duration>("short1", short1))
      ..add(DiagnosticsProperty<Duration>("short2", short2))
      ..add(DiagnosticsProperty<Duration>("short3", short3))
      ..add(DiagnosticsProperty<Duration>("short4", short4))
      ..add(DiagnosticsProperty<Duration>("medium1", medium1))
      ..add(DiagnosticsProperty<Duration>("medium2", medium2))
      ..add(DiagnosticsProperty<Duration>("medium3", medium3))
      ..add(DiagnosticsProperty<Duration>("medium4", medium4))
      ..add(DiagnosticsProperty<Duration>("long1", long1))
      ..add(DiagnosticsProperty<Duration>("long2", long2))
      ..add(DiagnosticsProperty<Duration>("long3", long3))
      ..add(DiagnosticsProperty<Duration>("long4", long4))
      ..add(DiagnosticsProperty<Duration>("extraLong1", extraLong1))
      ..add(DiagnosticsProperty<Duration>("extraLong2", extraLong2))
      ..add(DiagnosticsProperty<Duration>("extraLong3", extraLong3))
      ..add(DiagnosticsProperty<Duration>("extraLong4", extraLong4));
  }
}

final class _DurationThemeData extends DurationThemeData {
  const _DurationThemeData({
    required this.short1,
    required this.short2,
    required this.short3,
    required this.short4,
    required this.medium1,
    required this.medium2,
    required this.medium3,
    required this.medium4,
    required this.long1,
    required this.long2,
    required this.long3,
    required this.long4,
    required this.extraLong1,
    required this.extraLong2,
    required this.extraLong3,
    required this.extraLong4,
  });

  @override
  final Duration short1;

  @override
  final Duration short2;

  @override
  final Duration short3;

  @override
  final Duration short4;

  @override
  final Duration medium1;

  @override
  final Duration medium2;

  @override
  final Duration medium3;

  @override
  final Duration medium4;

  @override
  final Duration long1;

  @override
  final Duration long2;

  @override
  final Duration long3;

  @override
  final Duration long4;

  @override
  final Duration extraLong1;

  @override
  final Duration extraLong2;

  @override
  final Duration extraLong3;

  @override
  final Duration extraLong4;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DurationThemeData &&
          short1 == other.short1 &&
          short2 == other.short2 &&
          short3 == other.short3 &&
          short4 == other.short4 &&
          medium1 == other.medium1 &&
          medium2 == other.medium2 &&
          medium3 == other.medium3 &&
          medium4 == other.medium4 &&
          long1 == other.long1 &&
          long2 == other.long2 &&
          long3 == other.long3 &&
          long4 == other.long4 &&
          extraLong1 == other.extraLong1 &&
          extraLong2 == other.extraLong2 &&
          extraLong3 == other.extraLong3 &&
          extraLong4 == other.extraLong4;

  @override
  int get hashCode => Object.hash(
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

final class _DurationThemeDataDefaults extends DurationThemeData {
  const _DurationThemeDataDefaults({DurationThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final DurationThemeDataPartial _overrides;

  @override
  Duration get short1 => _overrides.short1 ?? const .new(milliseconds: 50);

  @override
  Duration get short2 => _overrides.short2 ?? const .new(milliseconds: 100);

  @override
  Duration get short3 => _overrides.short3 ?? const .new(milliseconds: 150);

  @override
  Duration get short4 => _overrides.short4 ?? const .new(milliseconds: 200);

  @override
  Duration get medium1 => _overrides.medium1 ?? const .new(milliseconds: 250);

  @override
  Duration get medium2 => _overrides.medium2 ?? const .new(milliseconds: 300);

  @override
  Duration get medium3 => _overrides.medium3 ?? const .new(milliseconds: 350);

  @override
  Duration get medium4 => _overrides.medium4 ?? const .new(milliseconds: 400);

  @override
  Duration get long1 => _overrides.long1 ?? const .new(milliseconds: 450);

  @override
  Duration get long2 => _overrides.long2 ?? const .new(milliseconds: 500);

  @override
  Duration get long3 => _overrides.long3 ?? const .new(milliseconds: 550);

  @override
  Duration get long4 => _overrides.long4 ?? const .new(milliseconds: 600);

  @override
  Duration get extraLong1 =>
      _overrides.extraLong1 ?? const .new(milliseconds: 700);

  @override
  Duration get extraLong2 =>
      _overrides.extraLong2 ?? const .new(milliseconds: 800);

  @override
  Duration get extraLong3 =>
      _overrides.extraLong3 ?? const .new(milliseconds: 900);

  @override
  Duration get extraLong4 =>
      _overrides.extraLong4 ?? const .new(milliseconds: 1000);

  @override
  DurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) => _DurationThemeDataDefaults(
    overrides: _overrides.copyWith(
      short1: short1,
      short2: short2,
      short3: short3,
      short4: short4,
      medium1: medium1,
      medium2: medium2,
      medium3: medium3,
      medium4: medium4,
      long1: long1,
      long2: long2,
      long3: long3,
      long4: long4,
      extraLong1: extraLong1,
      extraLong2: extraLong2,
      extraLong3: extraLong3,
      extraLong4: extraLong4,
    ),
  );

  @override
  DurationThemeData maybeCopyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null &&
          short2 != null &&
          short3 != null &&
          short4 != null &&
          medium1 != null &&
          medium2 != null &&
          medium3 != null &&
          medium4 != null &&
          long1 != null &&
          long2 != null &&
          long3 != null &&
          long4 != null &&
          extraLong1 != null &&
          extraLong2 != null &&
          extraLong3 != null &&
          extraLong4 != null
      ? .from(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : short1 != null ||
            short2 != null ||
            short3 != null ||
            short4 != null ||
            medium1 != null ||
            medium2 != null ||
            medium3 != null ||
            medium4 != null ||
            long1 != null ||
            long2 != null ||
            long3 != null ||
            long4 != null ||
            extraLong1 != null ||
            extraLong2 != null ||
            extraLong3 != null ||
            extraLong4 != null
      ? copyWith(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _DurationThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

abstract class DurationTheme extends StatelessWidget implements ProxyWidget {
  const DurationTheme._({super.key, required this.child});

  const factory DurationTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<DurationThemeDataPartial> resolver,
    required Widget child,
  }) = _DurationThemeWithResolver<DurationThemeDataPartial>;

  const factory DurationTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<DurationThemeDataPartial> callback,
    required Widget child,
  }) = _DurationThemeWithCallback<DurationThemeDataPartial>;

  const factory DurationTheme.mergeWithData({
    Key? key,
    required DurationThemeDataPartial data,
    required Widget child,
  }) = _DurationThemeWithData<DurationThemeDataPartial>;

  const factory DurationTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<DurationThemeData> resolver,
    required Widget child,
  }) = _DurationThemeWithResolver<DurationThemeData>;

  const factory DurationTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<DurationThemeData> callback,
    required Widget child,
  }) = _DurationThemeWithCallback<DurationThemeData>;

  const factory DurationTheme.replaceWithData({
    Key? key,
    required DurationThemeData data,
    required Widget child,
  }) = _DurationThemeWithData<DurationThemeData>;

  ThemeResolver<DurationThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _DurationTheme(resolver: resolver, child: child);

  static DurationThemeData? maybeOf(BuildContext context) {
    final overrides = _DurationTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static DurationThemeData of(BuildContext context) =>
      .defaults(overrides: _DurationTheme.maybeOverridesOf(context));
}

class _DurationThemeWithResolver<T extends DurationThemeDataPartial>
    extends DurationTheme {
  const _DurationThemeWithResolver({
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

class _DurationThemeWithCallback<T extends DurationThemeDataPartial>
    extends DurationTheme {
  const _DurationThemeWithCallback({
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

class _DurationThemeWithData<T extends DurationThemeDataPartial>
    extends DurationTheme {
  const _DurationThemeWithData({
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

final class _DurationTheme
    extends
        InheritedThemeResolverWidget<
          DurationThemeDataPartial,
          _DurationTheme,
          _DurationThemeElement
        >
    implements InheritedTheme {
  const _DurationTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  DurationThemeDataPartial merge(
    DurationThemeDataPartial fallback,
    DurationThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(DurationThemeDataPartial data) => data.isConcrete;

  @override
  _DurationThemeElement createElement() => _DurationThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _DurationTheme(resolver: resolver, child: child);

  static ThemeResolver<DurationThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        DurationThemeDataPartial,
        _DurationTheme,
        _DurationThemeElement
      >(context);

  static DurationThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        DurationThemeDataPartial,
        _DurationTheme,
        _DurationThemeElement
      >(context);
}

final class _DurationThemeElement
    extends
        InheritedThemeResolverElement<
          DurationThemeDataPartial,
          _DurationTheme,
          _DurationThemeElement
        > {
  _DurationThemeElement(super.widget);
}
