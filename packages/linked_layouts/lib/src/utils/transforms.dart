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
        } on Error {
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
    if (target == other) return transform;

    // We do some loop unrolling here.
    final targetParent = target.parent;
    if (targetParent == other) {
      applyPaintTransformOr(other, target, transform);
      return transform;
    }
    final targetGrandparent = targetParent?.parent;
    if (targetGrandparent == other) {
      // Non-null if grandparent is non-null.
      applyPaintTransformOr(targetParent!, target, transform);
      applyPaintTransformOr(other, targetParent, transform);
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
        applyPaintTransformOr(parent, child, targetGlobalTransform);
      }

      if (otherAncestorIndex == 0) {
        transform.setFrom(targetGlobalTransform);
        return transform;
      }

      final otherGlobalTransform = _otherGlobalTransformCache..setIdentity();
      for (var index = 1; index <= otherAncestorIndex; index++) {
        final child = _otherAncestorsCache[index - 1];
        final parent = _otherAncestorsCache[index];
        applyPaintTransformOr(parent, child, otherGlobalTransform);
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
        applyPaintTransformOr(parent, child, transform);
      }

      return transform;
    } finally {
      _ancestorsCache.clear();
    }
  }
}
