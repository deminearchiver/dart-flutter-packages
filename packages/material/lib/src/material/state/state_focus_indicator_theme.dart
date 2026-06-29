import 'package:material/src/material/flutter.dart';

abstract class StateFocusIndicatorThemeDataPartial with Diagnosticable {
  const StateFocusIndicatorThemeDataPartial();

  const factory StateFocusIndicatorThemeDataPartial.from({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) = _StateFocusIndicatorThemeDataPartial;

  double? get innerOffset;

  double? get outerOffset;

  double? get thickness;

  StateFocusIndicatorThemeDataPartial copy() => copyWith();

  StateFocusIndicatorThemeDataPartial copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => .from(
    innerOffset: innerOffset ?? this.innerOffset,
    outerOffset: outerOffset ?? this.outerOffset,
    thickness: thickness ?? this.thickness,
  );

  StateFocusIndicatorThemeDataPartial maybeCopyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null || outerOffset != null || thickness != null
      ? copyWith(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : this;

  StateFocusIndicatorThemeDataPartial merge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? copyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : copy();

  StateFocusIndicatorThemeDataPartial maybeMerge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeCopyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : this;

  bool get isEmpty =>
      innerOffset == null && outerOffset == null && thickness == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      innerOffset != null && outerOffset != null && thickness != null;

  StateFocusIndicatorThemeData? get asConcrete =>
      isConcrete ? _StateFocusIndicatorThemeDataPartialAsConcrete(this) : null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("innerOffset", innerOffset, defaultValue: null))
      ..add(DoubleProperty("outerOffset", outerOffset, defaultValue: null))
      ..add(DoubleProperty("thickness", thickness, defaultValue: null));
  }
}

final class _StateFocusIndicatorThemeDataPartial
    extends StateFocusIndicatorThemeDataPartial {
  const _StateFocusIndicatorThemeDataPartial({
    this.innerOffset,
    this.outerOffset,
    this.thickness,
  });

  @override
  final double? innerOffset;

  @override
  final double? outerOffset;

  @override
  final double? thickness;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateFocusIndicatorThemeDataPartial &&
          innerOffset == other.innerOffset &&
          outerOffset == other.outerOffset &&
          thickness == other.thickness;

  @override
  int get hashCode => Object.hash(innerOffset, outerOffset, thickness);
}

