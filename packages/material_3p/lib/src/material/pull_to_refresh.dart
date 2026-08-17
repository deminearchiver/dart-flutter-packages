import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/physics.dart';
import 'package:material_3p/material.dart';
import 'package:material_3p/material_shapes.dart';

const _kPositionalThreshold = 80.0;

const _kIndicatorMaxDistance = _kPositionalThreshold;

const _kDragMultiplier = 0.5;

mixin PullToRefreshStates {
  bool get enabled;

  double get threshold;

  bool get isRefreshing;

  /// Distance percentage towards the refresh threshold.
  ///
  /// * `0.0` indicates no distance.
  /// * `1.0` indicates being at the threshold offset.
  /// * `> 1.0` indicates overshoot beyond the provided threshold.
  double get distanceFraction;

  /// Whether the indicator is currently animating to the
  /// threshold offset, or back to the hidden offset.
  bool get isAnimating;

  double get verticalOffset;

  double get distancePulled;

  double get adjustedDistancePulled;

  double get progress;
}

abstract class PullToRefreshDelegate {
  const PullToRefreshDelegate();

  Animation<double> get distanceFraction;

  TickerFuture animateToThreshold();

  TickerFuture animateToHidden();

  void snapTo(double targetValue);
}

class PullToRefreshDefaultDelegate extends PullToRefreshDelegate {
  PullToRefreshDefaultDelegate({
    required TickerProvider vsync,
    SpringDescription? spring,
  }) : _animationController = .new(
         vsync: vsync,
         lowerBound: 0.0,
         upperBound: .infinity,
         animationBehavior: .preserve,
         debugLabel: "PullToRefreshDefaultDelegate",
       ),
       _spring = spring ?? defaultSpring;

  late final AnimationController _animationController;

  SpringDescription _spring;

  SpringDescription get spring => _spring;

