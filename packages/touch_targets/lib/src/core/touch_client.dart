import 'package:flutter/rendering.dart';
import 'package:touch_targets/touch_targets.dart';

/// A client for a [TouchGroupRegistry].
///
/// This is typically mixed with a [RenderObject] or a custom class.
///
/// To register to a [TouchGroupRegistry], call
/// [TouchGroupRegistry.registerClient] with the client instance.
///
/// To unregister from a [TouchGroupRegistry], call
/// [TouchGroupRegistry.unregisterClient] with the client instance
/// on the same registry the client was registered to.
mixin TouchClient {
  /// Whether this client is currently able to receive hit tests.
  bool get isActive;

  /// The size of inner contents of this client.
  Size get innerSize;

  /// Compute the bounding [Rect] of the client's touch area
  /// relative to the specified [ancestor].
  Rect getRectIn(RenderBox ancestor);

  /// Compute the minimum distance from a given [position] in [ancestor]'s
  /// space to the edge of this client's touch area bounding rectangle.
  double getDistanceToEdgeIn(RenderBox ancestor, Offset position);

  /// Perform a forced hit test against inner contents of this client.
  bool hitTestInnerFrom(
    RenderBox ancestor,
    BoxHitTestResult result,
    Offset position,
  );

  /// Whether a given [hit] [RenderObject] has a lineal relation with this
  /// client.
  ///
  /// A relation between two [RenderObject]s is considered to be lineal when
  /// one is a direct ancestor or a direct descendant of the other in the
  /// render tree.
  bool hasLinealRelationWith(RenderObject hit);
}
