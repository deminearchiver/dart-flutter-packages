import 'package:material/src/material/flutter.dart';

extension CornerArithmetic on Corner {
  Corner operator +(Corner other) => add(other);

  Corner operator -(Corner other) => subtract(other);
}

extension CornersGeometryArithmetic on CornersGeometry {
  CornersGeometry operator +(CornersGeometry other) => add(other);

  CornersGeometry operator -(CornersGeometry other) => subtract(other);
}

abstract class Corner {
  const Corner();

  const factory Corner._zero() = _ZeroCorner;

  const factory Corner.fixed(double radius) = FixedCorner.circular;

  const factory Corner.fixedXY(double radiusX, double radiusY) =
      FixedCorner.elliptical;

  const factory Corner.fractional(double fraction) = FractionalCorner.circular;

  const factory Corner.fractionalXY(double fractionX, double fractionY) =
      FractionalCorner.elliptical;

  const factory Corner.fromRadius(Radius radius) = FixedCorner.fromRadius;

  double get _radiusX;

  double get _radiusY;

  double get _fractionX;

  double get _fractionY;

  /// Whether every dimension is non-negative.
  bool get isNonNegative =>
      _radiusX >= 0.0 &&
      _radiusY >= 0.0 &&
      _fractionX >= 0.0 &&
      _fractionY >= 0.0;

  /// A [Corner] with X and Y swapped.
  Corner get flipped =>
      _MixedCorner(_radiusY, _radiusX, _fractionY, _fractionX);

  Corner clamp(Corner minimum, Corner maximum) => _MixedCorner(
    clampDouble(_radiusX, minimum._radiusX, maximum._radiusX),
    clampDouble(_radiusY, minimum._radiusY, maximum._radiusY),
    clampDouble(_fractionX, minimum._fractionX, maximum._fractionX),
    clampDouble(_fractionY, minimum._fractionY, maximum._fractionY),
  );

  Radius toRadius(Size size);

  Corner add(Corner other) => _MixedCorner(
    _radiusX + other._radiusX,
    _radiusY + other._radiusY,
    _fractionX + other._fractionX,
    _fractionY + other._fractionY,
  );

  Corner subtract(Corner other) => _MixedCorner(
    _radiusX - other._radiusX,
    _radiusY - other._radiusY,
    _fractionX - other._fractionX,
    _fractionY - other._fractionY,
  );

  Corner operator -();

  Corner operator *(double operand);

  Corner operator /(double operand);

  Corner operator ~/(double operand);

  Corner operator %(double operand);

  @override
  String toString() {
    final zeroFixed = _radiusX == 0.0 && _radiusY == 0.0;
    final zeroFractional = _fractionX == 0.0 && _fractionY == 0.0;
    if (zeroFixed && zeroFractional) return "Corner.zero";
    late final fixed = _radiusX == _radiusY
        ? "Corner.fixed(${_radiusX.toStringAsFixed(1)})"
        : "Corner.fixedXY(${_radiusX.toStringAsFixed(1)}, "
              "${_radiusY.toStringAsFixed(1)})";
    late final fractional = _fractionX == _fractionY
        ? "Corner.fractional(${_fractionX.toStringAsFixed(1)})"
        : "Corner.fractionalXY(${_fractionX.toStringAsFixed(1)}, "
              "${_fractionY.toStringAsFixed(1)})";
    if (zeroFractional) return fixed;
    if (zeroFixed) return fractional;
    return "$fixed + $fractional";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Corner &&
          _radiusX == other._radiusX &&
          _radiusY == other._radiusY &&
          _fractionX == other._fractionX &&
          _fractionY == other._fractionY;

  @override
  int get hashCode => Object.hash(_radiusX, _radiusY, _fractionX, _fractionY);

  static const zero = Corner._zero();

  static const round = Corner.fractional(0.5);

  static Corner? lerp(Corner? a, Corner? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    if (a is FixedCorner && b is FixedCorner) {
      return FixedCorner.lerp(a, b, t);
    }
    if (a is FractionalCorner && b is FractionalCorner) {
      return FractionalCorner.lerp(a, b, t);
    }
    return _MixedCorner(
      lerpDouble(a._radiusX, b._radiusX, t),
      lerpDouble(a._radiusY, b._radiusY, t),
      lerpDouble(a._fractionX, b._fractionX, t),
      lerpDouble(a._fractionY, b._fractionY, t),
    );
  }
}

// TODO: consider removing and replacing with FixedCorner.zero
class _ZeroCorner extends Corner {
  const _ZeroCorner();

