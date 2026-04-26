import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin LayoutLinkClient<RenderObjectType extends RenderObject> {
  RenderObjectType get renderObject;
}

mixin LayoutLeaderClient<RenderObjectType extends RenderBox>
    on LayoutLinkClient<RenderObjectType> {
  Size? _size;

  Size? get size => renderObject.attached ? _size : null;

  set size(Size? value) {
    if (renderObject.attached) _size = value;
  }

  Size? get scale {
    if (!renderObject.attached) return null;
    var ancestor = renderObject.parent;
    while (ancestor != null && ancestor is! RenderView) {
      ancestor = ancestor.parent;
    }
    final transform = LayoutLink.tryGetTransformTo(
      renderObject,
      ancestor: ancestor,
    );
    if (transform == null) return null;
    // TODO: perspective transform (inline calculations from Matrix4)
    final matrix = transform.storage;
    return Size(matrix[0], matrix[5]);
    // Initial calculation:
    // return Size(
    //   transform.transform3(.new(1, 0, 0)).x - transform.transform3(.zero()).x,
    //   transform.transform3(.new(0, 1, 0)).y - transform.transform3(.zero()).y,
    // );
  }
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
