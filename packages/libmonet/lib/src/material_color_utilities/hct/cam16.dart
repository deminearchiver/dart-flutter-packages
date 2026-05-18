import 'dart:math' as math;

import 'package:meta/meta.dart';

import '../utils/color_utils.dart';
import '../utils/math_utils.dart';

import 'hct_solver.dart';
import 'viewing_conditions.dart';

/// CAM16, a color appearance model. Colors are not just defined by their
/// hex code, but rather, a hex code and viewing conditions.
///
/// CAM16 instances also have coordinates in the CAM16-UCS space,
/// called J*, a*, b*, or jstar, astar, bstar in code. CAM16-UCS is included
/// in the CAM16 specification, and should be used when measuring distances
/// between colors.
///
/// In traditional color spaces, a color can be identified solely by the
/// observer's measurement of the color. Color appearance models such as
/// CAM16 also use information about the environment where the color
/// was observed, known as the viewing conditions.
///
/// For example, white under the traditional assumption of a midday sun
/// white point is accurately measured as a slightly chromatic blue by CAM16.
/// (roughly, hue 203, chroma 3, lightness 100)
final class Cam16 {
  const Cam16._(
    this.hue,
    this.chroma,
    this.j,
    this.q,
    this.m,
    this.s,
    this.jstar,
    this.astar,
    this.bstar,
  );

  @internal
  factory Cam16.fromXyzInViewingConditions(
    double x,
    double y,
    double z,
    ViewingConditions viewingConditions,
  ) {
    // Transform XYZ to 'cone'/'rgb' responses
    const matrix = xyzToCam16rgb;
    final rT = (x * matrix[0][0]) + (y * matrix[0][1]) + (z * matrix[0][2]);
    final gT = (x * matrix[1][0]) + (y * matrix[1][1]) + (z * matrix[1][2]);
    final bT = (x * matrix[2][0]) + (y * matrix[2][1]) + (z * matrix[2][2]);

    // Discount illuminant
    final rD = viewingConditions.rgbD[0] * rT;
    final gD = viewingConditions.rgbD[1] * gT;
    final bD = viewingConditions.rgbD[2] * bT;

    // Chromatic adaptation
    final rAF =
        math.pow(viewingConditions.fl * rD.abs() / 100.0, 0.42) as double;
    final gAF =
        math.pow(viewingConditions.fl * gD.abs() / 100.0, 0.42) as double;
    final bAF =
        math.pow(viewingConditions.fl * bD.abs() / 100.0, 0.42) as double;
    final rA = rD.sign * 400.0 * rAF / (rAF + 27.13);
    final gA = gD.sign * 400.0 * gAF / (gAF + 27.13);
    final bA = bD.sign * 400.0 * bAF / (bAF + 27.13);

    // redness-greenness
    final a = (11.0 * rA + -12.0 * gA + bA) / 11.0;
    // yellowness-blueness
    final b = (rA + gA - 2.0 * bA) / 9.0;

    // auxiliary components
    final u = (20.0 * rA + 20.0 * gA + 21.0 * bA) / 20.0;
    final p2 = (40.0 * rA + 20.0 * gA + bA) / 20.0;

    // hue
    final atan2 = math.atan2(b, a);
    final atanDegrees = MathUtils.toDegrees(atan2);
    final hue = MathUtils.sanitizeDegreesDouble(atanDegrees);
    final hueRadians = MathUtils.toRadians(hue);

    // achromatic response to color
    final ac = p2 * viewingConditions.nbb;

    // CAM16 lightness and brightness
    final j =
        100.0 *
        math.pow(
          ac / viewingConditions.aw,
          viewingConditions.c * viewingConditions.z,
        );
    final q =
        4.0 /
        viewingConditions.c *
        math.sqrt(j / 100.0) *
        (viewingConditions.aw + 4.0) *
        viewingConditions.flRoot;

    // CAM16 chroma, colorfulness, and saturation.
    final huePrime = (hue < 20.14) ? hue + 360 : hue;
    final eHue = 0.25 * (math.cos(MathUtils.toRadians(huePrime) + 2.0) + 3.8);
    final p1 =
        50000.0 / 13.0 * eHue * viewingConditions.nc * viewingConditions.ncb;
    final t = p1 * MathUtils.hypot(a, b) / (u + 0.305);
    final alpha =
        (math.pow(1.64 - math.pow(0.29, viewingConditions.n), 0.73) *
                math.pow(t, 0.9))
            as double;
    // CAM16 chroma, colorfulness, saturation
    final c = alpha * math.sqrt(j / 100.0);
    final m = c * viewingConditions.flRoot;
    final s =
        50.0 *
        math.sqrt((alpha * viewingConditions.c) / (viewingConditions.aw + 4.0));

    // CAM16-UCS components
    final jstar = (1.0 + 100.0 * 0.007) * j / (1.0 + 0.007 * j);
    final mstar = 1.0 / 0.0228 * MathUtils.log1p(0.0228 * m);
    final astar = mstar * math.cos(hueRadians);
    final bstar = mstar * math.sin(hueRadians);
    return ._(hue, c, j, q, m, s, jstar, astar, bstar);
  }