  @override
  double get _radiusX => 0.0;

  @override
  double get _radiusY => 0.0;

  @override
  double get _fractionX => 0.0;

  @override
  double get _fractionY => 0.0;

  @override
  bool get isNonNegative => true;

  @override
  Corner get flipped => this;

  @override
  Radius toRadius(Size size) => .zero;

  @override
  Corner add(Corner other) => other is _ZeroCorner ? this : other;

  @override
  Corner subtract(Corner other) => other is _ZeroCorner ? this : -other;

  @override
  Corner operator -() => this;

  @override
  Corner operator *(double operand) => this;

  @override
  Corner operator /(double operand) => this;

  @override
  Corner operator ~/(double operand) => this;

  @override
  Corner operator %(double operand) => this;
}

abstract class FixedCorner extends Corner {
  const FixedCorner();

  const factory FixedCorner.elliptical(double radiusX, double radiusY) =
      _FixedCorner.elliptical;

  const factory FixedCorner.circular(double radius) = _FixedCorner.circular;

  const factory FixedCorner.fromRadius(Radius radius) = _FixedCornerFromRadius;

  double get radiusX;

  double get radiusY;

  @override
  double get _radiusX => radiusX;

  @override
  double get _radiusY => radiusY;

  @override
  double get _fractionX => 0.0;

  @override
  double get _fractionY => 0.0;

  /// Whether every dimension is non-negative.
  @override
  bool get isNonNegative => radiusX >= 0.0 && radiusY >= 0.0;

  /// A [FixedCorner] with [radiusX] and [radiusY] swapped.
  @override
  FixedCorner get flipped => .elliptical(radiusY, radiusX);

  @override
  Radius toRadius(Size size) => .elliptical(radiusX, radiusY);

  @override
  Corner add(Corner other) =>
      other is FixedCorner ? this + other : super.add(other);

  @override
  Corner subtract(Corner other) =>
      other is FixedCorner ? this - other : super.subtract(other);

  @override
  FixedCorner operator -() => .elliptical(-radiusX, -radiusY);

  FixedCorner operator -(FixedCorner other) =>
      .elliptical(radiusX - other.radiusX, radiusY - other.radiusY);

  FixedCorner operator +(FixedCorner other) =>
      .elliptical(radiusX + other.radiusX, radiusY + other.radiusY);

  @override
  FixedCorner operator *(double operand) =>
      .elliptical(radiusX * operand, radiusY * operand);

  @override
  FixedCorner operator /(double operand) =>
      .elliptical(radiusX / operand, radiusY / operand);

  @override
  FixedCorner operator ~/(double operand) => .elliptical(
    (radiusX ~/ operand).toDouble(),
    (radiusY ~/ operand).toDouble(),
  );

  @override
  FixedCorner operator %(double operand) =>
      .elliptical(radiusX % operand, radiusY % operand);

  static FixedCorner? lerp(FixedCorner? a, FixedCorner? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return .elliptical(
      lerpDouble(a.radiusX, b.radiusX, t),
      lerpDouble(a.radiusY, b.radiusY, t),
    );
  }

  static const zero = FixedCorner.circular(0.0);
}

class _FixedCorner extends FixedCorner {
  const _FixedCorner.elliptical(this.radiusX, this.radiusY);

  const _FixedCorner.circular(double radius) : this.elliptical(radius, radius);

  @override
  final double radiusX;

  @override
  final double radiusY;
}

class _FixedCornerFromRadius extends FixedCorner {
  const _FixedCornerFromRadius(this._radius);

  final Radius _radius;

  @override
  double get radiusX => _radius.x;

  @override
  double get radiusY => _radius.y;

