part of 'typography.dart';

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

  TypefaceThemeDataPartial copy() => copyWith();

  TypefaceThemeDataPartial copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => .from(
    plain: plain ?? this.plain,
    brand: brand ?? this.brand,
    weightRegular: weightRegular ?? this.weightRegular,
    weightMedium: weightMedium ?? this.weightMedium,
    weightBold: weightBold ?? this.weightBold,
  );

  TypefaceThemeDataPartial maybeCopyWith({
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
      ? copyWith(
          plain: plain,
          brand: brand,
          weightRegular: weightRegular,
          weightMedium: weightMedium,
          weightBold: weightBold,
        )
      : this;

  TypefaceThemeDataPartial mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => .from(
    plain: _mergeFontsOrNull(this.plain, plain),
    brand: _mergeFontsOrNull(this.brand, brand),
    weightRegular: weightRegular ?? this.weightRegular,
    weightMedium: weightMedium ?? this.weightMedium,
    weightBold: weightBold ?? this.weightBold,
  );

  TypefaceThemeDataPartial maybeMergeWith({
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
      : copy();

  TypefaceThemeDataPartial maybeMerge(TypefaceThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          plain: other.plain,
          brand: other.brand,
          weightRegular: other.weightRegular,
          weightMedium: other.weightMedium,
          weightBold: other.weightBold,
        )
      : this;

  bool get isEmpty =>
      plain?.isEmpty != false &&
      brand?.isEmpty != false &&
      weightRegular == null &&
      weightMedium == null &&
      weightBold == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      plain?.isNotEmpty == true &&
      brand?.isNotEmpty == true &&
      weightRegular != null &&
      weightMedium != null &&
      weightBold != null;

  TypefaceThemeDataPartial? get asConcrete =>
      isConcrete ? _TypefaceThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty<String>("plain", plain, defaultValue: null))
      ..add(IterableProperty<String>("brand", brand, defaultValue: null))
      ..add(DoubleProperty("weightRegular", weightRegular, defaultValue: null))
      ..add(DoubleProperty("weightMedium", weightMedium, defaultValue: null))
      ..add(DoubleProperty("weightBold", weightBold, defaultValue: null));
  }
}

final class _TypefaceThemeDataPartial extends TypefaceThemeDataPartial {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TypefaceThemeDataPartial &&
          plain == other.plain &&
          brand == other.brand &&
          weightRegular == other.weightRegular &&
          weightMedium == other.weightMedium &&
          weightBold == other.weightBold;

  @override
  int get hashCode =>
      Object.hash(plain, brand, weightRegular, weightMedium, weightBold);
}

final class _TypefaceThemeDataPartialAsConcrete extends TypefaceThemeData {
  _TypefaceThemeDataPartialAsConcrete(TypefaceThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final TypefaceThemeDataPartial _value;

  @override
  List<String> get plain => _value.plain!;

  @override
  List<String> get brand => _value.brand!;

  @override
  double get weightRegular => _value.weightRegular!;

  @override
  double get weightMedium => _value.weightMedium!;

  @override
  double get weightBold => _value.weightBold!;

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => _TypefaceThemeDataPartialAsConcrete(
    _value.copyWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    ),
  );

  @override
  TypefaceThemeData maybeCopyWith({
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
      : plain != null ||
            brand != null ||
            weightRegular != null ||
            weightMedium != null ||
            weightBold != null
      ? copyWith(
          plain: plain,
          brand: brand,
          weightRegular: weightRegular,
          weightMedium: weightMedium,
          weightBold: weightBold,
        )
      : this;

  @override
  TypefaceThemeData mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => _TypefaceThemeDataPartialAsConcrete(
    _value.mergeWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    ),
  );

  @override
  TypefaceThemeData maybeMergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) {
    final value = _value.maybeMergeWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    );
    return identical(_value, value)
        ? this
        : _TypefaceThemeDataPartialAsConcrete(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TypefaceThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
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

  const factory TypefaceThemeData.defaults({
    TypefaceThemeDataPartial? overrides,
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
  TypefaceThemeData copy() => copyWith();

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => .from(
    plain: plain ?? this.plain,
    brand: brand ?? this.brand,
    weightRegular: weightRegular ?? this.weightRegular,
    weightMedium: weightMedium ?? this.weightMedium,
    weightBold: weightBold ?? this.weightBold,
  );

  @override
  TypefaceThemeData maybeCopyWith({
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
      ? copyWith(
          plain: plain,
          brand: brand,
          weightRegular: weightRegular,
          weightMedium: weightMedium,
          weightBold: weightBold,
        )
      : this;

  @override
  TypefaceThemeData mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => .from(
    plain: _mergeFonts(this.plain, plain),
    brand: _mergeFonts(this.brand, brand),
    weightRegular: weightRegular ?? this.weightRegular,
    weightMedium: weightMedium ?? this.weightMedium,
    weightBold: weightBold ?? this.weightBold,
  );

  @override
  TypefaceThemeData maybeMergeWith({
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
      : copy();

  @override
  TypefaceThemeData maybeMerge(TypefaceThemeDataPartial? other) => other != null
      ? maybeMergeWith(
          plain: other.plain,
          brand: other.brand,
          weightRegular: other.weightRegular,
          weightMedium: other.weightMedium,
          weightBold: other.weightBold,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  TypefaceThemeDataPartial get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty<String>("plain", plain))
      ..add(IterableProperty<String>("brand", brand))
      ..add(DoubleProperty("weightRegular", weightRegular))
      ..add(DoubleProperty("weightMedium", weightMedium))
      ..add(DoubleProperty("weightBold", weightBold));
  }
}

final class _TypefaceThemeData extends TypefaceThemeData {
  const _TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weightRegular,
    required this.weightMedium,
    required this.weightBold,
  }) : assert(plain.length > 0, "TypefaceThemeData.plain must not be empty."),
       assert(brand.length > 0, "TypefaceThemeData.brand must not be empty.");

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TypefaceThemeData &&
          plain == other.plain &&
          brand == other.brand &&
          weightRegular == other.weightRegular &&
          weightMedium == other.weightMedium &&
          weightBold == other.weightBold;

  @override
  int get hashCode =>
      Object.hash(plain, brand, weightRegular, weightMedium, weightBold);
}

final class _TypefaceThemeDataDefaults extends TypefaceThemeData {
  const _TypefaceThemeDataDefaults({TypefaceThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final TypefaceThemeDataPartial _overrides;

  @override
  List<String> get plain => _mergeFonts(const ["Roboto"], _overrides.plain);

  @override
  List<String> get brand => _mergeFonts(const ["Roboto"], _overrides.brand);

  @override
  double get weightRegular => _overrides.weightRegular ?? 400.0;

  @override
  double get weightMedium => _overrides.weightMedium ?? 500.0;

  @override
  double get weightBold => _overrides.weightBold ?? 700.0;

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => _TypefaceThemeDataDefaults(
    overrides: _overrides.copyWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    ),
  );

  @override
  TypefaceThemeData maybeCopyWith({
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
      : plain != null ||
            brand != null ||
            weightRegular != null ||
            weightMedium != null ||
            weightBold != null
      ? copyWith(
          plain: plain,
          brand: brand,
          weightRegular: weightRegular,
          weightMedium: weightMedium,
          weightBold: weightBold,
        )
      : this;

  @override
  TypefaceThemeData mergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) => _TypefaceThemeDataDefaults(
    overrides: _overrides.mergeWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    ),
  );

  @override
  TypefaceThemeData maybeMergeWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) {
    final overrides = _overrides.maybeMergeWith(
      plain: plain,
      brand: brand,
      weightRegular: weightRegular,
      weightMedium: weightMedium,
      weightBold: weightBold,
    );
    return identical(_overrides, overrides)
        ? this
        : _TypefaceThemeDataDefaults(overrides: overrides);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TypefaceThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

abstract class TypefaceTheme extends StatelessWidget implements ProxyWidget {
  const TypefaceTheme._({super.key, required this.child});

  const factory TypefaceTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<TypefaceThemeDataPartial> resolver,
    required Widget child,
  }) = _TypefaceThemeWithResolver<TypefaceThemeDataPartial>;

  const factory TypefaceTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<TypefaceThemeDataPartial> callback,
    required Widget child,
  }) = _TypefaceThemeWithCallback<TypefaceThemeDataPartial>;

  const factory TypefaceTheme.mergeWithData({
    Key? key,
    required TypefaceThemeDataPartial data,
    required Widget child,
  }) = _TypefaceThemeWithData<TypefaceThemeDataPartial>;

  const factory TypefaceTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<TypefaceThemeData> resolver,
    required Widget child,
  }) = _TypefaceThemeWithResolver<TypefaceThemeData>;

  const factory TypefaceTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<TypefaceThemeData> callback,
    required Widget child,
  }) = _TypefaceThemeWithCallback<TypefaceThemeData>;

  const factory TypefaceTheme.replaceWithData({
    Key? key,
    required TypefaceThemeData data,
    required Widget child,
  }) = _TypefaceThemeWithData<TypefaceThemeData>;

  ThemeResolver<TypefaceThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _TypefaceTheme(resolver: resolver, child: child);

  static TypefaceThemeData? maybeOf(BuildContext context) {
    final overrides = _TypefaceTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static TypefaceThemeData of(BuildContext context) =>
      .defaults(overrides: _TypefaceTheme.maybeOverridesOf(context));
}