  set spring(SpringDescription value) {
    if (_spring == value) return;
    _spring = value;
  }

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
>
    with ChangeNotifier
    implements PullToRefreshStates {
  PullToRefreshController({
    this._onRefresh = _defaultOnRefresh,
    this._enabled = true,
    required this._delegate,
    this._threshold = _kPositionalThreshold,
    this._isRefreshing = false,
  }) {
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

  VoidCallback _onRefresh;

  VoidCallback get onRefresh => _onRefresh;

  set onRefresh(VoidCallback value) {
    if (_onRefresh == value) return;
    _onRefresh = value;
  }

  bool _enabled;

  @override
  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
  }

  DelegateType _delegate;

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

  double _threshold;

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

  bool _isRefreshing;

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

  @override
  double get distanceFraction => delegate.distanceFraction.value;

  @override
  bool get isAnimating => delegate.distanceFraction.isAnimating;

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

  double get farEdgeOverscroll => _farEdgeOverscroll;

  @protected
  set farEdgeOverscroll(double value) {
    if (value < 0.0) value = 0.0;
    if (_farEdgeOverscroll == value) return;
    _farEdgeOverscroll = value;
    notifyListeners();
  }

  ScrollPhysics createScrollPhysics({ScrollPhysics? parent}) =>
      _PullToRefreshDefaultScrollPhysics(parent: parent, controller: this);

  @protected
  double consumeAvailableOffset(double availableOffset) {
    if (!enabled || isRefreshing || isAnimating) return 0.0;
    farEdgeOverscroll = 0.0;
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

  static void _defaultOnRefresh() {}
}

@optionalTypeArgs
class PullToRefreshDefaultController<DelegateType extends PullToRefreshDelegate>
    extends PullToRefreshController<DelegateType>
    implements ValueListenable<PullToRefreshStates> {
  PullToRefreshDefaultController({
    super.onRefresh,
    super.enabled,
    required super.delegate,
    super.threshold,
    super.isRefreshing,
  });

  @override
  PullToRefreshStates get value => this;
}

class _PullToRefreshDefaultScrollPhysics extends ScrollPhysics {
  const _PullToRefreshDefaultScrollPhysics({
    super.parent,
    required this.controller,
  });

  final PullToRefreshController controller;

  @override
  _PullToRefreshDefaultScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      .new(parent: buildParent(ancestor), controller: controller);

  double _applyPhysicsToUserOffsetSuper(ScrollMetrics position, double offset) {
    if (offset == 0.0) return 0.0;
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (offset == 0.0) return 0.0;
    if (!controller.enabled ||
        controller.isRefreshing ||
        controller.isAnimating) {
      controller.farEdgeOverscroll = 0.0;
      return _applyPhysicsToUserOffsetSuper(position, offset);
    }
    if (position.pixels < position.maxScrollExtent) {
      controller.farEdgeOverscroll = 0.0;
    }
    if (offset < 0.0 && controller.distancePulled > 0.0) {
      final consumed = controller.consumeAvailableOffset(offset);
      final delta = offset - consumed;
      return _applyPhysicsToUserOffsetSuper(position, delta);
    }
    if (offset > 0.0) {
      var remainingOffset = offset;
      if (controller.farEdgeOverscroll > 0.0) {
        final overscrollConsumed = math.min(
          controller.farEdgeOverscroll,
          remainingOffset,
        );
        controller.farEdgeOverscroll -= overscrollConsumed;
        remainingOffset -= overscrollConsumed;
        if (remainingOffset <= 0.0) {
          return _applyPhysicsToUserOffsetSuper(position, offset);
        }
      }
      final delta = position.pixels - position.minScrollExtent;
      if (delta <= 0.0) {
        controller.consumeAvailableOffset(remainingOffset);
        return _applyPhysicsToUserOffsetSuper(
          position,
          offset - remainingOffset,
        );
      } else if (remainingOffset > delta) {
        final overscroll = remainingOffset - delta;
        controller.consumeAvailableOffset(overscroll);
        return _applyPhysicsToUserOffsetSuper(position, offset - overscroll);
      }
    }
    return _applyPhysicsToUserOffsetSuper(position, offset);
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
      controller.farEdgeOverscroll += overscroll;
    }
    return overscroll;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    controller.farEdgeOverscroll = 0.0;
    if (controller.enabled &&
        !controller.isRefreshing &&
        !controller.isAnimating &&
        controller.distancePulled > 0.0) {
      controller.onRelease(velocity);
    }
    if (position.pixels <= position.minScrollExtent &&
        (controller.isRefreshing ||
            controller.isAnimating ||
            controller.verticalOffset > 0.0)) {
      if (velocity <= 0.0) {
        return null;
      }
    }
    return super.createBallisticSimulation(position, velocity);
  }
}

class PullToRefreshDefaultLayout extends StatelessWidget {
  const PullToRefreshDefaultLayout({
    super.key,
    required this.states,
    this.clipBehavior = .hardEdge,
    this.child,
  });

  final ValueListenable<PullToRefreshStates> states;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: states,
    builder: (context, states, child) {
      final height = states.verticalOffset;
      return SizedBox(
        height: height,
        child: ClipRect(
          clipBehavior: clipBehavior,
          child: OverflowBox(
            alignment: .center,
            minHeight: 0.0,
            maxHeight: _kIndicatorMaxDistance,
            child: Visibility(visible: height > 0.0, child: child!),
          ),
        ),
      );
    },
    child: child,
  );
}

class PullToRefreshFadeTransition extends StatelessWidget {
  const PullToRefreshFadeTransition({
    super.key,
    required this.states,
    this.endFraction = 1.0,
    this.dismissedScale = 0.0,
    required this.child,
  }) : assert(endFraction > 0.0 && endFraction <= 1.0),
       assert(dismissedScale >= 0.0);

  final ValueListenable<PullToRefreshStates> states;

  /// End of the progress interval that will be scaled to the proper range.
  ///
  /// Defaults to `1.0`.
  final double endFraction;

  /// Scale of [child] when the animation is fully dismissed (0% progress).
  ///
  /// Defaults to `0.0`.
  final double dismissedScale;

