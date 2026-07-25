import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

mixin RenderLayoutFollowerMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, FollowerClientType>
>
    on
        RenderObject,
        RenderObjectWithLayoutLinkBaseMixin<
          FollowerClientType,
          LayoutLinkType
        > {
  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  _layoutLinkHandle;

  @protected
  @override
  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  get layoutLinkHandle => _layoutLinkHandle;

  @protected
  @override
  set layoutLinkHandle(
    FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>? value,
  ) => _layoutLinkHandle = value;

  @override
  FollowerClientType createLayoutClientInternal();

  @override
  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>
  registerLayoutClient(LayoutLinkType layoutLink, FollowerClientType client) =>
      layoutLink.registerFollower(client);

  @mustCallSuper
  @override
  void redepthChildren() {
    if (layoutLinkHandle?.tryRedepthClient() == true) return;
    super.redepthChildren();
  }
}
