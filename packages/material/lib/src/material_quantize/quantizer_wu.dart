import 'package:material/material_color_utilities.dart'
    show ColorUtils, Quantizer, QuantizerResult;

import 'quantizer_map.dart';

/// An image quantizer that divides the image's pixels into clusters
/// by recursively cutting an RGB cube, based on the weight of pixels
/// in each area of the cube.
///
/// The algorithm was described by Xiaolin Wu in Graphic Gems II,
/// published in 1991.
final class QuantizerWu implements Quantizer {
  QuantizerWu();

  late List<int> _weights;
  late List<int> _momentsR;
  late List<int> _momentsG;
  late List<int> _momentsB;
  late List<double> _moments;
  late List<_Box> _cubes;

  @override
  QuantizerResult quantize(List<int> pixels, int colorCount) {
    final result = const QuantizerMap().quantize(pixels, colorCount);
    _constructHistogram(result.colorToCount);
    _computeMoments();
    final createBoxesResult = _createBoxes(colorCount);
    final colors = _createResult(createBoxesResult.resultCount);
    return QuantizerResult(
      colorToCount: {for (final color in colors) color: 0},
    );
  }

  void _constructHistogram(Map<int, int> pixels) {
    _weights = List.filled(_totalSize, 0, growable: false);
    _momentsR = List.filled(_totalSize, 0, growable: false);
    _momentsG = List.filled(_totalSize, 0, growable: false);
    _momentsB = List.filled(_totalSize, 0, growable: false);
    _moments = List.filled(_totalSize, 0, growable: false);

    for (final MapEntry(key: pixel, value: count) in pixels.entries) {
      final red = ColorUtils.redFromArgb(pixel);
      final green = ColorUtils.greenFromArgb(pixel);
      final blue = ColorUtils.blueFromArgb(pixel);
      const bitsToRemove = 8 - _indexBits;
      final iR = (red >> bitsToRemove) + 1;
      final iG = (green >> bitsToRemove) + 1;
      final iB = (blue >> bitsToRemove) + 1;
      final index = _getIndex(iR, iG, iB);
      _weights[index] += count;
      _momentsR[index] += red * count;
      _momentsG[index] += green * count;
      _momentsB[index] += blue * count;
      _moments[index] +=
          count * ((red * red) + (green * green) + (blue * blue));
    }
  }

  void _computeMoments() {
    for (var r = 1; r < _indexCount; ++r) {
      final area = List<int>.filled(_indexCount, 0, growable: false);
      final areaR = List<int>.filled(_indexCount, 0, growable: false);
      final areaG = List<int>.filled(_indexCount, 0, growable: false);
      final areaB = List<int>.filled(_indexCount, 0, growable: false);
      final area2 = List<double>.filled(_indexCount, 0.0, growable: false);
      for (var g = 1; g < _indexCount; g++) {
        var line = 0;
        var lineR = 0;
        var lineG = 0;
        var lineB = 0;
        var line2 = 0.0;
        for (var b = 1; b < _indexCount; b++) {
          final index = _getIndex(r, g, b);
          line += _weights[index];
          lineR += _momentsR[index];
          lineG += _momentsG[index];
          lineB += _momentsB[index];
          line2 += _moments[index];

          area[b] += line;
          areaR[b] += lineR;
          areaG[b] += lineG;
          areaB[b] += lineB;
          area2[b] += line2;

          final previousIndex = _getIndex(r - 1, g, b);
          _weights[index] = _weights[previousIndex] + area[b];
          _momentsR[index] = _momentsR[previousIndex] + areaR[b];
          _momentsG[index] = _momentsG[previousIndex] + areaG[b];
          _momentsB[index] = _momentsB[previousIndex] + areaB[b];
          _moments[index] = _moments[previousIndex] + area2[b];
        }
      }
    }
  }

  _CreateBoxesResult _createBoxes(int maxColorCount) {
    _cubes = List.generate(maxColorCount, (index) => _Box(), growable: false);
    _cubes.first
      ..r1 = _maxIndex
      ..g1 = _maxIndex
      ..b1 = _maxIndex;

    final volumeVariance = List<double>.filled(
      maxColorCount,
      0.0,
      growable: false,
    );
    var next = 0;
    var generatedColorCount = maxColorCount;
    for (var i = 1; i < maxColorCount; i++) {
      if (_cut(_cubes[next], _cubes[i])) {
        volumeVariance[next] = (_cubes[next].vol > 1)
            ? _variance(_cubes[next])
            : 0.0;
        volumeVariance[i] = (_cubes[i].vol > 1) ? _variance(_cubes[i]) : 0.0;
      } else {
        volumeVariance[next] = 0.0;
        i--;
      }

      next = 0;
      var temp = volumeVariance[0];
      for (var j = 1; j <= i; j++) {
        if (volumeVariance[j] > temp) {
          temp = volumeVariance[j];
          next = j;
        }
      }
      if (temp <= 0.0) {
        generatedColorCount = i + 1;
        break;
      }
    }

    return _CreateBoxesResult(
      requestedCount: maxColorCount,
      resultCount: generatedColorCount,
    );
  }

