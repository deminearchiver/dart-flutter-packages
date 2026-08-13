import 'dart:math' as math;

import 'package:collection/collection.dart';

import '../hct/hct.dart';
import '../palettes/tonal_palette.dart';
import '../utils/math_utils.dart';

import 'color_spec.dart';
import 'dynamic_color.dart';
import 'variant.dart';

/// The platform on which this scheme is intended to be used.
enum Platform { phone, watch }

/// Provides important settings for creating colors dynamically,
/// and 6 color palettes.
///
/// Requires:
/// 1. A color. (source color)
/// 2. A theme. (Variant)
/// 3. Whether or not its dark mode.
/// 4. Contrast level. (-1 to 1, currently contrast ratio 3.0 and 7.0)
class const DynamicScheme.raw({
  /// The source color of the scheme.
  required final TonalPaletteSourceColor sourceColor,

  /// The variant of the scheme.
  required final Variant variant,

  /// Whether or not the scheme is dark mode.
  required final bool isDark,

  /// Value from -1 to 1. -1 represents minimum contrast.
  /// 0 represents standard (i.e. the design as spec'd),
  /// and 1 represents maximum contrast.
  required final double contrastLevel,

  /// The platform on which this scheme is intended to be used.
  required final Platform platform,

  /// The spec version of the scheme.
  required final SpecVersion specVersion,

  required final TonalPalette primaryPalette,

  required final TonalPalette secondaryPalette,

  required final TonalPalette tertiaryPalette,

  required final TonalPalette neutralPalette,

  required final TonalPalette neutralVariantPalette,

  required final TonalPalette errorPalette,
}) {
  new _fromSettings({
    required _DynamicSchemeSettings settings,
    required TonalPaletteSourceColor sourceColor,
    double contrastLevel = 0.0,
    required TonalPalette primaryPalette,
    required TonalPalette secondaryPalette,
    required TonalPalette tertiaryPalette,
    required TonalPalette neutralPalette,
    required TonalPalette neutralVariantPalette,
    required TonalPalette errorPalette,
  }) : this.raw(
         sourceColor: sourceColor,
         variant: settings.variant,
         isDark: settings.isDark,
         contrastLevel: contrastLevel,
         platform: settings.platform,
         specVersion: settings.specVersion,
         primaryPalette: primaryPalette,
         secondaryPalette: secondaryPalette,
         tertiaryPalette: tertiaryPalette,
         neutralPalette: neutralPalette,
         neutralVariantPalette: neutralVariantPalette,
         errorPalette: errorPalette,
       );

  new({
    required TonalPaletteSourceColor sourceColor,
    required Variant variant,
    required bool isDark,
    double contrastLevel = 0.0,
    Platform platform = defaultPlatform,
    SpecVersion specVersion = defaultSpecVersion,
    required TonalPalette primaryPalette,
    required TonalPalette secondaryPalette,
    required TonalPalette tertiaryPalette,
    required TonalPalette neutralPalette,
    required TonalPalette neutralVariantPalette,
    required TonalPalette errorPalette,
  }) : this._fromSettings(
         settings: .normalize(
           variant: variant,
           isDark: isDark,
           platform: platform,
           specVersion: specVersion,
         ),
         sourceColor: sourceColor,
         contrastLevel: contrastLevel,
         primaryPalette: primaryPalette,
         secondaryPalette: secondaryPalette,
         tertiaryPalette: tertiaryPalette,
         neutralPalette: neutralPalette,
         neutralVariantPalette: neutralVariantPalette,
         errorPalette: errorPalette,
       );

  new _fromColorSpec({
    required TonalPaletteSourceColor sourceColor,
    required Variant variant,
    required bool isDark,
    required double contrastLevel,
    required Platform platform,
    required SpecVersion specVersion,
    TonalPalette? primaryPalette,
    TonalPalette? secondaryPalette,
    TonalPalette? tertiaryPalette,
    TonalPalette? neutralPalette,
    TonalPalette? neutralVariantPalette,
    TonalPalette? errorPalette,
    required ColorSpec colorSpec,
  }) : this.raw(
         sourceColor: sourceColor,
         variant: variant,
         isDark: isDark,
         contrastLevel: contrastLevel,
         platform: platform,
         specVersion: specVersion,
         primaryPalette:
             primaryPalette ??
             colorSpec.getPrimaryPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
         secondaryPalette:
             secondaryPalette ??
             colorSpec.getSecondaryPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
         tertiaryPalette:
             tertiaryPalette ??
             colorSpec.getTertiaryPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
         neutralPalette:
             neutralPalette ??
             colorSpec.getNeutralPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
         neutralVariantPalette:
             neutralVariantPalette ??
             colorSpec.getNeutralVariantPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
         errorPalette:
             errorPalette ??
             colorSpec.getErrorPalette(
               sourceColor,
               variant,
               isDark,
               contrastLevel,
               platform,
               specVersion,
             ),
       );

  new _fromSettingsWithDefaults({
    required _DynamicSchemeSettings settings,
    required TonalPaletteSourceColor sourceColor,
    required double contrastLevel,
    TonalPalette? primaryPalette,
    TonalPalette? secondaryPalette,
    TonalPalette? tertiaryPalette,
    TonalPalette? neutralPalette,
    TonalPalette? neutralVariantPalette,
    TonalPalette? errorPalette,
  }) : this._fromColorSpec(
         sourceColor: sourceColor,
         variant: settings.variant,
         isDark: settings.isDark,
         contrastLevel: contrastLevel,
         platform: settings.platform,
         specVersion: settings.specVersion,
         primaryPalette: primaryPalette,
         secondaryPalette: secondaryPalette,
         tertiaryPalette: tertiaryPalette,
         neutralPalette: neutralPalette,
         neutralVariantPalette: neutralVariantPalette,
         errorPalette: errorPalette,
         colorSpec: .fromSpecVersion(settings.specVersion),
       );

  new withDefaults({
    TonalPaletteSourceColor? sourceColor,
    Variant? variant,
    bool? isDark,
    double? contrastLevel,
    Platform? platform,
    SpecVersion? specVersion,
    TonalPalette? primaryPalette,
    TonalPalette? secondaryPalette,
    TonalPalette? tertiaryPalette,
    TonalPalette? neutralPalette,
    TonalPalette? neutralVariantPalette,
    TonalPalette? errorPalette,
  }) : this._fromSettingsWithDefaults(
         settings: .normalize(
           variant: variant ?? .tonalSpot,
           isDark: isDark ?? false,
           platform: platform ?? defaultPlatform,
           specVersion: specVersion ?? defaultSpecVersion,
         ),
         sourceColor: sourceColor ?? .fromArgb(0xFF6750A4),
         contrastLevel: contrastLevel ?? 0.0,
         primaryPalette: primaryPalette,
         secondaryPalette: secondaryPalette,
         tertiaryPalette: tertiaryPalette,
         neutralPalette: neutralPalette,
         neutralVariantPalette: neutralVariantPalette,
         errorPalette: errorPalette,
       );

  /// The source color of the scheme in HCT format.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  List<Hct> get sourceColorHctList => sourceColor.asHctList;

  /// The source color of the scheme in HCT format.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  Hct get sourceColorHct => sourceColor.asHct;

  /// The source color of the scheme in ARGB format.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  int get sourceColorArgb => sourceColor.asArgb;

  DynamicScheme copyWith({
    TonalPaletteSourceColor? sourceColor,
    Variant? variant,
    bool? isDark,
    double? contrastLevel,
    Platform? platform,
    SpecVersion? specVersion,
    TonalPalette? primaryPalette,
    TonalPalette? secondaryPalette,
    TonalPalette? tertiaryPalette,
    TonalPalette? neutralPalette,
    TonalPalette? neutralVariantPalette,
    TonalPalette? errorPalette,
  }) =>
      sourceColor != null ||
          variant != null ||
          isDark != null ||
          contrastLevel != null ||
          platform != null ||
          specVersion != null ||
          primaryPalette != null ||
          secondaryPalette != null ||
          tertiaryPalette != null ||
          neutralPalette != null ||
          neutralVariantPalette != null ||
          errorPalette != null
      ? .new(
          sourceColor: sourceColor ?? this.sourceColor,
          variant: variant ?? this.variant,
          isDark: isDark ?? this.isDark,
          contrastLevel: contrastLevel ?? this.contrastLevel,
          platform: platform ?? this.platform,
          specVersion: specVersion ?? this.specVersion,
          primaryPalette: primaryPalette ?? this.primaryPalette,
          secondaryPalette: secondaryPalette ?? this.secondaryPalette,
          tertiaryPalette: tertiaryPalette ?? this.tertiaryPalette,
          neutralPalette: neutralPalette ?? this.neutralPalette,
          neutralVariantPalette:
              neutralVariantPalette ?? this.neutralVariantPalette,
          errorPalette: errorPalette ?? this.errorPalette,
        )
      : this;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  Hct getHct(DynamicColor dynamicColor) => dynamicColor.getHct(this);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  int getArgb(DynamicColor dynamicColor) => dynamicColor.getArgb(this);

  @override
  String toString() {
    final sourceColor = sourceColorHctList.length > 1
        ? "sourceColorHctList: $sourceColorHctList, "
        : "sourceColorHct: $sourceColorHct, ";
    return "DynamicScheme("
        "$sourceColor"
        "variant: ${variant.name}, "
        "${isDark ? "dark" : "light"}, "
        "contrastLevel: ${contrastLevel.toStringAsFixed(1)}, "
        "platform: ${platform.name}, "
        "specVersion: ${specVersion.year}"
        ")";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DynamicScheme &&
          sourceColor == other.sourceColor &&
          variant == other.variant &&
          isDark == other.isDark &&
          platform == other.platform &&
          contrastLevel == other.contrastLevel &&
          specVersion == other.specVersion &&
          primaryPalette == other.primaryPalette &&
          secondaryPalette == other.secondaryPalette &&
          tertiaryPalette == other.tertiaryPalette &&
          neutralPalette == other.neutralPalette &&
          neutralVariantPalette == other.neutralVariantPalette &&
          errorPalette == other.errorPalette;

  @override
  int get hashCode => Object.hash(
    sourceColor,
    variant,
    isDark,
    platform,
    contrastLevel,
    specVersion,
    primaryPalette,
    secondaryPalette,
    tertiaryPalette,
    neutralPalette,
    neutralVariantPalette,
    errorPalette,
  );

  static const defaultSpecVersion = SpecVersion.spec2021;

  static const defaultPlatform = Platform.phone;

  static double getPiecewiseValue(
    Hct sourceColorHct,
    List<double> hueBreakpoints,
    List<double> hues,
  ) {
    final size = math.min(hueBreakpoints.length - 1, hues.length);
    final sourceHue = sourceColorHct.hue;
    for (var i = 0; i < size; i++) {
      if (sourceHue >= hueBreakpoints[i] && sourceHue < hueBreakpoints[i + 1]) {
        return MathUtils.sanitizeDegreesDouble(hues[i]);
      }
    }
    // No condition matched, return the source value.
    return sourceHue;
  }

  static double getRotatedHue(
    Hct sourceColorHct,
    List<double> hueBreakpoints,
    List<double> rotations,
  ) {
    var rotation = getPiecewiseValue(sourceColorHct, hueBreakpoints, rotations);
    if (math.min(hueBreakpoints.length - 1, rotations.length) <= 0) {
      // No condition matched, return the source hue.
      rotation = 0.0;
    }
    return MathUtils.sanitizeDegreesDouble(sourceColorHct.hue + rotation);
  }
}

extension type const _DynamicSchemeSettings._(
  (Variant variant, bool isDark, Platform platform, SpecVersion specVersion) _,
) implements Object {
  const new({
    required Variant variant,
    required bool isDark,
    required Platform platform,
    required SpecVersion specVersion,
  }) : _ = (variant, isDark, platform, specVersion);

  factory normalize({
    required Variant variant,
    required bool isDark,
    required Platform platform,
    required SpecVersion specVersion,
  }) {
    final bool isDarkResult;
    final Platform platformResult;
    final SpecVersion specVersionResult;
    switch (variant) {
      case .cmf:
        isDarkResult = isDark;
        platformResult = .phone;
        specVersionResult = .spec2026;
      case .expressive || .vibrant || .tonalSpot || .neutral:
        switch (specVersion) {
          case .spec2026 || .spec2025:
            isDarkResult = platform == .watch || isDark;
            platformResult = platform;
            specVersionResult = .spec2025;
          case .spec2021:
            isDarkResult = isDark;
            platformResult = .phone;
            specVersionResult = .spec2021;
        }
      case .monochrome || .fidelity || .content || .rainbow || .fruitSalad:
        isDarkResult = isDark;
        platformResult = .phone;
        specVersionResult = .spec2021;
    }
    return _DynamicSchemeSettings(
      variant: variant,
      isDark: isDarkResult,
      platform: platformResult,
      specVersion: specVersionResult,
    );
  }

  Variant get variant => _.$1;

  bool get isDark => _.$2;

  Platform get platform => _.$3;

  SpecVersion get specVersion => _.$4;
}

abstract class TonalPaletteSourceColor {
  const TonalPaletteSourceColor();

  factory TonalPaletteSourceColor.fromArgb(int argb) = _TonalPaletteArgbSource;

  factory TonalPaletteSourceColor.fromHct(Hct hct) = _TonalPaletteHctSource;

  factory TonalPaletteSourceColor.fromArgbList(List<int> argbList) =
      _TonalPaletteArgbListSource;

  factory TonalPaletteSourceColor.fromHctList(List<Hct> hctList) =
      _TonalPaletteHctListSource;

  /// The source color in ARGB format.
  int get asArgb;

  /// The source color in HCT format.
  Hct get asHct;

  /// The source color in ARGB format.
  List<int> get asArgbList;

  /// The source color in HCT format.
  List<Hct> get asHctList;
}

class _TonalPaletteArgbSource extends TonalPaletteSourceColor {
  _TonalPaletteArgbSource(this._argb);

  final int _argb;

  @override
  int get asArgb => _argb;

  @override
  late final Hct asHct = .fromInt(asArgb);

  @override
  late final List<int> asArgbList = _SingletonList(asArgb);

  @override
  late final List<Hct> asHctList = _SingletonList(asHct);

  @override
  String toString() => "TonalPaletteSourceColor.fromArgb($asArgb)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TonalPaletteArgbSource && _argb == other._argb;

  @override
  int get hashCode => _argb.hashCode;
}

class _TonalPaletteHctSource extends TonalPaletteSourceColor {
  _TonalPaletteHctSource(this._hct);

  final Hct _hct;

  @override
  Hct get asHct => _hct;

  @override
  late final int asArgb = asHct.toInt();

  @override
  late final List<int> asArgbList = _SingletonList(asArgb);

  @override
  late final List<Hct> asHctList = _SingletonList(asHct);

  @override
  String toString() => "TonalPaletteSourceColor.fromHct($asHct)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TonalPaletteHctSource && _hct == other._hct;

  @override
  int get hashCode => _hct.hashCode;
}

class _TonalPaletteArgbListSource extends TonalPaletteSourceColor {
  _TonalPaletteArgbListSource(List<int> argbList) {
    if (argbList.isEmpty) {
      throw ArgumentError("Must have at least one source color.");
    }
    _argbList = UnmodifiableListView(argbList);
  }

  late final List<int> _argbList;

  @override
  List<int> get asArgbList => _argbList;

  @override
  late final int asArgb = asHct.toInt();

  @override
  late final Hct asHct = asHctList.first;

  @override
  late final List<Hct> asHctList = UnmodifiableListView(
    asArgbList.map(Hct.fromInt).toList(growable: false),
  );

  @override
  String toString() {
    final value = asArgbList.length > 1
        ? "[${asArgbList.join(", ")}]"
        : "$asArgb";
    return "TonalPaletteSourceColor.fromArgbList($value)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TonalPaletteArgbListSource &&
          const ListEquality<int>().equals(_argbList, other._argbList);

  @override
  int get hashCode => const ListEquality<int>().hash(_argbList);
}

class _TonalPaletteHctListSource extends TonalPaletteSourceColor {
  _TonalPaletteHctListSource(List<Hct> hctList) {
    if (hctList.isEmpty) {
      throw ArgumentError("Must have at least one source color.");
    }
    _hctList = UnmodifiableListView(hctList);
  }

  late final List<Hct> _hctList;

  @override
  List<Hct> get asHctList => _hctList;

  @override
  late final int asArgb = asHct.toInt();

  @override
  late final Hct asHct = asHctList.first;

  @override
  late final List<int> asArgbList = UnmodifiableListView(
    asHctList.map((hct) => hct.toInt()).toList(growable: false),
  );

  @override
  String toString() {
    final value = asHctList.length > 1 ? "[${asHctList.join(", ")}]" : "$asHct";
    return "TonalPaletteSourceColor.fromHctList($value)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TonalPaletteHctListSource &&
          const ListEquality<Hct>().equals(_hctList, other._hctList);

  @override
  int get hashCode => const ListEquality<Hct>().hash(_hctList);
}

// TODO: consider replacing with a custom list type.
extension type const _SingletonList<E extends Object?>._(List<E> _)
    implements List<E> {
  new(E element)
    : this._(UnmodifiableListView(List.filled(1, element, growable: false)));
}