  /// Create a CAM16 color from a color in defined viewing conditions.
  @internal
  factory Cam16.fromIntInViewingConditions(
    int argb,
    ViewingConditions viewingConditions,
  ) {
    final red = (argb & 0x00ff0000) >> 16;
    final green = (argb & 0x0000ff00) >> 8;
    final blue = argb & 0x000000ff;
    final redL = ColorUtils.linearized(red);
    final greenL = ColorUtils.linearized(green);
    final blueL = ColorUtils.linearized(blue);
    final x = 0.41233895 * redL + 0.35762064 * greenL + 0.18051042 * blueL;
    final y = 0.2126 * redL + 0.7152 * greenL + 0.0722 * blueL;
    final z = 0.01932141 * redL + 0.11916382 * greenL + 0.95034478 * blueL;
    return .fromXyzInViewingConditions(x, y, z, viewingConditions);
  }

  /// Create a CAM16 color from a color,
  /// assuming the color was viewed in default viewing conditions.
  factory Cam16.fromInt(int argb) =>
      .fromIntInViewingConditions(argb, ViewingConditions.srgb);

  @internal
  factory Cam16.fromJchInViewingConditions(
    double j,
    double c,
    double h,
    ViewingConditions viewingConditions,
  ) {
    final q =
        4.0 /
        viewingConditions.c *
        math.sqrt(j / 100.0) *
        (viewingConditions.aw + 4.0) *
        viewingConditions.flRoot;
    final m = c * viewingConditions.flRoot;
    final alpha = c / math.sqrt(j / 100.0);
    final s =
        50.0 *
        math.sqrt((alpha * viewingConditions.c) / (viewingConditions.aw + 4.0));

    final hueRadians = MathUtils.toRadians(h);
    final jstar = (1.0 + 100.0 * 0.007) * j / (1.0 + 0.007 * j);
    final mstar = 1.0 / 0.0228 * MathUtils.log1p(0.0228 * m);
    final astar = mstar * math.cos(hueRadians);
    final bstar = mstar * math.sin(hueRadians);
    return ._(h, c, j, q, m, s, jstar, astar, bstar);
  }

  @internal
  factory Cam16.fromJch(double j, double c, double h) =>
      .fromJchInViewingConditions(j, c, h, ViewingConditions.srgb);

  /// Create a CAM16 color from CAM16-UCS coordinates in defined
  /// viewing conditions.
  factory Cam16.fromUcsInViewingConditions(
    double jstar,
    double astar,
    double bstar,
    ViewingConditions viewingConditions,
  ) {
    final m = MathUtils.hypot(astar, bstar);
    final m2 = MathUtils.expm1(m * 0.0228) / 0.0228;
    final c = m2 / viewingConditions.flRoot;
    var h = math.atan2(bstar, astar) * (180.0 / math.pi);
    if (h < 0.0) {
      h += 360.0;
    }
    final j = jstar / (1.0 - (jstar - 100.0) * 0.007);
    return .fromJchInViewingConditions(j, c, h, viewingConditions);
  }

