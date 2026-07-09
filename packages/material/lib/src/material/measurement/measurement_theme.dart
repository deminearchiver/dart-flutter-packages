import 'package:material/src/material/flutter.dart';

part 'measurement_theme_data_partial.dart';
part 'measurement_theme_data.dart';

abstract class MeasurementTheme extends SingleChildStatelessWidget {
  const MeasurementTheme._({super.key, super.child});

  const factory MeasurementTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<MeasurementThemeDataPartial> resolver,
    Widget? child,
  }) = _MeasurementThemeWithResolver<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<MeasurementThemeDataPartial> callback,
    Widget? child,
  }) = _MeasurementThemeWithCallback<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.mergeWithData({
    Key? key,
    required MeasurementThemeDataPartial data,
    Widget? child,
  }) = _MeasurementThemeWithData<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<MeasurementThemeData> resolver,
    Widget? child,
  }) = _MeasurementThemeWithResolver<MeasurementThemeData>;

  const factory MeasurementTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<MeasurementThemeData> callback,
    Widget? child,
  }) = _MeasurementThemeWithCallback<MeasurementThemeData>;

  const factory MeasurementTheme.replaceWithData({
    Key? key,
    required MeasurementThemeData data,
    Widget? child,
  }) = _MeasurementThemeWithData<MeasurementThemeData>;

  ThemeResolver<MeasurementThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _MeasurementTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static MeasurementThemeData? maybeOf(BuildContext context) {
    final overrides = _MeasurementTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static MeasurementThemeData of(BuildContext context) =>
      .defaults(overrides: _MeasurementTheme.maybeOverridesOf(context));
}

class _MeasurementThemeWithResolver<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithResolver({
    super.key,
    required this.resolver,
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _MeasurementThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _MeasurementThemeWithCallback<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithCallback({
    super.key,
    required this.callback,
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _MeasurementThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _MeasurementThemeWithData<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _MeasurementThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _MeasurementTheme
    extends
        InheritedThemeResolverWidget<
          MeasurementThemeDataPartial,
          _MeasurementTheme,
          _MeasurementThemeElement
        >
    implements InheritedTheme {
  const _MeasurementTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  MeasurementThemeDataPartial merge(
    MeasurementThemeDataPartial fallback,
    MeasurementThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(MeasurementThemeDataPartial data) => data.isConcrete;

  @override
  _MeasurementThemeElement createElement() => _MeasurementThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _MeasurementTheme(resolver: resolver, child: child);

  static ThemeResolver<MeasurementThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        MeasurementThemeDataPartial,
        _MeasurementTheme,
        _MeasurementThemeElement
      >(context);

  static MeasurementThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        MeasurementThemeDataPartial,
        _MeasurementTheme,
        _MeasurementThemeElement
      >(context);
}

final class _MeasurementThemeElement
    extends
        InheritedThemeResolverElement<
          MeasurementThemeDataPartial,
          _MeasurementTheme,
          _MeasurementThemeElement
        > {
  _MeasurementThemeElement(super.widget);
}
