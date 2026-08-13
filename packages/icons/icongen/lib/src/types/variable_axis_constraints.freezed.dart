// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variable_axis_constraints.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
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
mixin _$VariableAxisFixed {

 double get at;
/// Create a copy of VariableAxisFixed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariableAxisFixedCopyWith<VariableAxisFixed> get copyWith => _$VariableAxisFixedCopyWithImpl<VariableAxisFixed>(this as VariableAxisFixed, _$identity);

  /// Serializes this VariableAxisFixed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableAxisFixed&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,at);

@override
String toString() {
  return 'VariableAxisFixed(at: $at)';
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

/// Create a copy of VariableAxisFixed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,}) {
  return _then(VariableAxisFixed(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}



/// @nodoc
@JsonSerializable()

class _VariableAxisFixed extends VariableAxisFixed {
  const _VariableAxisFixed({required this.at}): super._();
  factory _VariableAxisFixed.fromJson(Map<String, dynamic> json) => _$VariableAxisFixedFromJson(json);

@override final  double at;

/// Create a copy of VariableAxisFixed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariableAxisFixedCopyWith<_VariableAxisFixed> get copyWith => __$VariableAxisFixedCopyWithImpl<_VariableAxisFixed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariableAxisFixedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariableAxisFixed&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,at);

@override
String toString() {
  return 'VariableAxisFixed(at: $at)';
}


}

/// @nodoc
abstract mixin class _$VariableAxisFixedCopyWith<$Res> implements $VariableAxisFixedCopyWith<$Res> {
  factory _$VariableAxisFixedCopyWith(_VariableAxisFixed value, $Res Function(_VariableAxisFixed) _then) = __$VariableAxisFixedCopyWithImpl;
@override @useResult
$Res call({
 double at
});




}
/// @nodoc
class __$VariableAxisFixedCopyWithImpl<$Res>
    implements _$VariableAxisFixedCopyWith<$Res> {
  __$VariableAxisFixedCopyWithImpl(this._self, this._then);

  final _VariableAxisFixed _self;
  final $Res Function(_VariableAxisFixed) _then;

/// Create a copy of VariableAxisFixed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,}) {
  return _then(_VariableAxisFixed(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VariableAxisRange {

 double get from; double get to; double get defaultValue;
/// Create a copy of VariableAxisRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariableAxisRangeCopyWith<VariableAxisRange> get copyWith => _$VariableAxisRangeCopyWithImpl<VariableAxisRange>(this as VariableAxisRange, _$identity);

  /// Serializes this VariableAxisRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableAxisRange&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,defaultValue);

@override
String toString() {
  return 'VariableAxisRange(from: $from, to: $to, defaultValue: $defaultValue)';
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

/// Create a copy of VariableAxisRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? defaultValue = null,}) {
  return _then(VariableAxisRange(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}



/// @nodoc
@JsonSerializable()

class _VariableAxisRange extends VariableAxisRange {
  const _VariableAxisRange({required this.from, required this.to, required this.defaultValue}): super._();
  factory _VariableAxisRange.fromJson(Map<String, dynamic> json) => _$VariableAxisRangeFromJson(json);

@override final  double from;
@override final  double to;
@override final  double defaultValue;

/// Create a copy of VariableAxisRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariableAxisRangeCopyWith<_VariableAxisRange> get copyWith => __$VariableAxisRangeCopyWithImpl<_VariableAxisRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariableAxisRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariableAxisRange&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,defaultValue);

@override
String toString() {
  return 'VariableAxisRange(from: $from, to: $to, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class _$VariableAxisRangeCopyWith<$Res> implements $VariableAxisRangeCopyWith<$Res> {
  factory _$VariableAxisRangeCopyWith(_VariableAxisRange value, $Res Function(_VariableAxisRange) _then) = __$VariableAxisRangeCopyWithImpl;
@override @useResult
$Res call({
 double from, double to, double defaultValue
});




}
/// @nodoc
class __$VariableAxisRangeCopyWithImpl<$Res>
    implements _$VariableAxisRangeCopyWith<$Res> {
  __$VariableAxisRangeCopyWithImpl(this._self, this._then);

  final _VariableAxisRange _self;
  final $Res Function(_VariableAxisRange) _then;

/// Create a copy of VariableAxisRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? defaultValue = null,}) {
  return _then(_VariableAxisRange(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
