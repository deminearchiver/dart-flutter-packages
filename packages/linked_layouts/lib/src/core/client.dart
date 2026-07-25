import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

mixin LayoutLinkClient<RenderObjectType extends RenderObject> {
  RenderObjectType get renderObject;
}

mixin LayoutLeaderClient<RenderObjectType extends RenderBox>
    on LayoutLinkClient<RenderObjectType> {
  Size? _size;

  Size? get size => renderObject.attached ? _size : null;

  set size(Size? value) {
    if (!renderObject.attached) value = null;
    if (_size == value) return;
    _size = value;
  }

  final _scaleMatrix = Matrix4.identity();

  @Deprecated("Use tryGetTransformIn instead.")
  Size? get scale {
    if (!renderObject.attached) return null;
    RenderObject? ancestor = renderObject;
    while (ancestor?.parent != null && ancestor!.parent is! RenderView) {
      ancestor = ancestor.parent;
    }
    final transform = RenderObjectTransformHelper.tryGetTransformTo(
      renderObject,
      ancestor: ancestor,
      result: _scaleMatrix,
    );
    if (transform == null) return null;
    // TODO: perspective transform (inline calculations from Matrix4)
    final matrix = transform.storage;
    return Size(matrix[0], matrix[5]);
  }

  Matrix4? tryGetTransformIn(RenderObject other, {Matrix4? matrix}) =>
      RenderObjectTransformHelper.tryGetTransformIn(
        renderObject,
        other,
        matrix: matrix,
      );

  Offset? tryGetPositionIn(RenderObject other, {Matrix4? matrix}) =>
      RenderObjectTransformHelper.tryGetPositionIn(
        renderObject,
        other,
        matrix: matrix,
      );
}

mixin SlottedLayoutLeaderClient<
  RenderObjectType extends RenderBox,
  SlotType extends Object?
>
    on LayoutLeaderClient<RenderObjectType> {
  SlotType get slot;
}

mixin LayoutFollowerClient<RenderObjectType extends RenderObject>
    on LayoutLinkClient<RenderObjectType> {}

class DefaultLayoutLeaderClient<RenderObjectType extends RenderBox>
    with
        LayoutLinkClient<RenderObjectType>,
        LayoutLeaderClient<RenderObjectType> {
  DefaultLayoutLeaderClient(this.renderObject);

  @override
  final RenderObjectType renderObject;
}

class DefaultSlottedLayoutLeaderClient<
  RenderObjectType extends RenderBox,
  SlotType extends Object?
>
    extends DefaultLayoutLeaderClient<RenderObjectType>
    with SlottedLayoutLeaderClient<RenderObjectType, SlotType> {
  DefaultSlottedLayoutLeaderClient(super.renderObject, this.slot);

  @override
  final SlotType slot;
}

class DefaultLayoutFollowerClient<RenderObjectType extends RenderObject>
    with
        LayoutLinkClient<RenderObjectType>,
        LayoutFollowerClient<RenderObjectType> {
  DefaultLayoutFollowerClient(this.renderObject);

  @override
  final RenderObjectType renderObject;
}
