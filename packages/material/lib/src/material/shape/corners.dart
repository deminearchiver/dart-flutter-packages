// ignore_for_file: use_to_and_as_if_applicable

import 'package:material/src/material/flutter.dart';

// ////////////////////////////////////////////////////////////////
// Compound corners (flexible API and high customizability) //
// ////////////////////////////////////////////////////////////////

abstract class CornersGeometry {
  const CornersGeometry();

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

  const factory CornersGeometry.all(Corner corner) = Corners.all;

  const factory CornersGeometry.vertical({Corner top, Corner bottom}) =
      Corners.vertical;

  const factory CornersGeometry.horizontal({Corner left, Corner right}) =
      Corners.horizontal;

  // TODO: add .directionalHorizontal or .horizontalDirectional (decide on name)

  const factory CornersGeometry.fromBorderRadius(
    BorderRadiusGeometry borderRadius,
  ) = _CornersGeometryFromBorderRadiusGeometry;

  CornersGeometry clamp({CornersGeometry? minimum, CornersGeometry? maximum}) =>
      _CornersClamp(this, minimum, maximum);

  Corners resolve(TextDirection? textDirection);

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
        .lerp(a._topLeft, b._topLeft, t),
        .lerp(a._topRight, b._topRight, t),
        .lerp(a._bottomLeft, b._bottomLeft, t),
        .lerp(a._bottomRight, b._bottomRight, t),
        .lerp(a._topStart, b._topStart, t),
        .lerp(a._topEnd, b._topEnd, t),
        .lerp(a._bottomStart, b._bottomStart, t),
        .lerp(a._bottomEnd, b._bottomEnd, t),
      );
    }
    return _CornersLerp(a, b, t);
  }
}

final class _CornersGeometryFromBorderRadiusGeometry extends CornersGeometry {
  const _CornersGeometryFromBorderRadiusGeometry(this._borderRadius);

  final BorderRadiusGeometry _borderRadius;

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
  String toString() => "$_value * ${_operand.toStringAsFixed(1)}";
}

final class _CornersDivideDouble extends _CornersWithDoubleOperation {
  const _CornersDivideDouble(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) / _operand;

  @override
  String toString() => "$_value / ${_operand.toStringAsFixed(1)}";
}

final class _CornersDivideInt extends _CornersWithDoubleOperation {
  const _CornersDivideInt(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) ~/ _operand;

  @override
  String toString() => "$_value ~/ ${_operand.toStringAsFixed(1)}";
}

final class _CornersModulo extends _CornersWithDoubleOperation {
  const _CornersModulo(super.value, super.operand);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _value.resolve(textDirection) % _operand;

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
  String toString() => "$_a + $_b";
}

final class _CornersSubtract extends _CornersWithCornersOperation {
  const _CornersSubtract(super.a, super.b);

  @override
  Corners resolve(TextDirection? textDirection) =>
      _a.resolve(textDirection) - _b.resolve(textDirection);

  @override
  String toString() => "$_a - $_b";
}

final class _CornersClamp extends CornersGeometry {
  const _CornersClamp(
    CornersGeometry value,
    CornersGeometry? minimum,
    CornersGeometry? maximum,
  ) : _value = value,
      _minimum = minimum,
      _maximum = maximum;

  final CornersGeometry _value;
  final CornersGeometry? _minimum;
  final CornersGeometry? _maximum;

  @override
  Corners resolve(TextDirection? textDirection) {
    final value = _value.resolve(textDirection);
    final minimum = _minimum?.resolve(textDirection);
    final maximum = _maximum?.resolve(textDirection);
    return .only(
      topLeft: value.topLeft.clamp(
        minimum: minimum?.topLeft,
        maximum: maximum?.topLeft,
      ),
      topRight: value.topRight.clamp(
        minimum: minimum?.topRight,
        maximum: maximum?.topRight,
      ),
      bottomLeft: value.bottomLeft.clamp(
        minimum: minimum?.bottomLeft,
        maximum: maximum?.bottomLeft,
      ),
      bottomRight: value.bottomRight.clamp(
        minimum: minimum?.bottomRight,
        maximum: maximum?.bottomRight,
      ),
    );
  }

  @override
  String toString() => "$_value.clamp($_minimum, $_maximum)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CornersClamp &&
          _value == other._value &&
          _minimum == other._minimum &&
          _maximum == other._maximum;

  @override
  int get hashCode => Object.hash(_value, _minimum, _maximum);
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

  Corner? get _topLeft;
  Corner? get _topRight;
  Corner? get _bottomLeft;
  Corner? get _bottomRight;
  Corner? get _topStart;
  Corner? get _topEnd;
  Corner? get _bottomStart;
  Corner? get _bottomEnd;

