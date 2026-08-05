import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

class Experiment9View extends StatefulWidget {
  const Experiment9View({super.key});

  @override
  State<Experiment9View> createState() => _Experiment9ViewState();
}

class _Experiment9ViewState extends State<Experiment9View> {
  @override
  Widget build(BuildContext context) {
    return DockedSearchViewExample(gap: 2.0);
    // Unreachable.
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final springTheme = SpringTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: ColoredBox(
        color: colorTheme.scrim.withValues(alpha: 0.32),
        child: Align.center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 412.0,
              maxWidth: 412.0,
              minHeight: 0.0,
              maxHeight: MediaQuery.heightOf(context) / 2.0 * 3.0,
            ),
            child: Flex.vertical(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              children: [CustomScrollView(shrinkWrap: true, slivers: [])],
            ),
          ),
        ),
      ),
    );
  }
}

class DockedSearchViewExample extends StatefulWidget {
  const DockedSearchViewExample({super.key, required this.gap});

  final double gap;

  @override
  State<DockedSearchViewExample> createState() =>
      _DockedSearchViewExampleState();
}

class _DockedSearchViewExampleState extends State<DockedSearchViewExample> {
  var _selectedIndex = 0;

  Widget _buildSliverVersion(BuildContext context) {
    return CustomScrollView(
      clipBehavior: .none,
      shrinkWrap: true,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SearchBarDelegate(padding: .only(bottom: widget.gap)),
        ),
        ..._buildBodySegments(context),
      ],
    );
  }

  Widget _buildFixedVersion(BuildContext context) {
    final shapeTheme = ShapeTheme.of(context);
    return Flex.vertical(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _SearchBarWidget(),
        SizedBox(height: widget.gap),
        Flexible.loose(
          child: Surface.ink(
            // TODO: ideally it should work like this?
            // TODO: track active edge corner dynamically?
            // TODO: this doesn't work because corner needs to collapse
            // TODO: this could prevent overscroll stretching out of bounds
            // clipBehavior: .antiAlias,
            // shape: shapeTheme.applyCorner(corner: shapeTheme.cornerMedium),
            child: CustomScrollView(
              clipBehavior: .none,
              shrinkWrap: true,
              slivers: _buildBodySegments(context),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildBodySegments(BuildContext context) {
    return [
      _buildSegment(
        context,
        title: "Recent",
        icon: MaterialSymbols.history,
        itemCount: 4,
      ),
      SliverToBoxAdapter(child: SizedBox(height: widget.gap)),
      _buildSegment(
        context,
        title: "Suggestions",
        icon: MaterialSymbols.search,
        itemCount: 15,
      ),
      SliverToBoxAdapter(child: SizedBox(height: widget.gap)),
      _buildSegment(
        context,
        title: "Contacts",
        icon: MaterialSymbols.person_outline,
        itemCount: 8,
      ),
    ];
  }

  Widget _buildSegment(
    BuildContext context, {
    required String title,
    required IconData icon,
    required int itemCount,
  }) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return NestedSliverBuilder(
      builder: (context, child) => Surface.material(
        clipBehavior: .antiAlias,
        shape: shapeTheme.applyCorner(corner: shapeTheme.cornerMedium),
        // shape: RoundedPolygonBorder(
        //   side: BorderSide(
        //     width: 10.0,
        //     color: colorTheme.primary,
        //     strokeAlign: -1,
        //   ),
        //   strokeCap: .round,
        //   strokeJoin: .round,
        //   polygon: MaterialShapes.circle,
        //   squash: 1,
        // ),
        backgroundDecorations: [.fillColor(colorTheme.surfaceContainerHigh)],
        child: child,
      ),

      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Text(
                title,
                style: typescaleTheme.labelLarge.toTextStyle(
                  color: colorTheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              // (context, index) => ListItemContainer(
              //   containerColor: .all(Colors.transparent),
              //   containerShape: .all(
              //     shapeTheme.applyCorner(corner: shapeTheme.cornerNone),
              //   ),
              //   child: ListItemInteraction(
              //     onTap: () {},
              //     child: ListItemLayout(
              //       leading: Icon(icon),
              //       headline: Text("Item ${index + 1} in $title"),
              //     ),
              //   ),
              // ),
              (context, index) => ListItemInteraction(
                onTap: () {},
                child: ListItemLayout(
                  leading: Icon(icon),
                  headline: Text("Item ${index + 1} in $title"),
                ),
              ),
              childCount: itemCount,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewHeight = size.height * 2.0 / 3.0;

    final colorTheme = ColorTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(MaterialSymbols.splitscreen),
            label: "Sliver Header",
          ),
          NavigationDestination(
            icon: Icon(MaterialSymbols.view_day),
            label: "Fixed Header",
          ),
        ],
      ),
      body: ColoredBox(
        color: colorTheme.scrim.withValues(alpha: 0.32),
        child: SafeArea(
          child: Align.center(
            child: Padding(
              padding: .symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 412.0,
                  maxHeight: viewHeight,
                ),
                child: _selectedIndex == 0
                    ? _buildSliverVersion(context)
                    : _buildFixedVersion(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBarWidget extends StatelessWidget {
  const _SearchBarWidget();

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    return SizedBox(
      width: .infinity,
      height: 56.0,
      child: Surface.material(
        clipBehavior: .antiAlias,
        shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
        backgroundDecorations: [.fillColor(colorTheme.surfaceContainerHigh)],
        child: Flex.horizontal(
          children: [
            Padding(
              padding: const .symmetric(horizontal: 4.0),
              child: IconButton(
                style: LegacyThemeFactory.createIconButtonStyle(
                  colorTheme: colorTheme,
                  elevationTheme: elevationTheme,
                  shapeTheme: shapeTheme,
                  stateTheme: stateTheme,
                  color: .standard,
                ),
                icon: const Icon(MaterialSymbols.chevron_left),
                onPressed: () {},
              ),
            ),
            const Flexible.tight(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  isDense: true,
                ),
              ),
            ),
            Padding(
              padding: const .symmetric(horizontal: 4.0),
              child: IconButton(
                style: LegacyThemeFactory.createIconButtonStyle(
                  colorTheme: colorTheme,
                  elevationTheme: elevationTheme,
                  shapeTheme: shapeTheme,
                  stateTheme: stateTheme,
                  color: .standard,
                ),
                icon: const Icon(MaterialSymbols.clear_rounded),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  const _SearchBarDelegate({this.padding = .zero});

  final EdgeInsetsGeometry padding;

  @override
  double get minExtent => 56.0 + padding.vertical;

  @override
  double get maxExtent => 56.0 + padding.vertical;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => Padding(padding: padding, child: const _SearchBarWidget());

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) =>
      padding != oldDelegate.padding;
}

typedef NestedSliverWrapperBuilder =
    Widget Function(BuildContext context, Widget child);

class NestedSliverBuilder extends StatefulWidget {
  const NestedSliverBuilder({
    super.key,
    required this.builder,
    required this.sliver,
  });

  final NestedSliverWrapperBuilder builder;

  final Widget sliver;

  @override
  State<NestedSliverBuilder> createState() => _NestedSliverBuilderState();
}

class _NestedSliverBuilderState extends State<NestedSliverBuilder> {
  final _link = _NestedSliverLink();

  @override
  void dispose() {
    _link._frameCallbackScheduler.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inner = _NestedSliverInner(link: _link, sliver: widget.sliver);
    return _NestedSliverOuter(
      link: _link,
      child: Builder(builder: (context) => widget.builder(context, inner)),
    );
  }
}

class _NestedSliverLink {
  _RenderNestedSliverOuter? _outer;
  SliverConstraints? _outerConstraints;
  SliverConstraints? _lastOuterConstraints;

  _RenderNestedSliverInner? _inner;
  SliverGeometry _innerGeometry = .zero;
  Size _innerSize = .zero;

  late final _frameCallbackScheduler = FrameCallbackScheduler(_frameCallback);

  var _isSchedulingPostFrameLayout = false;

  void _frameCallback(Duration _) {
    final outer = _outer;
    final inner = _inner;
    if (outer != null && inner != null) {
      final outerConstraints = outer.constraints;
      if (_lastOuterConstraints != outerConstraints) {
        _outerConstraints = outerConstraints;
        _lastOuterConstraints = outerConstraints;
        _scheduleInnerLayout();
      }
      _frameCallbackScheduler.schedule();
    }
  }

  void _markInnerNeedsLayout() {
    if (_inner case final inner? when inner.attached) {
      inner.markNeedsLayout();
    }
  }

  void _scheduleInnerLayout() {
    if (_inner == null) return;
    final schedulerPhase = SchedulerBinding.instance.schedulerPhase;
    if (schedulerPhase == .persistentCallbacks ||
        schedulerPhase == .postFrameCallbacks) {
      if (!_isSchedulingPostFrameLayout) {
        _isSchedulingPostFrameLayout = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _isSchedulingPostFrameLayout = false;
          _markInnerNeedsLayout();
        });
      }
    } else {
      _markInnerNeedsLayout();
    }
  }

  void _onOuterLayout() {
    final outer = _outer;
    final outerConstraints = outer?.constraints;
    if (outer != null && _lastOuterConstraints != outerConstraints) {
      _outerConstraints = outerConstraints;
      _lastOuterConstraints = outerConstraints;
      _scheduleInnerLayout();
    }
  }

  void _onOuterNeedsLayout() {
    _scheduleInnerLayout();
  }
}

class _NestedSliverOuter extends SingleChildRenderObjectWidget {
  const _NestedSliverOuter({required this.link, required Widget super.child});

  final _NestedSliverLink link;

  @override
  _RenderNestedSliverOuter createRenderObject(BuildContext context) =>
      _RenderNestedSliverOuter(link: link);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderNestedSliverOuter renderObject,
  ) {
    renderObject.link = link;
  }
}

class _RenderNestedSliverOuter extends RenderSliver
    with RenderObjectWithChildMixin<RenderBox> {
  _RenderNestedSliverOuter({required this._link});

  _NestedSliverLink _link;

  _NestedSliverLink get link => _link;

  set link(_NestedSliverLink value) {
    if (_link == value) return;
    if (attached) {
      assert(_link._outer == this);
      _link._outer = null;
    }
    _link = value;
    if (attached) {
      assert(_link._outer == null);
      _link._outer = this;
    }
    markNeedsLayout();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(link._outer == null);
    link._outer = this;
    link._frameCallbackScheduler.schedule();
  }

  @override
  void detach() {
    super.detach();
    assert(link._outer == this);
    link._frameCallbackScheduler.cancel();
    link._outer = null;
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverPhysicalParentData) {
      child.parentData = SliverPhysicalParentData();
    }
  }

  @override
  void markNeedsLayout() {
    super.markNeedsLayout();
    link._onOuterNeedsLayout();
  }

  SliverGeometry _layout(
    BoxChildLayoutStrategy strategy,
    SliverConstraints constraints,
  ) {
    final child = this.child;
    if (child != null) {
      final childConstraints = switch (constraints.axis) {
        .horizontal => BoxConstraints(
          minWidth: 0.0,
          maxWidth: .infinity,
          minHeight: constraints.crossAxisExtent,
          maxHeight: constraints.crossAxisExtent,
        ),
        .vertical => BoxConstraints(
          minWidth: constraints.crossAxisExtent,
          maxWidth: constraints.crossAxisExtent,
          minHeight: 0.0,
          maxHeight: .infinity,
        ),
      };

      final childSize = strategy.layoutChildForSize(child, childConstraints);

      final innerSize = link._innerSize;
      final innerGeometry = link._innerGeometry;

      final (childExtent, innerExtent) = switch (constraints.axis) {
        .horizontal => (childSize.width, innerSize.width),
        .vertical => (childSize.height, innerSize.height),
      };

      final layoutOverhead = math.max(0.0, childExtent - innerExtent);

      final maxPaint = constraints.remainingPaintExtent;
      final totalScrollExtent = innerGeometry.scrollExtent + layoutOverhead;
      final paintExtent = math.min(
        innerGeometry.paintExtent + layoutOverhead,
        maxPaint,
      );

      return innerGeometry.copyWith(
        scrollExtent: totalScrollExtent,
        paintExtent: paintExtent,
        layoutExtent: math.min(
          innerGeometry.layoutExtent + layoutOverhead,
          maxPaint,
        ),
        maxPaintExtent: innerGeometry.maxPaintExtent + layoutOverhead,
        hasVisualOverflow: true,
        cacheExtent: math.min(
          innerGeometry.cacheExtent + layoutOverhead,
          constraints.remainingCacheExtent,
        ),
      );
    } else {
      return .zero;
    }
  }

  @override
  void performLayout() {
    link._onOuterLayout();
    geometry = _layout(.wet, constraints);
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    final overlap = math.max(0.0, constraints.overlap);
    switch (constraints.axis) {
      case .horizontal:
        transform.translateByDouble(overlap, 0.0, 0.0, 1.0);
      case .vertical:
        transform.translateByDouble(0.0, overlap, 0.0, 1.0);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    assert(this.geometry != null);
    final child = this.child;
    final geometry = this.geometry!;
    if (child != null && geometry.paintExtent > 0.0) {
      final overlap = math.max(0.0, constraints.overlap);
      final shift = switch (constraints.axis) {
        .horizontal => Offset(overlap, 0.0),
        .vertical => Offset(0.0, overlap),
      };
      context.paintChild(child, offset + shift);
    }
  }

  @override
  bool hitTestChildren(
    SliverHitTestResult result, {
    required double mainAxisPosition,
    required double crossAxisPosition,
  }) {
    assert(this.geometry != null);
    final child = this.child;
    final geometry = this.geometry!;
    if (child != null && geometry.paintExtent > 0.0) {
      final overlap = math.max(0.0, constraints.overlap);
      final hitOffset = switch (constraints.axis) {
        .horizontal => Offset(mainAxisPosition - overlap, crossAxisPosition),
        .vertical => Offset(crossAxisPosition, mainAxisPosition - overlap),
      };
      return child.hitTest(BoxHitTestResult.wrap(result), position: hitOffset);
    }
    return false;
  }
}

class _NestedSliverInner extends SingleChildRenderObjectWidget {
  const _NestedSliverInner({required this.link, required Widget sliver})
    : super(child: sliver);

  final _NestedSliverLink link;

  @override
  _RenderNestedSliverInner createRenderObject(BuildContext context) =>
      _RenderNestedSliverInner(link: link);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderNestedSliverInner renderObject,
  ) {
    renderObject.link = link;
  }
}

class _RenderNestedSliverInner extends RenderBox
    with RenderObjectWithChildMixin<RenderSliver> {
  _RenderNestedSliverInner({required this._link});

  _NestedSliverLink _link;

  _NestedSliverLink get link => _link;

  set link(_NestedSliverLink value) {
    if (_link == value) return;
    if (attached) {
      assert(_link._inner == this);
      _link._inner = null;
    }
    _link = value;
    if (attached) {
      assert(_link._inner == null);
      _link._inner = this;
    }
    markNeedsLayout();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(link._inner == null);
    link._inner = this;
  }

  @override
  void detach() {
    super.detach();
    assert(link._inner == this);
    link._inner = null;
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverPhysicalParentData) {
      child.parentData = SliverPhysicalParentData();
    }
  }

  (Size, SliverGeometry) _layout(
    SliverChildLayoutStrategy strategy,
    BoxConstraints constraints,
  ) {
    final child = this.child;
    final outerConstraints = link._outerConstraints;
    if (child != null && outerConstraints != null) {
      final childConstraints = outerConstraints.copyWith(
        crossAxisExtent: switch (outerConstraints.axis) {
          .horizontal => constraints.maxHeight,
          .vertical => constraints.maxWidth,
        },
      );
      final geometry = strategy.layoutChildForGeometry(child, childConstraints);
      final overlap = math.max(0.0, outerConstraints.overlap);
      final extent = math.max(0.0, geometry.paintExtent - overlap);
      final size = switch (outerConstraints.axis) {
        .horizontal => Size(extent, constraints.maxHeight),
        .vertical => Size(constraints.maxWidth, extent),
      };
      return (size, geometry);
    } else {
      return (constraints.smallest, .zero);
    }
  }

  @override
  void performLayout() {
    final (size, geometry) = _layout(.wet, constraints);
    link._innerSize = this.size = size;
    link._innerGeometry = geometry;
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    final outerConstraints = link._outerConstraints;
    if (outerConstraints != null) {
      final overlap = math.max(0.0, outerConstraints.overlap);
      switch (outerConstraints.axis) {
        case .horizontal:
          transform.translateByDouble(-overlap, 0.0, 0.0, 1.0);
        case .vertical:
          transform.translateByDouble(0.0, -overlap, 0.0, 1.0);
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final child = this.child;
    final outerConstraints = link._outerConstraints;
    if (child != null &&
        outerConstraints != null &&
        link._innerGeometry.paintExtent > 0.0) {
      final overlap = math.max(0.0, outerConstraints.overlap);
      final shift = switch (outerConstraints.axis) {
        .horizontal => Offset(-overlap, 0.0),
        .vertical => Offset(0.0, -overlap),
      };
      context.paintChild(child, offset + shift);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final child = this.child;
    final outerConstraints = link._outerConstraints;
    if (child != null &&
        outerConstraints != null &&
        link._innerGeometry.paintExtent > 0.0) {
      final overlap = math.max(0.0, outerConstraints.overlap);
      final (mainAxisOffset, crossAxisOffset) = switch (outerConstraints.axis) {
        .horizontal => (position.dx, position.dy),
        .vertical => (position.dy, position.dx),
      };
      return child.hitTest(
        SliverHitTestResult.wrap(result),
        mainAxisPosition: mainAxisOffset + overlap,
        crossAxisPosition: crossAxisOffset,
      );
    }
    return false;
  }
}
