library;

export 'src/material/color/color_theme.dart';
export 'src/material/color/palette_theme.dart';

export 'src/material/icon/icon.dart';
export 'src/material/icon/icon_theme.dart';

export 'src/material/motion/duration_theme.dart';
export 'src/material/motion/easing_theme.dart';
export 'src/material/motion/spring_theme.dart';

export 'src/material/shape/corners_border.dart';
export 'src/material/shape/corners.dart';
export 'src/material/shape/shape_theme.dart';

export 'src/material/state/state.dart';
export 'src/material/state/state_theme.dart';

export 'src/material/typography/type_style.dart';
export 'src/material/typography/typeface_theme.dart';
export 'src/material/typography/typescale_theme.dart';

export 'src/material/elevation/elevation_theme.dart';

export 'src/material/focus_ring/focus_ring_theme.dart';
export 'src/material/focus_ring/focus_ring.dart';

export 'src/material/progress_indicator.dart';

export 'src/material/checkbox/checkbox.dart';
export 'src/material/checkbox/checkbox_theme.dart';

export 'src/material/radio_button/radio_button.dart';
export 'src/material/radio_button/radio_button_theme.dart';

export 'src/material/switch/switch.dart';
export 'src/material/switch/switch_theme.dart';

export 'src/material/window_size_class.dart';

export 'src/material/animation_extensions.dart';

export 'src/material/center_optically.dart';

export 'src/material/list/list_theme.dart';

// TODO: review after LoadingIndicator gets a custom implementation
export 'src/material/loading_indicator/loading_indicator.dart';
export 'src/material/loading_indicator/loading_indicator_theme.dart';

export 'src/material/custom_material.dart';

import 'dart:math' as math;

import 'package:material/src/material/flutter.dart';

/// Linearly interpolate between two integers.
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double lerpInt(int a, int b, double t) => a + (b - a) * t;

/// Linearly interpolate between two doubles.
///
/// Same as [lerpDoubleNullable] but specialized for non-null `double` type.
///
/// When `a` and `b` are equal or both NaN, `a` is returned.
/// Otherwise, `a`, `b`, and `t` are required to be finite,
/// and the result of `a + (b - a) * t` is returned.
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double lerpDouble(double a, double b, double t) {
  assert(a.isFinite, "Cannot interpolate between finite and non-finite values");
  assert(b.isFinite, "Cannot interpolate between finite and non-finite values");
  assert(t.isFinite, "t must be finite when interpolating between values");

  // This doesn't match lerpInt to preserve specific behaviors when dealing
  // with infinity and nan.
  return a * (1.0 - t) + b * t;
}

/// Linearly interpolate between two doubles, `a` and `b`,
/// by an extrapolation factor `t`.
///
/// When `a` and `b` are equal or both NaN, `a` is returned.
/// Otherwise, `a`, `b`, and `t` are required to be finite or null,
/// and the result of `a + (b - a) * t` is returned,
/// where nulls are defaulted to 0.0.
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double? lerpDoubleNullable(double? a, double? b, double t) {
  if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
    return a;
  }
  a ??= 0.0;
  b ??= 0.0;
  return lerpDouble(a, b, t);
}

extension PaintingContextExtension on PaintingContext {
  void withCanvasTransform(void Function(PaintingContext context) paint) {
    late int debugPreviousCanvasSaveCount;
    canvas.save();
    assert(() {
      debugPreviousCanvasSaveCount = canvas.getSaveCount();
      return true;
    }());

    paint(this);

    assert(() {
      // This isn't perfect. For example, we can't catch the case of
      // someone first restoring, then setting a transform or whatnot,
      // then saving.
      // If this becomes a real problem, we could add logic to the
      // Canvas class to lock the canvas at a particular save count
      // such that restore() fails if it would take the lock count
      // below that number.
      final int debugNewCanvasSaveCount = canvas.getSaveCount();
      if (debugNewCanvasSaveCount > debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.save() or canvas.saveLayer() at least "
            "${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount} more "
            "time${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.restore().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will probably result in a broken display.",
          ),
          ErrorHint(
            "You must pair each call to save()/saveLayer() with a later matching call to restore().",
          ),
        ]);
      }
      if (debugNewCanvasSaveCount < debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.restore() "
            "${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount} more "
            "time${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.save() or canvas.saveLayer().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will result in a broken display.",
          ),
          ErrorHint(
            "You should only call restore() if you first called save() or saveLayer().",
          ),
        ]);
      }
      return debugNewCanvasSaveCount == debugPreviousCanvasSaveCount;
    }());

    canvas.restore();
  }
}

extension CanvasExtension on Canvas {
  void withTransform(void Function(Canvas canvas) paint) {
    late int debugPreviousCanvasSaveCount;
    save();
    assert(() {
      debugPreviousCanvasSaveCount = getSaveCount();
      return true;
    }());

    paint(this);

    assert(() {
      // This isn't perfect. For example, we can't catch the case of
      // someone first restoring, then setting a transform or whatnot,
      // then saving.
      // If this becomes a real problem, we could add logic to the
      // Canvas class to lock the canvas at a particular save count
      // such that restore() fails if it would take the lock count
      // below that number.
      final int debugNewCanvasSaveCount = getSaveCount();
      if (debugNewCanvasSaveCount > debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.save() or canvas.saveLayer() at least "
            "${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount} more "
            "time${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.restore().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will probably result in a broken display.",
          ),
          ErrorHint(
            "You must pair each call to save()/saveLayer() with a later matching call to restore().",
          ),
        ]);
      }
      if (debugNewCanvasSaveCount < debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.restore() "
            "${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount} more "
            "time${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.save() or canvas.saveLayer().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will result in a broken display.",
          ),
          ErrorHint(
            "You should only call restore() if you first called save() or saveLayer().",
          ),
        ]);
      }
      return debugNewCanvasSaveCount == debugPreviousCanvasSaveCount;
    }());

    restore();
  }
}

extension OverlayChildLayoutInfoExtension on OverlayChildLayoutInfo {
  double get translationX => childPaintTransform.storage[12];
  double get translationY => childPaintTransform.storage[13];
  double get translationZ => childPaintTransform.storage[14];

  double get scaleX => childPaintTransform[0];
  double get scaleY => childPaintTransform[5];
  double get scaleZ => childPaintTransform[10];
}

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
    final resolvedStrokeAlign = alignment ?? BorderSide.strokeAlignInside;
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
    this.alignment = BorderSide.strokeAlignInside,
    this.color = Colors.transparent,
  }) : assert(width > 0.0);

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

class OutlinedBorderTween extends Tween<OutlinedBorder?> {
  /// Creates a [OutlinedBorderTween] tween.
  ///
  /// the [begin] and [end] properties may be null;
  /// see [OutlinedBorder.lerp] for the null handling semantics.
  OutlinedBorderTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  OutlinedBorder? lerp(double t) => OutlinedBorder.lerp(begin, end, t);
}
