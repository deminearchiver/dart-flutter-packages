import 'dart:async';

import 'package:material_example/flutter.dart';

const _kIndicatorMaxDistance = 80.0;

class Experiment10View extends StatefulWidget {
  const Experiment10View({super.key});

  @override
  State<Experiment10View> createState() => _Experiment10ViewState();
}

class _Experiment10ViewState extends State<Experiment10View>
    with TickerProviderStateMixin {
  late CustomPullToRefreshController _pullToRefreshController;
  late CustomPullToRefreshDelegate _pullToRefreshDelegate;

  Future<void> _onRefresh() async {
    if (!mounted) return;
    _pullToRefreshController.isRefreshing = true;

    await Future<void>.delayed(const .new(milliseconds: 3000));

    if (!mounted) return;
    _pullToRefreshController.isRefreshing = false;
  }

  @override
  void initState() {
    super.initState();
    _pullToRefreshDelegate = .new(vsync: this);
    _pullToRefreshController = .new(
      onRefresh: _onRefresh,
      delegate: _pullToRefreshDelegate,
      threshold: _kIndicatorMaxDistance,
    );
  }

  @override
  void dispose() {
    _pullToRefreshController.dispose();
    _pullToRefreshDelegate.dispose();
    super.dispose();
  }

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
      body: CustomScrollView(
        physics: PullToRefreshScrollPhysics(
          controller: _pullToRefreshController,
        ),
        slivers: [
          AnimatedBuilder(
            animation: _pullToRefreshController,
            builder: (context, child) {
              final isRefreshing = _pullToRefreshController.isRefreshing;
              final verticalOffset = _pullToRefreshController.verticalOffset;
              final layoutHeight = _pullToRefreshController.layoutHeight;
              final PreferredSizeWidget bottom = PreferredSize(
                preferredSize: Size(.infinity, layoutHeight),
                child: SizedBox(
                  height: layoutHeight,
                  child: OverflowBox(
                    alignment: .center,
                    minHeight: 0.0,
                    maxHeight: _kIndicatorMaxDistance,
                    child: Visibility(
                      visible: verticalOffset > 0.0 || isRefreshing,
                      child: child!,
                    ),
                  ),
                ),
              );
              return SliverAppBar(
                clipBehavior: .none,
                pinned: true,
                backgroundColor: colorTheme.surfaceContainer,
                surfaceTintColor: Colors.transparent,
                title: const Text("Pull to refresh!"),
                bottom: bottom,
              );
            },
            child: Align.bottomCenter(
              child: PullToRefreshFadeTransition(
                states: _pullToRefreshController,
                child: PullToRefreshLoadingIndicator(
                  states: _pullToRefreshController,
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: PullToRefreshDefaultLayout(
          //     clipBehavior: .none,
          //     controller: _pullToRefreshController,
          //     child: Align.bottomCenter(
          //       child: PullToRefreshLoadingIndicator(
          //         controller: _pullToRefreshController,
          //       ),
          //     ),
          //   ),
          // ),
          SliverList.builder(
            itemCount: 30,
            itemBuilder: (context, index) => ListItemInteraction(
              onTap: () {},
              child: ListItemLayout(headline: Text("Item ${index + 1}")),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPullToRefreshDelegate extends PullToRefreshDefaultDelegate {
  CustomPullToRefreshDelegate({required super.vsync, super.spring})
    : _layoutController = .new(
        vsync: vsync,
        lowerBound: 0.0,
        upperBound: .infinity,
        animationBehavior: .preserve,
      );

  final AnimationController _layoutController;

  var _isActive = false;

  Animation<double> get layoutFraction => _layoutController.view;

  SpringSimulation _createSimulation(double targetValue) => .new(
    spring,
    _layoutController.value,
    targetValue,
    _layoutController.velocity,
    snapToEnd: true,
  );

  @override
  void snapTo(double targetValue) {
    super.snapTo(targetValue);
    if (!_isActive) {
      _layoutController.value = targetValue;
    }
  }

  @override
  TickerFuture animateToThreshold() {
    _isActive = true;
    unawaited(_layoutController.animateWith(_createSimulation(0.0)));
    return super.animateToThreshold();
  }

  @override
  TickerFuture animateToHidden() {
    _isActive = false;
    unawaited(_layoutController.animateWith(_createSimulation(0.0)));
    return super.animateToHidden();
  }

  @override
  void dispose() {
    _layoutController.dispose();
    super.dispose();
  }
}

mixin CustomPullToRefreshStates implements PullToRefreshStates {
  double get layoutFraction;

  double get layoutHeight;
}

class CustomPullToRefreshController
    extends PullToRefreshController<CustomPullToRefreshDelegate>
    implements
        CustomPullToRefreshStates,
        ValueListenable<CustomPullToRefreshStates> {
  CustomPullToRefreshController({
    super.onRefresh,
    super.enabled,
    required super.delegate,
    super.threshold,
    super.isRefreshing,
  }) {
    delegate.layoutFraction.addListener(notifyListeners);
  }

  @override
  double get layoutFraction => delegate.layoutFraction.value;

  @override
  double get layoutHeight => layoutFraction * threshold;

  @override
  CustomPullToRefreshStates get value => this;

  @override
  void dispose() {
    delegate.layoutFraction.removeListener(notifyListeners);
    super.dispose();
  }
}
