import 'package:material/src/material/flutter.dart';

abstract class SpringPartial with Diagnosticable {
  const SpringPartial();

  const factory SpringPartial.from({double? stiffness, double? damping}) =
      _SpringPartial;

  double? get stiffness;

  double? get damping;

  SpringPartial copyWith({double? stiffness, double? damping}) =>
      stiffness != null || damping != null
      ? .from(
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
  const _SpringPartial({this.stiffness, this.damping});

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
  }) = _Spring;

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
  const _Spring({required this.stiffness, required this.damping});

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
  }) = _SpringThemeDataPartial;

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

  const factory SpringThemeData.defaultsStandard() =
      _SpringThemeDataStandardDefaults;

  const factory SpringThemeData._defaultsStandard({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) = _SpringThemeDataStandardDefaults;

  const factory SpringThemeData.defaultsExpressive() =
      _SpringThemeDataExpressiveDefaults;

  const factory SpringThemeData._defaultsExpressive({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
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
  const _SpringThemeData({
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

abstract class _SpringThemeDataDefaults extends SpringThemeData {
  const _SpringThemeDataDefaults({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) : _fastSpatial = fastSpatial,
       _fastEffects = fastEffects,
       _defaultSpatial = defaultSpatial,
       _defaultEffects = defaultEffects,
       _slowSpatial = slowSpatial,
       _slowEffects = slowEffects;

  final SpringPartial? _fastSpatial;
  final SpringPartial? _fastEffects;
  final SpringPartial? _defaultSpatial;
  final SpringPartial? _defaultEffects;
  final SpringPartial? _slowSpatial;
  final SpringPartial? _slowEffects;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SpringThemeDataDefaults &&
          _fastSpatial == other._fastSpatial &&
          _fastEffects == other._fastEffects &&
          _defaultSpatial == other._defaultSpatial &&
          _defaultEffects == other._defaultEffects &&
          _slowSpatial == other._slowSpatial &&
          _slowEffects == other._slowEffects;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _fastSpatial,
    _fastEffects,
    _defaultSpatial,
    _defaultEffects,
    _slowSpatial,
    _slowEffects,
  );
}

class _SpringThemeDataStandardDefaults extends _SpringThemeDataDefaults {
  const _SpringThemeDataStandardDefaults({
    super.fastSpatial,
    super.fastEffects,
    super.defaultSpatial,
    super.defaultEffects,
    super.slowSpatial,
    super.slowEffects,
  });

  @override
  Spring get fastSpatial =>
      const Spring.from(stiffness: 1400.0, damping: 0.9).merge(_fastSpatial);

  @override
  Spring get fastEffects =>
      const Spring.from(stiffness: 3800.0, damping: 1.0).merge(_fastEffects);

  @override
  Spring get defaultSpatial =>
      const Spring.from(stiffness: 700.0, damping: 0.9).merge(_defaultSpatial);

  @override
  Spring get defaultEffects =>
      const Spring.from(stiffness: 1600.0, damping: 1.0).merge(_defaultEffects);

  @override
  Spring get slowSpatial =>
      const Spring.from(stiffness: 300.0, damping: 0.9).merge(_slowSpatial);

  @override
  Spring get slowEffects =>
      const Spring.from(stiffness: 800.0, damping: 1.0).merge(_slowEffects);

  @override
  SpringThemeData copyWith({
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
      : _SpringThemeDataStandardDefaults(
          fastSpatial: fastSpatial ?? _fastSpatial,
          fastEffects: fastEffects ?? _fastEffects,
          defaultSpatial: defaultSpatial ?? _defaultSpatial,
          defaultEffects: defaultEffects ?? _defaultEffects,
          slowSpatial: slowSpatial ?? _slowSpatial,
          slowEffects: slowEffects ?? _slowEffects,
        );

  @override
  SpringThemeData mergeWith({
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
      ? _SpringThemeDataStandardDefaults(
          fastSpatial: _fastSpatial?.merge(fastSpatial) ?? fastSpatial,
          fastEffects: _fastEffects?.merge(fastEffects) ?? fastEffects,
          defaultSpatial:
              _defaultSpatial?.merge(defaultSpatial) ?? defaultSpatial,
          defaultEffects:
              _defaultEffects?.merge(defaultEffects) ?? defaultEffects,
          slowSpatial: _slowSpatial?.merge(slowSpatial) ?? slowSpatial,
          slowEffects: _slowEffects?.merge(slowEffects) ?? slowEffects,
        )
      : this;
}

class _SpringThemeDataExpressiveDefaults extends _SpringThemeDataDefaults {
  const _SpringThemeDataExpressiveDefaults({
    super.fastSpatial,
    super.fastEffects,
    super.defaultSpatial,
    super.defaultEffects,
    super.slowSpatial,
    super.slowEffects,
  });

  @override
  Spring get fastSpatial =>
      const Spring.from(stiffness: 800.0, damping: 0.6).merge(_fastSpatial);

  @override
  Spring get fastEffects =>
      const Spring.from(stiffness: 3800.0, damping: 1.0).merge(_fastEffects);

  @override
  Spring get defaultSpatial =>
      const Spring.from(stiffness: 380.0, damping: 0.8).merge(_defaultSpatial);

  @override
  Spring get defaultEffects =>
      const Spring.from(stiffness: 1600.0, damping: 1.0).merge(_defaultEffects);

  @override
  Spring get slowSpatial =>
      const Spring.from(stiffness: 200.0, damping: 0.8).merge(_slowSpatial);

  @override
  Spring get slowEffects =>
      const Spring.from(stiffness: 800.0, damping: 1.0).merge(_slowEffects);

  @override
  SpringThemeData copyWith({
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
      : _SpringThemeDataExpressiveDefaults(
          fastSpatial: fastSpatial ?? _fastSpatial,
          fastEffects: fastEffects ?? _fastEffects,
          defaultSpatial: defaultSpatial ?? _defaultSpatial,
          defaultEffects: defaultEffects ?? _defaultEffects,
          slowSpatial: slowSpatial ?? _slowSpatial,
          slowEffects: slowEffects ?? _slowEffects,
        );

  @override
  SpringThemeData mergeWith({
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
      ? _SpringThemeDataExpressiveDefaults(
          fastSpatial: _fastSpatial?.merge(fastSpatial) ?? fastSpatial,
          fastEffects: _fastEffects?.merge(fastEffects) ?? fastEffects,
          defaultSpatial:
              _defaultSpatial?.merge(defaultSpatial) ?? defaultSpatial,
          defaultEffects:
              _defaultEffects?.merge(defaultEffects) ?? defaultEffects,
          slowSpatial: _slowSpatial?.merge(slowSpatial) ?? slowSpatial,
          slowEffects: _slowEffects?.merge(slowEffects) ?? slowEffects,
        )
      : this;
}

typedef SpringThemeResolver = ThemeResolver<SpringThemeDataPartial>;

typedef SpringThemeResolverCallback =
    ThemeResolverCallback<SpringThemeDataPartial>;

class _SpringThemeResolver
    extends CombiningThemeResolver<SpringThemeDataPartial> {
  const _SpringThemeResolver(super.a, super.b);

  @override
  SpringThemeDataPartial combine(
    SpringThemeDataPartial a,
    SpringThemeDataPartial b,
  ) => a.merge(b);
}

abstract class SpringTheme extends StatelessWidget implements ProxyWidget {
  const SpringTheme._({super.key, required this.child});

  const factory SpringTheme.withResolver({
    Key? key,
    required SpringThemeResolver resolver,
    required Widget child,
  }) = _SpringThemeWithResolver;

  const factory SpringTheme.withCallback({
    Key? key,
    required SpringThemeResolverCallback callback,
    required Widget child,
  }) = _SpringThemeWithCallback;

  const factory SpringTheme.withData({
    Key? key,
    required SpringThemeDataPartial data,
    required Widget child,
  }) = _SpringThemeWithData;

  SpringThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _SpringTheme.maybeResolverOf(context);
    return _SpringTheme(
      resolver: inherited != null
          ? _SpringThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static SpringThemeData of(BuildContext context) {
    final resolver = _SpringTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaultsStandard(
        fastSpatial: data.fastSpatial,
        fastEffects: data.fastEffects,
        defaultSpatial: data.defaultSpatial,
        defaultEffects: data.defaultEffects,
        slowSpatial: data.slowSpatial,
        slowEffects: data.slowEffects,
      );
    }
    return const .defaultsStandard();
  }
}

class _SpringThemeWithResolver extends SpringTheme {
  const _SpringThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final SpringThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SpringThemeResolver>("resolver", resolver),
    );
  }
}

class _SpringThemeWithCallback extends SpringTheme {
  const _SpringThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final SpringThemeResolverCallback callback;

  @override
  SpringThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SpringThemeResolverCallback>("callback", callback),
    );
  }
}

class _SpringThemeWithData extends SpringTheme {
  const _SpringThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final SpringThemeDataPartial data;

  @override
  SpringThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SpringThemeDataPartial>("data", data));
  }
}

class _SpringTheme extends InheritedTheme {
  const _SpringTheme({super.key, required this.resolver, required super.child});

  final SpringThemeResolver resolver;

  @override
  bool updateShouldNotify(_SpringTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _SpringTheme(resolver: resolver, child: child);

  static SpringThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_SpringTheme>()?.resolver;
}
