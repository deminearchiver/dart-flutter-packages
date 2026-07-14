import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icongen/icongen.dart';

part 'variable_axis_constraints.freezed.dart';
part 'variable_axis_constraints.g.dart';

typedef VariableAxisConstraints = Map<VariableAxisTag, VariableAxisConstraint>;

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
}
