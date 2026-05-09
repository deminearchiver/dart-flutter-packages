import 'package:material/src/material/flutter.dart'
    hide
        ColorTheme,
        ColorThemeData,
        ColorThemeDataPartial,
        ColorThemeDataBase,
        ColorThemeDataPartialBase,
        ColorThemeSourceColor,
        ColorThemeDataBrightnessMixin,
        ColorThemeDataColorsMixin,
        ColorThemeDataPartialBrightnessMixin,
        ColorThemeDataPartialColorsMixin,
        ColorThemeDataSeedMixin,
        ColorThemeResolver,
        ColorThemeResolverCallback;

mixin ColorThemeDataPartialBrightnessMixin on ColorThemeDataPartial {
  Brightness? get brightness;

  @override
  ColorThemeDataPartial mergeWith({Brightness? brightness});
}

abstract class ColorThemeDataPartial {
  const ColorThemeDataPartial();

  ColorThemeDataPartial mergeWith();

  ColorThemeDataPartial? mergeFrom(ColorThemeDataPartial source);

  ColorThemeDataPartial? mergeTo(ColorThemeDataPartial destination);

  ColorThemeDataPartial merge(ColorThemeDataPartial? other);
}

// mixin ColorThemeDataMerge<T extends ColorThemeDataMerge<T>> {
//   T? mergeFrom(ColorThemeDataPartial source);

//   T? mergeTo(T destination);

//   T merge(ColorThemeDataPartial? other);
// }

// abstract class ColorThemeDataPartial
//     with ColorThemeDataMerge<ColorThemeDataPartial> {
//   @override
//   ColorThemeDataPartial? mergeFrom(ColorThemeDataPartial source);

//   @override
//   ColorThemeDataPartial? mergeTo(ColorThemeDataPartial destination);

//   @override
//   ColorThemeDataPartial merge(ColorThemeDataPartial? other);

//   // ColorThemeDataPartial merge(
//   //   ColorThemeDataPartial<ColorThemeDataPartial>? other,
//   // ) {
//   //   if (other == null) return this;

//   //   final to = other.mergeTo(this);
//   //   if (to != null) return to;

//   //   final from = mergeFrom(other);
//   //   if (from != null) return from;

//   //   return this;
//   // }
// }

mixin ColorThemeDataBrightnessMixin on ColorThemeData
    implements ColorThemeDataPartialBrightnessMixin {
  @override
  Brightness get brightness;

  @override
  ColorThemeData mergeWith({Brightness? brightness});
}

// mixin ColorThemeDataDynamicSchemeMixin implements ColorTheme

mixin ColorThemeDataSeedMixin on ColorThemeData
    implements ColorThemeDataBrightnessMixin {
  DynamicSchemeSourceColor get sourceColor;

  DynamicSchemeVariant get variant;

  @override
  Brightness get brightness;

  double get contrastLevel;

  DynamicSchemePlatform get platform;

  DynamicSchemeSpecVersion get specVersion;

  @override
  ColorThemeData mergeWith({
    DynamicSchemeSourceColor? sourceColor,
    DynamicSchemeVariant? variant,
    Brightness? brightness,
    double? contrastLevel,
    DynamicSchemePlatform? platform,
    DynamicSchemeSpecVersion? specVersion,
  });
}

abstract class ColorThemeData extends ColorThemeDataPartial {
  const ColorThemeData();

  @override
  ColorThemeData mergeWith();

  @override
  ColorThemeData? mergeFrom(ColorThemeDataPartial source);

  @override
  ColorThemeData? mergeTo(ColorThemeDataPartial destination);

  @override
  ColorThemeData merge(ColorThemeDataPartial? other) {
    if (other == null) return this;

    final to = other.mergeTo(this);
    if (to is ColorThemeData) return to;

    final from = mergeFrom(other);
    if (from != null) return from;

    return this;
  }
}

// class _ColorThemeDataFromSeed extends ColorThemeData
//     implements ColorThemeDataSeedMixin {
//   const _ColorThemeDataFromSeed({
//     required this.sourceColor,
//     required this.variant,
//     required this.brightness,
//     required this.contrastLevel,
//     required this.platform,
//     required this.specVersion,
//   });

//   @override
//   final DynamicSchemeSourceColor sourceColor;

//   @override
//   final DynamicSchemeVariant variant;

//   @override
//   final Brightness brightness;

//   @override
//   final double contrastLevel;

//   @override
//   final DynamicSchemePlatform platform;

//   @override
//   final DynamicSchemeSpecVersion specVersion;

//   @override
//   ColorThemeData mergeWith({
//     DynamicSchemeSourceColor? sourceColor,
//     DynamicSchemeVariant? variant,
//     Brightness? brightness,
//     double? contrastLevel,
//     DynamicSchemePlatform? platform,
//     DynamicSchemeSpecVersion? specVersion,
//   }) {}

//   @override
//   ColorThemeData? mergeFrom(ColorThemeDataPartial source) {
//     // final brightness = switch (source) {
//     //   ColorThemeDataPartialBrightnessMixin(:final brightness) => brightness,
//     //   _ => null,
//     // };
//     DynamicSchemeSourceColor? sourceColor;
//     DynamicSchemeVariant? variant;
//     Brightness? brightness;
//     double? contrastLevel;
//     DynamicSchemePlatform? platform;
//     DynamicSchemeSpecVersion? specVersion;

//     if (source is ColorThemeDataSeedMixin) {
//       sourceColor = source.sourceColor;
//       variant = source.variant;
//       brightness = source.brightness;
//       contrastLevel = source.contrastLevel;
//       platform = source.platform;
//       specVersion = source.specVersion;
//     } else if (source is ColorThemeDataPartialBrightnessMixin) {
//       brightness = source.brightness;
//     }

//     return mergeWith(
//       sourceColor: sourceColor,
//       variant: variant,
//       brightness: brightness,
//       contrastLevel: contrastLevel,
//       platform: platform,
//       specVersion: specVersion,
//     );
//   }

//   @override
//   ColorThemeData? mergeTo(ColorThemeDataPartial destination) {}
// }
