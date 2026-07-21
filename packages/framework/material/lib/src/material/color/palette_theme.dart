import 'package:material/src/material/flutter.dart';

import 'palette_theme_data.dart';

abstract class PaletteTheme extends SingleChildStatelessWidget {
  const PaletteTheme._({super.key, super.child});

  const factory PaletteTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<PaletteThemeDataPartial> resolver,
    Widget? child,
  }) = _PaletteThemeWithResolver<PaletteThemeDataPartial>;

  const factory PaletteTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<PaletteThemeDataPartial> callback,
    Widget? child,
  }) = _PaletteThemeWithCallback<PaletteThemeDataPartial>;

  const factory PaletteTheme.mergeWithData({
    Key? key,
    required PaletteThemeDataPartial data,
    Widget? child,
  }) = _PaletteThemeWithData<PaletteThemeDataPartial>;

  const factory PaletteTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<PaletteThemeData> resolver,
    Widget? child,
  }) = _PaletteThemeWithResolver<PaletteThemeData>;

  const factory PaletteTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<PaletteThemeData> callback,
    Widget? child,
  }) = _PaletteThemeWithCallback<PaletteThemeData>;

  const factory PaletteTheme.replaceWithData({
    Key? key,
    required PaletteThemeData data,
    Widget? child,
  }) = _PaletteThemeWithData<PaletteThemeData>;

  ThemeResolver<PaletteThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _PaletteTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static PaletteThemeData? maybeOf(BuildContext context) {
    final overrides = _PaletteTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static PaletteThemeData of(BuildContext context) =>
      .defaults(overrides: _PaletteTheme.maybeOverridesOf(context));
}

class _PaletteThemeWithResolver<T extends PaletteThemeDataPartial>
    extends PaletteTheme {
  const _PaletteThemeWithResolver({
    super.key,
    required this.resolver,
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _PaletteThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _PaletteThemeWithCallback<T extends PaletteThemeDataPartial>
    extends PaletteTheme {
  const _PaletteThemeWithCallback({
    super.key,
    required this.callback,
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _PaletteThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _PaletteThemeWithData<T extends PaletteThemeDataPartial>
    extends PaletteTheme {
  const _PaletteThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _PaletteThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _PaletteTheme
    extends
        InheritedThemeResolverWidget<
          PaletteThemeDataPartial,
          _PaletteTheme,
          _PaletteThemeElement
        >
    implements InheritedTheme {
  const _PaletteTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  PaletteThemeDataPartial merge(
    PaletteThemeDataPartial fallback,
    PaletteThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(PaletteThemeDataPartial data) => data is PaletteThemeData;

  @override
  _PaletteThemeElement createElement() => _PaletteThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _PaletteTheme(resolver: resolver, child: child);

  static ThemeResolver<PaletteThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        PaletteThemeDataPartial,
        _PaletteTheme,
        _PaletteThemeElement
      >(context);

  static PaletteThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        PaletteThemeDataPartial,
        _PaletteTheme,
        _PaletteThemeElement
      >(context);
}

final class _PaletteThemeElement
    extends
        InheritedThemeResolverElement<
          PaletteThemeDataPartial,
          _PaletteTheme,
          _PaletteThemeElement
        > {
  _PaletteThemeElement(super.widget);
}
