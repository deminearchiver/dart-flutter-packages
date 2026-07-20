// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_axis_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VariableAxisFixed _$VariableAxisFixedFromJson(Map<String, dynamic> json) =>
    _VariableAxisFixed(at: (json['at'] as num).toDouble());

Map<String, dynamic> _$VariableAxisFixedToJson(_VariableAxisFixed instance) =>
    <String, dynamic>{
      'type': _VariableAxisConstraintType._toJson(instance._type),
      'at': instance.at,
    };

_VariableAxisRange _$VariableAxisRangeFromJson(Map<String, dynamic> json) =>
    _VariableAxisRange(
      from: (json['from'] as num).toDouble(),
      to: (json['to'] as num).toDouble(),
      defaultValue: (json['defaultValue'] as num).toDouble(),
    );

Map<String, dynamic> _$VariableAxisRangeToJson(_VariableAxisRange instance) =>
    <String, dynamic>{
      'type': _VariableAxisConstraintType._toJson(instance._type),
      'from': instance.from,
      'to': instance.to,
      'defaultValue': instance.defaultValue,
    };
