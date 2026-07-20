part of 'corners_border.dart';

abstract class BorderRect {
  const BorderRect();

  const factory BorderRect.fromRRect(RRect value) = _BorderRectFromRRect;

  const factory BorderRect.fromRSuperellipse(RSuperellipse value) =
      _BorderRectFromRSuperellipse;

  const factory BorderRect.fromLTRBAndRadii(
    double left,
    double top,
    double right,
    double bottom, {
    Radius topLeft,
    Radius topRight,
    Radius bottomLeft,
    Radius bottomRight,
  }) = _BorderRectFromRadii.fromLTRB;

  const factory BorderRect.fromLTRBAndRadiiXY(
    double left,
    double top,
    double right,
    double bottom, {
    double topLeftX,
    double topLeftY,
    double topRightX,
    double topRightY,
    double bottomLeftX,
    double bottomLeftY,
    double bottomRightX,
    double bottomRightY,
  }) = _BorderRectFromRadiiXY.fromLTRB;

  double get left;
  double get top;
  double get right;
  double get bottom;

  Radius get topLeft;
  double get topLeftX;
  double get topLeftY;

  Radius get topRight;
  double get topRightX;
  double get topRightY;

  Radius get bottomLeft;
  double get bottomLeftX;
  double get bottomLeftY;

  Radius get bottomRight;
  double get bottomRightX;
  double get bottomRightY;

  double get width => right - left;

  double get height => bottom - top;

  double get shortestSide => math.min(width.abs(), height.abs());

  double get longestSide => math.max(width.abs(), height.abs());

  Rect get outerRect => .fromLTRB(left, top, right, bottom);

  Offset get center => .new(left + width / 2.0, top + height / 2.0);

  bool get isEmpty => left >= right || top >= bottom;

  bool get isFinite =>
      left.isFinite && top.isFinite && right.isFinite && bottom.isFinite;

  bool get hasNaN =>
      left.isNaN ||
      top.isNaN ||
      right.isNaN ||
      bottom.isNaN ||
      topLeftX.isNaN ||
      topLeftY.isNaN ||
      topRightX.isNaN ||
      topRightY.isNaN ||
      bottomLeftX.isNaN ||
      bottomLeftY.isNaN ||
      bottomRightX.isNaN ||
      bottomRightY.isNaN;

  bool get isRect =>
      (topLeftX == 0.0 || topLeftY == 0.0) &&
      (topRightX == 0.0 || topRightY == 0.0) &&
      (bottomLeftX == 0.0 || bottomLeftY == 0.0) &&
      (bottomRightX == 0.0 || bottomRightY == 0.0);

  bool get isStadium =>
      topLeftX == topRightX &&
      topLeftY == topRightY &&
      topRightX == bottomRightX &&
      topRightY == bottomRightY &&
      bottomRightX == bottomLeftX &&
      bottomRightY == bottomLeftY &&
      (width <= 2.0 * topLeftX || height <= 2.0 * topLeftY);

  bool get isEllipse =>
      topLeftX == topRightX &&
      topLeftY == topRightY &&
      topRightX == bottomRightX &&
      topRightY == bottomRightY &&
      bottomRightX == bottomLeftX &&
      bottomRightY == bottomLeftY &&
      width <= 2.0 * topLeftX &&
      height <= 2.0 * topLeftY;

  bool get isCircle => width == height && isEllipse;

  BorderRect shift(Offset offset) => _BorderRectFromRadiiXY(
    left: left + offset.dx,
    top: top + offset.dy,
    right: right + offset.dx,
    bottom: bottom + offset.dy,
    topLeftX: topLeftX,
    topLeftY: topLeftY,
    topRightX: topRightX,
    topRightY: topRightY,
    bottomLeftX: bottomLeftX,
    bottomLeftY: bottomLeftY,
    bottomRightX: bottomRightX,
    bottomRightY: bottomRightY,
  );

  BorderRect scale(double factor) => _BorderRectFromRadiiXY(
    left: left * factor,
    top: top * factor,
    right: right * factor,
    bottom: bottom * factor,
    topLeftX: math.max(0.0, topLeftX * factor),
    topLeftY: math.max(0.0, topLeftY * factor),
    topRightX: math.max(0.0, topRightX * factor),
    topRightY: math.max(0.0, topRightY * factor),
    bottomLeftX: math.max(0.0, bottomLeftX * factor),
    bottomLeftY: math.max(0.0, bottomLeftY * factor),
    bottomRightX: math.max(0.0, bottomRightX * factor),
    bottomRightY: math.max(0.0, bottomRightY * factor),
  );

