import 'package:material/src/material/flutter.dart';

final class _Linear extends Curve {
  const _Linear();

  @override
  double transformInternal(double t) => t;

  @override
  String toString() => "Curves.linear";
}

class _ThreePointCubic extends ThreePointCubic {
  const _ThreePointCubic(
    super.a1,
    super.b1,
    super.midpoint,
    super.a2,
    super.b2,
  );

  @override
  String toString() =>
      "ThreePointCubic("
      "a1: $a1, b1: $b1, "
      "midpoint: $midpoint, "
      "a2: $a2, b2: $b2"
      ")";
}

abstract class EasingThemeDataPartial with Diagnosticable {
  const EasingThemeDataPartial();

  const factory EasingThemeDataPartial.from({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) = _EasingThemeDataPartial;

  Curve? get emphasized;

  Curve? get emphasizedAccelerate;

  Curve? get emphasizedDecelerate;

  Curve? get standard;

  Curve? get standardAccelerate;

  Curve? get standardDecelerate;

  Curve? get legacy;

  Curve? get legacyAccelerate;

  Curve? get legacyDecelerate;

  Curve? get linear;

  EasingThemeDataPartial copy() => copyWith();

  EasingThemeDataPartial copyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) => .from(
    emphasized: emphasized ?? this.emphasized,
    emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
    emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
    standard: standard ?? this.standard,
    standardAccelerate: standardAccelerate ?? this.standardAccelerate,
    standardDecelerate: standardDecelerate ?? this.standardDecelerate,
    legacy: legacy ?? this.legacy,
    legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
    legacyDecelerate: legacyDecelerate ?? this.legacyDecelerate,
    linear: linear ?? this.linear,
  );

  EasingThemeDataPartial maybeCopyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) =>
      emphasized != null ||
          emphasizedAccelerate != null ||
          emphasizedDecelerate != null ||
          standard != null ||
          standardAccelerate != null ||
          standardDecelerate != null ||
          legacy != null ||
          legacyAccelerate != null ||
          legacyDecelerate != null ||
          linear != null
      ? copyWith(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : this;

  EasingThemeDataPartial merge(EasingThemeDataPartial? other) => other != null
      ? copyWith(
          emphasized: other.emphasized,
          emphasizedAccelerate: other.emphasizedAccelerate,
          emphasizedDecelerate: other.emphasizedDecelerate,
          standard: other.standard,
          standardAccelerate: other.standardAccelerate,
          standardDecelerate: other.standardDecelerate,
          legacy: other.legacy,
          legacyAccelerate: other.legacyAccelerate,
          legacyDecelerate: other.legacyDecelerate,
          linear: other.linear,
        )
      : copy();

  EasingThemeDataPartial maybeMerge(EasingThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          emphasized: other.emphasized,
          emphasizedAccelerate: other.emphasizedAccelerate,
          emphasizedDecelerate: other.emphasizedDecelerate,
          standard: other.standard,
          standardAccelerate: other.standardAccelerate,
          standardDecelerate: other.standardDecelerate,
          legacy: other.legacy,
          legacyAccelerate: other.legacyAccelerate,
          legacyDecelerate: other.legacyDecelerate,
          linear: other.linear,
        )
      : this;

  bool get isEmpty =>
      emphasized == null &&
      emphasizedAccelerate == null &&
      emphasizedDecelerate == null &&
      standard == null &&
      standardAccelerate == null &&
      standardDecelerate == null &&
      legacy == null &&
      legacyAccelerate == null &&
      legacyDecelerate == null &&
      linear == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      emphasized != null &&
      emphasizedAccelerate != null &&
      emphasizedDecelerate != null &&
      standard != null &&
      standardAccelerate != null &&
      standardDecelerate != null &&
      legacy != null &&
      legacyAccelerate != null &&
      legacyDecelerate != null &&
      linear != null;

  EasingThemeData? get asConcrete =>
      isConcrete ? _EasingThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<Curve>(
          "emphasized",
          emphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "emphasizedAccelerate",
          emphasizedAccelerate,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "emphasizedDecelerate",
          emphasizedDecelerate,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>("standard", standard, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "standardAccelerate",
          standardAccelerate,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "standardDecelerate",
          standardDecelerate,
          defaultValue: null,
        ),
      )
      ..add(DiagnosticsProperty<Curve>("legacy", legacy, defaultValue: null))
      ..add(
        DiagnosticsProperty<Curve>(
          "legacyAccelerate",
          legacyAccelerate,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "legacyDecelerate",
          legacyDecelerate,
          defaultValue: null,
        ),
      )
      ..add(DiagnosticsProperty<Curve>("linear", linear, defaultValue: null));
  }
}

