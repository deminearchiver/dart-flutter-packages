import 'dart:math' as math;

import 'package:meta/meta.dart';

// Constants for D65 white point (normalized to Y=1.0)
const double _d65X = 0.95047;
const double _d65Y = 1.0;
const double _d65Z = 1.08883;

const double _delta = 6.0 / 29.0;
const double _delta2 = _delta * _delta;
const double _delta3 = _delta2 * _delta;

// Helper function for LAB to XYZ conversion
(double, double, double) _labToXyz(double l, double a, double b) {
  final fy = (l + 16.0) / 116.0;
  final fx = fy + a / 500.0;
  final fz = fy - b / 200.0;

  double labF(double t) =>
      t > _delta ? t * t * t : (t - 16.0 / 116.0) * 3.0 * _delta2;

  final x = _d65X * labF(fx);
  final y = _d65Y * labF(fy);
  final z = _d65Z * labF(fz);
  return (x, y, z);
}

// Helper function for XYZ to linear RGB conversion
(double, double, double) _xyzToLinearRgb(double x, double y, double z) {
  // sRGB matrix (D65)
  final r = 3.2404542 * x - 1.5371385 * y - 0.4985314 * z;
  final g = -0.9692660 * x + 1.8760108 * y + 0.0415560 * z;
  final b = 0.0556434 * x - 0.2040259 * y + 1.0572252 * z;
  return (r, g, b);
}

// Helper function for linear RGB to XYZ conversion
(double, double, double) _linearRgbToXyz(double r, double g, double b) {
  // Inverse sRGB matrix (D65)
  final x = 0.4124564 * r + 0.3575761 * g + 0.1804375 * b;
  final y = 0.2126729 * r + 0.7151522 * g + 0.0721750 * b;
  final z = 0.0193339 * r + 0.1191920 * g + 0.9503041 * b;
  return (x, y, z);
}

// Helper function for XYZ to LAB conversion
(double, double, double) _xyzToLab(double x, double y, double z) {
  double labF(double t) => t > _delta3
      ? math.pow(t, 1.0 / 3.0).toDouble()
      : (t / (3.0 * _delta2)) + (4.0 / 29.0);

  final fx = labF(x / _d65X);
  final fy = labF(y / _d65Y);
  final fz = labF(z / _d65Z);

  final l = 116.0 * fy - 16.0;
  final a = 500.0 * (fx - fy);
  final b = 200.0 * (fy - fz);

  return (l, a, b);
}

// Convert CIELAB (L*a*b*) to linear RGB
// L: [0, 100], a: [-128, 127], b: [-128, 127]
// Returns RGB in [0, 1] range
@internal
(double, double, double) labToLinearRgb(double l, double a, double b) {
  final (x, y, z) = _labToXyz(l, a, b);
  return _xyzToLinearRgb(x, y, z);
}

// Convert linear RGB to CIELAB (L*a*b*)
// RGB components in [0, 1] range
// Returns [L, a, b] with L: [0, 100], a: [-128, 127], b: [-128, 127]
@internal
(double, double, double) linearRgbToLab(double r, double g, double b) {
  final (x, y, z) = _linearRgbToXyz(r, g, b);
  return _xyzToLab(x, y, z);
}
