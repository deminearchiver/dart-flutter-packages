import 'dart:math' as math;

import '../hct/hct.dart';
import '../utils/math_utils.dart';

/// The role of the base color, used to determine hue strategy for
/// Energy colors.
enum BaseColorRole { primary, secondary, tertiary, surface, others }

/// Represents the result of energy color generation, containing end and middle
/// colors.
abstract final class EnergyColors {
  static const _chromaEpsilon = 0.5;

  /// Generates Energy Colors (End, Middle, Base) using Material Theme inputs.
  static (Hct middleColor, Hct endColor) withAccentsHct(
    Hct baseColor,
    Hct primaryColor,
    Hct secondaryColor,
    Hct tertiaryColor,
    Hct surfaceColor,
    bool isBaseline, [
    BaseColorRole? baseColorRole,
  ]) {
    final isDark = surfaceColor.tone <= 50.0;
    var endHue = 0.0;
    var middleHue = 0.0;

    final isSurface = baseColorRole == null
        ? _isSurfaceLike(baseColor, surfaceColor)
        : baseColorRole == .surface;

    final isTertiary = baseColorRole == null
        ? _isTertiaryLike(baseColor, primaryColor, tertiaryColor)
        : baseColorRole == .tertiary;

    final shifts = _getHueShifts(baseColor.hue, isBaseline);
    final midHueShift = shifts.midHueShift;
    final endHueShift = shifts.endHueShift;
    final surfaceHueShift = shifts.surfaceHueShift;

    final distPrimaryTertiary = MathUtils.differenceDegrees(
      primaryColor.hue,
      tertiaryColor.hue,
    );
    final rangeExists = distPrimaryTertiary > 10.0;

    var hueDir = MathUtils.rotationDirection(
      primaryColor.hue,
      tertiaryColor.hue,
    );

    if (isBaseline) {
      hueDir *= isTertiary ? -4.3 : -1.0;
    } else if (baseColorRole != null) {
      hueDir *= isTertiary ? -1.0 : 1.0;
    } else {
      hueDir *= isTertiary && rangeExists ? -1.0 : 1.0;
    }

    if (isSurface) {
      if (isBaseline) {
        middleHue = 240.0;
        endHue = 270.0;
      } else {
        middleHue = primaryColor.hue + surfaceHueShift * hueDir * 0.75;
        endHue = primaryColor.hue + surfaceHueShift * hueDir;
      }
    } else {
      middleHue = baseColor.hue + midHueShift * hueDir;
      endHue = baseColor.hue + endHueShift * hueDir;
    }

    final effectiveBaseColorRole =
        baseColorRole ?? (isTertiary ? .tertiary : .others);
    final endColor = _energyEndColor(
      baseColor,
      MathUtils.sanitizeDegreesDouble(endHue),
      isDark,
      isBaseline,
      effectiveBaseColorRole,
    );
    final middleColor = _energyMiddleColor(
      baseColor,
      endColor,
      MathUtils.sanitizeDegreesDouble(middleHue),
      isBaseline,
    );
    return (middleColor, endColor);
  }

  /// Generates Energy Colors (End, Middle, Base) using Material Theme inputs.
  static (int middleColor, int endColor) withAccentsArgb(
    int baseColor,
    int primaryColor,
    int secondaryColor,
    int tertiaryColor,
    int surfaceColor,
    bool isBaseline, [
    BaseColorRole? baseColorRole,
  ]) {
    final (middleColor, endColor) = withAccentsHct(
      .fromInt(baseColor),
      .fromInt(primaryColor),
      .fromInt(secondaryColor),
      .fromInt(tertiaryColor),
      .fromInt(surfaceColor),
      isBaseline,
      baseColorRole,
    );
    return (middleColor.toInt(), endColor.toInt());
  }

  /// Generates energy colors based on hue rotations from a base color.
  static (Hct middleColor, Hct endColor) withHueRotationsHct(
    Hct baseColor,
    bool isDark,
    double rotationDirection,
    double endHueRotation,
    double middleHueRotation,
  ) {
    final direction = rotationDirection.sign;
    final endHue = MathUtils.sanitizeDegreesDouble(
      baseColor.hue + endHueRotation * direction,
    );
    final middleHue = MathUtils.sanitizeDegreesDouble(
      baseColor.hue + middleHueRotation * direction,
    );
    return withHueValuesHct(baseColor, isDark, endHue, middleHue);
  }

  /// Generates energy colors based on hue rotations from a base color.
  static (int middleColor, int endColor) withHueRotationsArgb(
    int baseColor,
    bool isDark,
    double rotationDirection,
    double endHueRotation,
    double middleHueRotation,
  ) {
    final (middleColor, endColor) = withHueRotationsHct(
      .fromInt(baseColor),
      isDark,
      rotationDirection,
      endHueRotation,
      middleHueRotation,
    );
    return (middleColor.toInt(), endColor.toInt());
  }

  /// Generates energy colors based on a base color.
  static (Hct middleColor, Hct endColor) withHueValuesHct(
    Hct baseColor,
    bool isDark,
    double endHue,
    double middleHue,
  ) {
    final endColor = _energyEndColor(baseColor, endHue, isDark, false, null);
    final middleColor = _energyMiddleColor(
      baseColor,
      endColor,
      middleHue,
      false,
    );
    return (middleColor, endColor);
  }

