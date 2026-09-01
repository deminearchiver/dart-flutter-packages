/// An interface to allow use of different color spaces by quantizers.
abstract interface class PointProvider<T extends Object?> {
  /// The four components in the color space of an sRGB color.
  T fromInt(int argb);

  /// The ARGB (i.e. hex code) representation of this color.
  int toInt(T point);

  /// Squared distance between two colors.
  /// Distance is defined by scientific color spaces and
  /// referred to as delta E.
  double distance(T a, T b);
}
