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

  OutlinePartial copyWith({double? width, double? alignment, Color? color}) =>
      width != null || alignment != null || color != null
      ? .from(
          width: width ?? this.width,
          alignment: alignment ?? this.alignment,
          color: color ?? this.color,
        )
      : this;

  OutlinePartial merge(OutlinePartial? other) => other != null
      ? copyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : this;

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

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("width", width, defaultValue: null))
      ..add(DoubleProperty("alignment", alignment, defaultValue: null))
      ..add(ColorProperty("color", color, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is OutlinePartial &&
          width == other.width &&
          alignment == other.alignment &&
          color == other.color;

  @override
  int get hashCode => Object.hash(runtimeType, width, alignment, color);

  static OutlinePartial? lerp(OutlinePartial? a, OutlinePartial? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) {
      if (b == null) {
        return null;
      } else {
        return b.scale(t);
      }
    } else {
      if (b == null) {
        return a.scale(1.0 - t);
      } else {
        return .from(
          width: lerpDoubleNullable(a.width, b.width, t),
          alignment: lerpDoubleNullable(a.alignment, b.alignment, t),
          color: Color.lerp(a.color, b.color, t),
        );
      }
    }
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
  Outline copyWith({double? width, double? alignment, Color? color}) =>
      width != null || alignment != null || color != null
      ? .from(
          width: width ?? this.width,
          alignment: alignment ?? this.alignment,
          color: color ?? this.color,
        )
      : this;

  @override
  Outline merge(OutlinePartial? other) => other != null
      ? copyWith(
          width: other.width,
          alignment: other.alignment,
          color: other.color,
        )
      : this;

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

  // TODO(deminearchiver): consider adding default values (except for alignment?)
  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("alignment", alignment))
      ..add(ColorProperty("color", color));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is Outline &&
          width == other.width &&
          alignment == other.alignment &&
          color == other.color;

  @override
  int get hashCode => Object.hash(runtimeType, width, alignment, color);

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

  static Outline lerp(Outline a, Outline b, double t) {
    if (identical(a, b)) return a;
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    return .from(
      width: math.max(lerpDouble(a.width, b.width, t), 0.0),
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
}

class OutlinePartialTween extends Tween<OutlinePartial?> {
  OutlinePartialTween({super.begin, super.end});

  @override
  OutlinePartial? lerp(double t) => .lerp(begin, end, t);
}

class OutlineTween extends Tween<Outline?> {
  OutlineTween({super.begin, super.end});

  @override
  Outline? lerp(double t) {
    final a = begin;
    final b = end;
    if (identical(a, b)) return a;
    if (a == null) {
      if (b == null) {
        return null;
      } else {
        return b.scale(t);
      }
    } else {
      if (b == null) {
        return a.scale(1.0 - t);
      } else {
        return .lerp(a, b, t);
      }
    }
  }
}
