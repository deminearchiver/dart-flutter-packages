import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

@internal
abstract final class RenderObjectTransformHelper {
  static final _ancestorsCache = <RenderObject>[];

  static final _targetAncestorsCache = <RenderObject>[];
  static final _otherAncestorsCache = <RenderObject>[];

  static final _targetGlobalTransformCache = Matrix4.zero();
  static final _otherGlobalTransformCache = Matrix4.zero();

  @internal
  static bool applyPaintTransformOr(
    RenderObject parent,
    RenderObject child,
    Matrix4 transform,
  ) {
    // RenderSliver.applyPaintTransform is a no-op (assert only),
    // so we must instead apply the fallback transform.
    if (parent is RenderSliver && child.parentData is SliverLogicalParentData) {
      return tryApplyFallbackTransform(parent, child, transform);
    }
    if (tryApplyPaintTransform(parent, child, transform)) {
      return true;
    }
    return tryApplyFallbackTransform(parent, child, transform);
  }

  @internal
  static bool tryApplyPaintTransform(
    RenderObject parent,
    RenderObject child,
    Matrix4 transform,
  ) {
    try {
      parent.applyPaintTransform(child, transform);
      return true;
    } on Error {
      return false;
    }
  }

  @internal
  static bool tryApplyFallbackTransform(
    RenderObject parent,
    RenderObject child,
    Matrix4 transform,
  ) {
    // We're not using switch statements here to avoid excessive nesting.

    // TODO: replace with a pluggable fallback registry.
    if (parent case RenderFractionalTranslation(:final translation)) {
      // Passthrough case, avoid dry layout calculations.
      if (translation == .zero) return true;

      final size = _tryGetProxyBoxSize(parent, child);

      // Other fallback cases don't matter for RenderFractionalTranslation,
      // because BoxParentData.offset is always zero.
      if (size == null) return false;

      // Simulate RenderFractionalTranslation.applyPaintTransform().
      transform.translateByDouble(
        translation.dx * size.width,
        translation.dy * size.height,
        0.0,
        1.0,
      );
      return true;
    }

    if (child.parentData
        case BoxParentData(:final offset) ||
            SliverPhysicalParentData(paintOffset: final offset)) {
      transform.translateByDouble(offset.dx, offset.dy, 0.0, 1.0);
      return true;
    }

    if (child.parentData case SliverLogicalParentData(
      :final layoutOffset?,
    ) when parent is RenderSliver) {
      final constraints = parent.constraints;
      final axisDirection = applyGrowthDirectionToAxisDirection(
        constraints.axisDirection,
        constraints.growthDirection,
      );
      final delta = layoutOffset - constraints.scrollOffset;
      switch (axisDirection) {
        case .down:
          transform.translateByDouble(0.0, delta, 0.0, 1.0);
        case .right:
          transform.translateByDouble(delta, 0.0, 0.0, 1.0);
        case .up:
          final height =
              (child is RenderBox
                  ? _tryGetBoxDimension(child, .vertical)
                  : null) ??
              0.0;
          transform.translateByDouble(0.0, -(delta + height), 0.0, 1.0);
        case .left:
          final width =
              (child is RenderBox
                  ? _tryGetBoxDimension(child, .horizontal)
                  : null) ??
              0.0;
          transform.translateByDouble(-(delta + width), 0.0, 0.0, 1.0);
      }
      return true;
    }

    return false;
  }

  static Size? _tryGetBoxSize(RenderBox box) {
    // Excessive branching may seem redundant, but it must remain for future
    // potential changes, such as adding diagnostic logging, etc.

    Size? size;

    if (box.hasSize) {
      // Technically it does the same thing as the statement after,
      // but we split it up for future potential improvements.
      var debugHasSize = false;
      assert(() {
        try {
          size = box.size;
        } on Error {
          size = null;
        } finally {
          debugHasSize = true;
        }
        return true;
      }());

      if (!debugHasSize) {
        // We don't need try-catch here because we've checked `RenderBox.hasSize`
        // earlier.
        size = box.size;
      }
    }

    // TODO: assess the order of size/constraints, especially the isTight check.

    // Last resort: attempt getting size using a dry layout pass.
    if (size == null) {
      BoxConstraints? constraints;

      // Technically it does the same thing as the statement after,
      // but we split it up for future potential improvements.
      var debugHasConstraints = false;
      assert(() {
        try {
          constraints = box.constraints;
        } on Error {
          constraints = null;
        } finally {
          debugHasConstraints = true;
        }
        return true;
      }());

      if (!debugHasConstraints) {
        // We can't check if `RenderBox.constraints` are non-null,
        // so we have to account for potential errors here.
        try {
          constraints = box.constraints;
        } on StateError {
          constraints = null;
        }
      }

      if (constraints case final constraints?) {
        // Skip dry layout if constraints are tight.
        if (constraints.isTight) {
          size = constraints.biggest;
        } else {
          try {
            size = box.getDryLayout(constraints);
          } on Error {
            // Technically this error may only occur when assertions are
            // enabled, meaning otherwise we get a zero size, which means sizes
            // may potentially be unstable depending on whether assertions are
            // enabled.
            size = null;
          }
        }
      }
    }

    return size;
  }

