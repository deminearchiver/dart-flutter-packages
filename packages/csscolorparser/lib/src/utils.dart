import 'dart:math' as math;

import 'package:meta/meta.dart';

const double TAU = math.pi * 2.0;
const double _pi3 = math.pi * 3.0;

@internal
(double, double, double) oklabToLinearRgb(double l, double a, double b) {
  final l_ = math.pow(l + 0.3963377774 * a + 0.2158037573 * b, 3) as double;
  final m_ = math.pow(l - 0.1055613458 * a - 0.0638541728 * b, 3) as double;
  final s_ = math.pow(l - 0.0894841775 * a - 1.2914855480 * b, 3) as double;
  final outR = 4.0767416621 * l_ - 3.3077115913 * m_ + 0.2309699292 * s_;
  final outG = -1.2684380046 * l_ + 2.6097574011 * m_ - 0.3413193965 * s_;
  final outB = -0.0041960863 * l_ - 0.7034186147 * m_ + 1.7076147010 * s_;
  return (outR, outG, outB);
}

@internal
(double, double, double) linearRgbToOklab(double r, double g, double b) {
  final l_ =
      math.pow(
            0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b,
            1.0 / 3.0,
          )
          as double;
  final m_ =
      math.pow(
            0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b,
            1.0 / 3.0,
          )
          as double;
  final s_ =
      math.pow(
            0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b,
            1.0 / 3.0,
          )
          as double;
  final outL = 0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_;
  final outA = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_;
  final outB = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_;
  return (outL, outA, outB);
}

@internal
double hueToRgb(double n1, double n2, double h) => switch (modulo(h, 6.0)) {
  final h when h < 1.0 => n1 + ((n2 - n1) * h),
  final h when h < 3.0 => n2,
  final h when h < 4.0 => n1 + ((n2 - n1) * (4.0 - h)),
  _ => n1,
};

// h = 0..360
// s, l = 0..1
// r, g, b = 0..1
@internal
(double, double, double) hslToRgb(double h, double s, double l) {
  if (s == 0.0) return (l, l, l);
  final n2 = l < 0.5 ? l * (1.0 + s) : l + s - (l * s);
  final n1 = 2.0 * l - n2;
  h = h / 60.0;
  final r = hueToRgb(n1, n2, h + 2.0);
  final g = hueToRgb(n1, n2, h);
  final b = hueToRgb(n1, n2, h - 2.0);
  return (r, g, b);
}

@internal
(double, double, double) hwbToRgb(double hue, double white, double black) {
  if (white + black >= 1.0) {
    final l = white / (white + black);
    return (l, l, l);
  }
  var (r, g, b) = hslToRgb(hue, 1.0, 0.5);
  final outR = r * (1.0 - white - black) + white;
  final outG = g * (1.0 - white - black) + white;
  final outB = b * (1.0 - white - black) + white;
  return (outR, outG, outB);
}

@internal
(double, double, double) hsvToHsl(double h, double s, double v) {
  final l = (2.0 - s) * v / 2.0;
  s = l != 0.0
      ? l == 1.0
            ? 0.0
            : l < 0.5
            ? s * v / (l * 2.0)
            : s * v / (2.0 - l * 2.0)
      : s;
  return (h, s, l);
}

@internal
(double, double, double) hsvToRgb(double h, double s, double v) {
  final (outH, outS, outL) = hsvToHsl(h, s, v);
  return hslToRgb(outH, outS, outL);
}

@internal
(double, double, double) rgbToHsv(double r, double g, double b) {
  final v = math.max(r, math.max(g, b));
  final d = v - math.min(r, math.min(g, b));

  if (d == 0.0) {
    return (0.0, 0.0, v);
  }

  final s = d / v;
  final dr = (v - r) / d;
  final dg = (v - g) / d;
  final db = (v - b) / d;

  var h = r == v
      ? db - dg
      : g == v
      ? 2.0 + dr - db
      : 4.0 + dg - dr;

  h = (h * 60.0) % 360.0;
  return (normalizeAngle(h), s, v);
}

@internal
(double, double, double) rgbToHsl(double r, double g, double b) {
  final min = math.min(r, math.min(g, b));
  final max = math.max(r, math.max(g, b));
  final l = (max + min) / 2.0;

  if (min == max) {
    return (0.0, 0.0, l);
  }

  final d = max - min;

  final s = l < 0.5 ? d / (max + min) : d / (2.0 - max - min);

  final dr = (max - r) / d;
  final dg = (max - g) / d;
  final db = (max - b) / d;

  var h = r == max
      ? db - dg
      : g == max
      ? 2.0 + dr - db
      : 4.0 + dg - dr;

  h = (h * 60.0) % 360.0;
  return (normalizeAngle(h), s, l);
}

@internal
(double, double, double) rgbToHwb(double r, double g, double b) {
  final (hue, _, _) = rgbToHsl(r, g, b);
  final white = math.min(r, math.min(g, b));
  final black = 1.0 - math.max(r, math.max(g, b));
  return (hue, white, black);
}

@internal
@pragma("vm:prefer-inline")
double normalizeAngle(double t) => ((t % 360.0) + 360.0) % 360.0;

@internal
@pragma("vm:prefer-inline")
double interpolateAngleDegrees(double a0, double a1, double t) {
  final delta = (((a1 - a0) % 360.0) + 540.0) % 360.0 - 180.0;
  return (a0 + t * delta + 360.0) % 360.0;
}

@internal
@pragma("vm:prefer-inline")
double interpolateAngleRadians(double a0, double a1, double t) {
  final delta = (((a1 - a0) % TAU) + _pi3) % TAU - math.pi;
  return (a0 + t * delta + TAU) % TAU;
}

@internal
@pragma("vm:prefer-inline")
double modulo(double x, double n) => (x % n + n) % n;

// Map t from range [a, b] to range [c, d]
@internal
@pragma("vm:prefer-inline")
double remap(double t, double a, double b, double c, double d) =>
    (t - a) * ((d - c) / (b - a)) + c;
