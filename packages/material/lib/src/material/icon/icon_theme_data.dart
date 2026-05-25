part of 'icon_theme.dart';

abstract class IconThemeData extends IconThemeDataPartial {
  const IconThemeData();

  const factory IconThemeData.from({
    required double roundness,
    required double fill,
    required double weight,
    required double grade,
    required double opticalSize,
    required double size,
    required Color color,
    required double opacity,
    required List<Shadow> shadows,
    required bool applyTextScaling,
  }) = _IconThemeData;

  const factory IconThemeData.defaults({required ColorThemeData colorTheme}) =
      _IconThemeDataDefaults;

  const factory IconThemeData._defaults({
    required ColorThemeData colorTheme,
    IconThemeDataPartial? overrides,
  }) = _IconThemeDataDefaults;

  @override
  double get roundness;

  @override
  double get fill;

  @override
  double get weight;

  @override
  double get grade;

  @override
  double get opticalSize;

  @override
  double get size;

  @override
  Color get color;

  @override
  double get opacity;

  @override
  List<Shadow> get shadows;

  @override
  bool get applyTextScaling;

  @override
  IconThemeData copy() => copyWith();

  @override
  IconThemeData copyWith({
    double? roundness,
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
    roundness: roundness ?? this.roundness,
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

  @override
  IconThemeData maybeCopyWith({
    double? roundness,
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
      roundness != null ||
          fill != null ||
          weight != null ||
          grade != null ||
          opticalSize != null ||
          size != null ||
          color != null ||
          opacity != null ||
          shadows != null ||
          applyTextScaling != null
      ? .from(
          roundness: roundness ?? this.roundness,
          fill: fill ?? this.fill,
          weight: weight ?? this.weight,
          grade: grade ?? this.grade,
          opticalSize: opticalSize ?? this.opticalSize,
          size: size ?? this.size,
          color: color ?? this.color,
          opacity: opacity ?? this.opacity,
          shadows: shadows ?? this.shadows,
          applyTextScaling: applyTextScaling ?? this.applyTextScaling,
        )
      : this;

  @override
  IconThemeData merge(IconThemeDataPartial? other) => other != null
      ? copyWith(
          roundness: other.roundness,
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

  @override
  IconThemeData maybeMerge(IconThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          roundness: other.roundness,
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

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  IconThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("roundness", roundness, defaultValue: 50.0))
      ..add(DoubleProperty("fill", fill, defaultValue: 0.0))
      ..add(DoubleProperty("weight", weight, defaultValue: 400.0))
      ..add(DoubleProperty("grade", grade, defaultValue: 0.0))
      ..add(DoubleProperty("opticalSize", opticalSize, defaultValue: 24.0))
      ..add(DoubleProperty("size", size, defaultValue: 24.0))
      ..add(ColorProperty("color", color))
      ..add(DoubleProperty("opacity", opacity, defaultValue: 1.0))
      ..add(
        IterableProperty<Shadow>(
          "shadows",
          shadows,
          defaultValue: const <Shadow>[],
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          "applyTextScaling",
          applyTextScaling,
          defaultValue: false,
        ),
      );
  }

  static IconThemeData lerp(IconThemeData a, IconThemeData b, double t) =>
      identical(a, b) || a == b
      ? a
      : .from(
          roundness: lerpDouble(a.roundness, b.roundness, t),
          fill: lerpDouble(a.fill, b.fill, t),
          weight: lerpDouble(a.weight, b.weight, t),
          grade: lerpDouble(a.grade, b.grade, t),
          opticalSize: lerpDouble(a.opticalSize, b.opticalSize, t),
          size: lerpDouble(a.size, b.size, t),
          color: Color.lerp(a.color, b.color, t)!,
          opacity: lerpDouble(a.opacity, b.opacity, t),
          shadows: Shadow.lerpList(a.shadows, b.shadows, t)!,
          applyTextScaling: t < 0.5 ? a.applyTextScaling : b.applyTextScaling,
        );
}

final class _IconThemeData extends IconThemeData {
  const _IconThemeData({
    required this.roundness,
    required this.fill,
    required this.weight,
    required this.grade,
    required this.opticalSize,
    required this.size,
    required this.color,
    required this.opacity,
    required this.shadows,
    required this.applyTextScaling,
  }) : assert(0.0 <= roundness && roundness <= 100.0),
       assert(0.0 <= fill && fill <= 1.0),
       assert(1.0 <= weight && weight <= 1000.0),
       assert(0.0 < opticalSize),
       assert(0.0 <= opacity && opacity <= 1.0);

  @override
  final double roundness;

  @override
  final double fill;

  @override
  final double weight;

  @override
  final double grade;

  @override
  final double opticalSize;

  @override
  final double size;

  @override
  final Color color;

  @override
  final double opacity;

  @override
  final List<Shadow> shadows;

  @override
  final bool applyTextScaling;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _IconThemeData &&
          roundness == other.roundness &&
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
    roundness,
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

final class _IconThemeDataDefaults extends IconThemeData {
  const _IconThemeDataDefaults({
    required ColorThemeData colorTheme,
    IconThemeDataPartial? overrides,
  }) : _colorTheme = colorTheme,
       _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;

  final IconThemeDataPartial _overrides;

  @override
  double get roundness => _overrides.roundness ?? 50.0;

  @override
  double get fill => _overrides.fill ?? 0.0;

  @override
  double get weight => _overrides.weight ?? 400.0;

  @override
  double get grade => _overrides.grade ?? 0.0;

  @override
  double get opticalSize => _overrides.opticalSize ?? 24.0;

  @override
  double get size => _overrides.size ?? 24.0;

  @override
  Color get color => _overrides.color ?? _colorTheme.onSurface;

  @override
  double get opacity => _overrides.opacity ?? 1.0;

  @override
  List<Shadow> get shadows => _overrides.shadows ?? const [];

  @override
  bool get applyTextScaling => _overrides.applyTextScaling ?? false;

  @override
  IconThemeData copyWith({
    double? roundness,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) => _IconThemeDataDefaults(
    colorTheme: _colorTheme,
    overrides: _overrides.copyWith(
      roundness: roundness,
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
    double? roundness,
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
      roundness != null &&
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
          roundness: roundness,
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
      : roundness != null ||
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
          roundness: roundness,
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
      other is _IconThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_colorTheme, _overrides);
}

class IconThemeDataTween extends Tween<IconThemeData?> {
  IconThemeDataTween({super.begin, super.end});

  @override
  IconThemeData? lerp(double t) {
    final a = begin;
    final b = end;
    if (identical(a, b) || a == b) return a;
    return .from(
      roundness: lerpDoubleNullable(a?.roundness, b?.roundness, t)!,
      fill: lerpDoubleNullable(a?.fill, b?.fill, t)!,
      weight: lerpDoubleNullable(a?.weight, b?.weight, t)!,
      grade: lerpDoubleNullable(a?.grade, b?.grade, t)!,
      opticalSize: lerpDoubleNullable(a?.opticalSize, b?.opticalSize, t)!,
      size: lerpDoubleNullable(a?.size, b?.size, t)!,
      color: Color.lerp(a?.color, b?.color, t)!,
      opacity: lerpDoubleNullable(a?.opacity, b?.opacity, t)!,
      shadows: Shadow.lerpList(a?.shadows, b?.shadows, t)!,
      applyTextScaling: t < 0.5 ? a!.applyTextScaling : b!.applyTextScaling,
    );
  }
}
