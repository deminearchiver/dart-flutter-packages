import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

/// Detaching threshold in dp
const _kMagneticDetachThreshold = 72.0;

/// Re-attaching threshold in dp
const _kMagneticAttachThreshold = 56.0;

const _kMagneticTranslationMultiplier = 0.5;

/// Multipliers applied to the translation of magnetically-coupled views.
/// This list must be symmetric with an odd size, where the center multiplier
/// applies to the view that is currently being swiped. From the center
/// outwards, the multipliers apply to the neighbors of the swiped view.
const _kMagneticTranslationMultipliers = <double>[
  0.04,
  0.12,
  _kMagneticTranslationMultiplier,
  0.12,
  0.04,
];

const _kMagneticReduction = 0.65;

// Spring parameters for physics animators
const _kDetachStiffness = 800.0;
const _kDetachDampingRatio = 0.95;
const _kSnapBackStiffness = 550.0;
const _kSnapBackDampingRatio = 0.6;
const _kAttachStiffness = 850.0;
const _kAttachDampingRatio = 0.95;

const _kDismissVelocity = 500.0;

final _kDetachSpring = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: _kDetachStiffness,
  ratio: _kDetachDampingRatio,
);

final _kSnapBackSpring = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: _kSnapBackStiffness,
  ratio: _kSnapBackDampingRatio,
);

final _kAttachSpring = SpringDescription.withDampingRatio(
  mass: 1.0,
  stiffness: _kAttachStiffness,
  ratio: _kAttachDampingRatio,
);

enum _State { idle, targetsSet, pulling, detached }

class MagneticSwipeConfiguration {}

class MagneticSwipeController {
  MagneticSwipeController();
}

