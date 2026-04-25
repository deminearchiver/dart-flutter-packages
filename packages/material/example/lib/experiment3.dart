import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

class SingleLayoutLink {
  RenderLayoutLeader? _leader;
  RenderLayoutFollowerMixin? _follower;

  Size _leaderSize = Size.zero;

  Size? get leaderSize {
    final leader = _leader;
    return leader != null && leader.attached ? _leaderSize : null;
  }

  Matrix4? leaderGlobalTransform(RenderObject leader) =>
      leader.attached ? _safeGlobalTransform(leader) : null;

  Offset? leaderOffsetIn(RenderObject leader, RenderObject coordinateSpace) {
    if (!leader.attached || !coordinateSpace.attached) return null;
    final leaderGlobal = _safeGlobalTransform(leader);
    final transform = _safeGlobalTransform(coordinateSpace);
    if (leaderGlobal == null || transform == null) return null;
    final determinant = transform.invert();
    if (determinant == 0.0) return null;
    return MatrixUtils.transformPoint(transform..multiply(leaderGlobal), .zero);
  }

  Size? get leaderScale {
    final leader = _leader;
    if (leader == null || !leader.attached) return null;
    final transform = leaderGlobalTransform(leader);
    if (transform == null) return null;
    // TODO: replace with a perspective transform in-place
    final matrix = transform.storage;
    return Size(matrix[0], matrix[5]);
    // return Size(
    //   transform.transform3(.new(1, 0, 0)).x - transform.transform3(.zero()).x,
    //   transform.transform3(.new(0, 1, 0)).y - transform.transform3(.zero()).y,
    // );
  }

  static Matrix4? _safeGlobalTransform(RenderObject descendant) {
    if (!descendant.attached) return null;
    final objects = <RenderObject>[
      for (
        RenderObject? object = descendant;
        object != null;
        object = object.parent
      )
        object,
    ];
    final transform = Matrix4.identity();
    for (var index = objects.length - 1; index > 0; index -= 1) {
      final parent = objects[index];
      final child = objects[index - 1];
      try {
        parent.applyPaintTransform(child, transform);
      } on Object {
        final childParentData = child.parentData;
        if (childParentData is BoxParentData) {
          final offset = childParentData.offset;
          transform.translateByDouble(offset.dx, offset.dy, 0.0, 1.0);
        }
      }
    }
    return transform;
  }
}

mixin RenderLayoutLeaderMixin on RenderProxyBox {}

class LayoutLeader extends SingleChildRenderObjectWidget {
  const LayoutLeader({super.key, required this.link, super.child});

  final SingleLayoutLink link;

  @override
  RenderLayoutLeader createRenderObject(BuildContext context) =>
      RenderLayoutLeader(link: link);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLayoutLeader renderObject,
  ) {
    renderObject.link = link;
  }
}

class RenderLayoutLeader extends RenderProxyBox with RenderLayoutLeaderMixin {
  RenderLayoutLeader({required SingleLayoutLink link, RenderBox? child})
    : _link = link,
      super(child);

  SingleLayoutLink _link;

  SingleLayoutLink get link => _link;

  set link(SingleLayoutLink value) {
    if (_link == value) return;
    _link._leader = null;
    _link = value;
    _link._leader = this;
    markNeedsLayout();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    link._leader = this;
  }

  @override
  void detach() {
    super.detach();
    link._leader = null;
  }

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    final follower = link._follower;
    if (follower != null && follower.attached) {
      follower.markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    super.performLayout();
    link._leaderSize = size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final follower = link._follower;
    if (follower != null && follower.attached) {
      follower._onLeaderPainted();
    }
  }
}

class LayoutFollower extends SingleChildRenderObjectWidget {
  const LayoutFollower({super.key, required this.link, super.child});

  final SingleLayoutLink link;

  @override
  RenderLayoutFollower createRenderObject(BuildContext context) =>
      RenderLayoutFollower(link: link);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLayoutFollower renderObject,
  ) {
    renderObject.link = link;
  }
}

