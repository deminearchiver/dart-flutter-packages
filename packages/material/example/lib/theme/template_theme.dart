import 'package:material_example/flutter.dart';

// Replace `Template` with the desired theme name in PascalCase.

abstract class TemplateThemeDataPartial with Diagnosticable {
  const TemplateThemeDataPartial();

  const factory TemplateThemeDataPartial.from({
    int? i,
    double? d,
    String? s,
    Color? c,
  }) = _TemplateThemeDataPartial;

  int? get i;
  double? get d;
  String? get s;
  Color? get c;

  TemplateThemeDataPartial copyWith({int? i, double? d, String? s, Color? c}) =>
      i != null || d != null || s != null || c != null
      ? .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c)
      : this;

  TemplateThemeDataPartial merge(TemplateThemeDataPartial? other) =>
      other != null
      ? copyWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TemplateThemeDataPartial &&
          i == other.i &&
          d == other.d &&
          s == other.s &&
          c == other.c;

  @override
  int get hashCode => Object.hash(runtimeType, i, d, s, c);
}

class _TemplateThemeDataPartial extends TemplateThemeDataPartial {
  const _TemplateThemeDataPartial({this.i, this.d, this.s, this.c});

  @override
  final int? i;

  @override
  final double? d;

  @override
  final String? s;

  @override
  final Color? c;
}

abstract class TemplateThemeData extends TemplateThemeDataPartial {
  const TemplateThemeData();

  const factory TemplateThemeData.from({
    required int i,
    required double d,
    required String s,
    required Color c,
  }) = _TemplateThemeData;

  const factory TemplateThemeData.defaults() = _TemplateThemeDataDefaults;

  const factory TemplateThemeData._defaults({
    int? i,
    double? d,
    String? s,
    Color? c,
  }) = _TemplateThemeDataDefaults;

  @override
  int get i;

  @override
  double get d;

  @override
  String get s;

  @override
  Color get c;

  @override
  TemplateThemeData copyWith({int? i, double? d, String? s, Color? c}) =>
      i != null || d != null || s != null || c != null
      ? .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c)
      : this;

  @override
  TemplateThemeData merge(TemplateThemeDataPartial? other) => other != null
      ? copyWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TemplateThemeData &&
          i == other.i &&
          d == other.d &&
          s == other.s &&
          c == other.c;

  @override
  int get hashCode => Object.hash(runtimeType, i, d, s, c);
}

class _TemplateThemeData extends TemplateThemeData {
  const _TemplateThemeData({
    required this.i,
    required this.d,
    required this.s,
    required this.c,
  });

  @override
  final int i;

  @override
  final double d;

  @override
  final String s;

  @override
  final Color c;
}

// Represents a snapshot of the theme data at a specific rebuild of the widget
// tree. Values are computed on every access and not cached.
class _TemplateThemeDataDefaults extends TemplateThemeData {
  const _TemplateThemeDataDefaults({int? i, double? d, String? s, Color? c})
    : _i = i,
      _d = d,
      _s = s,
      _c = c;

  final int? _i;
  final double? _d;
  final String? _s;
  final Color? _c;

  @override
  int get i => _i ?? 0;

  @override
  double get d => _d ?? 1.0;

  @override
  String get s => _s ?? "a";

  @override
  Color get c => _c ?? const Color(0xFFFF0000);

  // If all properties are provided, return a new instance. Otherwise,
  // add optional overrides to these defaults.
  @override
  TemplateThemeData copyWith({int? i, double? d, String? s, Color? c}) =>
      i != null && d != null && s != null && c != null
      ? .from(i: i, d: d, s: s, c: c)
      : _TemplateThemeDataDefaults(
          i: i ?? _i,
          d: d ?? _d,
          s: s ?? _s,
          c: c ?? _c,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TemplateThemeDataDefaults &&
          _i == other._i &&
          _d == other._d &&
          _s == other._s &&
          _c == other._c;

  @override
  int get hashCode => Object.hash(runtimeType, _i, _d, _s, _c);
}

// Copy paste what's below to add a widget to an already existing
// theme data.

typedef TemplateThemeResolver = ThemeResolver<TemplateThemeDataPartial>;

typedef TemplateThemeResolverCallback =
    ThemeResolverCallback<TemplateThemeDataPartial>;

abstract class TemplateTheme extends StatelessWidget implements ProxyWidget {
  const TemplateTheme._({super.key, required this.child});

  const factory TemplateTheme.resolver({
    Key? key,
    required TemplateThemeResolver resolver,
    required Widget child,
  }) = _TemplateThemeWithResolver;

  const factory TemplateTheme.callback({
    Key? key,
    required TemplateThemeResolverCallback callback,
    required Widget child,
  }) = _TemplateThemeWithCallback;

  const factory TemplateTheme.partial({
    Key? key,
    required TemplateThemeDataPartial data,
    required Widget child,
  }) = _TemplateThemeWithData<TemplateThemeDataPartial>;

  const factory TemplateTheme.concrete({
    Key? key,
    required TemplateThemeData data,
    required Widget child,
  }) = _TemplateThemeWithData<TemplateThemeData>;

  TemplateThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _TemplateTheme.maybeResolverOf(context);
    return _TemplateTheme(
      resolver: inherited != null
          ? .combine(inherited, resolver, _combine)
          : resolver,
      child: child,
    );
  }

  static TemplateThemeDataPartial _combine(
    TemplateThemeDataPartial a,
    TemplateThemeDataPartial b,
  ) => a.merge(b);

  static TemplateThemeData of(BuildContext context) {
    final resolver = _TemplateTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(i: data.i, d: data.d, s: data.s, c: data.c);
    }
    return const .defaults();
  }
}

class _TemplateThemeWithResolver extends TemplateTheme {
  const _TemplateThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final TemplateThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TemplateThemeResolver>("resolver", resolver),
    );
  }
}

class _TemplateThemeWithCallback extends TemplateTheme {
  const _TemplateThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final TemplateThemeResolverCallback callback;

  @override
  TemplateThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TemplateThemeResolverCallback>("callback", callback),
    );
  }
}

class _TemplateThemeWithData<T extends TemplateThemeDataPartial>
    extends TemplateTheme {
  const _TemplateThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final T data;

  @override
  TemplateThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

class _TemplateTheme extends InheritedTheme {
  const _TemplateTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final TemplateThemeResolver resolver;

  @override
  bool updateShouldNotify(_TemplateTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _TemplateTheme(resolver: resolver, child: child);

  static TemplateThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_TemplateTheme>()?.resolver;
}
