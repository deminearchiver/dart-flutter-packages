import 'package:material_example/flutter.dart';

// ////////////////////////////////////////////////////////////////
// Theme data models. //
// ////////////////////////////////////////////////////////////////
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

  TemplateThemeDataPartial copy() => copyWith();

  TemplateThemeDataPartial copyWith({int? i, double? d, String? s, Color? c}) =>
      .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c);

  TemplateThemeDataPartial maybeCopyWith({
    int? i,
    double? d,
    String? s,
    Color? c,
  }) => i != null && d != null && s != null && c != null
      ? TemplateThemeData.from(i: i, d: d, s: s, c: c)
      : i != null || d != null || s != null || c != null
      ? copyWith(i: i, d: d, s: s, c: c)
      : this;

  TemplateThemeDataPartial mergeWith({
    int? i,
    double? d,
    String? s,
    Color? c,
  }) => .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c);

  TemplateThemeDataPartial maybeMergeWith({
    int? i,
    double? d,
    String? s,
    Color? c,
  }) => i != null || d != null || s != null || c != null
      ? mergeWith(i: i, d: d, s: s, c: c)
      : this;

  TemplateThemeDataPartial merge(TemplateThemeDataPartial? other) =>
      other != null
      ? mergeWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : copy();

  TemplateThemeDataPartial maybeMerge(TemplateThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : this;

  bool get isEmpty => i == null && d == null && s == null && c == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete => i != null && d != null && s != null && c != null;

  TemplateThemeData? get asConcrete =>
      isConcrete ? _TemplateThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IntProperty("i", i, defaultValue: null))
      ..add(DoubleProperty("d", d, defaultValue: null))
      ..add(StringProperty("s", s, defaultValue: null))
      ..add(ColorProperty("c", c, defaultValue: null));
  }
}

final class _TemplateThemeDataPartial extends TemplateThemeDataPartial {
  const _TemplateThemeDataPartial({this.i, this.d, this.s, this.c});

  @override
  final int? i;

  @override
  final double? d;

  @override
  final String? s;

  @override
  final Color? c;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TemplateThemeDataPartial &&
          i == other.i &&
          d == other.d &&
          s == other.s &&
          c == other.c;

  @override
  int get hashCode => Object.hash(i, d, s, c);
}

final class _TemplateThemeDataPartialAsConcrete extends TemplateThemeData {
  _TemplateThemeDataPartialAsConcrete(TemplateThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final TemplateThemeDataPartial _value;

  @override
  int get i => _value.i!;

  @override
  double get d => _value.d!;

  @override
  String get s => _value.s!;

  @override
  Color get c => _value.c!;

  @override
  TemplateThemeData copyWith({int? i, double? d, String? s, Color? c}) =>
      _TemplateThemeDataPartialAsConcrete(
        _value.copyWith(i: i, d: d, s: s, c: c),
      );

  @override
  TemplateThemeData maybeCopyWith({int? i, double? d, String? s, Color? c}) =>
      i != null && d != null && s != null && c != null
      ? .from(i: i, d: d, s: s, c: c)
      : i != null || d != null || s != null || c != null
      ? copyWith(i: i, d: d, s: s, c: c)
      : this;

  @override
  TemplateThemeData mergeWith({int? i, double? d, String? s, Color? c}) =>
      _TemplateThemeDataPartialAsConcrete(
        _value.mergeWith(i: i, d: d, s: s, c: c),
      );

  @override
  TemplateThemeData maybeMergeWith({int? i, double? d, String? s, Color? c}) =>
      i != null || d != null || s != null || c != null
      ? mergeWith(i: i, d: d, s: s, c: c)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TemplateThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class TemplateThemeData extends TemplateThemeDataPartial {
  const TemplateThemeData();

  const factory TemplateThemeData.from({
    required int i,
    required double d,
    required String s,
    required Color c,
  }) = _TemplateThemeData;

  const factory TemplateThemeData.defaults({
    required ColorThemeData colorTheme,
    TemplateThemeDataPartial? overrides,
  }) = _TemplateThemeDataDefaults;

  factory TemplateThemeData.defaultsOf(
    BuildContext context, {
    TemplateThemeDataPartial? overrides,
  }) => .defaults(colorTheme: ColorTheme.of(context), overrides: overrides);

  @override
  int get i;

  @override
  double get d;

  @override
  String get s;

  @override
  Color get c;

  @override
  TemplateThemeData copy() => copyWith();

  @override
  TemplateThemeData copyWith({int? i, double? d, String? s, Color? c}) =>
      .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c);

  @override
  TemplateThemeData maybeCopyWith({int? i, double? d, String? s, Color? c}) =>
      i != null || d != null || s != null || c != null
      ? copyWith(i: i, d: d, s: s, c: c)
      : this;

  @override
  TemplateThemeData mergeWith({int? i, double? d, String? s, Color? c}) =>
      .from(i: i ?? this.i, d: d ?? this.d, s: s ?? this.s, c: c ?? this.c);

  @override
  TemplateThemeData merge(TemplateThemeDataPartial? other) => other != null
      ? mergeWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : copy();

  @override
  TemplateThemeData maybeMergeWith({int? i, double? d, String? s, Color? c}) =>
      i != null || d != null || s != null || c != null
      ? mergeWith(i: i, d: d, s: s, c: c)
      : this;

  @override
  TemplateThemeData maybeMerge(TemplateThemeDataPartial? other) => other != null
      ? maybeMergeWith(i: other.i, d: other.d, s: other.s, c: other.c)
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  TemplateThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IntProperty("i", i))
      ..add(DoubleProperty("d", d))
      ..add(StringProperty("s", s))
      ..add(ColorProperty("c", c));
  }
}

