// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

class DefaultLayoutLeaderClient
    with RenderObjectLayoutClientMixin
    implements LayoutLeaderClient {
  const DefaultLayoutLeaderClient(
    this.renderObject, {
    required this.onTryGetSize,
  });

  @override
  final RenderBox renderObject;

  final LayoutLeaderClientSizeGetter onTryGetSize;

  @override
  void redepthChild(RenderObject child) {
    // ignore: invalid_use_of_protected_member
    renderObject.redepthChild(child);
  }

  @override
  Size? tryGetSize() =>
      renderObject.attached && renderObject.hasSize ? onTryGetSize() : null;

  @override
  Matrix4? tryGetTransformFrom(RenderObject? ancestor, {Matrix4? matrix}) =>
      RenderObjectTransformHelper.tryGetTransformTo(
        renderObject,
        ancestor: ancestor,
        result: matrix,
      );

  @override
  Matrix4? tryGetTransformIn(RenderObject other, {Matrix4? matrix}) =>
      RenderObjectTransformHelper.tryGetTransformIn(
        renderObject,
        other,
        matrix: matrix,
      );

  @override
  Offset? tryGetPositionIn(RenderObject other, {Matrix4? matrix}) =>
      RenderObjectTransformHelper.tryGetPositionIn(
        renderObject,
        other,
        matrix: matrix,
      );

  @override
  Rect? tryGetRectIn(RenderObject other, {Matrix4? matrix}) {
    final size = tryGetSize();
    if (size == null) return null;

    final transform = tryGetTransformIn(other, matrix: matrix);
    if (transform == null) return null;

    return MatrixUtils.transformRect(transform, Offset.zero & size);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DefaultLayoutLeaderClient &&
          renderObject == other.renderObject &&
          onTryGetSize == other.onTryGetSize;

  @override
  int get hashCode => Object.hash(runtimeType, renderObject, onTryGetSize);
}

class DefaultSlottedLayoutLeaderClient<SlotType extends Object?>
    extends DefaultLayoutLeaderClient
    implements SlottedLayoutLeaderClient<SlotType> {
  const DefaultSlottedLayoutLeaderClient(
    super.renderObject,
    this.slot, {
    required super.onTryGetSize,
  });

  @override
  final SlotType slot;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DefaultSlottedLayoutLeaderClient<SlotType> &&
          renderObject == other.renderObject &&
          onTryGetSize == other.onTryGetSize &&
          slot == other.slot;

  @override
  int get hashCode =>
      Object.hash(runtimeType, renderObject, onTryGetSize, slot);
}

class DefaultLayoutFollowerClient
    with RenderObjectLayoutClientMixin
    implements LayoutFollowerClient {
  const DefaultLayoutFollowerClient(this.renderObject);

  @override
  final RenderObject renderObject;

  @override
  bool tryRedepthWith(Iterable<LayoutLeaderClient> leaders) {
    LayoutLeaderClient? deepestLeader;
    for (final leader in leaders) {
      if (!leader.attached) continue;
      final maxDepth = deepestLeader?.depth;
      if (maxDepth == null || leader.depth > maxDepth) {
        deepestLeader = leader;
      }
    }
    if (deepestLeader != null && depth <= deepestLeader.depth) {
      deepestLeader.redepthChild(renderObject);

      // Return because leader's render object calls this function recursively.
      return true;
    }

    return false;
  }

  @override
  void markNeedsLayout() {
    renderObject.markNeedsLayout();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DefaultLayoutFollowerClient &&
          renderObject == other.renderObject;

  @override
  int get hashCode => Object.hash(runtimeType, renderObject);
}