  double _getMin(double min, double radius1, double radius2, double limit) {
    final sum = radius1 + radius2;
    return sum > limit && sum != 0.0 ? math.min(min, limit / sum) : min;
  }

  BorderRect scaleRadii() {
    var scale = 1.0;
    scale = _getMin(scale, bottomLeftY, topLeftY, height);
    scale = _getMin(scale, topLeftX, topRightX, width);
    scale = _getMin(scale, topRightY, bottomRightY, height);
    scale = _getMin(scale, bottomRightX, bottomLeftX, width);
    assert(scale >= 0.0);
    return scale < 1.0
        ? _BorderRectFromRadiiXY(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
            topLeftX: topLeftX * scale,
            topLeftY: topLeftY * scale,
            topRightX: topRightX * scale,
            topRightY: topRightY * scale,
            bottomLeftX: bottomLeftX * scale,
            bottomLeftY: bottomLeftY * scale,
            bottomRightX: bottomRightX * scale,
            bottomRightY: bottomRightY * scale,
          )
        : _BorderRectFromRadiiXY(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
            topLeftX: topLeftX,
            topLeftY: topLeftY,
            topRightX: topRightX,
            topRightY: topRightY,
            bottomLeftX: bottomLeftX,
            bottomLeftY: bottomLeftY,
            bottomRightX: bottomRightX,
            bottomRightY: bottomRightY,
          );
  }

  BorderRadius toBorderRadius() => .only(
    topLeft: topLeft,
    topRight: topRight,
    bottomLeft: bottomLeft,
    bottomRight: bottomRight,
  );

  Corners toCorners() => .only(
    topLeft: .fromRadius(topLeft),
    topRight: .fromRadius(topRight),
    bottomLeft: .fromRadius(bottomLeft),
    bottomRight: .fromRadius(bottomRight),
  );

  RRect toRRect() => .fromLTRBAndCorners(
    left,
    top,
    right,
    bottom,
    topLeft: .elliptical(topLeftX, topLeftY),
    topRight: .elliptical(topRightX, topRightY),
    bottomLeft: .elliptical(bottomLeftX, bottomLeftY),
    bottomRight: .elliptical(bottomRightX, bottomRightY),
  );

  RSuperellipse toRSuperellipse() => .fromLTRBAndCorners(
    left,
    top,
    right,
    bottom,
    topLeft: .elliptical(topLeftX, topLeftY),
    topRight: .elliptical(topRightX, topRightY),
    bottomLeft: .elliptical(bottomLeftX, bottomLeftY),
    bottomRight: .elliptical(bottomRightX, bottomRightY),
  );

