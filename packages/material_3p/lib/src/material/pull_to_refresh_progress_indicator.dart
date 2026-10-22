import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:material_3p/material.dart';
import 'package:material_ui/material_ui.dart';

class const PullToRefreshProgressIndicator({
  super.key,
  required final PullToRefreshController controller,
  final OutlinedBorder? containerShape,
  final Color? containerColor,
  final Color? activeIndicatorColor,
}) extends StatefulWidget {
  @override
  State<PullToRefreshProgressIndicator> createState() =>
      _PullToRefreshProgressIndicatorState();
}

class _PullToRefreshProgressIndicatorState
    extends State<PullToRefreshProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    final resolvedContainerShape =
        widget.containerShape ?? const CircleBorder();
    final resolvedContainerColor =
        widget.containerColor ?? colorScheme.surfaceContainerHigh;
    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor ?? colorScheme.onSurfaceVariant;

    final Widget determinateActiveIndicator = Center(
      child: SizedBox.square(
        dimension: _kSpinnerSize,
        child: ListenableBuilder(
          listenable: widget.controller,
          builder: (context, _) => _CircularArrowProgressIndicator(
            progress: widget.controller.distanceFraction,
            color: resolvedActiveIndicatorColor,
          ),
        ),
      ),
    );

    final Widget indeterminateActiveIndicator = Center(
      child: SizedBox.square(
        dimension: _kSpinnerSize,
        child: CircularProgressIndicator(
          value: null,
          color: resolvedActiveIndicatorColor,
          backgroundColor: Colors.transparent,
          padding: .zero,
          strokeWidth: _kStrokeWidth,
          strokeCap: .round,
          // ignore: deprecated_member_use
          year2023: false,
        ),
      ),
    );

    return SizedBox.square(
      dimension: _kSpinnerContainerSize,
      child: Material(
        animationDuration: .zero,
        clipBehavior: .antiAlias,
        shape: resolvedContainerShape,
        color: resolvedContainerColor,
        child: ListenableBuilder(
          listenable: widget.controller,
          builder: (context, _) => PullToRefreshIndicatorCrossFade(
            isRefreshing: widget.controller.isRefreshing,
            determinateChild: determinateActiveIndicator,
            indeterminateChild: indeterminateActiveIndicator,
          ),
        ),
      ),
    );
  }
}

const _kMaxProgressArc = 0.8;
const _kStrokeWidth = 2.5;
const _kArcRadius = 5.5;
const _kSpinnerSize = 2.0 * (_kArcRadius + _kStrokeWidth);
const _kSpinnerContainerSize = 40.0;
const _kArrowWidth = 10.0;
const _kArrowHeight = 5.0;
const _kMinAlpha = 0.3;
const _kMaxAlpha = 1.0;

class const _CircularArrowProgressIndicator({
  required final double progress,
  required final Color color,
}) extends StatefulWidget {
  @override
  State<_CircularArrowProgressIndicator> createState() =>
      _CircularArrowProgressIndicatorState();
}

class _CircularArrowProgressIndicatorState
    extends State<_CircularArrowProgressIndicator>
    with SingleTickerProviderStateMixin {
  double get _alphaTargetValue =>
      widget.progress >= 1.0 ? _kMaxAlpha : _kMinAlpha;

  late AnimationController _alphaController;

  void _startImplicitAnimation() {
    final oldValue = _alphaController.value;
    final newValue = _alphaTargetValue;
    if (newValue == oldValue) return;

    final simulation = SpringSimulation(
      // md.sys.motion.spring.default.effects.stiffness = 1600
      // md.sys.motion.spring.default.effects.damping = 1
      const .new(mass: 1.0, stiffness: 1600.0, damping: 80.0),
      oldValue,
      newValue,
      _alphaController.velocity,
      snapToEnd: true,
    );

    if (newValue >= oldValue) {
      _alphaController.animateWith(simulation);
    } else {
      _alphaController.animateBackWith(simulation);
    }
  }

  @override
  void initState() {
    super.initState();
    _alphaController = .new(vsync: this, value: _alphaTargetValue);
  }

  @override
  void didUpdateWidget(covariant _CircularArrowProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((widget.progress >= 1.0) != (oldWidget.progress >= 1.0)) {
      _startImplicitAnimation();
    }
  }

  @override
  void dispose() {
    _alphaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
    excludeSemantics: true,
    value: widget.progress > 0.0
        ? "${(clampDouble(widget.progress, 0.0, 1.0) * 100).round()}%"
        : null,
    child: CustomPaint(
      size: const .square(_kSpinnerSize),
      painter: _CircularArrowProgressIndicatorPainter(
        progress: widget.progress,
        color: widget.color,
        alphaAnimation: _alphaController,
      ),
    ),
  );
}

