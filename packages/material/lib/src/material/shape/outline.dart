import 'dart:math' as math;

import 'package:material/src/material/flutter.dart';

abstract class OutlinePartial with Diagnosticable {
  const OutlinePartial();

  const factory OutlinePartial.from({
    double? width,
    double? alignment,
    Color? color,
  }) = _OutlinePartial;

  double? get width;
  double? get alignment;
  Color? get color;

  OutlinePartial copy() => copyWith();

  OutlinePartial copyWith({double? width, double? alignment, Color? color}) =>
      .from(
        width: width ?? this.width,
        alignment: alignment ?? this.alignment,
        color: color ?? this.color,
      );

  OutlinePartial maybeCopyWith({
    double? width,
    double? alignment,
    Color? color,
  }) => width != null || alignment != null || color != null
      ? copyWith(width: width, alignment: alignment, color: color)
      : this;

  OutlinePartial merge(OutlinePartial? other) => other != null
      ? copyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : copy();

  OutlinePartial maybeMerge(OutlinePartial? other) => other != null
      ? maybeCopyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : this;

  bool get isEmpty => width == null && alignment == null && color == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete => width != null && alignment != null && color != null;

  Outline? get asConcrete =>
      isConcrete ? _OutlinePartialAsConcrete(this) : null;

  OutlinePartial scale(double t) => switch (width) {
    final width? => copyWith(width: math.max(width * t, 0.0)),
    null => this,
  };

  BorderSide toBorderSide() {
    final resolvedWidth = width ?? 0.0;
    final resolvedStrokeAlign = alignment ?? Outline.alignmentInside;
    final resolvedColor = color ?? Colors.transparent;
    return BorderSide(
      style: resolvedWidth > 0.0 ? .solid : .none,
      width: resolvedWidth,
      strokeAlign: resolvedStrokeAlign,
      color: resolvedWidth > 0.0 ? resolvedColor : Colors.transparent,
    );
  }

  OutlinedBorder apply(OutlinedBorder shape) {
    final width = this.width;
    final side = shape.side.copyWith(
      style: width != null
          ? width > 0.0
                ? .solid
                : .none
          : null,
      width: width,
      strokeAlign: alignment,
      color: color,
    );
    return shape.copyWith(side: side);
  }

  double? get inset {
    final width = this.width;
    final alignment = this.alignment;
    return width != null && alignment != null
        ? width * (1.0 - (1.0 + alignment) / 2.0)
        : null;
  }

  double? get outset {
    final width = this.width;
    final alignment = this.alignment;
    return width != null && alignment != null
        ? width * (1.0 + alignment) / 2.0
        : null;
  }

  double? get offset {
    final width = this.width;
    final alignment = this.alignment;
    return width != null && alignment != null ? width * alignment : null;
  }

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("width", width, defaultValue: null))
      ..add(DoubleProperty("alignment", alignment, defaultValue: null))
      ..add(ColorProperty("color", color, defaultValue: null));
  }

  static OutlinePartial combine(OutlinePartial a, OutlinePartial? b) =>
      a.merge(b);

  static OutlinePartial maybeCombine(OutlinePartial a, OutlinePartial? b) =>
      a.maybeMerge(b);

  static OutlinePartial? lerp(OutlinePartial? a, OutlinePartial? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    return .from(
      width: lerpDoubleNullable(a.width, b.width, t),
      alignment: lerpDoubleNullable(a.alignment, b.alignment, t),
      color: Color.lerp(a.color, b.color, t),
    );
  }
}

class _OutlinePartial extends OutlinePartial {
  const _OutlinePartial({this.width, this.alignment, this.color})
    : assert(width == null || width >= 0.0);

  @override
  final double? width;

  @override
  final double? alignment;

  @override
  final Color? color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _OutlinePartial &&
          width == other.width &&
          alignment == other.alignment &&
          color == other.color;

  @override
  int get hashCode => Object.hash(width, alignment, color);
}

class _OutlinePartialAsConcrete extends Outline {
  _OutlinePartialAsConcrete(OutlinePartial value)
    : assert(value.isConcrete),
      _value = value;

  final OutlinePartial _value;

  @override
  double get width => _value.width!;

  @override
  double get alignment => _value.alignment!;

  @override
  Color get color => _value.color!;

