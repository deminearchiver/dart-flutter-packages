import 'dart:math' as math;

import 'package:inspire_blur/inspire_blur.dart';
import 'package:material_example/flutter.dart';

class Experiment7View extends StatefulWidget {
  const Experiment7View({super.key});

  @override
  State<Experiment7View> createState() => _Experiment7ViewState();
}

class _Experiment7ViewState extends State<Experiment7View> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: CustomScrollView(
        slivers: [
          _SliverHeader(
            expandedPadding: .all(24.0),
            collapsedPadding: .all(16.0),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => ListItemLayout(
              headline: Text(
                "Lorem ipsum dolor sit amet",
                textAlign: .center,
                softWrap: false,
                maxLines: 1,
                overflow: .ellipsis,
                style: typescaleTheme.displaySmallEmphasized.toTextStyle(
                  color: colorTheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverHeader extends StatefulWidget {
  const _SliverHeader({
    super.key,
    this.expandedPadding = .zero,
    this.collapsedPadding = .zero,
  });

  final EdgeInsetsGeometry expandedPadding;
  final EdgeInsetsGeometry collapsedPadding;

  @override
  State<_SliverHeader> createState() => __SliverHeaderState();
}

class __SliverHeaderState extends State<_SliverHeader> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final expandedPadding = widget.expandedPadding;
    final collapsedPadding = widget.collapsedPadding;
    const minHeight = 48.0;
    const maxHeight = 64.0;
    final minExtent = minHeight + collapsedPadding.vertical;
    final maxExtent = maxHeight + expandedPadding.vertical;
    return SliverHeader(
      minExtent: minExtent,
      maxExtent: maxExtent,
      pinned: true,
      builder: (context, shrinkOffset, overlapsContent) {
        final extent = math.max(minExtent, maxExtent - shrinkOffset);
        final fraction = clampDouble(
          1.0 - (extent - minExtent) / (maxExtent - minExtent),
          0.0,
          1.0,
        );
        final height = lerpDouble(maxHeight, minHeight, fraction);
        final padding = EdgeInsetsGeometry.lerp(
          expandedPadding,
          collapsedPadding,
          fraction,
        )!;
        final elevation = lerpDouble(
          elevationTheme.level0,
          elevationTheme.level3,
          fraction,
        );
        final color = Color.lerp(
          colorTheme.surfaceContainerHigh,
          colorTheme.surfaceContainerHighest,
          fraction,
        )!;

        final unselectedContainerWidth = lerpDouble(40.0, 32.0, fraction);
        final selectedContainerWidth = lerpDouble(52.0, 40.0, fraction);
        final containerHeight = lerpDouble(40.0, 32.0, fraction);
        final iconSize = lerpDouble(24.0, 20.0, fraction);
        final margin = lerpDouble(
          measurementTheme.space150,
          measurementTheme.space100,
          fraction,
        );

        return Stack(
          children: [
            Positioned.fill(
              child: Inspire.backdropBlur(
                config: .topToBottom(
                  sigma: 16.0,
                  fadeCurve: Curves.easeOutSine,
                ),
                useRepaintBoundary: false,
                clipBehavior: .hardEdge,
              ),
            ),
            Padding(
              padding: padding,
              child: SizedBox(
                width: .infinity,
                height: height,
                child: _HeaderLayout(
                  start: SizedBox(
                    height: height,
                    child: Surface(
                      clipBehavior: .antiAlias,
                      shape: shapeTheme.applyCorner(
                        corner: shapeTheme.cornerFull,
                      ),
                      color: color,
                      elevation: elevation,
                      child: Padding(
                        padding: .fromSTEB(
                          margin,
                          0.0,
                          lerpDouble(
                            measurementTheme.space300,
                            measurementTheme.space200,
                            fraction,
                          ),
                          0.0,
                        ),
                        child: Flex.horizontal(
                          mainAxisSize: .min,
                          spacing: lerpDouble(
                            measurementTheme.space100,
                            measurementTheme.space75,
                            fraction,
                          ),
                          children: [
                            SizedBox.square(
                              dimension: containerHeight,
                              child: Surface(
                                clipBehavior: .antiAlias,
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                color: colorTheme.surfaceContainerLowest,
                                child: Align.center(
                                  child: Text(
                                    "A",
                                    style: typescaleTheme.titleMediumEmphasized
                                        .toTextStyle(color: colorTheme.primary),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "headline",
                              style: TextGeometry.lerp(
                                typescaleTheme.titleLargeEmphasized,
                                typescaleTheme.titleMediumEmphasized,
                                fraction,
                              ).toTextStyle(color: colorTheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  center: SizedBox(
                    height: height,
                    child: Surface(
                      clipBehavior: .antiAlias,
                      shape: shapeTheme.applyCorner(
                        corner: shapeTheme.cornerFull,
                      ),
                      color: color,
                      elevation: elevation,
                      child: Padding(
                        padding: .symmetric(horizontal: margin),
                        child: Flex.horizontal(
                          mainAxisSize: .min,
                          spacing: margin,
                          children: [
                            _NavigationDestination(
                              unselectedContainerWidth:
                                  unselectedContainerWidth,
                              selectedContainerWidth: selectedContainerWidth,
                              containerHeight: containerHeight,
                              iconSize: iconSize,
                              isSelected: _selectedIndex == 0,
                              onTap: () => setState(() => _selectedIndex = 0),
                              icon: const Icon(MaterialSymbols.home_rounded),
                            ),
                            _NavigationDestination(
                              unselectedContainerWidth:
                                  unselectedContainerWidth,
                              selectedContainerWidth: selectedContainerWidth,
                              containerHeight: containerHeight,
                              iconSize: iconSize,
                              isSelected: _selectedIndex == 1,
                              onTap: () => setState(() => _selectedIndex = 1),
                              icon: const Icon(MaterialSymbols.info_rounded),
                            ),
                            _NavigationDestination(
                              unselectedContainerWidth:
                                  unselectedContainerWidth,
                              selectedContainerWidth: selectedContainerWidth,
                              containerHeight: containerHeight,
                              iconSize: iconSize,
                              isSelected: _selectedIndex == 2,
                              onTap: () => setState(() => _selectedIndex = 2),
                              icon: const Icon(MaterialSymbols.work_rounded),
                            ),
                            _NavigationDestination(
                              unselectedContainerWidth:
                                  unselectedContainerWidth,
                              selectedContainerWidth: selectedContainerWidth,
                              containerHeight: containerHeight,
                              iconSize: iconSize,
                              isSelected: _selectedIndex == 3,
                              onTap: () => setState(() => _selectedIndex = 3),
                              icon: const Icon(MaterialSymbols.docs_rounded),
                            ),
                            _NavigationDestination(
                              unselectedContainerWidth:
                                  unselectedContainerWidth,
                              selectedContainerWidth: selectedContainerWidth,
                              containerHeight: containerHeight,
                              iconSize: iconSize,
                              isSelected: _selectedIndex == 4,
                              onTap: () => setState(() => _selectedIndex = 4),
                              icon: const Icon(MaterialSymbols.mail_rounded),
                            ),
                            SizedBox(
                              width: 1.0,
                              height: lerpDouble(24.0, 16.0, fraction),
                              child: Surface(
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                color: colorTheme.outline,
                              ),
                            ),
                            SizedBox.square(
                              dimension: containerHeight,
                              child: Surface(
                                clipBehavior: .antiAlias,
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                color: colorTheme.tertiaryContainer,
                                child: InkWell(
                                  overlayColor: WidgetStateLayerColor(
                                    color: .all(colorTheme.onSurfaceVariant),
                                    opacity:
                                        stateTheme.asWidgetStateLayerOpacity,
                                  ),
                                  onTap: () {},
                                  child: Icon(
                                    MaterialSymbols.search_rounded,
                                    fill: 1.0,
                                    opticalSize: iconSize,
                                    size: iconSize,
                                    color: colorTheme.onTertiaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  end: SizedBox(
                    height: height,
                    child: Surface(
                      clipBehavior: .antiAlias,
                      shape: shapeTheme.applyCorner(
                        corner: shapeTheme.cornerFull,
                      ),
                      color: color,
                      elevation: elevation,
                      child: Padding(
                        padding: .symmetric(horizontal: margin),
                        child: Flex.horizontal(
                          mainAxisSize: .min,
                          spacing: margin,
                          children: [
                            SizedBox.square(
                              dimension: containerHeight,
                              child: Surface(
                                clipBehavior: .antiAlias,
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                child: InkWell(
                                  overlayColor: WidgetStateLayerColor(
                                    color: .all(colorTheme.onSurfaceVariant),
                                    opacity:
                                        stateTheme.asWidgetStateLayerOpacity,
                                  ),
                                  onTap: () {},
                                  child: Icon(
                                    MaterialSymbols.link_2_rounded,
                                    fill: 0.0,
                                    opticalSize: iconSize,
                                    size: iconSize,
                                    color: colorTheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox.square(
                              dimension: containerHeight,
                              child: Surface(
                                clipBehavior: .antiAlias,
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                child: InkWell(
                                  overlayColor: WidgetStateLayerColor(
                                    color: .all(colorTheme.onSurfaceVariant),
                                    opacity:
                                        stateTheme.asWidgetStateLayerOpacity,
                                  ),
                                  onTap: () {},
                                  child: Icon(
                                    MaterialSymbols.link_2_rounded,
                                    fill: 0.0,
                                    opticalSize: iconSize,
                                    size: iconSize,
                                    color: colorTheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox.square(
                              dimension: containerHeight,
                              child: Surface(
                                clipBehavior: .antiAlias,
                                shape: shapeTheme.applyCorner(
                                  corner: shapeTheme.cornerFull,
                                ),
                                child: InkWell(
                                  overlayColor: WidgetStateLayerColor(
                                    color: .all(colorTheme.onSurfaceVariant),
                                    opacity:
                                        stateTheme.asWidgetStateLayerOpacity,
                                  ),
                                  onTap: () {},
                                  child: Icon(
                                    MaterialSymbols.link_2_rounded,
                                    fill: 0.0,
                                    opticalSize: iconSize,
                                    size: iconSize,
                                    color: colorTheme.onSurfaceVariant,
                                  ),
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
          ],
        );
      },
    );
  }
}

class _NavigationDestination extends StatefulWidget {
  const _NavigationDestination({
    super.key,
    required this.unselectedContainerWidth,
    required this.selectedContainerWidth,
    required this.containerHeight,
    required this.iconSize,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  final double unselectedContainerWidth;
  final double selectedContainerWidth;
  final double containerHeight;
  final double iconSize;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;

  @override
  State<_NavigationDestination> createState() => _NavigationDestinationState();
}

class _NavigationDestinationState extends State<_NavigationDestination> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final springTheme = SpringTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final isSelected = widget.isSelected;
    return SizedTouchTarget(
      minimumSize: const .square(48.0),
      child: SingleMotionBuilder(
        value: isSelected ? 1.0 : 0.0,
        motion: springTheme.fastSpatial.toMotion(),
        builder: (context, value, child) {
          final containerWidth = lerpDouble(
            widget.unselectedContainerWidth,
            widget.selectedContainerWidth,
            value,
          );
          final containerColor = Color.lerp(
            colorTheme.primaryContainer.withValues(alpha: 0.0),
            colorTheme.primaryContainer,
            value,
          )!;
          final contentColor = Color.lerp(
            colorTheme.onSurfaceVariant,
            colorTheme.onPrimaryContainer,
            value,
          )!;
          return SizedBox(
            width: containerWidth,
            height: widget.containerHeight,
            child: Surface(
              clipBehavior: .antiAlias,
              shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
              color: containerColor,
              child: InkWell(
                overlayColor: WidgetStateLayerColor(
                  color: .all(contentColor),
                  opacity: stateTheme.asWidgetStateLayerOpacity,
                ),
                onTap: widget.onTap,
                child: IconTheme.mergeWithData(
                  data: .from(
                    fill: clampDouble(value, 0.0, 1.0),
                    opticalSize: widget.iconSize,
                    size: widget.iconSize,
                    color: contentColor,
                  ),
                  child: child!,
                ),
              ),
            ),
          );
        },
        child: widget.icon,
      ),
    );
  }
}

enum _HeaderLayoutSlot { start, center, end }

class _HeaderLayout
    extends SlottedMultiChildRenderObjectWidget<_HeaderLayoutSlot, RenderBox> {
  const _HeaderLayout({super.key, this.start, this.center, this.end});

  final Widget? start;
  final Widget? center;
  final Widget? end;

  @override
  Iterable<_HeaderLayoutSlot> get slots => [.start, .center, .end];

  @override
  Widget? childForSlot(_HeaderLayoutSlot slot) => switch (slot) {
    .start => start,
    .center => center,
    .end => end,
  };

  @override
  _RenderHeaderLayout createRenderObject(BuildContext context) =>
      _RenderHeaderLayout();

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderHeaderLayout renderObject,
  ) {}
}

class _RenderHeaderLayout extends RenderBox
    with SlottedContainerRenderObjectMixin<_HeaderLayoutSlot, RenderBox> {
  _RenderHeaderLayout();

  RenderBox? get _start => childForSlot(.start);
  RenderBox? get _center => childForSlot(.center);
  RenderBox? get _end => childForSlot(.end);

  Size _computeLayout(
    BoxChildLayoutStrategy strategy,
    BoxConstraints constraints,
  ) {
    final start = _start;
    final center = _center;
    final end = _end;

    final width = constraints.maxWidth;
    var height = constraints.minHeight;
    Size startSize = .zero;
    var startX = 0.0;
    if (start != null) {
      final startConstraints = constraints.loosen();
      startSize = strategy.layoutChildForSize(start, startConstraints);
      if (startSize.height > height) {
        height = clampDouble(
          startSize.height,
          constraints.minHeight,
          constraints.maxHeight,
        );
      }
      startX = 0.0;
    }
    Size endSize = .zero;
    var endX = width;
    if (end != null) {
      final endConstraints = constraints.loosen();
      endSize = strategy.layoutChildForSize(end, endConstraints);
      if (endSize.height > height) {
        height = clampDouble(
          endSize.height,
          constraints.minHeight,
          constraints.maxHeight,
        );
      }
      endX = width - endSize.width;
    }
    Size centerSize = .zero;
    var centerX = 0.0;
    if (center != null) {
      final centerConstraints = BoxConstraints(
        minWidth: 0.0,
        maxWidth: math.max(
          0.0,
          constraints.maxWidth - 2.0 * math.max(startSize.width, endSize.width),
        ),
        minHeight: constraints.minHeight,
        maxHeight: constraints.maxHeight,
      );
      centerSize = strategy.layoutChildForSize(center, centerConstraints);
      if (centerSize.height > height) {
        height = clampDouble(
          centerSize.height,
          constraints.minHeight,
          constraints.maxHeight,
        );
      }
      centerX = (width - centerSize.width) / 2.0;
    }

    if (strategy.affectsLayoutState) {
      if (start != null) {
        strategy.positionChild(
          start,
          Offset(startX, (height - startSize.height) / 2.0),
        );
      }
      if (center != null) {
        strategy.positionChild(
          center,
          Offset(centerX, (height - centerSize.height) / 2.0),
        );
      }
      if (end != null) {
        strategy.positionChild(
          end,
          Offset(endX, (height - centerSize.height) / 2.0),
        );
      }
    }
    return Size(width, height);
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _computeLayout(.dry, constraints);

  @override
  void performLayout() {
    size = _computeLayout(.wet, constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void paintChild(RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    paintChild(_start);
    paintChild(_center);
    paintChild(_end);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    bool hitTestChild(RenderBox? child) {
      if (child == null) return false;
      final childParentData = child.parentData! as BoxParentData;
      final offset = childParentData.offset;
      return result.addWithPaintOffset(
        offset: offset,
        position: position,
        hitTest: (result, transformed) {
          assert(transformed == position - offset);
          return child.hitTest(result, position: transformed);
        },
      );
    }

    if (hitTestChild(_start)) return true;
    if (hitTestChild(_center)) return true;
    if (hitTestChild(_end)) return true;

    return false;
  }
}