final class _EasingThemeDataPartial extends EasingThemeDataPartial {
  const _EasingThemeDataPartial({
    this.emphasized,
    this.emphasizedAccelerate,
    this.emphasizedDecelerate,
    this.standard,
    this.standardAccelerate,
    this.standardDecelerate,
    this.legacy,
    this.legacyAccelerate,
    this.legacyDecelerate,
    this.linear,
  });

  @override
  final Curve? emphasized;

  @override
  final Curve? emphasizedAccelerate;

  @override
  final Curve? emphasizedDecelerate;

  @override
  final Curve? standard;

  @override
  final Curve? standardAccelerate;

  @override
  final Curve? standardDecelerate;

  @override
  final Curve? legacy;

  @override
  final Curve? legacyAccelerate;

  @override
  final Curve? legacyDecelerate;

  @override
  final Curve? linear;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _EasingThemeDataPartial &&
          emphasized == other.emphasized &&
          emphasizedAccelerate == other.emphasizedAccelerate &&
          emphasizedDecelerate == other.emphasizedDecelerate &&
          standard == other.standard &&
          standardAccelerate == other.standardAccelerate &&
          standardDecelerate == other.standardDecelerate &&
          legacy == other.legacy &&
          legacyAccelerate == other.legacyAccelerate &&
          legacyDecelerate == other.legacyDecelerate &&
          linear == other.linear;

  @override
  int get hashCode => Object.hash(
    emphasized,
    emphasizedAccelerate,
    emphasizedDecelerate,
    standard,
    standardAccelerate,
    standardDecelerate,
    legacy,
    legacyAccelerate,
    legacyDecelerate,
    linear,
  );
}

final class _EasingThemeDataPartialAsConcrete extends EasingThemeData {
  _EasingThemeDataPartialAsConcrete(EasingThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final EasingThemeDataPartial _value;

  @override
  Curve get emphasized => _value.emphasized!;

  @override
  Curve get emphasizedAccelerate => _value.emphasizedAccelerate!;

  @override
  Curve get emphasizedDecelerate => _value.emphasizedDecelerate!;

  @override
  Curve get standard => _value.standard!;

  @override
  Curve get standardAccelerate => _value.standardAccelerate!;

  @override
  Curve get standardDecelerate => _value.standardDecelerate!;

  @override
  Curve get legacy => _value.legacy!;

  @override
  Curve get legacyAccelerate => _value.legacyAccelerate!;

  @override
  Curve get legacyDecelerate => _value.legacyDecelerate!;

  @override
  Curve get linear => _value.linear!;

  @override
  EasingThemeData copyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) => _EasingThemeDataPartialAsConcrete(
    _value.copyWith(
      emphasized: emphasized,
      emphasizedAccelerate: emphasizedAccelerate,
      emphasizedDecelerate: emphasizedDecelerate,
      standard: standard,
      standardAccelerate: standardAccelerate,
      standardDecelerate: standardDecelerate,
      legacy: legacy,
      legacyAccelerate: legacyAccelerate,
      legacyDecelerate: legacyDecelerate,
      linear: linear,
    ),
  );

