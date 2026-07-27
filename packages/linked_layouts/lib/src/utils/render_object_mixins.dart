import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

mixin LayoutLeaderRenderObjectMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, FollowerClientType>
>
    on RenderBox {
  LayoutLinkType? _layoutLink;

  LeaderLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  _layoutLinkHandle;

  @visibleForOverriding
  LeaderClientType createLayoutClient({
    required LayoutLeaderClientSizeGetter onTryGetSize,
  });

  @protected
  LeaderLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  updateLayoutLink(LayoutLinkType? layoutLink, [VoidCallback? stateCallback]) {
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;

    stateCallback?.call();
    _layoutLink = layoutLink;

    if (layoutLink != null && attached) {
      final client = createLayoutClient(onTryGetSize: _onTryGetSize);
      return _layoutLinkHandle = layoutLink.registerLeader(client);
    }
    return null;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_layoutLinkHandle == null);
    if (_layoutLink case final layoutLink?) {
      final client = createLayoutClient(onTryGetSize: _onTryGetSize);
      _layoutLinkHandle = layoutLink.registerLeader(client);
    }
  }

  @override
  void detach() {
    super.detach();
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
  }

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    _layoutLinkHandle?.onClientNeedsLayout();
  }

  Size? _lastSize;

  Size? _onTryGetSize() => _lastSize;

  @override
  void performLayout() {
    super.performLayout();
    _lastSize = size;
    _layoutLinkHandle?.onClientDidLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    _layoutLinkHandle?.onClientPaint();
  }
}

mixin LayoutFollowerRenderObjectMixin<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType extends LayoutLink<LeaderClientType, FollowerClientType>
>
    on RenderObject {
  LayoutLinkType? _layoutLink;

  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  _layoutLinkHandle;

  @visibleForOverriding
  FollowerClientType createLayoutClient();

  @protected
  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>?
  updateLayoutLink(LayoutLinkType? layoutLink, [VoidCallback? stateCallback]) {
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;

    stateCallback?.call();
    _layoutLink = layoutLink;

    if (layoutLink != null && attached) {
      final client = createLayoutClient();
      return _layoutLinkHandle = layoutLink.registerFollower(client);
    }
    return null;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_layoutLinkHandle == null);
    if (_layoutLink case final layoutLink?) {
      final client = createLayoutClient();
      _layoutLinkHandle = layoutLink.registerFollower(client);
    }
  }

  @override
  void detach() {
    super.detach();
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
  }

  @override
  void redepthChildren() {
    if (_layoutLinkHandle?.tryRedepthClient() == true) return;
    super.redepthChildren();
  }
}
