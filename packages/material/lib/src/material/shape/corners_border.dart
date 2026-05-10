import 'dart:math' as math;

import 'package:material/src/material/flutter.dart';

// In this file, switch statements for BorderSide.style are not used
// because we assume it will remain the same in future releases of the
// framework. We need to keep track of new enum members being added.

abstract class _OffsetCornersGeometry extends CornersGeometry {
  const _OffsetCornersGeometry(CornersGeometry corners, double delta)
    : _corners = corners,
      _delta = delta;

  final CornersGeometry _corners;
  final double _delta;

  @override
  _OffsetCorners resolve(TextDirection? textDirection);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _OffsetCornersGeometry &&
          _corners == other._corners &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_corners, _delta);
}

abstract class _OffsetCorners extends Corners {
  const _OffsetCorners(Corners corners, double delta)
    : _corners = corners,
      _delta = delta;

  final Corners _corners;
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
  _OffsetCorners resolve(TextDirection? textDirection) => this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _OffsetCorners &&
          _corners == other._corners &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_corners, _delta);
}

abstract class _OffsetCorner extends Corner {
  const _OffsetCorner(Corner corner, double delta)
    : _corner = corner,
      _delta = delta;

  final Corner _corner;
  final double _delta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CutCorner &&
          _corner == other._corner &&
          _delta == other._delta;

  @override
  int get hashCode => Object.hash(_corner, _delta);
}

class _RoundedCornersGeometry extends _OffsetCornersGeometry {
  const _RoundedCornersGeometry(super.corners, super.delta);

  @override
  _RoundedCorners resolve(TextDirection? textDirection) =>
      .new(_corners.resolve(textDirection), _delta);
}

class _RoundedCorners extends _OffsetCorners {
  const _RoundedCorners(super.corners, super.delta);

  @override
  _RoundedCorner get bottomLeft => .new(_corners.bottomLeft, _delta);

  @override
  _RoundedCorner get bottomRight => .new(_corners.bottomRight, _delta);

  @override
  _RoundedCorner get topLeft => .new(_corners.topLeft, _delta);

  @override
  _RoundedCorner get topRight => .new(_corners.topRight, _delta);
}

class _RoundedCorner extends _OffsetCorner {
  const _RoundedCorner(super.corner, super.delta);

  @override
  Corner get flipped => _RoundedCorner(_corner.flipped, _delta);

  @override
  Radius toRadius(Size size) {
    // Skip calculations if nothing is being offset.
    if (_delta == 0.0) return _corner.toRadius(size);

    // We use an inversely-inflated size and resolve the corner in it.
    // This gives us a suitable radius for further transformations.
    final dimensionDelta = 2.0 * _delta;
    final deflatedSize = Size(
      size.width - dimensionDelta,
      size.height - dimensionDelta,
    );
    final Radius(:x, :y) = _corner.toRadius(deflatedSize);

    // Apply constant offset to corners.
    return .elliptical(x + _delta, y + _delta);
  }
}

class _CutCornersGeometry extends _OffsetCornersGeometry {
  const _CutCornersGeometry(super.corners, super.delta);

  @override
  _CutCorners resolve(TextDirection? textDirection) =>
      .new(_corners.resolve(textDirection), _delta);
}

class _CutCorners extends _OffsetCorners {
  const _CutCorners(super.corners, super.delta);

  @override
  _CutCorner get bottomLeft => .new(_corners.bottomLeft, _delta);

  @override
  _CutCorner get bottomRight => .new(_corners.bottomRight, _delta);

  @override
  _CutCorner get topLeft => .new(_corners.topLeft, _delta);

  @override
  _CutCorner get topRight => .new(_corners.topRight, _delta);
}

class _CutCorner extends _OffsetCorner {
  const _CutCorner(super.corner, super.delta);

  @override
  Corner get flipped => _CutCorner(_corner.flipped, _delta);

  @override
  Radius toRadius(Size size) {
    // Skip calculations if nothing is being offset.
    if (_delta == 0.0) return _corner.toRadius(size);

    // We use an inversely-inflated size and resolve the corner in it.
    // This gives us a suitable radius for further transformations.
    final dimensionDelta = 2.0 * _delta;
    final deflatedSize = Size(
      size.width - dimensionDelta,
      size.height - dimensionDelta,
    );
    final Radius(:x, :y) = _corner.toRadius(deflatedSize);

    // Apply non-linear offset to corners as if they were bevels of a rectangle.
    final hypotenuse = math.sqrt(x * x + y * y);
    return Radius.elliptical(
      y != 0.0 ? math.max(0.0, x + _delta * ((hypotenuse - x) / y)) : 0.0,
      x != 0.0 ? math.max(0.0, y + _delta * ((hypotenuse - y) / x)) : 0.0,
    );
  }
}

abstract class CornersBorderDelegate {
  const CornersBorderDelegate();

  // Calculations

  CornersGeometry inflateCorners(CornersGeometry corners, double delta);

  CornersGeometry deflateCorners(CornersGeometry corners, double delta) =>
      inflateCorners(corners, -delta);

  BorderRadius inflateBorderRadius(BorderRadius borderRadius, double delta);

  BorderRadius deflateBorderRadius(BorderRadius borderRadius, double delta) =>
      inflateBorderRadius(borderRadius, -delta);

  Rect inflateRect(Rect rect, double delta);

  Rect deflateRect(Rect rect, double delta) => inflateRect(rect, -delta);