  @override
  EasingThemeData maybeCopyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) =>
      emphasized != null &&
          emphasizedAccelerate != null &&
          emphasizedDecelerate != null &&
          standard != null &&
          standardAccelerate != null &&
          standardDecelerate != null &&
          legacy != null &&
          legacyAccelerate != null &&
          legacyDecelerate != null &&
          linear != null
      ? .from(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : emphasized != null ||
            emphasizedAccelerate != null ||
            emphasizedDecelerate != null ||
            standard != null ||
            standardAccelerate != null ||
            standardDecelerate != null ||
            legacy != null ||
            legacyAccelerate != null ||
            legacyDecelerate != null ||
            linear != null
      ? copyWith(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _EasingThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class EasingThemeData extends EasingThemeDataPartial {
  const EasingThemeData();

  const factory EasingThemeData.from({
    required Curve emphasized,
    required Curve emphasizedAccelerate,
    required Curve emphasizedDecelerate,
    required Curve standard,
    required Curve standardAccelerate,
    required Curve standardDecelerate,
    required Curve legacy,
    required Curve legacyAccelerate,
    required Curve legacyDecelerate,
    required Curve linear,
  }) = _EasingThemeData;

  const factory EasingThemeData.defaults({EasingThemeDataPartial? overrides}) =
      _EasingThemeDataDefaults;

  @override
  Curve get emphasized;

  @override
  Curve get emphasizedAccelerate;

  @override
  Curve get emphasizedDecelerate;

  @override
  Curve get standard;

  @override
  Curve get standardAccelerate;

  @override
  Curve get standardDecelerate;

  @override
  Curve get legacy;

  @override
  Curve get legacyAccelerate;

  @override
  Curve get legacyDecelerate;

  @override
  Curve get linear;

  @override
  EasingThemeData copy() => copyWith();

  @override
  EasingThemeData copyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) => .from(
    emphasized: emphasized ?? this.emphasized,
    emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
    emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
    standard: standard ?? this.standard,
    standardAccelerate: standardAccelerate ?? this.standardAccelerate,
    standardDecelerate: standardDecelerate ?? this.standardDecelerate,
    legacy: legacy ?? this.legacy,
    legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
    legacyDecelerate: legacyDecelerate ?? this.legacyDecelerate,
    linear: linear ?? this.linear,
  );

  @override
  EasingThemeData maybeCopyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) =>
      emphasized != null ||
          emphasizedAccelerate != null ||
          emphasizedDecelerate != null ||
          standard != null ||
          standardAccelerate != null ||
          standardDecelerate != null ||
          legacy != null ||
          legacyAccelerate != null ||
          legacyDecelerate != null ||
          linear != null
      ? copyWith(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : this;

  @override
  EasingThemeData merge(EasingThemeDataPartial? other) => other != null
      ? copyWith(
          emphasized: other.emphasized,
          emphasizedAccelerate: other.emphasizedAccelerate,
          emphasizedDecelerate: other.emphasizedDecelerate,
          standard: other.standard,
          standardAccelerate: other.standardAccelerate,
          standardDecelerate: other.standardDecelerate,
          legacy: other.legacy,
          legacyAccelerate: other.legacyAccelerate,
          legacyDecelerate: other.legacyDecelerate,
          linear: other.linear,
        )
      : copy();

  @override
  EasingThemeData maybeMerge(EasingThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          emphasized: other.emphasized,
          emphasizedAccelerate: other.emphasizedAccelerate,
          emphasizedDecelerate: other.emphasizedDecelerate,
          standard: other.standard,
          standardAccelerate: other.standardAccelerate,
          standardDecelerate: other.standardDecelerate,
          legacy: other.legacy,
          legacyAccelerate: other.legacyAccelerate,
          legacyDecelerate: other.legacyDecelerate,
          linear: other.linear,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  EasingThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Curve>("emphasized", emphasized))
      ..add(
        DiagnosticsProperty<Curve>(
          "emphasizedAccelerate",
          emphasizedAccelerate,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "emphasizedDecelerate",
          emphasizedDecelerate,
        ),
      )
      ..add(DiagnosticsProperty<Curve>("standard", standard))
      ..add(
        DiagnosticsProperty<Curve>("standardAccelerate", standardAccelerate),
      )
      ..add(
        DiagnosticsProperty<Curve>("standardDecelerate", standardDecelerate),
      )
      ..add(DiagnosticsProperty<Curve>("legacy", legacy))
      ..add(DiagnosticsProperty<Curve>("legacyAccelerate", legacyAccelerate))
      ..add(DiagnosticsProperty<Curve>("legacyDecelerate", legacyDecelerate))
      ..add(DiagnosticsProperty<Curve>("linear", linear));
  }
}

