import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

import 'src/linked_layouts/linked_layouts.dart';

enum _SearchViewLayoutSlot { appBarLeading, searchBarContainer, appBarTrailing }

class _SearchViewLayout
    extends
        SlottedMultiChildRenderObjectWidget<_SearchViewLayoutSlot, RenderBox> {
  const _SearchViewLayout({
    super.key,
    required this.layoutLink,
    required this.animation,
    this.appBarLeading,
    required this.searchBarContainer,
    this.appBarTrailing,
  });

  final SingleLeaderLayoutLink layoutLink;
  final ValueListenable<double> animation;

  final Widget? appBarLeading;
  final Widget searchBarContainer;
  final Widget? appBarTrailing;

  @override
  _RenderSearchViewLayout createRenderObject(BuildContext context) =>
      _RenderSearchViewLayout(layoutLink: layoutLink, animation: animation);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSearchViewLayout renderObject,
  ) {
    renderObject
      ..layoutLink = layoutLink
      ..animation = animation;
  }

  @override
  Iterable<_SearchViewLayoutSlot> get slots => _SearchViewLayoutSlot.values;

  @override
  Widget? childForSlot(_SearchViewLayoutSlot slot) => switch (slot) {
    .appBarLeading => appBarLeading,
    .searchBarContainer => searchBarContainer,
    .appBarTrailing => appBarTrailing,
  };
}

