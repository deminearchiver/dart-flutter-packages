import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:material_3p/material.dart';
import 'package:material_3p/material_shapes.dart' as material_shapes;
import 'package:material_ui/material_ui.dart';

class const PullToRefreshLoadingIndicator({
  super.key,

  required final PullToRefreshController controller,

  final List<material_shapes.RoundedPolygon>? determinateIndicatorPolygons,

  final List<material_shapes.RoundedPolygon>? indeterminateIndicatorPolygons,

  final OutlinedBorder? containerShape,

  final Color? containerColor,

  final BorderSide? containerOutline,

  final Color? activeIndicatorColor,

  final BorderSide? activeIndicatorOutline,
}) extends StatefulWidget {
  @override
  State<PullToRefreshLoadingIndicator> createState() =>
      _PullToRefreshLoadingIndicatorState();
}

class _PullToRefreshLoadingIndicatorState
    extends State<PullToRefreshLoadingIndicator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    const resolvedContainerSize = 48.0;

    final resolvedContainerShape =
        widget.containerShape ?? const CircleBorder();

    final resolvedContainerColor =
        widget.containerColor ?? colorScheme.primaryContainer;

    final resolvedContainerOutline = widget.containerOutline ?? .none;

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor ?? colorScheme.onPrimaryContainer;

    final resolvedActiveIndicatorOutline =
        widget.activeIndicatorOutline ?? .none;

    final Widget determinateActiveIndicator = ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) => DeterminateLoadingIndicator(
        indicatorPolygons: widget.determinateIndicatorPolygons,
        contained: false,
        containerShape: const RoundedRectangleBorder(),
        containerColor: Colors.transparent,
        containerOutline: .none,
        activeIndicatorColor: resolvedActiveIndicatorColor,
        activeIndicatorOutline: resolvedActiveIndicatorOutline,
        progress: widget.controller.distanceFraction,
      ),
    );

    final Widget indeterminateActiveIndicator = ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) => IndeterminateLoadingIndicator(
        indicatorPolygons: widget.indeterminateIndicatorPolygons,
        contained: false,
        containerShape: const RoundedRectangleBorder(),
        containerColor: Colors.transparent,
        containerOutline: .none,
        activeIndicatorColor: resolvedActiveIndicatorColor,
        activeIndicatorOutline: resolvedActiveIndicatorOutline,
      ),
    );

    return SizedBox.square(
      dimension: resolvedContainerSize,
      child: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) => Material(
          animationDuration: .zero,
          clipBehavior: .antiAlias,
          shape: resolvedContainerShape.copyWith(
            side: resolvedContainerOutline,
          ),
          color: resolvedContainerColor,
          child: _PullToRefreshLoadingIndicatorCrossFade(
            isRefreshing: widget.controller.isRefreshing,
            determinateChild: determinateActiveIndicator,
            indeterminateChild: indeterminateActiveIndicator,
          ),
        ),
      ),
    );
  }
}

class const _PullToRefreshLoadingIndicatorCrossFade({
  required final bool isRefreshing,
  required final Widget determinateChild,
  required final Widget indeterminateChild,
}) extends StatefulWidget {
  @override
  State<_PullToRefreshLoadingIndicatorCrossFade> createState() =>
      _PullToRefreshLoadingIndicatorCrossFadeState();
}

class _PullToRefreshLoadingIndicatorCrossFadeState
    extends State<_PullToRefreshLoadingIndicatorCrossFade>
    with SingleTickerProviderStateMixin {
  double get _crossFadeFractionTargetValue => widget.isRefreshing ? 1.0 : 0.0;

  late AnimationController _crossFadeController;

  void _startImplicitAnimation() {
    final oldValue = _crossFadeController.value;
    final newValue = _crossFadeFractionTargetValue;
    if (newValue == oldValue) return;

    final simulation = SpringSimulation(
      // stiffness: 1600, damping ratio: 1
      const .new(mass: 1.0, stiffness: 1600.0, damping: 80.0),
      oldValue,
      newValue,
      _crossFadeController.velocity,
      snapToEnd: true,
    );

    if (newValue >= oldValue) {
      _crossFadeController.animateWith(simulation);
    } else {
      _crossFadeController.animateBackWith(simulation);
    }
  }

  @override
  void initState() {
    super.initState();
    _crossFadeController = .unbounded(
      vsync: this,
      value: _crossFadeFractionTargetValue,
    );
  }

  @override
  void didUpdateWidget(
    covariant _PullToRefreshLoadingIndicatorCrossFade oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRefreshing != oldWidget.isRefreshing) {
      _startImplicitAnimation();
    }
  }

  @override
  void dispose() {
    _crossFadeController.dispose();
    super.dispose();
  }

  Widget _buildTransition(BuildContext context, Widget? _) {
    final crossFadeFraction = clampDouble(_crossFadeController.value, 0.0, 1.0);
    final determinateOpacity = 1.0 - crossFadeFraction;
    final indeterminateOpacity = crossFadeFraction;
    return Stack(
      fit: .expand,
      alignment: .center,
      children: [
        Visibility(
          visible: determinateOpacity > 0.0,
          child: Opacity(
            opacity: determinateOpacity,
            child: widget.determinateChild,
          ),
        ),
        Visibility(
          visible: indeterminateOpacity > 0.0,
          child: Opacity(
            opacity: indeterminateOpacity,
            child: widget.indeterminateChild,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _crossFadeController,
    builder: _buildTransition,
  );
}
