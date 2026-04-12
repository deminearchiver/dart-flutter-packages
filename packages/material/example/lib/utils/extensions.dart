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
