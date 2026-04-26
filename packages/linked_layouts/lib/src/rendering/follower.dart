import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderLayoutFollowerMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, FollowerClientType>
>
    on
        RenderObject,
        RenderObjectWithOptionalLayoutLinkMixin<
          FollowerClientType,
          LayoutLinkType
        > {
  @override
  LayoutLinkHandle<FollowerClientType> registerLayoutClient(
    LayoutLinkType layoutLink,
    FollowerClientType client,
  ) => layoutLink.registerFollower(client);

  @mustCallSuper
  @override
  void redepthChildren() {
    final deepestLeader = layoutLink?.leaders.fold<LeaderClientType?>(
      null,
      (result, leader) =>
          leader.renderObject.attached &&
              (result == null ||
                  leader.renderObject.depth > result.renderObject.depth)
          ? leader
          : result,
    );
    if (deepestLeader != null && depth <= deepestLeader.renderObject.depth) {
      deepestLeader.renderObject.redepthChild(this);
      // Return because leader's render object calls this function recursively.
      return;
    }
    super.redepthChildren();
  }
}
