import 'package:collection/collection.dart';

/// Represents result of a quantizer run.
final class QuantizerResult {
  const QuantizerResult({required this.colorToCount});

  final Map<int, int> colorToCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuantizerResult &&
          const MapEquality<int, int>().equals(
            colorToCount,
            other.colorToCount,
          );

  @override
  int get hashCode => const MapEquality<int, int>().hash(colorToCount);
}