class _CircularArrowProgressIndicatorPainter({
  required final double progress,
  required final Color color,
  required final ValueListenable<double> alphaAnimation,
}) extends CustomPainter {
  this : super(repaint: alphaAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    final values = _ArrowValues(progress);
    if (values.scale <= 0.0) return;

    final alpha = color.a * alphaAnimation.value;
    assert(alpha >= 0.0 && alpha <= 1.0);
    if (alpha <= 0.0) return;

    final usesSaveLayer = alpha < 1.0;
    if (usesSaveLayer) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = .mode(
            Colors.white.withValues(alpha: alpha),
            .modulate,
          ),
      );
    }

    final center = size.center(.zero);
    const arcRadius = _kArcRadius + _kStrokeWidth / 2.0;
    final arcBounds = Rect.fromCircle(center: center, radius: arcRadius);
    final paint = Paint()
      ..style = .stroke
      ..color = color.withValues(alpha: 1.0)
      ..strokeWidth = math.min(
        (_kArrowWidth + _kStrokeWidth) * values.scale,
        _kStrokeWidth,
      )
      ..strokeCap = .butt;

    canvas._rotate(values.rotation._toRadians(), center, () {
      _drawCircularIndicator(canvas, arcBounds, values, paint);
      _drawArrow(canvas, center, arcBounds, values, paint);
    });

    if (usesSaveLayer) canvas.restore();
  }

  void _drawCircularIndicator(
    Canvas canvas,
    Rect arcBounds,
    _ArrowValues values,
    Paint paint,
  ) {
    const arcRadius = _kArcRadius + _kStrokeWidth / 2.0;
    final startAngle = values.startAngle._toRadians();
    final sweepAngle = values.endAngle._toRadians() - startAngle;
    canvas.drawArc(
      arcBounds,
      startAngle,
      sweepAngle + _kStrokeWidth * values.scale / 2.0 / arcRadius,
      false,
      paint,
    );
  }

  void _drawArrow(
    Canvas canvas,
    Offset center,
    Rect arcBounds,
    _ArrowValues values,
    Paint paint,
  ) {
    var path = Path()
      ..fillType = .evenOdd
      ..lineTo(_kArrowWidth * values.scale / 2.0, _kArrowHeight * values.scale)
      ..lineTo(_kArrowWidth * values.scale, 0.0);

    final radius = arcBounds.shortestSide / 2.0;
    final inset = _kArrowWidth * values.scale / 2.0;
    path = path.shift(
      Offset(
        radius + arcBounds.center.dx - inset,
        arcBounds.center.dy - _kStrokeWidth,
      ),
    );

    canvas._rotate((values.endAngle - _kStrokeWidth)._toRadians(), center, () {
      canvas.drawPath(path, paint);
    });
  }

  @override
  bool shouldRepaint(_CircularArrowProgressIndicatorPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.color != color ||
      oldDelegate.alphaAnimation != alphaAnimation;
}

@immutable
class const _ArrowValues._({
  required final double rotation,
  required final double startAngle,
  required final double endAngle,
  required final double scale,
}) {
  factory(double progress) {
    // Discard first 40% of progress. Scale remaining progress to full range between 0 and 100%.
    final adjustedPercent =
        math.max(math.min(1.0, progress) - 0.4, 0.0) * 5.0 / 3.0;
    // How far beyond the threshold pull has gone, as a percentage of the threshold.
    final overshootPercent = progress.abs() - 1.0;
    // Limit the overshoot to 200%. Linear between 0 and 200.
    final linearTension = clampDouble(overshootPercent, 0.0, 2.0);
    // Non-linear tension. Increases with linearTension, but at a decreasing rate.
    final tensionPercent = linearTension - math.pow(linearTension, 2.0) / 4.0;

    // Calculations based on SwipeRefreshLayout specification.
    final endTrim = adjustedPercent * _kMaxProgressArc;
    final rotation = (-0.25 + 0.4 * adjustedPercent + tensionPercent) * 0.5;
    final startAngle = rotation * 360.0;
    final endAngle = (rotation + endTrim) * 360.0;
    final scale = math.min(1.0, adjustedPercent);

    return ._(
      rotation: rotation,
      startAngle: startAngle,
      endAngle: endAngle,
      scale: scale,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ArrowValues &&
          rotation == other.rotation &&
          startAngle == other.startAngle &&
          endAngle == other.endAngle &&
          scale == other.scale;

  @override
  int get hashCode => Object.hash(rotation, startAngle, endAngle, scale);
}

extension on double {
  double _toRadians() => this * (math.pi / 180.0);
}

extension on Canvas {
  void _rotate(double angle, Offset pivot, VoidCallback paint) {
    save();
    translate(pivot.dx, pivot.dy);
    rotate(angle);
    translate(-pivot.dx, -pivot.dy);
    paint();
    restore();
  }
}
