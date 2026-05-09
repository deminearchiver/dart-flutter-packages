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
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    double? size,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) = _IconThemeDataDefaults;

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
    required this.fill,
    required this.weight,
    required this.grade,
    required this.opticalSize,
    required this.size,
    required this.color,
    required this.opacity,
    required this.shadows,
    required this.applyTextScaling,
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

typedef IconThemeResolver = ThemeResolver<IconThemeDataPartial>;

typedef IconThemeResolverCallback = ThemeResolverCallback<IconThemeDataPartial>;

class _IconThemeResolver extends CombiningThemeResolver<IconThemeDataPartial> {
  const _IconThemeResolver(super.a, super.b);

  @override
  IconThemeDataPartial combine(
    IconThemeDataPartial a,
    IconThemeDataPartial b,
  ) => a.merge(b);
}

abstract class IconTheme extends StatelessWidget implements ProxyWidget {
  const IconTheme._({super.key, required this.child});

  const factory IconTheme.withResolver({
    Key? key,
    required IconThemeResolver resolver,
    required Widget child,
  }) = _IconThemeWithResolver;

  const factory IconTheme.withCallback({
    Key? key,
    required IconThemeResolverCallback callback,
    required Widget child,
  }) = _IconThemeWithCallback;

  const factory IconTheme.withData({
    Key? key,
    required IconThemeDataPartial data,
    required Widget child,
  }) = _IconThemeWithData;

  IconThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _IconTheme.maybeResolverOf(context);
    return _IconTheme(
      resolver: inherited != null
          ? _IconThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static IconThemeData _fallbackOf(BuildContext context) =>
      .defaults(colorTheme: ColorTheme.of(context));

  static _InheritedDataUnion<IconThemeData>? _modernDataOf(
    BuildContext context,
  ) {
    final element = context
        .getElementForInheritedWidgetOfExactType<_IconTheme>();
    final widget = context.dependOnInheritedWidgetOfExactType<_IconTheme>();
    if (element == null || widget == null) return null;
    final data = widget.resolver.resolve(context);
    return _InheritedDataUnion(
      value: ._defaults(
        colorTheme: ColorTheme.of(context),
        fill: data.fill,
        weight: data.weight,
        grade: data.grade,
        opticalSize: data.opticalSize,
        size: data.size,
        color: data.color,
        opacity: data.opacity,
        shadows: data.shadows,
        applyTextScaling: data.applyTextScaling,
      ),
      depth: element.depth,
    );
  }

  static _InheritedDataUnion<IconThemeDataLegacy>? _legacyDataOf(
    BuildContext context,
  ) {
    final element = context
        .getElementForInheritedWidgetOfExactType<IconThemeLegacy>();
    final widget = context
        .dependOnInheritedWidgetOfExactType<IconThemeLegacy>();
    if (element == null || widget == null) return null;
    return _InheritedDataUnion(value: widget.data, depth: element.depth);
  }

  static IconThemeData? _maybeOfWithFallback(
    BuildContext context,
    IconThemeData fallbackTheme,
    bool allowLegacy,
  ) {
    final modernData = _modernDataOf(context);
    final legacyData = _legacyDataOf(context);

    // If only modern theme is allowed, return it if exists, or null.
    if (!allowLegacy) return modernData?.value;

    if (modernData != null &&
        (legacyData == null || modernData.depth >= legacyData.depth)) {
      // If modern theme exists and it is closer than legacy, return it.
      return modernData.value;
    }

    // If legacy theme exists, merge it with fallback, and return the result.
    return legacyData != null
        ? fallbackTheme.merge(.fromLegacy(legacyData.value.resolve(context)))
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

class _IconThemeWithResolver extends IconTheme {
  const _IconThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final IconThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<IconThemeResolver>("resolver", resolver),
    );
  }
}

class _IconThemeWithCallback extends IconTheme {
  const _IconThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final IconThemeResolverCallback callback;

  @override
  IconThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<IconThemeResolverCallback>("callback", callback),
    );
  }
}

class _IconThemeWithData extends IconTheme {
  const _IconThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final IconThemeDataPartial data;

  @override
  IconThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconThemeDataPartial>("data", data));
  }
}

class _IconTheme extends InheritedTheme {
  const _IconTheme({super.key, required this.resolver, required super.child});

  final IconThemeResolver resolver;

  @override
  bool updateShouldNotify(_IconTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _IconTheme(resolver: resolver, child: child);

  static IconThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_IconTheme>()?.resolver;
}

extension type const _InheritedDataUnion<T extends Object?>._(
  (T value, int depth) _
)
    implements Object {
  const _InheritedDataUnion({required T value, required int depth})
    : this._((value, depth));

  T get value => _.$1;

  int get depth => _.$2;
}
