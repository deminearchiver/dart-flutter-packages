import 'package:material/src/material/flutter.dart';

class const PullToRefreshIndicatorCrossFade({
  super.key,
  required final bool isRefreshing,
  required final Widget determinateChild,
  required final Widget indeterminateChild,
}) extends StatefulWidget {
  @override
  State<PullToRefreshIndicatorCrossFade> createState() =>
      _PullToRefreshIndicatorCrossFadeState();
}

class _PullToRefreshIndicatorCrossFadeState
    extends State<PullToRefreshIndicatorCrossFade>
    with SingleTickerProviderStateMixin {
  double get _crossFadeFractionTargetValue => widget.isRefreshing ? 1.0 : 0.0;

  late AnimationController _crossFadeController;

  late SpringThemeData _springTheme;

  void _startImplicitAnimation() {
    final oldValue = _crossFadeController.value;
    final newValue = _crossFadeFractionTargetValue;
    if (newValue == oldValue) return;

    final simulation = SpringSimulation(
      _springTheme.defaultEffects.toSpringDescription(),
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
  void didUpdateWidget(covariant PullToRefreshIndicatorCrossFade oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRefreshing != oldWidget.isRefreshing) {
      _startImplicitAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _springTheme = SpringTheme.of(context);
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
