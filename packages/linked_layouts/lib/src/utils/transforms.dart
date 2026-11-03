import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

@internal
abstract final class RenderObjectTransformHelper {
  static final _ancestorsCache = <RenderObject>[];

  static final _targetAncestorsCache = <RenderObject>[];
  static final _otherAncestorsCache = <RenderObject>[];

  static final _targetGlobalTransformCache = Matrix4.zero();
  static final _otherGlobalTransformCache = Matrix4.zero();

  static Constraints? _getConstraints(RenderObject renderObject) {
    try {
      // ignore: invalid_use_of_protected_member
      return renderObject.constraints;
    } on StateError {
      return null;
    }
  }

  static T? getConstraintsOfType<T extends Constraints>(
    RenderObject renderObject,
  ) => _getConstraints(renderObject) as T?;

  static bool hasConstraints(RenderObject renderObject) =>
      _getConstraints(renderObject) != null;

  /// Executes [callback] in a scope where `RenderBox.size` debug assertions
  /// permit reading sizes of already-laid-out render objects across the tree.
  static T withDebugLayoutMutationsAllowed<T extends Object?>(
    T Function() callback,
  ) {
    late final T result;
    var debugLayoutMutationsAllowed = false;
    assert(() {
      final debugActiveLayout = RenderObject.debugActiveLayout;
      if (debugActiveLayout != null &&
          debugActiveLayout.debugDoingThisLayout &&
          !debugActiveLayout.debugDoingThisLayoutWithCallback &&
          hasConstraints(debugActiveLayout)) {
        // ignore: invalid_use_of_protected_member
        debugActiveLayout.invokeLayoutCallback<Constraints>((_) {
          result = callback();
        });
        debugLayoutMutationsAllowed = true;
      }
      return true;
    }());
    if (!debugLayoutMutationsAllowed) result = callback();
    return result;
  }

  /// Applies [parent]'s paint transform for [child] into [transform].
  ///
  /// Returns `false` if [parent] or [child] has not been laid out yet (throwing
  /// when accessing uninitialized layout state) or if [parent] zeroes out the
  /// transform.
  static bool tryApplyPaintTransform(
    RenderObject parent,
    RenderObject child,
    Matrix4 transform,
  ) {
    try {
      parent.applyPaintTransform(child, transform);
      final scaleW = transform.storage[15];
      return scaleW != 0.0;
    } on Object {
      return false;
    }
  }

  static Matrix4? tryGetTransformIn(
    RenderObject target,
    RenderObject other, {
    Matrix4? matrix,
  }) {
    if (!target.attached || !other.attached) return null;

    final transform = (matrix?..setIdentity()) ?? .identity();
    if (identical(target, other)) return transform;
    return withDebugLayoutMutationsAllowed(() {
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
            if (!tryApplyPaintTransform(parent, child, targetTransform)) {
              return null;
            }
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
          if (!tryApplyPaintTransform(parent, child, otherGlobalTransform)) {
            return null;
          }
          parent = child;
        }

        final otherTranslation = MatrixUtils.getAsTranslation(
          otherGlobalTransform,
        );
        if (otherTranslation != null) {
          transform
            ..setIdentity()
            ..translateByDouble(
              -otherTranslation.dx,
              -otherTranslation.dy,
              0.0,
              1.0,
            );
          if (_targetAncestorsCache.isNotEmpty) {
            transform.multiply(targetTransform);
          }
          return transform;
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
    });
  }

  static Matrix4? tryGetTransformTo(
    RenderObject descendant, {
    RenderObject? ancestor,
    Matrix4? result,
    Map<RenderObject, Matrix4>? ancestorTransformCache,
  }) {
    if (!descendant.attached) return null;
    return withDebugLayoutMutationsAllowed(() {
      try {
        RenderObject? object = descendant;
        Matrix4? cachedTransform;

        while (object != null) {
          if (!object.attached) return null;
          if (ancestor == null && ancestorTransformCache != null) {
            cachedTransform = ancestorTransformCache[object];
            if (cachedTransform != null) {
              _ancestorsCache.add(object);
              break;
            }
          }
          _ancestorsCache.add(object);
          if (identical(object, ancestor)) break;
          object = object.parent;
        }

        if (ancestor != null && _ancestorsCache.last != ancestor) return null;

        final transform = result ?? .zero();
        if (cachedTransform != null) {
          transform.setFrom(cachedTransform);
        } else {
          transform.setIdentity();
        }

        for (var index = _ancestorsCache.length - 1; index > 0; index--) {
          final parent = _ancestorsCache[index];
          final child = _ancestorsCache[index - 1];
          if (!tryApplyPaintTransform(parent, child, transform)) {
            return null;
          }
          if (ancestor == null && ancestorTransformCache != null) {
            (ancestorTransformCache[child] ??= .zero()).setFrom(transform);
          }
        }

        return transform;
      } finally {
        _ancestorsCache.clear();
      }
    });
  }
}
