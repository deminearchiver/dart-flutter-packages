import 'package:material_example/flutter.dart';

// extension ScreenCornersDataExtension on ScreenCornersData {
//   CornersBorderDelegate get cornersDelegate => switch (defaultTargetPlatform) {
//     .android || .fuchsia || .linux || .windows => .rounded,
//     .iOS || .macOS => .superellipse,
//   };

//   Corners toCorners() => Corners.only(
//     topLeft: .circular(topLeft),
//     topRight: .circular(topRight),
//     bottomLeft: .circular(bottomLeft),
//     bottomRight: .circular(bottomRight),
//   );

//   CornersBorder toShape({BorderSide side = .none}) => CornersBorder(
//     delegate: cornersDelegate,
//     corners: toCorners(),
//     side: side,
//   );
// }

mixin ExternalChangeNotifier on ChangeNotifier {
  void notify() => notifyListeners();
}

extension<E extends Object?> on List<E> {
  List<E> unfold(int start, {bool growable = false}) {
    final size = length;
    if (size == 0) return .empty(growable: growable);
    final remaining = size - start;
    final result = List<E>.filled(size, first, growable: growable)
      ..setRange(0, remaining, this, start);
    if (remaining < size) result.setRange(remaining, size, this, 0);
    return result;
  }
}
