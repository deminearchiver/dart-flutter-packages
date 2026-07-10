// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubsetAxisConstraint {

 String get tag;
/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetAxisConstraintCopyWith<SubsetAxisConstraint> get copyWith => _$SubsetAxisConstraintCopyWithImpl<SubsetAxisConstraint>(this as SubsetAxisConstraint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetAxisConstraint&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString() {
  return 'SubsetAxisConstraint(tag: $tag)';
}


}

/// @nodoc
abstract mixin class $SubsetAxisConstraintCopyWith<$Res>  {
  factory $SubsetAxisConstraintCopyWith(SubsetAxisConstraint value, $Res Function(SubsetAxisConstraint) _then) = _$SubsetAxisConstraintCopyWithImpl;
@useResult
$Res call({
 String tag
});




}
/// @nodoc
class _$SubsetAxisConstraintCopyWithImpl<$Res>
    implements $SubsetAxisConstraintCopyWith<$Res> {
  _$SubsetAxisConstraintCopyWithImpl(this._self, this._then);

  final SubsetAxisConstraint _self;
  final $Res Function(SubsetAxisConstraint) _then;

/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc


class SubsetAxisFixed extends SubsetAxisConstraint {
  const SubsetAxisFixed(this.tag, {required this.at}): super._();
  

@override final  String tag;
 final  double at;

/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetAxisFixedCopyWith<SubsetAxisFixed> get copyWith => _$SubsetAxisFixedCopyWithImpl<SubsetAxisFixed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetAxisFixed&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,tag,at);

@override
String toString() {
  return 'SubsetAxisConstraint.fixed(tag: $tag, at: $at)';
}


}

