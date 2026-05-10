part of 'icon_theme.dart';

abstract class IconThemeDataPartial with Diagnosticable {
  const IconThemeDataPartial();

  const factory IconThemeDataPartial.from({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) = _IconThemeDataPartial;

  factory IconThemeDataPartial.fromLegacy(IconThemeDataLegacy legacy) => .from(
    fill: legacy.fill,
    weight: legacy.weight,
    grade: legacy.grade,
    opticalSize: legacy.opticalSize,
    size: legacy.size,
    color: legacy.color,
    opacity: legacy.opacity,
    shadows: legacy.shadows,
    applyTextScaling: legacy.applyTextScaling,
  );

  double? get fill;

  double? get weight;

  double? get grade;

  double? get opticalSize;

  double? get size;

  Color? get color;

  double? get opacity;

  List<Shadow>? get shadows;

  bool? get applyTextScaling;

  IconThemeDataPartial copy() => copyWith();

  IconThemeDataPartial copyWith({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) => .from(
    fill: fill ?? this.fill,
    weight: weight ?? this.weight,
    grade: grade ?? this.grade,
    opticalSize: opticalSize ?? this.opticalSize,
    size: size ?? this.size,
    color: color ?? this.color,
    opacity: opacity ?? this.opacity,
    shadows: shadows ?? this.shadows,
    applyTextScaling: applyTextScaling ?? this.applyTextScaling,
  );

  IconThemeDataPartial maybeCopyWith({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) =>
      fill != null ||
          weight != null ||
          grade != null ||
          opticalSize != null ||
          size != null ||
          color != null ||
          opacity != null ||
          shadows != null ||
          applyTextScaling != null
      ? copyWith(
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          size: size,
          color: color,
          opacity: opacity,
          shadows: shadows,
          applyTextScaling: applyTextScaling,
        )
      : this;

  IconThemeDataPartial merge(IconThemeDataPartial? other) => other != null
      ? copyWith(
          fill: other.fill,
          weight: other.weight,
          grade: other.grade,
          opticalSize: other.opticalSize,
          size: other.size,
          color: other.color,
          opacity: other.opacity,
          shadows: other.shadows,
          applyTextScaling: other.applyTextScaling,
        )
      : copy();

  IconThemeDataPartial maybeMerge(IconThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          fill: other.fill,
          weight: other.weight,
          grade: other.grade,
          opticalSize: other.opticalSize,
          size: other.size,
          color: other.color,
          opacity: other.opacity,
          shadows: other.shadows,
          applyTextScaling: other.applyTextScaling,
        )
      : this;

  bool get isEmpty =>
      fill == null &&
      weight == null &&
      grade == null &&
      opticalSize == null &&
      size == null &&
      color == null &&
      opacity == null &&
      shadows == null &&
      applyTextScaling == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete =>
      fill != null &&
      weight != null &&
      grade != null &&
      opticalSize != null &&
      size != null &&
      color != null &&
      opacity != null &&
      shadows != null &&
      applyTextScaling != null;

  IconThemeData? get asConcrete =>
      isConcrete ? _IconThemeDataPartialAsConcrete(this) : null;

  IconThemeDataLegacy toLegacy() => IconThemeDataLegacy(
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    size: size,
    color: color,
    opacity: opacity,
    shadows: shadows,
    applyTextScaling: applyTextScaling,
  );

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("fill", fill, defaultValue: null))
      ..add(DoubleProperty("weight", weight, defaultValue: null))
      ..add(DoubleProperty("grade", grade, defaultValue: null))
      ..add(DoubleProperty("opticalSize", opticalSize, defaultValue: null))
      ..add(DoubleProperty("size", size, defaultValue: null))
      ..add(ColorProperty("color", color, defaultValue: null))
      ..add(DoubleProperty("opacity", opacity, defaultValue: null))
      ..add(IterableProperty<Shadow>("shadows", shadows, defaultValue: null))
      ..add(
        DiagnosticsProperty<bool>(
          "applyTextScaling",
          applyTextScaling,
          defaultValue: null,
        ),
      );
  }

  static IconThemeDataPartial? lerp(
    IconThemeDataPartial? a,
    IconThemeDataPartial? b,
    double t,
  ) => identical(a, b) || a == b
      ? a
      : .from(
          fill: lerpDoubleNullable(a?.fill, b?.fill, t),
          weight: lerpDoubleNullable(a?.weight, b?.weight, t),
          grade: lerpDoubleNullable(a?.grade, b?.grade, t),
          opticalSize: lerpDoubleNullable(a?.opticalSize, b?.opticalSize, t),
          size: lerpDoubleNullable(a?.size, b?.size, t),
          color: Color.lerp(a?.color, b?.color, t),
          opacity: lerpDoubleNullable(a?.opacity, b?.opacity, t),
          shadows: Shadow.lerpList(a?.shadows, b?.shadows, t),
          applyTextScaling: t < 0.5 ? a?.applyTextScaling : b?.applyTextScaling,
        );
}

final class _IconThemeDataPartial extends IconThemeDataPartial {
  const _IconThemeDataPartial({
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.size,
    this.color,
    this.opacity,
    this.shadows,
    this.applyTextScaling,
  }) : assert(opacity == null || (opacity >= 0.0 && opacity <= 1.0));

