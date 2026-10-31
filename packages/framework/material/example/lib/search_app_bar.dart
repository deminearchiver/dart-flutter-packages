import 'dart:math' as math;

import 'package:material_example/flutter.dart';

// TODO: make use of this
enum SearchAppBarLayoutBehavior { preferCentered, preferFlexible }

class const SearchAppBarRowLayout({
  super.key,
  final SearchAppBarLayoutBehavior behavior = .preferCentered,
  final double minimumCenteredWidth = 312.0,
  final double centeredWidthFraction = 0.5,
  final TextDirection? textDirection,
  final Widget? leading,
  required final Widget searchBar,
  final Widget? trailing,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _SearchAppBarRowLayout(
    behavior: behavior,
    minimumCenteredWidth: minimumCenteredWidth,
    centeredWidthFraction: centeredWidthFraction,
    textDirection: textDirection,
    leading: leading,
    searchBar: searchBar,
    trailing: trailing,
  );
}

enum _SearchAppBarRowLayoutSlot { leading, searchBar, trailing }

class const _SearchAppBarRowLayout({
  required final SearchAppBarLayoutBehavior behavior,
  required final double minimumCenteredWidth,
  required final double centeredWidthFraction,
  final TextDirection? textDirection,
  final Widget? leading,
  required final Widget searchBar,
  final Widget? trailing,
}) extends
    SlottedMultiChildRenderObjectWidget<_SearchAppBarRowLayoutSlot, RenderBox> {
  @override
  Iterable<_SearchAppBarRowLayoutSlot> get slots =>
      _SearchAppBarRowLayoutSlot.values;

  @override
  Widget? childForSlot(_SearchAppBarRowLayoutSlot slot) => switch (slot) {
    .leading => leading,
    .searchBar => searchBar,
    .trailing => trailing,
  };

  @override
  _RenderSearchAppBarRowLayout createRenderObject(BuildContext context) => .new(
    behavior: behavior,
    minimumCenteredWidth: minimumCenteredWidth,
    centeredWidthFraction: centeredWidthFraction,
    textDirection: textDirection ?? Directionality.maybeOf(context),
  );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSearchAppBarRowLayout renderObject,
  ) {
    renderObject
      ..behavior = behavior
      ..minimumCenteredWidth = minimumCenteredWidth
      ..centeredWidthFraction = centeredWidthFraction
      ..textDirection = textDirection ?? Directionality.maybeOf(context);
  }
}

enum _SearchAppBarFlexibleSpaceType { flexible, centered }

