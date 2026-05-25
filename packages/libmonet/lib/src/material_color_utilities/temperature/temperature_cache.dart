import 'dart:math' as math;
import 'dart:collection';

import '../hct/hct.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';

/// Design utilities using color temperature theory.
///
/// Analogous colors, complementary color, and cache to efficiently,
/// lazily, generate data for calculations when needed.
final class TemperatureCache {
  TemperatureCache(this.input);

  final Hct input;

  Hct? _precomputedComplement;
  List<Hct>? _precomputedHctsByTemp;
  List<Hct>? _precomputedHctsByHue;
  Map<Hct, double>? _precomputedTempsByHct;

  /// A color that complements the input color aesthetically.
  ///
  /// In art, this is usually described as being across the color wheel.
  /// History of this shows intent as a color that is just as cool-warm
  /// as the input color is warm-cool.
  Hct get complement {
    if (_precomputedComplement case final precomputedComplement?) {
      return precomputedComplement;
    }
    final coldestHue = _coldest.hue;
    final coldestTemp = _tempsByHct[_coldest]!;
    final warmestHue = _warmest.hue;
    final warmestTemp = _tempsByHct[_warmest]!;
    final range = warmestTemp - coldestTemp;
    final startHueIsColdestToWarmest = _isBetween(
      input.hue,
      coldestHue,
      warmestHue,
    );
    final startHue = startHueIsColdestToWarmest ? warmestHue : coldestHue;
    final endHue = startHueIsColdestToWarmest ? coldestHue : warmestHue;
    const directionOfRotation = 1.0;

    var smallestError = 1000.0;
    var answer = _hctsByHue[input.hue.round()];

    final complementRelativeTemp = 1.0 - getRelativeTemperature(input);

    // Find the color in the other section, closest to the inverse percentile
    // of the input color. This is the complement.
    for (var hueAddend = 0.0; hueAddend <= 360.0; hueAddend += 1.0) {
      final hue = MathUtils.sanitizeDegreesDouble(
        startHue + directionOfRotation * hueAddend,
      );
      if (!_isBetween(hue, startHue, endHue)) {
        continue;
      }
      final possibleAnswer = _hctsByHue[hue.round()];
      final relativeTemp = (_tempsByHct[possibleAnswer]! - coldestTemp) / range;
      final error = (complementRelativeTemp - relativeTemp).abs();
      if (error < smallestError) {
        smallestError = error;
        answer = possibleAnswer;
      }
    }
    return _precomputedComplement = answer;
  }

  /// A set of colors with differing hues, equidistant in temperature.
  ///
  /// In art, this is usually described as a set of 5 colors on a color
  /// wheel divided into 12 sections. This method allows provision
  /// of either of those values.
  ///
  /// Behavior is undefined when [count] or [divisions] is `0`.
  /// When [divisions] < [count], colors repeat.
  List<Hct> getAnalogousColors([int count = 5, int divisions = 12]) {
    // The starting hue is the hue of the input color.
    final startHue = input.hue.round();
    final startHct = _hctsByHue[startHue];
    var lastTemp = getRelativeTemperature(startHct);

    final allColors = <Hct>[startHct];

    var absoluteTotalTempDelta = 0.0;
    for (var i = 0; i < 360; i++) {
      final hue = MathUtils.sanitizeDegreesInt(startHue + i);
      final hct = _hctsByHue[hue];
      final temp = getRelativeTemperature(hct);
      final tempDelta = (temp - lastTemp).abs();
      lastTemp = temp;
      absoluteTotalTempDelta += tempDelta;
    }

    var hueAddend = 1;
    final tempStep = absoluteTotalTempDelta / divisions;
    var totalTempDelta = 0.0;
    lastTemp = getRelativeTemperature(startHct);
    while (allColors.length < divisions) {
      final hue = MathUtils.sanitizeDegreesInt(startHue + hueAddend);
      final hct = _hctsByHue[hue];
      final temp = getRelativeTemperature(hct);
      final tempDelta = (temp - lastTemp).abs();
      totalTempDelta += tempDelta;

      var desiredTotalTempDeltaForIndex = allColors.length * tempStep;
      var indexSatisfied = totalTempDelta >= desiredTotalTempDeltaForIndex;
      var indexAddend = 1;
      // Keep adding this hue to the answers until its temperature is
      // insufficient. This ensures consistent behavior when there aren't
      // `divisions` discrete steps between 0 and 360 in hue with `tempStep`
      // delta in temperature between them.
      //
      // For example, white and black have no analogues: there are no other
      // colors at T100/T0. Therefore, they should just be added to the array
      // as answers.
      while (indexSatisfied && allColors.length < divisions) {
        allColors.add(hct);
        desiredTotalTempDeltaForIndex =
            (allColors.length + indexAddend) * tempStep;
        indexSatisfied = totalTempDelta >= desiredTotalTempDeltaForIndex;
        indexAddend++;
      }
      lastTemp = temp;
      hueAddend++;

      if (hueAddend > 360) {
        while (allColors.length < divisions) {
          allColors.add(hct);
        }
        break;
      }
    }

    final answers = <Hct>[input];

    final ccwCount = ((count - 1.0) / 2.0).floor();
    for (var i = 1; i < (ccwCount + 1); i++) {
      var index = 0 - i;
      while (index < 0) {
        index = allColors.length + index;
      }
      if (index >= allColors.length) {
        index = index % allColors.length;
      }
      answers.insert(0, allColors[index]);
    }

    final cwCount = count - ccwCount - 1;
    for (var i = 1; i < (cwCount + 1); i++) {
      var index = i;
      while (index < 0) {
        index = allColors.length + index;
      }
      if (index >= allColors.length) {
        index = index % allColors.length;
      }
      answers.add(allColors[index]);
    }

    return answers;
  }

