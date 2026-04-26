import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderObjectWithRequiredLayoutLinkMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    on RenderObject
    implements
        RenderObjectWithOptionalLayoutLinkMixin<
          LayoutClientType,
          LayoutLinkType
        > {
  LayoutLinkType? _layoutLink;

  @protected
  LayoutLinkType? get layoutLinkOrNull => _layoutLink;

  @override
  LayoutLinkType get layoutLink {
    assert(debugAssertLayoutLinkInitialized(this));
    return _layoutLink!;
  }

  // TODO: do something about covariant modifier
  @override
  set layoutLink(covariant LayoutLinkType value) {
    if (_layoutLink == value) return;
    layoutLinkHandle?.dispose();
    layoutLinkHandle = null;
    if (attached) {
      final client = createLayoutClient();
      // TODO: should this go before or after _layoutLink = value?
      layoutLinkHandle = registerLayoutClient(value, client);
    }
    _layoutLink = value;
    markNeedsLayout();
  }

  @protected
  @override
  LayoutLinkHandle<LayoutClientType>? layoutLinkHandle;

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
