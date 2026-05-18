import 'dart:math' as math;

import 'package:meta/meta.dart';

import 'math_utils.dart';

abstract final class ColorUtils {
  @internal
  static const srgbToXyz = <List<double>>[
    [0.41233895, 0.35762064, 0.18051042],
    [0.2126, 0.7152, 0.0722],
    [0.01932141, 0.11916382, 0.95034478],
  ];

  @internal
  static const xyzToSrgb = <List<double>>[
    [3.2413774792388685, -1.5376652402851851, -0.49885366846268053],
    [-0.9691452513005321, 1.8758853451067872, 0.04156585616912061],
    [0.05562093689691305, -0.20395524564742123, 1.0571799111220335],
  ];

  static const whitePointD65 = <double>[95.047, 100.0, 108.883];

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static int argbFromRgb(int red, int green, int blue) =>
      (255 << 24) | ((red & 255) << 16) | ((green & 255) << 8) | (blue & 255);

  static int argbFromLinrgb(List<double> linrgb) {
    final r = delinearized(linrgb[0]);
    final g = delinearized(linrgb[1]);
    final b = delinearized(linrgb[2]);
    return argbFromRgb(r, g, b);
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static int alphaFromArgb(int argb) => (argb >> 24) & 255;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static int redFromArgb(int argb) => (argb >> 16) & 255;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static int greenFromArgb(int argb) => (argb >> 8) & 255;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static int blueFromArgb(int argb) => argb & 255;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static bool isOpaque(int argb) => alphaFromArgb(argb) >= 255;

  static int argbFromXyz(double x, double y, double z) {
    const matrix = xyzToSrgb;
    final linearR = matrix[0][0] * x + matrix[0][1] * y + matrix[0][2] * z;
    final linearG = matrix[1][0] * x + matrix[1][1] * y + matrix[1][2] * z;
    final linearB = matrix[2][0] * x + matrix[2][1] * y + matrix[2][2] * z;
    final r = delinearized(linearR);
    final g = delinearized(linearG);
    final b = delinearized(linearB);
    return argbFromRgb(r, g, b);
  }

  static List<double> xyzFromArgb(int argb) {
    final r = linearized(redFromArgb(argb));
    final g = linearized(greenFromArgb(argb));
    final b = linearized(blueFromArgb(argb));
    return MathUtils.matrixMultiply([r, g, b], srgbToXyz);
  }

  static int argbFromLab(double l, double a, double b) {
    final fy = (l + 16.0) / 116.0;
    final fx = a / 500.0 + fy;
    final fz = fy - b / 200.0;
    final xNormalized = _labInvf(fx);
    final yNormalized = _labInvf(fy);
    final zNormalized = _labInvf(fz);
    final x = xNormalized * whitePointD65[0];
    final y = yNormalized * whitePointD65[1];
    final z = zNormalized * whitePointD65[2];
    return argbFromXyz(x, y, z);
  }

  static List<double> labFromArgb(int argb) {
    final linearR = linearized(redFromArgb(argb));
    final linearG = linearized(greenFromArgb(argb));
    final linearB = linearized(blueFromArgb(argb));
    const matrix = srgbToXyz;
    final x =
        matrix[0][0] * linearR +
        matrix[0][1] * linearG +
        matrix[0][2] * linearB;
    final y =
        matrix[1][0] * linearR +
        matrix[1][1] * linearG +
        matrix[1][2] * linearB;
    final z =
        matrix[2][0] * linearR +
        matrix[2][1] * linearG +
        matrix[2][2] * linearB;
    final xNormalized = x / whitePointD65[0];
    final yNormalized = y / whitePointD65[1];
    final zNormalized = z / whitePointD65[2];
    final fx = _labF(xNormalized);
    final fy = _labF(yNormalized);
    final fz = _labF(zNormalized);
    final l = 116.0 * fy - 16.0;
    final a = 500.0 * (fx - fy);
    final b = 200.0 * (fy - fz);
    return [l, a, b];
  }

  static int argbFromLstar(double lstar) {
    final y = yFromLstar(lstar);
    final component = delinearized(y);
    return argbFromRgb(component, component, component);
  }

  static double lstarFromArgb(int argb) {
    final y = xyzFromArgb(argb)[1];
    return 116.0 * _labF(y / 100.0) - 16.0;
  }

  static double yFromLstar(double lstar) =>
      100.0 * _labInvf((lstar + 16.0) / 116.0);

  static double lstarFromY(double y) => _labF(y / 100.0) * 116.0 - 16.0;

  static double linearized(int rgbComponent) {
    final normalized = rgbComponent / 255.0;
    return normalized <= 0.040449936
        ? normalized / 12.92 * 100.0
        : 100.0 * math.pow((normalized + 0.055) / 1.055, 2.4);
  }

  static int delinearized(double rgbComponent) {
    final normalized = rgbComponent / 100.0;
    final delinearized = normalized <= 0.0031308
        ? normalized * 12.92
        : 1.055 * math.pow(normalized, 1.0 / 2.4) - 0.055;
    return MathUtils.clampInt(0, 255, (delinearized * 255.0).round());
  }

  static double _labF(double t) {
    const e = 216.0 / 24389.0;
    const kappa = 24389.0 / 27.0;
    if (t > e) {
      return math.pow(t, 1.0 / 3.0) as double;
    } else {
      return (kappa * t + 16.0) / 116.0;
    }
  }

  static double _labInvf(double ft) {
    const e = 216.0 / 24389.0;
    const kappa = 24389.0 / 27.0;
    final ft3 = ft * ft * ft;
    if (ft3 > e) {
      return ft3;
    } else {
      return (116.0 * ft - 16.0) / kappa;
    }
  }
}
