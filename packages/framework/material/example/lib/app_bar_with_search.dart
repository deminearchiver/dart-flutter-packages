import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

class const AppBarWithSearch({
  super.key,
  final double? height,
  final Widget? leading,
  final Widget? trailing,
  required final Widget searchBarSupporting,
}) extends StatefulWidget {
  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  final _layoutLink = SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>();
  _AppBarSearchViewRoute? _route;

  Future<void> _openView() async {
    if (_route != null) return;
    final route = _AppBarSearchViewRoute(
      state: this,
      leading: widget.leading,
      trailing: widget.trailing,
      builder: (context) {
        final padding = MediaQuery.paddingOf(context);
        final colorTheme = ColorTheme.of(context);
        final shapeTheme = ShapeTheme.of(context);
        return Padding(
          padding: .fromLTRB(padding.left, 0.0, padding.right, 0.0),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const .symmetric(horizontal: 8.0),
                sliver: SliverList.separated(
                  itemCount: 25,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 2.0),
                  itemBuilder: (context, index) => ListItemContainer(
                    isFirst: index == 0,
                    isLast: index == 25 - 1,
                    containerColor: const .all(Colors.transparent),
                    child: ListItemInteraction(
                      onTap: () => Navigator.pop(context),
                      child: ListItemLayout(
                        leading: SizedBox.square(
                          dimension: 32.0,
                          child: Surface(
                            shape: shapeTheme.applyCorner(
                              corner: shapeTheme.cornerFull,
                            ),
                            color: colorTheme.surfaceContainerHigh,
                            child: const Icon(
                              MaterialSymbols.search_rounded,
                              opticalSize: 20.0,
                              size: 20.0,
                            ),
                          ),
                        ),
                        headline: Text("Result ${index + 1}"),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.0 + padding.bottom)),
            ],
          ),
        );
      },
    );
    setState(() => _route = route);
    await Navigator.of(context).push(route);
  }

  void _markNeedsBuild() {
    setState(() {});
  }

  @override
  void dispose() {
    if (_route case final route?) {
      Navigator.removeRoute(context, route);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final height = widget.height ?? 64.0;

    final route = _route;

    final visible =
        route == null ||
        route.offstage ||
        route.animation?.status == .dismissed;

    // debugPrint(
    //   "offstage: ${route?.offstage} / status: ${route?.animation?.status.name}",
    // );

    final leading = widget.leading;
    final trailing = widget.trailing;

    return Surface(
      color: colorTheme.surfaceContainer,
      child: Visibility(
        visible: visible,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        maintainSemantics: true,
        maintainInteractivity: false,
        maintainFocusability: false,
        child: Padding(
          padding: .fromLTRB(padding.left, padding.top, padding.right, 0.0),
          child: SlottedLayoutLeader<_SearchViewLeaderSlot>(
            layoutLink: _layoutLink,
            slot: .appBar,
            child: SizedBox(
              width: .infinity,
              height: height,
              child: SearchAppBarRowLayout(
                leading: widget.leading != null
                    ? SlottedLayoutLeader<_SearchViewLeaderSlot>(
                        layoutLink: _layoutLink,
                        slot: .appBarLeading,
                        child: leading,
                      )
                    : null,
                searchBar: Align.center(
                  widthFactor: 1.0,
                  child: SlottedLayoutLeader<_SearchViewLeaderSlot>(
                    layoutLink: _layoutLink,
                    slot: .searchBar,
                    child: SearchBarPaint(
                      centerAlignmentFraction: kAlwaysCompleteAnimation,
                      containerColor: colorTheme.surfaceContainerHighest,
                      onTap: _openView,
                      supportingText: widget.searchBarSupporting,
                      trailing: Padding(
                        padding: const .symmetric(horizontal: 4.0),
                        child: IconButton(
                          style: LegacyThemeFactory.createIconButtonStyle(
                            colorTheme: colorTheme,
                            elevationTheme: elevationTheme,
                            shapeTheme: shapeTheme,
                            stateTheme: stateTheme,
                            color: .standard,
                          ),
                          onPressed: () {},
                          icon: const Icon(MaterialSymbols.mic_rounded),
                        ),
                      ),
                    ),
                  ),
                ),
                trailing: trailing != null
                    ? SlottedLayoutLeader<_SearchViewLeaderSlot>(
                        layoutLink: _layoutLink,
                        slot: .appBarTrailing,
                        child: trailing,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarSearchViewRoute<T extends Object?>({
  required final _AppBarWithSearchState state,
  final Widget? leading,
  final Widget? trailing,
  required final WidgetBuilder builder,
}) extends PopupRoute<T> {
  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => .zero;

  var _externalOffstage = false;
  var _internalOffstage = false;

  void _setOffstageInternally() {
    super.offstage = _externalOffstage || _internalOffstage;
    _markStateNeedsBuild();
    changedInternalState();
  }

  void _markStateNeedsBuild() {
    if (SchedulerBinding.instance.schedulerPhase != .persistentCallbacks) {
      state._markNeedsBuild();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        state._markNeedsBuild();
      });
    }
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == .dismissed || status == .completed) {
      _markStateNeedsBuild();
    }
  }

  @override
  set offstage(bool value) {
    _externalOffstage = value;
    _setOffstageInternally();
  }

  @override
  TickerFuture didPush() {
    _internalOffstage = true;
    _setOffstageInternally();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _internalOffstage = false;
      _setOffstageInternally();
    });
    return super.didPush();
  }

  @override
  void install() {
    super.install();
    animation?.addStatusListener(_animationStatusListener);
  }

  @override
  void dispose() {
    state._route = null;
    super.dispose();
  }

  @override
  void handleCancelBackGesture() {
    _handleDragEnd(animateForward: true);
  }

  @override
  void handleCommitBackGesture() {
    _handleDragEnd(animateForward: false);
  }

  void _handleDragEnd({required bool animateForward}) {
    if (isCurrent) {
      if (animateForward) {
        // Typically, handleUpdateBackGestureProgress will have already
        // completed the animation. If not, animate to completion.
        if (controller case final controller? when !controller.isCompleted) {
          controller.animateWith(
            SpringSimulation(
              const SpringThemeData.defaultsExpressive().fastSpatial
                  .toSpringDescription(),
              controller.value,
              1.0,
              controller.velocity,
              snapToEnd: true,
            ),
          );
        }
      } else {
        // This route is destined to pop at this point. Reuse navigator's pop.
        navigator?.pop();

        // The popping may have finished inline if already at the target destination.
        if (controller case final controller? when controller.isAnimating) {
          controller.animateBackWith(
            SpringSimulation(
              const SpringThemeData.defaultsExpressive().fastSpatial
                  .toSpringDescription(),
              controller.value,
              0.0,
              controller.velocity,
              snapToEnd: true,
            ),
          );
        }
      }
    }

    if (controller?.isAnimating ?? false) {
      // Keep the userGestureInProgress in true state since AndroidBackGesturePageTransitionsBuilder
      // depends on userGestureInProgress.
      late final AnimationStatusListener animationStatusCallback;
      animationStatusCallback = (status) {
        navigator?.didStopUserGesture();
        controller!.removeStatusListener(animationStatusCallback);
      };
      controller!.addStatusListener(animationStatusCallback);
    } else {
      navigator?.didStopUserGesture();
    }
  }

  @override
  AnimationController createAnimationController() => .unbounded(
    vsync: navigator!,
    duration: transitionDuration,
    reverseDuration: reverseTransitionDuration,
    debugLabel: debugLabel,
  );

  @override
  Simulation? createSimulation({required bool forward}) {
    final value = controller?.value;
    final velocity = controller?.velocity ?? 0.0;
    return SpringSimulation(
      const SpringThemeData.defaultsExpressive().fastSpatial
          .toSpringDescription(),
      value ?? (forward ? 0.0 : 1.0),
      forward ? 1.0 : 0.0,
      velocity,
      snapToEnd: true,
    );
  }

  Widget _buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Widget child,
  ) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);

    return IgnorePointer(
      ignoring: !animation.isForwardOrCompleted,
      child: Stack(
        fit: .expand,
        children: [
          Positioned.fill(
            child: Surface(
              color: Color.lerp(
                colorTheme.surfaceContainerLow.withValues(alpha: 0.0),
                colorTheme.surfaceContainerLow.withValues(alpha: 1.0),
                clampDouble(animation.value, 0.0, 1.0),
              ),
            ),
          ),
          Positioned.fill(
            child: _SearchViewLayout(
              layoutLink: state._layoutLink,
              animation: animation,
              padding: padding,
              appBarLeading: ColoredBox(
                color: Colors.transparent,
                child: Opacity(
                  opacity: clampDouble(1.0 - animation.value, 0.0, 1.0),
                  child: leading,
                ),
              ),
              appBarTrailing: ColoredBox(
                color: Colors.transparent,
                child: Opacity(
                  opacity: clampDouble(1.0 - animation.value, 0.0, 1.0),
                  child: trailing,
                ),
              ),
              searchBarContainer: SearchBarPaint(
                centerAlignmentFraction: animation.mapValue(
                  (value) => 1.0 - value,
                ),
                containerColor: Color.lerp(
                  colorTheme.surfaceContainerHighest,
                  colorTheme.surfaceContainerHigh,
                  clampDouble(animation.value, 0.0, 1.0),
                ),
                leading: Opacity(
                  opacity: clampDouble(animation.value, 0.0, 1.0),
                  child: Padding(
                    padding: const .symmetric(horizontal: 4.0),
                    child: IconButton(
                      style: LegacyThemeFactory.createIconButtonStyle(
                        colorTheme: colorTheme,
                        elevationTheme: elevationTheme,
                        shapeTheme: shapeTheme,
                        stateTheme: stateTheme,
                        color: .standard,
                      ),
                      onPressed: () => navigator?.pop(),
                      icon: const Icon(
                        MaterialSymbols.chevron_backward_rounded,
                      ),
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const .symmetric(horizontal: 4.0),
                  child: Flex.horizontal(
                    mainAxisSize: .min,
                    children: [
                      // TODO: replace all of this with smart layout calculations
                      //  (it's like this for demo purposes only)
                      Opacity(
                        opacity: clampDouble(animation.value, 0.0, 1.0),
                        child: Align.centerEnd(
                          widthFactor: math.max(animation.value, 0.0),
                          child: IconButton(
                            style: LegacyThemeFactory.createIconButtonStyle(
                              colorTheme: colorTheme,
                              elevationTheme: elevationTheme,
                              shapeTheme: shapeTheme,
                              stateTheme: stateTheme,
                              color: .standard,
                            ),
                            onPressed: () {},
                            icon: const Icon(MaterialSymbols.clear_rounded),
                          ),
                        ),
                      ),
                      IconButton(
                        style: LegacyThemeFactory.createIconButtonStyle(
                          colorTheme: colorTheme,
                          elevationTheme: elevationTheme,
                          shapeTheme: shapeTheme,
                          stateTheme: stateTheme,
                          color: .standard,
                        ),
                        onPressed: () {},
                        icon: const Icon(MaterialSymbols.mic_rounded),
                      ),
                    ],
                  ),
                ),
                supportingText: const Text("Search"),
                // supportingText: ColoredBox(
                //   color: Colors.green,
                //   child: const Text("Search"),
                // ),
              ),
              // searchBarContainer: Surface(
              //   clipBehavior: .antiAlias,
              //   shape: shapeTheme.shapeWithCorner(
              //     corner: shapeTheme.corner.full,
              //   ),
              //   color: Color.lerp(
              //     colorTheme.surfaceContainerHighest,
              //     colorTheme.surfaceContainerHigh,
              //     clampDouble(animation.value, 0.0, 1.0),
              //   ),
              //   child: Flex.horizontal(
              //     children: [
              //       const SizedBox(width: 4.0),
              //       const SizedBox(width: 4.0),
              //       Flexible.tight(
              //         child: TextField(
              //           key: GlobalObjectKey(this),
              //           decoration: const InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "Search",
              //           ),
              //         ),
              //       ),
              //       const SizedBox(width: 4.0),
              //       Opacity(
              //         opacity: clampDouble(animation.value, 0.0, 1.0),
              //         child: IconButton(
              //           style: LegacyThemeFactory.createIconButtonStyle(
              //             colorTheme: colorTheme,
              //             elevationTheme: elevationTheme,
              //             shapeTheme: shapeTheme,
              //             stateTheme: stateTheme,
              //             color: .standard,
              //           ),
              //           onPressed: () {},
              //           icon: const Icon(MaterialSymbols.clear_rounded),
              //         ),
              //       ),
              //       const SizedBox(width: 4.0),
              //     ],
              //   ),
              // ),
              body: Opacity(
                opacity: clampDouble(animation.value, 0.0, 1.0),
                // opacity: 1.0,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => PredictiveBackGestureDetector(
    route: this,
    builder: (context, phase, startBackEvent, currentBackEvent) =>
        _buildTransitions(context, animation, child),
  );

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => builder(context);
}

enum _SearchViewLeaderSlot { appBar, appBarLeading, appBarTrailing, searchBar }

enum _SearchViewLayoutSlot { appBarLeading, searchBar, appBarTrailing, body }

class const _SearchViewLayout({
  required final SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot> layoutLink,
  final ValueListenable<double> animation = kAlwaysCompleteAnimation,
  final EdgeInsets padding = .zero,
  final Widget? appBarLeading,
  required final Widget searchBarContainer,
  final Widget? appBarTrailing,
  required final Widget body,
}) extends
    SlottedMultiChildRenderObjectWidget<_SearchViewLayoutSlot, RenderBox> {
  @override
  _RenderSearchViewLayout createRenderObject(BuildContext context) =>
      .new(layoutLink: layoutLink, animation: animation, padding: padding);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSearchViewLayout renderObject,
  ) {
    renderObject
      ..layoutLink = layoutLink
      ..animation = animation
      ..padding = padding;
  }

  @override
  Iterable<_SearchViewLayoutSlot> get slots => _SearchViewLayoutSlot.values;

  @override
  Widget? childForSlot(_SearchViewLayoutSlot slot) => switch (slot) {
    .appBarLeading => appBarLeading,
    .searchBar => searchBarContainer,
    .appBarTrailing => appBarTrailing,
    .body => body,
  };
}

class _RenderSearchViewLayout({
  var SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>? _layoutLink,
  required var ValueListenable<double> _animation,
  required var EdgeInsets _padding,
}) extends RenderBox
    with SlottedContainerRenderObjectMixin<_SearchViewLayoutSlot, RenderBox> {
  SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>? get layoutLink =>
      _layoutLink;

  set layoutLink(SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>? value) {
    if (_layoutLink == value) return;
    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;
    _layoutLink = value;
    if (_layoutLink case final layoutLink? when attached) {
      final client = LayoutFollowerClient(this);
      _layoutLinkHandle = layoutLink.registerFollower(client);
    }
    markNeedsLayout();
  }

  ValueListenable<double> get animation => _animation;

  set animation(ValueListenable<double> value) {
    if (_animation == value) return;
    if (attached) {
      _animation.removeListener(markNeedsLayout);
      value.addListener(markNeedsLayout);
    }
    _animation = value;
    markNeedsLayout();
  }

  EdgeInsets get padding => _padding;

  set padding(EdgeInsets value) {
    if (_padding == value) return;
    _padding = value;
    markNeedsLayout();
  }

  RenderBox? get _appBarLeading => childForSlot(.appBarLeading);
  RenderBox? get _searchBarContainer => childForSlot(.searchBar);
  RenderBox? get _appBarTrailing => childForSlot(.appBarTrailing);
  RenderBox? get _list => childForSlot(.body);

  FollowerLayoutLinkHandle<
    SlottedLayoutLeaderClient<_SearchViewLeaderSlot>,
    LayoutFollowerClient
  >?
  _layoutLinkHandle;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);

    assert(_layoutLinkHandle == null);
    if (layoutLink case final layoutLink?) {
      final client = LayoutFollowerClient(this);
      _layoutLinkHandle = layoutLink.registerFollower(client);
    }

    animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    super.detach();

    _layoutLinkHandle?.dispose();
    _layoutLinkHandle = null;

    animation.removeListener(markNeedsLayout);
  }

  @override
  void redepthChildren() {
    if (_layoutLinkHandle?.tryRedepthClient() == true) return;
    super.redepthChildren();
  }

  final _matrix = Matrix4.zero();

  Rect? _computeLeaderRect(_SearchViewLeaderSlot slot) =>
      layoutLink?.leaderForSlot(slot)?.tryGetRectIn(this, matrix: _matrix);

  Size _layout(BoxChildLayoutStrategy strategy, BoxConstraints constraints) {
    assert(constraints.isTight);
    final size = constraints.biggest;

    if (strategy.affectsLayoutState) {
      const searchBarPadding = EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      );

      final appBarLeading = _appBarLeading;
      final searchBarContainer = _searchBarContainer;
      final appBarTrailing = _appBarTrailing;

      var beginAppBarRect = _computeLeaderRect(.appBar);
      final endAppBarRect = Rect.fromLTWH(
        padding.left,
        padding.top,
        constraints.constrainWidth(),
        64.0,
      );
      final appBarRect = beginAppBarRect != null
          ? Rect.lerp(beginAppBarRect, endAppBarRect, animation.value)!
          : endAppBarRect;
      beginAppBarRect ??= appBarRect;

      var beginSearchBarRect = _computeLeaderRect(.searchBar);
      final endSearchBarRect = Rect.fromLTWH(
        padding.left + searchBarPadding.left,
        padding.top + searchBarPadding.top,
        constraints.constrainWidth() -
            searchBarPadding.horizontal -
            padding.horizontal,
        56.0,
      );
      final searchBarRect = beginSearchBarRect != null
          ? Rect.lerp(beginSearchBarRect, endSearchBarRect, animation.value)!
          : endSearchBarRect;
      beginSearchBarRect ??= searchBarRect;

      final listSize = Size(
        searchBarRect.width + searchBarPadding.horizontal + padding.horizontal,
        constraints.constrainHeight() -
            searchBarRect.height -
            searchBarPadding.vertical -
            padding.top,
      );

      final listOffset = Offset(
        searchBarRect.left - searchBarPadding.left - padding.left,
        searchBarRect.top + searchBarRect.height + searchBarPadding.bottom,
      );

      searchBarContainer?.layout(
        BoxConstraints.tightFor(
          width: searchBarRect.width,
          height: searchBarRect.height,
        ),
        parentUsesSize: false,
      );
      (searchBarContainer?.parentData as BoxParentData?)?.offset =
          searchBarRect.topLeft;

      _list?.layout(BoxConstraints.tight(listSize), parentUsesSize: false);
      (_list?.parentData as BoxParentData?)?.offset = listOffset;

      final appBarLeadingSize = Size(
        beginSearchBarRect.left - beginAppBarRect.left,
        appBarRect.height,
      );
      final appBarLeadingOffset = Offset(
        searchBarRect.left - appBarLeadingSize.width,
        appBarRect.top,
      );

      appBarLeading?.layout(
        BoxConstraints(
          maxWidth: appBarLeadingSize.width,
          maxHeight: appBarLeadingSize.height,
        ),
        parentUsesSize: false,
      );
      (appBarLeading?.parentData as BoxParentData?)?.offset =
          appBarLeadingOffset;

      if (appBarTrailing != null) {
        final appBarTrailingConstraints = BoxConstraints(
          maxWidth: beginAppBarRect.right - beginSearchBarRect.right,
          maxHeight: appBarRect.height,
        );
        final appBarTrailingSize = strategy.layoutChildForSize(
          appBarTrailing,
          appBarTrailingConstraints,
        );
        // TODO: fix not working with top safe area (e.g. Android)
        final appBarTrailingPosition = Offset(
          searchBarRect.right +
              (beginAppBarRect.right -
                  appBarTrailingSize.width -
                  beginSearchBarRect.right),
          // (appBarRect.height - appBarTrailingSize.height) / 2.0,
          appBarRect.top,
        );
        strategy.positionChild(appBarTrailing, appBarTrailingPosition);
      }
    }

    return size;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _layout(.dry, constraints);

  @override
  bool get sizedByParent => true;

  @override
  void performLayout() {
    _layout(.wet, constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void doPaint(RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    doPaint(_list);
    doPaint(_appBarLeading);
    doPaint(_appBarTrailing);
    doPaint(_searchBarContainer);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    bool hitTestChild(RenderBox? child) {
      if (child == null) return false;
      final childParentData = child.parentData! as BoxParentData;
      return result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (result, transformed) {
          assert(transformed == position - childParentData.offset);
          return child.hitTest(result, position: transformed);
        },
      );
    }

    if (hitTestChild(_searchBarContainer)) return true;
    if (hitTestChild(_list)) return true;
    return false;
  }
}

//     final padding = MediaQuery.paddingOf(context);
//     final colorTheme = ColorTheme.of(context);
//     final elevationTheme = ElevationTheme.of(context);
//     final shapeTheme = ShapeTheme.of(context);
//     final stateTheme = StateTheme.of(context);
//     final typescaleTheme = TypescaleTheme.of(context);
//     final extent = padding.top + _height;
//     return Scaffold(
//       backgroundColor: colorTheme.surfaceContainer,
//       body: SafeArea(
//         top: false,
//         bottom: false,
//         left: false,
//         right: false,
//         child: CustomScrollView(
//           slivers: [
//             SliverHeader(
//               minExtent: extent,
//               maxExtent: extent,
//               builder: (context, shrinkOffset, overlapsContent) =>
//                   _AppBarWithSearch(
//                     height: _height,
//                     leading: _showNavigationIcon
//                         ? Padding(
//                             padding: .symmetric(horizontal: 4.0),
//                             child: Align.center(
//                               child: IconButton(
//                                 style: LegacyThemeFactory.createIconButtonStyle(
//                                   colorTheme: colorTheme,
//                                   elevationTheme: elevationTheme,
//                                   shapeTheme: shapeTheme,
//                                   stateTheme: stateTheme,
//                                   color: .standard,
//                                 ),
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   MaterialSymbols.menu_rounded,
//                                   fill: 0.0,
//                                 ),
//                               ),
//                             ),
//                           )
//                         : const SizedBox(width: 24.0),
//                     trailing: _showActionIcon1 || _showActionIcon2
//                         ? Padding(
//                             padding: .symmetric(horizontal: 4.0),
//                             child: Flex.horizontal(
//                               children: [
//                                 if (_showActionIcon1)
//                                   IconButton(
//                                     style:
//                                         LegacyThemeFactory.createIconButtonStyle(
//                                           colorTheme: colorTheme,
//                                           elevationTheme: elevationTheme,
//                                           shapeTheme: shapeTheme,
//                                           stateTheme: stateTheme,
//                                           color: .standard,
//                                         ),
//                                     onPressed: () {},
//                                     icon: const Icon(
//                                       MaterialSymbols.cast_rounded,
//                                       fill: 0.0,
//                                     ),
//                                   ),
//                                 if (_showActionIcon2)
//                                   IconButton(
//                                     style:
//                                         LegacyThemeFactory.createIconButtonStyle(
//                                           colorTheme: colorTheme,
//                                           elevationTheme: elevationTheme,
//                                           shapeTheme: shapeTheme,
//                                           stateTheme: stateTheme,
//                                           color: .standard,
//                                         ),
//                                     onPressed: () {},
//                                     icon: const Icon(
//                                       MaterialSymbols.more_vert_rounded,
//                                       fill: 0.0,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           )
//                         : const SizedBox(width: 24.0),
//                   ),
//             ),
