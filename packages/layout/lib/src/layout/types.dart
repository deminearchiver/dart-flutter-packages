import 'package:layout/src/layout/flutter.dart';

/// Singature for a function that takes a [RenderBox] and specifies the child's
/// origin relative to the parent origin.
typedef ChildPositioner = void Function(RenderBox child, Offset position);
