import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

FontWeight? _closestFontWeightToOrNull(double? weight) =>
    weight != null ? _closestFontWeightToOrNull(weight) : null;

FontWeight _closestFontWeightTo(double weight) {
  assert(weight >= 0.0, "Font weight cannot be negative.");
  const values = FontWeight.values;
  var closest = values[0];
  for (var i = 1; i < values.length; i++) {
    final element = values[i];
    if ((weight - element.value.toDouble()).abs() <=
        (weight - closest.value.toDouble()).abs()) {
      closest = element;
    }
  }
  return closest;
}

// (FontWeight? fontWeight, double? wght) _resolveFontWeights(
//   double? weight,
//   double? wght,
// ) {
//   if (wght != null) {
//     final fontWeight = _closestFontWeightTo(wght);
//     return (fontWeight, wght);
//   } else if (weight != null && wght == null) {
//     final fontWeight = _closestFontWeightTo(weight);
//     return (fontWeight, weight);
//   } else {
//     return (null, null);
//   }
// }

// bool _debugTextStyleHasFont(TextStyle? style) {
//   if (style == null) return false;
//   if (style.fontFamily != null) return true;
//   if (style.fontFamilyFallback case final fontFamilyFallback?) {
//     return fontFamilyFallback.isNotEmpty;
//   }
//   return false;
// }

// bool _debugTextStyleHasWeight(TextStyle? style) {
//   if (style == null) return false;
//   if (style.fontWeight != null) return true;
//   if (style.fontVariations case final fontVariations?) {
//     return fontVariations.any((fontVariation) => fontVariation.axis == "wght");
//   }
//   return false;
// }

// bool _debugTextStyleHasSize(TextStyle? style) {
//   if (style == null) return false;
//   return style.fontSize != null;
// }

// bool _debugTextStyleHasLineHeight(TextStyle? style) {
//   if (style == null) return false;
//   return style.fontSize != null && style.height != null;
// }

// bool _debugTextStyleHasTracking(TextStyle? style) {
//   if (style == null) return false;
//   return style.letterSpacing != null;
// }

// extension on FontWeight {
//   double _toDouble() => value.toDouble();
// }

// extension on TextStyle {
//   Map<String, double>? get _variableFontAxesOrNull => <String, double>{
//     for (final fontVariation in fontVariations ?? const <FontVariation>[])
//       fontVariation.axis: fontVariation.value,
//   };

//   Map<String, double> get _variableFontAxes => _variableFontAxesOrNull ?? {};

//   double? _variableFontAxis(String axis) => _variableFontAxesOrNull?[axis];
// }

const _stringListEquality = ListEquality<String>();

extension type const _VariableFontAxis._(String _) implements String {
  const _VariableFontAxis(String tag)
    : assert(tag.length == 4, "Axis tag must be exactly 4 characters long."),
      _ = tag;

  FontVariation toFontVariation(double value) => .new(_, value);

  static const wght = _VariableFontAxis("wght");
  static const grad = _VariableFontAxis("GRAD");
  static const wdth = _VariableFontAxis("wdth");
  static const rond = _VariableFontAxis("ROND");
  static const opsz = _VariableFontAxis("opsz");
  static const crsv = _VariableFontAxis("CRSV");
  static const slnt = _VariableFontAxis("slnt");
  static const fill = _VariableFontAxis("FILL");
  static const hexp = _VariableFontAxis("HEXP");
}

abstract class TextGeometryPartial with Diagnosticable {
  const TextGeometryPartial();