  @override
  Radius toRadius(Size size) => _radius;
}

class FractionalCorner extends Corner {
  const FractionalCorner.elliptical(this.fractionX, this.fractionY);

  const FractionalCorner.circular(double fraction)
    : this.elliptical(fraction, fraction);

  final double fractionX;

  final double fractionY;

  @override
  double get _radiusX => 0.0;

  @override
  double get _radiusY => 0.0;

  @override
  double get _fractionX => fractionX;

  @override
  double get _fractionY => fractionY;

  /// Whether every dimension is non-negative.
  @override
  bool get isNonNegative => fractionY >= 0.0 && fractionY >= 0.0;

  /// A [FractionalCorner] with [fractionX] and [fractionY] swapped.
  @override
  FractionalCorner get flipped => .elliptical(fractionY, fractionX);

  @override
  Radius toRadius(Size size) {
    final shortestSide = size.shortestSide;
    return .elliptical(shortestSide * fractionX, shortestSide * fractionY);
  }

  @override
  Corner add(Corner other) =>
      other is FractionalCorner ? this + other : super.add(other);

  @override
  Corner subtract(Corner other) =>
      other is FractionalCorner ? this - other : super.subtract(other);

  @override
  FractionalCorner operator -() => .elliptical(-fractionX, -fractionY);

  FractionalCorner operator -(FractionalCorner other) =>
      .elliptical(fractionX - other.fractionX, fractionY - other.fractionY);

  FractionalCorner operator +(FractionalCorner other) =>
      .elliptical(fractionX + other.fractionX, fractionY + other.fractionY);

  @override
  FractionalCorner operator *(double operand) =>
      .elliptical(fractionX * operand, fractionY * operand);

  @override
  FractionalCorner operator /(double operand) =>
      .elliptical(fractionX / operand, fractionY / operand);

  @override
  FractionalCorner operator ~/(double operand) => .elliptical(
    (fractionX ~/ operand).toDouble(),
    (fractionY ~/ operand).toDouble(),
  );

  @override
  FractionalCorner operator %(double operand) =>
      .elliptical(fractionX % operand, fractionY % operand);

  static const zero = FractionalCorner.circular(0.0);

  static const round = FractionalCorner.circular(0.5);

  static FractionalCorner? lerp(
    FractionalCorner? a,
    FractionalCorner? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return .elliptical(
      lerpDouble(a.fractionX, b.fractionX, t),
      lerpDouble(a.fractionY, b.fractionY, t),
    );
  }
}

class _MixedCorner extends Corner {
  const _MixedCorner(
    this._radiusX,
    this._radiusY,
    this._fractionX,
    this._fractionY,
  );

  @override
  final double _radiusX;

  @override
  final double _radiusY;

  @override
  final double _fractionX;

  @override
  final double _fractionY;

  @override
  Radius toRadius(Size size) {
    final shortestSide = size.shortestSide;
    return .elliptical(
      _radiusX + shortestSide * _fractionX,
      _radiusY + shortestSide * _fractionY,
    );
  }

  @override
  _MixedCorner operator -() =>
      _MixedCorner(-_radiusX, -_radiusY, -_fractionX, -_fractionY);

  @override
  _MixedCorner operator *(double operand) => _MixedCorner(
    _radiusX * operand,
    _radiusY * operand,
    _fractionX * operand,
    _fractionY * operand,
  );

  @override
  _MixedCorner operator /(double operand) => _MixedCorner(
    _radiusX / operand,
    _radiusY / operand,
    _fractionX / operand,
    _fractionY / operand,
  );

  @override
  _MixedCorner operator ~/(double operand) => _MixedCorner(
    (_radiusX ~/ operand).toDouble(),
    (_radiusY ~/ operand).toDouble(),
    (_fractionX ~/ operand).toDouble(),
    (_fractionY ~/ operand).toDouble(),
  );

  @override
  _MixedCorner operator %(double operand) => _MixedCorner(
    _radiusX % operand,
    _radiusY % operand,
    _fractionX % operand,
    _fractionY % operand,
  );
}

abstract class CornersGeometry {
  const CornersGeometry();

  const factory CornersGeometry.all(Corner corner) = Corners.all;

