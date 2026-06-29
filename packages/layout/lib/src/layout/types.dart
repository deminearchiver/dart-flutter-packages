import 'package:layout/src/layout/flutter.dart';

/// Singature for a function that takes a [RenderBox] and specifies the child's
/// origin relative to the parent origin.
typedef ChildPositioner = void Function(RenderBox child, Offset position);

/// A collection of static functions to layout a [RenderBox] child with the
/// given set of [BoxConstraints].
///
/// All of the functions adhere to the [ChildLayouter] signature.
@Deprecated("Use BoxChildLayoutStrategy instead.")
abstract final class ChildLayoutHelper {
  /// Returns the [Size] that the [RenderBox] would have if it were to
  /// be laid out with the given [BoxConstraints].
  ///
  /// This method calls [RenderBox.getDryLayout] on the given [RenderBox].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [layoutChild], which actually lays out the child with the given
  ///    constraints.
  @Deprecated("Use BoxChildLayoutStrategy.dryLayoutChild instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size dryLayoutChild(RenderBox child, BoxConstraints constraints) =>
      BoxChildLayoutStrategy.dry.getDryLayout(child, constraints);

  /// Lays out the [RenderBox] with the given constraints and returns its
  /// [Size].
  ///
  /// This method calls [RenderBox.layout] on the given [RenderBox] with
  /// `parentUsesSize` set to true to receive its [Size].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [dryLayoutChild], which does not perform a real layout of the child.
  @Deprecated("Use BoxChildLayoutStrategy.layoutChildForSize instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size layoutChild(RenderBox child, BoxConstraints constraints) =>
      BoxChildLayoutStrategy.wet.layoutChildForSize(child, constraints);

  /// Convenience function that calls [RenderBox.getDryBaseline].
  @Deprecated("Use BoxChildLayoutStrategy.getDryBaseline instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getDryBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => BoxChildLayoutStrategy.dry.getDryBaseline(child, constraints, baseline);

  /// Convenience function that calls [RenderBox.getDistanceToBaseline].
  ///
  /// The given `child` must be already laid out with `constraints`.
  @Deprecated("Use BoxChildLayoutStrategy.getBaseline instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => BoxChildLayoutStrategy.wet.getBaseline(child, constraints, baseline);

  @Deprecated("Use BoxChildLayoutStrategy.positionChild instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void dryPositionChild(RenderBox child, Offset position) {
    BoxChildLayoutStrategy.dry.positionChild(child, position);
  }

  @Deprecated("Use BoxChildLayoutStrategy.positionChild instead.")
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void positionChild(RenderBox child, Offset position) {
    BoxChildLayoutStrategy.wet.positionChild(child, position);
  }
}

/// A strategy which helps layout a [RenderBox] child with the
/// given set of [BoxConstraints].
abstract class BoxChildLayoutStrategy {
  const BoxChildLayoutStrategy();

  bool get affectsLayoutState;

  /// Returns the [Size] that the [RenderBox] would have if it were to
  /// be laid out with the given [BoxConstraints].
  ///
  /// This method calls [RenderBox.getDryLayout] on the given [RenderBox].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [layoutChild], which actually lays out the child with the given
  ///    constraints.
  ///
  ///  * [layoutChildForSize], which lays out the child with the given
  ///    constraints and returns its computed size.
  Size getDryLayout(RenderBox child, BoxConstraints constraints) =>
      child.getDryLayout(constraints);

  /// Computes the baseline location as if the child was laid out by the parent
  /// using the given [BoxConstraints].
  ///
  /// This method calls [RenderBox.getDryBaseline] on the given [RenderBox].
  ///
  /// Returns the distance from the top of the [RenderBox] to the first baseline
  /// of the its contents for the given `constraints`, or `null` if the child
  /// does not have any baselines.
  double? getDryBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => child.getDryBaseline(constraints, baseline);

  /// Lays out the [RenderBox] with the given constraints.
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [layoutChildForSize], which perfoms a real layout and returns
  ///    the computed of the child.
  ///
  ///  * [getDryLayout], which does not perform a real layout of the child.
  void layoutChild(RenderBox child, BoxConstraints constraints);

  /// Lays out the [RenderBox] with the given constraints and returns its
  /// [Size].
  ///
  /// This method should only be called by the parent of the provided
  /// [RenderBox] child as it binds parent and child together (if the child
  /// is marked as dirty, the child will also be marked as dirty).
  ///
  /// See also:
  ///
  ///  * [layoutChildForSize], which perfoms a real layout but doesn't return
  ///    the size of the child.
  ///
  ///  * [getDryLayout], which does not perform a real layout of the child.
  Size layoutChildForSize(RenderBox child, BoxConstraints constraints);

  /// Returns the distance from the y-coordinate of the position of the child to
  /// the y-coordinate of the first given baseline in its contents.
  ///
  /// Used by certain layout models to align adjacent boxes on a common
  /// baseline, regardless of padding, font size differences, etc. If there is
  /// no baseline, this function returns null.
  ///
  ///
  /// Only call this function after calling [layoutChild] or
  /// [layoutChildForSize] on the child. You are only allowed to call this from
  /// the parent of the supplied box during that parent's
  /// [RenderBox.performLayout] or [RenderBox.paint] functions.
  ///
  /// The given `child` must be already laid out with `constraints`.
  double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  );

  void positionChild(RenderBox child, Offset position);

  static const BoxChildLayoutStrategy dry = _BoxChildDryLayoutStrategy();

  static const BoxChildLayoutStrategy wet = _BoxChildWetLayoutStrategy();
}

final class _BoxChildDryLayoutStrategy extends BoxChildLayoutStrategy {
  const _BoxChildDryLayoutStrategy();

  @override
  bool get affectsLayoutState => false;

  @override
  void layoutChild(RenderBox child, BoxConstraints constraints) {
    // No-op.
  }

  @override
  Size layoutChildForSize(RenderBox child, BoxConstraints constraints) =>
      getDryLayout(child, constraints);

  @override
  double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => getDryBaseline(child, constraints, baseline);

  @override
  void positionChild(RenderBox child, Offset position) {
    // No-op.
  }

  @override
  String toString() => "BoxChildLayoutStrategy.dry";
}

final class _BoxChildWetLayoutStrategy extends BoxChildLayoutStrategy {
  const _BoxChildWetLayoutStrategy();

  @override
  bool get affectsLayoutState => true;

  @override
  void layoutChild(RenderBox child, BoxConstraints constraints) {
    child.layout(constraints, parentUsesSize: false);
  }

  @override
  Size layoutChildForSize(RenderBox child, BoxConstraints constraints) =>
      (child..layout(constraints, parentUsesSize: true)).size;

  @override
  double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    assert(!child.debugNeedsLayout);
    assert(child.constraints == constraints);
    return child.getDistanceToBaseline(baseline, onlyReal: true);
  }

  @override
  void positionChild(RenderBox child, Offset position) {
    final childParentData = child.parentData;
    assert(childParentData != null && childParentData is BoxParentData);
    (childParentData! as BoxParentData).offset = position;
  }

  @override
  String toString() => "BoxChildLayoutStrategy.wet";
}

abstract class SliverChildLayoutStrategy {
  const SliverChildLayoutStrategy();

  bool get affectsLayoutState;

  void layoutChild(RenderSliver child, SliverConstraints constraints);

  SliverGeometry layoutChildForGeometry(
    RenderSliver child,
    SliverConstraints constraints,
  );

  static const SliverChildLayoutStrategy wet = _SliverChildWetLayoutStrategy();
}

final class _SliverChildWetLayoutStrategy extends SliverChildLayoutStrategy {
  const _SliverChildWetLayoutStrategy();

  @override
  bool get affectsLayoutState => true;

  @override
  void layoutChild(RenderSliver child, SliverConstraints constraints) {
    child.layout(constraints, parentUsesSize: false);
  }

  @override
  SliverGeometry layoutChildForGeometry(
    RenderSliver child,
    SliverConstraints constraints,
  ) {
    child.layout(constraints, parentUsesSize: true);
    final geometry = child.geometry;
    assert(geometry != null);
    return geometry!;
  }

  @override
  String toString() => "SliverChildLayoutStrategy.wet";
}
