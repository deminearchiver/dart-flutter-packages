import 'dart:math' as math;

import 'package:collection/collection.dart';

import 'lab.dart';
import 'named_colors.dart';
import 'utils.dart';

/// The color.
class Color {
  /// Arguments:
  ///
  /// * `r`: Red value [0..1]
  /// * `g`: Green value [0..1]
  /// * `b`: Blue value [0..1]
  /// * `a`: Alpha value [0..1]
  const Color(this.r, this.g, this.b, this.a);

  /// Arguments:
  ///
  /// * `r`: Red value [0..255]
  /// * `g`: Green value [0..255]
  /// * `b`: Blue value [0..255]
  /// * `a`: Alpha value [0..255]
  factory Color.fromRgba8(int r, int g, int b, int a) => Color(
    r.toDouble() / 255.0,
    g.toDouble() / 255.0,
    b.toDouble() / 255.0,
    a.toDouble() / 255.0,
  );

  /// Arguments:
  ///
  /// * `r`: Red value [0..1]
  /// * `g`: Green value [0..1]
  /// * `b`: Blue value [0..1]
  /// * `a`: Alpha value [0..1]
  factory Color.fromLinearRgba(double r, double g, double b, double a) {
    double fromLinear(double x) =>
        x >= 0.0031308 ? 1.055 * math.pow(x, 1.0 / 2.4) - 0.055 : 12.92 * x;
    return Color(fromLinear(r), fromLinear(g), fromLinear(b), a);
  }

  /// Arguments:
  ///
  /// * `r`: Red value [0..255]
  /// * `g`: Green value [0..255]
  /// * `b`: Blue value [0..255]
  /// * `a`: Alpha value [0..255]
  factory Color.fromLinearRgba8(int r, int g, int b, int a) =>
      Color.fromLinearRgba(
        r.toDouble() / 255.0,
        g.toDouble() / 255.0,
        b.toDouble() / 255.0,
        a.toDouble() / 255.0,
      );

  /// Arguments:
  ///
  /// * `h`: Hue angle [0..360]
  /// * `s`: Saturation [0..1]
  /// * `v`: Value [0..1]
  /// * `a`: Alpha [0..1]
  factory Color.fromHsva(double h, double s, double v, double a) {
    final (outR, outG, outB) = hsvToRgb(
      normalizeAngle(h),
      s.clamp(0.0, 1.0).toDouble(),
      v.clamp(0.0, 1.0).toDouble(),
    );
    return Color(outR, outG, outB, a);
  }

  /// Arguments:
  ///
  /// * `h`: Hue angle [0..360]
  /// * `s`: Saturation [0..1]
  /// * `l`: Lightness [0..1]
  /// * `a`: Alpha [0..1]
  factory Color.fromHsla(double h, double s, double l, double a) {
    final (outR, outG, outB) = hslToRgb(
      normalizeAngle(h),
      s.clamp(0.0, 1.0).toDouble(),
      l.clamp(0.0, 1.0).toDouble(),
    );
    return Color(outR, outG, outB, a);
  }

  /// Arguments:
  ///
  /// * `h`: Hue angle [0..360]
  /// * `w`: Whiteness [0..1]
  /// * `b`: Blackness [0..1]
  /// * `a`: Alpha [0..1]
  factory Color.fromHwba(double h, double w, double b, double a) {
    final (outR, outG, outB) = hwbToRgb(
      normalizeAngle(h),
      w.clamp(0.0, 1.0).toDouble(),
      b.clamp(0.0, 1.0).toDouble(),
    );
    return Color(outR, outG, outB, a);
  }

  /// Arguments:
  ///
  /// * `l`: Perceived lightness
  /// * `a`: How green/red the color is
  /// * `b`: How blue/yellow the color is
  /// * `alpha`: Alpha [0..1]
  factory Color.fromOklaba(double l, double a, double b, double alpha) {
    final (red, green, blue) = oklabToLinearRgb(l, a, b);
    return Color.fromLinearRgba(red, green, blue, alpha);
  }

  /// Arguments:
  ///
  /// * `l`: Perceived lightness
  /// * `c`: Chroma
  /// * `h`: Hue angle in radians
  /// * `alpha`: Alpha [0..1]
  factory Color.fromOklcha(double l, double c, double h, double alpha) =>
      Color.fromOklaba(l, c * math.cos(h), c * math.sin(h), alpha);

