import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

enum _SearchViewLeaderSlot { appBar, appBarLeading, appBarTrailing, searchBar }

enum _SearchViewLayoutSlot { appBarLeading, searchBar, appBarTrailing, list }

class _SearchViewLayout
    extends
        SlottedMultiChildRenderObjectWidget<_SearchViewLayoutSlot, RenderBox> {
  const _SearchViewLayout({
    super.key,
    required this.layoutLink,
    this.animation = kAlwaysCompleteAnimation,
    this.padding = .zero,
    this.appBarLeading,
    required this.searchBarContainer,
    this.appBarTrailing,
    required this.list,
  });

  final SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot> layoutLink;
  final ValueListenable<double> animation;
  final EdgeInsets padding;

  final Widget? appBarLeading;
  final Widget searchBarContainer;
  final Widget? appBarTrailing;
  final Widget list;

  @override
  _RenderSearchViewLayout createRenderObject(BuildContext context) =>
      _RenderSearchViewLayout(
        layoutLink: layoutLink,
        animation: animation,
        padding: padding,
      );

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
    .list => list,
  };
}

class _RenderSearchViewLayout extends RenderBox
    with
        SlottedContainerRenderObjectMixin<_SearchViewLayoutSlot, RenderBox>,
        RenderObjectWithLayoutLinkMixin<
          LayoutFollowerClient,
          SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>
        >,
        RenderLayoutFollowerMixin<
          LayoutLeaderClient,
          LayoutFollowerClient,
          SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>
        > {
  _RenderSearchViewLayout({
    required SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot> layoutLink,
    required ValueListenable<double> animation,
    required EdgeInsets padding,
  }) : _animation = animation,
       _padding = padding {
    this.layoutLink = layoutLink;
  }

  ValueListenable<double> _animation;

  ValueListenable<double> get animation => _animation;

  set animation(ValueListenable<double> value) {
    if (_animation == value) return;
    if (attached) {
      animation.removeListener(markNeedsLayout);
    }
    _animation = value;
    if (attached) {
      animation.addListener(markNeedsLayout);
    }
    markNeedsLayout();
  }

  EdgeInsets _padding;

  EdgeInsets get padding => _padding;

  set padding(EdgeInsets value) {
    if (_padding == value) return;
    _padding = value;
    markNeedsLayout();
  }

  RenderBox? get appBarLeading => childForSlot(.appBarLeading);
  RenderBox? get searchBarContainer => childForSlot(.searchBar);
  RenderBox? get appBarTrailing => childForSlot(.appBarTrailing);
  RenderBox? get list => childForSlot(.list);

  @override
  LayoutFollowerClient<_RenderSearchViewLayout> createLayoutClientInternal() =>
      DefaultLayoutFollowerClient(this);

  @override
  Iterable<RenderBox> get children => <RenderBox>[
    ?appBarLeading,
    ?searchBarContainer,
    ?appBarTrailing,
    ?list,
  ];

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    super.detach();
    animation.removeListener(markNeedsLayout);
  }

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void performLayout() {
    final appBarLeading = this.appBarLeading;
    final searchBarContainer = this.searchBarContainer;
    final appBarTrailing = this.appBarTrailing;

    final appBarLeader = layoutLink.leaderForSlot(.appBar);
    final searchBarLeader = layoutLink.leaderForSlot(.searchBar);

    const searchBarPadding = EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 4.0,
    );

    // The following algorithm demonstrates how fallback logic could be handled.
    // The example below shows that end values could be modified based on
    // begin values if those were provided (see endSize and endOffset).

    // Size? beginSearchBarSize;
    // var endSearchBarSize = Size(
    //   constraints.constrainWidth() - searchBarPadding.horizontal,
    //   56.0,
    // );

    // Offset? beginSearchBarOffset;
    // var endSearchBarOffset = Offset(
    //   searchBarPadding.left,
    //   searchBarPadding.top,
    // );

    // if (leader != null) {
    //   if (leader.size case final leaderSize?) {
    //     final leaderScale = leader.scale ?? const Size(1.0, 1.0);
    //     beginSearchBarSize = Size(
    //       leaderSize.width * leaderScale.width,
    //       leaderSize.height * leaderScale.height,
    //     );
    //     endSearchBarSize = Size(
    //       endSearchBarSize.width,
    //       beginSearchBarSize.height,
    //     );
    //   }
    //   final leaderOffset = LayoutLink.getOffsetIn(leader.renderObject, this);
    //   if (leaderOffset != null) {
    //     beginSearchBarOffset = leaderOffset;
    //     endSearchBarOffset = Offset(
    //       endSearchBarOffset.dx,
    //       beginSearchBarOffset.dy,
    //     );
    //   }
    // }

    Size? beginSearchBarSize;
    final endSearchBarSize = Size(
      constraints.constrainWidth() -
          searchBarPadding.horizontal -
          padding.horizontal,
      56.0,
    );

    Offset? beginSearchBarOffset;
    final endSearchBarOffset = Offset(
      padding.left + searchBarPadding.left,
      padding.top + searchBarPadding.top,
    );

    if (searchBarLeader != null) {
      if (searchBarLeader.size case final searchBarSize?) {
        final searchBarScale = searchBarLeader.scale ?? const Size(1.0, 1.0);
        beginSearchBarSize = Size(
          searchBarSize.width * searchBarScale.width,
          searchBarSize.height * searchBarScale.height,
        );
      }
      final leaderOffset = LayoutLink.getOffsetIn(
        searchBarLeader.renderObject,
        this,
      );
      if (leaderOffset != null) {
        beginSearchBarOffset = leaderOffset;
      }
    }

    final searchBarSize = beginSearchBarSize != null
        ? Size.lerp(beginSearchBarSize, endSearchBarSize, animation.value)!
        : endSearchBarSize;
    beginSearchBarSize ??= searchBarSize;

    final searchBarOffset = beginSearchBarOffset != null
        ? Offset.lerp(
            beginSearchBarOffset,
            endSearchBarOffset,
            animation.value,
          )!
        : endSearchBarOffset;
    beginSearchBarOffset ??= searchBarOffset;

    // APP BAR

    Size? beginAppBarSize;
    final endAppBarSize = Size(constraints.constrainWidth(), 64.0);

    Offset? beginAppBarOffset;
    final endAppBarOffset = Offset(padding.left, padding.top);

    if (appBarLeader != null) {
      if (appBarLeader.size case final appBarSize?) {
        final appBarScale = appBarLeader.scale ?? const Size(1.0, 1.0);
        beginAppBarSize = Size(
          appBarSize.width * appBarScale.width,
          appBarSize.height * appBarScale.height,
        );
      }
      final appBarOffset = LayoutLink.getOffsetIn(
        appBarLeader.renderObject,
        this,
      );
      if (appBarOffset != null) {
        beginAppBarOffset = appBarOffset;
      }
    }

    final appBarSize = beginAppBarSize != null
        ? Size.lerp(beginAppBarSize, endAppBarSize, animation.value)!
        : endAppBarSize;
    beginAppBarSize ??= appBarSize;

    final appBarOffset = beginAppBarOffset != null
        ? Offset.lerp(beginAppBarOffset, endAppBarOffset, animation.value)!
        : endAppBarOffset;
    beginAppBarOffset ??= appBarOffset;

    final listSize = Size(
      searchBarSize.width + searchBarPadding.horizontal + padding.horizontal,
      constraints.constrainHeight() -
          searchBarSize.height -
          searchBarPadding.vertical -
          padding.top,
    );

    final listOffset = Offset(
      searchBarOffset.dx - searchBarPadding.left - padding.left,
      searchBarOffset.dy + searchBarSize.height + searchBarPadding.bottom,
    );

    searchBarContainer?.layout(
      BoxConstraints.tight(searchBarSize),
      parentUsesSize: false,
    );
    (searchBarContainer?.parentData as BoxParentData?)?.offset =
        searchBarOffset;

    list?.layout(BoxConstraints.tight(listSize), parentUsesSize: false);
    (list?.parentData as BoxParentData?)?.offset = listOffset;

    final appBarLeadingSize = Size(
      beginSearchBarOffset.dx - beginAppBarOffset.dx,
      appBarSize.height,
    );
    final appBarLeadingOffset = Offset(
      searchBarOffset.dx - appBarLeadingSize.width,
      appBarOffset.dy,
    );

    appBarLeading?.layout(
      BoxConstraints.tight(appBarLeadingSize),
      parentUsesSize: false,
    );
    (appBarLeading?.parentData as BoxParentData?)?.offset = appBarLeadingOffset;

    final appBarTrailingSize = Size(
      (beginAppBarOffset.dx + beginAppBarSize.width) -
          (beginSearchBarOffset.dx + beginSearchBarSize.width),
      appBarSize.height,
    );
    final appBarTrailingOffset = Offset(
      searchBarOffset.dx + searchBarSize.width,
      appBarOffset.dy,
    );

    appBarTrailing?.layout(
      BoxConstraints.tight(appBarTrailingSize),
      parentUsesSize: false,
    );
    (appBarTrailing?.parentData as BoxParentData?)?.offset =
        appBarTrailingOffset;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void doPaint(RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    doPaint(list);
    doPaint(appBarLeading);
    doPaint(appBarTrailing);
    doPaint(searchBarContainer);
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

    if (hitTestChild(searchBarContainer)) return true;
    if (hitTestChild(list)) return true;
    return false;
  }
}

