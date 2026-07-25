import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

mixin RenderObjectWithRequiredLayoutLinkMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    on RenderObject
    implements
        RenderObjectWithLayoutLinkBaseMixin<LayoutClientType, LayoutLinkType> {
  LayoutLinkType? _layoutLink;

  @protected
  LayoutLinkType? get layoutLinkOrNull => _layoutLink;

  @override
  LayoutLinkType get layoutLink {
    assert(debugAssertLayoutLinkInitialized(this));
    return _layoutLink!;
  }

  set layoutLink(LayoutLinkType value) {
    if (_layoutLink == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    _layoutLink = value;
    if (attached) {
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
    final client = createLayoutClient();
    layoutLinkHandle = registerLayoutClient(layoutLink, client);
  }

  @mustCallSuper
  @override
  void detach() {
    super.detach();
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
  }

  static bool debugAssertLayoutLinkInitialized(
    RenderObjectWithRequiredLayoutLinkMixin object,
  ) {
    assert(() {
      if (object._layoutLink == null) {
        throw FlutterError(
          "${object.runtimeType}.layoutLink was used before being initialized.\n"
          "${object.runtimeType}.layoutLink must be initialized before it can be used.",
        );
      }
      return true;
    }());
    return true;
  }
}
