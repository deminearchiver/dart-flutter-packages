import 'dart:math' as math;

import 'package:material/src/material/flutter.dart';

part 'geometry.dart';

// In this file, switch statements for BorderSide.style are not used
// because we assume it will remain the same in future releases of the
// framework. We need to keep track of new enum members being added.

abstract class _OffsetCornersGeometry extends CornersGeometry {
  const _OffsetCornersGeometry(CornersGeometry value, double delta)
    : _value = value,
      _delta = delta;

  final CornersGeometry _value;
  final double _delta;

  @override
  _OffsetCorners resolve(TextDirection? textDirection);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _OffsetCornersGeometry &&
          _value == other._value &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_value, _delta);

  static String _toString({
    required Object value,
    required double delta,
    required String shapeFamily,
  }) {
    // TODO: decide what the final formatting shall be

    if (delta == 0.0) return "$value";
    final direction = delta > 0.0 ? "inflated" : "deflated";
    // final direction = delta > 0.0 ? "inflateBy" : "deflateBy";
    final amount = delta.abs().toStringAsFixed(1);

    // "$value $direction as $cornerShape by $amount"
    // "$value $direction with ($cornerShape, $amount)"
    // "$value $direction($cornerShape) by $amount"
    // return "$value $direction ($cornerShape, $amount)";
    return "$value $direction as $shapeFamily by $amount";

    // if (delta == 0.0) return "$value";
    // final operator = delta > 0.0 ? "+" : "-";
    // final amount = delta.abs().toStringAsFixed(1);
    // return "$value[] $operator $amount";
  }
}

abstract class _OffsetCorners extends Corners
    implements _OffsetCornersGeometry {
  const _OffsetCorners(Corners value, double delta)
    : _value = value,
      _delta = delta;

  @override
  final Corners _value;

  @override
  final double _delta;

  @override
  _OffsetCorner get bottomLeft;

  @override
  _OffsetCorner get bottomRight;

  @override
  _OffsetCorner get topLeft;

  @override
  _OffsetCorner get topRight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _OffsetCorners &&
          _value == other._value &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_value, _delta);
}

abstract class _OffsetCorner extends Corner {
  const _OffsetCorner(Corner value, double delta)
    : _value = value,
      _delta = delta;

  final Corner _value;
  final double _delta;

  @override
  _OffsetCorner get flipped;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CutCorner &&
          _value == other._value &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_value, _delta);
}

class _RoundedCornersGeometry extends _OffsetCornersGeometry {
  const _RoundedCornersGeometry(super.value, super.delta);

  @override
  _RoundedCorners resolve(TextDirection? textDirection) =>
      .new(_value.resolve(textDirection), _delta);

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "rounded",
  );
}

class _RoundedCorners extends _OffsetCorners
    implements _RoundedCornersGeometry {
  const _RoundedCorners(super.value, super.delta);

  @override
  _RoundedCorner get bottomLeft => .new(_value.bottomLeft, _delta);

  @override
  _RoundedCorner get bottomRight => .new(_value.bottomRight, _delta);

  @override
  _RoundedCorner get topLeft => .new(_value.topLeft, _delta);

  @override
  _RoundedCorner get topRight => .new(_value.topRight, _delta);

  @override
  _RoundedCorners resolve(TextDirection? textDirection) => this;

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "rounded",
  );
}

class _RoundedCorner extends _OffsetCorner {
  const _RoundedCorner(super.value, super.delta);

  @override
  _RoundedCorner get flipped => .new(_value.flipped, _delta);

  @override
  Radius toRadius(Size size) {
    // Skip calculations if nothing is being offset.
    if (_delta == 0.0) return _value.toRadius(size);

    // We use an inversely-inflated size and resolve the corner in it.
    // This gives us a suitable radius for further transformations.
    final dimensionDelta = 2.0 * _delta;
    final deflatedSize = Size(
      size.width - dimensionDelta,
      size.height - dimensionDelta,
    );
    final Radius(:x, :y) = _value.toRadius(deflatedSize);

    // Apply constant offset to corners.
    return .elliptical(x + _delta, y + _delta);
  }

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "rounded",
  );
}

