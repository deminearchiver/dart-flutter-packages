import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

mixin RenderObjectWithLayoutLinkBaseMixin<
  LayoutClientType extends LayoutLinkClient,
  LayoutLinkType extends LayoutLink<LayoutLeaderClient, LayoutFollowerClient>
>
    on RenderObject {
  LayoutLinkType? get layoutLink;

  @protected
  LayoutLinkHandle<LayoutClientType>? get layoutLinkHandle;

  @protected
  set layoutLinkHandle(covariant LayoutLinkHandle<LayoutClientType>? value);

  @protected
  LayoutClientType createLayoutClientInternal();

  @mustCallSuper
  @protected
  LayoutClientType createLayoutClient();

  @protected
  LayoutLinkHandle<LayoutClientType> registerLayoutClient(
    LayoutLinkType layoutLink,
    LayoutClientType client,
  );
}