class MagneticSwipe extends StatefulWidget {
  const MagneticSwipe({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  State<MagneticSwipe> createState() => _MagneticSwipeState();
}

class _MagneticSwipeState extends State<MagneticSwipe>
    with SingleTickerProviderStateMixin {
  final _gestureDetectorKey = GlobalKey();

  late _MagneticAnimation _controller1;
  var _physicalTranslation = 0.0;

  final _velocityTracker = AxisVelocityTracker();

  var _currentState = _State.idle;

  final _detachDirectionEstimator = _DirectionEstimator(10);

  double get _width {
    final box =
        _gestureDetectorKey.currentContext?.findRenderObject() as RenderBox?;
    try {
      return box != null && box.hasSize ? box.size.width : 1.0;
    } on Object {
      return 1.0;
    }
  }

  bool _isDismissible(double endVelocity) {
    final isEndVelocityLargeEnough = endVelocity.abs() >= _kDismissVelocity;
    late final shouldSnapBack =
        isEndVelocityLargeEnough &&
        _detachDirectionEstimator.direction != endVelocity.sign;
    return switch (_currentState) {
      .idle || .targetsSet || .pulling => isEndVelocityLargeEnough,
      .detached => !shouldSnapBack,
    };
  }

  void _attach(double translation) {
    final detachDirection = _detachDirectionEstimator.direction;
    final swipeVelocity = _velocityTracker.velocity;
    _controller1
      ..stop()
      ..animateExplicit(
        translation * _kMagneticTranslationMultiplier,
        _kAttachSpring,
        -detachDirection * swipeVelocity.abs(),
      );
    _detachDirectionEstimator.reset();
  }

  void _detach(double toPosition) {
    final direction = _detachDirectionEstimator.direction;
    final velocity = _velocityTracker.velocity;
    _controller1
      ..stop()
      ..animateExplicit(toPosition, _kDetachSpring, direction * velocity.abs());
  }

  void _pull(double translation, bool canSwipedBeDismissed) {
    _controller1.animateImplicit(
      canSwipedBeDismissed
          ? translation * _kMagneticTranslationMultiplier
          : translation * _kMagneticTranslationMultiplier * _kMagneticReduction,
    );
  }

  void _snapBack([double velocity = 0.0]) {
    _controller1.animateExplicit(
      0.0,
      _kSnapBackSpring,
      velocity * _kMagneticTranslationMultiplier,
    );
  }

  void _onDragDown(DragDownDetails details) {
    // print(
    //   "D: "
    //   "g ${details.globalPosition.dx} "
    //   "l ${details.localPosition.dx}",
    // );
    _physicalTranslation = 0.0;
  }

  void _onDragStart(DragStartDetails details) {
    // print(
    //   "S: "
    //   "g ${details.globalPosition.dx} "
    //   "l ${details.localPosition.dx} ///",
    // );
    _physicalTranslation = 0.0;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    assert(details.primaryDelta != null);
    final delta = details.primaryDelta!;
    _physicalTranslation += delta;
    _velocityTracker.addPosition(
      details.sourceTimeStamp!,
      details.globalPosition.dx,
    );

    switch (_currentState) {
      case .idle:
      case .targetsSet:
        _detachDirectionEstimator.add(_physicalTranslation);
        _pull(_physicalTranslation, true);
        _currentState = .pulling;
      case .pulling:
        _detachDirectionEstimator.add(_physicalTranslation);

        final crossedThreshold =
            _physicalTranslation.abs() >= _kMagneticDetachThreshold;
        if (crossedThreshold) {
          _detachDirectionEstimator.stop();
          _detach(_physicalTranslation);
          _currentState = .detached;
        } else {
          _pull(_physicalTranslation, true);
        }

      case .detached:
        _detachDirectionEstimator.add(_physicalTranslation);
        final crossedThreshold =
            _physicalTranslation.abs() <= _kMagneticAttachThreshold;
        if (crossedThreshold) {
          _attach(_physicalTranslation);
          _currentState = .pulling;
        } else {
          _controller1.animateImplicit(_physicalTranslation);
        }
    }

    // final crossedThreshold =
    //     _physicalTranslation.abs() >= _kMagneticDetachThreshold;
    // if (crossedThreshold) {
    //   _detachDirectionEstimator.stop();
    //   _detach(_physicalTranslation);
    //   _currentState = .detached;
    // } else {}

    // print(
    //   "U: "
    //   // "d ${delta.toStringAsFixed(1)} "
    //   "t ${(_physicalTranslation * 100).round()}% "
    //   "v ${_velocityTracker.velocity.toStringAsFixed(1)}",
    // );
  }

  void _onDragEnd(DragEndDetails details) {
    // final velocity = details.velocity.pixelsPerSecond.dx;
    // print(
    //   "E: "
    //   "v ${velocity.round()}dp ${(velocity / _width * 100).round()}% "
    //   "///",
    // );

    _detachDirectionEstimator.reset();
    _velocityTracker.reset();

    _physicalTranslation = 0.0;

    _snapBack(details.velocity.pixelsPerSecond.dx);
  }

  void _onDragCancel() {
    // print(
    //   "C "
    //   "///",
    // );
    _physicalTranslation = 0.0;
    _velocityTracker.reset();
  }

  @override
  void initState() {
    super.initState();
    _controller1 = _MagneticAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(covariant MagneticSwipe oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _gestureDetectorKey,
      behavior: .deferToChild,
      onHorizontalDragDown: _onDragDown,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragCancel: _onDragCancel,
      child: AnimatedBuilder(
        animation: _controller1,
        builder: (context, child) => Transform.translate(
          offset: Offset(_controller1.value, 0.0),
          transformHitTests: true,
          child: child,
        ),
        child: widget.builder(context),
      ),
    );
  }
}

class _MagneticAnimation implements Animation<double> {
  _MagneticAnimation({required TickerProvider vsync, double value = 0.0})
    : _controller = SimulationController.unbounded(vsync: vsync, value: value);

  final SimulationController _controller;

  late SpringDescription _spring;
  late double _startVelocity;

  void resync(TickerProvider vsync) {
    _controller.resync(vsync);
  }

  void animateImplicit(double to) {
    if (_controller.isAnimating) {
      final simulation = SpringSimulation(
        _spring,
        _controller.value,
        to,
        _controller.velocity,
        snapToEnd: true,
      );
      unawaited(
        _controller.animateWith(simulation, .forward, resetTicker: false),
      );
    } else {
      _controller.value = to;
    }
  }

  void animateExplicit(
    double to,
    SpringDescription spring,
    double startVelocity,
  ) {
    _spring = spring;
    _startVelocity = startVelocity;
    final simulation = SpringSimulation(
      _spring,
      _controller.value,
      to,
      _startVelocity,
      snapToEnd: true,
    );
    unawaited(_controller.animateWith(simulation, .forward));
  }

  void stop() {
    _controller.stop(canceled: true);
  }

  @mustCallSuper
  void dispose() {
    _controller.dispose();
  }

  @override
  void addListener(VoidCallback listener) {
    _controller.addListener(listener);
  }

  @override
  void addStatusListener(AnimationStatusListener listener) {
    _controller.addStatusListener(listener);
  }

  @override
  Animation<U> drive<U>(Animatable<U> child) => _controller.drive(child);

  @override
  bool get isAnimating => _controller.isAnimating;

  @override
  bool get isCompleted => _controller.isCompleted;

  @override
  bool get isDismissed => _controller.isDismissed;

  @override
  bool get isForwardOrCompleted => _controller.isForwardOrCompleted;

  @override
  void removeListener(VoidCallback listener) {
    _controller.removeListener(listener);
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    _controller.removeStatusListener(listener);
  }

  @override
  AnimationStatus get status => _controller.status;

  @override
  String toStringDetails() => _controller.toStringDetails();

  @override
  double get value => _controller.value;
}

/// A class to estimate the direction of a gesture translations
/// with a moving average.
///
/// The class holds a buffer that stores translations. When requested,
/// the direction of movement is estimated as the sign of the average value
/// from the buffer.
class _DirectionEstimator {
  _DirectionEstimator(int bufferSize)
    : assert(bufferSize > 0, "Buffer cannot be empty."),
      _bufferSize = bufferSize,
      _translationBuffer = .filled(bufferSize, 0.0, growable: false),
      _kernel = .generate(
        bufferSize,
        (index) =>
            -0.45 * math.cos(math.pi * ((index + 1) / bufferSize)) + 0.55,
        growable: false,
      );

  /// Size of the translation buffer.
  final int _bufferSize;

  // A ring buffer to hold past translations. This is a FIFO structure with a fixed size.
  final List<double> _translationBuffer;

  // The head points to the next available slot in the buffer.
  var _bufferHead = 0;

  /// A kernel function that multiplies values in the translation buffer
  /// to derive a weighted average.
  ///
  /// The kernel should give higher weights to most recent values in the buffer,
  /// and smaller weights to past values.
  final List<double> _kernel;

  var _acceptTranslations = true;

  var _direction = 0.0;

  /// The estimated direction of the translations. It will be estimated as
  /// the weighted average of the values in the translation buffer and set
  /// only once when the estimator is stopped.
  double get direction => _direction;

  /// Add a new translation to the translation buffer if translations are still
  /// being accepted (see [stop]). If the buffer is full, the last value is
  /// removed and the new one is added to the end.
  void add(double translation) {
    if (!_acceptTranslations) return;
    _translationBuffer[_bufferHead] = translation;
    // Move the head pointer, wrapping if necessary
    _bufferHead = (_bufferHead + 1) % _bufferSize;
  }

  /// Stop the estimator.
  ///
  /// This stops the estimator from receiving new translations and derives
  /// the estimated direction. This is the sign of the weighted average value
  /// from the available data in the translation buffer.
  void stop() {
    _acceptTranslations = false;
    _direction = _calculateAverageTranslation().sign;
  }

  void reset() {
    _direction = 0.0;
    _translationBuffer.fillRange(0, _bufferSize, 0.0);
    _acceptTranslations = true;
  }

  double _calculateAverageTranslation() {
    var weightedSum = 0.0;
    for (var i = 0; i < _bufferSize; i++) {
      // Wrapping buffer index, starting at the most recent translation
      final j = (_bufferHead + i) % _bufferSize;
      // Get a weighted average after applying the kernel function
      weightedSum += _translationBuffer[j] * _kernel[i];
    }
    return weightedSum / _bufferSize;
  }
}

// TODO: move this somewhere else
// extension<E extends Object?> on List<E> {
//   List<E> unfold(int start) {
//     final size = length;
//     if (size == 0) return .empty(growable: false);

//     final remaining = size - start;

//     final result = List<E>.filled(size, first, growable: false)
//       ..setRange(0, remaining, this, start);
//     if (remaining < size) result.setRange(remaining, size, this, 0);
//     return result;
//   }
// }

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