  List<int> _createResult(int colorCount) {
    final colors = <int>[];
    for (var i = 0; i < colorCount; ++i) {
      final cube = _cubes[i];
      final weight = _volume(cube, _weights);
      if (weight > 0) {
        final r = (_volume(cube, _momentsR) / weight).round();
        final g = (_volume(cube, _momentsG) / weight).round();
        final b = (_volume(cube, _momentsB) / weight).round();
        final color = ColorUtils.argbFromRgb(r, g, b);
        colors.add(color);
      }
    }
    return colors;
  }

  double _variance(_Box cube) {
    final dr = _volume(cube, _momentsR);
    final dg = _volume(cube, _momentsG);
    final db = _volume(cube, _momentsB);
    final xx =
        _moments[_getIndex(cube.r1, cube.g1, cube.b1)] -
        _moments[_getIndex(cube.r1, cube.g1, cube.b0)] -
        _moments[_getIndex(cube.r1, cube.g0, cube.b1)] +
        _moments[_getIndex(cube.r1, cube.g0, cube.b0)] -
        _moments[_getIndex(cube.r0, cube.g1, cube.b1)] +
        _moments[_getIndex(cube.r0, cube.g1, cube.b0)] +
        _moments[_getIndex(cube.r0, cube.g0, cube.b1)] -
        _moments[_getIndex(cube.r0, cube.g0, cube.b0)];

    final hypotenuse = dr * dr + dg * dg + db * db;
    final volume_ = _volume(cube, _weights);
    return xx - hypotenuse / volume_;
  }

  bool _cut(_Box one, _Box two) {
    final wholeR = _volume(one, _momentsR);
    final wholeG = _volume(one, _momentsG);
    final wholeB = _volume(one, _momentsB);
    final wholeW = _volume(one, _weights);

    final maxRResult = _maximize(
      one,
      .red,
      one.r0 + 1,
      one.r1,
      wholeR,
      wholeG,
      wholeB,
      wholeW,
    );
    final maxGResult = _maximize(
      one,
      .green,
      one.g0 + 1,
      one.g1,
      wholeR,
      wholeG,
      wholeB,
      wholeW,
    );
    final maxBResult = _maximize(
      one,
      .blue,
      one.b0 + 1,
      one.b1,
      wholeR,
      wholeG,
      wholeB,
      wholeW,
    );

    _Direction cutDirection;
    final maxR = maxRResult.maximum;
    final maxG = maxGResult.maximum;
    final maxB = maxBResult.maximum;
    if (maxR >= maxG && maxR >= maxB) {
      cutDirection = .red;
      if (maxRResult.cutLocation < 0) {
        return false;
      }
    } else if (maxG >= maxR && maxG >= maxB) {
      cutDirection = .green;
    } else {
      cutDirection = .blue;
    }

    two
      ..r1 = one.r1
      ..g1 = one.g1
      ..b1 = one.b1;

    switch (cutDirection) {
      case .red:
        one.r1 = maxRResult.cutLocation;
        two.r0 = one.r1;
        two.g0 = one.g0;
        two.b0 = one.b0;
      case .green:
        one.g1 = maxGResult.cutLocation;
        two.r0 = one.r0;
        two.g0 = one.g1;
        two.b0 = one.b0;
      case .blue:
        one.b1 = maxBResult.cutLocation;
        two.r0 = one.r0;
        two.g0 = one.g0;
        two.b0 = one.b1;
    }

    one.vol = (one.r1 - one.r0) * (one.g1 - one.g0) * (one.b1 - one.b0);
    two.vol = (two.r1 - two.r0) * (two.g1 - two.g0) * (two.b1 - two.b0);
    return true;
  }

  _MaximizeResult _maximize(
    _Box cube,
    _Direction direction,
    int first,
    int last,
    int wholeR,
    int wholeG,
    int wholeB,
    int wholeW,
  ) {
    final bottomR = _bottom(cube, direction, _momentsR);
    final bottomG = _bottom(cube, direction, _momentsG);
    final bottomB = _bottom(cube, direction, _momentsB);
    final bottomW = _bottom(cube, direction, _weights);

    var max = 0.0;
    var cut = -1;

    for (var i = first; i < last; i++) {
      var halfR = bottomR + _top(cube, direction, i, _momentsR);
      var halfG = bottomG + _top(cube, direction, i, _momentsG);
      var halfB = bottomB + _top(cube, direction, i, _momentsB);
      var halfW = bottomW + _top(cube, direction, i, _weights);

      if (halfW == 0) continue;

      var tempNumerator = halfR * halfR + halfG * halfG + halfB * halfB;
      var tempDenominator = halfW;
      var temp = tempNumerator / tempDenominator;

      halfR = wholeR - halfR;
      halfG = wholeG - halfG;
      halfB = wholeB - halfB;
      halfW = wholeW - halfW;

      if (halfW == 0) continue;

      tempNumerator = halfR * halfR + halfG * halfG + halfB * halfB;
      tempDenominator = halfW;
      temp += tempNumerator / tempDenominator;

      if (temp > max) {
        max = temp;
        cut = i;
      }
    }
    return _MaximizeResult(cutLocation: cut, maximum: max);
  }