  @override
  String toString() {
    final rect =
        "${left.toStringAsFixed(1)}, "
        "${top.toStringAsFixed(1)}, "
        "${right.toStringAsFixed(1)}, "
        "${bottom.toStringAsFixed(1)}";
    if (topLeftX == topRightX &&
        topLeftY == topRightY &&
        topRightX == bottomRightX &&
        topRightY == bottomRightY &&
        bottomRightX == bottomLeftX &&
        bottomRightY == bottomLeftY) {
      if (topLeftX == topLeftY) {
        return "RadiiRect.fromLTRBR("
            "$rect, "
            "${topLeftX.toStringAsFixed(1)}"
            ")";
      }
      return "RadiiRect.fromLTRBXY("
          "$rect, "
          "${topLeftX.toStringAsFixed(1)}, "
          "${topLeft.y.toStringAsFixed(1)}"
          ")";
    }
    return "RadiiRect.fromLTRBAndCorners("
        "$rect, "
        "topLeft: (${topLeftX.toStringAsFixed(1)}, ${topLeftY.toStringAsFixed(1)}), "
        "topRight: (${topRightX.toStringAsFixed(1)}, ${topRightY.toStringAsFixed(1)}), "
        "bottomLeft: (${bottomLeftX.toStringAsFixed(1)}, ${bottomLeftY.toStringAsFixed(1)}), "
        "bottomRight: (${bottomRightX.toStringAsFixed(1)}, ${bottomRightY.toStringAsFixed(1)})"
        ")";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderRect &&
          left == other.left &&
          top == other.top &&
          right == other.right &&
          bottom == other.bottom &&
          topLeftX == other.topLeftX &&
          topLeftY == other.topLeftY &&
          topRightX == other.topRightX &&
          topRightY == other.topRightY &&
          bottomLeftX == other.bottomLeftX &&
          bottomLeftY == other.bottomLeftY &&
          bottomRightX == other.bottomRightX &&
          bottomRightY == other.bottomRightY;

  @override
  int get hashCode => Object.hash(
    left,
    top,
    right,
    bottom,
    topLeftX,
    topLeftY,
    topRightX,
    topRightY,
    bottomLeftX,
    bottomLeftY,
    bottomRightX,
    bottomRightY,
  );

  static const BorderRect zero = _BorderRectFromRadiiXY();

  static BorderRect? lerp(BorderRect? a, BorderRect? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    return _BorderRectFromRadiiXY(
      left: lerpDouble(a.left, b.left, t),
      top: lerpDouble(a.top, b.top, t),
      right: lerpDouble(a.right, b.right, t),
      bottom: lerpDouble(a.bottom, b.bottom, t),
      topLeftX: math.max(0.0, lerpDouble(a.topLeftX, b.topLeftX, t)),
      topLeftY: math.max(0.0, lerpDouble(a.topLeftY, b.topLeftY, t)),
      topRightX: math.max(0.0, lerpDouble(a.topRightX, b.topRightX, t)),
      topRightY: math.max(0.0, lerpDouble(a.topRightY, b.topRightY, t)),
      bottomLeftX: math.max(0.0, lerpDouble(a.bottomLeftX, b.bottomLeftX, t)),
      bottomLeftY: math.max(0.0, lerpDouble(a.bottomLeftY, b.bottomLeftY, t)),
      bottomRightX: math.max(
        0.0,
        lerpDouble(a.bottomRightX, b.bottomRightX, t),
      ),
      bottomRightY: math.max(
        0.0,
        lerpDouble(a.bottomRightY, b.bottomRightY, t),
      ),
    );
  }
}

final class _BorderRectFromRadiiXY extends BorderRect {
  const _BorderRectFromRadiiXY({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
    this.topLeftX = 0.0,
    this.topLeftY = 0.0,
    this.topRightX = 0.0,
    this.topRightY = 0.0,
    this.bottomLeftX = 0.0,
    this.bottomLeftY = 0.0,
    this.bottomRightX = 0.0,
    this.bottomRightY = 0.0,
  });

  const _BorderRectFromRadiiXY.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.topLeftX = 0.0,
    this.topLeftY = 0.0,
    this.topRightX = 0.0,
    this.topRightY = 0.0,
    this.bottomLeftX = 0.0,
    this.bottomLeftY = 0.0,
    this.bottomRightX = 0.0,
    this.bottomRightY = 0.0,
  });

  @override
  final double left;

  @override
  final double top;

  @override
  final double right;

  @override
  final double bottom;

  @override
  final double topLeftX;

  @override
  final double topLeftY;

  @override
  final double topRightX;

  @override
  final double topRightY;

  @override
  final double bottomLeftX;

  @override
  final double bottomLeftY;

  @override
  final double bottomRightX;

  @override
  final double bottomRightY;

  @override
  Radius get topLeft => .elliptical(topLeftX, topLeftY);

  @override
  Radius get topRight => .elliptical(topRightX, topRightY);

  @override
  Radius get bottomLeft => .elliptical(bottomLeftX, bottomLeftY);

  @override
  Radius get bottomRight => .elliptical(bottomRightX, bottomRightY);
}

final class _BorderRectFromRadii extends BorderRect {
  const _BorderRectFromRadii({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
    this.topLeft = .zero,
    this.topRight = .zero,
    this.bottomLeft = .zero,
    this.bottomRight = .zero,
  });

  const _BorderRectFromRadii.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.topLeft = .zero,
    this.topRight = .zero,
    this.bottomLeft = .zero,
    this.bottomRight = .zero,
  });

  @override
  final double left;

  @override
  final double top;

  @override
  final double right;

  @override
  final double bottom;

  @override
  final Radius topLeft;

  @override
  final Radius topRight;

  @override
  final Radius bottomLeft;

  @override
  final Radius bottomRight;

  @override
  double get topLeftX => topLeft.x;

  @override
  double get topLeftY => topLeft.y;

  @override
  double get topRightX => topRight.x;

  @override
  double get topRightY => topRight.y;

  @override
  double get bottomLeftX => bottomLeft.x;

  @override
  double get bottomLeftY => bottomLeft.y;

  @override
  double get bottomRightX => bottomRight.x;

  @override
  double get bottomRightY => bottomRight.y;
}

final class _BorderRectFromRRect extends BorderRect {
  const _BorderRectFromRRect(RRect value) : _value = value;

  final RRect _value;

  @override
  double get left => _value.left;

