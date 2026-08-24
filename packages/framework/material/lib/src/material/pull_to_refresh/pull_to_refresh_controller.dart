import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material/src/material/flutter.dart';

const _kDragMultiplier = 0.5;

mixin PullToRefreshStates {
  // ////////////////////////////////////////////////////////////////
  // Refresh //
  // ////////////////////////////////////////////////////////////////

  bool get enabled;

  double get threshold;

  bool get isRefreshing;

  // ////////////////////////////////////////////////////////////////
  // Scroll //
  // ////////////////////////////////////////////////////////////////

  double get verticalOffset;

  double get distancePulled;

  double get adjustedDistancePulled;

  double get progress;

  // ////////////////////////////////////////////////////////////////
  // Animation //
  // ////////////////////////////////////////////////////////////////

  /// Whether the indicator is currently animating to the
  /// threshold offset, or back to the hidden offset.
  bool get isAnimating;

  /// Distance percentage towards the refresh threshold.
  ///
  /// * `0.0` indicates no distance.
  /// * `1.0` indicates being at the threshold offset.
  /// * `> 1.0` indicates overshoot beyond the provided threshold.
  double get distanceFraction;
}

abstract class const PullToRefreshDelegate() {
  Animation<double> get distanceFraction;

  TickerFuture animateToThreshold();

  TickerFuture animateToHidden();

  void snapTo(double targetValue);
}

class PullToRefreshDefaultDelegate({
  required TickerProvider vsync,
  SpringDescription? spring,
}) extends PullToRefreshDelegate {
  SpringDescription _spring = spring ?? defaultSpring;

  SpringDescription get spring => _spring;

  set spring(SpringDescription value) {
    if (_spring == value) return;
    _spring = value;
  }

  final AnimationController _animationController = .new(
    vsync: vsync,
    lowerBound: 0.0,
    upperBound: .infinity,
    animationBehavior: .preserve,
    debugLabel: "PullToRefreshDefaultDelegate",
  );

  @override
  Animation<double> get distanceFraction => _animationController.view;

  SpringSimulation _createSimulation(double targetValue) => .new(
    spring,
    _animationController.value,
    targetValue,
    _animationController.velocity,
    snapToEnd: true,
  );

  @override
  TickerFuture animateToThreshold() =>
      _animationController.animateWith(_createSimulation(1.0));

  @override
  TickerFuture animateToHidden() =>
      _animationController.animateWith(_createSimulation(0.0));

  @override
  void snapTo(double targetValue) {
    _animationController.value = targetValue;
  }

  @mustCallSuper
  void dispose() {
    _animationController.dispose();
  }

  @override
  String toString() =>
      "${describeIdentity(this)}("
      "spring: $spring,"
      "distanceFraction: ${distanceFraction.value}"
      ")";

  static final defaultSpring = SpringDescription.withDampingRatio(
    mass: 1.0,
    stiffness: 1500.0,
    ratio: 1.0,
  );
}

@optionalTypeArgs
abstract class PullToRefreshController<
  DelegateType extends PullToRefreshDelegate
