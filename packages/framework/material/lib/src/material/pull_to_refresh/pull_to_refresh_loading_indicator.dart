import 'package:material/src/material/flutter.dart';

mixin PullToRefreshLoadingIndicatorStates
    implements PullToRefreshStates, LoadingIndicatorStates;

typedef PullToRefreshLoadingIndicatorStateProperty<T extends Object?> =
    StateProperty<T, PullToRefreshLoadingIndicatorStates>;

final class const _PullToRefreshLoadingIndicatorStates({
  @override required final bool enabled,
  @override required final double threshold,
  @override required final bool isRefreshing,
  @override required final double distanceFraction,
  @override required final bool isAnimating,
  @override required final double verticalOffset,
  @override required final double distancePulled,
  @override required final double adjustedDistancePulled,
  @override required final double progress,
}) implements PullToRefreshLoadingIndicatorStates {
  factory fromPullToRefreshStates(PullToRefreshStates states) => .new(
    enabled: states.enabled,
    threshold: states.threshold,
    isRefreshing: states.isRefreshing,
    distanceFraction: states.distanceFraction,
    isAnimating: states.isAnimating,
    verticalOffset: states.verticalOffset,
    distancePulled: states.distancePulled,
    adjustedDistancePulled: states.adjustedDistancePulled,
    progress: states.progress,
  );

  @override
  bool get isContained => true;
}

class const PullToRefreshLoadingIndicator({
  super.key,

  required final ValueListenable<PullToRefreshStates> states,

  final List<RoundedPolygon>? determinateIndicatorPolygons,

  final List<RoundedPolygon>? indeterminateIndicatorPolygons,

  final PullToRefreshLoadingIndicatorStateProperty<OutlinedBorder?>?
  containerShape,

  final PullToRefreshLoadingIndicatorStateProperty<Color?>? containerColor,

  final PullToRefreshLoadingIndicatorStateProperty<OutlinePartial?>?
  containerOutline,

  final PullToRefreshLoadingIndicatorStateProperty<Color?>?
  activeIndicatorColor,

  final PullToRefreshLoadingIndicatorStateProperty<OutlinePartial?>?
  activeIndicatorOutline,
}) extends StatefulWidget {
  @override
  State<PullToRefreshLoadingIndicator> createState() =>
      _PullToRefreshLoadingIndicatorState();
}

class _PullToRefreshLoadingIndicatorState
    extends State<PullToRefreshLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late LoadingIndicatorThemeData _loadingIndicatorTheme;

  late OutlinedBorder _resolvedContainerShape;
  late Color _resolvedContainerColor;
  late Outline _resolvedContainerOutline;
  late Color _resolvedActiveIndicatorColor;
  late Outline _resolvedActiveIndicatorOutline;

  void _didChangeStates() {
    final states = _PullToRefreshLoadingIndicatorStates.fromPullToRefreshStates(
      widget.states.value,
    );

    _resolvedContainerShape =
        widget.containerShape?.resolve(states) ??
        _loadingIndicatorTheme.containerShape.resolve(states);

    _resolvedContainerColor =
        widget.containerColor?.resolve(states) ??
        _loadingIndicatorTheme.containerColor.resolve(states);

    _resolvedContainerOutline = _loadingIndicatorTheme.containerOutline
        .resolve(states)
        .maybeMerge(widget.containerOutline?.resolve(states));

    _resolvedActiveIndicatorColor =
        widget.activeIndicatorColor?.resolve(states) ??
        _loadingIndicatorTheme.activeIndicatorColor.resolve(states);

    _resolvedActiveIndicatorOutline = _loadingIndicatorTheme
        .activeIndicatorOutline
        .resolve(states)
        .maybeMerge(widget.activeIndicatorOutline?.resolve(states));
  }

  @override
  void initState() {
    super.initState();
    widget.states.addListener(_didChangeStates);
  }

  @override
  void didUpdateWidget(covariant PullToRefreshLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.states != oldWidget.states) {
      oldWidget.states.removeListener(_didChangeStates);
      widget.states.addListener(_didChangeStates);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadingIndicatorTheme = LoadingIndicatorTheme.of(context);
  }

  @override
  void dispose() {
    widget.states.removeListener(_didChangeStates);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _didChangeStates();

    const resolvedContainerSize = 48.0;

    final Widget determinateActiveIndicator = ValueListenableBuilder(
      valueListenable: widget.states,
      builder: (context, states, _) => DeterminateLoadingIndicator(
        indicatorPolygons: widget.determinateIndicatorPolygons,
        contained: false,
        containerShape: const .all(RoundedRectangleBorder()),
        containerColor: const .all(Colors.transparent),
        containerOutline: const .all(.from()),
        activeIndicatorColor: .all(_resolvedActiveIndicatorColor),
        activeIndicatorOutline: .all(_resolvedActiveIndicatorOutline),
        progress: states.distanceFraction,
      ),
    );

    final Widget indeterminateActiveIndicator = ListenableBuilder(
      listenable: widget.states,
      builder: (context, _) => IndeterminateLoadingIndicator(
        indicatorPolygons: widget.indeterminateIndicatorPolygons,
        contained: false,
        containerShape: const .all(RoundedRectangleBorder()),
        containerColor: const .all(Colors.transparent),
        containerOutline: const .all(.from()),
        activeIndicatorColor: .all(_resolvedActiveIndicatorColor),
        activeIndicatorOutline: .all(_resolvedActiveIndicatorOutline),
      ),
    );

    return SizedBox.square(
      dimension: resolvedContainerSize,
      child: ValueListenableBuilder(
        valueListenable: widget.states,
        builder: (context, states, _) => Surface(
          clipBehavior: .antiAlias,
          shape: _resolvedContainerOutline.apply(_resolvedContainerShape),
          color: _resolvedContainerColor,
          child: PullToRefreshIndicatorCrossFade(
            isRefreshing: states.isRefreshing,
            determinateChild: determinateActiveIndicator,
            indeterminateChild: indeterminateActiveIndicator,
          ),
        ),
      ),
    );
  }
}
