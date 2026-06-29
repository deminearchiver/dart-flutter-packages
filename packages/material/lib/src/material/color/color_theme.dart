import 'dart:async';
import 'dart:ui' as ui show Image, PictureRecorder;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:material/material_quantize.dart';
import 'package:material/material_color_utilities.dart'
    show
        Hct,
        Score,
        DynamicScheme,
        Variant,
        Platform,
        SpecVersion,
        TonalPaletteSourceColor;

import 'package:material/src/material/flutter.dart';

part 'color_theme_source_color.dart';
part 'color_theme_data_partial.dart';
part 'color_theme_data.dart';
part 'color_theme_data_from_palette.dart';

typedef DynamicSchemeSourceColor = TonalPaletteSourceColor;
typedef DynamicSchemeVariant = Variant;
typedef DynamicSchemePlatform = Platform;
typedef DynamicSchemeSpecVersion = SpecVersion;
typedef ColorSchemeLegacy = ColorScheme;

extension DynamicSchemeVariantExtension on DynamicSchemeVariant {
  flutter.DynamicSchemeVariant? get asLegacy => switch (this) {
    .monochrome => .monochrome,
    .neutral => .neutral,
    .tonalSpot => .tonalSpot,
    .vibrant => .vibrant,
    .expressive => .expressive,
    .fidelity => .fidelity,
    .content => .content,
    .rainbow => .rainbow,
    .fruitSalad => .fruitSalad,
    _ => null,
  };
}

extension DynamicSchemeVariantLegacyExtension on flutter.DynamicSchemeVariant {
  DynamicSchemeVariant get asModern => switch (this) {
    .monochrome => .monochrome,
    .neutral => .neutral,
    .tonalSpot => .tonalSpot,
    .vibrant => .vibrant,
    .expressive => .expressive,
    .fidelity => .fidelity,
    .content => .content,
    .rainbow => .rainbow,
    .fruitSalad => .fruitSalad,
  };
}

abstract class ColorTheme extends StatelessWidget implements ProxyWidget {
  const ColorTheme._({super.key, required this.child});

  const factory ColorTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<ColorThemeDataPartial> resolver,
    required Widget child,
  }) = _ColorThemeWithResolver<ColorThemeDataPartial>;

  const factory ColorTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<ColorThemeDataPartial> callback,
    required Widget child,
  }) = _ColorThemeWithCallback<ColorThemeDataPartial>;

  const factory ColorTheme.mergeWithData({
    Key? key,
    required ColorThemeDataPartial data,
    required Widget child,
  }) = _ColorThemeWithData<ColorThemeDataPartial>;

  const factory ColorTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<ColorThemeData> resolver,
    required Widget child,
  }) = _ColorThemeWithResolver<ColorThemeData>;

  const factory ColorTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<ColorThemeData> callback,
    required Widget child,
  }) = _ColorThemeWithCallback<ColorThemeData>;

  const factory ColorTheme.replaceWithData({
    Key? key,
    required ColorThemeData data,
    required Widget child,
  }) = _ColorThemeWithData<ColorThemeData>;

  ThemeResolver<ColorThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _ColorTheme(resolver: resolver, child: child);

  static ColorThemeData? maybeOf(BuildContext context) {
    final overrides = _ColorTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .fromPalette(
      palette: BaselinePaletteTheme.of(context),
      brightness:
          Theme.maybeBrightnessOf(context) ??
          MediaQuery.platformBrightnessOf(context),
      contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
      overrides: overrides,
    );
  }

  static ColorThemeData of(BuildContext context) => .fromPalette(
    palette: BaselinePaletteTheme.of(context),
    brightness:
        Theme.maybeBrightnessOf(context) ??
        MediaQuery.platformBrightnessOf(context),
    contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
    overrides: _ColorTheme.maybeOverridesOf(context),
  );
}

class _ColorThemeWithResolver<T extends ColorThemeDataPartial>
    extends ColorTheme {
  const _ColorThemeWithResolver({
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

class _ColorThemeWithCallback<T extends ColorThemeDataPartial>
    extends ColorTheme {
  const _ColorThemeWithCallback({
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

class _ColorThemeWithData<T extends ColorThemeDataPartial> extends ColorTheme {
  const _ColorThemeWithData({
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

final class _ColorTheme
    extends
        InheritedThemeResolverWidget<
          ColorThemeDataPartial,
          _ColorTheme,
          _ColorThemeElement
        >
    implements InheritedTheme {
  const _ColorTheme({super.key, required super.resolver, required super.child});

  @override
  ColorThemeDataPartial merge(
    ColorThemeDataPartial fallback,
    ColorThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(ColorThemeDataPartial data) => data.isConcrete;

  @override
  _ColorThemeElement createElement() => _ColorThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ColorTheme(resolver: resolver, child: child);

  static ThemeResolver<ColorThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        ColorThemeDataPartial,
        _ColorTheme,
        _ColorThemeElement
      >(context);

  static ColorThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        ColorThemeDataPartial,
        _ColorTheme,
        _ColorThemeElement
      >(context);
}

final class _ColorThemeElement
    extends
        InheritedThemeResolverElement<
          ColorThemeDataPartial,
          _ColorTheme,
          _ColorThemeElement
        > {
  _ColorThemeElement(super.widget);
}
