import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

typedef LayoutLeaderClientSizeGetter = Size? Function();

abstract interface class LayoutClient {
  /// Whether this client is currently attached to a rendering pipeline.
  ///
  /// Typical implementations should return the [RenderObject.attached] value
  /// of this client's [RenderObject].
  @visibleForOverriding
  bool get attached;

  /// The depth of this client in the render tree.
  ///
  /// Typical implementations should return the [RenderObject.depth] value
  /// of this client's [RenderObject].
  @visibleForOverriding
  int get depth;
}

abstract interface class LayoutLeaderClient implements LayoutClient {
  const factory LayoutLeaderClient(
    RenderBox renderObject, {
    required LayoutLeaderClientSizeGetter onTryGetSize,
  }) = DefaultLayoutLeaderClient;

  /// Adjust the [depth] of the given [child] to be greater than this client's
  /// own [depth].
  ///
  /// Only call this method from overrides of [RenderObject.redepthChildren].
  ///
  /// Typical implementations should call the [RenderObject.redepthChild] method
  /// on this client's [RenderObject].
  @visibleForOverriding
  void redepthChild(RenderObject child);

  /// Attempts to resolve the size of this client.
  ///
  /// Returns a [Size] associated with this client's [RenderObject], or `null`
  /// if no size could be resolved.
  Size? tryGetSize();

  @visibleForOverriding
  Matrix4? tryGetTransformFrom(RenderObject? ancestor, {Matrix4? matrix});

  /// Attempts to resolve the transform of this client in the coordinate space
  /// of [other].
  ///
  /// Returns a [Matrix4] resolved from this client's [RenderObject] and
  /// [other], or `null` if no transform could be resolved.
  ///
  /// If a `matrix` is provided, it will be used instead for internal
  /// vector math of creating a new instance of [Matrix4].
  Matrix4? tryGetTransformIn(RenderObject other, {Matrix4? matrix});

  /// Attempts to resolve the position of this client in the coordinate space
  /// of [other].
  ///
  /// Returns an [Offset] resolved from this client's [RenderObject] and
  /// [other], or `null` if no position could be resolved.
  ///
  /// If a `matrix` is provided, it will be used instead for internal
  /// vector math of creating a new instance of [Matrix4].
  Offset? tryGetPositionIn(RenderObject other, {Matrix4? matrix});

  /// Attempts to resolve the rectangle matching the bounds of this client
  /// in the coordinate space of [other].
  ///
  /// Returns a [Rect] resolved from this client's [RenderObject] and
  /// [other], or `null` if no bounds could be resolved.
  ///
  /// If a `matrix` is provided, it will be used instead for internal
  /// vector math of creating a new instance of [Matrix4].
  Rect? tryGetRectIn(RenderObject other, {Matrix4? matrix});
}

abstract interface class SlottedLayoutLeaderClient<SlotType extends Object?>
    implements LayoutLeaderClient {
  const factory SlottedLayoutLeaderClient(
    RenderBox renderObject,
    SlotType slot, {
    required LayoutLeaderClientSizeGetter onTryGetSize,
  }) = DefaultSlottedLayoutLeaderClient;

  // A slot that can be used as a key to identify the client.
  SlotType get slot;
}

abstract interface class LayoutFollowerClient implements LayoutClient {
  const factory LayoutFollowerClient(RenderObject renderObject) =
      DefaultLayoutFollowerClient;

  /// This method must only be called from the [RenderObject] instance attached
  /// to this client.
  ///
  /// Returns `true` if the redepth was successful, meaning it's not longer
  /// needed to redepth the children of the client's [RenderObject]. If `false`
  /// is returned, the client may continue with redepthing its children.
  @visibleForOverriding
  bool tryRedepthWith(Iterable<LayoutLeaderClient> leaders);

  @visibleForOverriding
  void markNeedsLayout();
}

mixin RenderObjectLayoutClientMixin implements LayoutClient {
  RenderObject get renderObject;

  @override
  bool get attached => renderObject.attached;

  @override
  int get depth => renderObject.depth;
}
