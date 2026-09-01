import 'dart:math' as math;

abstract final class MathUtils {
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double lerp(double start, double stop, double amount) =>
      (1.0 - amount) * start + amount * stop;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static T clamp<T extends num>(T value, T min, T max) => value < min
      ? min
      : value > max
      ? max
      : value;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static T sanitizeDegrees<T extends num>(T degrees) => degrees % 360 as T;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double rotationDirection(double from, double to) =>
      sanitizeDegrees(to - from) <= 180.0 ? 1.0 : -1.0;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double differenceDegrees(double a, double b) =>
      180.0 - ((a - b).abs() - 180.0).abs();

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double toRadians(double degrees) => degrees * math.pi / 180.0;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double toDegrees(double radians) => radians * 180.0 / math.pi;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double hypot(double a, double b) => math.sqrt(a * a + b * b);

  // TODO: investigate if the advanced libm implementation should be used

  static double log1p(double x) {
    if (x.isNaN || x == .infinity) return x;
    if (x == -1.0) return .negativeInfinity;
    if (x < -1.0) return .nan;
    final u = 1.0 + x;
    if (u == 1.0) return x;
    return math.log(u) * x / (u - 1.0);
  }

  static double expm1(double x) {
    if (x.isNaN || x == .infinity) return x;
    if (x == .negativeInfinity) return -1.0;
    if (x.abs() < 1.0) {
      final u = math.exp(x);
      if (u == 1.0) return x;
      return (u - 1.0) * x / math.log(u);
    }
    return math.exp(x) - 1.0;
  }
}