class _RenderSearchAppBarRowLayout({
  required var SearchAppBarLayoutBehavior _behavior,
  required var double _minimumCenteredWidth,
  required var double _centeredWidthFraction,
  var TextDirection? _textDirection,
}) extends RenderBox
    with
        SlottedContainerRenderObjectMixin<
          _SearchAppBarRowLayoutSlot,
          RenderBox
        > {
  SearchAppBarLayoutBehavior get behavior => _behavior;
  set behavior(SearchAppBarLayoutBehavior value) {
    if (_behavior == value) return;
    _behavior = value;
    markNeedsLayout();
  }

  double get minimumCenteredWidth => _minimumCenteredWidth;
  set minimumCenteredWidth(double value) {
    if (_minimumCenteredWidth == value) return;
    _minimumCenteredWidth = value;
    markNeedsLayout();
  }

  double get centeredWidthFraction => _centeredWidthFraction;
  set centeredWidthFraction(double value) {
    if (_centeredWidthFraction == value) return;
    _centeredWidthFraction = value;
    markNeedsLayout();
  }

  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  Size _layout(BoxChildLayoutStrategy strategy, BoxConstraints constraints) {
    final minimumCenteredWidth = this.minimumCenteredWidth;
    final centeredWidthFraction = this.centeredWidthFraction;
    final textDirection = this.textDirection ?? .ltr;
    final leading = childForSlot(.leading);
    final searchBar = childForSlot(.searchBar);
    final trailing = childForSlot(.trailing);

    assert(constraints.hasTightWidth);
    final width = constraints.maxWidth;
    final minHeight = constraints.minHeight;
    final maxHeight = constraints.maxHeight;
    var height = minHeight;

    final Size leadingSize;
    if (leading != null) {
      final leadingConstraints = BoxConstraints(
        maxWidth: width,
        maxHeight: maxHeight,
      );
      leadingSize = strategy.layoutChildForSize(leading, leadingConstraints);
      if (leadingSize.height > height) height = leadingSize.height;
    } else {
      leadingSize = .zero;
    }

    final Size trailingSize;
    if (trailing != null) {
      final trailingConstraints = BoxConstraints(
        maxWidth: width - leadingSize.width,
        maxHeight: maxHeight,
      );
      trailingSize = strategy.layoutChildForSize(trailing, trailingConstraints);
      if (trailingSize.height > height) height = trailingSize.height;
    } else {
      trailingSize = .zero;
    }

    final Size searchBarSize;
    late final _SearchAppBarFlexibleSpaceType flexibleSpaceType;
    if (searchBar != null) {
      final flexibleSpaceWidth = width - leadingSize.width - trailingSize.width;
      final centeredSpaceWidth =
          width - 2.0 * math.max(leadingSize.width, trailingSize.width);
      flexibleSpaceType = centeredSpaceWidth > minimumCenteredWidth
          ? .centered
          : .flexible;
      final searchBarWidth = switch (flexibleSpaceType) {
        .flexible => math.min(minimumCenteredWidth, flexibleSpaceWidth),
        .centered => math.max(
          minimumCenteredWidth,
          centeredSpaceWidth * centeredWidthFraction,
        ),
      };

      final searchBarConstraints = BoxConstraints(
        minWidth: searchBarWidth,
        maxWidth: searchBarWidth,
        maxHeight: maxHeight,
      );
      searchBarSize = strategy.layoutChildForSize(
        searchBar,
        searchBarConstraints,
      );
      if (searchBarSize.height > height) height = searchBarSize.height;
    } else {
      searchBarSize = .zero;
    }

    if (strategy.affectsLayoutState) {
      if (leading != null) {
        final leadingPosition = Offset(switch (textDirection) {
          .ltr => 0.0,
          .rtl => width - leadingSize.width,
        }, (height - leadingSize.height) / 2.0);
        strategy.positionChild(leading, leadingPosition);
      }
      if (trailing != null) {
        final trailingPosition = Offset(switch (textDirection) {
          .ltr => width - trailingSize.width,
          .rtl => 0.0,
        }, (height - trailingSize.height) / 2.0);
        strategy.positionChild(trailing, trailingPosition);
      }
      if (searchBar != null) {
        final searchBarPosition = Offset(switch (textDirection) {
          .ltr => switch (flexibleSpaceType) {
            .flexible =>
              leadingSize.width >= trailingSize.width
                  ? leadingSize.width
                  : width - trailingSize.width - searchBarSize.width,
            .centered => (width - searchBarSize.width) / 2.0,
          },
          .rtl => switch (flexibleSpaceType) {
            .flexible =>
              trailingSize.width >= leadingSize.width
                  ? trailingSize.width
                  : width - leadingSize.width - searchBarSize.width,
            .centered => (width - searchBarSize.width) / 2.0,
          },
        }, (height - searchBarSize.height) / 2.0);
        strategy.positionChild(searchBar, searchBarPosition);
      }
    }

    return .new(width, height);
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _layout(.dry, constraints);

  @override
  void performLayout() {
    size = _layout(.wet, constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void paintChild(PaintingContext context, RenderBox? child) {
      if (child != null) {
        final childParentData = child.parentData! as BoxParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
    }

    paintChild(context, childForSlot(.searchBar));
    paintChild(context, childForSlot(.trailing));
    paintChild(context, childForSlot(.leading));
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
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

    return hitTestChild(childForSlot(.leading)) ||
        hitTestChild(childForSlot(.trailing)) ||
        hitTestChild(childForSlot(.searchBar));
  }
}