  @override
  double get top => _value.top;

  @override
  double get right => _value.right;

  @override
  double get bottom => _value.bottom;

  @override
  Radius get topLeft => _value.tlRadius;

  @override
  double get topLeftX => _value.tlRadiusX;

  @override
  double get topLeftY => _value.tlRadiusY;

  @override
  Radius get topRight => _value.trRadius;

  @override
  double get topRightX => _value.trRadiusX;

  @override
  double get topRightY => _value.trRadiusY;

  @override
  Radius get bottomLeft => _value.blRadius;

  @override
  double get bottomLeftX => _value.blRadiusX;

  @override
  double get bottomLeftY => _value.blRadiusY;

  @override
  Radius get bottomRight => _value.brRadius;

  @override
  double get bottomRightX => _value.brRadiusX;

  @override
  double get bottomRightY => _value.brRadiusY;

  @override
  RRect toRRect() => _value;
}

final class _BorderRectFromRSuperellipse extends BorderRect {
  const _BorderRectFromRSuperellipse(RSuperellipse value) : _value = value;

  final RSuperellipse _value;

  @override
  double get left => _value.left;

  @override
  double get top => _value.top;

  @override
  double get right => _value.right;

  @override
  double get bottom => _value.bottom;

  @override
  Radius get topLeft => _value.tlRadius;

  @override
  double get topLeftX => _value.tlRadiusX;

  @override
  double get topLeftY => _value.tlRadiusY;

  @override
  Radius get topRight => _value.trRadius;

  @override
  double get topRightX => _value.trRadiusX;

  @override
  double get topRightY => _value.trRadiusY;

  @override
  Radius get bottomLeft => _value.blRadius;

  @override
  double get bottomLeftX => _value.blRadiusX;

  @override
  double get bottomLeftY => _value.blRadiusY;

  @override
  Radius get bottomRight => _value.brRadius;

  @override
  double get bottomRightX => _value.brRadiusX;

  @override
  double get bottomRightY => _value.brRadiusY;

  @override
  RSuperellipse toRSuperellipse() => _value;
}

// mixin GeometryPrimitiveInflateMixin {
//   CornersGeometry inflateCorners(CornersGeometry value, double delta);

//   BorderRadius inflateBorderRadius(BorderRadius value, double delta);

//   Rect inflateRect(Rect value, double delta);

//   BorderRect inflateBorderRect(BorderRect value, double delta);

//   RRect inflateRRect(RRect value, double delta);

//   RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta);
// }

// mixin GeometryPrimitiveDeflateMixin {
//   CornersGeometry deflateCorners(CornersGeometry value, double delta);

//   BorderRadius deflateBorderRadius(BorderRadius value, double delta);

//   Rect deflateRect(Rect value, double delta);

//   BorderRect deflateBorderRect(BorderRect value, double delta);

//   RRect deflateRRect(RRect value, double delta);

//   RSuperellipse deflateRSuperellipse(RSuperellipse value, double delta);
// }

// mixin GeometryPrimitiveDeflateDefaultsMixin on GeometryPrimitiveInflateMixin
//     implements GeometryPrimitiveDeflateMixin {
//   @override
//   CornersGeometry deflateCorners(CornersGeometry value, double delta) =>
//       inflateCorners(value, -delta);

//   @override
//   BorderRadius deflateBorderRadius(BorderRadius value, double delta) =>
//       inflateBorderRadius(value, -delta);

//   @override
//   Rect deflateRect(Rect value, double delta) => inflateRect(value, -delta);

//   @override
//   BorderRect deflateBorderRect(BorderRect value, double delta) =>
//       inflateBorderRect(value, -delta);

//   @override
//   RRect deflateRRect(RRect value, double delta) => inflateRRect(value, -delta);

//   @override
//   RSuperellipse deflateRSuperellipse(RSuperellipse value, double delta) =>
//       inflateRSuperellipse(value, -delta);
// }

// mixin GeometryPrimitiveInflateDefaultsMixin on GeometryPrimitiveDeflateMixin
//     implements GeometryPrimitiveInflateMixin {
//   @override
//   CornersGeometry inflateCorners(CornersGeometry value, double delta) =>
//       deflateCorners(value, -delta);

//   @override
//   BorderRadius inflateBorderRadius(BorderRadius value, double delta) =>
//       deflateBorderRadius(value, -delta);

//   @override
//   Rect inflateRect(Rect value, double delta) => deflateRect(value, -delta);

//   @override
//   BorderRect inflateBorderRect(BorderRect value, double delta) =>
//       deflateBorderRect(value, -delta);