class _CutCornersGeometry extends _OffsetCornersGeometry {
  const _CutCornersGeometry(super.value, super.delta);

  @override
  _CutCorners resolve(TextDirection? textDirection) =>
      .new(_value.resolve(textDirection), _delta);

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "cut",
  );
}

class _CutCorners extends _OffsetCorners implements _CutCornersGeometry {
  const _CutCorners(super.value, super.delta);

  @override
  _CutCorner get bottomLeft => .new(_value.bottomLeft, _delta);

  @override
  _CutCorner get bottomRight => .new(_value.bottomRight, _delta);

  @override
  _CutCorner get topLeft => .new(_value.topLeft, _delta);

  @override
  _CutCorner get topRight => .new(_value.topRight, _delta);

  @override
  _CutCorners resolve(TextDirection? textDirection) => this;

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "cut",
  );
}

class _CutCorner extends _OffsetCorner {
  const _CutCorner(super.value, super.delta);

  @override
  _CutCorner get flipped => .new(_value.flipped, _delta);

  @override
  Radius toRadius(Size size) {
    // Skip calculations if nothing is being offset.
    if (_delta == 0.0) return _value.toRadius(size);

    // We use an inversely-inflated size and resolve the corner in it.
    // This gives us a suitable radius for further transformations.
    final dimensionDelta = 2.0 * _delta;
    final deflatedSize = Size(
      size.width - dimensionDelta,
      size.height - dimensionDelta,
    );
    final Radius(:x, :y) = _value.toRadius(deflatedSize);

    // Apply non-linear offset to corners as if they were bevels of a rectangle.
    final hypotenuse = math.sqrt(x * x + y * y);
    return Radius.elliptical(
      y != 0.0 ? math.max(0.0, x + _delta * ((hypotenuse - x) / y)) : 0.0,
      x != 0.0 ? math.max(0.0, y + _delta * ((hypotenuse - y) / x)) : 0.0,
    );
  }

  @override
  String toString() => _OffsetCornersGeometry._toString(
    value: _value,
    delta: _delta,
    shapeFamily: "cut",
  );
}

abstract class CornersBorderDelegate {
  const CornersBorderDelegate();

  // Calculations

  CornersGeometry inflateCorners(CornersGeometry value, double delta);

  CornersGeometry deflateCorners(CornersGeometry value, double delta) =>
      inflateCorners(value, -delta);

  BorderRadius inflateBorderRadius(BorderRadius value, double delta);

  BorderRadius deflateBorderRadius(BorderRadius value, double delta) =>
      inflateBorderRadius(value, -delta);

  Rect inflateRect(Rect value, double delta);

  Rect deflateRect(Rect value, double delta) => inflateRect(value, -delta);

  RRect inflateRRect(RRect value, double delta);

  RRect deflateRRect(RRect value, double delta) => inflateRRect(value, -delta);

  RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta);

  RSuperellipse deflateRSuperellipse(RSuperellipse value, double delta) =>
      inflateRSuperellipse(value, -delta);

  // Painting

  CornersBorderDelegate scale(double t);

  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  bool get preferPaintInterior => false;

  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    assert(
      !preferPaintInterior,
      "$runtimeType.preferPaintInterior returns true "
      "but $runtimeType.paintInterior is not implemented.",
    );
    assert(
      false,
      "$runtimeType.preferPaintInterior returns false, "
      "so it is an error to call its paintInterior method.",
    );
  }

  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  // Lerping

  CornersBorderDelegate? lerpFrom(CornersBorderDelegate? a, double t) =>
      a == null ? scale(t) : null;

  CornersBorderDelegate? lerpTo(CornersBorderDelegate? b, double t) =>
      b == null ? scale(1.0 - t) : null;

  // Static members

  static const CornersBorderDelegate rounded = _RoundedCornersBorderDelegate();

  static const CornersBorderDelegate smooth = _SmoothCornersBorderDelegate();

  static const CornersBorderDelegate cut = _CutCornersBorderDelegate();

  static CornersBorderDelegate? lerp(
    CornersBorderDelegate? a,
    CornersBorderDelegate? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return b?.lerpFrom(a, t) ?? a?.lerpTo(b, t) ?? (t < 0.5 ? a : b);
  }
}

