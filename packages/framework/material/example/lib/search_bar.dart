import 'dart:math' as math;

import 'package:material_example/flutter.dart';

class const SearchBarContainer({
  super.key,
  final double? height,
  final OutlinedBorder? shape,
  final Color? color,
  final double? elevation,
  final Color? shadowColor,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final color = this.color ?? colorTheme.surfaceContainer;

    return SizedBox(
      width: .infinity,
      height: height ?? 56.0,
      child: Surface(
        clipBehavior: .antiAlias,
        shape: shape ?? shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
        color: color,
        elevation: elevation ?? elevationTheme.level0,
        shadowColor: shadowColor ?? colorTheme.shadow,
        child: child,
      ),
    );
  }
}

class const SearchBarPaint({
  super.key,
  final ValueListenable<double> centerAlignmentFraction =
      kAlwaysDismissedAnimation,
  final TextDirection? textDirection,
  final double? containerHeight,
  final OutlinedBorder? containerShape,
  final Color? containerColor,
  final VoidCallback? onTap,
  final Widget? leading,
  required final Widget supportingText,
  final Widget? trailing,
}) extends StatefulWidget {
  @override
  State<SearchBarPaint> createState() => _SearchBarPaintState();
}

class _SearchBarPaintState extends State<SearchBarPaint> {
  late FocusNode _tapRegionFocusNode;
  late FocusNode _textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _tapRegionFocusNode = FocusNode();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _tapRegionFocusNode.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final containerHeight = widget.containerHeight ?? 56.0;

    final inputTextStyle = defaultTextStyle.merge(
      typescaleTheme.bodyLarge.toTextStyle(color: colorTheme.onSurface),
    );
    final inputTextLineHeight =
        (inputTextStyle.fontSize ?? 0.0) * (inputTextStyle.height ?? 0.0);

    return SearchBarContainer(
      height: containerHeight,
      shape: widget.containerShape,
      color: widget.containerColor,
      child: _SearchBarLayout(
        centerAlignmentFraction: widget.centerAlignmentFraction,
        textDirection: widget.textDirection,
        tapRegion: InkWell(
          overlayColor: WidgetStateLayerColor(
            // TODO: tokens say onSurface, but might it be onSurfaceVariant?
            color: .all(colorTheme.onSurface),
            opacity: stateTheme.asWidgetStateLayerOpacity,
          ),
          focusNode: _tapRegionFocusNode,
          onTap: widget.onTap,
        ),
        supportingText: DefaultTextStyle(
          textAlign: .start,
          softWrap: false,
          maxLines: 1,
          overflow: .ellipsis,
          style: typescaleTheme.bodyLarge.toTextStyle(
            color: colorTheme.onSurfaceVariant,
          ),
          child: widget.supportingText,
        ),
        textField: TextField(
          focusNode: _textFieldFocusNode,
          clipBehavior: .hardEdge,
          maxLines: 1,
          style: inputTextStyle,
          textAlign: .start,
          textAlignVertical: .center,
          textInputAction: .search,
          textCapitalization: .none,
          keyboardType: .text,
          decoration: InputDecoration(
            hintText: null,
            border: .none,
            constraints: BoxConstraints(
              minWidth: .infinity,
              maxWidth: .infinity,
              minHeight: containerHeight,
              maxHeight: containerHeight,
            ),
            contentPadding: .symmetric(
              vertical: (containerHeight - inputTextLineHeight) / 2.0,
            ),
          ),
        ),
        leading: widget.leading,
        trailing: widget.trailing,
      ),
    );
  }
}

enum _SearchBarLayoutSlot {
  tapRegion,
  supportingText,
  textField,
  leading,
  trailing,
}

class const _SearchBarLayout({
  final ValueListenable<double> centerAlignmentFraction =
      kAlwaysDismissedAnimation,
  final TextDirection? textDirection,
  final Widget? tapRegion,
  final Widget? supportingText,
  final Widget? textField,
  final Widget? leading,
  final Widget? trailing,
}) extends
    SlottedMultiChildRenderObjectWidget<_SearchBarLayoutSlot, RenderBox> {
  @override
  Iterable<_SearchBarLayoutSlot> get slots => _SearchBarLayoutSlot.values;

  @override
  Widget? childForSlot(_SearchBarLayoutSlot slot) => switch (slot) {
    .tapRegion => tapRegion,
    .supportingText => supportingText,
    .textField => textField,
    .leading => leading,
    .trailing => trailing,
  };

  @override
  _RenderSearchBarLayout createRenderObject(BuildContext context) =>
      _RenderSearchBarLayout(
        centerAlignmentFraction: centerAlignmentFraction,
        textDirection: textDirection ?? Directionality.maybeOf(context) ?? .ltr,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSearchBarLayout renderObject,
  ) {
    renderObject
      ..centerAlignmentFraction = centerAlignmentFraction
      ..textDirection =
          textDirection ?? Directionality.maybeOf(context) ?? .ltr;
  }
}