  ///  Create a CAM16 color from CAM16-UCS coordinates.
  factory Cam16.fromUcs(double jstar, double astar, double bstar) =>
      .fromUcsInViewingConditions(jstar, astar, bstar, ViewingConditions.srgb);

  /// Hue in CAM16.
  final double hue;

  /// Chroma in CAM16.
  final double chroma;

  /// Lightness in CAM16.
  final double j;

  /// Brightness in CAM16.
  ///
  /// Prefer lightness, brightness is an absolute quantity. For example,
  /// a sheet of white paper is much brighter viewed in sunlight than in
  /// indoor light, but it is the lightest object under any lighting.
  final double q;

  /// Colorfulness in CAM16.
  ///
  /// Prefer chroma, colorfulness is an absolute quantity. For example,
  /// a yellow toy car is much more colorful outside than inside,
  /// but it has the same chroma in both environments.
  final double m;

  /// Saturation in CAM16.
  ///
  /// Colorfulness in proportion to brightness. Prefer chroma,
  /// saturation measures colorfulness relative to the color's own brightness,
  /// where chroma is colorfulness relative to white.
  final double s;

  /// Lightness coordinate in CAM16-UCS.
  final double jstar;

  /// a* coordinate in CAM16-UCS.
  final double astar;

  /// b* coordinate in CAM16-UCS.
  final double bstar;

  /// CAM16 instances also have coordinates in the CAM16-UCS space,
  /// called J*, a*, b*, or jstar, astar, bstar in code.
  /// CAM16-UCS is included in the CAM16 specification,
  /// and is used to measure distances between colors.
  double distance(Cam16 other) {
    final dJ = jstar - other.jstar;
    final dA = astar - other.astar;
    final dB = bstar - other.bstar;
    final dEPrime = math.sqrt(dJ * dJ + dA * dA + dB * dB);
    final dE = 1.41 * math.pow(dEPrime, 0.63);
    return dE;
  }

  List<double> xyzInViewingConditions(ViewingConditions viewingConditions) {
    final alpha = (chroma == 0.0 || j == 0.0)
        ? 0.0
        : chroma / math.sqrt(j / 100.0);

    final t =
        math.pow(
              alpha /
                  math.pow(1.64 - math.pow(0.29, viewingConditions.n), 0.73),
              1.0 / 0.9,
            )
            as double;
    final hRad = MathUtils.toRadians(hue);

    final eHue = 0.25 * (math.cos(hRad + 2.0) + 3.8);
    final ac =
        viewingConditions.aw *
        math.pow(j / 100.0, 1.0 / viewingConditions.c / viewingConditions.z);
    final p1 =
        eHue * (50000.0 / 13.0) * viewingConditions.nc * viewingConditions.ncb;
    final p2 = ac / viewingConditions.nbb;

    final hSin = math.sin(hRad);
    final hCos = math.cos(hRad);

    final gamma =
        23.0 *
        (p2 + 0.305) *
        t /
        (23.0 * p1 + 11.0 * t * hCos + 108.0 * t * hSin);
    final a = gamma * hCos;
    final b = gamma * hSin;
    final rA = (460.0 * p2 + 451.0 * a + 288.0 * b) / 1403.0;
    final gA = (460.0 * p2 - 891.0 * a - 261.0 * b) / 1403.0;
    final bA = (460.0 * p2 - 220.0 * a - 6300.0 * b) / 1403.0;

    final rCBase = math.max(0, (27.13 * rA.abs()) / (400.0 - rA.abs()));
    final rC =
        rA.sign * (100.0 / viewingConditions.fl) * math.pow(rCBase, 1.0 / 0.42);
    final gCBase = math.max(0, (27.13 * gA.abs()) / (400.0 - gA.abs()));
    final gC =
        gA.sign * (100.0 / viewingConditions.fl) * math.pow(gCBase, 1.0 / 0.42);
    final bCBase = math.max(0, (27.13 * bA.abs()) / (400.0 - bA.abs()));
    final bC =
        bA.sign * (100.0 / viewingConditions.fl) * math.pow(bCBase, 1.0 / 0.42);
    final rF = rC / viewingConditions.rgbD[0];
    final gF = gC / viewingConditions.rgbD[1];
    final bF = bC / viewingConditions.rgbD[2];

    const matrix = cam16rgbToXyz;
    final x = (rF * matrix[0][0]) + (gF * matrix[0][1]) + (bF * matrix[0][2]);
    final y = (rF * matrix[1][0]) + (gF * matrix[1][1]) + (bF * matrix[1][2]);
    final z = (rF * matrix[2][0]) + (gF * matrix[2][1]) + (bF * matrix[2][2]);
    return [x, y, z];
  }