//   @override
//   RRect inflateRRect(RRect value, double delta) => deflateRRect(value, -delta);

//   @override
//   RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta) =>
//       deflateRSuperellipse(value, -delta);
// }

// mixin GeometryPrimitiveOffsetMixin
//     implements GeometryPrimitiveInflateMixin, GeometryPrimitiveDeflateMixin {}

// mixin GeometryPrimitiveRRectLikeDefaults
//     implements GeometryPrimitiveOffsetMixin {
//   @override
//   RRect inflateRRect(RRect value, double delta) =>
//       inflateBorderRect(.fromRRect(value), delta).toRRect();

//   @override
//   RRect deflateRRect(RRect value, double delta) =>
//       deflateBorderRect(.fromRRect(value), delta).toRRect();

//   @override
//   RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta) =>
//       inflateBorderRect(.fromRSuperellipse(value), delta).toRSuperellipse();

//   @override
//   RSuperellipse deflateRSuperellipse(RSuperellipse value, double delta) =>
//       deflateBorderRect(.fromRSuperellipse(value), delta).toRSuperellipse();
// }

mixin GeometryInflateMixin<T extends Object> {
  T inflate(T value, double delta);
}

mixin GeometryDeflateMixin<T extends Object> {
  T deflate(T value, double delta);
}

mixin GeometryOffsetMixin<T extends Object>
    implements GeometryInflateMixin<T>, GeometryDeflateMixin<T> {}

mixin GeometryDeflateDefaultsMixin<T extends Object>
    implements GeometryOffsetMixin<T> {
  @override
  T deflate(T value, double delta) => inflate(value, -delta);
}

mixin GeometryInflateDefaultsMixin<T extends Object> on GeometryDeflateMixin<T>
    implements GeometryOffsetMixin<T> {
  @override
  T inflate(T value, double delta) => deflate(value, -delta);
}

typedef GeometryOffsetCallback<T extends Object> =
    T Function(T value, double delta);

abstract class GeometryOffsetDelegate<T extends Object>
    implements GeometryOffsetMixin<T> {
  const GeometryOffsetDelegate();

  const factory GeometryOffsetDelegate.fromInflateCallback(
    GeometryOffsetCallback<T> inflate,
  ) = _GeometryOffsetDelegateFromInflateCallback;

  const factory GeometryOffsetDelegate.fromDeflateCallback(
    GeometryOffsetCallback<T> deflate,
  ) = _GeometryOffsetDelegateFromDeflateCallback;

  const factory GeometryOffsetDelegate.fromOffsetCallbacks({
    required GeometryOffsetCallback<T> inflate,
    required GeometryOffsetCallback<T> deflate,
  }) = _GeometryOffsetDelegateFromOffsetCallbacks;

  @override
  T inflate(T value, double delta);

  @override
  T deflate(T value, double delta);
}

final class _GeometryOffsetDelegateFromInflateCallback<T extends Object>
    extends GeometryOffsetDelegate<T>
    implements GeometryDeflateDefaultsMixin<T> {
  const _GeometryOffsetDelegateFromInflateCallback(
    GeometryOffsetCallback<T> inflate,
  ) : _inflate = inflate;

  final GeometryOffsetCallback<T> _inflate;

  @override
  T inflate(T value, double delta) => _inflate(value, delta);

  @override
  T deflate(T value, double delta) => _inflate(value, -delta);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _GeometryOffsetDelegateFromInflateCallback<T> &&
          _inflate == other._inflate;

  @override
  int get hashCode => _inflate.hashCode;
}

final class _GeometryOffsetDelegateFromDeflateCallback<T extends Object>
    extends GeometryOffsetDelegate<T>
    implements GeometryInflateDefaultsMixin<T> {
  const _GeometryOffsetDelegateFromDeflateCallback(
    GeometryOffsetCallback<T> deflate,
  ) : _deflate = deflate;

  final GeometryOffsetCallback<T> _deflate;

  @override
  T inflate(T value, double delta) => _deflate(value, -delta);

  @override
  T deflate(T value, double delta) => _deflate(value, delta);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _GeometryOffsetDelegateFromDeflateCallback<T> &&
          _deflate == other._deflate;

  @override
  int get hashCode => _deflate.hashCode;
}