  const factory CornersGeometry.only({
    Corner topLeft,
    Corner topRight,
    Corner bottomLeft,
    Corner bottomRight,
  }) = Corners.only;

  const factory CornersGeometry.directional({
    Corner topStart,
    Corner topEnd,
    Corner bottomStart,
    Corner bottomEnd,
  }) = CornersDirectional.only;

  const factory CornersGeometry.vertical({Corner top, Corner bottom}) =
      Corners.vertical;

  const factory CornersGeometry.fromBorderRadius(
    BorderRadiusGeometry borderRadius,
  ) = _CornersGeometryFromBorderRadiusGeometry;

  Corner get _topLeft;

  Corner get _topRight;

  Corner get _bottomLeft;

  Corner get _bottomRight;

  Corner get _topStart;

  Corner get _topEnd;

  Corner get _bottomStart;

  Corner get _bottomEnd;

  Corners resolve(TextDirection? textDirection);

  BorderRadiusGeometry toBorderRadius(Size size);

  CornersGeometry add(CornersGeometry other) => _MixedCorners(
    _topLeft.add(other._topLeft),
    _topRight.add(other._topRight),
    _bottomLeft.add(other._bottomLeft),
    _bottomRight.add(other._bottomRight),
    _topStart.add(other._topStart),
    _topEnd.add(other._topEnd),
    _bottomStart.add(other._bottomStart),
    _bottomEnd.add(other._bottomEnd),
  );

  CornersGeometry subtract(CornersGeometry other) => _MixedCorners(
    _topLeft.subtract(other._topLeft),
    _topRight.subtract(other._topRight),
    _bottomLeft.subtract(other._bottomLeft),
    _bottomRight.subtract(other._bottomRight),
    _topStart.subtract(other._topStart),
    _topEnd.subtract(other._topEnd),
    _bottomStart.subtract(other._bottomStart),
    _bottomEnd.subtract(other._bottomEnd),
  );

  CornersGeometry operator -();

  CornersGeometry operator *(double other);

  CornersGeometry operator /(double other);

  CornersGeometry operator ~/(double other);

  CornersGeometry operator %(double other);

  @override
  String toString() {
    String? visual;
    String? logical;
    if (_topLeft == _topRight &&
        _topRight == _bottomLeft &&
        _bottomLeft == _bottomRight) {
      if (_topLeft != .zero) {
        visual = "Corners.all($_topLeft)";
      }
    } else {
      final result = StringBuffer("Corners.only(");
      var comma = false;
      if (_topLeft != .zero) {
        result.write("topLeft: $_topLeft");
        comma = true;
      }
      if (_topRight != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("topRight: $_topRight");
        comma = true;
      }
      if (_bottomLeft != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomLeft: $_bottomLeft");
        comma = true;
      }
      if (_bottomRight != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomRight: $_bottomRight");
      }
      result.write(")");
      visual = result.toString();
    }
    if (_topStart == _topEnd &&
        _topEnd == _bottomEnd &&
        _bottomEnd == _bottomStart) {
      if (_topStart != .zero) {
        logical = "CornersDirectional.all($_topStart)";
      }
    } else {
      final result = StringBuffer("CornersDirectional.only(");
      var comma = false;
      if (_topStart != .zero) {
        result.write("topStart: $_topStart");
        comma = true;
      }
      if (_topEnd != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("topEnd: $_topEnd");
        comma = true;
      }
      if (_bottomStart != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomStart: $_bottomStart");
        comma = true;
      }
      if (_bottomEnd != .zero) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomEnd: $_bottomEnd");
      }
      result.write(")");
      logical = result.toString();
    }
    if (visual != null && logical != null) {
      return "$visual + $logical";
    }
    return visual ?? logical ?? "Corners.zero";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CornersGeometry &&
          _topLeft == other._topLeft &&
          _topRight == other._topRight &&
          _bottomLeft == other._bottomLeft &&
          _bottomRight == other._bottomRight &&
          _topStart == other._topStart &&
          _topEnd == other._topEnd &&
          _bottomStart == other._bottomStart &&
          _bottomEnd == other._bottomEnd;

