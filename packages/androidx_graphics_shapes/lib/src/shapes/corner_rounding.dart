class CornerRounding {
  const CornerRounding([this.radius = 0.0, this.smoothing = 0.0])
    : assert(radius >= 0.0),
      assert(smoothing >= 0.0 && smoothing <= 1.0);

  const CornerRounding.from({double radius = 0.0, double smoothing = 0.0})
    : this(radius, smoothing);

  final double radius;

  final double smoothing;

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
