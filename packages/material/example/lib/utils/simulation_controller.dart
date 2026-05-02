import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

enum AnimationDirection {
  /// The animation is running from beginning to end.
  forward,

  /// The animation is running backwards, from end to beginning.
  reverse;

  AnimationDirection get inverted => switch (this) {
    .forward => .reverse,
    .reverse => .forward,
  };

  AnimationStatus toStatus(bool isAnimating, {bool invert = false}) {
    final isForward = this == .forward;
    return invert
        ? isAnimating
              ? (isForward ? .reverse : .forward)
              : (isForward ? .dismissed : .completed)
        : isAnimating
        ? (isForward ? .forward : .reverse)
        : (isForward ? .completed : .dismissed);
  }
}

class SimulationController extends Animation<double>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  SimulationController({
    required TickerProvider vsync,
    this.animationBehavior = .normal,
    this.lowerBound = 0.0,
    this.upperBound = 1.0,
    double? value,
    this.debugLabel,
  }) : assert(upperBound >= lowerBound),
       _direction = .forward {
    assert(debugMaybeDispatchCreated("animation", "AnimationController", this));
    _ticker = vsync.createTicker(_tick);
    _internalSetValue(value ?? lowerBound);
  }

  SimulationController.unbounded({
    required TickerProvider vsync,
    this.animationBehavior = .preserve,
    double value = 0.0,
    this.debugLabel,
  }) : lowerBound = .negativeInfinity,
       upperBound = .infinity,
       _direction = .forward {
    assert(debugMaybeDispatchCreated("animation", "AnimationController", this));
    _ticker = vsync.createTicker(_tick);
    _internalSetValue(value);
  }

  Ticker? _ticker;

  void resync(TickerProvider vsync) {
    _ticker = vsync.createTicker(_tick)..absorbTicker(_ticker!);
  }

  final AnimationBehavior animationBehavior;

  final double lowerBound;

  final double upperBound;

  late double _value;

  @override
  double get value => _value;

  set value(double newValue) {
    stop();
    _internalSetValue(newValue);
    notifyListeners();
    _checkStatusChanged();
  }

  final String? debugLabel;

  Simulation? _simulation;

  late TickerFuture _lastTickerFuture;

  double get velocity {
    if (!isAnimating) return 0.0;
    return _simulation!.dx(
      lastElapsedDuration!.inMicroseconds / Duration.microsecondsPerSecond,
    );
  }

  void _internalSetValue(double newValue) {
    _value = clampDouble(newValue, lowerBound, upperBound);
    if (_value == lowerBound) {
      _status = .dismissed;
    } else if (_value == upperBound) {
      _status = .completed;
    } else {
      _status = _direction.toStatus(true);
    }
  }

  Duration? _lastElapsedDuration;

  Duration? get lastElapsedDuration => _lastElapsedDuration;

  @override
  bool get isAnimating => _ticker != null && _ticker!.isActive;

  AnimationDirection _direction;

  late AnimationStatus _status;

  @override
  AnimationStatus get status => _status;

  AnimationStatus _lastReportedStatus = .dismissed;

  void _checkStatusChanged() {
    if (_lastReportedStatus == _status) return;
    _lastReportedStatus = _status;
    notifyStatusListeners(_status);
  }

  TickerFuture _startSimulation(Simulation simulation) {
    _simulation = simulation;
    _lastElapsedDuration = .zero;
    _value = clampDouble(simulation.x(0.0), lowerBound, upperBound);

    final result = !isAnimating
        ? _lastTickerFuture = _ticker!.start()
        : _lastTickerFuture;
    _status = _direction.toStatus(true);
    _checkStatusChanged();
    return result;
  }

  TickerFuture animateWith(
    Simulation simulation,
    AnimationDirection direction, {
    bool resetTicker = true,
  }) {
    assert(debugAssertNotDisposedInMethodCall(this, "animateWith"));

    _simulation = null;
    _lastElapsedDuration = null;
    if (resetTicker) _ticker!.stop(canceled: true);

    _direction = direction;
    return _startSimulation(simulation);
  }

  void stop({bool canceled = true}) {
    assert(debugAssertNotDisposedInMethodCall(this, "stop"));
    _simulation = null;
    _lastElapsedDuration = null;
    _ticker!.stop(canceled: canceled);
  }

  void _tick(Duration elapsed) {
    _lastElapsedDuration = elapsed;
    final elapsedInSeconds =
        elapsed.inMicroseconds / Duration.microsecondsPerSecond;
    assert(elapsedInSeconds >= 0.0);
    _value = clampDouble(
      _simulation!.x(elapsedInSeconds),
      lowerBound,
      upperBound,
    );
    if (_simulation!.isDone(elapsedInSeconds)) {
      _status = _direction.toStatus(false);
      stop(canceled: false);
    }
    notifyListeners();
    _checkStatusChanged();
  }

  @mustCallSuper
  @override
  void dispose() {
    assert(debugAssertNotDisposed(this));
    assert(debugMaybeDispatchDisposed(this));

    _ticker!.dispose();
    _ticker = null;

    clearStatusListeners();
    clearListeners();

    super.dispose();
  }

  @override
  String toStringDetails() {
    final paused = isAnimating ? "" : "; paused";
    final ticker = _ticker == null
        ? "; DISPOSED"
        : (_ticker!.muted ? "; silenced" : "");
    var label = "";
    assert(() {
      if (debugLabel != null) label = "; for $debugLabel";
      return true;
    }());
    final more = "${super.toStringDetails()} ${value.toStringAsFixed(3)}";
    return "$more$paused$ticker$label";
  }

  static bool debugAssertNotDisposed(SimulationController controller) {
    assert(() {
      if (controller._ticker == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary("AnimationController.dispose() called more than once."),
          ErrorDescription(
            "A given ${controller.runtimeType} cannot be disposed more than once.\n",
          ),
          DiagnosticsProperty<SimulationController>(
            "The following ${controller.runtimeType} object was disposed multiple times",
            controller,
            style: .errorProperty,
          ),
        ]);
      }
      return true;
    }());
    return true;
  }

  static bool debugAssertNotDisposedInMethodCall(
    SimulationController controller,
    String methodName,
  ) {
    assert(() {
      if (controller._ticker == null) {
        throw FlutterError(
          "AnimationController.$methodName() called after AnimationController.dispose()\n"
          "AnimationController methods should not be used after calling dispose.",
        );
      }
      return true;
    }());
    return true;
  }
}