  // TODO: fix clamp here as well
  // @override
  // CornersGeometry clamp(CornersGeometry minimum, CornersGeometry maximum) =>
  //     minimum is _CornersGeometry && maximum is _CornersGeometry
  //     ? _MixedCorners(
  //         _topLeft.clamp(minimum._topLeft, maximum._topLeft),
  //         _topRight.clamp(minimum._topRight, maximum._topRight),
  //         _bottomLeft.clamp(minimum._bottomLeft, maximum._bottomLeft),
  //         _bottomRight.clamp(minimum._bottomRight, maximum._bottomRight),
  //         _topStart.clamp(minimum._topStart, maximum._topStart),
  //         _topEnd.clamp(minimum._topEnd, maximum._topEnd),
  //         _bottomStart.clamp(minimum._bottomStart, maximum._bottomStart),
  //         _bottomEnd.clamp(minimum._bottomEnd, maximum._bottomEnd),
  //       )
  //     : super.clamp(minimum, maximum);

  // @override
  // CornersGeometry clamp({CornersGeometry? minimum, CornersGeometry? maximum}) {
  //   if (minimum is _CornersGeometry? && maximum is _CornersGeometry?) {
  //     final topLeft = _topLeft;
  //     final topRight = _topRight;
  //     final bottomLeft = _bottomLeft;
  //     final bottomRight = _bottomRight;
  //     final topStart = _topStart;
  //     final topEnd = _topEnd;
  //     final bottomStart = _bottomStart;
  //     final bottomEnd = _bottomEnd;
  //     return _MixedCorners(
  //       topLeft?.clamp(minimum: minimum?._topLeft, maximum: maximum?._topLeft),
  //       topRight?.clamp(
  //         minimum: minimum?._topRight,
  //         maximum: maximum?._topRight,
  //       ),
  //       bottomLeft?.clamp(
  //         minimum: minimum?._bottomLeft,
  //         maximum: maximum?._bottomLeft,
  //       ),
  //       bottomRight?.clamp(
  //         minimum: minimum?._bottomRight,
  //         maximum: maximum?._bottomRight,
  //       ),
  //       topStart?.clamp(
  //         minimum: minimum?._topStart,
  //         maximum: maximum?._topStart,
  //       ),
  //       topEnd?.clamp(minimum: minimum?._topEnd, maximum: maximum?._topEnd),
  //       bottomStart?.clamp(
  //         minimum: minimum?._bottomStart,
  //         maximum: maximum?._bottomStart,
  //       ),
  //       bottomEnd?.clamp(
  //         minimum: minimum?._bottomEnd,
  //         maximum: maximum?._bottomEnd,
  //       ),
  //     );
  //   }
  //   return super.clamp(minimum: minimum, maximum: maximum);
  // }

  @override
  Corners resolve(TextDirection? textDirection) {
    assert(debugCheckCanResolveTextDirection(textDirection, "$_MixedCorners"));
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return switch (textDirection!) {
      .ltr => .only(
        topLeft: topLeft != null && topStart != null
            ? topLeft.add(topStart)
            : topLeft ?? topStart ?? .zero,
        topRight: topRight != null && topEnd != null
            ? topRight.add(topEnd)
            : topRight ?? topEnd ?? .zero,
        bottomLeft: bottomLeft != null && bottomStart != null
            ? bottomLeft.add(bottomStart)
            : bottomLeft ?? bottomStart ?? .zero,
        bottomRight: bottomRight != null && bottomEnd != null
            ? bottomRight.add(bottomEnd)
            : bottomRight ?? bottomEnd ?? .zero,
      ),
      .rtl => .only(
        topLeft: topLeft != null && topEnd != null
            ? topLeft.add(topEnd)
            : topLeft ?? topEnd ?? .zero,
        topRight: topRight != null && topStart != null
            ? topRight.add(topStart)
            : topRight ?? topStart ?? .zero,
        bottomLeft: bottomLeft != null && bottomEnd != null
            ? bottomLeft.add(bottomEnd)
            : bottomLeft ?? bottomEnd ?? .zero,
        bottomRight: bottomRight != null && bottomStart != null
            ? bottomRight.add(bottomStart)
            : bottomRight ?? bottomStart ?? .zero,
      ),
    };
  }