>({
  var VoidCallback _onRefresh = _defaultOnRefresh,
  var bool _enabled = true,
  required var DelegateType _delegate,
  var double _threshold = defaultThreshold,
  var bool _isRefreshing = false,
}) with ChangeNotifier implements PullToRefreshStates {
  this {
    if (kFlutterMemoryAllocationsEnabled) {
      ChangeNotifier.maybeDispatchObjectCreation(this);
    }
    if (isRefreshing) {
      _distancePulled = threshold;
      _delegate.snapTo(1.0);
      _verticalOffset = calculateVerticalOffset();
    }
    delegate.distanceFraction.addListener(_animationListener);
  }

  VoidCallback get onRefresh => _onRefresh;
  set onRefresh(VoidCallback value) {
    if (_onRefresh == value) return;
    _onRefresh = value;
  }

  @override
  bool get enabled => _enabled;
  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
  }

  DelegateType get delegate => _delegate;
  set delegate(DelegateType value) {
    if (_delegate == value) return;
    _delegate.distanceFraction.removeListener(_animationListener);
    _delegate = value;
    _delegate.distanceFraction.addListener(_animationListener);
    _verticalOffset = calculateVerticalOffset();
    if (!isAnimating && !isRefreshing) {
      _delegate.snapTo(verticalOffset / threshold);
    }
    notifyListeners();
  }

  @override
  double get threshold => _threshold;
  set threshold(double value) {
    if (_threshold == value) return;
    _threshold = value;
    _verticalOffset = calculateVerticalOffset();
    if (!isAnimating && !isRefreshing) {
      delegate.snapTo(verticalOffset / _threshold);
    }
    notifyListeners();
  }

  @override
  bool get isRefreshing => _isRefreshing;
  set isRefreshing(bool value) {
    if (_isRefreshing == value) return;
    _isRefreshing = value;
    if (_isRefreshing) {
      unawaited(animateToThreshold());
    } else {
      unawaited(animateToHidden());
    }
  }

  double _verticalOffset = 0.0;

  @override
  double get verticalOffset => _verticalOffset;

  @protected
  double calculateVerticalOffset() {
    if (isRefreshing || isAnimating) {
      return distanceFraction * threshold;
    }

    // If drag hasn't gone past the threshold,
    // the position is adjustedDistancePulled.
    final adjustedDistancePulled = this.adjustedDistancePulled;
    if (adjustedDistancePulled <= threshold) {
      return adjustedDistancePulled;
    }

    // How far beyond the threshold pull has gone,
    // as a percentage of the threshold.
    final overshootPercent = progress.abs() - 1.0;

    // Limit the overshoot to 200%. Linear between 0 and 200.
    final linearTension = clampDouble(overshootPercent, 0.0, 2.0);

    // Non-linear tension. Increases with linearTension,
    // but at a decreasing rate.
    final tensionPercent =
        linearTension - (linearTension * linearTension) / 4.0;

    // The additional offset beyond the threshold.
    final extraOffset = threshold * tensionPercent;
    return threshold + extraOffset;
  }

  var _distancePulled = 0.0;

  @override
  double get distancePulled => _distancePulled;

  @protected
  set distancePulled(double value) {
    if (_distancePulled == value) return;
    _distancePulled = math.max(0.0, value);
    _verticalOffset = calculateVerticalOffset();
    if (!isAnimating && !isRefreshing) {
      delegate.snapTo(verticalOffset / threshold);
    }
    notifyListeners();
  }

  @override
  double get adjustedDistancePulled => distancePulled * _kDragMultiplier;

  @override
  double get progress => adjustedDistancePulled / threshold;

  var _farEdgeOverscroll = 0.0;

  @protected
  double get farEdgeOverscroll => _farEdgeOverscroll;

  @protected
  set farEdgeOverscroll(double value) {
    if (value < 0.0) value = 0.0;
    if (_farEdgeOverscroll == value) return;
    _farEdgeOverscroll = value;
    notifyListeners();
  }

  var _nearEdgeOverscroll = 0.0;

  @protected
  double get nearEdgeOverscroll => _nearEdgeOverscroll;

  @protected
  set nearEdgeOverscroll(double value) {
    if (value < 0.0) value = 0.0;
    if (_nearEdgeOverscroll == value) return;
    _nearEdgeOverscroll = value;
    notifyListeners();
  }

  var _nearEdgeOverscrollConsumed = 0.0;

  @protected
  double get nearEdgeOverscrollConsumed => _nearEdgeOverscrollConsumed;

  @protected
  set nearEdgeOverscrollConsumed(double value) {
    if (value < 0.0) value = 0.0;
    _nearEdgeOverscrollConsumed = value;
  }

  @factory
  ScrollPhysics createScrollPhysics({ScrollPhysics? parent}) =>
      _PullToRefreshDefaultScrollPhysics(parent: parent, controller: this);

  @protected
  double consumeAvailableOffset(double availableOffset) {
    if (!enabled || isRefreshing || isAnimating) return 0.0;
    farEdgeOverscroll = 0.0;
    nearEdgeOverscroll = 0.0;
    nearEdgeOverscrollConsumed = 0.0;
    final newOffset = math.max(0.0, distancePulled + availableOffset);
    final dragConsumed = newOffset - distancePulled;
    distancePulled = newOffset;
    return dragConsumed;
  }

  @protected
  void onRelease(double velocity) {
    if (_isDisposed || !enabled || isRefreshing || isAnimating) return;
    if (adjustedDistancePulled >= threshold) {
      onRefresh();
    } else {
      unawaited(animateToHidden());
    }
  }

  @override
  bool get isAnimating => delegate.distanceFraction.isAnimating;

  @override
  double get distanceFraction => delegate.distanceFraction.value;

  @protected
  Future<void> animateToThreshold() async {
    _isRefreshing = true;
    _distancePulled = threshold;
    _verticalOffset = calculateVerticalOffset();
    notifyListeners();
    try {
      await delegate.animateToThreshold();
    } finally {
      if (!_isDisposed) {
        _distancePulled = threshold;
        delegate.snapTo(1.0);
        _verticalOffset = calculateVerticalOffset();
        notifyListeners();
      }
    }
  }

  @protected
  Future<void> animateToHidden() async {
    _isRefreshing = false;
    _distancePulled = 0.0;
    _verticalOffset = calculateVerticalOffset();
    notifyListeners();
    try {
      await delegate.animateToHidden();
    } finally {
      if (!_isDisposed) {
        _distancePulled = 0.0;
        delegate.snapTo(0.0);
        _verticalOffset = calculateVerticalOffset();
        notifyListeners();
      }
    }
  }

  void _animationListener() {
    _verticalOffset = calculateVerticalOffset();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    final schedulerBinding = SchedulerBinding.instance;
    switch (schedulerBinding.schedulerPhase) {
      // We check scheduler phase here because this method could be called
      // during layout phase potentially (scroll physics).
      case .persistentCallbacks:
        schedulerBinding.addPostFrameCallback((_) {
          if (_isDisposed) return;
          super.notifyListeners();
        });
      default:
        super.notifyListeners();
    }
  }

  var _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    delegate.distanceFraction.removeListener(_animationListener);
    super.dispose();
  }

  @override
  String toString() =>
      "${describeIdentity(this)}("
      "enabled: $enabled,"
      "delegate: $delegate,"
      "threshold: $threshold"
      ")";

  static const defaultThreshold = 80.0;

  static void _defaultOnRefresh() {}
}

