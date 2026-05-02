import 'dart:async';
import 'dart:math' as math;

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

const _kTranslationBufferSize = 10;

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

  var _direction = 0;

  /// The estimated direction of the translations. It will be estimated as
  /// the weighted average of the values in the translation buffer and set
  /// only once when the estimator is stopped.
  int get direction => _direction;

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
    _direction = _computeDirection();
  }

  void reset() {
    _direction = 0;
    _translationBuffer.fillRange(0, _bufferSize, 0.0);
    _acceptTranslations = true;
  }

  double _computeTranslationAverage() {
    var weightedSum = 0.0;
    for (var i = 0; i < _bufferSize; i++) {
      // Wrapping buffer index, starting at the most recent translation
      final j = (_bufferHead + i) % _bufferSize;
      // Get a weighted average after applying the kernel function
      weightedSum += _translationBuffer[j] * _kernel[i];
    }
    return weightedSum / _bufferSize;
  }

  int _computeDirection() => _computeTranslationAverage().sign.toInt();
}

enum _ExpressiveSwipeControllerState { idle, pulling, detached }

class ExpressiveSwipeController extends Animation<double> {
  ExpressiveSwipeController({required TickerProvider vsync, this.debugLabel})
    : _simulationController = SimulationController.unbounded(
        vsync: vsync,
        animationBehavior: .preserve,
      );

  final String? debugLabel;

  // ////////////////////////////////////////////////////////////////
  // Spring-based animation system //
  // ////////////////////////////////////////////////////////////////

  late SpringDescription _lastSpring;

  late double _lastStartVelocity;

  final SimulationController _simulationController;

  double get animationVelocity => _simulationController.velocity;

  void _setTranslation(double value) {
    if (_simulationController.isAnimating) {
      final simulation = SpringSimulation(
        _lastSpring,
        _simulationController.value,
        value,
        _simulationController.velocity,
        snapToEnd: true,
      );
      unawaited(
        _simulationController.animateWith(
          simulation,
          .forward,
          resetTicker: false,
        ),
      );
    } else {
      _simulationController.value = value;
    }
  }

  void _animateTranslation(
    SpringDescription spring,
    double to,
    double startVelocity,
  ) {
    _lastSpring = spring;
    _lastStartVelocity = startVelocity;
    final simulation = SpringSimulation(
      _lastSpring,
      _simulationController.value,
      to,
      _lastStartVelocity,
      snapToEnd: true,
    );
    _simulationController.stop(canceled: true);
    unawaited(
      _simulationController.animateWith(
        simulation,
        .forward,
        resetTicker: true,
      ),
    );
  }

  void resync(TickerProvider vsync) {
    _simulationController.resync(vsync);
  }

  @override
  void addListener(VoidCallback listener) {
    _simulationController.addListener(listener);
  }

  @override
  void addStatusListener(AnimationStatusListener listener) {
    _simulationController.addStatusListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _simulationController.removeListener(listener);
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    _simulationController.removeStatusListener(listener);
  }

  @override
  AnimationStatus get status => _simulationController.status;

  @override
  double get value => _simulationController.value;

  // ////////////////////////////////////////////////////////////////
  // Swipe velocity estimation system //
  // ////////////////////////////////////////////////////////////////

  final _velocityTracker = AxisVelocityTracker();

  double get swipeVelocity => _velocityTracker.velocity;

  // ////////////////////////////////////////////////////////////////
  // Detach direction estimation system //
  // ////////////////////////////////////////////////////////////////

  final _directionEstimator = _DirectionEstimator(_kTranslationBufferSize);

  int get detachDirection => _directionEstimator.direction;

  // ////////////////////////////////////////////////////////////////
  // State management system (actual logic) //
  // ////////////////////////////////////////////////////////////////

  _ExpressiveSwipeControllerState _currentState = .idle;