  @override
  CornersGeometry add(CornersGeometry other) {
    if (other is _CornersGeometry) {
      final atl = _topLeft;
      final atr = _topRight;
      final abl = _bottomLeft;
      final abr = _bottomRight;
      final ats = _topStart;
      final ate = _topEnd;
      final abs = _bottomStart;
      final abe = _bottomEnd;
      final btl = other._topLeft;
      final btr = other._topRight;
      final bbl = other._bottomLeft;
      final bbr = other._bottomRight;
      final bts = other._topStart;
      final bte = other._topEnd;
      final bbs = other._bottomStart;
      final bbe = other._bottomEnd;
      return _MixedCorners(
        atl != null && btl != null ? atl.add(btl) : atl ?? btl,
        atr != null && btr != null ? atr.add(btr) : atr ?? btr,
        abl != null && bbl != null ? abl.add(bbl) : abl ?? bbl,
        abr != null && bbr != null ? abr.add(bbr) : abr ?? bbr,
        ats != null && bts != null ? ats.add(bts) : ats ?? bts,
        ate != null && bte != null ? ate.add(bte) : ate ?? bte,
        abs != null && bbs != null ? abs.add(bbs) : abs ?? bbs,
        abe != null && bbe != null ? abe.add(bbe) : abe ?? bbe,
      );
    }
    return super.add(other);
  }

  @override
  CornersGeometry subtract(CornersGeometry other) {
    if (other is _CornersGeometry) {
      final atl = _topLeft;
      final atr = _topRight;
      final abl = _bottomLeft;
      final abr = _bottomRight;
      final ats = _topStart;
      final ate = _topEnd;
      final abs = _bottomStart;
      final abe = _bottomEnd;
      final btl = other._topLeft;
      final btr = other._topRight;
      final bbl = other._bottomLeft;
      final bbr = other._bottomRight;
      final bts = other._topStart;
      final bte = other._topEnd;
      final bbs = other._bottomStart;
      final bbe = other._bottomEnd;
      return _MixedCorners(
        atl != null && btl != null ? atl.subtract(btl) : atl ?? btl,
        atr != null && btr != null ? atr.subtract(btr) : atr ?? btr,
        abl != null && bbl != null ? abl.subtract(bbl) : abl ?? bbl,
        abr != null && bbr != null ? abr.subtract(bbr) : abr ?? bbr,
        ats != null && bts != null ? ats.subtract(bts) : ats ?? bts,
        ate != null && bte != null ? ate.subtract(bte) : ate ?? bte,
        abs != null && bbs != null ? abs.subtract(bbs) : abs ?? bbs,
        abe != null && bbe != null ? abe.subtract(bbe) : abe ?? bbe,
      );
    }
    return super.add(other);
  }

  @override
  _CornersGeometry operator -() {
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return _MixedCorners(
      topLeft != null ? -topLeft : null,
      topRight != null ? -topRight : null,
      bottomLeft != null ? -bottomLeft : null,
      bottomRight != null ? -bottomRight : null,
      topStart != null ? -topStart : null,
      topEnd != null ? -topEnd : null,
      bottomStart != null ? -bottomStart : null,
      bottomEnd != null ? -bottomEnd : null,
    );
  }

  @override
  _CornersGeometry operator *(double operand) {
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return _MixedCorners(
      topLeft != null ? topLeft * operand : null,
      topRight != null ? topRight * operand : null,
      bottomLeft != null ? bottomLeft * operand : null,
      bottomRight != null ? bottomRight * operand : null,
      topStart != null ? topStart * operand : null,
      topEnd != null ? topEnd * operand : null,
      bottomStart != null ? bottomStart * operand : null,
      bottomEnd != null ? bottomEnd * operand : null,
    );
  }

  @override
  _CornersGeometry operator /(double operand) {
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return _MixedCorners(
      topLeft != null ? topLeft / operand : null,
      topRight != null ? topRight / operand : null,
      bottomLeft != null ? bottomLeft / operand : null,
      bottomRight != null ? bottomRight / operand : null,
      topStart != null ? topStart / operand : null,
      topEnd != null ? topEnd / operand : null,
      bottomStart != null ? bottomStart / operand : null,
      bottomEnd != null ? bottomEnd / operand : null,
    );
  }

  @override
  _CornersGeometry operator ~/(double operand) {
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return _MixedCorners(
      topLeft != null ? topLeft ~/ operand : null,
      topRight != null ? topRight ~/ operand : null,
      bottomLeft != null ? bottomLeft ~/ operand : null,
      bottomRight != null ? bottomRight ~/ operand : null,
      topStart != null ? topStart ~/ operand : null,
      topEnd != null ? topEnd ~/ operand : null,
      bottomStart != null ? bottomStart ~/ operand : null,
      bottomEnd != null ? bottomEnd ~/ operand : null,
    );
  }