  @override
  int get hashCode => Object.hash(
    _topLeft,
    _topRight,
    _bottomLeft,
    _bottomRight,
    _topStart,
    _topEnd,
    _bottomStart,
    _bottomEnd,
  );

  static const CornersGeometry zero = Corners.zero;

  static const CornersGeometry circle = Corners.circle;

  static CornersGeometry? lerp(
    CornersGeometry? a,
    CornersGeometry? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    if (a is Corners && b is Corners) {
      return Corners.lerp(a, b, t);
    }
    if (a is CornersDirectional && b is CornersDirectional) {
      return CornersDirectional.lerp(a, b, t);
    }
    return _MixedCorners(
      .lerp(a._topLeft, b._topLeft, t)!,
      .lerp(a._topRight, b._topRight, t)!,
      .lerp(a._bottomLeft, b._bottomLeft, t)!,
      .lerp(a._bottomRight, b._bottomRight, t)!,
      .lerp(a._topStart, b._topStart, t)!,
      .lerp(a._topEnd, b._topEnd, t)!,
      .lerp(a._bottomStart, b._bottomStart, t)!,
      .lerp(a._bottomEnd, b._bottomEnd, t)!,
    );
  }
}

class _CornersGeometryFromBorderRadiusGeometry extends CornersGeometry {
  const _CornersGeometryFromBorderRadiusGeometry(this._borderRadius);

  final BorderRadiusGeometry _borderRadius;

  @override
  Corner get _topLeft => .zero;

  @override
  Corner get _topRight => .zero;

  @override
  Corner get _bottomLeft => .zero;

  @override
  Corner get _bottomRight => .zero;

  @override
  Corner get _topStart => .zero;

  @override
  Corner get _topEnd => .zero;

  @override
  Corner get _bottomStart => .zero;

  @override
  Corner get _bottomEnd => .zero;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) => _borderRadius;

  @override
  Corners resolve(TextDirection? textDirection) =>
      .fromBorderRadius(_borderRadius.resolve(textDirection));

  @override
  CornersGeometry add(CornersGeometry other) =>
      other is _CornersGeometryFromBorderRadiusGeometry
      ? _CornersGeometryFromBorderRadiusGeometry(
          _borderRadius.add(other._borderRadius),
        )
      : super.add(other);

  @override
  CornersGeometry subtract(CornersGeometry other) =>
      other is _CornersGeometryFromBorderRadiusGeometry
      ? _CornersGeometryFromBorderRadiusGeometry(
          _borderRadius.subtract(other._borderRadius),
        )
      : super.subtract(other);

  @override
  CornersGeometry operator -() =>
      _CornersGeometryFromBorderRadiusGeometry(-_borderRadius);

  @override
  CornersGeometry operator *(double other) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius * other);

  @override
  CornersGeometry operator /(double other) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius / other);

  @override
  CornersGeometry operator ~/(double other) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius ~/ other);

  @override
  CornersGeometry operator %(double other) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius % other);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersGeometryFromBorderRadiusGeometry &&
          _borderRadius == other._borderRadius;

  @override
  int get hashCode => _borderRadius.hashCode;
}

class Corners extends CornersGeometry {
  const Corners.all(Corner corner)
    : this.only(
        topLeft: corner,
        topRight: corner,
        bottomLeft: corner,
        bottomRight: corner,
      );

  const Corners.vertical({Corner top = .zero, Corner bottom = .zero})
    : this.only(
        topLeft: top,
        topRight: top,
        bottomLeft: bottom,
        bottomRight: bottom,
      );

  const Corners.horizontal({Corner left = .zero, Corner right = .zero})
    : this.only(
        topLeft: left,
        topRight: right,
        bottomLeft: left,
        bottomRight: right,
      );

  const Corners.only({
    this.topLeft = .zero,
    this.topRight = .zero,
    this.bottomLeft = .zero,
    this.bottomRight = .zero,
  });

  Corners.fromBorderRadius(BorderRadius borderRadius)
    : topLeft = .fromRadius(borderRadius.topLeft),
      topRight = .fromRadius(borderRadius.topRight),
      bottomLeft = .fromRadius(borderRadius.bottomLeft),
      bottomRight = .fromRadius(borderRadius.bottomRight);