  void _attach(double translation) {
    _animateTranslation(
      _kAttachSpring,
      translation * _kMagneticTranslationMultiplier,
      swipeVelocity.abs() * -detachDirection,
    );
    _directionEstimator.reset();
  }

  void _detach(double translation) {
    _animateTranslation(
      _kDetachSpring,
      translation,
      swipeVelocity.abs() * detachDirection,
    );
  }

  void _snapBack(double velocity) {
    _animateTranslation(
      _kSnapBackSpring,
      0.0,
      velocity * _kMagneticTranslationMultiplier,
    );
  }

  void _pull(double translation, bool canBeDismissed) {
    translation *= _kMagneticTranslationMultiplier;
    if (!canBeDismissed) translation *= _kMagneticReduction;
    _setTranslation(translation);
  }

  void _pullDismissible(double translation) {
    if (translation.abs() >= _kMagneticDetachThreshold) {
      _directionEstimator.stop();
      _detach(translation);
      _currentState = .detached;
    } else {
      _pull(translation, true);
    }
  }

  void _translateDetached(double translation) {
    if (translation.abs() <= _kMagneticAttachThreshold) {
      _attach(translation);
      _currentState = .pulling;
    } else {
      _setTranslation(translation);
    }
  }

  bool isDismissible(double velocity) {
    final isEndVelocityLargeEnough = velocity.abs() >= _kDismissVelocity;
    late final shouldSnapBack =
        isEndVelocityLargeEnough &&
        _directionEstimator.direction != velocity.sign;
    return switch (_currentState) {
      .idle || .pulling => isEndVelocityLargeEnough,
      .detached => !shouldSnapBack,
    };
  }

  void start() {
    _velocityTracker.reset();
    _directionEstimator.reset();
  }

  void update(double translation, {Duration? sourceTimestamp}) {
    _velocityTracker.addPosition(sourceTimestamp ?? .zero, translation);
    _directionEstimator.add(translation);

    switch (_currentState) {
      case .idle:
        _pull(translation, true);
        _currentState = .pulling;
      case .pulling:
        _pullDismissible(translation);
      case .detached:
        _translateDetached(translation);
    }
  }

  void end({required bool dismissing, double? velocity}) {
    _velocityTracker.reset();
    _directionEstimator.reset();

    switch (_currentState) {
      case .idle:
        break;
      case .pulling:
        _currentState = .idle;
      case .detached:
        _currentState = .idle;
    }

    _simulationController.stop(canceled: true);

    if (dismissing) {
      _simulationController.value = 0.0;
    } else {
      _snapBack(velocity ?? 0.0);
    }
  }

  void reset() {
    _velocityTracker.reset();
    _directionEstimator.reset();
    _simulationController.stop(canceled: true);
    _currentState = .idle;
  }

  // ////////////////////////////////////////////////////////////////
  // Disposal system //
  // ////////////////////////////////////////////////////////////////

  var _disposed = false;

  @mustCallSuper
  void dispose() {
    assert(debugAssertNotDisposed(this));

    _simulationController.dispose();
    _velocityTracker.reset();
    _directionEstimator.reset();

    _disposed = true;
  }

  @override
  String toStringDetails() {
    final state = switch (_currentState) {
      .idle => "; idle",
      .pulling => "; pulling",
      .detached => "; detached",
    };
    final disposal = _disposed ? "; DISPOSED" : "";
    var label = "";
    assert(() {
      if (debugLabel != null) label = "; for $debugLabel";
      return true;
    }());
    final more = "${super.toStringDetails()} ${value.toStringAsFixed(1)}";
    return "$more$state$disposal$label";
  }

  static bool debugAssertNotDisposed(ExpressiveSwipeController controller) {
    assert(() {
      if (controller._disposed) {
        throw FlutterError(
          "A ${controller.runtimeType} was used after being disposed.\n"
          "Once you have called dispose() on ${controller.runtimeType}, "
          "it can no longer be used",
        );
      }
      return true;
    }());
    return true;
  }
}