  /// ARGB representation of the color, in defined viewing conditions.
  int viewed(ViewingConditions viewingConditions) {
    final xyz = xyzInViewingConditions(viewingConditions);
    return ColorUtils.argbFromXyz(xyz[0], xyz[1], xyz[2]);
  }

  int viewedInSrgb() => viewed(.srgb);

  /// ARGB representation of the color. Assumes the color was viewed
  /// in default viewing conditions, which are near-identical
  /// to the default viewing conditions for sRGB.
  int toInt() => viewedInSrgb();

  @override
  String toString() =>
      "Cam16("
      "hue: $hue, "
      "chroma: $chroma, "
      "j: $j, "
      "q: $q, "
      "m: $m, "
      "s: $s, "
      "jstar: $jstar, "
      "astar: $astar, "
      "bstar: $bstar"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cam16 &&
          hue == other.hue &&
          chroma == other.chroma &&
          j == other.j &&
          q == other.q &&
          m == other.m &&
          s == other.s &&
          jstar == other.jstar &&
          astar == other.astar &&
          bstar == other.bstar;

  @override
  int get hashCode => Object.hash(hue, chroma, j, q, m, s, jstar, astar, bstar);

  /// Transforms XYZ color space coordinates to 'cone'/'RGB' responses in CAM16.
  @internal
  static const xyzToCam16rgb = <List<double>>[
    [0.401288, 0.650173, -0.051461],
    [-0.250268, 1.204414, 0.045854],
    [-0.002079, 0.048952, 0.953127],
  ];

  /// Transforms 'cone'/'RGB' responses in CAM16 to XYZ color space coordinates.
  @internal
  static const cam16rgbToXyz = <List<double>>[
    [1.8620678, -1.0112547, 0.14918678],
    [0.38752654, 0.62144744, -0.00897398],
    [-0.01584150, -0.03412294, 1.0499644],
  ];

  // NOTICE: Fork and dart transpilation of
  // frameworks/base/core/java/com/android/internal/graphics/cam/Cam.java.

  /// The maximum difference between the requested L* and the L* returned.
  static const _dlMax = 0.2;

  /// The maximum color distance, in CAM16-UCS, between a requested color
  /// and the color returned.
  static const _deMax = 1.0;

  /// When the delta between the floor & ceiling of a binary search for chroma
  /// is less than this, the binary search terminates.
  static const _chromaSearchEndpoint = 0.4;

  /// When the delta between the floor & ceiling of a binary search for J,
  /// lightness in CAM16, is less than this, the binary search terminates.
  static const _lightnessSearchEndpoint = 0.01;