class _AppBarWithSearch extends StatefulWidget {
  const _AppBarWithSearch({
    super.key,
    this.height,
    this.leading,
    this.trailing,
  });

  final double? height;
  final Widget? leading;
  final Widget? trailing;

  @override
  State<_AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<_AppBarWithSearch> {
  final _layoutLink = SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>();
  _AppBarSearchViewRoute? _route;

  Future<void> _openView() async {
    if (_route != null) return;
    final route = _AppBarSearchViewRoute(
      state: this,
      leading: widget.leading,
      trailing: widget.trailing,
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
    final typescaleTheme = TypescaleTheme.of(context);
    final height = widget.height ?? 64.0;

    final route = _route;

    final visible =
        route == null ||
        route.offstage ||
        route.animation?.status == .dismissed;

    // debugPrint(
    //   "offstage: ${route?.offstage} / status: ${route?.animation?.status.name}",
    // );

    return Material(
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
              child: Flex.horizontal(
                crossAxisAlignment: .stretch,
                children: [
                  if (widget.leading case final leading?)
                    SlottedLayoutLeader<_SearchViewLeaderSlot>(
                      layoutLink: _layoutLink,
                      slot: .appBarLeading,
                      child: leading,
                    ),
                  Flexible.tight(
                    child: Align.center(
                      widthFactor: 1.0,
                      child: SlottedLayoutLeader<_SearchViewLeaderSlot>(
                        layoutLink: _layoutLink,
                        slot: .searchBar,
                        child: SizedBox(
                          height: 56.0,
                          child: Material(
                            clipBehavior: .antiAlias,
                            shape: CornersBorder.rounded(
                              corners: .all(shapeTheme.corner.full),
                            ),
                            color: colorTheme.surfaceContainerHighest,
                            child: InkWell(
                              overlayColor: WidgetStateLayerColor(
                                color: .all(colorTheme.onSurfaceVariant),
                                opacity: stateTheme.asWidgetStateLayerOpacity,
                              ),
                              onTap: _openView,
                              child: Flex.horizontal(
                                children: [
                                  Flexible.tight(
                                    child: Text(
                                      "Search",
                                      textAlign: .center,
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: .ellipsis,
                                      style: typescaleTheme.bodyLarge
                                          .toTextStyle(
                                            color: colorTheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.trailing case final trailing?)
                    SlottedLayoutLeader<_SearchViewLeaderSlot>(
                      layoutLink: _layoutLink,
                      slot: .appBarTrailing,
                      child: trailing,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarSearchViewRoute<T extends Object?> extends PopupRoute<T> {
  _AppBarSearchViewRoute({required this.state, this.leading, this.trailing});

  final _AppBarWithSearchState state;
  final Widget? leading;
  final Widget? trailing;

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
  AnimationController createAnimationController() =>
      AnimationController.unbounded(
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
      // const SpringThemeData.expressive().fastSpatial.toSpringDescription(),
      SpringDescription.withDampingRatio(
        mass: 1.0,
        stiffness: 800.0,
        ratio: 0.5,
      ),
      value ?? (forward ? 0.0 : 1.0),
      forward ? 1.0 : 0.0,
      velocity,
      snapToEnd: true,
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return AbsorbPointer(
      absorbing: !animation.isForwardOrCompleted,
      child: Stack(
        fit: .expand,
        children: [
          Positioned.fill(
            child: Material(
              clipBehavior: .none,
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
              appBarLeading: Opacity(
                opacity: clampDouble(1.0 - animation.value, 0.0, 1.0),
                child: leading,
              ),
              appBarTrailing: Opacity(
                opacity: clampDouble(1.0 - animation.value, 0.0, 1.0),
                child: trailing,
              ),
              searchBarContainer: Material(
                clipBehavior: .antiAlias,
                shape: CornersBorder.rounded(
                  corners: .all(shapeTheme.corner.full),
                ),
                color: Color.lerp(
                  colorTheme.surfaceContainerHighest,
                  colorTheme.surfaceContainerHigh,
                  clampDouble(animation.value, 0.0, 1.0),
                ),
                child: Flex.horizontal(
                  children: [
                    const SizedBox(width: 4.0),
                    Opacity(
                      opacity: clampDouble(animation.value, 0.0, 1.0),
                      child: IconButton(
                        style: LegacyThemeFactory.createIconButtonStyle(
                          colorTheme: colorTheme,
                          elevationTheme: elevationTheme,
                          shapeTheme: shapeTheme,
                          stateTheme: stateTheme,
                          color: .standard,
                        ),
                        onPressed: () => navigator?.pop(),
                        icon: const Icon(Symbols.chevron_backward_rounded),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Flexible.tight(
                      child: TextField(
                        key: GlobalObjectKey(this),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Opacity(
                      opacity: clampDouble(animation.value, 0.0, 1.0),
                      child: IconButton(
                        style: LegacyThemeFactory.createIconButtonStyle(
                          colorTheme: colorTheme,
                          elevationTheme: elevationTheme,
                          shapeTheme: shapeTheme,
                          stateTheme: stateTheme,
                          color: .standard,
                        ),
                        onPressed: () {},
                        icon: const Icon(Symbols.clear_rounded),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                  ],
                ),
              ),
              list: Opacity(
                opacity: clampDouble(animation.value, 0.0, 1.0),
                // opacity: 1.0,
                child: Padding(
                  padding: .fromLTRB(padding.left, 0.0, padding.right, 0.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: .symmetric(horizontal: 8.0),
                        sliver: SliverList.separated(
                          itemCount: 25,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 2.0),
                          itemBuilder: (context, index) => ListItemContainer(
                            isFirst: index == 0,
                            isLast: index == 25 - 1,
                            containerColor: .all(Colors.transparent),
                            child: ListItemInteraction(
                              onTap: () => navigator?.pop(),
                              child: ListItemLayout(
                                leading: SizedBox.square(
                                  dimension: 32.0,
                                  child: Material(
                                    color: colorTheme.surfaceContainerHigh,
                                    shape: CornersBorder.rounded(
                                      corners: .all(shapeTheme.corner.full),
                                    ),
                                    child: const Icon(
                                      Symbols.search_rounded,
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
                      SliverToBoxAdapter(
                        child: SizedBox(height: 8.0 + padding.bottom),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return const SizedBox.shrink();
  }
}

class Experiment3View extends StatefulWidget {
  const Experiment3View({super.key});

  @override
  State<Experiment3View> createState() => _Experiment3ViewState();
}

class _Experiment3ViewState extends State<Experiment3View>
    with SingleTickerProviderStateMixin {
  var _heightSlider = 64.0;
  var _height = 64.0;

  var _showNavigationIcon = true;
  var _showActionIcon1 = true;
  var _showActionIcon2 = false;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    final extent = padding.top + _height;
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: CustomScrollView(
          slivers: [
            SliverHeader(
              minExtent: extent,
              maxExtent: extent,
              builder: (context, shrinkOffset, overlapsContent) =>
                  _AppBarWithSearch(
                    height: _height,
                    leading: _showNavigationIcon
                        ? Padding(
                            padding: .symmetric(horizontal: 4.0),
                            child: Align.center(
                              child: IconButton(
                                style: LegacyThemeFactory.createIconButtonStyle(
                                  colorTheme: colorTheme,
                                  elevationTheme: elevationTheme,
                                  shapeTheme: shapeTheme,
                                  stateTheme: stateTheme,
                                  color: .standard,
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Symbols.menu_rounded,
                                  fill: 0.0,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(width: 24.0),
                    trailing: _showActionIcon1 || _showActionIcon2
                        ? Padding(
                            padding: .symmetric(horizontal: 4.0),
                            child: Flex.horizontal(
                              children: [
                                if (_showActionIcon1)
                                  IconButton(
                                    style:
                                        LegacyThemeFactory.createIconButtonStyle(
                                          colorTheme: colorTheme,
                                          elevationTheme: elevationTheme,
                                          shapeTheme: shapeTheme,
                                          stateTheme: stateTheme,
                                          color: .standard,
                                        ),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Symbols.cast_rounded,
                                      fill: 0.0,
                                    ),
                                  ),
                                if (_showActionIcon2)
                                  IconButton(
                                    style:
                                        LegacyThemeFactory.createIconButtonStyle(
                                          colorTheme: colorTheme,
                                          elevationTheme: elevationTheme,
                                          shapeTheme: shapeTheme,
                                          stateTheme: stateTheme,
                                          color: .standard,
                                        ),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Symbols.more_vert_rounded,
                                      fill: 0.0,
                                    ),
                                  ),
                              ],
                            ),
                          )
                        : const SizedBox(width: 24.0),
                  ),
            ),
            SliverPadding(
              padding: const .symmetric(horizontal: 8.0),
              sliver: SliverList.list(
                children: [
                  SizedBox(
                    height: math.max(16.0 - (_height - 56.0) / 2.0, 0.0),
                  ),
                  ListItemContainer(
                    isFirst: true,
                    child: Flex.vertical(
                      children: [
                        ListItemLayout(
                          leading: const Icon(Symbols.height_rounded),
                          headline: const Text("App bar height"),
                          supportingText: const Text(
                            "Height will change after dragging is stopped.",
                          ),
                          trailing: Text(
                            "${_heightSlider.round()}dp",
                            textAlign: .end,
                            style: const TextStyle(
                              fontFamily: "Monaspace Argon",
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Slider(
                          padding: const .symmetric(horizontal: 16.0),
                          divisions: ((136 - 64) / 8.0).toInt(),
                          min: 64.0,
                          max: 136.0,
                          value: _heightSlider,
                          onChanged: (value) =>
                              setState(() => _heightSlider = value),
                          onChangeEnd: (value) =>
                              setState(() => _height = _heightSlider = value),
                        ),
                        const SizedBox(height: 14.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () => setState(
                        () => _showNavigationIcon = !_showNavigationIcon,
                      ),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(Symbols.menu_rounded),
                        headline: const Text("Show navigation icon"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showNavigationIcon,
                            onCheckedChanged: (value) =>
                                setState(() => _showNavigationIcon = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () =>
                          setState(() => _showActionIcon1 = !_showActionIcon1),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(Symbols.star_rounded),
                        headline: const Text("Show action icon 1"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showActionIcon1,
                            onCheckedChanged: (value) =>
                                setState(() => _showActionIcon1 = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () =>
                          setState(() => _showActionIcon2 = !_showActionIcon2),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(Symbols.more_horiz_rounded),
                        headline: const Text("Show action icon 2"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showActionIcon2,
                            onCheckedChanged: (value) =>
                                setState(() => _showActionIcon2 = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    isLast: true,
                    child: ListItemLayout(
                      trailingPadding: const .symmetric(
                        vertical: 10.0 - (48.0 - 40.0) / 2.0,
                      ),
                      leading: const Icon(Symbols.restart_alt_rounded),
                      headline: const Text("Reset all properties"),
                      supportingText: const Text(
                        "Set all values to their respective defaults.",
                      ),
                      trailing: FilledButton(
                        style: LegacyThemeFactory.createButtonStyle(
                          colorTheme: colorTheme,
                          elevationTheme: elevationTheme,
                          shapeTheme: shapeTheme,
                          stateTheme: stateTheme,
                          typescaleTheme: typescaleTheme,
                          color: .tonal,
                        ),
                        onPressed: () {
                          setState(() {
                            _heightSlider = _height = 64.0;
                            _showNavigationIcon = true;
                            _showActionIcon1 = true;
                            _showActionIcon2 = false;
                          });
                        },
                        child: const Text("Reset"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
