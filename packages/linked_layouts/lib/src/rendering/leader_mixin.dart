import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderLayoutLeaderMixin<
  LeaderClientType extends LayoutLeaderClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, LayoutFollowerClient>
>
    on
        RenderBox,
        RenderObjectWithLayoutLinkBaseMixin<LeaderClientType, LayoutLinkType> {
  Size? _lastSize;

  LeaderLayoutLinkHandle<LeaderClientType, LayoutFollowerClient>?
  _layoutLinkHandle;

  @protected
  @override
  LeaderLayoutLinkHandle<LeaderClientType, LayoutFollowerClient>?
  get layoutLinkHandle => _layoutLinkHandle;

  @protected
  @override
  set layoutLinkHandle(
    LeaderLayoutLinkHandle<LeaderClientType, LayoutFollowerClient>? value,
  ) => _layoutLinkHandle = value;

  @override
  LeaderClientType createLayoutClientInternal();

  @override
  LeaderClientType createLayoutClient() =>
      super.createLayoutClient()..size = _lastSize;

  @override
  LeaderLayoutLinkHandle<LeaderClientType, LayoutFollowerClient>
  registerLayoutClient(LayoutLinkType layoutLink, LeaderClientType client) =>
      layoutLink.registerLeader(client);

  @mustCallSuper
  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    layoutLinkHandle?.onClientNeedsLayout();
  }

  @mustCallSuper
  @override
  void performLayout() {
    super.performLayout();
    layoutLinkHandle?.client.size = _lastSize = size;
  }

  @mustCallSuper
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    layoutLinkHandle?.onClientPaint();
  }
}