  Corners copyWith({
    Corner? topLeft,
    Corner? topRight,
    Corner? bottomLeft,
    Corner? bottomRight,
  }) => .only(
    topLeft: topLeft ?? this.topLeft,
    topRight: topRight ?? this.topRight,
    bottomLeft: bottomLeft ?? this.bottomLeft,
    bottomRight: bottomRight ?? this.bottomRight,
  );

  final Corner topLeft;

  final Corner topRight;

  final Corner bottomLeft;

  final Corner bottomRight;

  @override
  Corner get _topLeft => topLeft;

  @override
  Corner get _topRight => topRight;

  @override
  Corner get _bottomLeft => bottomLeft;

  @override
  Corner get _bottomRight => bottomRight;

  @override
  Corner get _topStart => .zero;

  @override
  Corner get _topEnd => .zero;

  @override
  Corner get _bottomStart => .zero;

  @override
  Corner get _bottomEnd => .zero;

  @override
  BorderRadius toBorderRadius(Size size) => .only(
    topLeft: topLeft.toRadius(size),
    topRight: topRight.toRadius(size),
    bottomLeft: bottomLeft.toRadius(size),
    bottomRight: bottomRight.toRadius(size),
  );

  RRect toRRect(Rect rect) => toBorderRadius(rect.size).toRRect(rect);

  RSuperellipse toRSuperellipse(Rect rect) =>
      toBorderRadius(rect.size).toRSuperellipse(rect);

  @override
  Corners resolve(TextDirection? direction) => this;

  @override
  CornersGeometry add(CornersGeometry other) =>
      other is Corners ? this + other : super.add(other);

  @override
  CornersGeometry subtract(CornersGeometry other) =>
      other is Corners ? this - other : super.subtract(other);

  Corners operator +(Corners other) => .only(
    topLeft: topLeft.add(other.topLeft),
    topRight: topRight.add(other.topRight),
    bottomLeft: bottomLeft.add(other.bottomLeft),
    bottomRight: bottomRight.add(other.bottomRight),
  );

  Corners operator -(Corners other) => .only(
    topLeft: topLeft.subtract(other.topLeft),
    topRight: topRight.subtract(other.topRight),
    bottomLeft: bottomLeft.subtract(other.bottomLeft),
    bottomRight: bottomRight.subtract(other.bottomRight),
  );

  @override
  Corners operator -() => .only(
    topLeft: -topLeft,
    topRight: -topRight,
    bottomLeft: -bottomLeft,
    bottomRight: -bottomRight,
  );

  @override
  Corners operator *(double other) => .only(
    topLeft: topLeft * other,
    topRight: topRight * other,
    bottomLeft: bottomLeft * other,
    bottomRight: bottomRight * other,
  );

  @override
  Corners operator /(double other) => .only(
    topLeft: topLeft / other,
    topRight: topRight / other,
    bottomLeft: bottomLeft / other,
    bottomRight: bottomRight / other,
  );

  @override
  Corners operator ~/(double other) => .only(
    topLeft: topLeft ~/ other,
    topRight: topRight ~/ other,
    bottomLeft: bottomLeft ~/ other,
    bottomRight: bottomRight ~/ other,
  );

  @override
  Corners operator %(double other) => .only(
    topLeft: topLeft % other,
    topRight: topRight % other,
    bottomLeft: bottomLeft % other,
    bottomRight: bottomRight % other,
  );

  static const zero = Corners.all(.zero);

  static const circle = Corners.all(.round);

  static Corners? lerp(Corners? a, Corners? b, double t) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return .only(
      topLeft: .lerp(a.topLeft, b.topLeft, t)!,
      topRight: .lerp(a.topRight, b.topRight, t)!,
      bottomLeft: .lerp(a.bottomLeft, b.bottomLeft, t)!,
      bottomRight: .lerp(a.bottomRight, b.bottomRight, t)!,
    );
  }
}

class CornersDirectional extends CornersGeometry {
  const CornersDirectional.all(Corner radius)
    : this.only(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      );