  static Size? _tryGetProxyBoxSize(RenderBox parent, RenderObject child) =>
      // TODO: consider checking child first
      //   because it reduces worst-case dry layout path length by one.
      _tryGetBoxSize(parent) ??
      (child is RenderBox ? _tryGetBoxSize(child) : null);

  static double? _tryGetBoxDimension(RenderBox box, Axis axis) {
    final size = _tryGetBoxSize(box);
    if (size == null) return null;
    return switch (axis) {
      .horizontal => size.width,
      .vertical => size.height,
    };
  }

  @internal
  static Matrix4? tryGetTransformIn(
    RenderObject target,
    RenderObject other, {
    Matrix4? matrix,
  }) {
    if (!target.attached || !other.attached) return null;

    final transform = (matrix?..setIdentity()) ?? .identity();
    if (identical(target, other)) return transform;

    try {
      _targetAncestorsCache.clear();
      _otherAncestorsCache.clear();

      var from = target;
      var to = other;

      while (!identical(from, to)) {
        final fromDepth = from.depth;
        final toDepth = to.depth;

        if (fromDepth >= toDepth) {
          final fromParent = from.parent;
          if (fromParent == null || !fromParent.attached) return null;
          _targetAncestorsCache.add(from);
          from = fromParent;
        }
        if (fromDepth <= toDepth) {
          final toParent = to.parent;
          if (toParent == null || !toParent.attached) return null;
          _otherAncestorsCache.add(to);
          to = toParent;
        }
      }

      final targetTransform = _targetGlobalTransformCache..setIdentity();
      if (_targetAncestorsCache.isNotEmpty) {
        var parent = from;
        for (
          var index = _targetAncestorsCache.length - 1;
          index >= 0;
          index--
        ) {
          final child = _targetAncestorsCache[index];
          applyPaintTransformOr(parent, child, targetTransform);
          parent = child;
        }
      }

      if (_otherAncestorsCache.isEmpty) {
        transform.setFrom(targetTransform);
        return transform;
      }

      final otherGlobalTransform = _otherGlobalTransformCache..setIdentity();
      var parent = to;
      for (var index = _otherAncestorsCache.length - 1; index >= 0; index--) {
        final child = _otherAncestorsCache[index];
        applyPaintTransformOr(parent, child, otherGlobalTransform);
        parent = child;
      }

      final determinant = otherGlobalTransform.invert();
      if (determinant == 0.0) return null;

      if (_targetAncestorsCache.isNotEmpty) {
        otherGlobalTransform.multiply(targetTransform);
      }

      transform.setFrom(otherGlobalTransform);
      return transform;
    } finally {
      _targetAncestorsCache.clear();
      _otherAncestorsCache.clear();
    }
  }

  @internal
  static Offset? tryGetPositionIn(
    RenderObject target,
    RenderObject other, {
    Matrix4? matrix,
  }) {
    final transform = tryGetTransformIn(target, other, matrix: matrix);
    if (transform == null) return null;
    return MatrixUtils.transformPoint(transform, .zero);
  }

  @internal
  static Matrix4? tryGetTransformTo(
    RenderObject descendant, {
    RenderObject? ancestor,
    Matrix4? result,
  }) {
    try {
      if (!descendant.attached) return null;

      RenderObject? object = descendant;
      while (object != null) {
        if (!object.attached) return null;
        _ancestorsCache.add(object);
        if (identical(object, ancestor)) break;
        object = object.parent;
      }

      if (ancestor != null && _ancestorsCache.last != ancestor) return null;

      final transform = (result?..setIdentity()) ?? Matrix4.identity();

      for (var index = _ancestorsCache.length - 1; index > 0; index--) {
        final parent = _ancestorsCache[index];
        final child = _ancestorsCache[index - 1];
        applyPaintTransformOr(parent, child, transform);
      }

      return transform;
    } finally {
      _ancestorsCache.clear();
    }
  }
}
