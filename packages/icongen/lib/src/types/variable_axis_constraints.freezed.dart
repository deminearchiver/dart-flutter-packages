// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variable_axis_constraints.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
VariableAxisConstraint _$VariableAxisConstraintFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'fixed':
          return VariableAxisFixed.fromJson(
            json
          );
                case 'range':
          return VariableAxisRange.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'VariableAxisConstraint',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$VariableAxisConstraint {



  /// Serializes this VariableAxisConstraint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableAxisConstraint);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VariableAxisConstraint()';
}


}

/// @nodoc
class $VariableAxisConstraintCopyWith<$Res>  {
$VariableAxisConstraintCopyWith(VariableAxisConstraint _, $Res Function(VariableAxisConstraint) __);
}



/// @nodoc
@JsonSerializable()

class VariableAxisFixed extends VariableAxisConstraint {
  const VariableAxisFixed({required this.at, final  String? $type}): $type = $type ?? 'fixed',super._();
  factory VariableAxisFixed.fromJson(Map<String, dynamic> json) => _$VariableAxisFixedFromJson(json);

 final  double at;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of VariableAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariableAxisFixedCopyWith<VariableAxisFixed> get copyWith => _$VariableAxisFixedCopyWithImpl<VariableAxisFixed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariableAxisFixedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableAxisFixed&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,at);

@override
String toString() {
  return 'VariableAxisConstraint.fixed(at: $at)';
}


}

/// @nodoc
abstract mixin class $VariableAxisFixedCopyWith<$Res> implements $VariableAxisConstraintCopyWith<$Res> {
  factory $VariableAxisFixedCopyWith(VariableAxisFixed value, $Res Function(VariableAxisFixed) _then) = _$VariableAxisFixedCopyWithImpl;
@useResult
$Res call({
 double at
});




}
/// @nodoc
class _$VariableAxisFixedCopyWithImpl<$Res>
    implements $VariableAxisFixedCopyWith<$Res> {
  _$VariableAxisFixedCopyWithImpl(this._self, this._then);

  final VariableAxisFixed _self;
  final $Res Function(VariableAxisFixed) _then;

/// Create a copy of VariableAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? at = null,}) {
  return _then(VariableAxisFixed(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class VariableAxisRange extends VariableAxisConstraint {
  const VariableAxisRange({required this.from, required this.to, required this.defaultValue, final  String? $type}): $type = $type ?? 'range',super._();
  factory VariableAxisRange.fromJson(Map<String, dynamic> json) => _$VariableAxisRangeFromJson(json);

 final  double from;
 final  double to;
 final  double defaultValue;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of VariableAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariableAxisRangeCopyWith<VariableAxisRange> get copyWith => _$VariableAxisRangeCopyWithImpl<VariableAxisRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariableAxisRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableAxisRange&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,defaultValue);

@override
String toString() {
  return 'VariableAxisConstraint.range(from: $from, to: $to, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class $VariableAxisRangeCopyWith<$Res> implements $VariableAxisConstraintCopyWith<$Res> {
  factory $VariableAxisRangeCopyWith(VariableAxisRange value, $Res Function(VariableAxisRange) _then) = _$VariableAxisRangeCopyWithImpl;
@useResult
$Res call({
 double from, double to, double defaultValue
});




}
/// @nodoc
class _$VariableAxisRangeCopyWithImpl<$Res>
    implements $VariableAxisRangeCopyWith<$Res> {
  _$VariableAxisRangeCopyWithImpl(this._self, this._then);

  final VariableAxisRange _self;
  final $Res Function(VariableAxisRange) _then;

/// Create a copy of VariableAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? defaultValue = null,}) {
  return _then(VariableAxisRange(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
