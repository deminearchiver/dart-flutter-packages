import 'package:material/src/material/flutter.dart';

part 'space_theme_data_partial.dart';
part 'space_theme_data.dart';

abstract class SpaceTheme extends StatelessWidget implements ProxyWidget {
  const SpaceTheme._({super.key, required this.child});

  const factory SpaceTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<SpaceThemeDataPartial> resolver,
    required Widget child,
  }) = _SpaceThemeWithResolver<SpaceThemeDataPartial>;

  const factory SpaceTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<SpaceThemeDataPartial> callback,
    required Widget child,
  }) = _SpaceThemeWithCallback<SpaceThemeDataPartial>;

  const factory SpaceTheme.mergeWithData({
    Key? key,
    required SpaceThemeDataPartial data,
    required Widget child,
  }) = _SpaceThemeWithData<SpaceThemeDataPartial>;

  const factory SpaceTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<SpaceThemeData> resolver,
    required Widget child,
  }) = _SpaceThemeWithResolver<SpaceThemeData>;

  const factory SpaceTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<SpaceThemeData> callback,
    required Widget child,
  }) = _SpaceThemeWithCallback<SpaceThemeData>;

  const factory SpaceTheme.replaceWithData({
    Key? key,
    required SpaceThemeData data,
    required Widget child,
  }) = _SpaceThemeWithData<SpaceThemeData>;

  ThemeResolver<SpaceThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _SpaceTheme.maybeResolverOf(context);
    return _SpaceTheme(
      resolver: inherited != null
          ? .combine(inherited, resolver, _merge)
          : resolver,
      child: child,
    );
  }

  static SpaceThemeDataPartial _merge(
    SpaceThemeDataPartial a,
    SpaceThemeDataPartial b,
  ) => a.maybeMerge(b);

  static SpaceThemeData of(BuildContext context) {
    final resolver = _SpaceTheme.maybeResolverOf(context);
    return .defaults(overrides: resolver?.resolve(context));
  }
}

class _SpaceThemeWithResolver<T extends SpaceThemeDataPartial>
    extends SpaceTheme {
  const _SpaceThemeWithResolver({
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

class _SpaceThemeWithCallback<T extends SpaceThemeDataPartial>
    extends SpaceTheme {
  const _SpaceThemeWithCallback({
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

class _SpaceThemeWithData<T extends SpaceThemeDataPartial> extends SpaceTheme {
  const _SpaceThemeWithData({
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

class _SpaceTheme extends InheritedTheme {
  const _SpaceTheme({super.key, required this.resolver, required super.child});

  final ThemeResolver<SpaceThemeDataPartial> resolver;

  @override
  bool updateShouldNotify(_SpaceTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _SpaceTheme(resolver: resolver, child: child);

  static ThemeResolver<SpaceThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) => context.dependOnInheritedWidgetOfExactType<_SpaceTheme>()?.resolver;
}
