// ignore_for_file: use_to_and_as_if_applicable

import 'package:material/src/material/flutter.dart';

// ////////////////////////////////////////////////////////////////
// Compound corner (flexible API and high customizability) //
// ////////////////////////////////////////////////////////////////

abstract class Corner {
  const Corner();

  const factory Corner.fixed(double radius) = FixedCorner.circular;

  const factory Corner.fixedXY(double radiusX, double radiusY) =
      FixedCorner.elliptical;

  const factory Corner.fractional(double fraction) = FractionalCorner.circular;

  const factory Corner.fractionalXY(double fractionX, double fractionY) =
      FractionalCorner.elliptical;

  const factory Corner.fromRadius(Radius radius) = FixedCorner.fromRadius;

  /// Whether every dimension is non-negative.
  // bool get isNonNegative;

  /// A [Corner] with X and Y swapped.
  Corner get flipped;

  Corner clamp(Corner minimum, Corner maximum) =>
      _CornerClamp(this, minimum, maximum);

  Radius toRadius(Size size);

  Corner add(Corner other) => _CornerAdd(this, other);

  Corner subtract(Corner other) => _CornerSubtract(this, other);

  Corner operator -() => _CornerUnaryNegation(this);

  Corner operator *(double operand) => _CornerMultiply(this, operand);

  Corner operator /(double operand) => _CornerDivideDouble(this, operand);

  Corner operator ~/(double operand) => _CornerDivideInt(this, operand);

  Corner operator %(double operand) => _CornerModulo(this, operand);

  static const Corner zero = _ZeroCorner();

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
    if (a is _Corner && b is _Corner) {
      return _MixedCorner(
        lerpDouble(a._radiusX, b._radiusX, t),
        lerpDouble(a._radiusY, b._radiusY, t),
        lerpDouble(a._fractionX, b._fractionX, t),
        lerpDouble(a._fractionY, b._fractionY, t),
      );
    }
    return _CornerLerp(a, b, t);
  }
}

final class _CornerUnaryNegation extends Corner {
  const _CornerUnaryNegation(Corner value) : _value = value;

  final Corner _value;

  @override
  _CornerUnaryNegation get flipped => _CornerUnaryNegation(_value.flipped);

  @override
  Radius toRadius(Size size) => -_value.toRadius(size);

  @override
  Corner operator -() => _value;

  @override
  String toString() => "-$_value";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornerUnaryNegation && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class _CornerWithDoubleOperation extends Corner {
  const _CornerWithDoubleOperation(Corner value, double operand)
    : _value = value,
      _operand = operand;

  final Corner _value;
  final double _operand;

  // Runtime type participates in checks because this class has specializations.

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CornerWithDoubleOperation &&
          _value == other._value &&
          _operand == other._operand;

  @override
  int get hashCode => Object.hash(_value, _operand);
}

final class _CornerMultiply extends _CornerWithDoubleOperation {
  const _CornerMultiply(super.value, super.operand);

  @override
  _CornerMultiply get flipped => _CornerMultiply(_value.flipped, _operand);

  @override
  Radius toRadius(Size size) => _value.toRadius(size) * _operand;

  @override
  String toString() => "$_value * ${_operand.toStringAsFixed(1)}";
}

final class _CornerDivideDouble extends _CornerWithDoubleOperation {
  const _CornerDivideDouble(super.value, super.operand);

  @override
  _CornerDivideDouble get flipped =>
      _CornerDivideDouble(_value.flipped, _operand);

  @override
  Radius toRadius(Size size) => _value.toRadius(size) / _operand;

  @override
  String toString() => "$_value / ${_operand.toStringAsFixed(1)}";
}

final class _CornerDivideInt extends _CornerWithDoubleOperation {
  const _CornerDivideInt(super.value, super.operand);

  @override
  _CornerDivideInt get flipped => _CornerDivideInt(_value.flipped, _operand);

  @override
  Radius toRadius(Size size) => _value.toRadius(size) ~/ _operand;

  @override
  String toString() => "$_value ~/ ${_operand.toStringAsFixed(1)}";
}

final class _CornerModulo extends _CornerWithDoubleOperation {
  const _CornerModulo(super.value, super.operand);

  @override
  _CornerModulo get flipped => _CornerModulo(_value.flipped, _operand);

  @override
  Radius toRadius(Size size) => _value.toRadius(size) % _operand;

  @override
  String toString() => "$_value % ${_operand.toStringAsFixed(1)}";
}

abstract class _CornerWithCornerOperation extends Corner {
  const _CornerWithCornerOperation(Corner a, Corner b) : _a = a, _b = b;

  final Corner _a;
  final Corner _b;

  // Runtime type participates in checks because this class has specializations.

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CornerWithCornerOperation &&
          _a == other._a &&
          _b == other._b;