  RRect inflateRRect(RRect rRect, double delta);

  RRect deflateRRect(RRect rRect, double delta) => inflateRRect(rRect, -delta);

  RSuperellipse inflateRSuperellipse(RSuperellipse rSuperellipse, double delta);

  RSuperellipse deflateRSuperellipse(
    RSuperellipse rSuperellipse,
    double delta,
  ) => inflateRSuperellipse(rSuperellipse, -delta);

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

  static const CornersBorderDelegate superellipse =
      _SuperellipseCornersBorderDelegate();

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
  CornersGeometry inflateCorners(CornersGeometry corners, double delta) {
    if (delta == 0.0) return corners;
    return _RoundedCornersGeometry(corners, delta);
  }

  @override
  BorderRadius inflateBorderRadius(BorderRadius borderRadius, double delta) {
    if (delta == 0.0) return borderRadius;
    final BorderRadius(
      topLeft: Radius(x: tlX, y: tlY),
      topRight: Radius(x: trX, y: trY),
      bottomLeft: Radius(x: blX, y: blY),
      bottomRight: Radius(x: brX, y: brY),
    ) = borderRadius;
    return .only(
      topLeft: .elliptical(tlX + delta, tlY + delta),
      topRight: .elliptical(trX + delta, trY + delta),
      bottomLeft: .elliptical(blX + delta, blY + delta),
      bottomRight: .elliptical(brX + delta, brY + delta),
    );
  }

  @override
  Rect inflateRect(Rect rect, double delta) {
    if (delta == 0.0) return rect;
    return rect.inflate(delta);
  }

  @override
  RRect inflateRRect(RRect rRect, double delta) {
    if (delta == 0.0) return rRect;
    return rRect.inflate(delta);
  }

  @override
  RSuperellipse inflateRSuperellipse(
    RSuperellipse rSuperellipse,
    double delta,
  ) {
    if (delta == 0.0) return rSuperellipse;
    return rSuperellipse.inflate(delta);
  }
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

class _SuperellipseCornersBorderDelegate extends CornersBorderDelegate
    with _RoundedCornerCalculations {
  const _SuperellipseCornersBorderDelegate();

  @override
  _SuperellipseCornersBorderDelegate scale(double t) => this;

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
  String toString() => "CornersBorderDelegate.superellipse";
}

mixin _CutCornerCalculations implements CornersBorderDelegate {
  @override
  CornersGeometry inflateCorners(CornersGeometry corners, double delta) {
    if (delta == 0.0) return corners;
    return _CutCornersGeometry(corners, delta);
  }

  @override
  BorderRadius inflateBorderRadius(BorderRadius borderRadius, double delta) {
    if (delta == 0.0) return borderRadius;
    final BorderRadius(
      topLeft: Radius(x: tlX, y: tlY),
      topRight: Radius(x: trX, y: trY),
      bottomLeft: Radius(x: blX, y: blY),
      bottomRight: Radius(x: brX, y: brY),
    ) = borderRadius;
    final tlH = math.sqrt(tlX * tlX + tlY * tlY);
    final trH = math.sqrt(trX * trX + trY * trY);
    final blH = math.sqrt(blX * blX + blY * blY);
    final brH = math.sqrt(brX * brX + brY * brY);
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

  @override
  Rect inflateRect(Rect rect, double delta) {
    if (delta == 0.0) return rect;
    return rect.inflate(delta);
  }

  @override
  RRect inflateRRect(RRect rRect, double delta) {
    if (delta == 0.0) return rRect;
    final RRect(
      :left,
      :top,
      :right,
      :bottom,
      tlRadiusX: tlX,
      tlRadiusY: tlY,
      trRadiusX: trX,
      trRadiusY: trY,
      blRadiusX: blX,
      blRadiusY: blY,
      brRadiusX: brX,
      brRadiusY: brY,
    ) = rRect;
    final tlH = math.sqrt(tlX * tlX + tlY * tlY);
    final trH = math.sqrt(trX * trX + trY * trY);
    final blH = math.sqrt(blX * blX + blY * blY);
    final brH = math.sqrt(brX * brX + brY * brY);
    return .fromLTRBAndCorners(
      left - delta,
      top - delta,
      right + delta,
      bottom + delta,
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

  @override
  RSuperellipse inflateRSuperellipse(
    RSuperellipse rSuperellipse,
    double delta,
  ) {
    if (delta == 0.0) return rSuperellipse;
    final RSuperellipse(
      :left,
      :top,
      :right,
      :bottom,
      tlRadiusX: tlX,
      tlRadiusY: tlY,
      trRadiusX: trX,
      trRadiusY: trY,
      blRadiusX: blX,
      blRadiusY: blY,
      brRadiusX: brX,
      brRadiusY: brY,
    ) = rSuperellipse;
    final tlH = math.sqrt(tlX * tlX + tlY * tlY);
    final trH = math.sqrt(trX * trX + trY * trY);
    final blH = math.sqrt(blX * blX + blY * blY);
    final brH = math.sqrt(brX * brX + brY * brY);
    return .fromLTRBAndCorners(
      left - delta,
      top - delta,
      right + delta,
      bottom + delta,
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

  const CornersBorder.superellipse({super.side, this.corners = .zero})
    : delegate = .superellipse;

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
      const aDelegate = CornersBorderDelegate.superellipse;
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
      const bDelegate = CornersBorderDelegate.superellipse;
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
