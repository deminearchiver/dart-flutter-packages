import 'package:material_example/flutter.dart';

abstract class ProxySimulation implements Simulation {
  ProxySimulation({required Simulation simulation}) : _parent = simulation;

  final Simulation _parent;

  @override
  Tolerance get tolerance => _parent.tolerance;

  @override
  set tolerance(Tolerance value) {
    _parent.tolerance = value;
  }

  @override
  double x(double time) => _parent.x(time);

  @override
  double dx(double time) => _parent.dx(time);

  @override
  bool isDone(double time) => _parent.isDone(time);

  @override
  String toString() => _parent.toString();
}

class ScalingSimulation extends ProxySimulation {
  ScalingSimulation({required super.simulation, this.timeScale = 1.0})
    : assert(timeScale.isFinite),
      assert(timeScale > 0.0);

  final double timeScale;

  @override
  double x(double time) => super.x(time * timeScale);

  @override
  double dx(double time) => super.dx(time * timeScale);

  @override
  bool isDone(double time) => super.isDone(time * timeScale);

  @override
  String toString() =>
      "${objectRuntimeType(this, "ScalingSimulation")}"
      "(simulation: ${super.toString()}, timeScale: $timeScale)";
}

class DelayingSimulation extends ProxySimulation {
  DelayingSimulation({required super.simulation, this.delay = .zero})
    : assert(delay >= .zero);

  final Duration delay;
  late final double _delayInSeconds =
      delay.inMicroseconds / Duration.microsecondsPerSecond;

  @override
  double x(double time) =>
      time >= _delayInSeconds ? super.x(time - _delayInSeconds) : super.x(0.0);

  @override
  double dx(double time) =>
      time >= _delayInSeconds ? super.dx(time - _delayInSeconds) : 0.0;

  @override
  bool isDone(double time) =>
      time >= _delayInSeconds && super.isDone(time - _delayInSeconds);

  @override
  String toString() =>
      "${objectRuntimeType(this, "DelayingSimulation")}"
      "(simulation: ${super.toString()}, delay: $delay)";
}
