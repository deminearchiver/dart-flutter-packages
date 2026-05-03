// ignore_for_file: use_to_and_as_if_applicable

import 'package:material/src/material/flutter.dart';

extension CornersGeometryArithmetic on CornersGeometry {
  CornersGeometry operator +(CornersGeometry other) => add(other);

  CornersGeometry operator -(CornersGeometry other) => subtract(other);
}

// ////////////////////////////////////////////////////////////////
// Compound corners (flexible API and high customizability) //
// ////////////////////////////////////////////////////////////////

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

  Corners resolve(TextDirection? textDirection);

  // This should probably be removed to not break the chain
  // TODO: is it feasible to remove this? (investigate in 1P)
  BorderRadiusGeometry toBorderRadius(Size size);

  CornersGeometry add(CornersGeometry other) => _CornersAdd(this, other);

  CornersGeometry subtract(CornersGeometry other) =>
      _CornersSubtract(this, other);

  CornersGeometry operator -() => _CornersUnaryNegation(this);

  CornersGeometry operator *(double operand) => _CornersMultiply(this, operand);

  CornersGeometry operator /(double operand) =>
      _CornersDivideDouble(this, operand);

  CornersGeometry operator ~/(double operand) =>
      _CornersDivideInt(this, operand);

  CornersGeometry operator %(double operand) => _CornersModulo(this, operand);

  static const CornersGeometry zero = _ZeroCorners();

  // TODO: rename to "circular" because it better matches spec
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
    if (a is _CornersGeometry && b is _CornersGeometry) {
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
    // TODO: implement CornersGeometry.lerp
    throw UnimplementedError("CornersGeometry.lerp has not been implemented.");
  }
}

final class _CornersGeometryFromBorderRadiusGeometry extends CornersGeometry {
  const _CornersGeometryFromBorderRadiusGeometry(this._borderRadius);

  final BorderRadiusGeometry _borderRadius;

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
  CornersGeometry operator *(double operand) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius * operand);

  @override
  CornersGeometry operator /(double operand) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius / operand);

  @override
  CornersGeometry operator ~/(double operand) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius ~/ operand);

  @override
  CornersGeometry operator %(double operand) =>
      _CornersGeometryFromBorderRadiusGeometry(_borderRadius % operand);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersGeometryFromBorderRadiusGeometry &&
          _borderRadius == other._borderRadius;

  @override
  int get hashCode => _borderRadius.hashCode;
}

final class _CornersUnaryNegation extends CornersGeometry {
  const _CornersUnaryNegation(CornersGeometry value) : _value = value;

  final CornersGeometry _value;

  @override
  Corners resolve(TextDirection? textDirection) =>
      -_value.resolve(textDirection);

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      -_value.toBorderRadius(size);

  @override
  CornersGeometry operator -() => _value;

  @override
  String toString() => "-$_value";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersUnaryNegation && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class _CornersWithDoubleOperation extends CornersGeometry {
  const _CornersWithDoubleOperation(CornersGeometry value, double operand)
    : _value = value,
      _operand = operand;

  final CornersGeometry _value;
  final double _operand;

  // Runtime type participates in checks because this class has specializations.

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CornersWithDoubleOperation &&
          _value == other._value &&
          _operand == other._operand;

  @override
  int get hashCode => Object.hash(_value, _operand);
}

final class _CornersMultiply extends _CornersWithDoubleOperation {
  const _CornersMultiply(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) * _operand;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _value.toBorderRadius(size) * _operand;

  @override
  String toString() => "$_value * ${_operand.toStringAsFixed(1)}";
}

final class _CornersDivideDouble extends _CornersWithDoubleOperation {
  const _CornersDivideDouble(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) / _operand;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _value.toBorderRadius(size) / _operand;

  @override
  String toString() => "$_value / ${_operand.toStringAsFixed(1)}";
}

final class _CornersDivideInt extends _CornersWithDoubleOperation {
  const _CornersDivideInt(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) ~/ _operand;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _value.toBorderRadius(size) ~/ _operand;

