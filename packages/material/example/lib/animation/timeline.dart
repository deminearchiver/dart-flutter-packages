import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

typedef TickerListener = void Function(TickerState state);

sealed class TickerState {
  const TickerState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is TickerState;

  @override
  int get hashCode => runtimeType.hashCode;
}

class StoppedTickerState extends TickerState {
  const StoppedTickerState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is StoppedTickerState;

  @override
  int get hashCode => runtimeType.hashCode;
}

class TickingTickerState extends TickerState {
  const TickingTickerState(this.elapsed);

  final Duration elapsed;

  double get elapsedInSeconds =>
      elapsed.inMicroseconds / Duration.microsecondsPerSecond;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TickingTickerState &&
          elapsed == other.elapsed;

  @override
  int get hashCode => Object.hash(runtimeType, elapsed);
}

mixin AnimationLocalTickerListenersMixin {
  final _tickerListeners = HashedObserverList<TickerListener>();

  @protected
  void didRegisterListener();

  @protected
  void didUnregisterListener();

  void addTickerListener(TickerListener listener) {
    didRegisterListener();
    _tickerListeners.add(listener);
  }

  void removeTickerListener(TickerListener listener) {
    final removed = _tickerListeners.remove(listener);
    if (removed) {
      didUnregisterListener();
    }
  }

  @protected
  void clearTickerListeners() {
    _tickerListeners.clear();
  }

  @protected
  @pragma("vm:notify-debugger-on-exception")
  void notifyTickerListeners(TickerState state) {
    final localListeners = _tickerListeners.toList(growable: false);
    for (final listener in localListeners) {
      try {
        if (_tickerListeners.contains(listener)) {
          listener(state);
        }
      } catch (exception, stack) {
        InformationCollector? collector;
        assert(() {
          collector = () => <DiagnosticsNode>[
            DiagnosticsProperty<AnimationLocalTickerListenersMixin>(
              "The $runtimeType notifying ticker listeners was",
              this,
              style: .errorProperty,
            ),
          ];
          return true;
        }());
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: "animation library",
            context: ErrorDescription(
              "while notifying ticker listeners for $runtimeType",
            ),
            informationCollector: collector,
          ),
        );
      }
    }
  }
}

class TimelineController
    with
        AnimationEagerListenerMixin,
        AnimationLocalStatusListenersMixin,
        AnimationLocalTickerListenersMixin {
  TimelineController({required TickerProvider vsync}) {
    _ticker = vsync.createTicker(_tick);
  }

  late Ticker _ticker;

  void resync(TickerProvider vsync) {
    _ticker = vsync.createTicker(_tick)..absorbTicker(_ticker);
  }

  void _tick(Duration elapsed) {
    final state = TickingTickerState(elapsed);
    final elapsedInSeconds = state.elapsedInSeconds;
    _lastTickerState = state;
    notifyTickerListeners(state);
  }

  TickerState _lastTickerState = const StoppedTickerState();

  TickerFuture start() {
    _lastTickerState = const TickingTickerState(.zero);
    final result = _ticker.start();
    return result;
  }

  void stop({bool canceled = true}) {
    notifyTickerListeners(_lastTickerState);
    _ticker.stop(canceled: canceled);
  }

  void _attach(TimelineAnimation animation) {
    animation.addStatusListener(_statusListener);
  }

  void _detach(TimelineAnimation animation) {
    animation.addStatusListener(_statusListener);
  }

  void _statusListener(AnimationStatus status) {}

  @override
  void dispose() {
    _ticker.dispose();
    clearTickerListeners();
    clearStatusListeners();
    super.dispose();
  }
}

mixin TimelineListenerMixin {}

class TimelineAnimation extends Animation<double>
    with
        AnimationLazyListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  TimelineAnimation({
    required TimelineController controller,
    required Simulation simulation,
  }) : _controller = controller,
       _simulation = simulation {
    _controller
      .._attach(this)
      ..addTickerListener(_tickerListener);
    _status = .dismissed;
  }

  TimelineController _controller;
  TimelineController get controller => _controller;
  set controller(TimelineController value) {
    if (_controller == value) return;
    _controller
      .._detach(this)
      ..removeTickerListener(_tickerListener);
    _controller = value;
    _controller
      .._attach(this)
      ..addTickerListener(_tickerListener);
  }

  final Simulation _simulation;

  void _tickerListener(TickerState state) {
    if (status == .completed) return;
    switch (state) {
      case StoppedTickerState():
        _status = .dismissed;
      case TickingTickerState(:final elapsedInSeconds):
        _value = _simulation.x(elapsedInSeconds);
        if (_simulation.isDone(elapsedInSeconds)) {
          _status = .completed;
        } else {
          _status = .forward;
        }
        notifyListeners();
    }
    _checkStatusChanged();
  }

  late AnimationStatus _status;

  AnimationStatus _lastReportedStatus = AnimationStatus.dismissed;
  void _checkStatusChanged() {
    final AnimationStatus newStatus = status;
    if (_lastReportedStatus != newStatus) {
      _lastReportedStatus = newStatus;
      notifyStatusListeners(newStatus);
    }
  }

  @override
  void didStartListening() {}

  @override
  void didStopListening() {}

  @override
  AnimationStatus get status => _status;

  double _value = 0.0;

  @override
  double get value => 0.0;
}
