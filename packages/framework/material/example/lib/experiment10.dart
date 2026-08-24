import 'dart:async';

import 'package:material_example/flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Experiment10View extends StatefulWidget {
  const Experiment10View({super.key});

  @override
  State<Experiment10View> createState() => _Experiment10ViewState();
}

class _Experiment10ViewState extends State<Experiment10View>
    with TickerProviderStateMixin {
  var _itemCount = 30;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final springTheme = SpringTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      body: CustomPullToRefresh(
        onRefresh: () => Future.delayed(const .new(seconds: 3)),
        builder: (context, controller) => CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: controller.createScrollPhysics(),
          ),
          slivers: [
            ListenableBuilder(
              listenable: controller,
              builder: (context, child) => SliverAppBar(
                clipBehavior: .none,
                pinned: true,
                backgroundColor: colorTheme.surfaceContainer,
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                title: const Text("Pull to refresh!"),
                bottom: buildBottomPullToRefresh(
                  context: context,
                  states: controller,
                  child: child!,
                ),
              ),
              child: Align.center(
                child: PullToRefreshFadeTransition(
                  states: controller,
                  endFraction: 0.4,
                  dismissedScale: 0.4,
                  child: PullToRefreshLoadingIndicator(states: controller),
                ),
              ),
            ),
            SliverPadding(
              padding: .fromLTRB(8.0, 0.0, 8.0, 16.0),
              sliver: SliverList.list(
                children: [
                  ListItemContainer(
                    isFirst: true,
                    isLast: true,
                    child: Flex.vertical(
                      children: [
                        ListItemLayout(
                          leading: const Icon(MaterialSymbols.list_rounded),
                          headline: Text("Item count"),
                          trailing: Text("$_itemCount"),
                        ),
                        Slider(
                          padding: const .fromLTRB(16.0, 8.0, 16.0, 16.0),
                          value: _itemCount.toDouble(),
                          onChanged: (value) =>
                              setState(() => _itemCount = value.round()),
                          min: 0.0,
                          max: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: _itemCount,
              itemBuilder: (context, index) {
                const spacing = 2.0;
                final lastIndex = _itemCount - 1;
                final isFirst = index == 0;
                final isLast = index == lastIndex;
                return Padding(
                  padding: .fromLTRB(
                    8.0,
                    isFirst ? 0.0 : spacing / 2.0,
                    8.0,
                    isLast ? 0.0 : spacing / 2.0,
                  ),
                  child: ListItemContainer(
                    isFirst: isFirst,
                    isLast: isLast,
                    child: ListItemInteraction(
                      onTap: () {},
                      child: ListItemLayout(
                        headline: Text("Item ${index + 1}"),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget buildBottomPullToRefresh({
  required BuildContext context,
  required CustomPullToRefreshStates states,
  double maxHeight = PullToRefreshController.defaultThreshold,
  required Widget child,
}) {
  final isRefreshing = states.isRefreshing;
  final verticalOffset = states.verticalOffset;
  final layoutHeight = states.layoutHeight;
  return PreferredSize(
    preferredSize: Size(.infinity, layoutHeight),
    child: SizedBox(
      height: layoutHeight,
      child: OverflowBox(
        alignment: .topCenter,
        minHeight: verticalOffset,
        maxHeight: verticalOffset,
        child: OverflowBox(
          alignment: .center,
          minHeight: 0.0,
          maxHeight: maxHeight,
          child: Visibility(
            visible: isRefreshing || verticalOffset > 0.0,
            child: child,
          ),
        ),
      ),
    ),
  );
}

mixin CustomPullToRefreshStates implements PullToRefreshStates {
  double get layoutFraction;

  double get layoutHeight;
}

class CustomPullToRefreshController extends PullToRefreshSpringController
    implements CustomPullToRefreshStates {
  CustomPullToRefreshController({
    super.onRefresh,
    super.enabled,
    super.threshold,
    super.isRefreshing,
    required super.vsync,
    super.spring,
    super.debugLabel,
  });

  Simulation? _simulation;

  double get _velocity {
    if (_simulation case final simulation? when isAnimating) {
      return simulation.dx(
        lastElapsedDuration.inMicroseconds / Duration.microsecondsPerSecond,
      );
    }
    return 0.0;
  }

  double _layoutFraction = 0.0;

  @override
  double get layoutFraction => _layoutFraction;

  @override
  double get layoutHeight => layoutFraction * threshold;

  Simulation _createSimulation(double targetValue) => SpringSimulation(
    spring,
    _layoutFraction,
    targetValue,
    _velocity,
    snapToEnd: true,
  );

  @override
  void tick() {
    super.tick();
    if (_simulation case final simulation?) {
      _layoutFraction = simulation.x(lastElapsedInSeconds);
      if (simulation.isDone(lastElapsedInSeconds)) {
        _simulation = null;
      }
    }
  }

  @override
  void animateToThreshold() {
    final simulation = _createSimulation(0.0);
    super.animateToThreshold();
    _simulation = simulation;
    _layoutFraction = simulation.x(0.0);
  }

  @override
  void animateToHidden() {
    final simulation = _createSimulation(0.0);
    super.animateToHidden();
    _simulation = simulation;
    _layoutFraction = simulation.x(0.0);
  }

  @override
  void snapTo(double targetValue) {
    super.snapTo(targetValue);
    if (!isRefreshing) {
      _simulation = null;
      _layoutFraction = targetValue;
    }
  }

  @mustCallSuper
  @override
  void stop({bool canceled = true}) {
    super.stop(canceled: canceled);
    _simulation = null;
  }
}

typedef CustomPullToRefreshBuilder =
    Widget Function(
      BuildContext context,
      CustomPullToRefreshController controller,
    );

class CustomPullToRefresh extends StatefulWidget {
  const CustomPullToRefresh({
    super.key,
    required this.onRefresh,
    this.enabled = true,
    this.spring,
    this.threshold = PullToRefreshController.defaultThreshold,
    required this.builder,
  });

  final RefreshCallback onRefresh;

  final bool enabled;

  final SpringDescription? spring;

  final double threshold;

  final CustomPullToRefreshBuilder builder;

  @override
  CustomPullToRefreshState createState() => CustomPullToRefreshState();
}

class CustomPullToRefreshState extends State<CustomPullToRefresh>
    with SingleTickerProviderStateMixin {
  late CustomPullToRefreshController _controller;

  Future<void>? _refreshFuture;

  void _onRefresh() {
    if (!mounted) return;

    final completer = Completer<void>();
    _refreshFuture = completer.future;

    _controller.isRefreshing = true;

    unawaited(
      widget.onRefresh().whenComplete(() {
        if (!mounted) return;

        _controller.isRefreshing = false;

        if (!completer.isCompleted) {
          completer.complete();
        }

        _refreshFuture = null;
      }),
    );
  }

  // ValueListenable<PullToRefreshStates> get states => _controller;

  Future<void> show() {
    if (!mounted) return Future.value();
    if (_refreshFuture case final refreshFuture?) {
      return refreshFuture;
    }
    _onRefresh();
    return _refreshFuture ?? Future.value();
  }

  // TODO: implement?
  // bool dismiss() {}

  @override
  void initState() {
    super.initState();
    _controller = CustomPullToRefreshController(
      onRefresh: _onRefresh,
      enabled: widget.enabled,
      threshold: widget.threshold,
      vsync: this,
      spring: widget.spring ?? PullToRefreshSpringController.defaultSpring,
    );
  }

  @override
  void didUpdateWidget(covariant CustomPullToRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.spring != oldWidget.spring) {
      _controller.spring =
          widget.spring ?? PullToRefreshSpringController.defaultSpring;
    }
    _controller.enabled = widget.enabled;
    _controller.threshold = widget.threshold;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _controller);
}
