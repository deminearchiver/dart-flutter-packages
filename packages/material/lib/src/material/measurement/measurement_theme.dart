import 'package:material/src/material/flutter.dart';

part 'measurement_theme_data_partial.dart';
part 'measurement_theme_data.dart';

abstract class MeasurementTheme extends StatelessWidget implements ProxyWidget {
  const MeasurementTheme._({super.key, required this.child});

  const factory MeasurementTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<MeasurementThemeDataPartial> resolver,
    required Widget child,
  }) = _MeasurementThemeWithResolver<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<MeasurementThemeDataPartial> callback,
    required Widget child,
  }) = _MeasurementThemeWithCallback<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.mergeWithData({
    Key? key,
    required MeasurementThemeDataPartial data,
    required Widget child,
  }) = _MeasurementThemeWithData<MeasurementThemeDataPartial>;

  const factory MeasurementTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<MeasurementThemeData> resolver,
    required Widget child,
  }) = _MeasurementThemeWithResolver<MeasurementThemeData>;

  const factory MeasurementTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<MeasurementThemeData> callback,
    required Widget child,
  }) = _MeasurementThemeWithCallback<MeasurementThemeData>;

  const factory MeasurementTheme.replaceWithData({
    Key? key,
    required MeasurementThemeData data,
    required Widget child,
  }) = _MeasurementThemeWithData<MeasurementThemeData>;

  ThemeResolver<MeasurementThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _MeasurementTheme.maybeResolverOf(context);
    return _MeasurementTheme(
      resolver: inherited != null
          ? .combine(inherited, resolver, _merge)
          : resolver,
      child: child,
    );
  }

  static MeasurementThemeDataPartial _merge(
    MeasurementThemeDataPartial a,
    MeasurementThemeDataPartial b,
  ) => a.maybeMerge(b);

  static MeasurementThemeData of(BuildContext context) {
    final resolver = _MeasurementTheme.maybeResolverOf(context);
    return .defaults(overrides: resolver?.resolve(context));
  }
}

class _MeasurementThemeWithResolver<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithResolver({
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

class _MeasurementThemeWithCallback<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithCallback({
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

class _MeasurementThemeWithData<T extends MeasurementThemeDataPartial>
    extends MeasurementTheme {
  const _MeasurementThemeWithData({
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

class _MeasurementTheme extends InheritedTheme {
  const _MeasurementTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final ThemeResolver<MeasurementThemeDataPartial> resolver;

  @override
  bool updateShouldNotify(_MeasurementTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _MeasurementTheme(resolver: resolver, child: child);

  static ThemeResolver<MeasurementThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      context.dependOnInheritedWidgetOfExactType<_MeasurementTheme>()?.resolver;
}
