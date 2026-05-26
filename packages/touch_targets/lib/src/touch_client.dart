import 'package:flutter/rendering.dart';

enum TouchTargetBehavior { wrap, overflow }

mixin TouchClient {
  bool get isActive;

  Size get childSize;

  Rect getRectIn(RenderBox ancestor);

  double getDistanceToEdgeIn(RenderBox ancestor, Offset position);

  bool hitTestFrom(
    RenderBox ancestor,
    BoxHitTestResult result,
    Offset position,
  );

  bool isRelatedTo(RenderObject hit);
}