final class _StateFocusIndicatorThemeDataPartialAsConcrete
    extends StateFocusIndicatorThemeData {
  _StateFocusIndicatorThemeDataPartialAsConcrete(
    StateFocusIndicatorThemeDataPartial value,
  ) : assert(value.isConcrete),
      _value = value;

  final StateFocusIndicatorThemeDataPartial _value;

  @override
  double get innerOffset => _value.innerOffset!;

  @override
  double get outerOffset => _value.outerOffset!;

  @override
  double get thickness => _value.thickness!;

  @override
  StateFocusIndicatorThemeData copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => _StateFocusIndicatorThemeDataPartialAsConcrete(
    _value.copyWith(
      innerOffset: innerOffset,
      outerOffset: outerOffset,
      thickness: thickness,
    ),
  );

  @override
  StateFocusIndicatorThemeData maybeCopyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null && outerOffset != null && thickness != null
      ? .from(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : innerOffset != null || outerOffset != null || thickness != null
      ? copyWith(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateFocusIndicatorThemeDataPartialAsConcrete &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class StateFocusIndicatorThemeData
    extends StateFocusIndicatorThemeDataPartial {
  const StateFocusIndicatorThemeData();

  const factory StateFocusIndicatorThemeData.from({
    required double innerOffset,
    required double outerOffset,
    required double thickness,
  }) = _StateFocusIndicatorThemeData;

  const factory StateFocusIndicatorThemeData.defaults({
    StateFocusIndicatorThemeDataPartial? overrides,
  }) = _StateFocusIndicatorThemeDataDefaults;

  @override
  double get innerOffset;

  @override
  double get outerOffset;

  @override
  double get thickness;

  @override
  StateFocusIndicatorThemeData copy() => copyWith();

  @override
  StateFocusIndicatorThemeData copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => .from(
    innerOffset: innerOffset ?? this.innerOffset,
    outerOffset: outerOffset ?? this.outerOffset,
    thickness: thickness ?? this.thickness,
  );

  @override
  StateFocusIndicatorThemeData maybeCopyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null || outerOffset != null || thickness != null
      ? copyWith(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : this;

  @override
  StateFocusIndicatorThemeData merge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? copyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : copy();

  @override
  StateFocusIndicatorThemeData maybeMerge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeCopyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  StateFocusIndicatorThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("innerOffset", innerOffset))
      ..add(DoubleProperty("outerOffset", outerOffset))
      ..add(DoubleProperty("thickness", thickness));
  }
}

final class _StateFocusIndicatorThemeData extends StateFocusIndicatorThemeData {
  const _StateFocusIndicatorThemeData({
    required this.innerOffset,
    required this.outerOffset,
    required this.thickness,
  });

  @override
  final double innerOffset;

  @override
  final double outerOffset;

  @override
  final double thickness;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateFocusIndicatorThemeData &&
          innerOffset == other.innerOffset &&
          outerOffset == other.outerOffset &&
          thickness == other.thickness;

  @override
  int get hashCode => Object.hash(innerOffset, outerOffset, thickness);
}

final class _StateFocusIndicatorThemeDataDefaults
    extends StateFocusIndicatorThemeData {
  const _StateFocusIndicatorThemeDataDefaults({
    StateFocusIndicatorThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final StateFocusIndicatorThemeDataPartial _overrides;

  @override
  double get innerOffset => _overrides.innerOffset ?? -3.0;

  @override
  double get outerOffset => _overrides.outerOffset ?? 2.0;

  @override
  double get thickness => _overrides.thickness ?? 3.0;

  @override
  StateFocusIndicatorThemeData copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => _StateFocusIndicatorThemeDataDefaults(
    overrides: _overrides.copyWith(
      innerOffset: innerOffset,
      outerOffset: outerOffset,
      thickness: thickness,
    ),
  );

  @override
  StateFocusIndicatorThemeData maybeCopyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null && outerOffset != null && thickness != null
      ? .from(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : innerOffset != null || outerOffset != null || thickness != null
      ? copyWith(
          innerOffset: innerOffset,
          outerOffset: outerOffset,
          thickness: thickness,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StateFocusIndicatorThemeDataDefaults &&
          _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

abstract class StateFocusIndicatorTheme extends StatelessWidget
    implements ProxyWidget {
  const StateFocusIndicatorTheme._({super.key, required this.child});

  const factory StateFocusIndicatorTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<StateFocusIndicatorThemeDataPartial> resolver,
    required Widget child,
  }) =
      _StateFocusIndicatorThemeWithResolver<
        StateFocusIndicatorThemeDataPartial
      >;

  const factory StateFocusIndicatorTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<StateFocusIndicatorThemeDataPartial>
    callback,
    required Widget child,
  }) =
      _StateFocusIndicatorThemeWithCallback<
        StateFocusIndicatorThemeDataPartial
      >;

  const factory StateFocusIndicatorTheme.mergeWithData({
    Key? key,
    required StateFocusIndicatorThemeDataPartial data,
    required Widget child,
  }) = _StateFocusIndicatorThemeWithData<StateFocusIndicatorThemeDataPartial>;

  const factory StateFocusIndicatorTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<StateFocusIndicatorThemeData> resolver,
    required Widget child,
  }) = _StateFocusIndicatorThemeWithResolver<StateFocusIndicatorThemeData>;

  const factory StateFocusIndicatorTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<StateFocusIndicatorThemeData> callback,
    required Widget child,
  }) = _StateFocusIndicatorThemeWithCallback<StateFocusIndicatorThemeData>;

  const factory StateFocusIndicatorTheme.replaceWithData({
    Key? key,
    required StateFocusIndicatorThemeData data,
    required Widget child,
  }) = _StateFocusIndicatorThemeWithData<StateFocusIndicatorThemeData>;

  ThemeResolver<StateFocusIndicatorThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _StateFocusIndicatorTheme(resolver: resolver, child: child);

  static StateFocusIndicatorThemeData? maybeOf(BuildContext context) {
    final overrides = _StateFocusIndicatorTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static StateFocusIndicatorThemeData of(BuildContext context) =>
      .defaults(overrides: _StateFocusIndicatorTheme.maybeOverridesOf(context));
}

class _StateFocusIndicatorThemeWithResolver<
  T extends StateFocusIndicatorThemeDataPartial
>
    extends StateFocusIndicatorTheme {
  const _StateFocusIndicatorThemeWithResolver({
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

class _StateFocusIndicatorThemeWithCallback<
  T extends StateFocusIndicatorThemeDataPartial
>
    extends StateFocusIndicatorTheme {
  const _StateFocusIndicatorThemeWithCallback({
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

class _StateFocusIndicatorThemeWithData<
  T extends StateFocusIndicatorThemeDataPartial
>
    extends StateFocusIndicatorTheme {
  const _StateFocusIndicatorThemeWithData({
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

final class _StateFocusIndicatorTheme
    extends
        InheritedThemeResolverWidget<
          StateFocusIndicatorThemeDataPartial,
          _StateFocusIndicatorTheme,
          _StateFocusIndicatorThemeElement
        >
    implements InheritedTheme {
  const _StateFocusIndicatorTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  StateFocusIndicatorThemeDataPartial merge(
    StateFocusIndicatorThemeDataPartial fallback,
    StateFocusIndicatorThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(StateFocusIndicatorThemeDataPartial data) =>
      data is StateFocusIndicatorThemeData;

  @override
  _StateFocusIndicatorThemeElement createElement() =>
      _StateFocusIndicatorThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _StateFocusIndicatorTheme(resolver: resolver, child: child);

  static ThemeResolver<StateFocusIndicatorThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        StateFocusIndicatorThemeDataPartial,
        _StateFocusIndicatorTheme,
        _StateFocusIndicatorThemeElement
      >(context);

  static StateFocusIndicatorThemeDataPartial? maybeOverridesOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        StateFocusIndicatorThemeDataPartial,
        _StateFocusIndicatorTheme,
        _StateFocusIndicatorThemeElement
      >(context);
}

final class _StateFocusIndicatorThemeElement
    extends
        InheritedThemeResolverElement<
          StateFocusIndicatorThemeDataPartial,
          _StateFocusIndicatorTheme,
          _StateFocusIndicatorThemeElement
        > {
  _StateFocusIndicatorThemeElement(super.widget);
}