  /// Find J, lightness in CAM16 color space,
  /// that creates a color with L* in the L*a*b* color space.
  ///
  /// Returns null if no J could be found that generated a color with L*.
  @internal
  static Cam16? findCamByJ(double hue, double chroma, double lstar) {
    var low = 0.0;
    var high = 100.0;
    var mid = 0.0;
    var bestdL = 1000.0;
    var bestdE = 1000.0;
    Cam16? bestCam;
    while ((low - high).abs() > _lightnessSearchEndpoint) {
      mid = low + (high - low) / 2.0;
      // Create the intended CAM color
      final camBeforeClip = Cam16.fromJch(mid, chroma, hue);
      // Convert the CAM color to RGB. If the color didn't fit in RGB, during the conversion,
      // the initial RGB values will be outside 0 to 255. The final RGB values are clipped to
      // 0 to 255, distorting the intended color.
      final clipped = camBeforeClip.viewedInSrgb();
      final clippedLstar = ColorUtils.lstarFromArgb(clipped);
      final dL = (lstar - clippedLstar).abs();
      // If the clipped color's L* is within error margin...
      if (dL < _dlMax) {
        // ...check if the CAM equivalent of the clipped color is far away from intended CAM
        // color. For the intended color, use lightness and chroma from the clipped color,
        // and the intended hue. Callers are wondering what the lightness is, they know
        // chroma may be distorted, so the only concern here is if the hue slipped too far.
        final camClipped = Cam16.fromInt(clipped);
        final dE = camClipped.distance(
          Cam16.fromJch(camClipped.j, camClipped.chroma, hue),
        );
        if (dE <= _deMax) {
          bestdL = dL;
          bestdE = dE;
          bestCam = camClipped;
        }
      }
      // If there's no error at all, there's no need to search more.
      //
      // Note: this happens much more frequently than expected, but this is a very delicate
      // property which relies on extremely precise sRGB <=> XYZ calculations, as well as fine
      // tuning of the constants that determine error margins and when the binary search can
      // terminate.
      if (bestdL == 0 && bestdE == 0) {
        break;
      }
      if (clippedLstar < lstar) {
        low = mid;
      } else {
        high = mid;
      }
    }
    return bestCam;
  }