@optionalTypeArgs
class PullToRefreshDefaultController<
  DelegateType extends PullToRefreshDelegate
>({
  super.onRefresh,
  super.enabled,
  required super.delegate,
  super.threshold,
  super.isRefreshing,
}) extends PullToRefreshController<DelegateType>
    implements ValueListenable<PullToRefreshStates> {
  @override
  PullToRefreshStates get value => this;
}

// It doesn't make sense for this class to be public or internal,
// because it doesn't expose any new APIs for overriding,
// and interfaces with the controller using only the public APIs
// of PulToRefreshController, no private member access to prevent runtime
// errors.

class const _PullToRefreshDefaultScrollPhysics({
  super.parent,
  required final PullToRefreshController controller,
}) extends ScrollPhysics {
  @override
  _PullToRefreshDefaultScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      .new(parent: buildParent(ancestor), controller: controller);

  // TODO: check if works in reverse scroll views (spoiler: it doesn't?)

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (offset == 0.0) return 0.0;
    if (position.pixels < position.maxScrollExtent) {
      controller.farEdgeOverscroll = 0.0;
    }
    if (position.pixels > position.minScrollExtent) {
      controller.nearEdgeOverscroll = 0.0;
    }
    if (!controller.enabled ||
        controller.isRefreshing ||
        controller.isAnimating) {
      if (offset > 0.0) {
        var remainingOffset = offset;
        if (controller.farEdgeOverscroll > 0.0) {
          final farEdgeOverscrollConsumed = math.min(
            controller.farEdgeOverscroll,
            remainingOffset,
          );
          controller.farEdgeOverscroll -= farEdgeOverscrollConsumed;
          remainingOffset -= farEdgeOverscrollConsumed;
        }
        if (remainingOffset > 0.0 &&
            position.pixels <= position.minScrollExtent) {
          controller.nearEdgeOverscroll += remainingOffset;
        }
      } else if (offset < 0.0) {
        if (controller.nearEdgeOverscroll > 0.0) {
          final nearEdgeOverscrollConsumed = math.min(
            controller.nearEdgeOverscroll,
            -offset,
          );
          controller.nearEdgeOverscroll -= nearEdgeOverscrollConsumed;
          controller.nearEdgeOverscrollConsumed = nearEdgeOverscrollConsumed;
        }
      }
      return super.applyPhysicsToUserOffset(position, offset);
    }
    if (offset < 0.0) {
      if (controller.distancePulled > 0.0) {
        final consumed = controller.consumeAvailableOffset(offset);
        final delta = offset - consumed;
        if (delta == 0.0) return 0.0;
        return super.applyPhysicsToUserOffset(position, delta);
      }
      if (controller.nearEdgeOverscroll > 0.0) {
        final nearEdgeOverscrollConsumed = math.min(
          controller.nearEdgeOverscroll,
          -offset,
        );
        controller.nearEdgeOverscroll -= nearEdgeOverscrollConsumed;
        controller.nearEdgeOverscrollConsumed = nearEdgeOverscrollConsumed;
      }
      return super.applyPhysicsToUserOffset(position, offset);
    }
    if (offset > 0.0) {
      if (controller.nearEdgeOverscroll > 0.0) {
        controller.nearEdgeOverscroll += offset;
        return super.applyPhysicsToUserOffset(position, offset);
      }
      var remainingOffset = offset;
      var farEdgeOverscrollConsumed = 0.0;
      if (controller.farEdgeOverscroll > 0.0) {
        farEdgeOverscrollConsumed = math.min(
          controller.farEdgeOverscroll,
          remainingOffset,
        );
        controller.farEdgeOverscroll -= farEdgeOverscrollConsumed;
        remainingOffset -= farEdgeOverscrollConsumed;
      }
      final delta = position.pixels - position.minScrollExtent;
      if (delta <= 0.0) {
        if (remainingOffset > 0.0) {
          controller.consumeAvailableOffset(remainingOffset);
        }
        if (farEdgeOverscrollConsumed == 0.0) return 0.0;
        return super.applyPhysicsToUserOffset(
          position,
          farEdgeOverscrollConsumed,
        );
      } else if (remainingOffset > delta) {
        final overscroll = remainingOffset - delta;
        controller.consumeAvailableOffset(overscroll);
        final clamped = offset - overscroll;
        if (clamped == 0.0) return 0.0;
        return super.applyPhysicsToUserOffset(position, clamped);
      }
      return super.applyPhysicsToUserOffset(position, offset);
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    }
    final overscroll = super.applyBoundaryConditions(position, value);
    if (overscroll > 0.0) {
      final farEdgeOverscroll = math.max(
        0.0,
        overscroll - controller.nearEdgeOverscrollConsumed,
      );
      controller.nearEdgeOverscrollConsumed = 0.0;
      if (farEdgeOverscroll > 0.0) {
        controller.farEdgeOverscroll += farEdgeOverscroll;
      }
    }
    return overscroll;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if (!controller.isRefreshing &&
        !controller.isAnimating &&
        controller.distancePulled == 0.0) {
      controller.farEdgeOverscroll = 0.0;
      controller.nearEdgeOverscroll = 0.0;
      controller.nearEdgeOverscrollConsumed = 0.0;
    }
    if (controller.enabled &&
        !controller.isRefreshing &&
        !controller.isAnimating &&
        controller.distancePulled > 0.0) {
      controller.onRelease(velocity);
    }
    if (position.pixels <= position.minScrollExtent &&
        velocity <= 0.0 &&
        (controller.isRefreshing ||
            controller.isAnimating ||
            controller.verticalOffset > 0.0)) {
      return null;
    }
    return super.createBallisticSimulation(position, velocity);
  }
}
