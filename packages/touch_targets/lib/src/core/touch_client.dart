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

  /// Whether this client owns a given [hit] [RenderObject].
  ///
  /// For clients not associated with a [RenderObject],
  /// the implementation of this method must always return `false`.
  bool hasOwn(RenderObject renderObject);

  /// Whether a given [hit] [RenderObject] is a direct descendant of this
  /// client.
  ///
  /// If [renderObject] is this client's own [RenderObject], the implementation must
  /// return `false`.
  bool hasDescendant(RenderObject renderObject);

  /// Whether a given [hit] [RenderObject] is a direct ancestor of this client.
  ///
  /// If [renderObject] is this client's own [RenderObject], the implementation must
  /// return `false`.
  bool hasAncestor(RenderObject renderObject);
}
