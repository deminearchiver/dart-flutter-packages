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
  static bool tryFindAncestorsOf(
    List<RenderObject> result,
    RenderObject descendant,
  ) {
    result.clear();
    RenderObject? object = descendant;
    while (object != null) {
      if (!object.attached) return false;
      result.add(object);

      // We do some loop unrolling here.

      final firstParent = object.parent;
      if (firstParent == null) break;
      if (!firstParent.attached) return false;
      result.add(firstParent);

      final secondParent = firstParent.parent;
      if (secondParent == null) break;
      if (!secondParent.attached) return false;
      result.add(secondParent);

      final thirdParent = secondParent.parent;
      if (thirdParent == null) break;
      if (!thirdParent.attached) return false;
      result.add(thirdParent);

      object = thirdParent.parent;
    }
    return result.isNotEmpty;
  }

  @internal
  static bool applyPaintTransformOr(
    RenderObject parent,
    RenderObject child,
    Matrix4 transform,
  ) {
    if (tryApplyPaintTransform(parent, child, transform)) {
      return true;
    }
    if (tryApplyFallbackTransform(parent, child, transform)) {
      return true;
    }
    return false;
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
    switch (child.parentData) {
      case BoxParentData(:final offset):
      case SliverPhysicalParentData(paintOffset: final offset):
        transform.translateByDouble(offset.dx, offset.dy, 0.0, 1.0);
        return true;
      case SliverLogicalParentData(:final layoutOffset?)
          when parent is RenderSliver:
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
            final height = _tryGetBoxDimension(child, .vertical) ?? 0.0;
            transform.translateByDouble(0.0, -(delta + height), 0.0, 1.0);
          case .left:
            final width = _tryGetBoxDimension(child, .horizontal) ?? 0.0;
            transform.translateByDouble(-(delta + width), 0.0, 0.0, 1.0);
        }
        return true;
      default:
        return false;
    }
  }

  static double? _tryGetBoxDimension(RenderObject child, Axis axis) {
    if (child is! RenderBox || !child.hasSize) return null;

    Size? size;

    var debugHasSize = false;
    assert(() {
      try {
        size = child.size;
      } on Error {
        size = null;
      } finally {
        debugHasSize = true;
      }
      return true;
    }());

    if (!debugHasSize) size = child.size;

    return switch (axis) {
      .horizontal => size?.width,
      .vertical => size?.height,
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
    if (target == other) return transform;

    // We do some loop unrolling here.
    final targetParent = target.parent;
    if (targetParent == other) {
      tryApplyPaintTransform(other, target, transform);
      return transform;
    }
    final targetGrandparent = targetParent?.parent;
    if (targetGrandparent == other) {
      // Non-null if grandparent is non-null.
      tryApplyPaintTransform(targetParent!, target, transform);
      tryApplyPaintTransform(other, targetParent, transform);
      return transform;
    }

    try {
      if (!tryFindAncestorsOf(_targetAncestorsCache, target) ||
          !tryFindAncestorsOf(_otherAncestorsCache, other)) {
        return null;
      }

      if (_targetAncestorsCache.last != _otherAncestorsCache.last) {
        return null;
      }

      var targetIndex = _targetAncestorsCache.length - 1;
      var otherIndex = _otherAncestorsCache.length - 1;

      while (targetIndex >= 0 &&
          otherIndex >= 0 &&
          _targetAncestorsCache[targetIndex] ==
              _otherAncestorsCache[otherIndex]) {
        targetIndex--;
        otherIndex--;
      }

      final targetAncestorIndex = targetIndex + 1;
      final otherAncestorIndex = otherIndex + 1;

      final targetGlobalTransform = _targetGlobalTransformCache..setIdentity();
      for (var index = 1; index <= targetAncestorIndex; index++) {
        final child = _targetAncestorsCache[index - 1];
        final parent = _targetAncestorsCache[index];
        tryApplyPaintTransform(parent, child, targetGlobalTransform);
      }

      if (otherAncestorIndex == 0) {
        transform.setFrom(targetGlobalTransform);
        return transform;
      }

      final otherGlobalTransform = _otherGlobalTransformCache..setIdentity();
      for (var index = 1; index <= otherAncestorIndex; index++) {
        final child = _otherAncestorsCache[index - 1];
        final parent = _otherAncestorsCache[index];
        tryApplyPaintTransform(parent, child, otherGlobalTransform);
      }

      final determinant = otherGlobalTransform.invert();
      if (determinant == 0.0) return null;

      if (targetAncestorIndex > 0) {
        otherGlobalTransform.multiply(targetGlobalTransform);
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
        if (object == ancestor) break;
        object = object.parent;
      }

      if (ancestor != null && _ancestorsCache.last != ancestor) return null;

      final transform = (result?..setIdentity()) ?? Matrix4.identity();

      for (var index = 1; index < _ancestorsCache.length; index++) {
        final child = _ancestorsCache[index - 1];
        final parent = _ancestorsCache[index];
        RenderObjectTransformHelper.applyPaintTransformOr(
          parent,
          child,
          transform,
        );
      }

      return transform;
    } finally {
      _ancestorsCache.clear();
    }
  }
}