  /// Arguments:
  ///
  /// * `l`: Lightness
  /// * `a`: Distance along the `a` axis
  /// * `b`: Distance along the `b` axis
  /// * `alpha`: Alpha [0..1]
  factory Color.fromLaba(double l, double a, double b, double alpha) {
    final (red, green, blue) = labToLinearRgb(l, a, b);
    return Color.fromLinearRgba(red, green, blue, alpha);
  }

  /// Arguments:
  ///
  /// * `l`: Lightness
  /// * `c`: Chroma
  /// * `h`: Hue angle in radians
  /// * `alpha`: Alpha [0..1]
  factory Color.fromLcha(double l, double c, double h, double alpha) =>
      Color.fromLaba(l, c * math.cos(h), c * math.sin(h), alpha);

  /// Create color from CSS color string.
  // factory Color.fromHTML(String s) => parse(s);

  /// Red.
  final double r;

  /// Green.
  final double g;

  /// Blue.
  final double b;

  /// Alpha.
  final double a;

  /// Restricts R, G, B, A values to the range [0..1].
  Color get clamped => Color(
    r.clamp(0.0, 1.0).toDouble(),
    g.clamp(0.0, 1.0).toDouble(),
    b.clamp(0.0, 1.0).toDouble(),
    a.clamp(0.0, 1.0).toDouble(),
  );

  /// Returns name if there is a name for this color.
  ///
  /// **Note:** It ignores transparency (alpha value).
  String? get name {
    final rgb = switch (toRgba8()) {
      (final r, final b, final g, _) => (r, g, b),
    };
    return nameToRgbComponents.entries
        .firstWhereOrNull((entry) => entry.value == rgb)
        ?.key;
  }

  /// Returns: `[r, g, b, a]`
  ///
  /// * Red, green, blue and alpha in the range [0..1]
  (double, double, double, double) toArray() => (
    r.clamp(0.0, 1.0).toDouble(),
    g.clamp(0.0, 1.0).toDouble(),
    b.clamp(0.0, 1.0).toDouble(),
    a.clamp(0.0, 1.0).toDouble(),
  );

  /// Returns: `[r, g, b, a]`
  ///
  /// * Red, green, blue and alpha in the range [0..255]
  (int, int, int, int) toRgba8() => (
    (r * 255.0 + 0.5).toInt(),
    (g * 255.0 + 0.5).toInt(),
    (b * 255.0 + 0.5).toInt(),
    (a * 255.0 + 0.5).toInt(),
  );

  /// Returns: `[r, g, b, a]`
  ///
  /// * Red, green, blue and alpha in the range [0..65535]
  (int, int, int, int) toRgba16() => (
    (r * 65535.0 + 0.5).toInt(),
    (g * 65535.0 + 0.5).toInt(),
    (b * 65535.0 + 0.5).toInt(),
    (a * 65535.0 + 0.5).toInt(),
  );

  /// Returns: `[h, s, v, a]`
  ///
  /// * `h`: Hue angle [0..360]
  /// * `s`: Saturation [0..1]
  /// * `v`: Value [0..1]
  /// * `a`: Alpha [0..1]
  (double, double, double, double) toHsva() {
    final (h, s, v) = rgbToHsv(
      r.clamp(0.0, 1.0).toDouble(),
      g.clamp(0.0, 1.0).toDouble(),
      b.clamp(0.0, 1.0).toDouble(),
    );
    return (
      h,
      s.clamp(0.0, 1.0).toDouble(),
      v.clamp(0.0, 1.0).toDouble(),
      a.clamp(0.0, 1.0).toDouble(),
    );
  }

  /// Returns: `[h, s, l, a]`
  ///
  /// * `h`: Hue angle [0..360]
  /// * `s`: Saturation [0..1]
  /// * `l`: Lightness [0..1]
  /// * `a`: Alpha [0..1]
  (double, double, double, double) toHsla() {
    final (h, s, l) = rgbToHsl(
      r.clamp(0.0, 1.0).toDouble(),
      g.clamp(0.0, 1.0).toDouble(),
      b.clamp(0.0, 1.0).toDouble(),
    );
    return (
      h,
      s.clamp(0.0, 1.0).toDouble(),
      l.clamp(0.0, 1.0).toDouble(),
      a.clamp(0.0, 1.0).toDouble(),
    );
  }

  /// Returns: `[h, w, b, a]`
  ///
  /// * `h`: Hue angle [0..360]
  /// * `w`: Whiteness [0..1]
  /// * `b`: Blackness [0..1]
  /// * `a`: Alpha [0..1]
  (double, double, double, double) toHwba() {
    final (outH, outW, outB) = rgbToHwb(
      r.clamp(0.0, 1.0).toDouble(),
      g.clamp(0.0, 1.0).toDouble(),
      b.clamp(0.0, 1.0).toDouble(),
    );
    return (
      outH,
      outW.clamp(0.0, 1.0).toDouble(),
      outB.clamp(0.0, 1.0).toDouble(),
      a.clamp(0.0, 1.0).toDouble(),
    );
  }

