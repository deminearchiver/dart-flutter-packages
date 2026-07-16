import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icongen/src/icongen.dart';

part 'variable_axis_constraints.freezed.dart';
part 'variable_axis_constraints.g.dart';

typedef VariableAxisConstraints = Map<VariableAxisTag, VariableAxisConstraint>;

enum _VariableAxisConstraintType {
  fixed("fixed"),
  range("range");

  const _VariableAxisConstraintType(this._json);

  final String _json;

  String toJson() => _json;

  static const _jsonKey = JsonKey(
    name: "type",
    includeToJson: true,
    toJson: _VariableAxisConstraintType._toJson,
    includeFromJson: false,
  );

  static String _toJson(_VariableAxisConstraintType value) => value.toJson();
}

@Freezed(fromJson: true, toJson: true, unionKey: "type", unionValueCase: .snake)
sealed class VariableAxisConstraint with _$VariableAxisConstraint {
  const VariableAxisConstraint._();

  @FreezedUnionValue("fixed")
  const factory VariableAxisConstraint.fixed({required double at}) =
      VariableAxisFixed;

  @FreezedUnionValue("range")
  const factory VariableAxisConstraint.range({
    required double from,
    required double to,
    required double defaultValue,
  }) = VariableAxisRange;

  factory VariableAxisConstraint.fromJson(Map<String, Object?> json) =>
      _$VariableAxisConstraintFromJson(json);

  @_VariableAxisConstraintType._jsonKey
  // TODO: do something about this lint being produced here
  // ignore: unused_element
  _VariableAxisConstraintType get _type;
}

/// @nodoc
@Freezed(fromJson: true, toJson: true, unionKey: "type")
sealed class VariableAxisFixed extends VariableAxisConstraint
    with _$VariableAxisFixed {
  const VariableAxisFixed._() : super._();

  const factory VariableAxisFixed({required double at}) = _VariableAxisFixed;

  factory VariableAxisFixed.fromJson(Map<String, Object?> json) =>
      _$VariableAxisFixedFromJson(json);

  @_VariableAxisConstraintType._jsonKey
  @override
  _VariableAxisConstraintType get _type => .fixed;
}

/// @nodoc
@Freezed(fromJson: true, toJson: true, unionKey: "type")
sealed class VariableAxisRange extends VariableAxisConstraint
    with _$VariableAxisRange {
  const VariableAxisRange._() : super._();

  const factory VariableAxisRange({
    required double from,
    required double to,
    required double defaultValue,
  }) = _VariableAxisRange;

  factory VariableAxisRange.fromJson(Map<String, Object?> json) =>
      _$VariableAxisRangeFromJson(json);

  @_VariableAxisConstraintType._jsonKey
  @override
  _VariableAxisConstraintType get _type => .range;
}