final class _TemplateThemeData extends TemplateThemeData {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TemplateThemeData &&
          i == other.i &&
          d == other.d &&
          s == other.s &&
          c == other.c;

  @override
  int get hashCode => Object.hash(i, d, s, c);
}

final class _TemplateThemeDataDefaults extends TemplateThemeData {
  const _TemplateThemeDataDefaults({
    required this._colorTheme,
    TemplateThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final TemplateThemeDataPartial _overrides;

  @override
  int get i => _overrides.i ?? 0;

  @override
  double get d => _overrides.d ?? 1.0;

  @override
  String get s => _overrides.s ?? "a";

  @override
  Color get c => _overrides.c ?? _colorTheme.error;

  @override
  TemplateThemeData copyWith({int? i, double? d, String? s, Color? c}) =>
      _TemplateThemeDataDefaults(
        colorTheme: _colorTheme,
        overrides: _overrides.copyWith(i: i, d: d, s: s, c: c),
      );

  @override
  TemplateThemeData maybeCopyWith({int? i, double? d, String? s, Color? c}) =>
      i != null && d != null && s != null && c != null
      ? .from(i: i, d: d, s: s, c: c)
      : i != null || d != null || s != null || c != null
      ? copyWith(i: i, d: d, s: s, c: c)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TemplateThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_colorTheme, _overrides);
}

// ////////////////////////////////////////////////////////////////
// Theme inherited widgets. //
// ////////////////////////////////////////////////////////////////

abstract class TemplateTheme extends StatelessWidget implements ProxyWidget {
  const TemplateTheme._({super.key, required this.child});

  const factory TemplateTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<TemplateThemeDataPartial> resolver,
    required Widget child,
  }) = _TemplateThemeWithResolver<TemplateThemeDataPartial>;

  const factory TemplateTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<TemplateThemeDataPartial> callback,
    required Widget child,
  }) = _TemplateThemeWithCallback<TemplateThemeDataPartial>;

  const factory TemplateTheme.mergeWithData({
    Key? key,
    required TemplateThemeDataPartial data,
    required Widget child,
  }) = _TemplateThemeWithData<TemplateThemeDataPartial>;

  const factory TemplateTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<TemplateThemeData> resolver,
    required Widget child,
  }) = _TemplateThemeWithResolver<TemplateThemeData>;

  const factory TemplateTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<TemplateThemeData> callback,
    required Widget child,
  }) = _TemplateThemeWithCallback<TemplateThemeData>;

  const factory TemplateTheme.replaceWithData({
    Key? key,
    required TemplateThemeData data,
    required Widget child,
  }) = _TemplateThemeWithData<TemplateThemeData>;

  ThemeResolver<TemplateThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _TemplateTheme(resolver: resolver, child: child);

  static TemplateThemeData? maybeOf(BuildContext context) {
    final overrides = _TemplateTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static TemplateThemeData of(BuildContext context) =>
      .defaultsOf(context, overrides: _TemplateTheme.maybeOverridesOf(context));
}

class _TemplateThemeWithResolver<T extends TemplateThemeDataPartial>
    extends TemplateTheme {
  const _TemplateThemeWithResolver({
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

class _TemplateThemeWithCallback<T extends TemplateThemeDataPartial>
    extends TemplateTheme {
  const _TemplateThemeWithCallback({
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

class _TemplateThemeWithData<T extends TemplateThemeDataPartial>
    extends TemplateTheme {
  const _TemplateThemeWithData({
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

final class _TemplateTheme
    extends
        InheritedThemeResolverWidget<
          TemplateThemeDataPartial,
          _TemplateTheme,
          _TemplateThemeElement
        >
    implements InheritedTheme {
  const _TemplateTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  TemplateThemeDataPartial merge(
    TemplateThemeDataPartial fallback,
    TemplateThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _TemplateThemeElement createElement() => _TemplateThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _TemplateTheme(resolver: resolver, child: child);

  static ThemeResolver<TemplateThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        TemplateThemeDataPartial,
        _TemplateTheme,
        _TemplateThemeElement
      >(context);

  static TemplateThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        TemplateThemeDataPartial,
        _TemplateTheme,
        _TemplateThemeElement
      >(context);
}

final class _TemplateThemeElement
    extends
        InheritedThemeResolverElement<
          TemplateThemeDataPartial,
          _TemplateTheme,
          _TemplateThemeElement
        > {
  _TemplateThemeElement(super.widget);
}
