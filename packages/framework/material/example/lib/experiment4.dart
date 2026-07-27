import 'dart:async';
import 'dart:math' as math;

import 'package:material_example/flutter.dart';

enum _SearchViewLeaderSlot { searchBar }

class _SearchViewLayout extends SingleChildRenderObjectWidget {
  const _SearchViewLayout({
    super.key,
    required this.layoutLink,
    required this.animation,
    super.child,
  });

  final SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot> layoutLink;
  final ValueListenable<double> animation;

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
}

class _RenderSearchViewLayout extends RenderShiftedBox {
  _RenderSearchViewLayout({
    this._layoutLink,
    required this._animation,
    RenderBox? child,
  }) : super(child);

  SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>? _layoutLink;

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
  }

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

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void performLayout() {
    final leader = layoutLink?.leaderForSlot(.searchBar);
    final leaderRect = leader?.tryGetRectIn(this, matrix: _matrix);
    if (leaderRect != null) {
      final size = Size.lerp(
        leaderRect.size,
        Size(leaderRect.width, constraints.constrainHeight() * 2.0 / 3.0),
        animation.value,
      )!;
      child?.layout(BoxConstraints.tight(size), parentUsesSize: false);

      (child?.parentData as BoxParentData?)?.offset = leaderRect.topLeft;
    } else {
      child?.layout(
        BoxConstraints.tight(constraints.biggest),
        parentUsesSize: false,
      );
    }
  }
}

class Experiment4View extends StatefulWidget {
  const Experiment4View({super.key});

  @override
  State<Experiment4View> createState() => _Experiment4ViewState();
}

class _Experiment4ViewState extends State<Experiment4View>
    with SingleTickerProviderStateMixin {
  final _link = SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot>();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openPopup() async {
    await Navigator.of(context).push(_Route(link: _link));
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      // appBar: AppBar(
      //   backgroundColor: colorTheme.surfaceContainer,
      //   title: const Text('Frame-Perfect Tracking'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPopup,
        child: const Icon(MaterialSymbols.open_in_new_rounded),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final progress = _controller.value;
          final alignX = math.sin(progress * math.pi * 2) * 0.5;
          final alignY = math.cos(progress * math.pi * 2) * 0.5;
          final sizeBonus = math.sin(progress * math.pi * 20).abs() * 100;
          return Align(
            alignment: Alignment(alignX, alignY),
            // alignment: .topLeft,
            child:
                //  CompositedTransformTarget(
                //   link: _layerLink,
                //   child:
                SlottedLayoutLeader<_SearchViewLeaderSlot>(
                  layoutLink: _link,
                  slot: .searchBar,
                  child: SizedBox(
                    width: 100 + sizeBonus,
                    height: 100 + sizeBonus * 0.5,
                    child: Surface(
                      clipBehavior: .antiAlias,
                      shape: shapeTheme.applyCorner(
                        corner: shapeTheme.cornerExtraLarge,
                      ),
                      color: colorTheme.surfaceContainerLowest,
                      child: Align.center(
                        child: Text(
                          "Leader",
                          overflow: .visible,
                          maxLines: 1,
                          softWrap: false,
                          style: typescaleTheme.labelLargeEmphasized
                              .toTextStyle(color: colorTheme.onSurface),
                        ),
                      ),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}

class _Route extends PopupRoute<void> {
  _Route({required this.link});

  final SlottedMultiLeaderLayoutLink<_SearchViewLeaderSlot> link;

  var _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Curves.linear,
  );

  @override
  Color? get barrierColor => Colors.black.withValues(alpha: 0.0);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 800);

  @override
  void dispose() {
    _curvedAnimation.dispose();
    super.dispose();
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (_curvedAnimation.parent != animation) {
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized.flipped,
      );
    }
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Surface.raw(
      child: Stack(
        fit: .expand,
        children: [
          Positioned.fill(
            child: _SearchViewLayout(
              layoutLink: link,
              animation: _curvedAnimation,
              child: IgnorePointer(
                child: Surface(
                  shape: shapeTheme.applyCorners(
                    corners: Corners.all(
                      Corner.lerp(
                        const .fixed(28.0),
                        const .fixed(28.0),
                        _curvedAnimation.value,
                      )!,
                    ),
                  ),
                  color: Color.lerp(
                    colorTheme.surfaceContainerLowest.withValues(alpha: 0.5),
                    colorTheme.surfaceContainerLowest.withValues(alpha: 0.5),
                    _curvedAnimation.value,
                  ),
                  child: Align.center(
                    child: Text(
                      "Follower",
                      style: TextStyle.lerp(
                        typescaleTheme.labelLargeEmphasized.toTextStyle(
                          color: colorTheme.onSurface,
                        ),
                        typescaleTheme.titleLargeEmphasized.toTextStyle(
                          color: colorTheme.onSurface,
                        ),
                        _curvedAnimation.value,
                      ),
                    ),
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