  /// Generates energy colors based on a base color.
  static (int middleColor, int endColor) withHueValuesArgb(
    int baseColor,
    bool isDark,
    double endHue,
    double middleHue,
  ) {
    final (middleColor, endColor) = withHueValuesHct(
      .fromInt(baseColor),
      isDark,
      endHue,
      middleHue,
    );
    return (middleColor.toInt(), endColor.toInt());
  }

  static HueShifts _getHueShifts(double hue, bool isBaseline) {
    var shiftAdjust = 1.0;
    if (isBaseline) {
      if (hue <= 170.0) {
        shiftAdjust = 1.0;
      } else if (hue <= 240.0) {
        shiftAdjust = 2.0;
      } else if (hue <= 265.0) {
        shiftAdjust = 1.7;
      } else {
        shiftAdjust = 1.0;
      }
    } else {
      if (hue <= 37.0) {
        shiftAdjust = 1.5;
      } else if (hue <= 97.0) {
        shiftAdjust = 1.25;
      } else if (hue <= 160.0) {
        shiftAdjust = 0.48;
      } else if (hue <= 203.0) {
        shiftAdjust = 1.86;
      } else if (hue <= 277.0) {
        shiftAdjust = 1.14;
      } else if (hue <= 332.0) {
        shiftAdjust = 1.0;
      } else {
        shiftAdjust = 1.25;
      }
    }

    var midHueShift = 0.0;
    var endHueShift = 0.0;
    var surfaceHueShift = 0.0;

    if (isBaseline) {
      endHueShift = 16.0 * shiftAdjust;
      midHueShift = 0.25 * endHueShift;
      surfaceHueShift = 10.0;
    } else {
      midHueShift = 10.0 * shiftAdjust;
      endHueShift = 21.0 * shiftAdjust;
      surfaceHueShift = 15.0;
    }

    return .new(midHueShift, endHueShift, surfaceHueShift);
  }

  /// Generates the Energy End color given the base color and parameters.
  static Hct _energyEndColor(
    Hct baseColor,
    double endHue,
    bool isDark,
    bool isBaseline,
    BaseColorRole? colorRole,
  ) {
    var tone = baseColor.tone;
    var chroma = baseColor.chroma;

    if (baseColor.tone <= 20.0) {
      // Case A
      tone = baseColor.tone + (baseColor.tone < 13.0 ? 55.0 : 40.0);
      if (isBaseline) {
        tone = baseColor.tone + 25.0;
      }
      chroma = baseColor.chroma * 3.0;
      if (colorRole != null) {
        final chromaInterim = math.max(chroma, baseColor.chroma + 8.0);
        chroma = math.min(chromaInterim, 80.0);
      }
      if (isBaseline) {
        chroma = 43.0;
      }
    } else if (baseColor.tone < 86.0) {
      // Case B
      tone = math.min(
        97.0,
        baseColor.tone + (baseColor.tone < 42.0 ? 30.0 : 40.0),
      );
      final chromaInterim = math.max(28.0, baseColor.chroma * 2.0);
      chroma = math.min(chromaInterim, 60.0);
      if (isBaseline) {
        chroma = 61.0;
      }
      final temp = Hct.from(endHue, chroma, tone);
      if (temp.chroma < chroma - _chromaEpsilon) {
        var targetChromaValue = 60.0;
        if (isBaseline) {
          targetChromaValue = 61.0;
        }
        tone = _findClosestTone(endHue, targetChromaValue, tone);
        tone = math.max(
          tone,
          isDark ? baseColor.tone - 16.0 : baseColor.tone + 6.0,
        );
        if (baseColor.tone < 73.0) {
          tone = math.max(
            tone,
            isDark ? baseColor.tone + 10.0 : baseColor.tone + 8.0,
          );
        }
        if (isBaseline && colorRole == .tertiary) {
          if (baseColor.tone < 42.0) {
            tone = isDark ? baseColor.tone + 31.0 : baseColor.tone + 26.0;
          } else if (baseColor.tone < 82.0) {
            tone = isDark ? baseColor.tone + 7.0 : baseColor.tone + 9.0;
          } else {
            tone = isDark ? baseColor.tone - 16.0 : baseColor.tone + 6.0;
          }
        }
      }
    } else {
      // Case C
      tone = math.min(97.0, baseColor.tone + 5.0);
      final chromaInterim = math.max(
        28.0,
        math.max(baseColor.chroma + 20.0, baseColor.chroma * 2.0),
      );
      chroma = math.min(chromaInterim, 80.0);
      final temp = Hct.from(endHue, chroma, tone);
      if (temp.chroma < chroma - _chromaEpsilon) {
        tone = _findClosestTone(endHue, chroma, tone);
        tone = math.max(
          tone,
          isDark ? baseColor.tone - 14.0 : baseColor.tone - 5.0,
        );
        if (isBaseline && colorRole == .tertiary) {
          tone = isDark ? baseColor.tone - 7.0 : baseColor.tone - 2.0;
        }
      }
    }
    var endColor = Hct.from(endHue, chroma, tone);

    if (endColor.hue >= 180.0 &&
        endColor.hue <= 212.0 &&
        endColor.chroma > 45.0) {
      endColor = Hct.from(endColor.hue, 45.0, endColor.tone);
    }
    return endColor;
  }

