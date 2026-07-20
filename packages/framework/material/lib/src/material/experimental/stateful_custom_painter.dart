import 'package:material/src/material/flutter.dart';

abstract class StatefulCustomPainter<T extends StatefulCustomPainter<T>>
    with ChangeNotifier
    implements CustomPainter {
  StatefulCustomPainter() {
    if (kFlutterMemoryAllocationsEnabled) {
      ChangeNotifier.maybeDispatchObjectCreation(this);
    }
  }

  @override
  void paint(Canvas canvas, Size size);

  @override
  SemanticsBuilderCallback? get semanticsBuilder => null;

  @override
  bool shouldRebuildSemantics(T oldDelegate) => shouldRepaint(oldDelegate);

  @override
  bool shouldRepaint(T oldDelegate) => true;

  @override
  bool? hitTest(Offset position) => null;

  @override
  String toString() => "${describeIdentity(this)}()";
}