final class _EasingThemeData extends EasingThemeData {
  const _EasingThemeData({
    required this.emphasized,
    required this.emphasizedAccelerate,
    required this.emphasizedDecelerate,
    required this.standard,
    required this.standardAccelerate,
    required this.standardDecelerate,
    required this.legacy,
    required this.legacyAccelerate,
    required this.legacyDecelerate,
    required this.linear,
  });

  @override
  final Curve emphasized;

  @override
  final Curve emphasizedAccelerate;

  @override
  final Curve emphasizedDecelerate;

  @override
  final Curve standard;

  @override
  final Curve standardAccelerate;

  @override
  final Curve standardDecelerate;

  @override
  final Curve legacy;

  @override
  final Curve legacyAccelerate;

  @override
  final Curve legacyDecelerate;

  @override
  final Curve linear;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _EasingThemeData &&
          emphasized == other.emphasized &&
          emphasizedAccelerate == other.emphasizedAccelerate &&
          emphasizedDecelerate == other.emphasizedDecelerate &&
          standard == other.standard &&
          standardAccelerate == other.standardAccelerate &&
          standardDecelerate == other.standardDecelerate &&
          legacy == other.legacy &&
          legacyAccelerate == other.legacyAccelerate &&
          legacyDecelerate == other.legacyDecelerate &&
          linear == other.linear;

  @override
  int get hashCode => Object.hash(
    emphasized,
    emphasizedAccelerate,
    emphasizedDecelerate,
    standard,
    standardAccelerate,
    standardDecelerate,
    legacy,
    legacyAccelerate,
    legacyDecelerate,
    linear,
  );
}

final class _EasingThemeDataDefaults extends EasingThemeData {
  const _EasingThemeDataDefaults({EasingThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final EasingThemeDataPartial _overrides;

  @override
  Curve get emphasized =>
      _overrides.emphasized ??
      const _ThreePointCubic(
        Offset(0.05, 0),
        Offset(0.133333, 0.06),
        Offset(0.166666, 0.4),
        Offset(0.208333, 0.82),
        Offset(0.25, 1),
      );

  @override
  Curve get emphasizedAccelerate =>
      _overrides.emphasizedAccelerate ?? const Cubic(0.3, 0.0, 0.8, 0.15);

  @override
  Curve get emphasizedDecelerate =>
      _overrides.emphasizedDecelerate ?? const Cubic(0.05, 0.7, 0.1, 1.0);

  @override
  Curve get standard => _overrides.standard ?? const Cubic(0.2, 0.0, 0.0, 1.0);

  @override
  Curve get standardAccelerate =>
      _overrides.standardAccelerate ?? const Cubic(0.3, 0.0, 1.0, 1.0);

  @override
  Curve get standardDecelerate =>
      _overrides.standardDecelerate ?? const Cubic(0.0, 0.0, 0.0, 1.0);

  @override
  Curve get legacy => _overrides.legacy ?? const Cubic(0.4, 0.0, 0.2, 1.0);

  @override
  Curve get legacyAccelerate =>
      _overrides.legacyAccelerate ?? const Cubic(0.4, 0.0, 1.0, 1.0);

  @override
  Curve get legacyDecelerate =>
      _overrides.legacyDecelerate ?? const Cubic(0.0, 0.0, 0.2, 1.0);

  @override
  Curve get linear => _overrides.linear ?? const _Linear();

  @override
  EasingThemeData copyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) => _EasingThemeDataDefaults(
    overrides: _overrides.copyWith(
      emphasized: emphasized,
      emphasizedAccelerate: emphasizedAccelerate,
      emphasizedDecelerate: emphasizedDecelerate,
      standard: standard,
      standardAccelerate: standardAccelerate,
      standardDecelerate: standardDecelerate,
      legacy: legacy,
      legacyAccelerate: legacyAccelerate,
      legacyDecelerate: legacyDecelerate,
      linear: linear,
    ),
  );

  @override
  EasingThemeData maybeCopyWith({
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
    Curve? linear,
  }) =>
      emphasized != null &&
          emphasizedAccelerate != null &&
          emphasizedDecelerate != null &&
          standard != null &&
          standardAccelerate != null &&
          standardDecelerate != null &&
          legacy != null &&
          legacyAccelerate != null &&
          legacyDecelerate != null &&
          linear != null
      ? .from(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : emphasized != null ||
            emphasizedAccelerate != null ||
            emphasizedDecelerate != null ||
            standard != null ||
            standardAccelerate != null ||
            standardDecelerate != null ||
            legacy != null ||
            legacyAccelerate != null ||
            legacyDecelerate != null ||
            linear != null
      ? copyWith(
          emphasized: emphasized,
          emphasizedAccelerate: emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate,
          standard: standard,
          standardAccelerate: standardAccelerate,
          standardDecelerate: standardDecelerate,
          legacy: legacy,
          legacyAccelerate: legacyAccelerate,
          legacyDecelerate: legacyDecelerate,
          linear: linear,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _EasingThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

abstract class EasingTheme extends StatelessWidget implements ProxyWidget {
  const EasingTheme._({super.key, required this.child});

  const factory EasingTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<EasingThemeDataPartial> resolver,
    required Widget child,
  }) = _EasingThemeWithResolver<EasingThemeDataPartial>;

  const factory EasingTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<EasingThemeDataPartial> callback,
    required Widget child,
  }) = _EasingThemeWithCallback<EasingThemeDataPartial>;

