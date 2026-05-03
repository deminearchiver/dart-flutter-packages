library;

export 'src/material/extensions.dart';
export 'src/material/window_size_class.dart';
export 'src/material/outline.dart';
export 'src/material/center_optically.dart';
export 'src/material/custom_material.dart';

export 'src/material/color/color_theme.dart';
export 'src/material/color/palette_theme.dart';

export 'src/material/motion/duration_theme.dart';
export 'src/material/motion/easing_theme.dart';
export 'src/material/motion/spring_theme.dart';

export 'src/material/shape/corner.dart';
export 'src/material/shape/corners.dart';
export 'src/material/shape/corners_border.dart';
export 'src/material/shape/shape_theme.dart';

export 'src/material/state/state_focus_indicator_theme.dart';
export 'src/material/state/state_property.dart';
export 'src/material/state/state_theme.dart';
export 'src/material/state/states.dart';

export 'src/material/typography/text_geometry.dart';
export 'src/material/typography/typeface_theme.dart';
export 'src/material/typography/typescale_theme.dart';

export 'src/material/elevation/elevation_theme.dart';

export 'src/material/icon/icon.dart';
export 'src/material/icon/icon_theme.dart';

export 'src/material/focus_ring/focus_ring_theme.dart';
export 'src/material/focus_ring/focus_ring.dart';

export 'src/material/progress_indicator.dart';

export 'src/material/checkbox/checkbox.dart';
export 'src/material/checkbox/checkbox_theme.dart';

export 'src/material/radio_button/radio_button.dart';
export 'src/material/radio_button/radio_button_theme.dart';

export 'src/material/switch/switch.dart';
export 'src/material/switch/switch_theme.dart';

export 'src/material/list/list_theme.dart';

// TODO: review after LoadingIndicator gets a custom implementation
export 'src/material/loading_indicator/loading_indicator.dart';
export 'src/material/loading_indicator/loading_indicator_theme.dart';

export 'src/material/raw_material_app.dart';

import 'package:material/src/material/flutter.dart';

/// Same as [num.clamp] but optimized for a non-null [int].
///
/// This is faster because it avoids polymorphism, boxing,
/// and some special cases.
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int clampInt(int value, int min, int max) {
  assert(min <= max);
  return value < min
      ? min
      : value > max
      ? max
      : value;
}

/// Same as [num.clamp] but optimized for a non-null [double].
///
/// This is faster because it avoids polymorphism, boxing,
/// and some special cases.
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
double clampDouble(double value, double min, double max) {
  assert(min <= max && !max.isNaN && !min.isNaN);
  return value < min
      ? min
      : value > max || value.isNaN
      ? max
      : value;
}

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

// TODO: implement
// ThemeData? maybeThemeOf(BuildContext context) => null;