/// @nodoc
abstract mixin class $SubsetAxisFixedCopyWith<$Res> implements $SubsetAxisConstraintCopyWith<$Res> {
  factory $SubsetAxisFixedCopyWith(SubsetAxisFixed value, $Res Function(SubsetAxisFixed) _then) = _$SubsetAxisFixedCopyWithImpl;
@override @useResult
$Res call({
 String tag, double at
});




}
/// @nodoc
class _$SubsetAxisFixedCopyWithImpl<$Res>
    implements $SubsetAxisFixedCopyWith<$Res> {
  _$SubsetAxisFixedCopyWithImpl(this._self, this._then);

  final SubsetAxisFixed _self;
  final $Res Function(SubsetAxisFixed) _then;

/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? at = null,}) {
  return _then(SubsetAxisFixed(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SubsetAxisRange extends SubsetAxisConstraint {
  const SubsetAxisRange(this.tag, {required this.from, required this.to, required this.defaultValue}): super._();
  

@override final  String tag;
 final  double from;
 final  double to;
 final  double defaultValue;

/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetAxisRangeCopyWith<SubsetAxisRange> get copyWith => _$SubsetAxisRangeCopyWithImpl<SubsetAxisRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetAxisRange&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}


@override
int get hashCode => Object.hash(runtimeType,tag,from,to,defaultValue);

@override
String toString() {
  return 'SubsetAxisConstraint.range(tag: $tag, from: $from, to: $to, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class $SubsetAxisRangeCopyWith<$Res> implements $SubsetAxisConstraintCopyWith<$Res> {
  factory $SubsetAxisRangeCopyWith(SubsetAxisRange value, $Res Function(SubsetAxisRange) _then) = _$SubsetAxisRangeCopyWithImpl;
@override @useResult
$Res call({
 String tag, double from, double to, double defaultValue
});




}
/// @nodoc
class _$SubsetAxisRangeCopyWithImpl<$Res>
    implements $SubsetAxisRangeCopyWith<$Res> {
  _$SubsetAxisRangeCopyWithImpl(this._self, this._then);

  final SubsetAxisRange _self;
  final $Res Function(SubsetAxisRange) _then;

/// Create a copy of SubsetAxisConstraint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? from = null,Object? to = null,Object? defaultValue = null,}) {
  return _then(SubsetAxisRange(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$SubsetOutput {

 Uri get asset; List<SubsetAxisConstraint> get axisConstraints;
/// Create a copy of SubsetOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetOutputCopyWith<SubsetOutput> get copyWith => _$SubsetOutputCopyWithImpl<SubsetOutput>(this as SubsetOutput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetOutput&&(identical(other.asset, asset) || other.asset == asset)&&const DeepCollectionEquality().equals(other.axisConstraints, axisConstraints));
}


@override
int get hashCode => Object.hash(runtimeType,asset,const DeepCollectionEquality().hash(axisConstraints));

@override
String toString() {
  return 'SubsetOutput(asset: $asset, axisConstraints: $axisConstraints)';
}


}

/// @nodoc
abstract mixin class $SubsetOutputCopyWith<$Res>  {
  factory $SubsetOutputCopyWith(SubsetOutput value, $Res Function(SubsetOutput) _then) = _$SubsetOutputCopyWithImpl;
@useResult
$Res call({
 Uri asset, List<SubsetAxisConstraint> axisConstraints
});




}
/// @nodoc
class _$SubsetOutputCopyWithImpl<$Res>
    implements $SubsetOutputCopyWith<$Res> {
  _$SubsetOutputCopyWithImpl(this._self, this._then);

  final SubsetOutput _self;
  final $Res Function(SubsetOutput) _then;

/// Create a copy of SubsetOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? asset = null,Object? axisConstraints = null,}) {
  return _then(_self.copyWith(
asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as Uri,axisConstraints: null == axisConstraints ? _self.axisConstraints : axisConstraints // ignore: cast_nullable_to_non_nullable
as List<SubsetAxisConstraint>,
  ));
}

}



/// @nodoc


class _SubsetOutput implements SubsetOutput {
  const _SubsetOutput({required this.asset, final  List<SubsetAxisConstraint> axisConstraints = const []}): _axisConstraints = axisConstraints;
  

@override final  Uri asset;
 final  List<SubsetAxisConstraint> _axisConstraints;
@override@JsonKey() List<SubsetAxisConstraint> get axisConstraints {
  if (_axisConstraints is EqualUnmodifiableListView) return _axisConstraints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_axisConstraints);
}


/// Create a copy of SubsetOutput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubsetOutputCopyWith<_SubsetOutput> get copyWith => __$SubsetOutputCopyWithImpl<_SubsetOutput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubsetOutput&&(identical(other.asset, asset) || other.asset == asset)&&const DeepCollectionEquality().equals(other._axisConstraints, _axisConstraints));
}


@override
int get hashCode => Object.hash(runtimeType,asset,const DeepCollectionEquality().hash(_axisConstraints));

@override
String toString() {
  return 'SubsetOutput(asset: $asset, axisConstraints: $axisConstraints)';
}


}

/// @nodoc
abstract mixin class _$SubsetOutputCopyWith<$Res> implements $SubsetOutputCopyWith<$Res> {
  factory _$SubsetOutputCopyWith(_SubsetOutput value, $Res Function(_SubsetOutput) _then) = __$SubsetOutputCopyWithImpl;
@override @useResult
$Res call({
 Uri asset, List<SubsetAxisConstraint> axisConstraints
});




}
/// @nodoc
class __$SubsetOutputCopyWithImpl<$Res>
    implements _$SubsetOutputCopyWith<$Res> {
  __$SubsetOutputCopyWithImpl(this._self, this._then);

  final _SubsetOutput _self;
  final $Res Function(_SubsetOutput) _then;

/// Create a copy of SubsetOutput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? asset = null,Object? axisConstraints = null,}) {
  return _then(_SubsetOutput(
asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as Uri,axisConstraints: null == axisConstraints ? _self._axisConstraints : axisConstraints // ignore: cast_nullable_to_non_nullable
as List<SubsetAxisConstraint>,
  ));
}


}

/// @nodoc
mixin _$SubsetResult<T extends Object?> {

 T get outputId; SubsetOutput get output; String? get fontFamily; List<IconGlyph> get iconGlyphs;
/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetResultCopyWith<T, SubsetResult<T>> get copyWith => _$SubsetResultCopyWithImpl<T, SubsetResult<T>>(this as SubsetResult<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetResult<T>&&const DeepCollectionEquality().equals(other.outputId, outputId)&&(identical(other.output, output) || other.output == output)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&const DeepCollectionEquality().equals(other.iconGlyphs, iconGlyphs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(outputId),output,fontFamily,const DeepCollectionEquality().hash(iconGlyphs));

@override
String toString() {
  return 'SubsetResult<$T>(outputId: $outputId, output: $output, fontFamily: $fontFamily, iconGlyphs: $iconGlyphs)';
}


}

/// @nodoc
abstract mixin class $SubsetResultCopyWith<T extends Object?,$Res>  {
  factory $SubsetResultCopyWith(SubsetResult<T> value, $Res Function(SubsetResult<T>) _then) = _$SubsetResultCopyWithImpl;
@useResult
$Res call({
 T outputId, SubsetOutput output, String? fontFamily, List<IconGlyph> iconGlyphs
});


$SubsetOutputCopyWith<$Res> get output;

}
/// @nodoc
class _$SubsetResultCopyWithImpl<T extends Object?,$Res>
    implements $SubsetResultCopyWith<T, $Res> {
  _$SubsetResultCopyWithImpl(this._self, this._then);

  final SubsetResult<T> _self;
  final $Res Function(SubsetResult<T>) _then;

/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outputId = freezed,Object? output = null,Object? fontFamily = freezed,Object? iconGlyphs = null,}) {
  return _then(_self.copyWith(
outputId: freezed == outputId ? _self.outputId : outputId // ignore: cast_nullable_to_non_nullable
as T,output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as SubsetOutput,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,iconGlyphs: null == iconGlyphs ? _self.iconGlyphs : iconGlyphs // ignore: cast_nullable_to_non_nullable
as List<IconGlyph>,
  ));
}
/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubsetOutputCopyWith<$Res> get output {
  
  return $SubsetOutputCopyWith<$Res>(_self.output, (value) {
    return _then(_self.copyWith(output: value));
  });
}
}