mixin _RoundedCornerCalculations implements CornersBorderDelegate {
  @override
  CornersGeometry inflateCorners(CornersGeometry value, double delta) =>
      ShapeCornerFamily.rounded.corners.inflate(value, delta);

  @override
  BorderRadius inflateBorderRadius(BorderRadius value, double delta) =>
      ShapeCornerFamily.rounded.borderRadius.inflate(value, delta);

  @override
  Rect inflateRect(Rect value, double delta) =>
      delta != 0.0 ? value.inflate(delta) : value;

  @override
  RRect inflateRRect(RRect value, double delta) =>
      ShapeCornerFamily.rounded.rRect.inflate(value, delta);

  @override
  RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta) =>
      ShapeCornerFamily.rounded.rSuperellipse.inflate(value, delta);
}

class _RoundedCornersBorderDelegate extends CornersBorderDelegate
    with _RoundedCornerCalculations {
  const _RoundedCornersBorderDelegate();

  @override
  _RoundedCornersBorderDelegate scale(double t) => this;

  @override
  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) =>
      Path()
        ..addRRect(inflateRRect(borderRadius.toRRect(rect), side.strokeOutset));

  @override
  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) =>
      Path()
        ..addRRect(deflateRRect(borderRadius.toRRect(rect), side.strokeInset));

  @override
  bool get preferPaintInterior => true;

  @override
  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (borderRadius == .zero) {
      canvas.drawRect(inflateRect(rect, side.strokeOutset), paint);
    } else {
      canvas.drawRRect(
        inflateRRect(borderRadius.toRRect(rect), side.strokeOutset),
        paint,
      );
    }
  }

  @override
  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (side.style == .none) return;
    if (rect.isEmpty) return;

    if (side.width == 0.0) {
      canvas.drawRRect(borderRadius.toRRect(rect), side.toPaint());
    } else {
      final paint = Paint()..color = side.color;
      final borderRect = borderRadius.toRRect(rect);
      final outer = inflateRRect(borderRect, side.strokeOutset);
      final inner = deflateRRect(borderRect, side.strokeInset);
      canvas.drawDRRect(outer, inner, paint);
    }
  }

  // TODO: implement lerpFrom and lerpTo

  @override
  String toString() => "CornersBorderDelegate.rounded";
}

class _SmoothCornersBorderDelegate extends CornersBorderDelegate
    with _RoundedCornerCalculations {
  const _SmoothCornersBorderDelegate();

  @override
  _SmoothCornersBorderDelegate scale(double t) => this;

  @override
  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) => Path()
    ..addRSuperellipse(
      inflateRSuperellipse(
        borderRadius.toRSuperellipse(rect),
        side.strokeOutset,
      ),
    );

  @override
  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) => Path()
    ..addRSuperellipse(
      deflateRSuperellipse(
        borderRadius.toRSuperellipse(rect),
        side.strokeInset,
      ),
    );

  @override
  bool get preferPaintInterior => true;

  @override
  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (borderRadius == .zero) {
      canvas.drawRect(inflateRect(rect, side.strokeOutset), paint);
    } else {
      canvas.drawRSuperellipse(
        inflateRSuperellipse(
          borderRadius.toRSuperellipse(rect),
          side.strokeOutset,
        ),
        paint,
      );
    }
  }

  @override
  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (side.style == .none) return;
    if (rect.isEmpty) return;

    final strokeOffset = (side.strokeOutset - side.strokeInset) / 2.0;
    if (borderRadius == .zero) {
      canvas.drawRect(inflateRect(rect, strokeOffset), side.toPaint());
    } else {
      canvas.drawRSuperellipse(
        inflateRSuperellipse(borderRadius.toRSuperellipse(rect), strokeOffset),
        side.toPaint(),
      );
    }
  }

  // TODO: implement lerpFrom and lerpTo

  @override
  String toString() => "CornersBorderDelegate.smooth";
}

