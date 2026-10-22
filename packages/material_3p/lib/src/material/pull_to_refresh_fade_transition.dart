import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:material_3p/material.dart';

class const PullToRefreshFadeTransition({
  super.key,

  required final PullToRefreshController controller,

  /// End of the progress interval that will be scaled to the proper range.
  ///
  /// Defaults to `1.0`.
  final double endFraction = 1.0,

  /// Scale of [child] when the animation is fully dismissed (0% progress).
  ///
  /// Defaults to `0.0`.
  final double dismissedScale = 0.0,

  required final Widget child,
}) extends StatelessWidget {
  this
    : assert(endFraction > 0.0 && endFraction <= 1.0),
      assert(dismissedScale >= 0.0);

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final progress = math.max(0.0, controller.distanceFraction);

      // Scale first 40% of progress to range between 0% and 200%.
      final linearTension = clampDouble(2.0 * progress / endFraction, 0.0, 2.0);

      // Non-linear tension. Increases with linearTension,
      // but at a decreasing rate.
      final tensionPercent =
          linearTension - (linearTension * linearTension) / 4.0;

      return Transform.scale(
        scale: lerpDouble(dismissedScale, 1.0, tensionPercent),
        transformHitTests: false,
        child: Opacity(
          opacity: clampDouble(tensionPercent, 0.0, 1.0),
          alwaysIncludeSemantics: false,
          child: child,
        ),
      );
    },
    child: child,
  );
}