/// @nodoc


class _SubsetResult<T extends Object?> implements SubsetResult<T> {
  const _SubsetResult({required this.outputId, required this.output, this.fontFamily, final  List<IconGlyph> iconGlyphs = const []}): _iconGlyphs = iconGlyphs;
  

@override final  T outputId;
@override final  SubsetOutput output;
@override final  String? fontFamily;
 final  List<IconGlyph> _iconGlyphs;
@override@JsonKey() List<IconGlyph> get iconGlyphs {
  if (_iconGlyphs is EqualUnmodifiableListView) return _iconGlyphs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iconGlyphs);
}


/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubsetResultCopyWith<T, _SubsetResult<T>> get copyWith => __$SubsetResultCopyWithImpl<T, _SubsetResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubsetResult<T>&&const DeepCollectionEquality().equals(other.outputId, outputId)&&(identical(other.output, output) || other.output == output)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&const DeepCollectionEquality().equals(other._iconGlyphs, _iconGlyphs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(outputId),output,fontFamily,const DeepCollectionEquality().hash(_iconGlyphs));

@override
String toString() {
  return 'SubsetResult<$T>(outputId: $outputId, output: $output, fontFamily: $fontFamily, iconGlyphs: $iconGlyphs)';
}


}

/// @nodoc
abstract mixin class _$SubsetResultCopyWith<T extends Object?,$Res> implements $SubsetResultCopyWith<T, $Res> {
  factory _$SubsetResultCopyWith(_SubsetResult<T> value, $Res Function(_SubsetResult<T>) _then) = __$SubsetResultCopyWithImpl;
@override @useResult
$Res call({
 T outputId, SubsetOutput output, String? fontFamily, List<IconGlyph> iconGlyphs
});


@override $SubsetOutputCopyWith<$Res> get output;

}
/// @nodoc
class __$SubsetResultCopyWithImpl<T extends Object?,$Res>
    implements _$SubsetResultCopyWith<T, $Res> {
  __$SubsetResultCopyWithImpl(this._self, this._then);

  final _SubsetResult<T> _self;
  final $Res Function(_SubsetResult<T>) _then;

/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outputId = freezed,Object? output = null,Object? fontFamily = freezed,Object? iconGlyphs = null,}) {
  return _then(_SubsetResult<T>(
outputId: freezed == outputId ? _self.outputId : outputId // ignore: cast_nullable_to_non_nullable
as T,output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as SubsetOutput,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,iconGlyphs: null == iconGlyphs ? _self._iconGlyphs : iconGlyphs // ignore: cast_nullable_to_non_nullable
as List<IconGlyph>,
  ));
}

