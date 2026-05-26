/// Defines a touch target's layout policy.
///
/// It's recommended to use [overflow] over [wrap].
enum TouchTargetFit {
  /// Defer layout to the child, but accept hit tests in the overflowing parts
  /// of the touch area.
  overflow,

  /// Include the touch area in the layout.
  ///
  /// Typically, this increases the size of the touch target. This can lead to
  /// layout shift. It's recommended to use [overflow] over [wrap].
  wrap,
}