  final Widget child;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: states,
    builder: (context, states, child) {
      final progress = math.max(0.0, states.distanceFraction);

      // Scale first 40% of progress to range between 0% and 200%.
      final linearTension = clampDouble(2.0 * progress / endFraction, 0.0, 2.0);

      // Non-linear tension. Increases with linearTension,
      // but at a decreasing rate.
      final tensionPercent =
          linearTension - (linearTension * linearTension) / 4.0;

      return Transform.scale(
        scale: lerpDouble(dismissedScale, 1.0, tensionPercent),
        transformHitTests: false,
        child: Opacity(
          opacity: clampDouble(tensionPercent, 0.0, 1.0),
          alwaysIncludeSemantics: false,
          child: child,
        ),
      );
    },
    child: child,
  );
}

class PullToRefreshLoadingIndicator extends StatefulWidget {
  const PullToRefreshLoadingIndicator({
    super.key,
    required this.states,
    this.determinateIndicatorPolygons,
    this.indeterminateIndicatorPolygons,
    this.containerShape,
    this.containerColor,
    this.containerOutline,
    this.activeIndicatorColor,
    this.activeIndicatorOutline,
    this.forEachPolygon = LoadingIndicatorHelper.defaultForEachPolygon,
  });

  final ValueListenable<PullToRefreshStates> states;

  final List<RoundedPolygon>? determinateIndicatorPolygons;

  final List<RoundedPolygon>? indeterminateIndicatorPolygons;

  final OutlinedBorder? containerShape;

  final Color? containerColor;

  final BorderSide? containerOutline;

  final Color? activeIndicatorColor;

  final BorderSide? activeIndicatorOutline;

  final LoadingIndicatorForEachPolygon forEachPolygon;

  @override
  State<PullToRefreshLoadingIndicator> createState() =>
      _PullToRefreshLoadingIndicatorState();
}

class _PullToRefreshLoadingIndicatorState
    extends State<PullToRefreshLoadingIndicator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const resolvedContainerSize = 48.0;

    final colorScheme = ColorScheme.of(context);

    final resolvedContainerShape =
        widget.containerShape ?? const CircleBorder();

    final resolvedContainerColor =
        widget.containerColor ?? colorScheme.primaryContainer;

    final resolvedContainerOutline = widget.containerOutline ?? BorderSide.none;

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor ?? colorScheme.onPrimaryContainer;

    final resolvedActiveIndicatorOutline =
        widget.activeIndicatorOutline ?? BorderSide.none;

    final Widget determinateActiveIndicator = ValueListenableBuilder(
      valueListenable: widget.states,
      builder: (context, states, _) {
        final progress = math.max(0.0, states.distanceFraction);
        return Transform.rotate(
          // Start the rotation on progress - 1 (i.e. 0) to avoid a jump
          // that would be more noticeable on some LoadingIndicator shapes.
          angle: progress > 1.0 ? -(progress - 1.0) * math.pi : 0.0,
          transformHitTests: false,
          child: DeterminateLoadingIndicator(
            indicatorPolygons: widget.determinateIndicatorPolygons,
            contained: false,
            containerShape: const RoundedRectangleBorder(),
            containerColor: Colors.transparent,
            containerOutline: .none,
            activeIndicatorColor: resolvedActiveIndicatorColor,
            activeIndicatorOutline: resolvedActiveIndicatorOutline,
            progress: clampDouble(states.distanceFraction, 0.0, 1.0),
          ),
        );
      },
    );

    final Widget indeterminateActiveIndicator = ListenableBuilder(
      listenable: widget.states,
      builder: (context, _) => IndeterminateLoadingIndicator(
        indicatorPolygons: widget.indeterminateIndicatorPolygons,
        contained: false,
        containerShape: const RoundedRectangleBorder(),
        containerColor: Colors.transparent,
        containerOutline: .none,
        activeIndicatorColor: resolvedActiveIndicatorColor,
        activeIndicatorOutline: resolvedActiveIndicatorOutline,
      ),
    );

    return SizedBox.square(
      dimension: resolvedContainerSize,
      child: ValueListenableBuilder(
        valueListenable: widget.states,
        builder: (context, states, _) => Material(
          animationDuration: .zero,
          animateColor: false,
          clipBehavior: .antiAlias,
          shape: resolvedContainerShape.copyWith(
            side: resolvedContainerOutline,
          ),
          color: resolvedContainerColor,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          child: _PullToRefreshLoadingIndicatorCrossFade(
            isRefreshing: states.isRefreshing,
            determinateChild: determinateActiveIndicator,
            indeterminateChild: indeterminateActiveIndicator,
          ),
        ),
      ),
    );
  }
}