  /// Returns: `[r, g, b, a]`
  ///
  /// * Red, green, blue and alpha in the range [0..1]
  (double, double, double, double) toLinearRgba() {
    double toLinear(double x) => x >= 0.04045
        ? math.pow((x + 0.055) / 1.055, 2.4).toDouble()
        : x / 12.92;
    return (toLinear(r), toLinear(g), toLinear(b), a);
  }

  /// Returns: `[r, g, b, a]`
  ///
  /// * Red, green, blue and alpha in the range [0..255]
  (int, int, int, int) toLinearRgba8() {
    final (r, g, b, a) = toLinearRgba();
    return (
      (r * 255.0).round(),
      (g * 255.0).round(),
      (b * 255.0).round(),
      (a * 255.0).round(),
    );
  }

  /// Returns: `[l, a, b, alpha]`
  (double, double, double, double) toOklaba() {
    final (linearR, linearG, linearB, _) = toLinearRgba();
    final (outL, outA, outB) = linearRgbToOklab(linearR, linearG, linearB);
    return (outL, outA, outB, a.clamp(0.0, 1.0).toDouble());
  }

  /// Returns: `[l, c, h, alpha]`
  (double, double, double, double) toOklcha() {
    final (l, a, b, alpha) = toOklaba();
    final c = math.sqrt(a * a + b * b);
    final h = math.atan2(b, a);
    return (l, c, h, alpha);
  }

  /// Returns: `[l, a, b, alpha]`
  (double, double, double, double) toLaba() {
    final (r, g, b, alpha) = toLinearRgba();
    final (outL, outA, outB) = linearRgbToLab(r, g, b);
    return (outL, outA, outB, alpha.clamp(0.0, 1.0).toDouble());
  }

  /// Returns: `[l, c, h, alpha]`
  (double, double, double, double) toLcha() {
    final (l, a, b, alpha) = toLaba();
    final c = math.sqrt(a * a + b * b);
    final h = math.atan2(b, a);
    return (l, c, h, alpha.clamp(0.0, 1.0).toDouble());
  }

  /// Get CSS RGB hexadecimal color representation
  String toCssHex() {
    final (r, g, b, a) = toRgba8();
    return a < 255
        ? "#${r.toRadixString(16).padLeft(2, "0")}${g.toRadixString(16).padLeft(2, "0")}${b.toRadixString(16).padLeft(2, "0")}${a.toRadixString(16).padLeft(2, "0")}"
        : "#${r.toRadixString(16).padLeft(2, "0")}${g.toRadixString(16).padLeft(2, "0")}${b.toRadixString(16).padLeft(2, "0")}";
  }

  /// Get CSS `rgb()` color representation
  String toCssRgb() {
    final (r, g, b, _) = toRgba8();
    return "rgb($r $g $b${_formatAlpha(a)})";
  }

  /// Get CSS `hsl()` color representation
  String toCssHsl() {
    final (h, s, l, alpha) = toHsla();
    final sH = h.isNaN ? "none" : _formatDouble(h, 2);
    final sS = (s * 100.0 + 0.5).floor();
    final sL = (l * 100.0 + 0.5).floor();
    return "hsl($sH $sS% $sL%${_formatAlpha(alpha)})";
  }

  /// Get CSS `hwb()` color representation
  String toCssHwb() {
    final (h, w, b, alpha) = toHwba();
    final sH = h.isNaN ? "none" : _formatDouble(h, 2);
    final sW = (w * 100.0 + 0.5).floor();
    final sB = (b * 100.0 + 0.5).floor();
    return "hwb($sH $sW% $sB%${_formatAlpha(alpha)})";
  }

  /// Get CSS `oklab()` color representation
  String toCssOklab() {
    final (l, a, b, alpha) = toOklaba();
    final sL = _formatDouble(l, 3);
    final sA = _formatDouble(a, 3);
    final sB = _formatDouble(b, 3);
    return "oklab($sL $sA $sB${_formatAlpha(alpha)})";
  }

  /// Get CSS `oklch()` color representation
  String toCssOklch() {
    final (l, c, h, alpha) = toOklcha();
    final sL = _formatDouble(l, 3);
    final sC = _formatDouble(c, 3);
    final sH = _formatDouble(normalizeAngle(h._toDegrees()), 2);
    return "oklch($sL $sC $sH${_formatAlpha(alpha)})";
  }

