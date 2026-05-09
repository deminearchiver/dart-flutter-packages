import 'package:material/src/material/flutter.dart';

class _Linear extends Curve {
  const _Linear();

  @override
  double transformInternal(double t) => t;

  @override
  String toString() => "Curves.linear";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Linear;

  @override
  int get hashCode => runtimeType.hashCode;
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
      ? .from(
          emphasized: emphasized ?? this.emphasized,
          emphasizedAccelerate:
              emphasizedAccelerate ?? this.emphasizedAccelerate,
          emphasizedDecelerate:
              emphasizedDecelerate ?? this.emphasizedDecelerate,
          standard: standard ?? this.standard,
          standardAccelerate: standardAccelerate ?? this.standardAccelerate,
          standardDecelerate: standardDecelerate ?? this.standardDecelerate,
          legacy: legacy ?? this.legacy,
          legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
          legacyDecelerate: legacyDecelerate ?? this.legacyDecelerate,
          linear: linear ?? this.linear,
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
      : this;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is EasingThemeDataPartial &&
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
    runtimeType,
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

class _EasingThemeDataPartial extends EasingThemeDataPartial {
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

  const factory EasingThemeData.defaults() = _EasingThemeDataDefaults;

  const factory EasingThemeData._defaults({
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
  }) = _EasingThemeDataDefaults;

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
      ? .from(
          emphasized: emphasized ?? this.emphasized,
          emphasizedAccelerate:
              emphasizedAccelerate ?? this.emphasizedAccelerate,
          emphasizedDecelerate:
              emphasizedDecelerate ?? this.emphasizedDecelerate,
          standard: standard ?? this.standard,
          standardAccelerate: standardAccelerate ?? this.standardAccelerate,
          standardDecelerate: standardDecelerate ?? this.standardDecelerate,
          legacy: legacy ?? this.legacy,
          legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
          legacyDecelerate: legacyDecelerate ?? this.legacyDecelerate,
          linear: linear ?? this.linear,
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
      : this;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is EasingThemeData &&
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
    runtimeType,
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

class _EasingThemeData extends EasingThemeData {
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
}

class _EasingThemeDataDefaults extends EasingThemeData {
  const _EasingThemeDataDefaults({
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
  }) : _emphasized = emphasized,
       _emphasizedAccelerate = emphasizedAccelerate,
       _emphasizedDecelerate = emphasizedDecelerate,
       _standard = standard,
       _standardAccelerate = standardAccelerate,
       _standardDecelerate = standardDecelerate,
       _legacy = legacy,
       _legacyAccelerate = legacyAccelerate,
       _legacyDecelerate = legacyDecelerate,
       _linear = linear;

  final Curve? _emphasized;
  final Curve? _emphasizedAccelerate;
  final Curve? _emphasizedDecelerate;
  final Curve? _standard;
  final Curve? _standardAccelerate;
  final Curve? _standardDecelerate;
  final Curve? _legacy;
  final Curve? _legacyAccelerate;
  final Curve? _legacyDecelerate;
  final Curve? _linear;

  @override
  Curve get emphasized =>
      _emphasized ??
      const _ThreePointCubic(
        Offset(0.05, 0),
        Offset(0.133333, 0.06),
        Offset(0.166666, 0.4),
        Offset(0.208333, 0.82),
        Offset(0.25, 1),
      );

  @override
  Curve get emphasizedAccelerate =>
      _emphasizedAccelerate ?? const Cubic(0.3, 0.0, 0.8, 0.15);

  @override
  Curve get emphasizedDecelerate =>
      _emphasizedDecelerate ?? const Cubic(0.05, 0.7, 0.1, 1.0);

  @override
  Curve get standard => _standard ?? const Cubic(0.2, 0.0, 0.0, 1.0);

  @override
  Curve get standardAccelerate =>
      _standardAccelerate ?? const Cubic(0.3, 0.0, 1.0, 1.0);

  @override
  Curve get standardDecelerate =>
      _standardDecelerate ?? const Cubic(0.0, 0.0, 0.0, 1.0);

  @override
  Curve get legacy => _legacy ?? const Cubic(0.4, 0.0, 0.2, 1.0);

  @override
  Curve get legacyAccelerate =>
      _legacyAccelerate ?? const Cubic(0.4, 0.0, 1.0, 1.0);

  @override
  Curve get legacyDecelerate =>
      _legacyDecelerate ?? const Cubic(0.0, 0.0, 0.2, 1.0);

  @override
  Curve get linear => _linear ?? const _Linear();

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
      : _EasingThemeDataDefaults(
          emphasized: emphasized ?? _emphasized,
          emphasizedAccelerate: emphasizedAccelerate ?? _emphasizedAccelerate,
          emphasizedDecelerate: emphasizedDecelerate ?? _emphasizedDecelerate,
          standard: standard ?? _standard,
          standardAccelerate: standardAccelerate ?? _standardAccelerate,
          standardDecelerate: standardDecelerate ?? _standardDecelerate,
          legacy: legacy ?? _legacy,
          legacyAccelerate: legacyAccelerate ?? _legacyAccelerate,
          legacyDecelerate: legacyDecelerate ?? _legacyDecelerate,
          linear: linear ?? _linear,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _EasingThemeDataDefaults &&
          _emphasized == other._emphasized &&
          _emphasizedAccelerate == other._emphasizedAccelerate &&
          _emphasizedDecelerate == other._emphasizedDecelerate &&
          _standard == other._standard &&
          _standardAccelerate == other._standardAccelerate &&
          _standardDecelerate == other._standardDecelerate &&
          _legacy == other._legacy &&
          _legacyAccelerate == other._legacyAccelerate &&
          _legacyDecelerate == other._legacyDecelerate &&
          _linear == other._linear;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _emphasized,
    _emphasizedAccelerate,
    _emphasizedDecelerate,
    _standard,
    _standardAccelerate,
    _standardDecelerate,
    _legacy,
    _legacyAccelerate,
    _legacyDecelerate,
    _linear,
  );
}

abstract class EasingTheme extends StatelessWidget implements ProxyWidget {
  const EasingTheme._({super.key, required this.child});

  const factory EasingTheme.withResolver({
    Key? key,
    required EasingThemeResolver resolver,
    required Widget child,
  }) = _EasingThemeWithResolver;

  const factory EasingTheme.withCallback({
    Key? key,
    required EasingThemeResolverCallback callback,
    required Widget child,
  }) = _EasingThemeWithCallback;

  const factory EasingTheme.withData({
    Key? key,
    required EasingThemeDataPartial data,
    required Widget child,
  }) = _EasingThemeWithData;

  EasingThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _EasingTheme.maybeResolverOf(context);
    return _EasingTheme(
      resolver: inherited != null
          ? _EasingThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static EasingThemeData of(BuildContext context) {
    final resolver = _EasingTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        emphasized: data.emphasized,
        emphasizedAccelerate: data.emphasizedAccelerate,
        emphasizedDecelerate: data.emphasizedDecelerate,
        standard: data.standard,
        standardAccelerate: data.standardAccelerate,
        standardDecelerate: data.standardDecelerate,
        legacy: data.legacy,
        legacyAccelerate: data.legacyAccelerate,
        legacyDecelerate: data.legacyDecelerate,
        linear: data.linear,
      );
    }
    return const .defaults();
  }
}

typedef EasingThemeResolver = ThemeResolver<EasingThemeDataPartial>;

typedef EasingThemeResolverCallback =
    ThemeResolverCallback<EasingThemeDataPartial>;

class _EasingThemeResolver
    extends CombiningThemeResolver<EasingThemeDataPartial> {
  const _EasingThemeResolver(super.a, super.b);

  @override
  EasingThemeDataPartial combine(
    EasingThemeDataPartial a,
    EasingThemeDataPartial b,
  ) => a.merge(b);
}

class _EasingThemeWithResolver extends EasingTheme {
  const _EasingThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final EasingThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<EasingThemeResolver>("resolver", resolver),
    );
  }
}

class _EasingThemeWithCallback extends EasingTheme {
  const _EasingThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final EasingThemeResolverCallback callback;

  @override
  EasingThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<EasingThemeResolverCallback>("callback", callback),
    );
  }
}

class _EasingThemeWithData extends EasingTheme {
  const _EasingThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final EasingThemeDataPartial data;

  @override
  EasingThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EasingThemeDataPartial>("data", data));
  }
}

class _EasingTheme extends InheritedTheme {
  const _EasingTheme({super.key, required this.resolver, required super.child});

  final EasingThemeResolver resolver;

  @override
  bool updateShouldNotify(_EasingTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _EasingTheme(resolver: resolver, child: child);

  static EasingThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_EasingTheme>()?.resolver;
}