class _InterpolationSimulation extends Simulation {
  _InterpolationSimulation({
    required this.duration,
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.linear,
    this.scale = 1.0,
  }) : assert(duration.inMicroseconds > 0),
       _durationInSeconds =
           (duration.inMicroseconds * scale) / Duration.microsecondsPerSecond;

  final Duration duration;

  final double begin;

  final double end;

  final Curve curve;

  final double scale;

  final double _durationInSeconds;

  @override
  double x(double timeInSeconds) {
    final t = clampDouble(timeInSeconds / _durationInSeconds, 0.0, 1.0);
    return switch (t) {
      0.0 => begin,
      1.0 => end,
      _ => begin + (end - begin) * curve.transform(t),
    };
  }

  @override
  double dx(double timeInSeconds) {
    final epsilon = tolerance.time;
    return (x(timeInSeconds + epsilon) - x(timeInSeconds - epsilon)) /
        (2.0 * epsilon);
  }

  @override
  bool isDone(double timeInSeconds) => timeInSeconds > _durationInSeconds;
}

typedef _DirectionSetter = void Function(AnimationDirection direction);

class _RepeatingSimulation extends Simulation {
  _RepeatingSimulation(
    double initialValue,
    this.min,
    this.max,
    this.reverse,
    Duration period,
    this.directionSetter,
    this.count,
  ) : assert(
        count == null || count > 0,
        "Count shall be greater than zero if not null",
      ),
      _periodInSeconds = period.inMicroseconds / Duration.microsecondsPerSecond,
      _initialT = (max == min)
          ? 0.0
          : ((clampDouble(initialValue, min, max) - min) / (max - min)) *
                (period.inMicroseconds / Duration.microsecondsPerSecond) {
    assert(_periodInSeconds > 0.0);
    assert(_initialT >= 0.0);
  }

  final double min;
  final double max;
  final bool reverse;
  final int? count;
  final _DirectionSetter directionSetter;

  final double _periodInSeconds;
  final double _initialT;

  late final _exitTimeInSeconds = (count! * _periodInSeconds) - _initialT;

  @override
  double x(double timeInSeconds) {
    assert(timeInSeconds >= 0.0);

    final totalTimeInSeconds = timeInSeconds + _initialT;
    final t = (totalTimeInSeconds / _periodInSeconds) % 1.0;
    final isPlayingReverse = (totalTimeInSeconds ~/ _periodInSeconds).isOdd;

    if (reverse && isPlayingReverse) {
      directionSetter(AnimationDirection.reverse);
      return lerpDouble(max, min, t);
    } else {
      directionSetter(AnimationDirection.forward);
      return lerpDouble(min, max, t);
    }
  }

  @override
  double dx(double timeInSeconds) => (max - min) / _periodInSeconds;

  @override
  bool isDone(double timeInSeconds) {
    // if [timeInSeconds] elapsed the [_exitTimeInSeconds] && [count] is not null,
    // consider marking the simulation as "DONE"
    return count != null && (timeInSeconds >= _exitTimeInSeconds);
  }
}
