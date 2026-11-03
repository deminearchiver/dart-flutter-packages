// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

class const DefaultLayoutLeaderClient<GeometryType extends Object>(
  @override final RenderObject renderObject, {
  required final LayoutLeaderClientGeometryGetter<GeometryType>
  _onTryGetGeometry,
}) with RenderObjectLayoutClientMixin
    implements LayoutLeaderClient<GeometryType> {
  @override
  void redepthChild(RenderObject child) {
    // ignore: invalid_use_of_protected_member
    renderObject.redepthChild(child);
  }

  @override
  GeometryType? tryGetGeometry() =>
      renderObject.attached ? _onTryGetGeometry() : null;

  @override
  Matrix4? tryGetTransformFrom(
    RenderObject? ancestor, {
    Matrix4? matrix,
    Map<RenderObject, Matrix4>? ancestorTransformCache,
  }) {
    if (tryGetGeometry() == null) return null;
    return RenderObjectTransformHelper.tryGetTransformTo(
      renderObject,
      ancestor: ancestor,
      result: matrix,
      ancestorTransformCache: ancestorTransformCache,
    );
  }

  @override
  Matrix4? tryGetTransformIn(RenderObject other, {Matrix4? matrix}) {
    if (tryGetGeometry() == null) return null;
    return RenderObjectTransformHelper.tryGetTransformIn(
      renderObject,
      other,
      matrix: matrix,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DefaultLayoutLeaderClient<GeometryType> &&
          renderObject == other.renderObject &&
          _onTryGetGeometry == other._onTryGetGeometry;

  @override
  int get hashCode => Object.hash(renderObject, _onTryGetGeometry);
}

class const DefaultSlottedLayoutLeaderClient<
  SlotType extends Object?,
  GeometryType extends Object
>(
  super.renderObject,
  @override final SlotType slot, {
  required super.onTryGetGeometry,
}) extends DefaultLayoutLeaderClient<GeometryType>
    implements SlottedLayoutLeaderClient<SlotType, GeometryType> {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DefaultSlottedLayoutLeaderClient<SlotType, GeometryType> &&
          renderObject == other.renderObject &&
          slot == other.slot &&
          _onTryGetGeometry == other._onTryGetGeometry;

  @override
  int get hashCode => Object.hash(renderObject, slot, _onTryGetGeometry);
}

class const DefaultLayoutFollowerClient(
  @override final RenderObject renderObject,
) with RenderObjectLayoutClientMixin implements LayoutFollowerClient {
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
  int get hashCode => renderObject.hashCode;
}