  @override
  String toString() => "$_value ~/ ${_operand.toStringAsFixed(1)}";
}

final class _CornersModulo extends _CornersWithDoubleOperation {
  const _CornersModulo(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) % _operand;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _value.toBorderRadius(size) % _operand;

  @override
  String toString() => "$_value % ${_operand.toStringAsFixed(1)}";
}

abstract class _CornersWithCornersOperation extends CornersGeometry {
  const _CornersWithCornersOperation(CornersGeometry a, CornersGeometry b)
    : _a = a,
      _b = b;

  final CornersGeometry _a;
  final CornersGeometry _b;

  // Runtime type participates in checks because this class has specializations.

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CornersWithCornersOperation &&
          _a == other._a &&
          _b == other._b;

  @override
  int get hashCode => Object.hash(_a, _b);
}

final class _CornersAdd extends _CornersWithCornersOperation {
  const _CornersAdd(super.a, super.b);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _a.resolve(textDirection) + _b.resolve(textDirection);

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _a.toBorderRadius(size).add(_b.toBorderRadius(size));

  @override
  String toString() => "$_a + $_b";
}

final class _CornersSubtract extends _CornersWithCornersOperation {
  const _CornersSubtract(super.a, super.b);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _a.resolve(textDirection) - _b.resolve(textDirection);

  @override
  BorderRadiusGeometry toBorderRadius(Size size) =>
      _a.toBorderRadius(size).subtract(_b.toBorderRadius(size));

  @override
  String toString() => "$_a - $_b";
}

final class _CornersLerp extends CornersGeometry {
  const _CornersLerp(CornersGeometry a, CornersGeometry b, double t)
    : _a = a,
      _b = b,
      _t = t;

  final CornersGeometry _a;
  final CornersGeometry _b;
  final double _t;

  @override
  Corners resolve(TextDirection? textDirection) =>
      .lerp(_a.resolve(textDirection), _b.resolve(textDirection), _t)!;

  @override
  BorderRadiusGeometry toBorderRadius(Size size) {
    if (identical(_a, _b)) return _a.toBorderRadius(size);
    final a = _a.toBorderRadius(size);
    final b = _b.toBorderRadius(size);
    if (a is BorderRadius && b is BorderRadius) {
      return BorderRadius.only(
        topLeft: Radius.lerp(a.topLeft, b.topLeft, _t)!,
        topRight: Radius.lerp(a.topRight, b.topRight, _t)!,
        bottomLeft: Radius.lerp(a.bottomLeft, b.bottomLeft, _t)!,
        bottomRight: Radius.lerp(a.bottomRight, b.bottomRight, _t)!,
      );
    }
    if (a is BorderRadiusDirectional && b is BorderRadiusDirectional) {
      return BorderRadiusDirectional.only(
        topStart: Radius.lerp(a.topStart, b.topStart, _t)!,
        topEnd: Radius.lerp(a.topEnd, b.topEnd, _t)!,
        bottomStart: Radius.lerp(a.bottomStart, b.bottomStart, _t)!,
        bottomEnd: Radius.lerp(a.bottomEnd, b.bottomEnd, _t)!,
      );
    }
    return a.add((b.subtract(a)) * _t);
  }

  @override
  String toString() =>
      "CornersGeometry.lerp($_a, $_b, ${_t.toStringAsFixed(1)})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersLerp &&
          _a == other._a &&
          _b == other._b &&
          _t == other._t;

  @override
  int get hashCode => Object.hash(_a, _b, _t);
}

// ////////////////////////////////////////////////////////////////
// Mixed corners (optimized for fast linear arithmetic) //
// ////////////////////////////////////////////////////////////////

abstract class _CornersGeometry extends CornersGeometry {
  const _CornersGeometry();

  Corner get _topLeft;

  Corner get _topRight;

  Corner get _bottomLeft;

  Corner get _bottomRight;

  Corner get _topStart;

  Corner get _topEnd;

  Corner get _bottomStart;