final class _GeometryOffsetDelegateFromOffsetCallbacks<T extends Object>
    extends GeometryOffsetDelegate<T> {
  const _GeometryOffsetDelegateFromOffsetCallbacks({
    required GeometryOffsetCallback<T> inflate,
    required GeometryOffsetCallback<T> deflate,
  }) : _inflate = inflate,
       _deflate = deflate;

  final GeometryOffsetCallback<T> _inflate;
  final GeometryOffsetCallback<T> _deflate;

  @override
  T inflate(T value, double delta) => _inflate(value, delta);

  @override
  T deflate(T value, double delta) => _deflate(value, delta);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _GeometryOffsetDelegateFromOffsetCallbacks<T> &&
          _inflate == other._inflate &&
          _deflate == other._deflate;

  @override
  int get hashCode => Object.hash(_inflate, _deflate);
}

abstract class ShapeCornerFamily {
  const ShapeCornerFamily();

  GeometryOffsetDelegate<CornersGeometry> get corners;

  GeometryOffsetDelegate<BorderRadius> get borderRadius;

  GeometryOffsetDelegate<BorderRect> get borderRect;

  GeometryOffsetDelegate<RRect> get rRect;

  GeometryOffsetDelegate<RSuperellipse> get rSuperellipse;

  static const ShapeCornerFamily rounded = _RoundedShapeCornerFamily();

  static const ShapeCornerFamily smooth = _SmoothShapeCornerFamily();

  static const ShapeCornerFamily cut = _CutShapeCornerFamily();
}

mixin _RoundedShapeCornerFamilyMixin implements ShapeCornerFamily {
  @override
  GeometryOffsetDelegate<CornersGeometry> get corners =>
      const .fromInflateCallback(_inflateCorners);

  @override
  GeometryOffsetDelegate<BorderRadius> get borderRadius =>
      const .fromInflateCallback(_inflateBorderRadius);

  @override
  GeometryOffsetDelegate<BorderRect> get borderRect =>
      const .fromInflateCallback(_inflateBorderRect);

  @override
  GeometryOffsetDelegate<RRect> get rRect =>
      const .fromInflateCallback(_inflateRRect);

  @override
  GeometryOffsetDelegate<RSuperellipse> get rSuperellipse =>
      const .fromInflateCallback(_inflateRSuperellipse);

  static CornersGeometry _inflateCorners(CornersGeometry value, double delta) {
    if (delta == 0.0) return value;
    return _RoundedCornersGeometry(value, delta);
  }

  static BorderRadius _inflateBorderRadius(BorderRadius value, double delta) {
    if (delta == 0.0) return value;
    final BorderRadius(
      topLeft: Radius(x: tlX, y: tlY),
      topRight: Radius(x: trX, y: trY),
      bottomLeft: Radius(x: blX, y: blY),
      bottomRight: Radius(x: brX, y: brY),
    ) = value;
    return .only(
      topLeft: .elliptical(tlX + delta, tlY + delta),
      topRight: .elliptical(trX + delta, trY + delta),
      bottomLeft: .elliptical(blX + delta, blY + delta),
      bottomRight: .elliptical(brX + delta, brY + delta),
    );
  }

  static BorderRect _inflateBorderRect(BorderRect value, double delta) {
    if (delta == 0.0) return value;
    return .fromLTRBAndRadiiXY(
      value.left - delta,
      value.top - delta,
      value.right + delta,
      value.bottom + delta,
      topLeftX: math.max(0.0, value.topLeftX + delta),
      topLeftY: math.max(0.0, value.topLeftY + delta),
      topRightX: math.max(0.0, value.topRightX + delta),
      topRightY: math.max(0.0, value.topRightY + delta),
      bottomLeftX: math.max(0.0, value.bottomLeftX + delta),
      bottomLeftY: math.max(0.0, value.bottomLeftY + delta),
      bottomRightX: math.max(0.0, value.bottomRightX + delta),
      bottomRightY: math.max(0.0, value.bottomRightY + delta),
    );
  }

  static RRect _inflateRRect(RRect value, double delta) {
    if (delta == 0.0) return value;
    return value.inflate(delta);
  }

  static RSuperellipse _inflateRSuperellipse(
    RSuperellipse value,
    double delta,
  ) {
    if (delta == 0.0) return value;
    return value.inflate(delta);
  }
}

final class _RoundedShapeCornerFamily extends ShapeCornerFamily
    with _RoundedShapeCornerFamilyMixin {
  const _RoundedShapeCornerFamily();

  @override
  String toString() => "ShapeCornerFamily.rounded";
}

final class _SmoothShapeCornerFamily extends ShapeCornerFamily
    with _RoundedShapeCornerFamilyMixin {
  const _SmoothShapeCornerFamily();

  @override
  String toString() => "ShapeCornerFamily.smooth";
}