  const factory EasingTheme.mergeWithData({
    Key? key,
    required EasingThemeDataPartial data,
    required Widget child,
  }) = _EasingThemeWithData<EasingThemeDataPartial>;

  const factory EasingTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<EasingThemeData> resolver,
    required Widget child,
  }) = _EasingThemeWithResolver<EasingThemeData>;

  const factory EasingTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<EasingThemeData> callback,
    required Widget child,
  }) = _EasingThemeWithCallback<EasingThemeData>;

  const factory EasingTheme.replaceWithData({
    Key? key,
    required EasingThemeData data,
    required Widget child,
  }) = _EasingThemeWithData<EasingThemeData>;

  ThemeResolver<EasingThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _EasingTheme(resolver: resolver, child: child);

  static EasingThemeData? maybeOf(BuildContext context) {
    final overrides = _EasingTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static EasingThemeData of(BuildContext context) =>
      .defaults(overrides: _EasingTheme.maybeOverridesOf(context));
}

class _EasingThemeWithResolver<T extends EasingThemeDataPartial>
    extends EasingTheme {
  const _EasingThemeWithResolver({
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

class _EasingThemeWithCallback<T extends EasingThemeDataPartial>
    extends EasingTheme {
  const _EasingThemeWithCallback({
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

class _EasingThemeWithData<T extends EasingThemeDataPartial>
    extends EasingTheme {
  const _EasingThemeWithData({
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

final class _EasingTheme
    extends
        InheritedThemeResolverWidget<
          EasingThemeDataPartial,
          _EasingTheme,
          _EasingThemeElement
        >
    implements InheritedTheme {
  const _EasingTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  EasingThemeDataPartial merge(
    EasingThemeDataPartial fallback,
    EasingThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(EasingThemeDataPartial data) => data.isConcrete;

  @override
  _EasingThemeElement createElement() => _EasingThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _EasingTheme(resolver: resolver, child: child);

  static ThemeResolver<EasingThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        EasingThemeDataPartial,
        _EasingTheme,
        _EasingThemeElement
      >(context);

  static EasingThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        EasingThemeDataPartial,
        _EasingTheme,
        _EasingThemeElement
      >(context);
}

final class _EasingThemeElement
    extends
        InheritedThemeResolverElement<
          EasingThemeDataPartial,
          _EasingTheme,
          _EasingThemeElement
        > {
  _EasingThemeElement(super.widget);
}
