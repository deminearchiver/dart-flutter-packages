extension type const _TypescaleToken._(
  ({
    _TypefaceFontToken font,
    _Weight weight,
    double size,
    double tracking,
    double lineHeight,
    _Weight wght,
    double grad,
    double wdth,
    double rond,
    double opsz,
    double crsv,
    double slnt,
    double fill,
    double hexp,
  })
  _
) {
  const _TypescaleToken({
    required _TypefaceFontToken font,
    required _Weight weight,
    required double size,
    required double tracking,
    required double lineHeight,
    _Weight? wght,
    double grad = 0.0,
    double wdth = 100.0,
    double rond = 0.0,
    double? opsz,
    double crsv = 0.0,
    double slnt = 0.0,
    double fill = 0.0,
    double hexp = 0.0,
  }) : _ = (
         font: font,
         weight: weight,
         size: size,
         tracking: tracking,
         lineHeight: lineHeight,
         wght: wght ?? weight,
         grad: grad,
         wdth: wdth,
         rond: rond,
         opsz: opsz ?? size,
         crsv: crsv,
         slnt: slnt,
         fill: fill,
         hexp: hexp,
       );

  _TypefaceFontToken get font => _.font;
  _Weight get weight => _.weight;
  double get size => _.size;
  double get tracking => _.tracking;
  double get lineHeight => _.lineHeight;
  _Weight get wght => _.wght;
  double get grad => _.grad;
  double get wdth => _.wdth;
  double get rond => _.rond;
  double get opsz => _.opsz;
  double get crsv => _.crsv;
  double get slnt => _.slnt;
  double get fill => _.fill;
  double get hexp => _.hexp;

  _TypescaleToken copyWith({
    _TypefaceFontToken? font,
    _Weight? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    _Weight? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) => .new(
    font: font ?? this.font,
    weight: weight ?? this.weight,
    size: size ?? this.size,
    tracking: tracking ?? this.tracking,
    lineHeight: lineHeight ?? this.lineHeight,
    wght: wght ?? this.wght,
    grad: grad ?? this.grad,
    wdth: wdth ?? this.wdth,
    rond: rond ?? this.rond,
    opsz: opsz ?? this.opsz,
    crsv: crsv ?? this.crsv,
    slnt: slnt ?? this.slnt,
    fill: fill ?? this.fill,
    hexp: hexp ?? this.hexp,
  );
}

enum _TypefaceFontToken {
  plain,
  brand;

  @override
  String toString() => name;
}

enum _TypefaceWeightToken {
  regular,
  medium,
  bold;

  @override
  String toString() => name;
}

sealed class _Weight {
  const _Weight._();

  const factory _Weight(double value) = _WeightLiteral;

  static const regular = _WeightToken(.regular);
  static const medium = _WeightToken(.medium);
  static const bold = _WeightToken(.bold);
}

final class _WeightLiteral extends _Weight {
  const _WeightLiteral(this.value) : super._();

  final double value;

  @override
  String toString() => value.toString();
}

final class _WeightToken extends _Weight {
  const _WeightToken(this.value) : super._();

  final _TypefaceWeightToken value;

  @override
  String toString() => value.toString();
}

extension type const _TypescaleTokenKey._(String _) implements String {
  static const displayLarge = _TypescaleTokenKey._("displayLarge");
  static const displayMedium = _TypescaleTokenKey._("displayMedium");
  static const displaySmall = _TypescaleTokenKey._("displaySmall");
  static const headlineLarge = _TypescaleTokenKey._("headlineLarge");
  static const headlineMedium = _TypescaleTokenKey._("headlineMedium");
  static const headlineSmall = _TypescaleTokenKey._("headlineSmall");
  static const titleLarge = _TypescaleTokenKey._("titleLarge");
  static const titleMedium = _TypescaleTokenKey._("titleMedium");
  static const titleSmall = _TypescaleTokenKey._("titleSmall");
  static const bodyLarge = _TypescaleTokenKey._("bodyLarge");
  static const bodyMedium = _TypescaleTokenKey._("bodyMedium");
  static const bodySmall = _TypescaleTokenKey._("bodySmall");
  static const labelLarge = _TypescaleTokenKey._("labelLarge");
  static const labelMedium = _TypescaleTokenKey._("labelMedium");
  static const labelSmall = _TypescaleTokenKey._("labelSmall");
}

final _baselineTokens = <_TypescaleTokenKey, _TypescaleToken>{
  .displayLarge: const .new(
    font: .brand,
    weight: .regular,
    size: 57.0,
    lineHeight: 64.0,
    tracking: -0.25,
  ),
  .displayMedium: const .new(
    font: .brand,
    weight: .regular,
    size: 45.0,
    lineHeight: 52.0,
    tracking: 0.0,
  ),
  .displaySmall: const .new(
    font: .brand,
    weight: .regular,
    size: 36.0,
    lineHeight: 44.0,
    tracking: 0.0,
  ),
  .headlineLarge: const .new(
    font: .brand,
    weight: .regular,
    size: 32.0,
    lineHeight: 40.0,
    tracking: 0.0,
  ),
  .headlineMedium: const .new(
    font: .brand,
    weight: .regular,
    size: 28.0,
    lineHeight: 36.0,
    tracking: 0.0,
  ),
  .headlineSmall: const .new(
    font: .brand,
    weight: .regular,
    size: 24.0,
    lineHeight: 32.0,
    tracking: 0.0,
  ),
  .titleLarge: const .new(
    font: .brand,
    weight: .regular,
    size: 22.0,
    lineHeight: 28.0,
    tracking: 0.0,
  ),
  .titleMedium: const .new(
    font: .plain,
    weight: .medium,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.15,
  ),
  .titleSmall: const .new(
    font: .plain,
    weight: .medium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  ),
  .bodyLarge: const .new(
    font: .plain,
    weight: .regular,
    size: 16.0,
    lineHeight: 24.0,
    tracking: 0.5,
  ),
  .bodyMedium: const .new(
    font: .plain,
    weight: .regular,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.25,
  ),
  .bodySmall: const .new(
    font: .plain,
    weight: .regular,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.4,
  ),
  .labelLarge: const .new(
    font: .plain,
    weight: .medium,
    size: 14.0,
    lineHeight: 20.0,
    tracking: 0.1,
  ),
  .labelMedium: const .new(
    font: .plain,
    weight: .medium,
    size: 12.0,
    lineHeight: 16.0,
    tracking: 0.5,
  ),
  .labelSmall: const .new(
    font: .plain,
    weight: .medium,
    size: 11.0,
    lineHeight: 16.0,
    tracking: 0.5,
  ),
};

final _emphasizedTokens = <_TypescaleTokenKey, _TypescaleToken>{
  .displayLarge: ?_baselineTokens[_TypescaleTokenKey.displayLarge]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .displayMedium: ?_baselineTokens[_TypescaleTokenKey.displayMedium]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .displaySmall: ?_baselineTokens[_TypescaleTokenKey.displaySmall]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .headlineLarge: ?_baselineTokens[_TypescaleTokenKey.headlineLarge]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .headlineMedium: ?_baselineTokens[_TypescaleTokenKey.headlineMedium]
      ?.copyWith(weight: .regular, wght: const .new(500.0)),
  .headlineSmall: ?_baselineTokens[_TypescaleTokenKey.headlineSmall]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .titleLarge: ?_baselineTokens[_TypescaleTokenKey.titleLarge]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .titleMedium: ?_baselineTokens[_TypescaleTokenKey.titleMedium]?.copyWith(
    weight: .bold,
    wght: const .new(600.0),
  ),
  .titleSmall: ?_baselineTokens[_TypescaleTokenKey.titleSmall]?.copyWith(
    weight: .bold,
    wght: const .new(600.0),
  ),
  .bodyLarge: ?_baselineTokens[_TypescaleTokenKey.bodyLarge]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .bodyMedium: ?_baselineTokens[_TypescaleTokenKey.bodyMedium]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .bodySmall: ?_baselineTokens[_TypescaleTokenKey.bodySmall]?.copyWith(
    weight: .medium,
    wght: const .new(500.0),
  ),
  .labelLarge: ?_baselineTokens[_TypescaleTokenKey.labelLarge]?.copyWith(
    weight: .bold,
    wght: const .new(700.0),
  ),
  .labelMedium: ?_baselineTokens[_TypescaleTokenKey.labelMedium]?.copyWith(
    weight: .bold,
    wght: const .new(600.0),
  ),
  .labelSmall: ?_baselineTokens[_TypescaleTokenKey.labelSmall]?.copyWith(
    weight: .bold,
    wght: const .new(600.0),
  ),
};

String _serializeFont(_TypefaceFontToken value) => switch (value) {
  .plain => "_typefaceTheme.plain",
  .brand => "_typefaceTheme.brand",
};

String _serializeWeight(_Weight value) => switch (value) {
  _WeightLiteral(:final value) => value.toString(),
  _WeightToken(:final value) => switch (value) {
    .regular => "_typefaceTheme.weightRegular",
    .medium => "_typefaceTheme.weightMedium",
    .bold => "_typefaceTheme.weightBold",
  },
};

Map<String, String> _serializeToken(_TypescaleToken value) => {
  "font": _serializeFont(value.font),
  "weight": _serializeWeight(value.weight),
  "size": value.size.toString(),
  "tracking": value.tracking.toString(),
  "lineHeight": value.lineHeight.toString(),
  "wght": _serializeWeight(value.wght),
  "grad": value.grad.toString(),
  "wdth": value.wdth.toString(),
  "rond": value.rond.toString(),
  "opsz": value.opsz.toString(),
  "crsv": value.crsv.toString(),
  "slnt": value.slnt.toString(),
  "fill": value.fill.toString(),
  "hexp": value.hexp.toString(),
};

void main(List<String> arguments) async {
  final result = <String, Map<String, String>>{};

  for (final MapEntry(:key, :value) in _baselineTokens.entries) {
    result[key] = _serializeToken(value);
  }
  for (final MapEntry(:key, :value) in _emphasizedTokens.entries) {
    result[key + "Emphasized"] = _serializeToken(value);
  }

  final lines = <String>[];

  for (final MapEntry(:key, :value) in result.entries) {
    final properties = value.entries
        .map((entry) => "${entry.key}: ${entry.value}")
        .join(", ");
    final line =
        "@override TextGeometry get $key => .from($properties).merge(_overrides.$key);";
    lines.add(line);
  }

  print(lines.join("\n\n"));
}