  /// Generates the Energy Middle color given the base color, end color,
  /// and hue.
  static Hct _energyMiddleColor(
    Hct baseColor,
    Hct endColor,
    double middleHue,
    bool isBaseline,
  ) {
    final toneDiff = endColor.tone - baseColor.tone;
    var tone = 0.0;

    if (toneDiff > 20.0) {
      tone = (baseColor.tone * 2.0) / 3.0 + (endColor.tone * 1.0) / 3.0;
    } else if (toneDiff < 8.0) {
      tone = (baseColor.tone * 1.0) / 3.0 + (endColor.tone * 2.0) / 3.0;
    } else {
      tone = (baseColor.tone * 1.0) / 2.0 + (endColor.tone * 1.0) / 2.0;
    }

    var chroma = (baseColor.chroma + endColor.chroma) / 2.0;
    if (isBaseline) {
      chroma = (baseColor.chroma * 1.0) / 3.0 + (endColor.chroma * 2.0) / 3.0;
    }
    return Hct.from(middleHue, chroma, tone);
  }

  static double _findClosestTone(
    double hue,
    double targetChroma,
    double baseTone,
  ) {
    var closestTone = -1.0;
    var minToneDiff = 1000.0;
    var maxChroma = -1.0;
    var toneWithMaxChroma = -1.0;

    // Search for the closest tone that can reach the target chroma.
    for (var t = 0; t <= 100; t++) {
      final tDouble = t.toDouble();
      final testColor = Hct.from(hue, targetChroma, tDouble);
      // Track max chroma found
      if (testColor.chroma > maxChroma) {
        maxChroma = testColor.chroma;
        toneWithMaxChroma = tDouble;
      }

      if (testColor.chroma >= targetChroma - _chromaEpsilon) {
        final toneDiff = (t - baseTone).abs();
        if (toneDiff < minToneDiff) {
          closestTone = tDouble;
          minToneDiff = toneDiff;
        }
      }
    }

    // If no tone can reach the target chroma, return the tone with the max
    // chroma
    if (closestTone < 0.0) {
      return toneWithMaxChroma;
    }

    return closestTone;
  }

  static bool _isSurfaceLike(Hct baseColor, Hct surfaceColor) {
    final isDark = surfaceColor.tone <= 50.0;
    final baseChroma = baseColor.chroma;
    final baseTone = baseColor.tone;
    final surfaceChroma = surfaceColor.chroma;
    final surfaceTone = surfaceColor.tone;

    return baseChroma < 2.5 * surfaceChroma &&
        (isDark
            ? baseTone < 3.5 * surfaceTone
            : 100.0 - baseTone < 3.5 * (100.0 - surfaceTone));
  }

  static bool _isTertiaryLike(
    Hct baseColor,
    Hct primaryColor,
    Hct tertiaryColor,
  ) {
    final distPrimaryTertiary = MathUtils.differenceDegrees(
      primaryColor.hue,
      tertiaryColor.hue,
    );

    if (distPrimaryTertiary <= 10.0 * _getHueWeight(primaryColor.hue) ||
        distPrimaryTertiary <= 10.0 * _getHueWeight(tertiaryColor.hue)) {
      return false;
    }

    return MathUtils.differenceDegrees(baseColor.hue, tertiaryColor.hue) <
        15.0 * _getHueWeight(baseColor.hue);
  }

  static double _getHueWeight(double hue) {
    // Normalize hue to 0-360
    final h = ((hue % 360) + 360) % 360;

    // Define anchor points [hue, weight]
    const anchors = <List<double>>[
      [0.0, 1.0],
      [50.0, 1.0],
      [90.0, 0.6],
      [140.0, 0.9],
      [210.0, 1.2],
      [280.0, 1.5],
      [320.0, 1.1],
      [360.0, 1.0],
    ];

    // Find the two anchors the hue falls between
    for (var i = 0; i < anchors.length - 1; i++) {
      final h1 = anchors[i][0];
      final w1 = anchors[i][1];
      final h2 = anchors[i + 1][0];
      final w2 = anchors[i + 1][1];
      if (h >= h1 && h <= h2) {
        // Linear interpolation
        final t = (h - h1) / (h2 - h1);
        return w1 + t * (w2 - w1);
      }
    }
    return 1.0;
  }
}

extension type const HueShifts._(
  ({double midHueShift, double endHueShift, double surfaceHueShift}) _,
) implements Object {
  const new(double midHueShift, double endHueShift, double surfaceHueShift)
    : _ = (
        midHueShift: midHueShift,
        endHueShift: endHueShift,
        surfaceHueShift: surfaceHueShift,
      );

  double get midHueShift => _.midHueShift;

  double get endHueShift => _.endHueShift;

  double get surfaceHueShift => _.surfaceHueShift;
}
