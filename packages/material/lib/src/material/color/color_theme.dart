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

import 'package:flutter/cupertino.dart'
    show CupertinoColors, CupertinoDynamicColor;

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
  // TODO: decide on a name for this method
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

// class ColorTheme extends InheritedTheme {
//   const ColorTheme({super.key, required this.data, required super.child});

//   final ColorThemeData data;

//   @override
//   bool updateShouldNotify(ColorTheme oldWidget) => data != oldWidget.data;

//   @override
//   Widget wrap(BuildContext context, Widget child) =>
//       ColorTheme(data: data, child: child);

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<ColorThemeData>("data", data));
//   }

//   static Widget merge({
//     Key? key,
//     required ColorThemeData data,
//     required Widget child,
//   }) => Builder(
//     builder: (context) =>
//         ColorTheme(key: key, data: of(context).merge(data), child: child),
//   );

//   static ColorThemeData? maybeOf(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<ColorTheme>()?.data;

//   static ColorThemeData of(BuildContext context) =>
//       maybeOf(context) ??
// .fromPalette(
//   palette: BaselinePaletteTheme.of(context),
//   brightness:
//       Theme.maybeBrightnessOf(context) ??
//       MediaQuery.maybePlatformBrightnessOf(context) ??
//       .light,
// );
// }

typedef ColorThemeResolver = ThemeResolver<ColorThemeDataPartial>;

typedef ColorThemeResolverCallback =
    ThemeResolverCallback<ColorThemeDataPartial>;

class _ColorThemeResolver
    extends CombiningThemeResolver<ColorThemeDataPartial> {
  const _ColorThemeResolver(super.a, super.b);

  @override
  ColorThemeDataPartial combine(
    ColorThemeDataPartial a,
    ColorThemeDataPartial b,
  ) => a.merge(b);
}

abstract class ColorTheme extends StatelessWidget implements ProxyWidget {
  const ColorTheme._({super.key, required this.child});

  const factory ColorTheme.withResolver({
    Key? key,
    required ColorThemeResolver resolver,
    required Widget child,
  }) = _ColorThemeWithResolver;

  const factory ColorTheme.withCallback({
    Key? key,
    required ColorThemeResolverCallback callback,
    required Widget child,
  }) = _ColorThemeWithCallback;

  const factory ColorTheme.withData({
    Key? key,
    required ColorThemeDataPartial data,
    required Widget child,
  }) = _ColorThemeWithData;

  ColorThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _ColorTheme.maybeResolverOf(context);
    return _ColorTheme(
      resolver: inherited != null
          ? _ColorThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static ColorThemeData of(BuildContext context) {
    final resolver = _ColorTheme.maybeResolverOf(context);
    final defaults = ColorThemeData.fromPalette(
      palette: BaselinePaletteTheme.of(context),
      brightness:
          Theme.maybeBrightnessOf(context) ??
          MediaQuery.maybePlatformBrightnessOf(context) ??
          .light,
    );
    if (resolver != null) {
      final data = resolver.resolve(context);
      return defaults.merge(data);
      // return ._defaults(a: data.a, b: data.b, c: data.c);
    }
    return defaults;
    // return const .defaults();
  }
}

class _ColorThemeWithResolver extends ColorTheme {
  const _ColorThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ColorThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ColorThemeResolver>("resolver", resolver),
    );
  }
}

class _ColorThemeWithCallback extends ColorTheme {
  const _ColorThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ColorThemeResolverCallback callback;

  @override
  ColorThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ColorThemeResolverCallback>("callback", callback),
    );
  }
}

class _ColorThemeWithData extends ColorTheme {
  const _ColorThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final ColorThemeDataPartial data;

  @override
  ColorThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ColorThemeDataPartial>("data", data));
  }
}

class _ColorTheme extends InheritedTheme {
  const _ColorTheme({super.key, required this.resolver, required super.child});

  final ColorThemeResolver resolver;

  @override
  bool updateShouldNotify(_ColorTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ColorTheme(resolver: resolver, child: child);

  static ColorThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ColorTheme>()?.resolver;
}
