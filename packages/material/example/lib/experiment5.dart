import 'dart:async';

import 'package:material_example/flutter.dart';

import 'expressive_swipe.dart';

class Experiment5View extends StatefulWidget {
  const Experiment5View({super.key});

  @override
  State<Experiment5View> createState() => _Experiment5ViewState();
}

class _Experiment5ViewState extends State<Experiment5View> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: Stack(
        fit: .expand,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: colorTheme.surfaceContainer,
                title: Text(
                  "Mini music player demo",
                  style: typescaleTheme.titleLargeEmphasized.toTextStyle(
                    color: colorTheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const PlayerBottomSheet(),
        ],
      ),
    );
  }
}

class PlayerBottomSheet extends StatefulWidget {
  const PlayerBottomSheet({super.key});

  @override
  State<PlayerBottomSheet> createState() => _PlayerBottomSheetState();
}

class _PlayerBottomSheetState extends State<PlayerBottomSheet>
    with TickerProviderStateMixin {
  Timer? _timer;

  final _gestureDetectorKey = GlobalKey();

  double get _width {
    final box =
        _gestureDetectorKey.currentContext?.findRenderObject() as RenderBox?;
    try {
      return box != null && box.hasSize ? box.size.width : 1.0;
    } on Object {
      return 1.0;
    }
  }

  late ExpressiveSwipeController _swipeController;
  late SimulationController _dismissController;

  var _absoluteTranslation = 0.0;

  void _onDragDown(DragDownDetails details) {
    _absoluteTranslation = 0.0;
  }

  void _onDragStart(DragStartDetails details) {
    _absoluteTranslation = 0.0;
    _swipeController.start();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    assert(details.primaryDelta != null);
    final delta = details.primaryDelta!;
    _absoluteTranslation += delta;
    _swipeController.update(
      _absoluteTranslation,
      sourceTimestamp: details.sourceTimeStamp,
    );
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;

    final direction = _swipeController.detachDirection.toDouble();
    final dismissing = _swipeController.isDismissible(velocity);
    final translation = _swipeController.value;
    _swipeController.end(dismissing: dismissing, velocity: velocity);

    if (dismissing) {
      final width = _width;
      final simulation = SpringSimulation(
        SpringDescription.withDampingRatio(
          mass: 1.0,
          stiffness: 500.0,
          ratio: 1.0,
        ),
        translation / width,
        direction,
        velocity / width,
        snapToEnd: true,
      );
      unawaited(
        _dismissController.animateWith(simulation, .forward, resetTicker: true),
      );
      _timer = Timer(const .new(milliseconds: 1000), () {
        if (!mounted) return;
        final simulation = SpringSimulation(
          SpringDescription.withDampingRatio(
            mass: 1.0,
            stiffness: 550.0,
            ratio: 0.6,
          ),
          _dismissController.value,
          0.0,
          0.0,
          snapToEnd: true,
        );
        unawaited(
          _dismissController.animateWith(
            simulation,
            .forward,
            resetTicker: true,
          ),
        );
      });
    }

    _absoluteTranslation = 0.0;
  }

  void _onDragCancel() {
    _swipeController.end(dismissing: false);
    _absoluteTranslation = 0.0;
  }

  @override
  void initState() {
    super.initState();
    _swipeController = ExpressiveSwipeController(vsync: this);
    _dismissController = SimulationController.unbounded(vsync: this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _swipeController.dispose();
    _dismissController.dispose();
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
    return SizedBox.expand(
      child: Flex.vertical(
        mainAxisAlignment: .end,
        children: [
          GestureDetector(
            key: _gestureDetectorKey,
            behavior: .deferToChild,
            onHorizontalDragDown: _onDragDown,
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            onHorizontalDragCancel: _onDragCancel,
            child: AnimatedBuilder(
              animation: _dismissController,
              builder: (context, child) => FractionalTranslation(
                translation: Offset(_dismissController.value, 0.0),
                transformHitTests: true,
                child: child,
              ),
              child: AnimatedBuilder(
                animation: _swipeController,
                builder: (context, child) => Transform.translate(
                  offset: Offset(_swipeController.value, 0.0),
                  transformHitTests: true,
                  child: child,
                ),
                child: ListItemContainer(
                  isFirst: true,
                  isLast: true,
                  containerColor: .all(colorTheme.surfaceContainerHighest),
                  child: ListItemInteraction(
                    onTap: () {},
                    child: ListItemLayout(
                      minHeight: 64.0,
                      maxHeight: 64.0,
                      leading: const Icon(Symbols.frame_exclamation_rounded),
                      headline: Text(
                        "Swipe me!",
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      supportingText: Text(
                        "Let's see what you're capable of!",
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      trailing: const Icon(Symbols.swipe_right_rounded),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          ListItemContainer(
            isFirst: true,
            containerColor: .all(colorTheme.surfaceContainerHighest),
            child: Padding(
              padding: .only(bottom: padding.bottom),
              child: SizedBox(
                height: 64.0,
                child: const Flex.horizontal(
                  children: [
                    Flexible.tight(
                      child: _VerticalNavigationItem(
                        isSelected: true,
                        icon: Icon(Symbols.home),
                        label: Text("Home"),
                      ),
                    ),
                    Flexible.tight(
                      child: _VerticalNavigationItem(
                        isSelected: false,
                        icon: Icon(Symbols.library_music_rounded),
                        label: Text("Library"),
                      ),
                    ),
                    Flexible.tight(
                      child: _VerticalNavigationItem(
                        isSelected: false,
                        icon: Icon(Symbols.settings_rounded),
                        label: Text("Settings"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalNavigationItem extends StatefulWidget {
  const _VerticalNavigationItem({
    super.key,
    required this.isSelected,
    required this.icon,
    this.label,
  });

  final bool isSelected;
  final Widget icon;
  final Text? label;

  @override
  State<_VerticalNavigationItem> createState() =>
      _VerticalNavigationItemState();
}

class _VerticalNavigationItemState extends State<_VerticalNavigationItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;
    final icon = widget.icon;
    final label = widget.label;

    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    return SizedBox(
      width: .infinity,
      child: Padding(
        padding: .symmetric(vertical: label != null ? 6.0 : 4.0),
        child: Flex.vertical(
          mainAxisSize: .max,
          mainAxisAlignment: .center,
          spacing: 4.0,
          children: [
            SizedBox(
              width: 56.0,
              height: label != null ? 32.0 : 56.0,
              child: Surface(
                clipBehavior: .antiAlias,
                shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
                color: isSelected
                    ? colorTheme.secondaryContainer
                    : colorTheme.secondaryContainer.withValues(alpha: 0.0),
                child: InkWell(
                  overlayColor: WidgetStateLayerColor(
                    color: .all(
                      isSelected
                          ? colorTheme.onSecondaryContainer
                          : colorTheme.onSurface,
                    ),
                    opacity: stateTheme.asWidgetStateLayerOpacity,
                  ),
                  onTap: () {},
                  child: IconTheme.mergeWithData(
                    data: .from(
                      fill: isSelected ? 1.0 : 0.0,
                      opticalSize: 24.0,
                      size: 24.0,
                      color: isSelected
                          ? colorTheme.onSecondaryContainer
                          : colorTheme.onSurfaceVariant,
                    ),
                    child: icon,
                  ),
                ),
              ),
            ),
            if (label != null)
              DefaultTextStyle(
                maxLines: 1,
                softWrap: false,
                overflow: .ellipsis,
                style:
                    (widget.isSelected
                            ? typescaleTheme.labelMediumEmphasized
                            : typescaleTheme.labelMedium)
                        .toTextStyle(
                          color: isSelected
                              ? colorTheme.secondary
                              : colorTheme.onSurfaceVariant,
                        ),
                child: label,
              ),
          ],
        ),
      ),
    );
  }
}