class _TypefaceThemeWithResolver<T extends TypefaceThemeDataPartial>
    extends TypefaceTheme {
  const _TypefaceThemeWithResolver({
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

class _TypefaceThemeWithCallback<T extends TypefaceThemeDataPartial>
    extends TypefaceTheme {
  const _TypefaceThemeWithCallback({
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

class _TypefaceThemeWithData<T extends TypefaceThemeDataPartial>
    extends TypefaceTheme {
  const _TypefaceThemeWithData({
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

final class _TypefaceTheme
    extends
        InheritedThemeResolverWidget<
          TypefaceThemeDataPartial,
          _TypefaceTheme,
          _TypefaceThemeElement
        >
    implements InheritedTheme {
  const _TypefaceTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  TypefaceThemeDataPartial merge(
    TypefaceThemeDataPartial fallback,
    TypefaceThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(TypefaceThemeDataPartial data) => data.isConcrete;

  @override
  _TypefaceThemeElement createElement() => _TypefaceThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _TypefaceTheme(resolver: resolver, child: child);

  static ThemeResolver<TypefaceThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        TypefaceThemeDataPartial,
        _TypefaceTheme,
        _TypefaceThemeElement
      >(context);

  static TypefaceThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        TypefaceThemeDataPartial,
        _TypefaceTheme,
        _TypefaceThemeElement
      >(context);
}

final class _TypefaceThemeElement
    extends
        InheritedThemeResolverElement<
          TypefaceThemeDataPartial,
          _TypefaceTheme,
          _TypefaceThemeElement
        > {
  _TypefaceThemeElement(super.widget);
}
