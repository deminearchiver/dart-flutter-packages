import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderObjectWithOptionalLayoutLinkMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    on RenderObject {
  LayoutLinkType? _layoutLink;

  LayoutLinkType? get layoutLink => _layoutLink;

  set layoutLink(LayoutLinkType? value) {
    if (_layoutLink == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (value != null && attached) {
      final client = createLayoutClient();
      // TODO: should this go before or after _layoutLink = value?
      layoutLinkHandle = registerLayoutClient(value, client);
    }
    _layoutLink = value;
    markNeedsLayout();
  }

  @protected
  LayoutLinkHandle<LayoutClientType>? layoutLinkHandle;

  @protected
  LayoutLinkHandle<LayoutClientType> registerLayoutClient(
    LayoutLinkType layoutLink,
    LayoutClientType client,
  );

  @protected
  LayoutClientType createLayoutClientInternal();

  @mustCallSuper
  @protected
  LayoutClientType createLayoutClient() => createLayoutClientInternal();

  @mustCallSuper
  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(layoutLinkHandle == null);
    if (layoutLink case final layoutLink?) {
      final client = createLayoutClient();
      layoutLinkHandle = registerLayoutClient(layoutLink, client);
    }
  }

  @mustCallSuper
  @override
  void detach() {
    super.detach();
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
  }
}