  @override
  final double? fill;

  @override
  final double? weight;

  @override
  final double? grade;

  @override
  final double? opticalSize;

  @override
  final double? size;

  @override
  final Color? color;

  @override
  final double? opacity;

  @override
  final List<Shadow>? shadows;

  @override
  final bool? applyTextScaling;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _IconThemeDataPartial &&
          fill == other.fill &&
          weight == other.weight &&
          grade == other.grade &&
          opticalSize == other.opticalSize &&
          size == other.size &&
          color == other.color &&
          opacity == other.opacity &&
          shadows == other.shadows &&
          applyTextScaling == other.applyTextScaling;

  @override
  int get hashCode => Object.hash(
    fill,
    weight,
    grade,
    opticalSize,
    size,
    color,
    opacity,
    shadows,
    applyTextScaling,
  );
}

final class _IconThemeDataPartialAsConcrete extends IconThemeData {
  _IconThemeDataPartialAsConcrete(IconThemeDataPartial value)
    : assert(value.isConcrete),
      _value = value;

  final IconThemeDataPartial _value;

  @override
  double get fill => _value.fill!;

  @override
  double get weight => _value.weight!;

  @override
  double get grade => _value.grade!;

  @override
  double get opticalSize => _value.opticalSize!;

  @override
  double get size => _value.size!;

  @override
  Color get color => _value.color!;

  @override
  double get opacity => _value.opacity!;

  @override
  List<Shadow> get shadows => _value.shadows!;

  @override
  bool get applyTextScaling => _value.applyTextScaling!;

  @override
  IconThemeData copyWith({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) => _IconThemeDataPartialAsConcrete(
    _value.copyWith(
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      size: size,
      color: color,
      opacity: opacity,
      shadows: shadows,
      applyTextScaling: applyTextScaling,
    ),
  );

  @override
  IconThemeData maybeCopyWith({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) =>
      fill != null &&
          weight != null &&
          grade != null &&
          opticalSize != null &&
          size != null &&
          color != null &&
          opacity != null &&
          shadows != null &&
          applyTextScaling != null
      ? .from(
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          size: size,
          color: color,
          opacity: opacity,
          shadows: shadows,
          applyTextScaling: applyTextScaling,
        )
      : fill != null ||
            weight != null ||
            grade != null ||
            opticalSize != null ||
            size != null ||
            color != null ||
            opacity != null ||
            shadows != null ||
            applyTextScaling != null
      ? copyWith(
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          size: size,
          color: color,
          opacity: opacity,
          shadows: shadows,
          applyTextScaling: applyTextScaling,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _IconThemeDataPartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

class IconThemeDataPartialTween extends Tween<IconThemeDataPartial?> {
  IconThemeDataPartialTween({super.begin, super.end});

  @override
  IconThemeDataPartial? lerp(double t) => .lerp(begin, end, t);
}