  @override
  int get hashCode => Object.hash(_a, _b);
}

final class _CornerAdd extends _CornerWithCornerOperation {
  const _CornerAdd(super.a, super.b);

  @override
  _CornerAdd get flipped => _CornerAdd(_a.flipped, _b.flipped);

  @override
  Radius toRadius(Size size) => _a.toRadius(size) + _b.toRadius(size);

  @override
  String toString() => "$_a + $_b";
}

final class _CornerSubtract extends _CornerWithCornerOperation {
  const _CornerSubtract(super.a, super.b);

  @override
  _CornerSubtract get flipped => _CornerSubtract(_a.flipped, _b.flipped);

  @override
  Radius toRadius(Size size) => _a.toRadius(size) - _b.toRadius(size);

  @override
  String toString() => "$_a - $_b";
}

final class _CornerClamp extends Corner {
  const _CornerClamp(Corner value, Corner minimum, Corner maximum)
    : _value = value,
      _minimum = minimum,
      _maximum = maximum;

  final Corner _value;
  final Corner _minimum;
  final Corner _maximum;

  @override
  _CornerClamp get flipped =>
      _CornerClamp(_value.flipped, _minimum.flipped, _maximum.flipped);

  @override
  Radius toRadius(Size size) {
    final value = _value.toRadius(size);
    final minimum = _minimum.toRadius(size);
    final maximum = _maximum.toRadius(size);
    return .elliptical(
      clampDouble(value.x, minimum.x, maximum.x),
      clampDouble(value.y, minimum.y, maximum.y),
    );
  }

  @override
  String toString() => "$_value.clamp($_minimum, $_maximum)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornerClamp &&
          _value == other._value &&
          _minimum == other._minimum &&
          _maximum == other._maximum;

  @override
  int get hashCode => Object.hash(_value, _minimum, _maximum);
}

final class _CornerLerp extends Corner {
  const _CornerLerp(Corner a, Corner b, double t) : _a = a, _b = b, _t = t;

  final Corner _a;
  final Corner _b;
  final double _t;

  @override
  _CornerLerp get flipped => _CornerLerp(_a.flipped, _b.flipped, _t);

  @override
  Radius toRadius(Size size) {
    final a = _a.toRadius(size);
    final b = _b.toRadius(size);
    return .elliptical(lerpDouble(a.x, b.x, _t), lerpDouble(a.y, b.y, _t));
  }

  @override
  String toString() => "Corner.lerp($_a, $_b, ${_t.toStringAsFixed(1)})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornerLerp &&
          _a == other._a &&
          _b == other._b &&
          _t == other._t;

  @override
  int get hashCode => Object.hash(_a, _b, _t);
}

// ////////////////////////////////////////////////////////////////
// Mixed corner (optimized for fast linear arithmetic) //
// ////////////////////////////////////////////////////////////////

abstract class _Corner extends Corner {
  const _Corner();

  double get _radiusX;
  double get _radiusY;
  double get _fractionX;
  double get _fractionY;

  // @override
  // bool get isNonNegative =>
  //     _radiusX >= 0.0 &&
  //     _radiusY >= 0.0 &&
  //     _fractionX >= 0.0 &&
  //     _fractionY >= 0.0;

  @override
  _Corner get flipped =>
      _MixedCorner(_radiusY, _radiusX, _fractionY, _fractionX);

  @override
  Corner clamp(Corner minimum, Corner maximum) =>
      minimum is _Corner && maximum is _Corner
      ? _MixedCorner(
          clampDouble(_radiusX, minimum._radiusX, maximum._radiusX),
          clampDouble(_radiusY, minimum._radiusY, maximum._radiusY),
          clampDouble(_fractionX, minimum._fractionX, maximum._fractionX),
          clampDouble(_fractionY, minimum._fractionY, maximum._fractionY),
        )
      : super.clamp(minimum, maximum);

  @override
  Radius toRadius(Size size) {
    final shortestSide = size.shortestSide;
    return .elliptical(
      _radiusX + shortestSide * _fractionX,
      _radiusY + shortestSide * _fractionY,
    );
  }

  @override
  Corner add(Corner other) => other is _Corner
      ? _MixedCorner(
          _radiusX + other._radiusX,
          _radiusY + other._radiusY,
          _fractionX + other._fractionX,
          _fractionY + other._fractionY,
        )
      : super.add(other);

  @override
  Corner subtract(Corner other) => other is _Corner
      ? _MixedCorner(
          _radiusX - other._radiusX,
          _radiusY - other._radiusY,
          _fractionX - other._fractionX,
          _fractionY - other._fractionY,
        )
      : super.subtract(other);

  @override
  _Corner operator -() =>
      _MixedCorner(-_radiusX, -_radiusY, -_fractionX, -_fractionY);

  @override
  _Corner operator *(double operand) => _MixedCorner(
    _radiusX * operand,
    _radiusY * operand,
    _fractionX * operand,
    _fractionY * operand,
  );