class _RenderSearchBarLayout({
  required var ValueListenable<double> _centerAlignmentFraction,
  required var TextDirection _textDirection,
}) extends RenderBox
    with SlottedContainerRenderObjectMixin<_SearchBarLayoutSlot, RenderBox> {
  ValueListenable<double> get centerAlignmentFraction =>
      _centerAlignmentFraction;

  set centerAlignmentFraction(ValueListenable<double> value) {
    if (_centerAlignmentFraction == value) return;
    if (attached) {
      _centerAlignmentFraction.removeListener(markNeedsLayout);
      value.addListener(markNeedsLayout);
    }
    _centerAlignmentFraction = value;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;

  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  RenderBox? get _tapRegion => childForSlot(.tapRegion);
  RenderBox? get _supportingText => childForSlot(.supportingText);
  RenderBox? get _textField => childForSlot(.textField);
  RenderBox? get _leading => childForSlot(.leading);
  RenderBox? get _trailing => childForSlot(.trailing);

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    centerAlignmentFraction.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    super.detach();
    centerAlignmentFraction.removeListener(markNeedsLayout);
  }

  Size _layout(BoxChildLayoutStrategy strategy, BoxConstraints constraints) {
    assert(constraints.isTight);
    final size = constraints.biggest;
    final looseConstraints = constraints.loosen();

    final tapRegion = _tapRegion;
    final supportingText = _supportingText;
    final textField = _textField;
    final leading = _leading;
    final trailing = _trailing;

    if (tapRegion != null) {
      strategy
        ..layoutChild(tapRegion, constraints)
        ..positionChild(tapRegion, .zero);
    }

    Size leadingSize = .zero;
    if (leading != null) {
      leadingSize = strategy.layoutChildForSize(leading, looseConstraints);
      final leadingOffset = Offset(
        0.0,
        (size.height - leadingSize.height) / 2.0,
      );
      strategy.positionChild(leading, leadingOffset);
    }

    Size trailingSize = .zero;
    if (trailing != null) {
      trailingSize = strategy.layoutChildForSize(trailing, looseConstraints);
      final trailingOffset = Offset(
        size.width - trailingSize.width,
        (size.height - trailingSize.height) / 2.0,
      );
      strategy.positionChild(trailing, trailingOffset);
    }

    final horizontalSpace = math.max(leadingSize.width, trailingSize.width);
    final maxContentWidth = math.max(size.width - horizontalSpace * 2.0, 0.0);

    Size supportingTextSize = .zero;
    var supportingTextOffset = Offset(horizontalSpace, 0.0);
    if (supportingText != null) {
      final supportingTextConstraints = BoxConstraints(
        minWidth: 0.0,
        maxWidth: maxContentWidth,
        minHeight: 0.0,
        maxHeight: size.height,
      );
      supportingTextSize = strategy.layoutChildForSize(
        supportingText,
        supportingTextConstraints,
      );
      supportingTextOffset = Offset(
        lerpDouble(
          leadingSize.width,
          (size.width - supportingTextSize.width) / 2.0,
          centerAlignmentFraction.value,
        ),
        (size.height - supportingTextSize.height) / 2.0,
      );
      strategy.positionChild(supportingText, supportingTextOffset);
    }

    if (textField != null) {
      final textFieldSize = Size(
        math.max(size.width - horizontalSpace - supportingTextOffset.dx, 0.0),
        size.height,
      );
      strategy.layoutChild(textField, BoxConstraints.tight(textFieldSize));
      final textFieldOffset = Offset(supportingTextOffset.dx, 0.0);
      strategy.positionChild(textField, textFieldOffset);
    }

    return size;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _layout(.dry, constraints);

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void performLayout() {
    _layout(.wet, constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void paintChild(RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    paintChild(_tapRegion);
    paintChild(_supportingText);
    paintChild(_textField);
    paintChild(_leading);
    paintChild(_trailing);
  }

  // @override
  // bool hitTest(BoxHitTestResult result, {required Offset position}) {
  //   if (super.hitTest(result, position: position)) {
  //     return true;
  //   }
  //   final Offset center = child!.size.center(Offset.zero);
  //   return result.addWithRawTransform(
  //     transform: MatrixUtils.forceToPoint(center),
  //     position: center,
  //     hitTest: (BoxHitTestResult result, Offset position) {
  //       assert(position == center);
  //       return child!.hitTest(result, position: center);
  //     },
  //   );
  // }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    bool hitTestChild(RenderBox? child) {
      if (child == null) return false;
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

    return hitTestChild(_leading) ||
        hitTestChild(_trailing) ||
        hitTestChild(_textField) ||
        hitTestChild(_tapRegion);
  }
}
