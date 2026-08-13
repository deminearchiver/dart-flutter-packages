import 'package:meta/meta.dart';

@immutable
class const CornerRounding([
  final double radius = 0.0,
  final double smoothing = 0.0,
]) {
  this : assert(radius >= 0.0), assert(smoothing >= 0.0 && smoothing <= 1.0);

  const new from({double radius = 0.0, double smoothing = 0.0})
    : this(radius, smoothing);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CornerRounding &&
          radius == other.radius &&
          smoothing == other.smoothing;

  @override
  int get hashCode => Object.hash(radius, smoothing);

  static const unrounded = CornerRounding();
}