  const CornersDirectional.vertical({Corner top = .zero, Corner bottom = .zero})
    : this.only(
        topStart: top,
        topEnd: top,
        bottomStart: bottom,
        bottomEnd: bottom,
      );

  const CornersDirectional.horizontal({
    Corner start = .zero,
    Corner end = .zero,
  }) : this.only(
         topStart: start,
         topEnd: end,
         bottomStart: start,
         bottomEnd: end,
       );

  const CornersDirectional.only({
    this.topStart = .zero,
    this.topEnd = .zero,
    this.bottomStart = .zero,
    this.bottomEnd = .zero,
  });

  CornersDirectional.fromBorderRadius(BorderRadiusDirectional borderRadius)
    : topStart = .fromRadius(borderRadius.topStart),
      topEnd = .fromRadius(borderRadius.topEnd),
      bottomStart = .fromRadius(borderRadius.bottomStart),
      bottomEnd = .fromRadius(borderRadius.bottomEnd);

  final Corner topStart;
  final Corner topEnd;
  final Corner bottomStart;
  final Corner bottomEnd;

  @override
  Corner get _topLeft => .zero;

  @override
  Corner get _topRight => .zero;

  @override
  Corner get _bottomLeft => .zero;

  @override
  Corner get _bottomRight => .zero;

  @override
  Corner get _topStart => topStart;

  @override
  Corner get _topEnd => topEnd;

  @override
  Corner get _bottomStart => bottomStart;

  @override
  Corner get _bottomEnd => bottomEnd;

  @override
  Corners resolve(TextDirection? textDirection) {
    assert(
      debugCheckCanResolveTextDirection(textDirection, "$CornersDirectional"),
    );
    return switch (textDirection!) {
      .ltr => .only(
        topLeft: topStart,
        topRight: topEnd,
        bottomLeft: bottomStart,
        bottomRight: bottomEnd,
      ),
      .rtl => .only(
        topLeft: topEnd,
        topRight: topStart,
        bottomLeft: bottomEnd,
        bottomRight: bottomStart,
      ),
    };
  }

  @override
  BorderRadiusDirectional toBorderRadius(Size size) => .only(
    topStart: topStart.toRadius(size),
    topEnd: topEnd.toRadius(size),
    bottomStart: bottomStart.toRadius(size),
    bottomEnd: bottomEnd.toRadius(size),
  );

  @override
  CornersGeometry add(CornersGeometry other) =>
      other is CornersDirectional ? this + other : super.add(other);

  @override
  CornersGeometry subtract(CornersGeometry other) =>
      other is CornersDirectional ? this - other : super.subtract(other);

  @override
  CornersDirectional operator -() => .only(
    topStart: -topStart,
    topEnd: -topEnd,
    bottomStart: -bottomStart,
    bottomEnd: -bottomEnd,
  );

  CornersDirectional operator -(CornersDirectional other) => .only(
    topStart: topStart.subtract(other.topStart),
    topEnd: topEnd.subtract(other.topEnd),
    bottomStart: bottomStart.subtract(other.bottomStart),
    bottomEnd: bottomEnd.subtract(other.bottomEnd),
  );

  CornersDirectional operator +(CornersDirectional other) => .only(
    topStart: topStart.add(other.topStart),
    topEnd: topEnd.add(other.topEnd),
    bottomStart: bottomStart.add(other.bottomStart),
    bottomEnd: bottomEnd.add(other.bottomEnd),
  );

  @override
  CornersDirectional operator *(double other) => .only(
    topStart: topStart * other,
    topEnd: topEnd * other,
    bottomStart: bottomStart * other,
    bottomEnd: bottomEnd * other,
  );

  @override
  CornersDirectional operator /(double other) => .only(
    topStart: topStart / other,
    topEnd: topEnd / other,
    bottomStart: bottomStart / other,
    bottomEnd: bottomEnd / other,
  );

  @override
  CornersDirectional operator ~/(double other) => .only(
    topStart: topStart ~/ other,
    topEnd: topEnd ~/ other,
    bottomStart: bottomStart ~/ other,
    bottomEnd: bottomEnd ~/ other,
  );

