import 'dart:async';
import 'dart:math' as math;

import 'package:material/material_shapes.dart';
import 'package:material/src/material/flutter.dart';

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

// TODO: can this even be considered a delegate if it's stateful?
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
       _spring =
           spring ??
           .withDampingRatio(mass: 1.0, stiffness: 1500.0, ratio: 1.0);

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
      "${objectRuntimeType(this, "PullToRefreshDefaultDelegate")}("
      "spring: $spring,"
      "distanceFraction: ${distanceFraction.value}"
      ")";
}

@optionalTypeArgs
class PullToRefreshController<DelegateType extends PullToRefreshDelegate>
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
    if (isRefreshing) {
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
    if (isAnimating || isRefreshing) {
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

  @protected
  double consumeAvailableOffset(double availableOffset) {
    if (isRefreshing || !enabled) return 0.0;
    final newOffset = math.max(0.0, distancePulled + availableOffset);
    final dragConsumed = newOffset - distancePulled;
    distancePulled = newOffset;
    return dragConsumed;
  }

  @protected
  void onRelease(double velocity) {
    if (_isDisposed || isRefreshing || isAnimating || !enabled) return;
    if (adjustedDistancePulled >= threshold) {
      onRefresh();
    } else {
      unawaited(animateToHidden());
    }
  }

  // TODO: attempt to return TickerFuture without scheduler errors

  @protected
  Future<void> animateToThreshold() async {
    _isRefreshing = true;
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
      "${objectRuntimeType(this, "PullToRefreshController")}("
      "enabled: $enabled,"
      "delegate: $delegate,"
      "threshold: $threshold"
      ")";

  static void _defaultOnRefresh() {}
}

// TODO: should this be added?
// class _PullToRefreshControllerWithDefaultDelegate
//     extends PullToRefreshController {}

// TODO: check if this works in reverse scroll views (spoiler: it doesn't?)
class PullToRefreshScrollPhysics extends ScrollPhysics {
  const PullToRefreshScrollPhysics({super.parent, required this.controller});

  final PullToRefreshController controller;

  @override
  PullToRefreshScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      .new(parent: buildParent(ancestor), controller: controller);

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (!controller.enabled ||
        controller.isRefreshing ||
        controller.isAnimating) {
      return super.applyPhysicsToUserOffset(position, offset);
    }
    if (offset < 0.0 && controller.distancePulled > 0.0) {
      final consumed = controller.consumeAvailableOffset(offset);
      final delta = offset - consumed;
      return super.applyPhysicsToUserOffset(position, delta);
    }
    if (offset > 0.0) {
      final delta = position.pixels - position.minScrollExtent;
      if (delta <= 0.0) {
        controller.consumeAvailableOffset(offset);
        return 0.0;
      } else if (offset > delta) {
        final overscroll = offset - delta;
        controller.consumeAvailableOffset(overscroll);
        return super.applyPhysicsToUserOffset(position, delta);
      }
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
    return super.applyBoundaryConditions(position, value);
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
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
    required this.controller,
    this.clipBehavior = .hardEdge,
    this.child,
  });

  final PullToRefreshController controller;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: controller,
    builder: (context, child) {
      final height = controller.verticalOffset;
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
    required this.controller,
    this.endFraction = 1.0,
    this.dismissedScale = 0.0,
    required this.child,
  }) : assert(endFraction > 0.0 && endFraction <= 1.0),
       assert(dismissedScale >= 0.0);

  final PullToRefreshController controller;

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
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: controller,
    builder: (context, child) {
      final progress = math.max(0.0, controller.distanceFraction);

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

// TODO: do this after implementing progress indicators
// class PullToRefreshProgressIndicator extends StatefulWidget {
//   const PullToRefreshProgressIndicator({super.key, required this.controller});

//   final PullToRefreshController controller;

//   @override
//   State<PullToRefreshProgressIndicator> createState() =>
//       _PullToRefreshProgressIndicatorState();
// }

// class _PullToRefreshProgressIndicatorState
//     extends State<PullToRefreshProgressIndicator> {
//   late _PullToRefreshArrowIndicatorPainter _painter;

//   @override
//   void initState() {
//     super.initState();
//     _painter = .new(controller: widget.controller);
//   }

//   @override
//   void didUpdateWidget(covariant PullToRefreshProgressIndicator oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _painter.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class _PullToRefreshArrowIndicatorPainter
//     extends StatefulCustomPainter<_PullToRefreshArrowIndicatorPainter> {
//   _PullToRefreshArrowIndicatorPainter({required this._controller}) {
//     controller.addListener(notifyListeners);
//   }

//   PullToRefreshController _controller;

//   PullToRefreshController get controller => _controller;

//   set controller(PullToRefreshController value) {
//     if (_controller == value) return;
//     _controller.removeListener(notifyListeners);
//     _controller = value;
//     _controller.addListener(notifyListeners);
//     notifyListeners();
//   }

//   @override
//   void paint(Canvas canvas, Size size) {}
// }

mixin PullToRefreshLoadingIndicatorStates
    implements PullToRefreshStates, LoadingIndicatorStates {}

typedef PullToRefreshLoadingIndicatorStateProperty<T extends Object?> =
    StateProperty<T, PullToRefreshLoadingIndicatorStates>;

final class _PullToRefreshLoadingIndicatorStates
    implements PullToRefreshLoadingIndicatorStates {
  const _PullToRefreshLoadingIndicatorStates({
    required this.enabled,
    required this.threshold,
    required this.isRefreshing,
    required this.distanceFraction,
    required this.isAnimating,
    required this.verticalOffset,
    required this.distancePulled,
    required this.adjustedDistancePulled,
    required this.progress,
  });

  factory _PullToRefreshLoadingIndicatorStates.fromPullToRefreshStates(
    PullToRefreshStates states,
  ) => .new(
    enabled: states.enabled,
    threshold: states.threshold,
    isRefreshing: states.isRefreshing,
    distanceFraction: states.distanceFraction,
    isAnimating: states.isAnimating,
    verticalOffset: states.verticalOffset,
    distancePulled: states.distancePulled,
    adjustedDistancePulled: states.adjustedDistancePulled,
    progress: states.progress,
  );

  @override
  final bool enabled;

  @override
  final double threshold;

  @override
  final bool isRefreshing;

  @override
  final double distanceFraction;

  @override
  final bool isAnimating;

  @override
  final double verticalOffset;

  @override
  final double distancePulled;

  @override
  final double adjustedDistancePulled;

  @override
  final double progress;

  @override
  bool get isContained => true;
}

class PullToRefreshLoadingIndicator extends StatefulWidget {
  const PullToRefreshLoadingIndicator({
    super.key,
    required this.controller,
    this.determinateIndicatorPolygons,
    this.indeterminateIndicatorPolygons,
    this.containerShape,
    this.containerColor,
    this.containerOutline,
    this.activeIndicatorColor,
    this.activeIndicatorOutline,
    this.forEachPolygon = LoadingIndicatorHelper.defaultForEachPolygon,
  });

  final PullToRefreshController controller;

  final List<RoundedPolygon>? determinateIndicatorPolygons;

  final List<RoundedPolygon>? indeterminateIndicatorPolygons;

  final PullToRefreshLoadingIndicatorStateProperty<OutlinedBorder?>?
  containerShape;

  final PullToRefreshLoadingIndicatorStateProperty<Color?>? containerColor;

  final PullToRefreshLoadingIndicatorStateProperty<OutlinePartial?>?
  containerOutline;

  final PullToRefreshLoadingIndicatorStateProperty<Color?>?
  activeIndicatorColor;

  final PullToRefreshLoadingIndicatorStateProperty<OutlinePartial?>?
  activeIndicatorOutline;

  final LoadingIndicatorForEachPolygon forEachPolygon;

  @override
  State<PullToRefreshLoadingIndicator> createState() =>
      _PullToRefreshLoadingIndicatorState();
}

class _PullToRefreshLoadingIndicatorState
    extends State<PullToRefreshLoadingIndicator>
    with SingleTickerProviderStateMixin {
  PullToRefreshController get _controller => widget.controller;

  late LoadingIndicatorThemeData _loadingIndicatorTheme;

  late _PullToRefreshLoadingIndicatorStates _states;
  late OutlinedBorder _resolvedContainerShape;
  late Color _resolvedContainerColor;
  late Outline _resolvedContainerOutline;
  late Color _resolvedActiveIndicatorColor;
  late Outline _resolvedActiveIndicatorOutline;

  void _update() {
    _states = .fromPullToRefreshStates(_controller);

    _resolvedContainerShape =
        widget.containerShape?.resolve(_states) ??
        _loadingIndicatorTheme.containerShape.resolve(_states);

    _resolvedContainerColor =
        widget.containerColor?.resolve(_states) ??
        _loadingIndicatorTheme.containerColor.resolve(_states);

    _resolvedContainerOutline = _loadingIndicatorTheme.containerOutline
        .resolve(_states)
        .maybeMerge(widget.containerOutline?.resolve(_states));

    _resolvedActiveIndicatorColor =
        widget.activeIndicatorColor?.resolve(_states) ??
        _loadingIndicatorTheme.activeIndicatorColor.resolve(_states);

    _resolvedActiveIndicatorOutline = _loadingIndicatorTheme
        .activeIndicatorOutline
        .resolve(_states)
        .maybeMerge(widget.activeIndicatorOutline?.resolve(_states));
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_update);
  }

  @override
  void didUpdateWidget(covariant PullToRefreshLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_update);
      widget.controller.addListener(_update);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadingIndicatorTheme = LoadingIndicatorTheme.of(context);
  }

  @override
  void dispose() {
    _controller.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _update();

    const resolvedContainerSize = 48.0;

    final Widget determinateActiveIndicator = AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = math.max(0.0, _controller.distanceFraction);
        return Transform.rotate(
          // Start the rotation on progress - 1 (i.e. 0) to avoid a jump
          // that would be more noticeable on some LoadingIndicator shapes.
          angle: progress > 1.0 ? -(progress - 1.0) * math.pi : 0.0,
          transformHitTests: false,
          child: DeterminateLoadingIndicator(
            indicatorPolygons: widget.determinateIndicatorPolygons,
            contained: false,
            containerShape: const .all(RoundedRectangleBorder()),
            containerColor: const .all(Colors.transparent),
            containerOutline: const .all(.from()),
            activeIndicatorColor: .all(_resolvedActiveIndicatorColor),
            activeIndicatorOutline: .all(_resolvedActiveIndicatorOutline),
            progress: clampDouble(_controller.distanceFraction, 0.0, 1.0),
          ),
        );
      },
    );

    final Widget indeterminateActiveIndicator = AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => IndeterminateLoadingIndicator(
        indicatorPolygons: widget.indeterminateIndicatorPolygons,
        contained: false,
        containerShape: const .all(RoundedRectangleBorder()),
        containerColor: const .all(Colors.transparent),
        containerOutline: const .all(.from()),
        activeIndicatorColor: .all(_resolvedActiveIndicatorColor),
        activeIndicatorOutline: .all(_resolvedActiveIndicatorOutline),
      ),
    );

    return SizedBox.square(
      dimension: resolvedContainerSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Surface(
          clipBehavior: .antiAlias,
          shape: _resolvedContainerOutline.apply(_resolvedContainerShape),
          color: _resolvedContainerColor,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          child: _PullToRefreshLoadingIndicatorCrossFade(
            isRefreshing: _controller.isRefreshing,
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

  late SpringThemeData _springTheme;

  void _startImplicitAnimation() {
    final oldValue = _crossFadeController.value;
    final newValue = _crossFadeFractionTargetValue;
    if (newValue == oldValue) return;

    final simulation = SpringSimulation(
      _springTheme.defaultEffects.toSpringDescription(),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _springTheme = SpringTheme.of(context);
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

// class PullToRefreshBuilder extends StatefulWidget {
//   const PullToRefreshBuilder({
//     super.key,
//     this.controller,
//     this.onRefresh,
//     this.enabled,
//     this.delegate,
//     this.threshold,
//     this.isRefreshing,
//     required this.viewportBuilder,
//     required this.indicatorBuilder,
//   });

//   final PullToRefreshController? controller;

//   final VoidCallback? onRefresh;

//   final bool? enabled;

//   final PullToRefreshDelegate? delegate;

//   final double? threshold;

//   final bool? isRefreshing;

//   final Widget Function(BuildContext context, Widget child) viewportBuilder;

//   final Widget Function(
//     BuildContext context,
//     PullToRefreshController controller,
//   )
//   indicatorBuilder;

//   @override
//   State<PullToRefreshBuilder> createState() => _PullToRefreshBuilderState();
// }

// class _PullToRefreshBuilderState extends State<PullToRefreshBuilder>
//     with SingleTickerProviderStateMixin {
//   PullToRefreshDefaultDelegate? _internalDelegate;

//   PullToRefreshDelegate get _delegate => widget.delegate ?? _internalDelegate!;

//   PullToRefreshController? _internalController;

//   PullToRefreshController get _controller =>
//       widget.controller ?? _internalController!;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.delegate == null) {
//       _internalDelegate = .new(vsync: this);
//     }
//     if (widget.controller == null) {
//       _internalController = .new(
//         onRefresh:
//             widget.onRefresh ?? PullToRefreshController._defaultOnRefresh,
//         enabled: widget.enabled ?? true,
//         delegate: _delegate,
//         threshold: widget.threshold ?? _kPositionalThreshold,
//         isRefreshing: widget.isRefreshing ?? false,
//       );
//     } else {
//       if (widget.onRefresh case final onRefresh?) {
//         _controller.onRefresh = onRefresh;
//       }
//       if (widget.enabled case final enabled?) {
//         _controller.enabled = enabled;
//       }
//       _controller.delegate = _delegate;
//       if (widget.threshold case final threshold?) {
//         _controller.threshold = threshold;
//       }
//       if (widget.isRefreshing case final isRefreshing?) {
//         _controller.isRefreshing = isRefreshing;
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(covariant PullToRefreshBuilder oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller != oldWidget.controller) {}

//     if (widget.onRefresh != oldWidget.onRefresh) {
//       if (widget.controller == null) {
//         _controller.onRefresh =
//             widget.onRefresh ?? PullToRefreshController._defaultOnRefresh;
//       } else if (widget.onRefresh case final onRefresh?) {
//         _controller.onRefresh = onRefresh;
//       }
//     }

//     if (widget.enabled != oldWidget.enabled) {
//       if (widget.controller == null) {
//         _controller.enabled = widget.enabled ?? true;
//       } else if (widget.enabled case final enabled?) {
//         _controller.enabled = enabled;
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _internalController?.dispose();
//     _internalController = null;

//     _internalDelegate?.dispose();
//     _internalDelegate = null;

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final child = PullToRefresh(controller: _controller);
//     return widget.viewportBuilder(context, child);
//   }
// }
