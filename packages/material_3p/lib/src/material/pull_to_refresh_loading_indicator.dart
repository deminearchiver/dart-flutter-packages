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
          child: PullToRefreshIndicatorCrossFade(
            isRefreshing: widget.controller.isRefreshing,
            determinateChild: determinateActiveIndicator,
            indeterminateChild: indeterminateActiveIndicator,
          ),
        ),
      ),
    );
  }
}
