import 'package:material/src/material/flutter.dart';
import 'package:flutter/material.dart' as flutter;

part 'icon_theme_data_partial.dart';
part 'icon_theme_data.dart';

typedef IconThemeLegacy = flutter.IconTheme;
typedef IconThemeDataLegacy = flutter.IconThemeData;

// TODO: come back to add legacy / modern resolution logic to the build method

abstract class IconTheme extends SingleChildStatelessWidget {
  const IconTheme._({super.key, super.child});

  const factory IconTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<IconThemeDataPartial> resolver,
    Widget? child,
  }) = _IconThemeWithResolver<IconThemeDataPartial>;

  const factory IconTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<IconThemeDataPartial> callback,
    Widget? child,
  }) = _IconThemeWithCallback<IconThemeDataPartial>;

  const factory IconTheme.mergeWithData({
    Key? key,
    required IconThemeDataPartial data,
    Widget? child,
  }) = _IconThemeWithData<IconThemeDataPartial>;

  const factory IconTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<IconThemeData> resolver,
    Widget? child,
  }) = _IconThemeWithResolver<IconThemeData>;

  const factory IconTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<IconThemeData> callback,
    Widget? child,
  }) = _IconThemeWithCallback<IconThemeData>;

  const factory IconTheme.replaceWithData({
    Key? key,
    required IconThemeData data,
    Widget? child,
  }) = _IconThemeWithData<IconThemeData>;

  ThemeResolver<IconThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _IconTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static IconThemeData _fallbackOf(BuildContext context) =>
      .defaults(colorTheme: ColorTheme.of(context));

  static _ValueAtDepth<IconThemeData>? _modernDataOf(BuildContext context) {
    final overrides = _IconTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    final element =
        context.getElementForInheritedWidgetOfExactType<_IconTheme>()!
            as _IconThemeElement;
    return _ValueAtDepth(
      value: .defaultsOf(context, overrides: overrides),
      depth: element.depth,
    );
  }

  static _ValueAtDepth<IconThemeDataLegacy>? _legacyDataOf(
    BuildContext context,
  ) {
    final element = context
        .getElementForInheritedWidgetOfExactType<IconThemeLegacy>();
    final widget = context
        .dependOnInheritedWidgetOfExactType<IconThemeLegacy>();
    if (element == null || widget == null) return null;
    return _ValueAtDepth(value: widget.data, depth: element.depth);
  }

  static IconThemeData? _maybeOfWithFallback(
    BuildContext context,
    IconThemeData fallbackTheme,
    bool allowLegacy,
  ) {
    final modernData = _modernDataOf(context);
    final legacyData = _legacyDataOf(context);

    // If only modern theme is allowed, return it if exists, or null.
    if (!allowLegacy) return modernData?.value;

    if (modernData != null &&
        (legacyData == null || modernData.depth >= legacyData.depth)) {
      // If modern theme exists and it is closer than legacy, return it.
      return modernData.value;
    }

    // If legacy theme exists, merge it with fallback, and return the result.
    return legacyData != null
        ? fallbackTheme.maybeMerge(
            .fromLegacy(legacyData.value.resolve(context)),
          )
        : null;
  }

  static IconThemeData? maybeOf(
    BuildContext context, {
    bool allowLegacy = true,
  }) => _maybeOfWithFallback(context, _fallbackOf(context), allowLegacy);

  static IconThemeData of(BuildContext context, {bool allowLegacy = true}) {
    final fallbackTheme = _fallbackOf(context);
    return _maybeOfWithFallback(context, fallbackTheme, allowLegacy) ??
        fallbackTheme;
  }
}

class _IconThemeWithResolver<T extends IconThemeDataPartial> extends IconTheme {
  const _IconThemeWithResolver({super.key, required this.resolver, super.child})
    : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _IconThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _IconThemeWithCallback<T extends IconThemeDataPartial> extends IconTheme {
  const _IconThemeWithCallback({super.key, required this.callback, super.child})
    : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _IconThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _IconThemeWithData<T extends IconThemeDataPartial> extends IconTheme {
  const _IconThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _IconThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _IconTheme
    extends
        InheritedThemeResolverWidget<
          IconThemeDataPartial,
          _IconTheme,
          _IconThemeElement
        >
    implements InheritedTheme {
  const _IconTheme({super.key, required super.resolver, required super.child});

  @override
  IconThemeDataPartial merge(
    IconThemeDataPartial fallback,
    IconThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(IconThemeDataPartial data) => data.isConcrete;

  @override
  _IconThemeElement createElement() => _IconThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _IconTheme(resolver: resolver, child: child);

  static ThemeResolver<IconThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        IconThemeDataPartial,
        _IconTheme,
        _IconThemeElement
      >(context);

  static IconThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        IconThemeDataPartial,
        _IconTheme,
        _IconThemeElement
      >(context);
}

final class _IconThemeElement
    extends
        InheritedThemeResolverElement<
          IconThemeDataPartial,
          _IconTheme,
          _IconThemeElement
        > {
  _IconThemeElement(super.widget);
}

extension type const _ValueAtDepth<T extends Object?>._((T value, int depth) _)
    implements Object {
  const _ValueAtDepth({required T value, required int depth})
    : this._((value, depth));

  T get value => _.$1;

  int get depth => _.$2;
}
