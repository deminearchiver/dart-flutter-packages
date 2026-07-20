import 'package:layout/src/layout/flutter.dart';

abstract class ValueConstraints<
  ValueType extends Object?,
  ConstraintType extends Constraints,
  ThisType extends ValueConstraints<ValueType, ConstraintType, ThisType>
>
    with ProxyConstraints<ThisType> {
  const ValueConstraints(this.parentConstraints, this.value);

  final ValueType value;

  @override
  final ConstraintType parentConstraints;

  @override
  ThisType withParentConstraints(ConstraintType constraints);

  @override
  String toString() => "$parentConstraints with $value";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ValueConstraints<ValueType, ConstraintType, ThisType> &&
          parentConstraints == other.parentConstraints &&
          value == other.value;

  @override
  int get hashCode => Object.hash(runtimeType, parentConstraints, value);
}

class ValueBoxConstraints<T extends Object?>
    extends ValueConstraints<T, BoxConstraints, ValueBoxConstraints<T>>
    with ProxyBoxConstraints<ValueBoxConstraints<T>> {
  const ValueBoxConstraints(super.parentConstraints, super.value);

  @override
  ValueBoxConstraints<T> withParentConstraints(
    covariant BoxConstraints constraints,
  ) => ValueBoxConstraints<T>(constraints, value);
}

class ValueLayoutBuilder<T extends Object?>
    extends ConstrainedLayoutBuilder<ValueBoxConstraints<T>> {
  const ValueLayoutBuilder({super.key, required super.builder});

  @override
  RenderAbstractLayoutBuilderMixin<ValueBoxConstraints<T>, RenderBox>
  createRenderObject(BuildContext context) => _RenderValueLayoutBuilder<T>();
}

class _RenderValueLayoutBuilder<T extends Object?> extends RenderBox
    with
        RenderObjectWithChildMixin<RenderBox>,
        RenderObjectWithLayoutCallbackMixin,
        RenderAbstractLayoutBuilderMixin<ValueBoxConstraints<T>, RenderBox> {
  @override
  double computeMinIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
    // return child?.getMinIntrinsicWidth(height) ?? 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
    // return child?.getMaxIntrinsicWidth(height) ?? 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
    // return child?.getMinIntrinsicHeight(width) ?? 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
    // return child?.getMaxIntrinsicHeight(width) ?? 0.0;
  }

  @override
  Size computeDryLayout(ValueBoxConstraints<T> constraints) {
    assert(
      debugCannotComputeDryLayout(
        reason:
            "Calculating the dry layout would require running the layout callback "
            "speculatively, which might mutate the live render object tree.",
      ),
    );
    return .zero;
    // if (child case final child?) {
    //   print(child.getDryLayout(constraints));
    //   return child.getDryLayout(constraints);
    // }
    // return .zero;
  }

  @override
  double? computeDryBaseline(
    ValueBoxConstraints<T> constraints,
    TextBaseline baseline,
  ) {
    assert(
      debugCannotComputeDryLayout(
        reason:
            "Calculating the dry baseline would require running the layout callback "
            "speculatively, which might mutate the live render object tree.",
      ),
    );
    return null;
    // return child?.getDryBaseline(constraints, baseline);
  }

  @override
  void performLayout() {
    final constraints = this.constraints;
    runLayoutCallback();
    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(child!.size);
    } else {
      size = constraints.biggest;
    }
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) =>
      child?.getDistanceToActualBaseline(baseline) ??
      super.computeDistanceToActualBaseline(baseline);

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      child?.hitTest(result, position: position) ?? false;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child case final child?) {
      context.paintChild(child, offset);
    }
  }

  bool _debugThrowIfNotCheckingIntrinsics() {
    assert(() {
      if (!RenderObject.debugCheckingIntrinsics) {
        throw FlutterError(
          "LayoutBuilder does not support returning intrinsic dimensions.\n"
          "Calculating the intrinsic dimensions would require running the layout "
          "callback speculatively, which might mutate the live render object tree.",
        );
      }
      return true;
    }());

    return true;
  }
}
