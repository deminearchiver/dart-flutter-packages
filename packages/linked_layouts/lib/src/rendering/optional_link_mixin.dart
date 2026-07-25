import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

mixin RenderObjectWithOptionalLayoutLinkMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    on RenderObject
    implements
        RenderObjectWithLayoutLinkBaseMixin<LayoutClientType, LayoutLinkType> {
  LayoutLinkType? _layoutLink;

  @override
  LayoutLinkType? get layoutLink => _layoutLink;

  set layoutLink(LayoutLinkType? value) {
    if (_layoutLink == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    _layoutLink = value;
    if (value != null && attached) {
      final client = createLayoutClient();
      layoutLinkHandle = registerLayoutClient(value, client);
    }
    markNeedsLayout();
  }

  @mustCallSuper
  @protected
  @override
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