  const factory TextGeometryPartial.from({
    List<String>? font,
    double? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) = _TextGeometryPartial;

  List<String>? get font;

  double? get weight;

  double? get size;

  double? get tracking;

  double? get lineHeight;

  double? get wght;

  double? get grad;

  double? get wdth;

  double? get rond;

  double? get opsz;

  double? get crsv;

  double? get slnt;

  double? get fill;

  double? get hexp;

  TextGeometryPartial copyWith({
    List<String>? font,
    double? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) =>
      font != null ||
          weight != null ||
          size != null ||
          tracking != null ||
          lineHeight != null ||
          wght != null ||
          grad != null ||
          wdth != null ||
          rond != null ||
          opsz != null ||
          crsv != null ||
          slnt != null ||
          fill != null ||
          hexp != null
      ? .from(
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
        )
      : this;

  TextGeometryPartial mergeWith({
    List<String>? font,
    double? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) =>
      font != null ||
          weight != null ||
          size != null ||
          tracking != null ||
          lineHeight != null ||
          wght != null ||
          grad != null ||
          wdth != null ||
          rond != null ||
          opsz != null ||
          crsv != null ||
          slnt != null ||
          fill != null ||
          hexp != null
      ? .from(
          font: font != null ? [...font, ...?this.font] : this.font,
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
        )
      : this;

  TextGeometryPartial merge(TextGeometryPartial? other) => other != null
      ? mergeWith(
          font: other.font,
          weight: other.weight,
          size: other.size,
          tracking: other.tracking,
          lineHeight: other.lineHeight,
          wght: other.wght,
          grad: other.grad,
          wdth: other.wdth,
          rond: other.rond,
          opsz: other.opsz,
          crsv: other.crsv,
          slnt: other.slnt,
          fill: other.fill,
          hexp: other.hexp,
        )
      : this;

  Map<String, double> get variableFontAxes => {
    _VariableFontAxis.wght: ?wght,
    _VariableFontAxis.grad: ?grad,
    _VariableFontAxis.wdth: ?wdth,
    _VariableFontAxis.rond: ?rond,
    _VariableFontAxis.opsz: ?opsz,
    _VariableFontAxis.crsv: ?crsv,
    _VariableFontAxis.slnt: ?slnt,
    _VariableFontAxis.fill: ?fill,
    _VariableFontAxis.hexp: ?hexp,
  };

  List<FontVariation> get fontVariations => [
    if (wght case final wght?) _VariableFontAxis.wght.toFontVariation(wght),
    if (grad case final grad?) _VariableFontAxis.grad.toFontVariation(grad),
    if (wdth case final wdth?) _VariableFontAxis.wdth.toFontVariation(wdth),
    if (rond case final rond?) _VariableFontAxis.rond.toFontVariation(rond),
    if (opsz case final opsz?) _VariableFontAxis.opsz.toFontVariation(opsz),
    if (crsv case final crsv?) _VariableFontAxis.crsv.toFontVariation(crsv),
    if (slnt case final slnt?) _VariableFontAxis.slnt.toFontVariation(slnt),
    if (fill case final fill?) _VariableFontAxis.fill.toFontVariation(fill),
    if (hexp case final hexp?) _VariableFontAxis.hexp.toFontVariation(hexp),
  ];

  TextStyle toTextStyle({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextBaseline? textBaseline,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    TextOverflow? overflow,
  }) {
    final fontFamily = font?.firstOrNull;
    final fontFamilyFallback = font?.skip(1).toList();
    return TextStyle(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: size,
      fontWeight: _closestFontWeightToOrNull(weight),
      fontStyle: fontStyle,
      letterSpacing: tracking,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: switch ((size, lineHeight)) {
        (final size?, final lineHeight?) => lineHeight / size,
        _ => null,
      },
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations != null && fontVariations.isNotEmpty
          ? [...this.fontVariations, ...fontVariations]
          : this.fontVariations,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: null,
      overflow: overflow,
    );
  }

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty("font", font, defaultValue: null))
      ..add(DoubleProperty("weight", weight, defaultValue: null))
      ..add(DoubleProperty("size", size, defaultValue: null))
      ..add(DoubleProperty("tracking", tracking, defaultValue: null))
      ..add(DoubleProperty("lineHeight", lineHeight, defaultValue: null))
      ..add(DoubleProperty("wght", wght, defaultValue: null))
      ..add(DoubleProperty("grad", grad, defaultValue: null))
      ..add(DoubleProperty("wdth", wdth, defaultValue: null))
      ..add(DoubleProperty("rond", rond, defaultValue: null))
      ..add(DoubleProperty("opsz", opsz, defaultValue: null))
      ..add(DoubleProperty("crsv", crsv, defaultValue: null))
      ..add(DoubleProperty("slnt", slnt, defaultValue: null))
      ..add(DoubleProperty("fill", fill, defaultValue: null))
      ..add(DoubleProperty("hexp", hexp, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TextGeometryPartial &&
          _stringListEquality.equals(font, other.font) &&
          weight == other.weight &&
          size == other.size &&
          tracking == other.tracking &&
          lineHeight == other.lineHeight &&
          wght == other.wght &&
          grad == other.grad &&
          wdth == other.wdth &&
          rond == other.rond &&
          opsz == other.opsz &&
          crsv == other.crsv &&
          slnt == other.slnt &&
          fill == other.fill &&
          hexp == other.hexp;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _stringListEquality.hash(font),
    weight,
    size,
    tracking,
    lineHeight,
    wght,
    grad,
    wdth,
    rond,
    opsz,
    crsv,
    slnt,
    fill,
    hexp,
  );

  static TextGeometryPartial? lerp(
    TextGeometryPartial? a,
    TextGeometryPartial? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return .from(
      font: t < 0.5 ? a?.font : b?.font,
      weight: lerpDoubleNullable(a?.weight, b?.weight, t),
      size: lerpDoubleNullable(a?.size, b?.size, t),
      lineHeight: lerpDoubleNullable(a?.lineHeight, b?.lineHeight, t),
      tracking: lerpDoubleNullable(a?.tracking, b?.tracking, t),
      wght: lerpDoubleNullable(a?.wght, b?.wght, t),
      grad: lerpDoubleNullable(a?.grad, b?.grad, t),
      wdth: lerpDoubleNullable(a?.wdth, b?.wdth, t),
      rond: lerpDoubleNullable(a?.rond, b?.rond, t),
      opsz: lerpDoubleNullable(a?.opsz, b?.opsz, t),
      crsv: lerpDoubleNullable(a?.crsv, b?.crsv, t),
      slnt: lerpDoubleNullable(a?.slnt, b?.slnt, t),
      fill: lerpDoubleNullable(a?.fill, b?.fill, t),
      hexp: lerpDoubleNullable(a?.hexp, b?.hexp, t),
    );
  }
}

class _TextGeometryPartial extends TextGeometryPartial {
  const _TextGeometryPartial({
    this.font,
    this.weight,
    this.size,
    this.tracking,
    this.lineHeight,
    this.wght,
    this.grad,
    this.wdth,
    this.rond,
    this.opsz,
    this.crsv,
    this.slnt,
    this.fill,
    this.hexp,
  });

  @override
  final List<String>? font;

  @override
  final double? weight;

  @override
  final double? size;

  @override
  final double? tracking;

  @override
  final double? lineHeight;

  @override
  final double? wght;

  @override
  final double? grad;

  @override
  final double? wdth;

  @override
  final double? rond;

  @override
  final double? opsz;

  @override
  final double? crsv;

  @override
  final double? slnt;

  @override
  final double? fill;

  @override
  final double? hexp;
}

abstract class TextGeometry extends TextGeometryPartial {
  const TextGeometry();

  const factory TextGeometry.from({
    required List<String> font,
    required double weight,
    required double size,
    required double tracking,
    required double lineHeight,
    required double wght,
    required double grad,
    required double wdth,
    required double rond,
    required double opsz,
    required double crsv,
    required double slnt,
    required double fill,
    required double hexp,
  }) = _TextGeometry;

  @override
  List<String> get font;

  @override
  double get weight;

  @override
  double get size;

  @override
  double get tracking;

  @override
  double get lineHeight;

  @override
  double get wght;

  @override
  double get grad;

  @override
  double get wdth;

  @override
  double get rond;

  @override
  double get opsz;

  @override
  double get crsv;

  @override
  double get slnt;

  @override
  double get fill;

  @override
  double get hexp;

  @override
  TextGeometry copyWith({
    List<String>? font,
    double? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) =>
      font != null ||
          weight != null ||
          size != null ||
          tracking != null ||
          lineHeight != null ||
          wght != null ||
          grad != null ||
          wdth != null ||
          rond != null ||
          opsz != null ||
          crsv != null ||
          slnt != null ||
          fill != null ||
          hexp != null
      ? .from(
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
        )
      : this;

  @override
  TextGeometry mergeWith({
    List<String>? font,
    double? weight,
    double? size,
    double? tracking,
    double? lineHeight,
    double? wght,
    double? grad,
    double? wdth,
    double? rond,
    double? opsz,
    double? crsv,
    double? slnt,
    double? fill,
    double? hexp,
  }) =>
      font != null ||
          weight != null ||
          size != null ||
          tracking != null ||
          lineHeight != null ||
          wght != null ||
          grad != null ||
          wdth != null ||
          rond != null ||
          opsz != null ||
          crsv != null ||
          slnt != null ||
          fill != null ||
          hexp != null
      ? .from(
          font: font != null ? [...font, ...this.font] : this.font,
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
        )
      : this;

  @override
  TextGeometry merge(TextGeometryPartial? other) => other != null
      ? mergeWith(
          font: other.font,
          weight: other.weight,
          size: other.size,
          tracking: other.tracking,
          lineHeight: other.lineHeight,
          wght: other.wght,
          grad: other.grad,
          wdth: other.wdth,
          rond: other.rond,
          opsz: other.opsz,
          crsv: other.crsv,
          slnt: other.slnt,
          fill: other.fill,
          hexp: other.hexp,
        )
      : this;

  @override
  Map<String, double> get variableFontAxes => {
    _VariableFontAxis.wght: wght,
    _VariableFontAxis.grad: grad,
    _VariableFontAxis.wdth: wdth,
    _VariableFontAxis.rond: rond,
    _VariableFontAxis.opsz: opsz,
    _VariableFontAxis.crsv: crsv,
    _VariableFontAxis.slnt: slnt,
    _VariableFontAxis.fill: fill,
    _VariableFontAxis.hexp: hexp,
  };

  @override
  List<FontVariation> get fontVariations => [
    _VariableFontAxis.wght.toFontVariation(wght),
    _VariableFontAxis.grad.toFontVariation(grad),
    _VariableFontAxis.wdth.toFontVariation(wdth),
    _VariableFontAxis.rond.toFontVariation(rond),
    _VariableFontAxis.opsz.toFontVariation(opsz),
    _VariableFontAxis.crsv.toFontVariation(crsv),
    _VariableFontAxis.slnt.toFontVariation(slnt),
    _VariableFontAxis.fill.toFontVariation(fill),
    _VariableFontAxis.hexp.toFontVariation(hexp),
  ];

  @override
  TextStyle toTextStyle({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextBaseline? textBaseline,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    TextOverflow? overflow,
  }) {
    final fontFamily = font.first;
    final fontFamilyFallback = font.skip(1).toList();
    return TextStyle(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: size,
      fontWeight: _closestFontWeightTo(weight),
      fontStyle: fontStyle,
      letterSpacing: tracking,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: lineHeight / size,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations != null && fontVariations.isNotEmpty
          ? [...this.fontVariations, ...fontVariations]
          : this.fontVariations,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: null,
      overflow: overflow,
    );
  }

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(IterableProperty("font", font))
      ..add(DoubleProperty("weight", weight))
      ..add(DoubleProperty("size", size))
      ..add(DoubleProperty("tracking", tracking))
      ..add(DoubleProperty("lineHeight", lineHeight))
      ..add(DoubleProperty("wght", wght))
      ..add(DoubleProperty("grad", grad))
      ..add(DoubleProperty("wdth", wdth))
      ..add(DoubleProperty("rond", rond))
      ..add(DoubleProperty("opsz", opsz))
      ..add(DoubleProperty("crsv", crsv))
      ..add(DoubleProperty("slnt", slnt))
      ..add(DoubleProperty("fill", fill))
      ..add(DoubleProperty("hexp", hexp));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TextGeometry &&
          _stringListEquality.equals(font, other.font) &&
          weight == other.weight &&
          size == other.size &&
          tracking == other.tracking &&
          lineHeight == other.lineHeight &&
          wght == other.wght &&
          grad == other.grad &&
          wdth == other.wdth &&
          rond == other.rond &&
          opsz == other.opsz &&
          crsv == other.crsv &&
          slnt == other.slnt &&
          fill == other.fill &&
          hexp == other.hexp;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _stringListEquality.hash(font),
    weight,
    size,
    tracking,
    lineHeight,
    wght,
    grad,
    wdth,
    rond,
    opsz,
    crsv,
    slnt,
    fill,
    hexp,
  );

  static TextGeometry lerp(TextGeometry a, TextGeometry b, double t) {
    if (identical(a, b)) return a;
    return .from(
      font: t < 0.5 ? a.font : b.font,
      weight: lerpDouble(a.weight, b.weight, t),
      size: lerpDouble(a.size, b.size, t),
      lineHeight: lerpDouble(a.lineHeight, b.lineHeight, t),
      tracking: lerpDouble(a.tracking, b.tracking, t),
      wght: lerpDouble(a.wght, b.wght, t),
      grad: lerpDouble(a.grad, b.grad, t),
      wdth: lerpDouble(a.wdth, b.wdth, t),
      rond: lerpDouble(a.rond, b.rond, t),
      opsz: lerpDouble(a.opsz, b.opsz, t),
      crsv: lerpDouble(a.crsv, b.crsv, t),
      slnt: lerpDouble(a.slnt, b.slnt, t),
      fill: lerpDouble(a.fill, b.fill, t),
      hexp: lerpDouble(a.hexp, b.hexp, t),
    );
  }
}

class _TextGeometry extends TextGeometry {
  const _TextGeometry({
    required this.font,
    required this.weight,
    required this.size,
    required this.tracking,
    required this.lineHeight,
    required this.wght,
    required this.grad,
    required this.wdth,
    required this.rond,
    required this.opsz,
    required this.crsv,
    required this.slnt,
    required this.fill,
    required this.hexp,
  });

  @override
  final List<String> font;

  @override
  final double weight;

  @override
  final double size;

  @override
  final double tracking;

  @override
  final double lineHeight;

  @override
  final double wght;

  @override
  final double grad;

  @override
  final double wdth;

  @override
  final double rond;

  @override
  final double opsz;

  @override
  final double crsv;

  @override
  final double slnt;

  @override
  final double fill;

  @override
  final double hexp;
}
