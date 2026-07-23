import 'dart:math' as math;

import 'package:collection/collection.dart';

import '../hct/hct.dart';
import '../palettes/tonal_palette.dart';
import '../utils/math_utils.dart';

import 'color_spec.dart';
import 'color_specs.dart';
import 'dynamic_color.dart';
import 'material_dynamic_colors.dart';
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
class DynamicScheme {
  const DynamicScheme.raw({
    required this.sourceColor,
    required this.variant,
    required this.isDark,
    required this.contrastLevel,
    required this.platform,
    required this.specVersion,
    required this.primaryPalette,
    required this.secondaryPalette,
    required this.tertiaryPalette,
    required this.neutralPalette,
    required this.neutralVariantPalette,
    required this.errorPalette,
  });

  DynamicScheme._fromSettings({
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

  DynamicScheme({
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

  DynamicScheme._fromColorSpec({
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

  DynamicScheme._fromSettingsWithDefaults({
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
         colorSpec: ColorSpecs.get(settings.specVersion),
       );

  DynamicScheme.withDefaults({
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

  /// The source color of the scheme.
  final TonalPaletteSourceColor sourceColor;

  /// The variant of the scheme.
  final Variant variant;

  /// Whether or not the scheme is dark mode.
  final bool isDark;

  /// Value from -1 to 1. -1 represents minimum contrast.
  /// 0 represents standard (i.e. the design as spec'd),
  /// and 1 represents maximum contrast.
  final double contrastLevel;

  /// The platform on which this scheme is intended to be used.
  final Platform platform;

  /// The spec version of the scheme.
  final SpecVersion specVersion;

  final TonalPalette primaryPalette;

  final TonalPalette secondaryPalette;

  final TonalPalette tertiaryPalette;

  final TonalPalette neutralPalette;

  final TonalPalette neutralVariantPalette;

  final TonalPalette errorPalette;

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

  int get primaryPaletteKeyColor =>
      getArgb(_dynamicColors.primaryPaletteKeyColor);

  int get secondaryPaletteKeyColor =>
      getArgb(_dynamicColors.secondaryPaletteKeyColor);

  int get tertiaryPaletteKeyColor =>
      getArgb(_dynamicColors.tertiaryPaletteKeyColor);

  int get neutralPaletteKeyColor =>
      getArgb(_dynamicColors.neutralPaletteKeyColor);

  int get neutralVariantPaletteKeyColor =>
      getArgb(_dynamicColors.neutralVariantPaletteKeyColor);

  int get errorPaletteKeyColor => getArgb(_dynamicColors.errorPaletteKeyColor);

  int get background => getArgb(_dynamicColors.background);

  int get onBackground => getArgb(_dynamicColors.onBackground);

  int get surface => getArgb(_dynamicColors.surface);

  int get surfaceDim => getArgb(_dynamicColors.surfaceDim);

  int get surfaceBright => getArgb(_dynamicColors.surfaceBright);

  int get surfaceContainerLowest =>
      getArgb(_dynamicColors.surfaceContainerLowest);

  int get surfaceContainerLow => getArgb(_dynamicColors.surfaceContainerLow);

  int get surfaceContainer => getArgb(_dynamicColors.surfaceContainer);

  int get surfaceContainerHigh => getArgb(_dynamicColors.surfaceContainerHigh);

  int get surfaceContainerHighest =>
      getArgb(_dynamicColors.surfaceContainerHighest);

  int get onSurface => getArgb(_dynamicColors.onSurface);

  int get surfaceVariant => getArgb(_dynamicColors.surfaceVariant);

  int get onSurfaceVariant => getArgb(_dynamicColors.onSurfaceVariant);

  int get outline => getArgb(_dynamicColors.outline);

  int get outlineVariant => getArgb(_dynamicColors.outlineVariant);

  int get inverseSurface => getArgb(_dynamicColors.inverseSurface);

  int get inverseOnSurface => getArgb(_dynamicColors.inverseOnSurface);

  int get shadow => getArgb(_dynamicColors.shadow);

  int get scrim => getArgb(_dynamicColors.scrim);

  int get surfaceTint => getArgb(_dynamicColors.surfaceTint);

  int get primary => getArgb(_dynamicColors.primary);

  int get primaryDim => getArgb(_dynamicColors.primaryDim);

  int get onPrimary => getArgb(_dynamicColors.onPrimary);

  int get primaryContainer => getArgb(_dynamicColors.primaryContainer);

  int get onPrimaryContainer => getArgb(_dynamicColors.onPrimaryContainer);

  int get primaryFixed => getArgb(_dynamicColors.primaryFixed);

  int get primaryFixedDim => getArgb(_dynamicColors.primaryFixedDim);

  int get onPrimaryFixed => getArgb(_dynamicColors.onPrimaryFixed);

  int get onPrimaryFixedVariant =>
      getArgb(_dynamicColors.onPrimaryFixedVariant);

  int get inversePrimary => getArgb(_dynamicColors.inversePrimary);

  int get secondary => getArgb(_dynamicColors.secondary);

  int get secondaryDim => getArgb(_dynamicColors.secondaryDim);

  int get onSecondary => getArgb(_dynamicColors.onSecondary);

  int get secondaryContainer => getArgb(_dynamicColors.secondaryContainer);

  int get onSecondaryContainer => getArgb(_dynamicColors.onSecondaryContainer);

  int get secondaryFixed => getArgb(_dynamicColors.secondaryFixed);

  int get secondaryFixedDim => getArgb(_dynamicColors.secondaryFixedDim);

  int get onSecondaryFixed => getArgb(_dynamicColors.onSecondaryFixed);

  int get onSecondaryFixedVariant =>
      getArgb(_dynamicColors.onSecondaryFixedVariant);

  int get tertiary => getArgb(_dynamicColors.tertiary);

  int get tertiaryDim => getArgb(_dynamicColors.tertiaryDim);

  int get onTertiary => getArgb(_dynamicColors.onTertiary);

  int get tertiaryContainer => getArgb(_dynamicColors.tertiaryContainer);

  int get onTertiaryContainer => getArgb(_dynamicColors.onTertiaryContainer);

  int get tertiaryFixed => getArgb(_dynamicColors.tertiaryFixed);

  int get tertiaryFixedDim => getArgb(_dynamicColors.tertiaryFixedDim);

  int get onTertiaryFixed => getArgb(_dynamicColors.onTertiaryFixed);

  int get onTertiaryFixedVariant =>
      getArgb(_dynamicColors.onTertiaryFixedVariant);

  int get error => getArgb(_dynamicColors.error);

  int get errorDim => getArgb(_dynamicColors.errorDim);

  int get onError => getArgb(_dynamicColors.onError);

  int get errorContainer => getArgb(_dynamicColors.errorContainer);

  int get onErrorContainer => getArgb(_dynamicColors.onErrorContainer);

  int get controlActivated => getArgb(_dynamicColors.controlActivated);

  int get controlNormal => getArgb(_dynamicColors.controlNormal);

  int get controlHighlight => getArgb(_dynamicColors.controlHighlight);

  int get textPrimaryInverse => getArgb(_dynamicColors.textPrimaryInverse);

  int get textSecondaryAndTertiaryInverse =>
      getArgb(_dynamicColors.textSecondaryAndTertiaryInverse);

  int get textPrimaryInverseDisableOnly =>
      getArgb(_dynamicColors.textPrimaryInverseDisableOnly);

  int get textSecondaryAndTertiaryInverseDisabled =>
      getArgb(_dynamicColors.textSecondaryAndTertiaryInverseDisabled);

  int get textHintInverse => getArgb(_dynamicColors.textHintInverse);

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

  static final _dynamicColors = MaterialDynamicColors();

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
  (Variant variant, bool isDark, Platform platform, SpecVersion specVersion) _
) implements Object {
  const _DynamicSchemeSettings({
    required Variant variant,
    required bool isDark,
    required Platform platform,
    required SpecVersion specVersion,
  }) : this._((variant, isDark, platform, specVersion));

  factory _DynamicSchemeSettings.normalize({
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
  _SingletonList(E element)
    : this._(UnmodifiableListView(List.filled(1, element, growable: false)));
}
