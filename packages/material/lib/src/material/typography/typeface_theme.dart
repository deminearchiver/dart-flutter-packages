import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

const _stringListEquality = ListEquality<String>();

List<String> _mergeFontsInternal(List<String> fallback, List<String> other) {
  // final fallbackSize = fallback.length;
  // final otherSize = other.length;
  // final maxSize = fallbackSize + otherSize;
  // final seen = HashSet<String>();
  // final result = List<String>.filled(maxSize, "");
  // var resultSize = 0;
  // for (var i = 0; i < otherSize; i++) {
  //   final value = other[i];
  //   if (seen.add(value)) result[resultSize++] = value;
  // }
  // for (var i = 0; i < fallbackSize; i++) {
  //   final value = fallback[i];
  //   if (seen.add(value)) result[resultSize++] = value;
  // }
  // return resultSize == maxSize ? result : result.sublist(0, resultSize);
  final result = <String>{};
  for (final value in other) {
    if (value.isNotEmpty) result.add(value);
  }
  for (final value in fallback) {
    if (value.isNotEmpty) result.add(value);
  }
  return result.toList(growable: false);
}

List<String>? _mergeFontsOrNull(List<String>? fallback, List<String>? other) {
  if (identical(fallback, other)) return fallback;
  if (fallback == null || fallback.isEmpty) return other;
  if (other == null || other.isEmpty) return fallback;
  if (_stringListEquality.equals(fallback, other)) return fallback;
  return _mergeFontsInternal(fallback, other);
}

List<String> _mergeFonts(List<String> fallback, List<String>? other) {
  if (identical(fallback, other)) return fallback;
  if (other == null || other.isEmpty) return fallback;
  if (_stringListEquality.equals(fallback, other)) return fallback;
  return _mergeFontsInternal(fallback, other);
}

abstract class TypefaceThemeDataPartial with Diagnosticable {
  const TypefaceThemeDataPartial();

  const factory TypefaceThemeDataPartial.from({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) = _TypefaceThemeDataPartial;

  /// `md.ref.typeface.plain`
  List<String>? get plain;

  /// `md.ref.typeface.brand`
  List<String>? get brand;

  /// `md.ref.typeface.weight-regular`
  double? get weightRegular;

  /// `md.ref.typeface.weight-medium`
  double? get weightMedium;

  /// `md.ref.typeface.weight-bold`
  double? get weightBold;

  TypefaceThemeDataPartial copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) =>
      plain != null ||
          brand == null ||
          weightRegular == null ||
          weightMedium == null ||
          weightBold == null
      ? .from(
          plain: plain ?? this.plain,
          brand: brand ?? this.brand,
          weightRegular: weightRegular ?? this.weightRegular,
          weightMedium: weightMedium ?? this.weightMedium,
          weightBold: weightBold ?? this.weightBold,
        )
      : this;

  TypefaceThemeDataPartial mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) =>
      plain != null ||
          brand != null ||
          weightRegular != null ||
          weightMedium != null ||
          weightBold != null
      ? .from(
          plain: _mergeFontsOrNull(this.plain, plain),
          brand: _mergeFontsOrNull(this.brand, brand),
          weightRegular: weightRegular ?? this.weightRegular,
          weightMedium: weightMedium ?? this.weightMedium,
          weightBold: weightBold ?? this.weightBold,
        )
      : this;

  TypefaceThemeDataPartial merge(TypefaceThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          plain: other.plain,
          brand: other.brand,
          weightRegular: other.weightRegular,
          weightMedium: other.weightMedium,
          weightBold: other.weightBold,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty("plain", plain, defaultValue: null))
      ..add(IterableProperty("brand", brand, defaultValue: null))
      ..add(DoubleProperty("weightRegular", weightRegular, defaultValue: null))
      ..add(DoubleProperty("weightMedium", weightMedium, defaultValue: null))
      ..add(DoubleProperty("weightBold", weightBold, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TypefaceThemeDataPartial &&
          _stringListEquality.equals(plain, other.plain) &&
          _stringListEquality.equals(brand, other.brand) &&
          weightRegular == other.weightRegular &&
          weightMedium == other.weightMedium &&
          weightBold == other.weightBold;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _stringListEquality.hash(plain),
    _stringListEquality.hash(brand),
    weightRegular,
    weightMedium,
    weightBold,
  );
}

