import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icongen/src/icongen.dart';

part 'variable_axis_constraints.freezed.dart';
part 'variable_axis_constraints.g.dart';

typedef VariableAxisConstraints = Map<VariableAxisTag, VariableAxisConstraint>;

enum _VariableAxisConstraintType(final String _json) {
  fixed("fixed"),
  range("range");

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
sealed class const VariableAxisConstraint._() with _$VariableAxisConstraint {
  @FreezedUnionValue("fixed")
  const factory fixed({required double at}) = VariableAxisFixed;

  @FreezedUnionValue("range")
  const factory range({
    required double from,
    required double to,
    required double defaultValue,
  }) = VariableAxisRange;

  factory fromJson(Map<String, Object?> json) =>
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
  const new _() : super._();

  const factory({required double at}) = _VariableAxisFixed;

  factory fromJson(Map<String, Object?> json) =>
      _$VariableAxisFixedFromJson(json);

  @_VariableAxisConstraintType._jsonKey
  @override
  _VariableAxisConstraintType get _type => .fixed;
}

/// @nodoc
@Freezed(fromJson: true, toJson: true, unionKey: "type")
sealed class const VariableAxisRange._()
    extends VariableAxisConstraint
    with _$VariableAxisRange {
  this : super._();

  const factory({
    required double from,
    required double to,
    required double defaultValue,
  }) = _VariableAxisRange;

  factory fromJson(Map<String, Object?> json) =>
      _$VariableAxisRangeFromJson(json);

  @_VariableAxisConstraintType._jsonKey
  @override
  _VariableAxisConstraintType get _type => .range;
}
