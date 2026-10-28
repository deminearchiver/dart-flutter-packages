import 'dart:async';
import 'dart:math' as math;

import 'package:material_example/flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class const Experiment11View({super.key}) extends StatefulWidget {
  @override
  State<Experiment11View> createState() => _Experiment11ViewState();
}

class _Experiment11ViewState extends State<Experiment11View> {
  final ValueNotifier<double> _pullDistance = ValueNotifier<double>(0.0);

  _RefreshStatus _status = .idle;

  double? _draggedPullDistance;

  bool _isSpringingBack = false;

  double _releasedPullDistance = 0.0;

  int _itemCount = 15;

  @override
  void dispose() {
    _pullDistance.dispose();
    super.dispose();
  }

  Future<void> _refresh({double pullDistance = 0.0}) async {
    if (_status != .idle) {
      return;
    }
    setState(() {
      _status = .refreshing;
      _releasedPullDistance = pullDistance;
    });

    await Future<void>.delayed(const Duration(seconds: 3));
    if (!mounted) {
      return;
    }

    setState(() {
      _itemCount += 5;
      _status = .finishing;
    });
  }

  void _handleIndicatorFadedOut() {
    if (_status == .finishing) {
      setState(() {
        _status = .idle;
      });
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    final ScrollMetrics metrics = notification.metrics;
    _pullDistance.value = metrics.minScrollExtent - metrics.pixels;

    final bool isDragging = switch (notification) {
      ScrollUpdateNotification(:final DragUpdateDetails? dragDetails) =>
        dragDetails != null,
      ScrollEndNotification() => false,
      _ => _draggedPullDistance != null,
    };

    if (isDragging || notification is ScrollEndNotification) {
      _isSpringingBack = false;
    } else if (metrics.pixels < metrics.minScrollExtent) {
      _isSpringingBack = true;
    }

    if (_status != .idle) {
      return false;
    }

    if (isDragging) {
      _draggedPullDistance = _pullDistance.value;
    } else if (_draggedPullDistance case final double releasedPullDistance) {
      _draggedPullDistance = null;
      if (releasedPullDistance >= _PullToRefreshIndicator.refreshDistance) {
        unawaited(_refresh(pullDistance: releasedPullDistance));
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: colorTheme.surfaceContainer,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        title: const Text('Pull To Refresh Sample'),
        notificationPredicate: (notification) =>
            !_isSpringingBack &&
            defaultScrollNotificationPredicate(notification),
        actions: <Widget>[
          IconButton(
            onPressed: _refresh,
            tooltip: 'Refresh',
            icon: const Icon(MaterialSymbols.refresh_rounded),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Skeletonizer(
            enabled: _status == .refreshing,
            effect: ShimmerEffect(
              baseColor: colorTheme.surfaceContainerLow,
              highlightColor: colorTheme.surfaceContainerHighest,
            ),
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: ListView.builder(
                physics: const _PullToRefreshScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: _itemCount,
                itemBuilder: (context, index) => ListItemLayout(
                  headline: Text('Item ${_itemCount - index}'),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _pullDistance,
            builder: (context, pullDistance, child) => _PullToRefreshIndicator(
              status: _status,
              pullDistance: pullDistance,
              releasedPullDistance: _releasedPullDistance,
              onFadedOut: _handleIndicatorFadedOut,
            ),
          ),
        ],
      ),
    );
  }
}

enum _RefreshStatus { idle, refreshing, finishing }

class const _PullToRefreshIndicator({
  required final _RefreshStatus status,
  required final double pullDistance,
  required final double releasedPullDistance,
  required final VoidCallback onFadedOut,
}) extends StatelessWidget {
  static const double refreshDistance = 80.0;

  @override
  Widget build(BuildContext context) {
    final isPulling = status == .idle;
    final pullProgress = math.max(pullDistance, 0.0) / refreshDistance;
    final offset = 8.0 + math.max(pullDistance, -8.0) / 3;

    final opacity = switch (status) {
      .idle => math.min(pullProgress * 10, 1.0),
      .refreshing => 1.0,
      .finishing => 0.0,
    };

    final double scale = isPulling
        ? lerpDouble(
            0.5,
            1.0,
            Curves.linearToEaseOut.transform(math.min(pullProgress * 2, 1.0)),
          )
        : 1.0;

    return Transform.translate(
      offset: Offset(0.0, offset),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: isPulling ? Duration.zero : Durations.short2,
        onEnd: onFadedOut,
        child: Transform.scale(
          scale: scale,
          child: isPulling
              ? DeterminateLoadingIndicator(
                  progress: pullProgress,
                  contained: true,
                  semanticsLabel: "Pull to refresh",
                )
              : const IndeterminateLoadingIndicator(
                  contained: true,
                  semanticsLabel: 'Refreshing',
                ),
        ),
      ),
    );
  }
}

class const _PullToRefreshScrollPhysics({super.parent})
    extends BouncingScrollPhysics {
  @override
  _PullToRefreshScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      _PullToRefreshScrollPhysics(parent: buildParent(ancestor));

  @override
  SpringDescription get spring =>
      SpringDescription.withDampingRatio(mass: 1, stiffness: 500, ratio: 0.6);
}