class _TypefaceThemeDataPartial extends TypefaceThemeDataPartial {
  const _TypefaceThemeDataPartial({
    this.plain,
    this.brand,
    this.weightRegular,
    this.weightMedium,
    this.weightBold,
  });

  @override
  final List<String>? plain;

  @override
  final List<String>? brand;

  @override
  final double? weightRegular;

  @override
  final double? weightMedium;

  @override
  final double? weightBold;
}

abstract class TypefaceThemeData extends TypefaceThemeDataPartial {
  const TypefaceThemeData();

  const factory TypefaceThemeData.from({
    required List<String> plain,
    required List<String> brand,
    required double weightRegular,
    required double weightMedium,
    required double weightBold,
  }) = _TypefaceThemeData;

  const factory TypefaceThemeData.defaults() = _TypefaceThemeDataDefaults;

  const factory TypefaceThemeData._defaults({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) = _TypefaceThemeDataDefaults;

  @override
  List<String> get plain;

  @override
  List<String> get brand;

  @override
  double get weightRegular;

  @override
  double get weightMedium;

  @override
  double get weightBold;

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) =>
      plain != null ||
          brand != null ||
          weightRegular != null ||
          weightMedium != null ||
          weightBold != null
      ? .from(
          plain: plain ?? this.plain,
          brand: brand ?? this.brand,
          weightRegular: weightRegular ?? this.weightRegular,
          weightMedium: weightMedium ?? this.weightMedium,
          weightBold: weightBold ?? this.weightBold,
        )
      : this;

  @override
  TypefaceThemeData mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) =>
      plain != null ||
          brand != null ||
          weightRegular != null ||
          weightMedium != null ||
          weightBold != null
      ? .from(
          plain: _mergeFonts(this.plain, plain),
          brand: _mergeFonts(this.brand, brand),
          weightRegular: weightRegular ?? this.weightRegular,
          weightMedium: weightMedium ?? this.weightMedium,
          weightBold: weightBold ?? this.weightBold,
        )
      : this;

  @override
  TypefaceThemeData merge(TypefaceThemeDataPartial? other) => other != null
      ? mergeWith(
          plain: other.plain,
          brand: other.brand,
          weightRegular: other.weightRegular,
          weightMedium: other.weightMedium,
          weightBold: other.weightBold,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty("plain", plain))
      ..add(IterableProperty("brand", brand))
      ..add(DoubleProperty("weightRegular", weightRegular))
      ..add(DoubleProperty("weightMedium", weightMedium))
      ..add(DoubleProperty("weightBold", weightBold));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TypefaceThemeData &&
          _stringListEquality.equals(plain, other.plain) &&
          _stringListEquality.equals(brand, other.brand) &&
          weightRegular == other.weightRegular &&
          weightMedium == other.weightMedium &&
          weightBold == other.weightBold;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _stringListEquality.hash(plain),
    _stringListEquality.hash(brand),
    weightRegular,
    weightMedium,
    weightBold,
  );
}

class _TypefaceThemeData extends TypefaceThemeData {
  const _TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weightRegular,
    required this.weightMedium,
    required this.weightBold,
  });

  @override
  final List<String> plain;

  @override
  final List<String> brand;

  @override
  final double weightRegular;

  @override
  final double weightMedium;

  @override
  final double weightBold;
}

class _TypefaceThemeDataDefaults extends TypefaceThemeData {
  const _TypefaceThemeDataDefaults({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) : _plain = plain,
       _brand = brand,
       _weightRegular = weightRegular,
       _weightMedium = weightMedium,
       _weightBold = weightBold;

  final List<String>? _plain;
  final List<String>? _brand;
  final double? _weightRegular;
  final double? _weightMedium;
  final double? _weightBold;

  @override
  List<String> get plain => _mergeFonts(const ["Roboto"], _plain);

  @override
  List<String> get brand => _mergeFonts(const ["Roboto"], _brand);

  @override
  double get weightRegular => _weightRegular ?? 400.0;

  @override
  double get weightMedium => _weightMedium ?? 500.0;

  @override
  double get weightBold => _weightBold ?? 700.0;

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) =>
      plain != null &&
          brand != null &&
          weightRegular != null &&
          weightMedium != null &&
          weightBold != null
      ? .from(
          plain: plain,
          brand: brand,
          weightRegular: weightRegular,
          weightMedium: weightMedium,
          weightBold: weightBold,
        )
      : _TypefaceThemeDataDefaults(
          plain: plain ?? _plain,
          brand: brand ?? _brand,
          weightRegular: weightRegular ?? _weightRegular,
          weightMedium: weightMedium ?? _weightMedium,
          weightBold: weightBold ?? _weightBold,
        );