  @override
  _CornersGeometry operator %(double operand) {
    final topLeft = _topLeft;
    final topRight = _topRight;
    final bottomLeft = _bottomLeft;
    final bottomRight = _bottomRight;
    final topStart = _topStart;
    final topEnd = _topEnd;
    final bottomStart = _bottomStart;
    final bottomEnd = _bottomEnd;
    return _MixedCorners(
      topLeft != null ? topLeft % operand : null,
      topRight != null ? topRight % operand : null,
      bottomLeft != null ? bottomLeft % operand : null,
      bottomRight != null ? bottomRight % operand : null,
      topStart != null ? topStart % operand : null,
      topEnd != null ? topEnd % operand : null,
      bottomStart != null ? bottomStart % operand : null,
      bottomEnd != null ? bottomEnd % operand : null,
    );
  }

  @override
  String toString() {
    final topLeft = _topLeft ?? .zero;
    final topRight = _topRight ?? .zero;
    final bottomLeft = _bottomLeft ?? .zero;
    final bottomRight = _bottomRight ?? .zero;
    final topStart = _topStart ?? .zero;
    final topEnd = _topEnd ?? .zero;
    final bottomStart = _bottomStart ?? .zero;
    final bottomEnd = _bottomEnd ?? .zero;
    String? visual;
    String? logical;
    if (topLeft == topRight &&
        topRight == bottomLeft &&
        bottomLeft == bottomRight) {
      if (topLeft != .zero) visual = "Corners.all($topLeft)";
    } else {
      final result = StringBuffer("Corners.only(");
      var comma = false;
      if (topLeft != .zero) {
        result.write("topLeft: $topLeft");
        comma = true;
      }
      if (topRight != .zero) {
        if (comma) result.write(", ");
        result.write("topRight: $topRight");
        comma = true;
      }
      if (bottomLeft != .zero) {
        if (comma) result.write(", ");
        result.write("bottomLeft: $bottomLeft");
        comma = true;
      }
      if (bottomRight != .zero) {
        if (comma) result.write(", ");
        result.write("bottomRight: $bottomRight");
      }
      result.write(")");
      visual = result.toString();
    }
    if (topStart == topEnd && topEnd == bottomEnd && bottomEnd == bottomStart) {
      if (topStart != .zero) logical = "CornersDirectional.all($topStart)";
    } else {
      final result = StringBuffer("CornersDirectional.only(");
      var comma = false;
      if (topStart != .zero) {
        result.write("topStart: $topStart");
        comma = true;
      }
      if (topEnd != .zero) {
        if (comma) result.write(", ");
        result.write("topEnd: $topEnd");
        comma = true;
      }
      if (bottomStart != .zero) {
        if (comma) result.write(", ");
        result.write("bottomStart: $bottomStart");
        comma = true;
      }
      if (bottomEnd != .zero) {
        if (comma) result.write(", ");
        result.write("bottomEnd: $bottomEnd");
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
  final Corner? _topLeft;

  @override
  final Corner? _topRight;

  @override
  final Corner? _bottomLeft;

  @override
  final Corner? _bottomRight;

  @override
  final Corner? _topStart;

  @override
  final Corner? _topEnd;

  @override
  final Corner? _bottomStart;

  @override
  final Corner? _bottomEnd;
}

final class _ZeroCorners extends _CornersGeometry {
  const _ZeroCorners();

  @override
  Null get _topLeft => null;

  @override
  Null get _topRight => null;

  @override
  Null get _bottomLeft => null;

  @override
  Null get _bottomRight => null;

  @override
  Null get _topStart => null;

  @override
  Null get _topEnd => null;

  @override
  Null get _bottomStart => null;

  @override
  Null get _bottomEnd => null;

  @override
  Corners resolve(TextDirection? textDirection) => .zero;

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

  const factory Corners.only({
    Corner topLeft,
    Corner topRight,
    Corner bottomLeft,
    Corner bottomRight,
  }) = _Corners.only;

  const factory Corners.all(Corner corner) = _Corners.all;

  const factory Corners.vertical({Corner top, Corner bottom}) =
      _Corners.vertical;

  const factory Corners.horizontal({Corner left, Corner right}) =
      _Corners.horizontal;

  const factory Corners.fromBorderRadius(BorderRadius borderRadius) =
      _CornersFromBorderRadius;

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
  Null get _topStart => null;

  @override
  Null get _topEnd => null;

  @override
  Null get _bottomStart => null;

  @override
  Null get _bottomEnd => null;

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
  CornersGeometry clamp({CornersGeometry? minimum, CornersGeometry? maximum}) =>
      minimum is Corners? && maximum is Corners?
      ? Corners.only(
          topLeft: topLeft.clamp(
            minimum: minimum?.topLeft,
            maximum: maximum?.topLeft,
          ),
          topRight: topRight.clamp(
            minimum: minimum?.topRight,
            maximum: maximum?.topRight,
          ),
          bottomLeft: bottomLeft.clamp(
            minimum: minimum?.bottomLeft,
            maximum: maximum?.bottomLeft,
          ),
          bottomRight: bottomRight.clamp(
            minimum: minimum?.bottomRight,
            maximum: maximum?.bottomRight,
          ),
        )
      : super.clamp(minimum: minimum, maximum: maximum);

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
  const _Corners.only({
    this.topLeft = .zero,
    this.topRight = .zero,
    this.bottomLeft = .zero,
    this.bottomRight = .zero,
  });

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

  @override
  final Corner topLeft;

  @override
  final Corner topRight;

  @override
  final Corner bottomLeft;

  @override
  final Corner bottomRight;
}

final class _CornersFromBorderRadius extends Corners {
  const _CornersFromBorderRadius(BorderRadius borderRadius)
    : _borderRadius = borderRadius;

  final BorderRadius _borderRadius;

  @override
  Corner get topLeft => .fromRadius(_borderRadius.topLeft);

  @override
  Corner get topRight => .fromRadius(_borderRadius.topRight);

  @override
  Corner get bottomLeft => .fromRadius(_borderRadius.bottomLeft);

  @override
  Corner get bottomRight => .fromRadius(_borderRadius.bottomRight);

  @override
  BorderRadius toBorderRadius(Size size) => _borderRadius;
}

abstract class CornersDirectional extends _CornersGeometry {
  const CornersDirectional();

  const factory CornersDirectional.only({
    Corner topStart,
    Corner topEnd,
    Corner bottomStart,
    Corner bottomEnd,
  }) = _CornersDirectional.only;

  const factory CornersDirectional.all(Corner radius) = _CornersDirectional.all;

  const factory CornersDirectional.vertical({Corner top, Corner bottom}) =
      _CornersDirectional.vertical;

  const factory CornersDirectional.horizontal({Corner start, Corner end}) =
      _CornersDirectional.horizontal;

  const factory CornersDirectional.fromBorderRadius(
    BorderRadiusDirectional borderRadius,
  ) = _CornersDirectionalFromBorderRadius;

  Corner get topStart;

  Corner get topEnd;

  Corner get bottomStart;

  Corner get bottomEnd;

  @override
  Null get _topLeft => null;

  @override
  Null get _topRight => null;

  @override
  Null get _bottomLeft => null;

  @override
  Null get _bottomRight => null;

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

  BorderRadiusDirectional toBorderRadius(Size size) => .only(
    topStart: topStart.toRadius(size),
    topEnd: topEnd.toRadius(size),
    bottomStart: bottomStart.toRadius(size),
    bottomEnd: bottomEnd.toRadius(size),
  );

  @override
  CornersGeometry clamp({CornersGeometry? minimum, CornersGeometry? maximum}) =>
      minimum is CornersDirectional? && maximum is CornersDirectional?
      ? CornersDirectional.only(
          topStart: topStart.clamp(
            minimum: minimum?.topStart,
            maximum: maximum?.topStart,
          ),
          topEnd: topEnd.clamp(
            minimum: minimum?.topEnd,
            maximum: maximum?.topEnd,
          ),
          bottomStart: bottomStart.clamp(
            minimum: minimum?.bottomStart,
            maximum: maximum?.bottomStart,
          ),
          bottomEnd: bottomEnd.clamp(
            minimum: minimum?.bottomEnd,
            maximum: maximum?.bottomEnd,
          ),
        )
      : super.clamp(minimum: minimum, maximum: maximum);

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

  @override
  final Corner topStart;

  @override
  final Corner topEnd;

  @override
  final Corner bottomStart;

  @override
  final Corner bottomEnd;
}

final class _CornersDirectionalFromBorderRadius extends CornersDirectional {
  const _CornersDirectionalFromBorderRadius(
    BorderRadiusDirectional borderRadius,
  ) : _borderRadius = borderRadius;

  final BorderRadiusDirectional _borderRadius;

  @override
  Corner get topStart => .fromRadius(_borderRadius.topStart);

  @override
  Corner get topEnd => .fromRadius(_borderRadius.topEnd);

  @override
  Corner get bottomStart => .fromRadius(_borderRadius.bottomStart);

  @override
  Corner get bottomEnd => .fromRadius(_borderRadius.bottomEnd);

  @override
  BorderRadiusDirectional toBorderRadius(Size size) => _borderRadius;
}
