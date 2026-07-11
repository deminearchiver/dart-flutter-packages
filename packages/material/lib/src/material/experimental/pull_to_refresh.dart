import 'dart:async';
import 'dart:math' as math;

import 'package:material/material_shapes.dart';
import 'package:material/src/material/flutter.dart';

const _kPositionalThreshold = 80.0;

const _kIndicatorMaxDistance = _kPositionalThreshold;

const _kDragMultiplier = 0.5;

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
    _spring,
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

class PullToRefreshController with ChangeNotifier {
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

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
  }

  PullToRefreshDelegate _delegate;

  PullToRefreshDelegate get delegate => _delegate;

  set delegate(PullToRefreshDelegate value) {
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

  /// Distance percentage towards the refresh threshold.
  ///
  /// * `0.0` indicates no distance.
  /// * `1.0` indicates being at the threshold offset.
  /// * `> 1.0` indicates overshoot beyond the provided threshold.
  double get distanceFraction => delegate.distanceFraction.value;

  /// Whether the controller is currently animating the indicator to the
  /// threshold offset, or back to the hidden offset
  bool get isAnimating => delegate.distanceFraction.isAnimating;

  double _verticalOffset = 0.0;

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

  double get adjustedDistancePulled => distancePulled * _kDragMultiplier;

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
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
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

  final LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape;

  final LoadingIndicatorStateProperty<Color?>? containerColor;

  final LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline;

  final LoadingIndicatorStateProperty<Color?>? activeIndicatorColor;

  final LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline;

  final LoadingIndicatorForEachPolygon forEachPolygon;

  @override
  State<PullToRefreshLoadingIndicator> createState() =>
      _PullToRefreshLoadingIndicatorState();
}

class _PullToRefreshLoadingIndicatorState
    extends State<PullToRefreshLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    // TODO: this should be topStart according to reference implementation?!
    return Align.center(
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          final progress = math.max(0.0, controller.distanceFraction);
          return Transform.rotate(
            // Start the rotation on progress - 1 (i.e. 0) to avoid a jump
            // that would be more noticeable on some LoadingIndicator shapes.
            angle: progress > 1.0 ? -(progress - 1.0) * math.pi : 0.0,
            transformHitTests: false,
            child: DeterminateLoadingIndicator(
              contained: true,
              indicatorPolygons: widget.determinateIndicatorPolygons,
              progress: clampDouble(controller.distanceFraction, 0.0, 1.0),
            ),
          );
        },
      ),
    );
  }
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