  Corner get _bottomEnd;

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
  CornersGeometry add(CornersGeometry other) => other is _CornersGeometry
      ? _MixedCorners(
          _topLeft.add(other._topLeft),
          _topRight.add(other._topRight),
          _bottomLeft.add(other._bottomLeft),
          _bottomRight.add(other._bottomRight),
          _topStart.add(other._topStart),
          _topEnd.add(other._topEnd),
          _bottomStart.add(other._bottomStart),
          _bottomEnd.add(other._bottomEnd),
        )
      : super.add(other);

  @override
  CornersGeometry subtract(CornersGeometry other) => other is _CornersGeometry
      ? _MixedCorners(
          _topLeft.subtract(other._topLeft),
          _topRight.subtract(other._topRight),
          _bottomLeft.subtract(other._bottomLeft),
          _bottomRight.subtract(other._bottomRight),
          _topStart.subtract(other._topStart),
          _topEnd.subtract(other._topEnd),
          _bottomStart.subtract(other._bottomStart),
          _bottomEnd.subtract(other._bottomEnd),
        )
      : super.subtract(other);

  @override
  _CornersGeometry operator -() => _MixedCorners(
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
  _CornersGeometry operator *(double operand) => _MixedCorners(
    _topLeft * operand,
    _topRight * operand,
    _bottomLeft * operand,
    _bottomRight * operand,
    _topStart * operand,
    _topEnd * operand,
    _bottomStart * operand,
    _bottomEnd * operand,
  );

  @override
  _CornersGeometry operator /(double operand) => _MixedCorners(
    _topLeft / operand,
    _topRight / operand,
    _bottomLeft / operand,
    _bottomRight / operand,
    _topStart / operand,
    _topEnd / operand,
    _bottomStart / operand,
    _bottomEnd / operand,
  );

  @override
  _CornersGeometry operator ~/(double operand) => _MixedCorners(
    _topLeft ~/ operand,
    _topRight ~/ operand,
    _bottomLeft ~/ operand,
    _bottomRight ~/ operand,
    _topStart ~/ operand,
    _topEnd ~/ operand,
    _bottomStart ~/ operand,
    _bottomEnd ~/ operand,
  );

  @override
  _CornersGeometry operator %(double operand) => _MixedCorners(
    _topLeft % operand,
    _topRight % operand,
    _bottomLeft % operand,
    _bottomRight % operand,
    _topStart % operand,
    _topEnd % operand,
    _bottomStart % operand,
    _bottomEnd % operand,
  );

  @override
  String toString() {
    String? visual;
    String? logical;
    if (_topLeft == _topRight &&
        _topRight == _bottomLeft &&
        _bottomLeft == _bottomRight) {
      if (_topLeft != .zero) visual = "Corners.all($_topLeft)";
    } else {
      final result = StringBuffer("Corners.only(");
      var comma = false;
      if (_topLeft != .zero) {
        result.write("topLeft: $_topLeft");
        comma = true;
      }
      if (_topRight != .zero) {
        if (comma) result.write(", ");
        result.write("topRight: $_topRight");
        comma = true;
      }
      if (_bottomLeft != .zero) {
        if (comma) result.write(", ");
        result.write("bottomLeft: $_bottomLeft");
        comma = true;
      }
      if (_bottomRight != .zero) {
        if (comma) result.write(", ");
        result.write("bottomRight: $_bottomRight");
      }
      result.write(")");
      visual = result.toString();
    }
    if (_topStart == _topEnd &&
        _topEnd == _bottomEnd &&
        _bottomEnd == _bottomStart) {
      if (_topStart != .zero) logical = "CornersDirectional.all($_topStart)";
    } else {
      final result = StringBuffer("CornersDirectional.only(");
      var comma = false;
      if (_topStart != .zero) {
        result.write("topStart: $_topStart");
        comma = true;
      }
      if (_topEnd != .zero) {
        if (comma) result.write(", ");
        result.write("topEnd: $_topEnd");
        comma = true;
      }
      if (_bottomStart != .zero) {
        if (comma) result.write(", ");
        result.write("bottomStart: $_bottomStart");
        comma = true;
      }
      if (_bottomEnd != .zero) {
        if (comma) result.write(", ");
        result.write("bottomEnd: $_bottomEnd");
      }
      result.write(")");
      logical = result.toString();
    }
    return visual != null && logical != null
        ? "$visual + $logical"
        : visual ?? logical ?? "Corners.zero";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersGeometry &&
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
}

final class _MixedCorners extends _CornersGeometry {
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
}

final class _ZeroCorners extends _CornersGeometry {
  const _ZeroCorners();

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
  Corners resolve(TextDirection? textDirection) => .zero;

  @override
  BorderRadius toBorderRadius(Size size) => .zero;

  @override
  CornersGeometry add(CornersGeometry other) =>
      other is _ZeroCorners ? this : other;

  @override
  CornersGeometry subtract(CornersGeometry other) =>
      other is _ZeroCorners ? this : -other;

  @override
  _ZeroCorners operator -() => this;

  @override
  _ZeroCorners operator *(double operand) => this;

  @override
  _ZeroCorners operator /(double operand) => this;

  @override
  _ZeroCorners operator ~/(double operand) => this;

  @override
  _ZeroCorners operator %(double operand) => this;
}

abstract class Corners extends _CornersGeometry {
  const Corners();

  const factory Corners.all(Corner corner) = _Corners.all;

  const factory Corners.vertical({Corner top, Corner bottom}) =
      _Corners.vertical;

  const factory Corners.horizontal({Corner left, Corner right}) =
      _Corners.horizontal;

  const factory Corners.only({
    Corner topLeft,
    Corner topRight,
    Corner bottomLeft,
    Corner bottomRight,
  }) = _Corners.only;

  // TODO: decide if we want const here but getters call Corner.fromRadius
  factory Corners.fromBorderRadius(BorderRadius borderRadius) =
      _Corners.fromBorderRadius;

  Corner get topLeft;

  Corner get topRight;

  Corner get bottomLeft;

  Corner get bottomRight;

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
  Corners resolve(TextDirection? textDirection) => this;

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
  Corners operator *(double operand) => .only(
    topLeft: topLeft * operand,
    topRight: topRight * operand,
    bottomLeft: bottomLeft * operand,
    bottomRight: bottomRight * operand,
  );

  @override
  Corners operator /(double operand) => .only(
    topLeft: topLeft / operand,
    topRight: topRight / operand,
    bottomLeft: bottomLeft / operand,
    bottomRight: bottomRight / operand,
  );

  @override
  Corners operator ~/(double operand) => .only(
    topLeft: topLeft ~/ operand,
    topRight: topRight ~/ operand,
    bottomLeft: bottomLeft ~/ operand,
    bottomRight: bottomRight ~/ operand,
  );

  @override
  Corners operator %(double operand) => .only(
    topLeft: topLeft % operand,
    topRight: topRight % operand,
    bottomLeft: bottomLeft % operand,
    bottomRight: bottomRight % operand,
  );

  static const zero = Corners.all(.zero);

  // TODO: rename to "circular" because it better matches spec
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

final class _Corners extends Corners {
  const _Corners.all(Corner corner)
    : this.only(
        topLeft: corner,
        topRight: corner,
        bottomLeft: corner,
        bottomRight: corner,
      );

  const _Corners.vertical({Corner top = .zero, Corner bottom = .zero})
    : this.only(
        topLeft: top,
        topRight: top,
        bottomLeft: bottom,
        bottomRight: bottom,
      );

  const _Corners.horizontal({Corner left = .zero, Corner right = .zero})
    : this.only(
        topLeft: left,
        topRight: right,
        bottomLeft: left,
        bottomRight: right,
      );

  const _Corners.only({
    this.topLeft = .zero,
    this.topRight = .zero,
    this.bottomLeft = .zero,
    this.bottomRight = .zero,
  });

  _Corners.fromBorderRadius(BorderRadius borderRadius)
    : topLeft = .fromRadius(borderRadius.topLeft),
      topRight = .fromRadius(borderRadius.topRight),
      bottomLeft = .fromRadius(borderRadius.bottomLeft),
      bottomRight = .fromRadius(borderRadius.bottomRight);

  @override
  final Corner topLeft;

  @override
  final Corner topRight;

  @override
  final Corner bottomLeft;

  @override
  final Corner bottomRight;
}

abstract class CornersDirectional extends _CornersGeometry {
  const CornersDirectional();

  const factory CornersDirectional.all(Corner radius) = _CornersDirectional.all;

  const factory CornersDirectional.vertical({Corner top, Corner bottom}) =
      _CornersDirectional.vertical;

  const factory CornersDirectional.horizontal({Corner start, Corner end}) =
      _CornersDirectional.horizontal;

  const factory CornersDirectional.only({
    Corner topStart,
    Corner topEnd,
    Corner bottomStart,
    Corner bottomEnd,
  }) = _CornersDirectional.only;

  // TODO: decide if we want const here but getters call Corner.fromRadius
  factory CornersDirectional.fromBorderRadius(
    BorderRadiusDirectional borderRadius,
  ) = _CornersDirectional.fromBorderRadius;

  Corner get topStart;

  Corner get topEnd;

  Corner get bottomStart;

  Corner get bottomEnd;

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

  CornersDirectional copyWith({
    Corner? topStart,
    Corner? topEnd,
    Corner? bottomStart,
    Corner? bottomEnd,
  }) => .only(
    topStart: topStart ?? this.topStart,
    topEnd: topEnd ?? this.topEnd,
    bottomStart: bottomStart ?? this.bottomStart,
    bottomEnd: bottomEnd ?? this.bottomEnd,
  );

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
  CornersDirectional operator *(double operand) => .only(
    topStart: topStart * operand,
    topEnd: topEnd * operand,
    bottomStart: bottomStart * operand,
    bottomEnd: bottomEnd * operand,
  );

  @override
  CornersDirectional operator /(double operand) => .only(
    topStart: topStart / operand,
    topEnd: topEnd / operand,
    bottomStart: bottomStart / operand,
    bottomEnd: bottomEnd / operand,
  );

  @override
  CornersDirectional operator ~/(double operand) => .only(
    topStart: topStart ~/ operand,
    topEnd: topEnd ~/ operand,
    bottomStart: bottomStart ~/ operand,
    bottomEnd: bottomEnd ~/ operand,
  );

  @override
  CornersDirectional operator %(double operand) => .only(
    topStart: topStart % operand,
    topEnd: topEnd % operand,
    bottomStart: bottomStart % operand,
    bottomEnd: bottomEnd % operand,
  );

  static const zero = CornersDirectional.all(.zero);

  // TODO: rename to "circular" because it better matches spec
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

final class _CornersDirectional extends CornersDirectional {
  const _CornersDirectional.all(Corner radius)
    : this.only(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      );

  const _CornersDirectional.vertical({
    Corner top = .zero,
    Corner bottom = .zero,
  }) : this.only(
         topStart: top,
         topEnd: top,
         bottomStart: bottom,
         bottomEnd: bottom,
       );

  const _CornersDirectional.horizontal({
    Corner start = .zero,
    Corner end = .zero,
  }) : this.only(
         topStart: start,
         topEnd: end,
         bottomStart: start,
         bottomEnd: end,
       );

  const _CornersDirectional.only({
    this.topStart = .zero,
    this.topEnd = .zero,
    this.bottomStart = .zero,
    this.bottomEnd = .zero,
  });

  _CornersDirectional.fromBorderRadius(BorderRadiusDirectional borderRadius)
    : topStart = .fromRadius(borderRadius.topStart),
      topEnd = .fromRadius(borderRadius.topEnd),
      bottomStart = .fromRadius(borderRadius.bottomStart),
      bottomEnd = .fromRadius(borderRadius.bottomEnd);

  @override
  final Corner topStart;

  @override
  final Corner topEnd;

  @override
  final Corner bottomStart;

  @override
  final Corner bottomEnd;
}