class _RenderSearchViewLayout extends RenderBox
    with
        SlottedContainerRenderObjectMixin<_SearchViewLayoutSlot, RenderBox>,
        RenderObjectWithLayoutLinkMixin<
          SingleLeaderLayoutLink,
          LayoutFollowerClient
        >,
        RenderLayoutFollowerMixin {
  _RenderSearchViewLayout({
    required SingleLeaderLayoutLink layoutLink,
    required ValueListenable<double> animation,
  }) : _animation = animation {
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

  RenderBox? get appBarLeading => childForSlot(.appBarLeading);
  RenderBox? get searchBarContainer => childForSlot(.searchBarContainer);
  RenderBox? get appBarTrailing => childForSlot(.appBarTrailing);

  @override
  LayoutFollowerClient<_RenderSearchViewLayout> createLayoutClient() =>
      DefaultLayoutFollowerClient(this);

  @override
  Iterable<RenderBox> get children => <RenderBox>[
    ?appBarLeading,
    ?searchBarContainer,
    ?appBarTrailing,
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
    super.performLayout();
    final appBarLeading = this.appBarLeading;
    final searchBarContainer = this.searchBarContainer;
    final appBarTrailing = this.appBarTrailing;

    final leader = layoutLink.leader;

    const padding = EdgeInsets.symmetric(horizontal: 12.0);

    if (leader != null) {
      if (leader.size case final leaderSize?) {
        final leaderScale = leader.scale ?? const Size(1.0, 1.0);
        final scaledWidth = leaderSize.width * leaderScale.width;
        final scaledHeight = leaderSize.height * leaderScale.height;
        searchBarContainer?.layout(
          BoxConstraints.tightFor(
            width: lerpDouble(
              scaledWidth,
              constraints.constrainWidth() - padding.horizontal,
              animation.value,
            ),
            height: lerpDouble(scaledHeight, 56.0, animation.value),
          ),
          parentUsesSize: false,
        );
      }
      final leaderOffset = layoutLink.leaderOffsetIn(leader.renderObject, this);
      if (leaderOffset != null) {
        (searchBarContainer?.parentData as BoxParentData?)?.offset =
            Offset.lerp(
              leaderOffset,
              Offset(padding.left, leaderOffset.dy),
              animation.value,
            )!;
      }
    } else {
      searchBarContainer?.layout(
        const BoxConstraints.tightFor(width: 0.0, height: 0.0),
        parentUsesSize: false,
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void doPaint(RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    doPaint(appBarLeading);
    doPaint(appBarTrailing);
    doPaint(searchBarContainer);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    for (final child in children) {
      final childParentData = child.parentData! as BoxParentData;
      final isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (result, transformed) {
          assert(transformed == position - childParentData.offset);
          return child.hitTest(result, position: transformed);
        },
      );
      if (isHit) return true;
    }
    return false;
  }
}

class _AppBarWithSearch extends StatefulWidget {
  const _AppBarWithSearch({super.key});

  @override
  State<_AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<_AppBarWithSearch> {
  final _link = SingleLeaderLayoutLink();
  var _visible = true;

  Future<void> _openView() async {
    await Navigator.of(context).push(_SearchViewRoute(link: _link));
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    const height = 64.0;
    return SizedBox(
      width: .infinity,
      height: height,
      child: Visibility(
        visible: _visible,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        maintainSemantics: true,
        maintainInteractivity: false,
        maintainFocusability: false,
        child: Flex.horizontal(
          children: [
            Flexible.tight(
              child: LayoutLeader(
                layoutLink: _link,
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
                              style: typescaleTheme.bodyLarge.toTextStyle(
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
          ],
        ),
      ),
    );
  }
}

class Experiment3View extends StatefulWidget {
  const Experiment3View({super.key});

  @override
  State<Experiment3View> createState() => _Experiment3ViewState();
}

class _Experiment3ViewState extends State<Experiment3View>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    const extent = 96.0;
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverHeader(
              minExtent: extent,
              maxExtent: extent,
              builder: (context, shrinkOffset, overlapsContent) => SizedBox(
                height: extent,
                child: Flex.horizontal(
                  mainAxisAlignment: .center,
                  children: [
                    const SizedBox(width: 4.0),
                    IconButton(
                      style: LegacyThemeFactory.createIconButtonStyle(
                        colorTheme: colorTheme,
                        elevationTheme: elevationTheme,
                        shapeTheme: shapeTheme,
                        stateTheme: stateTheme,
                        color: .standard,
                      ),
                      onPressed: () {},
                      icon: const Icon(Symbols.home_rounded, fill: 0.0),
                    ),
                    const SizedBox(width: 4.0),
                    Flexible.tight(child: _AppBarWithSearch()),
                    const SizedBox(width: 4.0),
                    IconButton(
                      style: LegacyThemeFactory.createIconButtonStyle(
                        colorTheme: colorTheme,
                        elevationTheme: elevationTheme,
                        shapeTheme: shapeTheme,
                        stateTheme: stateTheme,
                        color: .standard,
                      ),
                      onPressed: () {},
                      icon: const Icon(Symbols.cast_rounded, fill: 0.0),
                    ),
                    const SizedBox(width: 4.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchViewRoute<T extends Object?> extends PopupRoute<T> {
  _SearchViewRoute({required this.link, this.leading, this.trailing});

  final SingleLeaderLayoutLink link;

  final Widget? leading;
  final Widget? trailing;

  // var _curvedAnimation = CurvedAnimation(
  //   parent: kAlwaysDismissedAnimation,
  //   curve: Curves.linear,
  // );

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  var _externalOffstage = false;
  var _internalOffstage = false;

  void _setOffstageInternally() {
    super.offstage = _externalOffstage || _internalOffstage;
    changedInternalState();
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
  AnimationController createAnimationController() {
    return AnimationController.unbounded(
      vsync: navigator!,
      duration: transitionDuration,
      reverseDuration: reverseTransitionDuration,
      debugLabel: debugLabel,
    );
  }

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

  // @override
  // void dispose() {
  //   _curvedAnimation.dispose();
  //   super.dispose();
  // }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (_curvedAnimation.parent != animation) {
    //   _curvedAnimation = CurvedAnimation(
    //     parent: animation,
    //     curve: Curves.easeInOutCubicEmphasized,
    //     reverseCurve: Curves.easeInOutCubicEmphasized.flipped,
    //   );
    // }
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
              layoutLink: link,
              animation: animation,
              searchBarContainer: Material(
                clipBehavior: .antiAlias,
                shape: CornersBorder.rounded(
                  corners: .all(shapeTheme.corner.full),
                ),
                // shape: CornersBorder.rounded(
                //   corners: Corners.all(
                //     Corner.lerp(
                //       const .fixed(28.0),
                //       .zero,
                //       _curvedAnimation.value,
                //     )!,
                //   ),
                // ),
                color: Color.lerp(
                  colorTheme.surfaceContainerHighest,
                  colorTheme.surfaceContainerHigh,
                  clampDouble(animation.value, 0.0, 1.0),
                ),
                child: Flex.horizontal(
                  children: [
                    const SizedBox(width: 4.0),
                    IconButton(
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
                    const Flexible.space(),
                    IconButton(
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
                    const SizedBox(width: 4.0),
                  ],
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