  /// Get CSS `lab()` color representation
  String toCssLab() {
    final (l, a, b, alpha) = toLaba();
    final sL = _formatDouble(l, 2);
    final sA = _formatDouble(a, 2);
    final sB = _formatDouble(b, 2);
    return "lab($sL $sA $sB${_formatAlpha(alpha)})";
  }

  /// Get CSS `lch()` color representation
  String toCssLch() {
    double toDegrees(double t) =>
        t > 0.0 ? t / math.pi * 180.0 : 360.0 - (t.abs() / math.pi) * 180.0;

    final (l, c, h, alpha) = toLcha();
    final sL = _formatDouble(l, 2);
    final sC = _formatDouble(c, 2);
    final sH = _formatDouble(toDegrees(h), 2);
    return "lch($sL $sC $sH${_formatAlpha(alpha)})";
  }

  @override
  String toString() => "Color($r, $g, $b, $a)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is Color &&
            r == other.r &&
            g == other.g &&
            b == other.b &&
            a == other.a;
  }

  @override
  int get hashCode => Object.hash(runtimeType, r, g, b, a);

  /// Blend this color with the other one, in the RGB color-space. `t` in the range [0..1].
  static Color interpolateRgb(Color self, Color other, double t) => Color(
    self.r + t * (other.r - self.r),
    self.g + t * (other.g - self.g),
    self.b + t * (other.b - self.b),
    self.a + t * (other.a - self.a),
  );

  /// Blend this color with the other one, in the linear RGB color-space. `t` in the range [0..1].
  static Color interpolateLinearRgb(Color self, Color other, double t) {
    final (r1, g1, b1, a1) = self.toLinearRgba();
    final (r2, g2, b2, a2) = other.toLinearRgba();
    return Color.fromLinearRgba(
      r1 + t * (r2 - r1),
      g1 + t * (g2 - g1),
      b1 + t * (b2 - b1),
      a1 + t * (a2 - a1),
    );
  }

  /// Blend this color with the other one, in the HSV color-space. `t` in the range [0..1].
  static Color interpolateHsv(Color self, Color other, double t) {
    final (h1, s1, v1, a1) = self.toHsva();
    final (h2, s2, v2, a2) = other.toHsva();
    return Color.fromHsva(
      interpolateAngleDegrees(h1, h2, t),
      s1 + t * (s2 - s1),
      v1 + t * (v2 - v1),
      a1 + t * (a2 - a1),
    );
  }

  /// Blend this color with the other one, in the [Oklab](https://bottosson.github.io/posts/oklab/) color-space. `t` in the range [0..1].
  static Color interpolateOklab(Color self, Color other, double t) {
    final (l1, a1, b1, alpha1) = self.toOklaba();
    final (l2, a2, b2, alpha2) = other.toOklaba();
    return Color.fromOklaba(
      l1 + t * (l2 - l1),
      a1 + t * (a2 - a1),
      b1 + t * (b2 - b1),
      alpha1 + t * (alpha2 - alpha1),
    );
  }

  /// Blend this color with the other one, in the Lab color-space. `t` in the range [0..1].
  static Color interpolateLab(Color self, Color other, double t) {
    final (l1, a1, b1, alpha1) = self.toLaba();
    final (l2, a2, b2, alpha2) = other.toLaba();
    return Color.fromLaba(
      l1 + t * (l2 - l1),
      a1 + t * (a2 - a1),
      b1 + t * (b2 - b1),
      alpha1 + t * (alpha2 - alpha1),
    );
  }

  /// Blend this color with the other one, in the LCH color-space. `t` in the range [0..1].
  static Color interpolateLch(Color self, Color other, double t) {
    final (l1, c1, h1, alpha1) = self.toLcha();
    final (l2, c2, h2, alpha2) = other.toLcha();
    return Color.fromLcha(
      l1 + t * (l2 - l1),
      c1 + t * (c2 - c1),
      interpolateAngleRadians(h1, h2, t),
      alpha1 + t * (alpha2 - alpha1),
    );
  }
}

String _formatDouble(double t, int precision) {
  var s = t.toStringAsFixed(precision);
  while (s.endsWith("0")) {
    s = s.substring(0, s.length - 1);
  }
  return s.endsWith(".") ? s.substring(0, s.length - 1) : s;
}

String _formatAlpha(double alpha) =>
    alpha < 1.0 ? " / ${(math.max(alpha, 0.0) * 100.0 + 0.5).floor()}%" : "";

extension on double {
  double _toDegrees() => this * (180.0 / math.pi);
}
