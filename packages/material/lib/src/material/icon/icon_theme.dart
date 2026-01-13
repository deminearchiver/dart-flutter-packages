import 'package:material/src/material/flutter.dart';
import 'package:flutter/material.dart' as flutter;

typedef IconThemeLegacy = flutter.IconTheme;
typedef IconThemeDataLegacy = flutter.IconThemeData;

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

  IconThemeDataPartial copyWith({
    covariant double? fill,
    covariant double? weight,
    covariant double? grade,
    covariant double? opticalSize,
    covariant double? size,
    covariant Color? color,
    covariant double? opacity,
    covariant List<Shadow>? shadows,
    covariant bool? applyTextScaling,
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
      ? .from(
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

  IconThemeDataPartial mergeWith({
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
      ? .from(
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

  IconThemeDataPartial merge(IconThemeDataPartial? other) => other != null
      ? mergeWith(
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is IconThemeDataPartial &&
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
    runtimeType,
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

class _IconThemeDataPartial extends IconThemeDataPartial {
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
}

abstract class IconThemeData extends IconThemeDataPartial {
  const IconThemeData();

  const factory IconThemeData.from({
    double fill,
    double weight,
    double grade,
    double opticalSize,
    double size,
    required Color color,
    double opacity,
    List<Shadow> shadows,
    bool applyTextScaling,
  }) = _IconThemeData;

  const factory IconThemeData.fallback({required ColorThemeData colorTheme}) =
      _IconThemeDataDefaults;

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
  IconThemeData copyWith({
    covariant double? fill,
    covariant double? weight,
    covariant double? grade,
    covariant double? opticalSize,
    covariant double? size,
    covariant Color? color,
    covariant double? opacity,
    covariant List<Shadow>? shadows,
    covariant bool? applyTextScaling,
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
      ? .from(
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
  IconThemeData mergeWith({
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
      ? .from(
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
      ? mergeWith(
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
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is IconThemeData &&
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
    runtimeType,
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

  static IconThemeData lerp(IconThemeData a, IconThemeData b, double t) =>
      identical(a, b) || a == b
      ? a
      : .from(
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

class _IconThemeData extends IconThemeData {
  const _IconThemeData({
    this.fill = 0.0,
    this.weight = 400.0,
    this.grade = 0.0,
    this.opticalSize = 24.0,
    this.size = 24.0,
    required this.color,
    this.opacity = 1.0,
    this.shadows = const [],
    this.applyTextScaling = false,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);

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
}

class _IconThemeDataDefaults extends IconThemeData {
  const _IconThemeDataDefaults({
    required ColorThemeData colorTheme,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) : assert(opacity == null || (opacity >= 0.0 && opacity <= 1.0)),
       _colorTheme = colorTheme,
       _fill = fill,
       _weight = weight,
       _grade = grade,
       _opticalSize = opticalSize,
       _size = size,
       _color = color,
       _opacity = opacity,
       _shadows = shadows,
       _applyTextScaling = applyTextScaling;

  final ColorThemeData _colorTheme;
  final double? _fill;
  final double? _weight;
  final double? _grade;
  final double? _opticalSize;
  final double? _size;
  final Color? _color;
  final double? _opacity;
  final List<Shadow>? _shadows;
  final bool? _applyTextScaling;

  @override
  double get fill => _fill ?? 0.0;

  @override
  double get weight => _weight ?? 400.0;

  @override
  double get grade => _grade ?? 0.0;

  @override
  double get opticalSize => _opticalSize ?? 24.0;

  @override
  double get size => _size ?? 24.0;

  @override
  Color get color => _color ?? _colorTheme.onSurface;

  @override
  double get opacity => _opacity ?? 1.0;

  @override
  List<Shadow> get shadows => _shadows ?? const [];

  @override
  bool get applyTextScaling => _applyTextScaling ?? false;

  @override
  IconThemeData copyWith({
    covariant double? fill,
    covariant double? weight,
    covariant double? grade,
    covariant double? opticalSize,
    covariant double? size,
    covariant Color? color,
    covariant double? opacity,
    covariant List<Shadow>? shadows,
    covariant bool? applyTextScaling,
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
      : _IconThemeDataDefaults(
          colorTheme: _colorTheme,
          fill: fill ?? _fill,
          weight: weight ?? _weight,
          grade: grade ?? _grade,
          opticalSize: opticalSize ?? _opticalSize,
          size: size ?? _size,
          color: color ?? _color,
          opacity: opacity ?? _opacity,
          shadows: shadows ?? _shadows,
          applyTextScaling: applyTextScaling ?? _applyTextScaling,
        );

  @override
  IconThemeData mergeWith({
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
    fill: fill ?? _fill,
    weight: weight ?? _weight,
    grade: grade ?? _grade,
    opticalSize: opticalSize ?? _opticalSize,
    size: size ?? _size,
    color: color ?? _color,
    opacity: opacity ?? _opacity,
    shadows: shadows ?? _shadows,
    applyTextScaling: applyTextScaling ?? _applyTextScaling,
  );

  @override
  IconThemeData merge(IconThemeDataPartial? other) => other != null
      ? mergeWith(
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _IconThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _fill == other._fill &&
          _weight == other._weight &&
          _grade == other._grade &&
          _opticalSize == other._opticalSize &&
          _size == other._size &&
          _color == other._color &&
          _opacity == other._opacity &&
          _shadows == other._shadows &&
          _applyTextScaling == other._applyTextScaling;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorTheme,
    _fill,
    _weight,
    _grade,
    _opticalSize,
    _size,
    _color,
    _opacity,
    _shadows,
    _applyTextScaling,
  );
}

class IconThemeDataPartialTween extends Tween<IconThemeDataPartial?> {
  IconThemeDataPartialTween({super.begin, super.end});

  @override
  IconThemeDataPartial? lerp(double t) => .lerp(begin, end, t);
}

class IconThemeDataTween extends Tween<IconThemeData?> {
  IconThemeDataTween({super.begin, super.end});

  @override
  IconThemeData? lerp(double t) {
    final a = begin;
    final b = end;
    if (identical(a, b) || a == b) return a;
    return .from(
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

class IconTheme extends InheritedTheme {
  const IconTheme({super.key, required this.data, required super.child});

  final IconThemeData data;

  @override
  bool updateShouldNotify(IconTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      IconTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required IconThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        IconTheme(key: key, data: of(context).merge(data), child: child),
  );

  static IconThemeData _fallbackOf(BuildContext context) =>
      .fallback(colorTheme: ColorTheme.of(context));

  static _InheritedDataUnion<IconThemeData>? _modernDataOf(
    BuildContext context,
  ) => switch ((
    context.getElementForInheritedWidgetOfExactType<IconTheme>(),
    context.dependOnInheritedWidgetOfExactType<IconTheme>()?.data,
  )) {
    (final element?, final theme?) => _InheritedDataUnion(
      element: element,
      theme: theme,
    ),
    _ => null,
  };

  static _InheritedDataUnion<IconThemeDataLegacy>? _legacyDataOf(
    BuildContext context,
  ) => switch ((
    context.getElementForInheritedWidgetOfExactType<IconThemeLegacy>(),
    context.dependOnInheritedWidgetOfExactType<IconThemeLegacy>()?.data,
  )) {
    (final element?, final theme?) => _InheritedDataUnion(
      element: element,
      theme: theme,
    ),
    _ => null,
  };

  static IconThemeData? _maybeOfWithFallback(
    BuildContext context,
    IconThemeData fallbackTheme,
    bool allowLegacy,
  ) {
    final modernData = _modernDataOf(context);
    final legacyData = _legacyDataOf(context);

    if (!allowLegacy) return modernData?.theme;

    if (modernData != null &&
        (legacyData == null ||
            modernData.element.depth >= legacyData.element.depth)) {
      return modernData.theme;
    }

    return legacyData != null
        ? fallbackTheme.merge(.fromLegacy(legacyData.theme.resolve(context)))
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

extension type const _InheritedDataUnion<T extends Object?>._(
  ({InheritedElement element, T theme}) _
) {
  const _InheritedDataUnion({
    required InheritedElement element,
    required T theme,
  }) : this._((element: element, theme: theme));

  InheritedElement get element => _.element;

  T get theme => _.theme;
}