  @override
  _Corner operator /(double operand) => _MixedCorner(
    _radiusX / operand,
    _radiusY / operand,
    _fractionX / operand,
    _fractionY / operand,
  );

  @override
  _Corner operator ~/(double operand) => _MixedCorner(
    (_radiusX ~/ operand).toDouble(),
    (_radiusY ~/ operand).toDouble(),
    (_fractionX ~/ operand).toDouble(),
    (_fractionY ~/ operand).toDouble(),
  );

  @override
  _Corner operator %(double operand) => _MixedCorner(
    _radiusX % operand,
    _radiusY % operand,
    _fractionX % operand,
    _fractionY % operand,
  );

  @override
  String toString() {
    // Used to determine whether the corner is zero.
    final zeroFixed = _radiusX == 0.0 && _radiusY == 0.0;
    final zeroFractional = _fractionX == 0.0 && _fractionY == 0.0;

    // Lazily initialize fixed and fractional parts.
    late final fixed = _radiusX == _radiusY
        ? "Corner.fixed(${_radiusX.toStringAsFixed(1)})"
        : "Corner.fixedXY(${_radiusX.toStringAsFixed(1)}, "
              "${_radiusY.toStringAsFixed(1)})";
    late final fractional = _fractionX == _fractionY
        ? "Corner.fractional(${_fractionX.toStringAsFixed(1)})"
        : "Corner.fractionalXY(${_fractionX.toStringAsFixed(1)}, "
              "${_fractionY.toStringAsFixed(1)})";

    // Return "Corner.zero" if both radius and fraction are zero,
    // otherwise returns a single non-zero part or a concatenation
    // if both are non-zero.
    return zeroFixed
        ? (zeroFractional ? "Corner.zero" : fractional)
        : (zeroFractional ? fixed : "$fixed + $fractional");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Corner &&
          _radiusX == other._radiusX &&
          _radiusY == other._radiusY &&
          _fractionX == other._fractionX &&
          _fractionY == other._fractionY;

  @override
  int get hashCode => Object.hash(_radiusX, _radiusY, _fractionX, _fractionY);
}

final class _MixedCorner extends _Corner {
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
}

final class _ZeroCorner extends _Corner {
  const _ZeroCorner();

  @override
  double get _radiusX => 0.0;

  @override
  double get _radiusY => 0.0;

  @override
  double get _fractionX => 0.0;

  @override
  double get _fractionY => 0.0;

  // @override
  // bool get isNonNegative => true;

  @override
  _ZeroCorner get flipped => this;

  @override
  Radius toRadius(Size size) => .zero;

  @override
  Corner add(Corner other) => other is _ZeroCorner ? this : other;

  @override
  Corner subtract(Corner other) => other is _ZeroCorner ? this : -other;

  @override
  _ZeroCorner operator -() => this;

  @override
  _ZeroCorner operator *(double operand) => this;

  @override
  _ZeroCorner operator /(double operand) => this;

  @override
  _ZeroCorner operator ~/(double operand) => this;

  @override
  _ZeroCorner operator %(double operand) => this;
}

abstract class FixedCorner extends _Corner {
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
  // @override
  // bool get isNonNegative => radiusX >= 0.0 && radiusY >= 0.0;

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

final class _FixedCorner extends FixedCorner {
  const _FixedCorner.elliptical(this.radiusX, this.radiusY);

  const _FixedCorner.circular(double radius) : this.elliptical(radius, radius);

  @override
  final double radiusX;

  @override
  final double radiusY;
}

final class _FixedCornerFromRadius extends FixedCorner {
  const _FixedCornerFromRadius(this._radius);

  final Radius _radius;

  @override
  double get radiusX => _radius.x;

  @override
  double get radiusY => _radius.y;

  @override
  Radius toRadius(Size size) => _radius;
}

abstract class FractionalCorner extends _Corner {
  const FractionalCorner();

  const factory FractionalCorner.elliptical(
    double fractionX,
    double fractionY,
  ) = _FractionalCorner.elliptical;

  const factory FractionalCorner.circular(double fraction) =
      _FractionalCorner.circular;

  double get fractionX;

  double get fractionY;

  @override
  double get _radiusX => 0.0;

  @override
  double get _radiusY => 0.0;

  @override
  double get _fractionX => fractionX;

  @override
  double get _fractionY => fractionY;

  /// Whether every dimension is non-negative.
  // @override
  // bool get isNonNegative => fractionY >= 0.0 && fractionY >= 0.0;

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

final class _FractionalCorner extends FractionalCorner {
  const _FractionalCorner.elliptical(this.fractionX, this.fractionY);

  const _FractionalCorner.circular(double fraction)
    : this.elliptical(fraction, fraction);

  @override
  final double fractionX;

  @override
  final double fractionY;
}
