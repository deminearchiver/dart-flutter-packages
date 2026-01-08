import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

mixin ProxyConstraints<T extends ProxyConstraints<T>> implements Constraints {
  @protected
  Constraints get parentConstraints;

  @protected
  T withParentConstraints(covariant Constraints constraints);

  @override
  bool get isTight => parentConstraints.isTight;

  @override
  bool get isNormalized => parentConstraints.isNormalized;

  @override
  bool debugAssertIsValid({
    bool isAppliedConstraint = false,
    InformationCollector? informationCollector,
  }) => parentConstraints.debugAssertIsValid(
    isAppliedConstraint: isAppliedConstraint,
    informationCollector: informationCollector,
  );
}

mixin ProxyBoxConstraints<T extends ProxyBoxConstraints<T>>
    on ProxyConstraints<T>
    implements BoxConstraints {
  @override
  @protected
  BoxConstraints get parentConstraints;

  @override
  @protected
  T withParentConstraints(covariant BoxConstraints constraints);

  @override
  T operator %(double value) => withParentConstraints(parentConstraints);

  @override
  T operator *(double factor) =>
      withParentConstraints(parentConstraints * factor);

  @override
  T operator /(double factor) =>
      withParentConstraints(parentConstraints / factor);

  @override
  Size get biggest => parentConstraints.biggest;

  @override
  Size constrain(Size size) => parentConstraints.constrain(size);

  @override
  Size constrainDimensions(double width, double height) =>
      parentConstraints.constrainDimensions(width, height);

  @override
  double constrainHeight([double height = double.infinity]) =>
      parentConstraints.constrainHeight(height);

  @override
  Size constrainSizeAndAttemptToPreserveAspectRatio(Size size) =>
      parentConstraints.constrainSizeAndAttemptToPreserveAspectRatio(size);

  @override
  double constrainWidth([double width = double.infinity]) =>
      parentConstraints.constrainWidth(width);

  @override
  BoxConstraints copyWith({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) => withParentConstraints(
    parentConstraints.copyWith(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    ),
  );

  @override
  T deflate(EdgeInsetsGeometry edges) =>
      withParentConstraints(parentConstraints.deflate(edges));

  @override
  T enforce(BoxConstraints constraints) =>
      withParentConstraints(parentConstraints.enforce(constraints));

  @override
  T get flipped => withParentConstraints(parentConstraints.flipped);

  @override
  bool get hasBoundedHeight => parentConstraints.hasBoundedHeight;

  @override
  bool get hasBoundedWidth => parentConstraints.hasBoundedWidth;

  @override
  bool get hasInfiniteHeight => parentConstraints.hasInfiniteHeight;

  @override
  bool get hasInfiniteWidth => parentConstraints.hasInfiniteWidth;

  @override
  bool get hasTightHeight => parentConstraints.hasTightHeight;

  @override
  bool get hasTightWidth => parentConstraints.hasTightWidth;

  @override
  T heightConstraints() =>
      withParentConstraints(parentConstraints.heightConstraints());

  @override
  bool isSatisfiedBy(Size size) => parentConstraints.isSatisfiedBy(size);

  @override
  T loosen() => withParentConstraints(parentConstraints.loosen());

  @override
  double get maxHeight => parentConstraints.maxHeight;

  @override
  double get maxWidth => parentConstraints.maxWidth;

  @override
  double get minHeight => parentConstraints.minHeight;

  @override
  double get minWidth => parentConstraints.minWidth;

  @override
  T normalize() => withParentConstraints(parentConstraints.normalize());

  @override
  Size get smallest => parentConstraints.smallest;

  @override
  T tighten({double? width, double? height}) => withParentConstraints(
    parentConstraints.tighten(width: width, height: height),
  );

  @override
  T widthConstraints() =>
      withParentConstraints(parentConstraints.widthConstraints());

  @override
  T operator ~/(double factor) =>
      withParentConstraints(parentConstraints ~/ factor);
}

mixin ProxySliverConstraints<T extends ProxySliverConstraints<T>>
    on ProxyConstraints<T>
    implements SliverConstraints {
  @override
  @protected
  SliverConstraints get parentConstraints;

  @override
  @protected
  T withParentConstraints(covariant SliverConstraints constraints);

  @override
  BoxConstraints asBoxConstraints({
    double minExtent = 0.0,
    double maxExtent = double.infinity,
    double? crossAxisExtent,
  });

  @override
  Axis get axis => parentConstraints.axis;

  @override
  AxisDirection get axisDirection => parentConstraints.axisDirection;

  @override
  double get cacheOrigin => parentConstraints.cacheOrigin;

  @override
  SliverConstraints copyWith({
    AxisDirection? axisDirection,
    GrowthDirection? growthDirection,
    ScrollDirection? userScrollDirection,
    double? scrollOffset,
    double? precedingScrollExtent,
    double? overlap,
    double? remainingPaintExtent,
    double? crossAxisExtent,
    AxisDirection? crossAxisDirection,
    double? viewportMainAxisExtent,
    double? remainingCacheExtent,
    double? cacheOrigin,
  }) => withParentConstraints(
    parentConstraints.copyWith(
      axisDirection: axisDirection,
      growthDirection: growthDirection,
      userScrollDirection: userScrollDirection,
      scrollOffset: scrollOffset,
      precedingScrollExtent: precedingScrollExtent,
      overlap: overlap,
      remainingPaintExtent: remainingPaintExtent,
      crossAxisExtent: crossAxisExtent,
      crossAxisDirection: crossAxisDirection,
      viewportMainAxisExtent: viewportMainAxisExtent,
      remainingCacheExtent: remainingCacheExtent,
      cacheOrigin: cacheOrigin,
    ),
  );

  @override
  AxisDirection get crossAxisDirection => throw UnimplementedError();

  @override
  double get crossAxisExtent => throw UnimplementedError();

  @override
  GrowthDirection get growthDirection => parentConstraints.growthDirection;

  @override
  GrowthDirection get normalizedGrowthDirection =>
      parentConstraints.normalizedGrowthDirection;

  @override
  double get overlap => parentConstraints.overlap;

  @override
  double get precedingScrollExtent => parentConstraints.precedingScrollExtent;

  @override
  double get remainingCacheExtent => parentConstraints.remainingCacheExtent;

  @override
  double get remainingPaintExtent => parentConstraints.remainingPaintExtent;

  @override
  double get scrollOffset => parentConstraints.scrollOffset;

  @override
  ScrollDirection get userScrollDirection =>
      parentConstraints.userScrollDirection;

  @override
  double get viewportMainAxisExtent => parentConstraints.viewportMainAxisExtent;
}