mixin _CutCornerCalculations implements CornersBorderDelegate {
  @override
  CornersGeometry inflateCorners(CornersGeometry value, double delta) =>
      ShapeCornerFamily.cut.corners.inflate(value, delta);

  @override
  BorderRadius inflateBorderRadius(BorderRadius value, double delta) =>
      ShapeCornerFamily.cut.borderRadius.inflate(value, delta);

  @override
  Rect inflateRect(Rect value, double delta) =>
      delta != 0.0 ? value.inflate(delta) : value;

  @override
  RRect inflateRRect(RRect value, double delta) =>
      ShapeCornerFamily.cut.rRect.inflate(value, delta);

  @override
  RSuperellipse inflateRSuperellipse(RSuperellipse value, double delta) =>
      ShapeCornerFamily.cut.rSuperellipse.inflate(value, delta);
}

class _CutCornersBorderDelegate extends CornersBorderDelegate
    with _CutCornerCalculations {
  const _CutCornersBorderDelegate();

  @override
  _CutCornersBorderDelegate scale(double t) => this;

  @override
  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) =>
      _createPath(inflateRRect(borderRadius.toRRect(rect), side.strokeOutset));

  @override
  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) => _createPath(deflateRRect(borderRadius.toRRect(rect), side.strokeInset));

  @override
  bool get preferPaintInterior => true;

  @override
  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (borderRadius == .zero) {
      canvas.drawRect(inflateRect(rect, side.strokeOutset), paint);
    } else {
      canvas.drawPath(
        _createPath(
          inflateRRect(borderRadius.toRRect(rect), side.strokeOutset),
        ),
        paint,
      );
    }
  }

  @override
  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (side.style == .none) return;
    if (rect.isEmpty) return;

    if (side.width == 0.0) {
      canvas.drawPath(_createPath(borderRadius.toRRect(rect)), side.toPaint());
    } else {
      final paint = Paint()..color = side.color;
      final borderRect = borderRadius.toRRect(rect);
      final inner = deflateRRect(borderRect, side.strokeInset);
      final outer = inflateRRect(borderRect, side.strokeOutset);
      final path = Path()
        ..fillType = .evenOdd
        ..addPath(_createPath(inner), .zero)
        ..addPath(_createPath(outer), .zero);
      canvas.drawPath(path, paint);
    }
  }

  // TODO: implement lerpFrom and lerpTo

  @override
  String toString() => "CornersBorderDelegate.cut";

  static Path _createPath(RRect rrect) {
    if (rrect.isEmpty) return Path();
    if (rrect.isRect) return Path()..addRect(rrect.outerRect);
    final RRect(
      :left,
      :top,
      :right,
      :bottom,
      :tlRadiusX,
      :tlRadiusY,
      :trRadiusX,
      :trRadiusY,
      :blRadiusX,
      :blRadiusY,
      :brRadiusX,
      :brRadiusY,
    ) = rrect
        .scaleRadii();
    final vertices = <Offset>[
      .new(left + tlRadiusX, top),
      .new(right - trRadiusX, top),
      .new(right, top + trRadiusY),
      .new(right, bottom - brRadiusY),
      .new(right - brRadiusX, bottom),
      .new(left + blRadiusX, bottom),
      .new(left, bottom - blRadiusY),
      .new(left, top + tlRadiusY),
    ];
    return Path()..addPolygon(vertices, true);
  }
}

class CornersBorder extends OutlinedBorder {
  const CornersBorder({
    super.side,
    required this.delegate,
    this.corners = .zero,
  });

  const CornersBorder.rounded({super.side, this.corners = .zero})
    : delegate = .rounded;

  const CornersBorder.smooth({super.side, this.corners = .zero})
    : delegate = .smooth;

  const CornersBorder.cut({super.side, this.corners = .zero}) : delegate = .cut;

  final CornersBorderDelegate delegate;

  final CornersGeometry corners;

  @override
  CornersBorder copyWith({
    BorderSide? side,
    CornersBorderDelegate? delegate,
    CornersGeometry? corners,
  }) => side != null || delegate != null || corners != null
      ? .new(
          side: side ?? this.side,
          delegate: delegate ?? this.delegate,
          corners: corners ?? this.corners,
        )
      : this;

