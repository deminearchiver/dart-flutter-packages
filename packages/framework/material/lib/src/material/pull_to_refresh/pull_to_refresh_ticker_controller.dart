import 'package:flutter/scheduler.dart';
import 'package:material/src/material/flutter.dart';

abstract class PullToRefreshTickerController({
  super.onRefresh,
  super.enabled,
  super.threshold,
  super.isRefreshing,
  required TickerProvider vsync,
  final String? debugLabel,
}) extends PullToRefreshController {
  this {
    _ticker = vsync.createTicker(_tick);
  }

  // ////////////////////////////////////////////////////////////////
  // Animation //
  // ////////////////////////////////////////////////////////////////

  late Ticker _ticker;

  void resync(TickerProvider vsync) {
    _ticker = vsync.createTicker(_tick)..absorbTicker(_ticker);
  }

  void _tick(Duration elapsed) {
    _lastElapsedDuration = elapsed;
    _lastElapsedInSeconds = null;
    tick();
    notifyListeners();
  }

  @override
  bool get isAnimating => _ticker.isTicking;

  Duration _lastElapsedDuration = .zero;

  @protected
  Duration get lastElapsedDuration => _lastElapsedDuration;

  double? _lastElapsedInSeconds;

  double get lastElapsedInSeconds {
    if (_lastElapsedInSeconds case final lastElapsedInSeconds?) {
      return lastElapsedInSeconds;
    }
    final lastElapsedInSeconds =
        lastElapsedDuration.inMicroseconds / Duration.microsecondsPerSecond;
    assert(lastElapsedInSeconds >= 0.0);
    return _lastElapsedInSeconds = lastElapsedInSeconds;
  }

  @protected
  void start() {
    if (isAnimating) return;
    _ticker.start();
    notifyListeners();
  }

  @protected
  void stop({bool canceled = true}) {
    if (!isAnimating) return;
    _lastElapsedDuration = .zero;
    _ticker.stop(canceled: canceled);
  }

  @protected
  void tick() {}

  // ////////////////////////////////////////////////////////////////
  // AnimationLocalListenersMixin, ChangeNotifier //
  // ////////////////////////////////////////////////////////////////

  final _listeners = HashedObserverList<VoidCallback>();

  @override
  bool get hasListeners => _listeners.isNotEmpty;

  @override
  void addListener(VoidCallback listener) {
    didRegisterListener();
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    if (_listeners.remove(listener)) {
      didUnregisterListener();
    }
  }

  @override
  void clearListeners() {
    _listeners.clear();
  }

  @pragma("vm:notify-debugger-on-exception")
  void _notifyListeners() {
    final localListeners = _listeners.toList(growable: false);
    for (final listener in localListeners) {
      InformationCollector? collector;
      assert(() {
        collector = () => [
          DiagnosticsProperty<AnimationLocalListenersMixin>(
            "The $runtimeType notifying listeners was",
            this,
            style: .errorProperty,
          ),
        ];
        return true;
      }());
      try {
        if (_listeners.contains(listener)) listener();
      } catch (exception, stack) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: "animation library",
            context: ErrorDescription(
              "while notifying listeners for $runtimeType",
            ),
            informationCollector: collector,
          ),
        );
      }
    }
  }

  @override
  void notifyListeners() {
    if (isDisposed) return;
    final schedulerBinding = SchedulerBinding.instance;
    switch (schedulerBinding.schedulerPhase) {
      // We check scheduler phase here because this method could be called
      // during layout phase potentially (scroll physics).
      case .persistentCallbacks:
        schedulerBinding.addPostFrameCallback((_) {
          if (isDisposed) return;
          _notifyListeners();
        });
      default:
        _notifyListeners();
    }
  }

  @override
  void dispose() {
    stop();
    _ticker.dispose();
    super.dispose();
  }
}

class PullToRefreshSpringController({
  super.onRefresh,
  super.enabled,
  super.threshold,
  super.isRefreshing,
  required super.vsync,
  SpringDescription? spring,
  super.debugLabel,
}) extends PullToRefreshTickerController {
  SpringDescription _spring = spring ?? defaultSpring;

  SpringDescription get spring => _spring;
  set spring(SpringDescription value) {
    if (_spring == value) return;
    _spring = value;
  }

  Simulation? _simulation;

  double get _velocity {
    if (_simulation case final simulation? when isAnimating) {
      return simulation.dx(
        _lastElapsedDuration.inMicroseconds / Duration.microsecondsPerSecond,
      );
    }
    return 0.0;
  }

  double _distanceFraction = 0.0;

  @override
  double get distanceFraction => _distanceFraction;

  Simulation _createSimulation(double targetValue) => SpringSimulation(
    spring,
    distanceFraction,
    targetValue,
    _velocity,
    snapToEnd: true,
  );

  @mustCallSuper
  @override
  void animateToThreshold() {
    final simulation = _createSimulation(1.0);
    super.animateToThreshold();
    stop();
    _simulation = simulation;
    _distanceFraction = simulation.x(0.0);
    markNeedsVerticalOffsetUpdate();
    start();
  }

  @mustCallSuper
  @override
  void animateToHidden() {
    final simulation = _createSimulation(0.0);
    super.animateToHidden();
    stop();
    _simulation = simulation;
    _distanceFraction = simulation.x(0.0);
    markNeedsVerticalOffsetUpdate();
    start();
  }

  @mustCallSuper
  @override
  void snapTo(double targetValue) {
    stop();
    _distanceFraction = targetValue;
    markNeedsVerticalOffsetUpdate();
  }

  @override
  void tick() {
    if (_simulation case final simulation?) {
      final isDone = simulation.isDone(lastElapsedInSeconds);
      _distanceFraction = isDone
          ? (isRefreshing ? 1.0 : 0.0)
          : simulation.x(lastElapsedInSeconds);
      markNeedsVerticalOffsetUpdate();
      if (isDone) {
        stop(canceled: false);
      }
    }
  }

  @mustCallSuper
  @override
  void stop({bool canceled = true}) {
    super.stop(canceled: canceled);
    _simulation = null;
  }

  // ////////////////////////////////////////////////////////////////
  // Defaults //
  // ////////////////////////////////////////////////////////////////

  static final defaultSpring = SpringDescription.withDampingRatio(
    mass: 1.0,
    stiffness: 1500.0,
    ratio: 1.0,
  );
}
