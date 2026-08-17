import 'package:layout/src/layout/flutter.dart';

class LayoutFittedBox extends SingleChildRenderObjectWidget {
  const LayoutFittedBox({
    super.key,
    this.fit = .contain,
    this.alignment = .center,
    super.child,
  });

  /// How to inscribe the child into the space allocated during layout.
  final BoxFit fit;

  /// How to align the child within its parent's bounds.
  ///
  /// An alignment of (-1.0, -1.0) aligns the child to the top-left corner of its
  /// parent's bounds. An alignment of (1.0, 0.0) aligns the child to the middle
  /// of the right edge of its parent's bounds.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  @override
  RenderLayoutFittedBox createRenderObject(BuildContext context) =>
      RenderLayoutFittedBox(
        fit: fit,
        alignment: alignment,
        textDirection: Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLayoutFittedBox renderObject,
  ) {
    renderObject
      ..fit = fit
      ..alignment = alignment
      ..textDirection = Directionality.maybeOf(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BoxFit>("fit", fit))
      ..add(DiagnosticsProperty<AlignmentGeometry>("alignment", alignment));
  }
}

class RenderLayoutFittedBox extends RenderShiftedBox {
  RenderLayoutFittedBox({
    this._fit = .contain,
    this._alignment = .center,
    this._textDirection,
    RenderBox? child,
  }) : super(child);

  Alignment? _resolvedAlignmentCache;

  Alignment get _resolvedAlignment =>
      _resolvedAlignmentCache ??= alignment.resolve(textDirection);

  void _markNeedsResolution() {
    _resolvedAlignmentCache = null;
    markNeedsLayout();
  }

  BoxFit _fit;

  /// How to inscribe the child into the space allocated during layout.
  BoxFit get fit => _fit;

  set fit(BoxFit value) {
    if (_fit == value) return;
    _fit = value;
    markNeedsLayout();
  }

  AlignmentGeometry _alignment;

  /// How to align the child within its parent's bounds.
  ///
  /// An alignment of (0.0, 0.0) aligns the child to the top-left corner of its
  /// parent's bounds. An alignment of (1.0, 0.5) aligns the child to the middle
  /// of the right edge of its parent's bounds.
  ///
  /// If this is set to an [AlignmentDirectional] object, then
  /// [textDirection] must not be null.
  AlignmentGeometry get alignment => _alignment;

  /// Sets the alignment to a new value, and triggers a layout update.
  set alignment(AlignmentGeometry value) {
    if (_alignment == value) return;
    _alignment = value;
    _markNeedsResolution();
  }

  TextDirection? _textDirection;

  /// The text direction with which to resolve [alignment].
  ///
  /// This may be changed to null, but only after [alignment] has been changed
  /// to a value that does not depend on the direction.
  TextDirection? get textDirection => _textDirection;

  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _markNeedsResolution();
  }

  Size _computeSize(BoxConstraints constraints, Size childSize) {
    switch (fit) {
      case .scaleDown:
        final sizeConstraints = constraints.loosen();
        final unconstrainedSize = sizeConstraints
            .constrainSizeAndAttemptToPreserveAspectRatio(childSize);
        return constraints.constrain(unconstrainedSize);
      case .contain || .cover || .fill || .fitHeight || .fitWidth || .none:
        return constraints.constrainSizeAndAttemptToPreserveAspectRatio(
          childSize,
        );
    }
  }

  Size _computeFittedChildSize(Size size, Size childSize) {
    final sizes = applyBoxFit(fit, childSize, size);
    final scaleX = sizes.destination.width / sizes.source.width;
    final scaleY = sizes.destination.height / sizes.source.height;
    return Size(childSize.width * scaleX, childSize.height * scaleY);
  }

  Offset _computeChildPosition(Size size, Size childSize) =>
      _resolvedAlignment.alongOffset(size - childSize as Offset);

  Size _computeLayout(
    BoxChildLayoutStrategy strategy,
    BoxConstraints constraints,
  ) {
    if (child case final child?) {
      // Compute intrinsic size of the child.
      var childSize = strategy.getDryLayout(child, const .new());

      // Compute size of the fitted box.
      final size = _computeSize(constraints, childSize);

      // Layout and position the child when doing wet layout.
      if (strategy.affectsLayoutState) {
        // Layout the child with the fitted size.
        childSize = _computeFittedChildSize(size, childSize);
        strategy.layoutChild(child, .tight(childSize));

        // Align the child.
        final childPosition = _computeChildPosition(size, childSize);
        strategy.positionChild(child, childPosition);
      }

      // Return the computed size.
      return size;
    } else {
      return constraints.smallest;
    }
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _computeLayout(.dry, constraints);

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final child = this.child;
    if (child == null) return null;

    // Compute intrinsic size of the child.
    var childSize = child.getDryLayout(const .new());

    // Compute size of the fitted box.
    final size = _computeSize(constraints, childSize);

    // Apply box fit to the child size.
    childSize = _computeFittedChildSize(size, childSize);

    // Attempt to get child's baseline.
    final childBaseline = child.getDryBaseline(.tight(childSize), baseline);
    if (childBaseline == null) return null;

    // Compute position of the child.
    final childPosition = _computeChildPosition(size, childSize);

    // Apply offset to the baseline of the child.
    return childBaseline + childPosition.dy;
  }

  @override
  void performLayout() {
    size = _computeLayout(.wet, constraints);
  }

  @override
  bool paintsChild(RenderBox child) {
    assert(child.parent == this);
    return !size.isEmpty && !child.size.isEmpty;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final child = this.child;
    if (child == null || !paintsChild(child)) return;
    final childParentData = child.parentData! as BoxParentData;
    context.paintChild(child, childParentData.offset + offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (child case final child?) {
      final childParentData = child.parentData! as BoxParentData;
      return result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (result, transformed) {
          assert(transformed == position - childParentData.offset);
          return child.hitTest(result, position: transformed);
        },
      );
    }
    return false;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BoxFit>("fit", fit))
      ..add(DiagnosticsProperty<AlignmentGeometry>("alignment", alignment))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}