mixin RenderLayoutFollowerMixin on RenderObject {
  SingleLayoutLink? _link;

  SingleLayoutLink get link => _link!;

  set link(SingleLayoutLink value) {
    if (_link == value) return;
    if (attached && _link != null) {
      link._follower = null;
    }
    _link = value;
    if (attached) {
      link._follower = this;
      _frameCallbackScheduler.schedule();
    }
    markNeedsLayout();
  }

  late final _frameCallbackScheduler = FrameCallbackScheduler(_frameCallback);

  Matrix4? _lastLeaderTransform;
  Size? _lastLeaderSize;
  bool _isSchedulingPostFrameLayout = false;

  void _frameCallback(Duration _) {
    assert(!debugDisposed!);
    final leader = link._leader;
    if (leader != null && leader.attached) {
      final currentTransform = link.leaderGlobalTransform(leader);
      final currentSize = link.leaderSize;
      if (currentTransform != _lastLeaderTransform ||
          currentSize != _lastLeaderSize) {
        _lastLeaderTransform = currentTransform;
        _lastLeaderSize = currentSize;
        markNeedsLayout();
      }
    }
    _frameCallbackScheduler.schedule();
  }

  void _onLeaderPainted() {
    final leader = link._leader;
    if (leader != null && leader.attached) {
      final currentTransform = link.leaderGlobalTransform(leader);
      if (currentTransform != _lastLeaderTransform) {
        _lastLeaderTransform = currentTransform;
        if (!_isSchedulingPostFrameLayout) {
          _isSchedulingPostFrameLayout = true;
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _isSchedulingPostFrameLayout = false;
            if (attached) markNeedsLayout();
          });
        }
      }
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    link._follower = this;
    _frameCallbackScheduler.schedule();
  }

  @override
  void detach() {
    super.detach();
    link._follower = null;
    _frameCallbackScheduler.cancel();
  }

  @override
  void redepthChildren() {
    final leader = link._leader;
    if (leader != null && leader.attached && depth <= leader.depth) {
      leader.redepthChild(this);
      // Return because leader calls this function recursively.
      return;
    }
    super.redepthChildren();
  }

  @mustCallSuper
  @override
  void performLayout() {
    _frameCallbackScheduler.schedule();
    final leader = link._leader;
    if (leader != null && leader.attached) {
      _lastLeaderTransform = link.leaderGlobalTransform(leader);
      _lastLeaderSize = link.leaderSize;
    }
  }
}

class RenderLayoutFollower extends RenderShiftedBox
    with RenderLayoutFollowerMixin {
  RenderLayoutFollower({required SingleLayoutLink link, RenderBox? child})
    : super(child) {
    this.link = link;
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
    final leaderSize = link.leaderSize;
    final leaderOffset = link._leader != null
        ? link.leaderOffsetIn(link._leader!, this)
        : null;
    final leaderScale = link.leaderScale;
    if (leaderSize != null && leaderOffset != null && leaderScale != null) {
      final scaledWidth = leaderSize.width * leaderScale.width;
      final scaledHeight = leaderSize.height * leaderScale.height;
      child?.layout(
        BoxConstraints.tightFor(width: scaledWidth, height: scaledHeight),
        parentUsesSize: false,
      );
      (child?.parentData as BoxParentData?)?.offset = leaderOffset;
    } else {
      child?.layout(
        const BoxConstraints.tightFor(width: 0.0, height: 0.0),
        parentUsesSize: false,
      );
    }
  }
}

enum _SearchViewLayoutSlot { appBarLeading, searchBarContainer, appBarTrailing }

class _SearchViewLayout
    extends
        SlottedMultiChildRenderObjectWidget<_SearchViewLayoutSlot, RenderBox> {
  const _SearchViewLayout({
    super.key,
    required this.link,
    required this.animation,
    this.appBarLeading,
    required this.searchBarContainer,
    this.appBarTrailing,
  });

  final SingleLayoutLink link;
  final ValueListenable<double> animation;

  final Widget? appBarLeading;
  final Widget searchBarContainer;
  final Widget? appBarTrailing;

  @override
  _RenderSearchViewLayout createRenderObject(BuildContext context) =>
      _RenderSearchViewLayout(link: link, animation: animation);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSearchViewLayout renderObject,
  ) {
    renderObject.link = link;
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
        RenderLayoutFollowerMixin {
  _RenderSearchViewLayout({
    required SingleLayoutLink link,
    required ValueListenable<double> animation,
  }) : _animation = animation {
    this.link = link;
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

    final leaderSize = link.leaderSize;
    final leaderOffset = link._leader != null
        ? link.leaderOffsetIn(link._leader!, this)
        : null;
    final leaderScale = link.leaderScale ?? const Size(1.0, 1.0);

    const padding = EdgeInsets.symmetric(horizontal: 12.0);

    if (leaderSize != null && leaderOffset != null) {
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
      (searchBarContainer?.parentData as BoxParentData?)?.offset = Offset.lerp(
        leaderOffset,
        Offset(padding.left, leaderOffset.dy),
        animation.value,
      )!;
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
  final _link = SingleLayoutLink();
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
                link: _link,
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

  final SingleLayoutLink link;

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
              link: link,
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
