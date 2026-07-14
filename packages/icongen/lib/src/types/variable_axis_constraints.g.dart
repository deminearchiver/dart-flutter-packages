// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_axis_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariableAxisFixed _$VariableAxisFixedFromJson(Map<String, dynamic> json) =>
    VariableAxisFixed(
      at: (json['at'] as num).toDouble(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$VariableAxisFixedToJson(VariableAxisFixed instance) =>
    <String, dynamic>{'at': instance.at, 'type': instance.$type};

VariableAxisRange _$VariableAxisRangeFromJson(Map<String, dynamic> json) =>
    VariableAxisRange(
      from: (json['from'] as num).toDouble(),
      to: (json['to'] as num).toDouble(),
      defaultValue: (json['defaultValue'] as num).toDouble(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$VariableAxisRangeToJson(VariableAxisRange instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'defaultValue': instance.defaultValue,
      'type': instance.$type,
    };