  @override
  Outline copyWith({double? width, double? alignment, Color? color}) =>
      _OutlinePartialAsConcrete(
        _value.copyWith(width: width, alignment: alignment, color: color),
      );

  @override
  Outline maybeCopyWith({double? width, double? alignment, Color? color}) =>
      width != null && alignment != null && color != null
      ? .from(width: width, alignment: alignment, color: color)
      : width != null || alignment != null || color != null
      ? copyWith(width: width, alignment: alignment, color: color)
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _OutlinePartialAsConcrete && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

class OutlinePartialTween extends Tween<OutlinePartial?> {
  OutlinePartialTween({super.begin, super.end});

  @override
  OutlinePartial? lerp(double t) => .lerp(begin, end, t);
}

abstract class Outline extends OutlinePartial {
  const Outline();

  const factory Outline.from({double width, double alignment, Color color}) =
      _Outline;

  @override
  double get width;

  @override
  double get alignment;

  @override
  Color get color;

  @override
  Outline copy() => copyWith();

  @override
  Outline copyWith({double? width, double? alignment, Color? color}) => .from(
    width: width ?? this.width,
    alignment: alignment ?? this.alignment,
    color: color ?? this.color,
  );

  @override
  Outline maybeCopyWith({double? width, double? alignment, Color? color}) =>
      width != null || alignment != null || color != null
      ? copyWith(width: width, alignment: alignment, color: color)
      : this;

  @override
  Outline merge(OutlinePartial? other) => other != null
      ? copyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : copy();

  @override
  Outline maybeMerge(OutlinePartial? other) => other != null
      ? maybeCopyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  Outline get asConcrete => this;

  @override
  Outline scale(double t) => copyWith(width: math.max(width * t, 0.0));

  @override
  BorderSide toBorderSide() => BorderSide(
    style: width > 0.0 ? .solid : .none,
    width: width,
    strokeAlign: alignment,
    color: width > 0.0 ? color : Colors.transparent,
  );

  @override
  OutlinedBorder apply(OutlinedBorder shape) => shape.copyWith(
    side: shape.side.copyWith(
      style: width > 0.0 ? .solid : .none,
      width: width,
      strokeAlign: alignment,
      color: color,
    ),
  );

  @override
  double get inset => width * (1.0 - (1.0 + alignment) / 2.0);

  @override
  double get outset => width * (1.0 + alignment) / 2.0;

  @override
  double get offset => width * alignment;

  // TODO: consider adding default values (except for alignment?)
  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("alignment", alignment))
      ..add(ColorProperty("color", color));
  }

  /// The border is drawn fully inside of the border path.
  ///
  /// This is a constant for use with [alignment].
  ///
  /// This is the default value for [alignment].
  static const double alignmentInside = -1.0;

  /// The border is drawn on the center of the border path, with half of the
  /// [width] on the inside, and the other half on the outside of
  /// the path.
  ///
  /// This is a constant for use with [alignment].
  static const double alignmentCenter = 0.0;

  /// The border is drawn on the outside of the border path.
  ///
  /// This is a constant for use with [alignment].
  static const double alignmentOutside = 1.0;

  static Outline combine(Outline a, OutlinePartial? b) => a.merge(b);

  static Outline maybeCombine(Outline a, OutlinePartial? b) => a.maybeMerge(b);

  static Outline lerp(Outline a, Outline b, double t) {
    if (identical(a, b)) return a;
    return .from(
      width: lerpDouble(a.width, b.width, t),
      alignment: lerpDouble(a.alignment, b.alignment, t),
      color: Color.lerp(a.color, b.color, t)!,
    );
  }
}

class _Outline extends Outline {
  const _Outline({
    this.width = 0.0,
    this.alignment = Outline.alignmentInside,
    this.color = Colors.transparent,
  }) : assert(width >= 0.0);

  @override
  final double width;

  @override
  final double alignment;

  @override
  final Color color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Outline &&
          width == other.width &&
          alignment == other.alignment &&
          color == other.color;

  @override
  int get hashCode => Object.hash(width, alignment, color);
}

class OutlineTween extends Tween<Outline?> {
  OutlineTween({super.begin, super.end});

  @override
  Outline? lerp(double t) {
    final a = begin;
    final b = end;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    return .lerp(a, b, t);
  }
}