  static const _indexBits = 5;
  static const _indexCount = (1 << _indexBits) + 1; // 33
  static const _maxIndex = _indexCount - 1;
  static const _totalSize = _indexCount * _indexCount * _indexCount; // 35937

  static int _getIndex(int r, int g, int b) =>
      (r << (_indexBits * 2)) +
      (r << (_indexBits + 1)) +
      (g << _indexBits) +
      r +
      g +
      b;

  static int _volume(_Box cube, List<int> moment) =>
      moment[_getIndex(cube.r1, cube.g1, cube.b1)] -
      moment[_getIndex(cube.r1, cube.g1, cube.b0)] -
      moment[_getIndex(cube.r1, cube.g0, cube.b1)] +
      moment[_getIndex(cube.r1, cube.g0, cube.b0)] -
      moment[_getIndex(cube.r0, cube.g1, cube.b1)] +
      moment[_getIndex(cube.r0, cube.g1, cube.b0)] +
      moment[_getIndex(cube.r0, cube.g0, cube.b1)] -
      moment[_getIndex(cube.r0, cube.g0, cube.b0)];

  static int _bottom(_Box cube, _Direction direction, List<int> moment) =>
      switch (direction) {
        .red =>
          -moment[_getIndex(cube.r0, cube.g1, cube.b1)] +
              moment[_getIndex(cube.r0, cube.g1, cube.b0)] +
              moment[_getIndex(cube.r0, cube.g0, cube.b1)] -
              moment[_getIndex(cube.r0, cube.g0, cube.b0)],
        .green =>
          -moment[_getIndex(cube.r1, cube.g0, cube.b1)] +
              moment[_getIndex(cube.r1, cube.g0, cube.b0)] +
              moment[_getIndex(cube.r0, cube.g0, cube.b1)] -
              moment[_getIndex(cube.r0, cube.g0, cube.b0)],
        .blue =>
          -moment[_getIndex(cube.r1, cube.g1, cube.b0)] +
              moment[_getIndex(cube.r1, cube.g0, cube.b0)] +
              moment[_getIndex(cube.r0, cube.g1, cube.b0)] -
              moment[_getIndex(cube.r0, cube.g0, cube.b0)],
      };

  static int _top(
    _Box cube,
    _Direction direction,
    int position,
    List<int> moment,
  ) => switch (direction) {
    .red =>
      moment[_getIndex(position, cube.g1, cube.b1)] -
          moment[_getIndex(position, cube.g1, cube.b0)] -
          moment[_getIndex(position, cube.g0, cube.b1)] +
          moment[_getIndex(position, cube.g0, cube.b0)],
    .green =>
      moment[_getIndex(cube.r1, position, cube.b1)] -
          moment[_getIndex(cube.r1, position, cube.b0)] -
          moment[_getIndex(cube.r0, position, cube.b1)] +
          moment[_getIndex(cube.r0, position, cube.b0)],
    .blue =>
      moment[_getIndex(cube.r1, cube.g1, position)] -
          moment[_getIndex(cube.r1, cube.g0, position)] -
          moment[_getIndex(cube.r0, cube.g1, position)] +
          moment[_getIndex(cube.r0, cube.g0, position)],
  };
}

enum _Direction { red, green, blue }

extension type const _MaximizeResult._(({int cutLocation, double maximum}) _) {
  const _MaximizeResult({required int cutLocation, required double maximum})
    : this._((cutLocation: cutLocation, maximum: maximum));

  // < 0 if cut impossible
  int get cutLocation => _.cutLocation;

  double get maximum => _.maximum;
}

extension type const _CreateBoxesResult._(
  ({int requestedCount, int resultCount}) _
) {
  const _CreateBoxesResult({
    required int requestedCount,
    required int resultCount,
  }) : this._((requestedCount: requestedCount, resultCount: resultCount));

  int get requestedCount => _.requestedCount;

  int get resultCount => _.resultCount;
}

final class _Box {
  _Box({
    this.r0 = 0,
    this.r1 = 0,
    this.g0 = 0,
    this.g1 = 0,
    this.b0 = 0,
    this.b1 = 0,
    this.vol = 0,
  });

  int r0;
  int r1;
  int g0;
  int g1;
  int b0;
  int b1;
  int vol;
}