mixin _CutShapeCornerFamilyMixin implements ShapeCornerFamily {
  @override
  GeometryOffsetDelegate<CornersGeometry> get corners =>
      const .fromInflateCallback(_inflateCorners);

  @override
  GeometryOffsetDelegate<BorderRadius> get borderRadius =>
      const .fromInflateCallback(_inflateBorderRadius);

  @override
  GeometryOffsetDelegate<BorderRect> get borderRect =>
      const .fromInflateCallback(_inflateBorderRect);

  @override
  GeometryOffsetDelegate<RRect> get rRect =>
      const .fromInflateCallback(_inflateRRect);

  @override
  GeometryOffsetDelegate<RSuperellipse> get rSuperellipse =>
      const .fromInflateCallback(_inflateRSuperellipse);

  static CornersGeometry _inflateCorners(CornersGeometry value, double delta) {
    if (delta == 0.0) return value;
    // TODO: shouldn't this account for parallel drift?
    return _CutCornersGeometry(value, delta);
  }

  static BorderRadius _inflateBorderRadius(BorderRadius value, double delta) {
    if (delta == 0.0) return value;
    final BorderRadius(
      topLeft: Radius(x: tlX, y: tlY),
      topRight: Radius(x: trX, y: trY),
      bottomLeft: Radius(x: blX, y: blY),
      bottomRight: Radius(x: brX, y: brY),
    ) = value;
    final tlH = math.sqrt(tlX * tlX + tlY * tlY);
    final trH = math.sqrt(trX * trX + trY * trY);
    final blH = math.sqrt(blX * blX + blY * blY);
    final brH = math.sqrt(brX * brX + brY * brY);

    // TODO: shouldn't this account for parallel drift?

    return .only(
      topLeft: .elliptical(
        tlY != 0.0 ? math.max(0.0, tlX + delta * ((tlH - tlX) / tlY)) : 0.0,
        tlX != 0.0 ? math.max(0.0, tlY + delta * ((tlH - tlY) / tlX)) : 0.0,
      ),
      topRight: .elliptical(
        trY != 0.0 ? math.max(0.0, trX + delta * ((trH - trX) / trY)) : 0.0,
        trX != 0.0 ? math.max(0.0, trY + delta * ((trH - trY) / trX)) : 0.0,
      ),
      bottomLeft: .elliptical(
        blY != 0.0 ? math.max(0.0, blX + delta * ((blH - blX) / blY)) : 0.0,
        blX != 0.0 ? math.max(0.0, blY + delta * ((blH - blY) / blX)) : 0.0,
      ),
      bottomRight: .elliptical(
        brY != 0.0 ? math.max(0.0, brX + delta * ((brH - brX) / brY)) : 0.0,
        brX != 0.0 ? math.max(0.0, brY + delta * ((brH - brY) / brX)) : 0.0,
      ),
    );
  }

  static BorderRect _inflateBorderRect(BorderRect value, double delta) {
    if (delta == 0.0) return value;

    final BorderRect(
      :left,
      :top,
      :right,
      :bottom,
      :width,
      :height,
      :topLeftX,
      :topLeftY,
      :topRightX,
      :topRightY,
      :bottomLeftX,
      :bottomLeftY,
      :bottomRightX,
      :bottomRightY,
    ) = value
        .scaleRadii();

    final topLeftH = math.sqrt(topLeftX * topLeftX + topLeftY * topLeftY);
    final topRightH = math.sqrt(topRightX * topRightX + topRightY * topRightY);
    final bottomLeftH = math.sqrt(
      bottomLeftX * bottomLeftX + bottomLeftY * bottomLeftY,
    );
    final bottomRightH = math.sqrt(
      bottomRightX * bottomRightX + bottomRightY * bottomRightY,
    );

    // TODO: improve the algorithm (still not perfect)

    double rawX(double x, double y, double h) =>
        x > 0.0 || y > 0.0 ? x + delta * (2.0 * x) / (x + y + h) : 0.0;

    double rawY(double x, double y, double h) =>
        x > 0.0 || y > 0.0 ? y + delta * (2.0 * y) / (x + y + h) : 0.0;

    final topLeftRawX = rawX(topLeftX, topLeftY, topLeftH);
    final topLeftRawY = rawY(topLeftX, topLeftY, topLeftH);
    final topRightRawX = rawX(topRightX, topRightY, topRightH);
    final topRightRawY = rawY(topRightX, topRightY, topRightH);
    final bottomLeftRawX = rawX(bottomLeftX, bottomLeftY, bottomLeftH);
    final bottomLeftRawY = rawY(bottomLeftX, bottomLeftY, bottomLeftH);
    final bottomRightRawX = rawX(bottomRightX, bottomRightY, bottomRightH);
    final bottomRightRawY = rawY(bottomRightX, bottomRightY, bottomRightH);

    double computeSideShift(
      double x1,
      double y1,
      double x2,
      double y2,
      double overlap,
    ) {
      if (overlap <= 0.0) return 0.0;
      if (y1 > 0.0 && y2 > 0.0) {
        final denominator = x1 * y2 + x2 * y1;
        return denominator != 0.0 ? (x1 * x2 * overlap) / denominator : 0.0;
      } else if (y1 > 0.0) {
        return x1 * overlap / y1;
      } else if (y2 > 0.0) {
        return x2 * overlap / y2;
      }
      return 0.0;
    }

    final inflatedWidth = width + 2.0 * delta;
    final inflatedHeight = height + 2.0 * delta;

    final leftShift = computeSideShift(
      topLeftX,
      topLeftY,
      bottomLeftX,
      bottomLeftY,
      topLeftRawY + bottomLeftRawY - inflatedHeight,
    );
    final topShift = computeSideShift(
      topLeftY,
      topLeftX,
      topRightY,
      topRightX,
      topLeftRawX + topRightRawX - inflatedWidth,
    );
    final rightShift = computeSideShift(
      topRightX,
      topRightY,
      bottomRightX,
      bottomRightY,
      topRightRawY + bottomRightRawY - inflatedHeight,
    );
    final bottomShift = computeSideShift(
      bottomLeftY,
      bottomLeftX,
      bottomRightY,
      bottomRightX,
      bottomLeftRawX + bottomRightRawX - inflatedWidth,
    );

    final deltaLeft = delta - leftShift;
    final deltaTop = delta - topShift;
    final deltaRight = delta - rightShift;
    final deltaBottom = delta - bottomShift;

    double trimRadiusX(
      double rawX,
      double originalX,
      double originalY,
      double shiftX,
      double shiftY,
    ) => originalX > 0.0 && originalY > 0.0
        ? math.max(0.0, rawX - shiftX - shiftY * (originalX / originalY))
        : 0.0;

    double trimRadiusY(
      double rawY,
      double originalX,
      double originalY,
      double shiftX,
      double shiftY,
    ) => originalX > 0.0 && originalY > 0.0
        ? math.max(0.0, rawY - shiftY - shiftX * (originalY / originalX))
        : 0.0;

    return .fromLTRBAndRadiiXY(
      left - deltaLeft,
      top - deltaTop,
      right + deltaRight,
      bottom + deltaBottom,
      topLeftX: trimRadiusX(
        topLeftRawX,
        topLeftX,
        topLeftY,
        leftShift,
        topShift,
      ),
      topLeftY: trimRadiusY(
        topLeftRawY,
        topLeftX,
        topLeftY,
        leftShift,
        topShift,
      ),
      topRightX: trimRadiusX(
        topRightRawX,
        topRightX,
        topRightY,
        rightShift,
        topShift,
      ),
      topRightY: trimRadiusY(
        topRightRawY,
        topRightX,
        topRightY,
        rightShift,
        topShift,
      ),
      bottomLeftX: trimRadiusX(
        bottomLeftRawX,
        bottomLeftX,
        bottomLeftY,
        leftShift,
        bottomShift,
      ),
      bottomLeftY: trimRadiusY(
        bottomLeftRawY,
        bottomLeftX,
        bottomLeftY,
        leftShift,
        bottomShift,
      ),
      bottomRightX: trimRadiusX(
        bottomRightRawX,
        bottomRightX,
        bottomRightY,
        rightShift,
        bottomShift,
      ),
      bottomRightY: trimRadiusY(
        bottomRightRawY,
        bottomRightX,
        bottomRightY,
        rightShift,
        bottomShift,
      ),
    );
  }

  static RRect _inflateRRect(RRect value, double delta) => delta != 0.0
      ? _inflateBorderRect(.fromRRect(value), delta).toRRect()
      : value;

  static RSuperellipse _inflateRSuperellipse(
    RSuperellipse value,
    double delta,
  ) => delta != 0.0
      ? _inflateBorderRect(.fromRSuperellipse(value), delta).toRSuperellipse()
      : value;
}

final class _CutShapeCornerFamily extends ShapeCornerFamily
    with _CutShapeCornerFamilyMixin {
  const _CutShapeCornerFamily();

  @override
  String toString() => "ShapeCornerFamily.cut";
}
