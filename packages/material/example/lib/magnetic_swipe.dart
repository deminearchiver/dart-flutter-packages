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
    _controller1.animateExplicit(
      translation * _kMagneticTranslationMultiplier,
      _kAttachSpring,
      -detachDirection * swipeVelocity.abs(),
    );
    _detachDirectionEstimator.reset();
  }

  void _detach(double toPosition) {
    final direction = _detachDirectionEstimator.direction;
    final velocity = _velocityTracker.velocity;
    _controller1.animateExplicit(
      toPosition,
      _kDetachSpring,
      direction * velocity.abs(),
    );
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
    _direction = _computeDirection();
  }

  void reset() {
    _direction = 0.0;
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

  double _computeDirection() => _computeTranslationAverage().sign;
}
