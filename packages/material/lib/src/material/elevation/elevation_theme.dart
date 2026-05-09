import 'package:material/src/material/flutter.dart';

abstract class ElevationThemeDataPartial with Diagnosticable {
  const ElevationThemeDataPartial();

  const factory ElevationThemeDataPartial.from({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) = _ElevationThemeDataPartial.from;

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

  ElevationThemeDataPartial copyWith({
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
      ? .from(
          level0: level0 ?? this.level0,
          level1: level1 ?? this.level1,
          level2: level2 ?? this.level2,
          level3: level3 ?? this.level3,
          level4: level4 ?? this.level4,
          level5: level5 ?? this.level5,
        )
      : this;

  ElevationThemeDataPartial mergeWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => copyWith(
    level0: level0,
    level1: level1,
    level2: level2,
    level3: level3,
    level4: level4,
    level5: level5,
  );

  ElevationThemeDataPartial merge(ElevationThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          level0: other.level0,
          level1: other.level1,
          level2: other.level2,
          level3: other.level3,
          level4: other.level4,
          level5: other.level5,
        )
      : this;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ElevationThemeDataPartial &&
          level0 == other.level0 &&
          level1 == other.level1 &&
          level2 == other.level2 &&
          level3 == other.level3 &&
          level4 == other.level4 &&
          level5 == other.level5;

  @override
  int get hashCode =>
      Object.hash(runtimeType, level0, level1, level2, level3, level4, level5);
}

class _ElevationThemeDataPartial extends ElevationThemeDataPartial {
  const _ElevationThemeDataPartial.from({
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
}

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

  const factory ElevationThemeData.defaults() = _ElevationThemeDataDefaults;

  const factory ElevationThemeData._defaults({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
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
  ElevationThemeData copyWith({
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
      ? .from(
          level0: level0 ?? this.level0,
          level1: level1 ?? this.level1,
          level2: level2 ?? this.level2,
          level3: level3 ?? this.level3,
          level4: level4 ?? this.level4,
          level5: level5 ?? this.level5,
        )
      : this;

  @override
  ElevationThemeData mergeWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) => copyWith(
    level0: level0,
    level1: level1,
    level2: level2,
    level3: level3,
    level4: level4,
    level5: level5,
  );

  @override
  ElevationThemeData merge(ElevationThemeDataPartial? other) => other != null
      ? mergeWith(
          level0: other.level0,
          level1: other.level1,
          level2: other.level2,
          level3: other.level3,
          level4: other.level4,
          level5: other.level5,
        )
      : this;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ElevationThemeData &&
          level0 == other.level0 &&
          level1 == other.level1 &&
          level2 == other.level2 &&
          level3 == other.level3 &&
          level4 == other.level4 &&
          level5 == other.level5;

  @override
  int get hashCode =>
      Object.hash(runtimeType, level0, level1, level2, level3, level4, level5);
}

class _ElevationThemeData extends ElevationThemeData {
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
}

class _ElevationThemeDataDefaults extends ElevationThemeData {
  const _ElevationThemeDataDefaults({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) : _level0 = level0,
       _level1 = level1,
       _level2 = level2,
       _level3 = level3,
       _level4 = level4,
       _level5 = level5;

  final double? _level0;
  final double? _level1;
  final double? _level2;
  final double? _level3;
  final double? _level4;
  final double? _level5;

  @override
  double get level0 => _level0 ?? 0.0;

  @override
  double get level1 => _level1 ?? 1.0;

  @override
  double get level2 => _level2 ?? 3.0;

  @override
  double get level3 => _level3 ?? 6.0;

  @override
  double get level4 => _level4 ?? 9.0;

  @override
  double get level5 => _level5 ?? 12.0;

  @override
  ElevationThemeData copyWith({
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
      : _ElevationThemeDataDefaults(
          level0: level0 ?? _level0,
          level1: level1 ?? _level1,
          level2: level2 ?? _level2,
          level3: level3 ?? _level3,
          level4: level4 ?? _level4,
          level5: level5 ?? _level5,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ElevationThemeDataDefaults &&
          _level0 == other._level0 &&
          _level1 == other._level1 &&
          _level2 == other._level2 &&
          _level3 == other._level3 &&
          _level4 == other._level4 &&
          _level5 == other._level5;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _level0,
    _level1,
    _level2,
    _level3,
    _level4,
    _level5,
  );
}

typedef ElevationThemeResolver = ThemeResolver<ElevationThemeDataPartial>;

typedef ElevationThemeResolverCallback =
    ThemeResolverCallback<ElevationThemeDataPartial>;

class _ElevationThemeResolver
    extends CombiningThemeResolver<ElevationThemeDataPartial> {
  const _ElevationThemeResolver(super.a, super.b);

  @override
  ElevationThemeDataPartial combine(
    ElevationThemeDataPartial a,
    ElevationThemeDataPartial b,
  ) => a.merge(b);
}

abstract class ElevationTheme extends StatelessWidget implements ProxyWidget {
  const ElevationTheme._({super.key, required this.child});

  const factory ElevationTheme.withResolver({
    Key? key,
    required ElevationThemeResolver resolver,
    required Widget child,
  }) = _ElevationThemeWithResolver;

  const factory ElevationTheme.withCallback({
    Key? key,
    required ElevationThemeResolverCallback callback,
    required Widget child,
  }) = _ElevationThemeWithCallback;

  const factory ElevationTheme.withData({
    Key? key,
    required ElevationThemeDataPartial data,
    required Widget child,
  }) = _ElevationThemeWithData;

  ElevationThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _ElevationTheme.maybeResolverOf(context);
    return _ElevationTheme(
      resolver: inherited != null
          ? _ElevationThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static ElevationThemeData of(BuildContext context) {
    final resolver = _ElevationTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        level0: data.level0,
        level1: data.level1,
        level2: data.level2,
        level3: data.level3,
        level4: data.level4,
        level5: data.level5,
      );
    }
    return const .defaults();
  }
}

class _ElevationThemeWithResolver extends ElevationTheme {
  const _ElevationThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ElevationThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ElevationThemeResolver>("resolver", resolver),
    );
  }
}

class _ElevationThemeWithCallback extends ElevationTheme {
  const _ElevationThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ElevationThemeResolverCallback callback;

  @override
  ElevationThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ElevationThemeResolverCallback>("callback", callback),
    );
  }
}

class _ElevationThemeWithData extends ElevationTheme {
  const _ElevationThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final ElevationThemeDataPartial data;

  @override
  ElevationThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ElevationThemeDataPartial>("data", data),
    );
  }
}

class _ElevationTheme extends InheritedTheme {
  const _ElevationTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final ElevationThemeResolver resolver;

  @override
  bool updateShouldNotify(_ElevationTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ElevationTheme(resolver: resolver, child: child);

  static ElevationThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ElevationTheme>()?.resolver;
}