  @override
  CornersBorder scale(double t) => .new(
    side: side.scale(t),
    delegate: delegate.scale(t),
    corners: corners * t,
  );

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      delegate.getOuterPath(
        rect: rect,
        side: side,
        borderRadius: corners.resolve(textDirection).toBorderRadius(rect.size),
      );

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      delegate.getInnerPath(
        rect: rect,
        side: side,
        borderRadius: corners.resolve(textDirection).toBorderRadius(rect.size),
      );

  @override
  bool get preferPaintInterior => delegate.preferPaintInterior;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    delegate.paintInterior(
      canvas: canvas,
      rect: rect,
      paint: paint,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect.size),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    delegate.paint(
      canvas: canvas,
      rect: rect,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect.size),
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a == null) return scale(t);
    if (a is CornersBorder) {
      return CornersBorder(
        side: BorderSide.lerp(a.side, side, t),
        delegate: CornersBorderDelegate.lerp(a.delegate, delegate, t)!,
        corners: CornersGeometry.lerp(a.corners, corners, t)!,
      );
    }
    if (a is RoundedRectangleBorder) {
      const aDelegate = CornersBorderDelegate.rounded;
      final aCorners = CornersGeometry.fromBorderRadius(a.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(a.side, side, t),
        delegate: CornersBorderDelegate.lerp(aDelegate, delegate, t)!,
        corners: CornersGeometry.lerp(aCorners, corners, t)!,
      );
    }
    if (a is RoundedSuperellipseBorder) {
      const aDelegate = CornersBorderDelegate.smooth;
      final aCorners = CornersGeometry.fromBorderRadius(a.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(a.side, side, t),
        delegate: CornersBorderDelegate.lerp(aDelegate, delegate, t)!,
        corners: CornersGeometry.lerp(aCorners, corners, t)!,
      );
    }
    if (a is BeveledRectangleBorder) {
      const aDelegate = CornersBorderDelegate.cut;
      final aCorners = CornersGeometry.fromBorderRadius(a.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(a.side, side, t),
        delegate: CornersBorderDelegate.lerp(aDelegate, delegate, t)!,
        corners: CornersGeometry.lerp(aCorners, corners, t)!,
      );
    }
    return null;
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is CornersBorder) {
      return CornersBorder(
        side: BorderSide.lerp(side, b.side, t),
        delegate: CornersBorderDelegate.lerp(delegate, b.delegate, t)!,
        corners: CornersGeometry.lerp(corners, b.corners, t)!,
      );
    }
    if (b is RoundedRectangleBorder) {
      const bDelegate = CornersBorderDelegate.rounded;
      final bCorners = CornersGeometry.fromBorderRadius(b.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(side, b.side, t),
        delegate: CornersBorderDelegate.lerp(delegate, bDelegate, t)!,
        corners: CornersGeometry.lerp(corners, bCorners, t)!,
      );
    }
    if (b is RoundedSuperellipseBorder) {
      const bDelegate = CornersBorderDelegate.smooth;
      final bCorners = CornersGeometry.fromBorderRadius(b.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(side, b.side, t),
        delegate: CornersBorderDelegate.lerp(delegate, bDelegate, t)!,
        corners: CornersGeometry.lerp(corners, bCorners, t)!,
      );
    }
    if (b is BeveledRectangleBorder) {
      const bDelegate = CornersBorderDelegate.cut;
      final bCorners = CornersGeometry.fromBorderRadius(b.borderRadius);
      return CornersBorder(
        side: BorderSide.lerp(side, b.side, t),
        delegate: CornersBorderDelegate.lerp(delegate, bDelegate, t)!,
        corners: CornersGeometry.lerp(corners, bCorners, t)!,
      );
    }
    return null;
  }

  @override
  String toString() =>
      "${objectRuntimeType(this, "CornersBorder")}"
      "(side: $side, delegate: $delegate, corners: $corners)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is CornersBorder &&
          side == other.side &&
          delegate == other.delegate &&
          corners == other.corners;

  @override
  int get hashCode => Object.hash(side, delegate, corners);
}
