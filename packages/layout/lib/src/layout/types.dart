import 'package:layout/src/layout/flutter.dart';

/// Singature for a function that takes a [RenderBox] and specifies the child's
/// origin relative to the parent origin.
typedef ChildPositioner = void Function(RenderBox child, Offset position);

/// A collection of static functions to layout a [RenderBox] child with the
/// given set of [BoxConstraints].
///
/// All of the functions adhere to the [ChildLayouter] signature.
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
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size dryLayoutChild(RenderBox child, BoxConstraints constraints) =>
      child.getDryLayout(constraints);

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
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static Size layoutChild(RenderBox child, BoxConstraints constraints) {
    child.layout(constraints, parentUsesSize: true);
    return child.size;
  }

  /// Convenience function that calls [RenderBox.getDryBaseline].
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getDryBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => child.getDryBaseline(constraints, baseline);

  /// Convenience function that calls [RenderBox.getDistanceToBaseline].
  ///
  /// The given `child` must be already laid out with `constraints`.
  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double? getBaseline(
    RenderBox child,
    BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    assert(!child.debugNeedsLayout);
    assert(child.constraints == constraints);
    return child.getDistanceToBaseline(baseline, onlyReal: true);
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void dryPositionChild(RenderBox child, Offset position) {
    // Do nothing. Inlining should get rid of the function call.
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static void positionChild(RenderBox child, Offset position) {
    assert(child.parentData != null && child.parentData! is BoxParentData);
    (child.parentData! as BoxParentData).offset = position;
  }
}
