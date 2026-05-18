import '../hct/hct.dart';
import '../utils/math_utils.dart';

/// Given a large set of colors, remove colors that are unsuitable for
/// a UI theme, and rank the rest based on suitability.
///
/// Enables use of a high cluster count for image quantization, thus ensuring
/// colors aren't muddied, while curating the high cluster count
/// to a much smaller number of appropriate choices.
abstract final class Score {
  static const _targetChroma = 48.0; // A1 Chroma
  static const _weightProportion = 0.7;
  static const _weightChromaAbove = 0.3;
  static const _weightChromaBelow = 0.1;
  static const _cutoffChroma = 5.0;
  static const _cutoffExcitedProportion = 0.01;

  /// Given a map with keys of colors and values of how often the color appears, rank the colors
  /// based on suitability for being used for a UI theme.
  ///
  /// Returns colors sorted by suitability for a UI theme. The most suitable
  /// color is the first item, the least suitable is the last. There will
  /// always be at least one color returned. If all the input colors were not
  /// suitable for a theme, a default fallback color will be provided,
  /// Google Blue.
  static List<int> score(
    Map<int, int> colorsToPopulation, {
    int desired = 4,
    int fallbackColorArgb = 0xff4285f4,
    bool filter = true,
  }) {
    // Get the HCT color for each Argb value, while finding the per hue count and
    // total count.
    final colorsHct = <Hct>[];
    final huePopulation = List<int>.filled(360, 0);
    var populationSum = 0;
    for (final MapEntry(:key, :value) in colorsToPopulation.entries) {
      final hct = Hct.fromInt(key);
      colorsHct.add(hct);
      final hue = hct.hue.floor();
      huePopulation[hue] += value;
      populationSum += value;
    }

    // Hues with more usage in neighboring 30 degree slice get a larger number.
    final hueExcitedProportions = List<double>.filled(360, 0.0);
    for (var hue = 0; hue < 360; hue++) {
      final proportion = huePopulation[hue] / populationSum;
      for (var i = hue - 14; i < hue + 16; i++) {
        final neighborHue = MathUtils.sanitizeDegreesInt(i);
        hueExcitedProportions[neighborHue] += proportion;
      }
    }

    // Scores each HCT color based on usage and chroma, while optionally
    // filtering out values that do not have enough chroma or usage.
    final scoredHcts = <_ScoredHct>[];
    for (final hct in colorsHct) {
      final hue = MathUtils.sanitizeDegreesInt(hct.hue.round());
      final proportion = hueExcitedProportions[hue];
      if (filter &&
          (hct.chroma < _cutoffChroma ||
              proportion <= _cutoffExcitedProportion)) {
        continue;
      }
      final proportionScore = proportion * 100.0 * _weightProportion;
      final chromaWeight = hct.chroma < _targetChroma
          ? _weightChromaBelow
          : _weightChromaAbove;
      final chromaScore = (hct.chroma - _targetChroma) * chromaWeight;
      final score = proportionScore + chromaScore;
      scoredHcts.add(_ScoredHct(hct, score));
    }

    // Sorted so that colors with higher scores come first.
    scoredHcts.sort(_scoredComparator);

    // Iterates through potential hue differences in degrees in order to select
    // the colors with the largest distribution of hues possible. Starting at
    // 90 degrees(maximum difference for 4 colors) then decreasing down to a
    // 15 degree minimum.
    final chosenColors = <Hct>[];
    for (
      var differenceDegrees = 90;
      differenceDegrees >= 15;
      differenceDegrees--
    ) {
      chosenColors.clear();
      for (final entry in scoredHcts) {
        final hct = entry.hct;
        var hasDuplicateHue = false;
        for (final chosenHct in chosenColors) {
          if (MathUtils.differenceDegrees(hct.hue, chosenHct.hue) <
              differenceDegrees) {
            hasDuplicateHue = true;
            break;
          }
        }
        if (!hasDuplicateHue) chosenColors.add(hct);
        if (chosenColors.length >= desired) break;
      }
      if (chosenColors.length >= desired) break;
    }

    final colors = <int>[
      if (chosenColors.isEmpty) fallbackColorArgb,
      for (final chosenHct in chosenColors) chosenHct.toInt(),
    ];

    return colors;
  }
}

extension type const _ScoredHct._(({Hct hct, double score}) _) {
  const _ScoredHct(Hct hct, double score) : this._((hct: hct, score: score));

  Hct get hct => _.hct;

  double get score => _.score;
}

int _scoredComparator(_ScoredHct entry1, _ScoredHct entry2) =>
    entry2.score.compareTo(entry1.score);
