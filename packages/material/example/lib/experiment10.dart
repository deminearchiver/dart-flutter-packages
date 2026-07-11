import 'dart:async';

import 'package:material_example/flutter.dart';

class Experiment10View extends StatefulWidget {
  const Experiment10View({super.key});

  @override
  State<Experiment10View> createState() => _Experiment10ViewState();
}

class _Experiment10ViewState extends State<Experiment10View>
    with SingleTickerProviderStateMixin {
  late PullToRefreshController _pullToRefreshController;
  late PullToRefreshDefaultDelegate _pullToRefreshDelegate;

  Future<void> _onRefresh() async {
    if (!mounted) return;
    _pullToRefreshController.isRefreshing = true;

    await Future<void>.delayed(const .new(milliseconds: 1000));

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
          SliverAppBar(
            pinned: true,
            backgroundColor: colorTheme.surfaceContainer,
            surfaceTintColor: Colors.transparent,
            title: const Text("Pull to refresh!"),
          ),
          SliverToBoxAdapter(
            child: PullToRefreshDefaultLayout(
              clipBehavior: .hardEdge,
              controller: _pullToRefreshController,
              child: PullToRefreshLoadingIndicator(
                controller: _pullToRefreshController,
              ),
            ),
          ),
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