/// Create a copy of SubsetResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubsetOutputCopyWith<$Res> get output {
  
  return $SubsetOutputCopyWith<$Res>(_self.output, (value) {
    return _then(_self.copyWith(output: value));
  });
}
}

/// @nodoc
mixin _$IconGlyph {

 int get codePoint; String? get name;
/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconGlyphCopyWith<IconGlyph> get copyWith => _$IconGlyphCopyWithImpl<IconGlyph>(this as IconGlyph, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IconGlyph&&(identical(other.codePoint, codePoint) || other.codePoint == codePoint)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,codePoint,name);

@override
String toString() {
  return 'IconGlyph(codePoint: $codePoint, name: $name)';
}


}

/// @nodoc
abstract mixin class $IconGlyphCopyWith<$Res>  {
  factory $IconGlyphCopyWith(IconGlyph value, $Res Function(IconGlyph) _then) = _$IconGlyphCopyWithImpl;
@useResult
$Res call({
 int codePoint, String? name
});




}
/// @nodoc
class _$IconGlyphCopyWithImpl<$Res>
    implements $IconGlyphCopyWith<$Res> {
  _$IconGlyphCopyWithImpl(this._self, this._then);

  final IconGlyph _self;
  final $Res Function(IconGlyph) _then;

/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codePoint = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
codePoint: null == codePoint ? _self.codePoint : codePoint // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



/// @nodoc


class _IconGlyph implements IconGlyph {
  const _IconGlyph({required this.codePoint, this.name});
  

@override final  int codePoint;
@override final  String? name;

/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconGlyphCopyWith<_IconGlyph> get copyWith => __$IconGlyphCopyWithImpl<_IconGlyph>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IconGlyph&&(identical(other.codePoint, codePoint) || other.codePoint == codePoint)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,codePoint,name);

@override
String toString() {
  return 'IconGlyph(codePoint: $codePoint, name: $name)';
}


}

/// @nodoc
abstract mixin class _$IconGlyphCopyWith<$Res> implements $IconGlyphCopyWith<$Res> {
  factory _$IconGlyphCopyWith(_IconGlyph value, $Res Function(_IconGlyph) _then) = __$IconGlyphCopyWithImpl;
@override @useResult
$Res call({
 int codePoint, String? name
});




}
/// @nodoc
class __$IconGlyphCopyWithImpl<$Res>
    implements _$IconGlyphCopyWith<$Res> {
  __$IconGlyphCopyWithImpl(this._self, this._then);

  final _IconGlyph _self;
  final $Res Function(_IconGlyph) _then;

/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codePoint = null,Object? name = freezed,}) {
  return _then(_IconGlyph(
codePoint: null == codePoint ? _self.codePoint : codePoint // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