class _PullToRefreshLoadingIndicatorCrossFade extends StatefulWidget {
  const _PullToRefreshLoadingIndicatorCrossFade({
    super.key,
    required this.isRefreshing,
    required this.determinateChild,
    required this.indeterminateChild,
  });

  final bool isRefreshing;

  final Widget determinateChild;

  final Widget indeterminateChild;

  @override
  State<_PullToRefreshLoadingIndicatorCrossFade> createState() =>
      _PullToRefreshLoadingIndicatorCrossFadeState();
}

class _PullToRefreshLoadingIndicatorCrossFadeState
    extends State<_PullToRefreshLoadingIndicatorCrossFade>
    with SingleTickerProviderStateMixin {
  double get _crossFadeFractionTargetValue => widget.isRefreshing ? 1.0 : 0.0;

  late AnimationController _crossFadeController;

  final _spring = SpringDescription.withDampingRatio(
    mass: 1.0,
    stiffness: 1600.0,
    ratio: 1.0,
  );

  void _startImplicitAnimation() {
    final oldValue = _crossFadeController.value;
    final newValue = _crossFadeFractionTargetValue;
    if (newValue == oldValue) return;

    final simulation = SpringSimulation(
      _spring,
      oldValue,
      newValue,
      _crossFadeController.velocity,
      snapToEnd: true,
    );

    if (newValue >= oldValue) {
      unawaited(_crossFadeController.animateWith(simulation));
    } else {
      unawaited(_crossFadeController.animateBackWith(simulation));
    }
  }

  @override
  void initState() {
    super.initState();
    _crossFadeController = .unbounded(
      vsync: this,
      value: _crossFadeFractionTargetValue,
    );
  }

  @override
  void didUpdateWidget(
    covariant _PullToRefreshLoadingIndicatorCrossFade oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRefreshing != oldWidget.isRefreshing) {
      _startImplicitAnimation();
    }
  }

  @override
  void dispose() {
    _crossFadeController.dispose();
    super.dispose();
  }

  Widget _buildTransition(BuildContext context, Widget? _) {
    final crossFadeFraction = clampDouble(_crossFadeController.value, 0.0, 1.0);
    final determinateOpacity = 1.0 - crossFadeFraction;
    final indeterminateOpacity = crossFadeFraction;
    return Stack(
      fit: .expand,
      alignment: .center,
      children: [
        Visibility(
          visible: determinateOpacity > 0.0,
          child: Opacity(
            opacity: determinateOpacity,
            child: widget.determinateChild,
          ),
        ),
        Visibility(
          visible: indeterminateOpacity > 0.0,
          child: Opacity(
            opacity: indeterminateOpacity,
            child: widget.indeterminateChild,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _crossFadeController,
    builder: _buildTransition,
  );
}

class PullToRefreshCollapsingDelegate extends PullToRefreshDefaultDelegate {
  PullToRefreshCollapsingDelegate({required super.vsync, super.spring})
    : _layoutController = .new(
        vsync: vsync,
        lowerBound: 0.0,
        upperBound: .infinity,
        animationBehavior: .preserve,
      );

  final AnimationController _layoutController;

  var _isActive = false;

  Animation<double> get layoutFraction => _layoutController.view;

  SpringSimulation _createLayoutSimulation(double targetValue) => .new(
    spring,
    _layoutController.value,
    targetValue,
    _layoutController.velocity,
    snapToEnd: true,
  );

  @override
  void snapTo(double targetValue) {
    super.snapTo(targetValue);
    if (!_isActive) {
      _layoutController.value = targetValue;
    }
  }

  @override
  TickerFuture animateToThreshold() {
    _isActive = true;
    unawaited(_layoutController.animateWith(_createLayoutSimulation(0.0)));
    return super.animateToThreshold();
  }

  @override
  TickerFuture animateToHidden() {
    _isActive = false;
    unawaited(_layoutController.animateWith(_createLayoutSimulation(0.0)));
    return super.animateToHidden();
  }

  @override
  void dispose() {
    _layoutController.dispose();
    super.dispose();
  }
}

mixin PullToRefreshCollapsingStates implements PullToRefreshStates {
  double get layoutFraction;

  double get layoutHeight;
}

class PullToRefreshCollapsingController
    extends PullToRefreshController<PullToRefreshCollapsingDelegate>
    implements
        PullToRefreshCollapsingStates,
        ValueListenable<PullToRefreshCollapsingStates> {
  PullToRefreshCollapsingController({
    super.onRefresh,
    super.enabled,
    required super.delegate,
    super.threshold,
    super.isRefreshing,
  }) {
    delegate.layoutFraction.addListener(notifyListeners);
  }

  @override
  double get layoutFraction => delegate.layoutFraction.value;

  @override
  double get layoutHeight => layoutFraction * threshold;

  @override
  PullToRefreshCollapsingStates get value => this;

  @override
  void dispose() {
    delegate.layoutFraction.removeListener(notifyListeners);
    super.dispose();
  }
}

typedef PullToRefreshWidgetBuilder =
    Widget Function(
      BuildContext context,
      PullToRefreshCollapsingController controller,
    );

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({
    super.key,
    required this.onRefresh,
    this.enabled = true,
    this.spring,
    this.threshold = defaultThreshold,
    required this.builder,
  });

  final RefreshCallback onRefresh;

  final bool enabled;

  final SpringDescription? spring;

  final double threshold;

  final PullToRefreshWidgetBuilder builder;

  @override
  PullToRefreshState createState() => PullToRefreshState();

  static final defaultSpring = PullToRefreshDefaultDelegate.defaultSpring;

  static const defaultThreshold = 80.0;
}

class PullToRefreshState extends State<PullToRefresh>
    with TickerProviderStateMixin {
  late PullToRefreshCollapsingController _controller;

  late PullToRefreshCollapsingDelegate _delegate;

  Future<void>? _refreshFuture;

  void _onRefresh() {
    if (!mounted) return;

    final completer = Completer<void>();
    _refreshFuture = completer.future;

    _controller.isRefreshing = true;

    unawaited(
      widget.onRefresh().whenComplete(() {
        if (!mounted) return;

        _controller.isRefreshing = false;

        if (!completer.isCompleted) {
          completer.complete();
        }

        _refreshFuture = null;
      }),
    );
  }

  ValueListenable<PullToRefreshCollapsingStates> get states => _controller;

  Future<void> show() {
    if (!mounted) return Future.value();
    if (_refreshFuture case final refreshFuture?) {
      return refreshFuture;
    }
    _onRefresh();
    return _refreshFuture ?? Future.value();
  }

  @override
  void initState() {
    super.initState();
    _delegate = .new(
      vsync: this,
      spring: widget.spring ?? PullToRefresh.defaultSpring,
    );
    _controller = .new(
      onRefresh: _onRefresh,
      enabled: widget.enabled,
      delegate: _delegate,
      threshold: widget.threshold,
      isRefreshing: false,
    );
  }

  @override
  void didUpdateWidget(covariant PullToRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.spring != oldWidget.spring) {
      _delegate.spring = widget.spring ?? PullToRefresh.defaultSpring;
    }
    _controller.enabled = widget.enabled;
    _controller.threshold = widget.threshold;
  }

  @override
  void dispose() {
    _controller.dispose();
    _delegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _controller);
}