  @override
  TypefaceThemeData mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => _TypefaceThemeDataDefaults(
    plain: _mergeFontsOrNull(_plain, plain),
    brand: _mergeFontsOrNull(_brand, brand),
    weightRegular: weightRegular ?? _weightRegular,
    weightMedium: weightMedium ?? _weightMedium,
    weightBold: weightBold ?? _weightBold,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TypefaceThemeDataDefaults &&
          _stringListEquality.equals(_plain, other._plain) &&
          _stringListEquality.equals(_brand, other._brand) &&
          _weightRegular == other._weightRegular &&
          _weightMedium == other._weightMedium &&
          _weightBold == other._weightBold;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _stringListEquality.hash(_plain),
    _stringListEquality.hash(_brand),
    _weightRegular,
    _weightMedium,
    _weightBold,
  );
}

typedef TypefaceThemeResolver = ThemeResolver<TypefaceThemeDataPartial>;

typedef TypefaceThemeResolverCallback =
    ThemeResolverCallback<TypefaceThemeDataPartial>;

class _TypefaceThemeResolver
    extends CombiningThemeResolver<TypefaceThemeDataPartial> {
  const _TypefaceThemeResolver(super.a, super.b);

  @override
  TypefaceThemeDataPartial combine(
    TypefaceThemeDataPartial a,
    TypefaceThemeDataPartial b,
  ) => a.merge(b);
}

abstract class TypefaceTheme extends StatelessWidget implements ProxyWidget {
  const TypefaceTheme._({super.key, required this.child});

  const factory TypefaceTheme.withResolver({
    Key? key,
    required TypefaceThemeResolver resolver,
    required Widget child,
  }) = _TypefaceThemeWithResolver;

  const factory TypefaceTheme.withCallback({
    Key? key,
    required TypefaceThemeResolverCallback callback,
    required Widget child,
  }) = _TypefaceThemeWithCallback;

  const factory TypefaceTheme.withData({
    Key? key,
    required TypefaceThemeDataPartial data,
    required Widget child,
  }) = _TypefaceThemeWithData;

  TypefaceThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _TypefaceTheme.maybeResolverOf(context);
    return _TypefaceTheme(
      resolver: inherited != null
          ? _TypefaceThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static TypefaceThemeData of(BuildContext context) {
    final resolver = _TypefaceTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        plain: data.plain,
        brand: data.brand,
        weightRegular: data.weightRegular,
        weightMedium: data.weightMedium,
        weightBold: data.weightBold,
      );
    }
    return const .defaults();
  }
}

class _TypefaceThemeWithResolver extends TypefaceTheme {
  const _TypefaceThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final TypefaceThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TypefaceThemeResolver>("resolver", resolver),
    );
  }
}

class _TypefaceThemeWithCallback extends TypefaceTheme {
  const _TypefaceThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final TypefaceThemeResolverCallback callback;

  @override
  TypefaceThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TypefaceThemeResolverCallback>("callback", callback),
    );
  }
}

class _TypefaceThemeWithData extends TypefaceTheme {
  const _TypefaceThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final TypefaceThemeDataPartial data;

  @override
  TypefaceThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypefaceThemeDataPartial>("data", data));
  }
}

class _TypefaceTheme extends InheritedTheme {
  const _TypefaceTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final TypefaceThemeResolver resolver;

  @override
  bool updateShouldNotify(_TypefaceTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _TypefaceTheme(resolver: resolver, child: child);

  static TypefaceThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_TypefaceTheme>()?.resolver;
}
