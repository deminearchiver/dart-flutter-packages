import 'package:flutter/gestures.dart';

extension type const _PointAtTime._((double point, Duration time) _)
    implements Object {
  const _PointAtTime(double point, Duration time) : this._((point, time));

  double get point => _.$1;

  Duration get time => _.$2;
}

class AxisVelocityEstimate {
  const AxisVelocityEstimate({
    required this.velocity,
    required this.confidence,
    required this.duration,
    required this.offset,
  });

  final double velocity;

  final double confidence;

  final Duration duration;

  final double offset;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AxisVelocityEstimate &&
          velocity == other.velocity &&
          confidence == other.confidence &&
          duration == other.duration &&
          offset == other.offset;

  @override
  int get hashCode => Object.hash(velocity, confidence, duration, offset);
}

class AxisVelocityTracker {
  AxisVelocityTracker({SamplingClock? samplingClock})
    : _samplingClock = samplingClock ?? GestureBinding.instance.samplingClock;

  final SamplingClock _samplingClock;

  Stopwatch? _stopwatch;

  Stopwatch get _sinceLastSample {
    _stopwatch ??= _samplingClock.stopwatch();
    return _stopwatch!;
  }

  final _samples = List<_PointAtTime?>.filled(_historySize, null);

  var _index = 0;

  /// Adds a position as the given time to the tracker.
  void addPosition(Duration time, double position) {
    _sinceLastSample
      ..start()
      ..reset();
    _index += 1;
    if (_index == _historySize) _index = 0;
    _samples[_index] = _PointAtTime(position, time);
  }

  AxisVelocityEstimate? get velocityEstimate {
    if (_sinceLastSample.elapsedMilliseconds >
        _assumePointerMoveStoppedMilliseconds) {
      return const AxisVelocityEstimate(
        velocity: 0.0,
        confidence: 1.0,
        duration: .zero,
        offset: 0.0,
      );
    }
    final x = <double>[];
    final w = <double>[];
    final time = <double>[];
    var sampleCount = 0;
    var index = _index;

    final newestSample = _samples[index];
    if (newestSample == null) return null;

    var previousSample = newestSample;
    var oldestSample = newestSample;
    do {
      final sample = _samples[index];
      if (sample == null) break;
      final age = (newestSample.time - sample.time).inMicroseconds / 1000;
      final delta =
          (sample.time - previousSample.time).inMicroseconds.abs() / 1000;
      previousSample = sample;
      if (age > _horizonMilliseconds ||
          delta > _assumePointerMoveStoppedMilliseconds) {
        break;
      }
      oldestSample = sample;
      final position = sample.point;
      x.add(position);
      w.add(1.0);
      time.add(-age);
      index = (index == 0 ? _historySize : index) - 1;
      sampleCount += 1;
    } while (sampleCount < _historySize);

    if (sampleCount >= _minSampleSize) {
      final fit = LeastSquaresSolver(time, x, w).solve(2);
      if (fit != null) {
        return AxisVelocityEstimate(
          velocity: fit.coefficients[1] * 1000,
          confidence: fit.confidence,
          duration: newestSample.time - oldestSample.time,
          offset: newestSample.point - oldestSample.point,
        );
      }
    }
    return AxisVelocityEstimate(
      velocity: 0.0,
      confidence: 1.0,
      duration: newestSample.time - oldestSample.time,
      offset: newestSample.point - oldestSample.point,
    );
  }

  double get velocity {
    final estimate = velocityEstimate;
    return estimate != null && estimate.velocity != 0.0
        ? estimate.velocity
        : 0.0;
  }

  void reset() {
    _stopwatch = null;
    _samples.fillRange(0, _samples.length, null);
    _index = 0;
  }

  static const _assumePointerMoveStoppedMilliseconds = 40;
  static const _historySize = 20;
  static const _horizonMilliseconds = 100;
  static const _minSampleSize = 3;
}
