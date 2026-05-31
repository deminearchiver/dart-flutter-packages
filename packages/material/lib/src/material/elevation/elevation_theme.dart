import 'package:material/src/material/flutter.dart';

part 'elevation_theme_data_partial.dart';
part 'elevation_theme_data.dart';

abstract class ElevationTheme extends StatelessWidget implements ProxyWidget {
  const ElevationTheme._({super.key, required this.child});

  const factory ElevationTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<ElevationThemeDataPartial> resolver,
    required Widget child,
  }) = _ElevationThemeWithResolver<ElevationThemeDataPartial>;

  const factory ElevationTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<ElevationThemeDataPartial> callback,
    required Widget child,
  }) = _ElevationThemeWithCallback<ElevationThemeDataPartial>;

  const factory ElevationTheme.mergeWithData({
    Key? key,
    required ElevationThemeDataPartial data,
    required Widget child,
  }) = _ElevationThemeWithData<ElevationThemeDataPartial>;

  const factory ElevationTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<ElevationThemeData> resolver,
    required Widget child,
  }) = _ElevationThemeWithResolver<ElevationThemeData>;

  const factory ElevationTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<ElevationThemeData> callback,
    required Widget child,
  }) = _ElevationThemeWithCallback<ElevationThemeData>;

  const factory ElevationTheme.replaceWithData({
    Key? key,
    required ElevationThemeData data,
    required Widget child,
  }) = _ElevationThemeWithData<ElevationThemeData>;

  ThemeResolver<ElevationThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _ElevationTheme(resolver: resolver, child: child);

  static ElevationThemeData? maybeOf(BuildContext context) {
    final overrides = _ElevationTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static ElevationThemeData of(BuildContext context) =>
      .defaults(overrides: _ElevationTheme.maybeOverridesOf(context));
}

class _ElevationThemeWithResolver<T extends ElevationThemeDataPartial>
    extends ElevationTheme {
  const _ElevationThemeWithResolver({
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

class _ElevationThemeWithCallback<T extends ElevationThemeDataPartial>
    extends ElevationTheme {
  const _ElevationThemeWithCallback({
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

class _ElevationThemeWithData<T extends ElevationThemeDataPartial>
    extends ElevationTheme {
  const _ElevationThemeWithData({
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

final class _ElevationTheme
    extends
        InheritedThemeResolverWidget<
          ElevationThemeDataPartial,
          _ElevationTheme,
          _ElevationThemeElement
        >
    implements InheritedTheme {
  const _ElevationTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  ElevationThemeDataPartial merge(
    ElevationThemeDataPartial fallback,
    ElevationThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _ElevationThemeElement createElement() => _ElevationThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ElevationTheme(resolver: resolver, child: child);

  static ThemeResolver<ElevationThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        ElevationThemeDataPartial,
        _ElevationTheme,
        _ElevationThemeElement
      >(context);

  static ElevationThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        ElevationThemeDataPartial,
        _ElevationTheme,
        _ElevationThemeElement
      >(context);
}

final class _ElevationThemeElement
    extends
        InheritedThemeResolverElement<
          ElevationThemeDataPartial,
          _ElevationTheme,
          _ElevationThemeElement
        > {
  _ElevationThemeElement(super.widget);
}