  /// Temperature relative to all colors with the same chroma and tone.
  ///
  /// Returns a value on a scale from 0 to 1.
  double getRelativeTemperature(Hct hct) {
    final range = _tempsByHct[_warmest]! - _tempsByHct[_coldest]!;
    final differenceFromColdest = _tempsByHct[hct]! - _tempsByHct[_coldest]!;
    // Handle when there's no difference in temperature between warmest and
    // coldest: for example, at T100, only one color is available, white.
    return range == 0.0 ? 0.5 : differenceFromColdest / range;
  }

  /// Coldest color with same chroma and tone as input.
  Hct get _coldest => _hctsByTemp.first;

  List<Hct> get _hctsByHue {
    if (_precomputedHctsByHue case final precomputedHctsByHue?) {
      return precomputedHctsByHue;
    }
    final hcts = <Hct>[];
    for (var hue = 0.0; hue <= 360.0; hue += 1.0) {
      final colorAtHue = Hct.from(hue, input.chroma, input.tone);
      hcts.add(colorAtHue);
    }
    return _precomputedHctsByHue = UnmodifiableListView(hcts);
  }

  List<Hct> get _hctsByTemp {
    if (_precomputedHctsByTemp case final precomputedHctsByTemp?) {
      return precomputedHctsByTemp;
    }
    final hcts = List.of(_hctsByHue)
      ..add(input)
      ..sort((a, b) => _tempsByHct[a]!.compareTo(_tempsByHct[b]!));
    return _precomputedHctsByTemp = hcts;
  }

  Map<Hct, double> get _tempsByHct {
    if (_precomputedTempsByHct case final precomputedTempsByHct?) {
      return precomputedTempsByHct;
    }
    final allHcts = List.of(_hctsByHue)..add(input);
    final temperaturesByHct = <Hct, double>{};
    for (final hct in allHcts) {
      temperaturesByHct[hct] = rawTemperature(hct);
    }
    return _precomputedTempsByHct = temperaturesByHct;
  }

  /// Warmest color with same chroma and tone as input.
  Hct get _warmest => _hctsByTemp.last;

  /// Value representing cool-warm factor of a color.
  /// Values below 0 are considered cool, above, warm.
  ///
  /// Color science has researched emotion and harmony,
  /// which art uses to select colors. Warm-cool is the foundation of analogous
  /// and complementary colors.
  ///
  /// See:
  /// - Li-Chen Ou's Chapter 19 in Handbook of Color Psychology (2015).
  /// - Josef Albers' Interaction of Color chapters 19 and 21.
  ///
  /// Implementation of Ou, Woodcock and Wright's algorithm,
  /// which uses Lab/LCH color space.
  ///
  /// Return value has these properties:
  /// - Values below 0 are cool, above 0 are warm.
  /// - Lower bound: -9.66. Chroma is infinite. Assuming max of Lab chroma 130.
  /// - Upper bound: 8.61. Chroma is infinite. Assuming max of Lab chroma 130.
  static double rawTemperature(Hct color) {
    final lab = ColorUtils.labFromArgb(color.toInt());
    final hue = MathUtils.sanitizeDegreesDouble(
      MathUtils.toDegrees(math.atan2(lab[2], lab[1])),
    );
    final chroma = MathUtils.hypot(lab[1], lab[2]);
    return -0.5 +
        0.02 *
            math.pow(chroma, 1.07) *
            math.cos(
              MathUtils.toRadians(MathUtils.sanitizeDegreesDouble(hue - 50.0)),
            );
  }

  /// Determines if an angle is between two other angles, rotating clockwise.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static bool _isBetween(double angle, double a, double b) =>
      a < b ? a <= angle && angle <= b : a <= angle || angle <= b;
}