  @override
  CornersDirectional operator %(double other) => .only(
    topStart: topStart % other,
    topEnd: topEnd % other,
    bottomStart: bottomStart % other,
    bottomEnd: bottomEnd % other,
  );

  static const zero = CornersDirectional.all(.zero);

  static const circle = CornersDirectional.all(.round);

  static CornersDirectional? lerp(
    CornersDirectional? a,
    CornersDirectional? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return .only(
      topStart: .lerp(a.topStart, b.topStart, t)!,
      topEnd: .lerp(a.topEnd, b.topEnd, t)!,
      bottomStart: .lerp(a.bottomStart, b.bottomStart, t)!,
      bottomEnd: .lerp(a.bottomEnd, b.bottomEnd, t)!,
    );
  }
}

class _MixedCorners extends CornersGeometry {
  const _MixedCorners(
    this._topLeft,
    this._topRight,
    this._bottomLeft,
    this._bottomRight,
    this._topStart,
    this._topEnd,
    this._bottomStart,
    this._bottomEnd,
  );

  @override
  final Corner _topLeft;

  @override
  final Corner _topRight;

  @override
  final Corner _bottomLeft;

  @override
  final Corner _bottomRight;

  @override
  final Corner _topStart;

  @override
  final Corner _topEnd;

  @override
  final Corner _bottomStart;

  @override
  final Corner _bottomEnd;

  @override
  Corners resolve(TextDirection? textDirection) {
    assert(debugCheckCanResolveTextDirection(textDirection, "$_MixedCorners"));
    return switch (textDirection!) {
      .ltr => .only(
        topLeft: _topLeft.add(_topStart),
        topRight: _topRight.add(_topEnd),
        bottomLeft: _bottomLeft.add(_bottomStart),
        bottomRight: _bottomRight.add(_bottomEnd),
      ),
      .rtl => .only(
        topLeft: _topLeft.subtract(_topEnd),
        topRight: _topRight.subtract(_topStart),
        bottomLeft: _bottomLeft.subtract(_bottomEnd),
        bottomRight: _bottomRight.subtract(_bottomStart),
      ),
    };
  }

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      BorderRadius.only(
        topLeft: _topLeft.toRadius(size),
        topRight: _topRight.toRadius(size),
        bottomLeft: _bottomLeft.toRadius(size),
        bottomRight: _bottomRight.toRadius(size),
      ).add(
        BorderRadiusDirectional.only(
          topStart: _topStart.toRadius(size),
          topEnd: _topEnd.toRadius(size),
          bottomStart: _bottomStart.toRadius(size),
          bottomEnd: _bottomEnd.toRadius(size),
        ),
      );

  @override
  _MixedCorners operator -() => _MixedCorners(
    -_topLeft,
    -_topRight,
    -_bottomLeft,
    -_bottomRight,
    -_topStart,
    -_topEnd,
    -_bottomStart,
    -_bottomEnd,
  );

  @override
  _MixedCorners operator *(double other) => _MixedCorners(
    _topLeft * other,
    _topRight * other,
    _bottomLeft * other,
    _bottomRight * other,
    _topStart * other,
    _topEnd * other,
    _bottomStart * other,
    _bottomEnd * other,
  );

  @override
  _MixedCorners operator /(double other) => _MixedCorners(
    _topLeft / other,
    _topRight / other,
    _bottomLeft / other,
    _bottomRight / other,
    _topStart / other,
    _topEnd / other,
    _bottomStart / other,
    _bottomEnd / other,
  );

  @override
  _MixedCorners operator ~/(double other) => _MixedCorners(
    _topLeft ~/ other,
    _topRight ~/ other,
    _bottomLeft ~/ other,
    _bottomRight ~/ other,
    _topStart ~/ other,
    _topEnd ~/ other,
    _bottomStart ~/ other,
    _bottomEnd ~/ other,
  );

  @override
  _MixedCorners operator %(double other) => _MixedCorners(
    _topLeft % other,
    _topRight % other,
    _bottomLeft % other,
    _bottomRight % other,
    _topStart % other,
    _topEnd % other,
    _bottomStart % other,
    _bottomEnd % other,
  );
}