  /// Given a hue & chroma in CAM16, L* in L*a*b*,
  /// and the viewing conditions in which the color will be viewed,
  /// return an ARGB integer.
  ///
  /// The chroma of the color returned may, and frequently will,
  /// be lower than requested. This is a fundamental property of color
  /// that cannot be worked around by engineering. For example, a red hue,
  /// with high chroma, and high L* does not exist: red hues
  /// have a maximum chroma below 10 in light shades, creating pink.
  @internal
  static int getIntInViewingConditions(
    double hue,
    double chroma,
    double lstar,
    ViewingConditions viewingConditions,
  ) {
    // This is a crucial routine for building a color system, CAM16 itself is not sufficient.
    //
    // * Why these dimensions?
    // Hue and chroma from CAM16 are used because they're the most accurate measures of those
    // quantities. L* from L*a*b* is used because it correlates with luminance, luminance is
    // used to measure contrast for a11y purposes, thus providing a key constraint on what
    // colors
    // can be used.
    //
    // * Why is this routine required to build a color system?
    // In all perceptually accurate color spaces (i.e. L*a*b* and later), `chroma` may be
    // impossible for a given `hue` and `lstar`.
    // For example, a high chroma light red does not exist - chroma is limited to below 10 at
    // light red shades, we call that pink. High chroma light green does exist, but not dark
    // Also, when converting from another color space to RGB, the color may not be able to be
    // represented in RGB. In those cases, the conversion process ends with RGB values
    // outside 0-255
    // The vast majority of color libraries surveyed simply round to 0 to 255. That is not an
    // option for this library, as it distorts the expected luminance, and thus the expected
    // contrast needed for a11y
    //
    // * What does this routine do?
    // Dealing with colors in one color space not fitting inside RGB is, loosely referred to as
    // gamut mapping or tone mapping. These algorithms are traditionally idiosyncratic, there is
    // no universal answer. However, because the intent of this library is to build a system for
    // digital design, and digital design uses luminance to measure contrast/a11y, we have one
    // very important constraint that leads to an objective algorithm: the L* of the returned
    // color _must_ match the requested L*.
    //
    // Intuitively, if the color must be distorted to fit into the RGB gamut, and the L*
    // requested *must* be fulfilled, than the hue or chroma of the returned color will need
    // to be different from the requested hue/chroma.
    //
    // After exploring both options, it was more intuitive that if the requested chroma could
    // not be reached, it used the highest possible chroma. The alternative was finding the
    // closest hue where the requested chroma could be reached, but that is not nearly as
    // intuitive, as the requested hue is so fundamental to the color description.
    // If the color doesn't have meaningful chroma, return a gray with the requested Lstar.
    //
    // Yellows are very chromatic at L = 100, and blues are very chromatic at L = 0. All the
    // other hues are white at L = 100, and black at L = 0. To preserve consistency for users of
    // this system, it is better to simply return white at L* > 99, and black and L* < 0.
    if (viewingConditions == .srgb) {
      // If the viewing conditions are the same as the default sRGB-like
      // viewing conditions, skip to using HctSolver: it uses geometrical
      // insights to find the closest in-gamut match to hue/chroma/lstar.
      return HctSolver.solveToInt(hue, chroma, lstar);
    }
    if (chroma < 1.0 || lstar.round() <= 0 || lstar.round() >= 100) {
      return ColorUtils.argbFromLstar(lstar);
    }
    hue = hue < 0.0 ? 0.0 : math.min(360.0, hue);
    // The highest chroma possible. Updated as binary search proceeds.
    var high = chroma;
    // The guess for the current binary search iteration. Starts off at the
    // highest chroma, thus, if a color is possible at the requested chroma,
    // the search can stop after one try.
    var mid = chroma;
    var low = 0.0;
    var isFirstLoop = true;
    Cam16? answer;
    while ((low - high).abs() >= _chromaSearchEndpoint) {
      // Given the current chroma guess, mid, and the desired hue, find J,
      // lightness in CAM16 color space, that creates a color with L* = `lstar`
      // in the L*a*b* color space.
      final possibleAnswer = findCamByJ(hue, mid, lstar);
      if (isFirstLoop) {
        if (possibleAnswer != null) {
          return possibleAnswer.viewed(viewingConditions);
        } else {
          // If this binary search iteration was the first iteration,
          // and this point has been reached, it means the requested chroma
          // was not available at the requested hue and L*.
          // Proceed to a traditional binary search that starts at the midpoint
          // between the requested chroma and 0.
          isFirstLoop = false;
          mid = low + (high - low) / 2.0;
          continue;
        }
      }
      if (possibleAnswer == null) {
        // There isn't a CAM16 J that creates a color with L* `lstar`.
        // Try a lower chroma.
        high = mid;
      } else {
        answer = possibleAnswer;
        // It is possible to create a color. Try higher chroma.
        low = mid;
      }
      mid = low + (high - low) / 2.0;
    }
    return answer?.viewed(viewingConditions) ??
        // There was no answer: meaning, for the desired hue, there was
        // no chroma low enough to generate a color with the desired L*.
        // All values of L* are possible when there is 0 chroma. Return a color
        // with 0 chroma, i.e. a shade of gray, with the desired L*.
        ColorUtils.argbFromLstar(lstar);
  }

  /// Given a hue & chroma in CAM16, L* in L*a*b*,
  /// return an ARGB integer.
  ///
  /// The chroma of the color returned may, and frequently will,
  /// be lower than requested. This is a fundamental property of color
  /// that cannot be worked around by engineering. For example, a red hue,
  /// with high chroma, and high L* does not exist: red hues
  /// have a maximum chroma below 10 in light shades, creating pink.
  static int getInt(double hue, double chroma, double lstar) =>
      getIntInViewingConditions(hue, chroma, lstar, .srgb);
}
