// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubsetEntry {

 VariableAxisConstraints get variableAxisConstraints;
/// Create a copy of SubsetEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubsetEntryCopyWith<SubsetEntry> get copyWith => _$SubsetEntryCopyWithImpl<SubsetEntry>(this as SubsetEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubsetEntry&&const DeepCollectionEquality().equals(other.variableAxisConstraints, variableAxisConstraints));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(variableAxisConstraints));

@override
String toString() {
  return 'SubsetEntry(variableAxisConstraints: $variableAxisConstraints)';
}


}

/// @nodoc
abstract mixin class $SubsetEntryCopyWith<$Res>  {
  factory $SubsetEntryCopyWith(SubsetEntry value, $Res Function(SubsetEntry) _then) = _$SubsetEntryCopyWithImpl;
@useResult
$Res call({
 VariableAxisConstraints variableAxisConstraints
});




}
/// @nodoc
class _$SubsetEntryCopyWithImpl<$Res>
    implements $SubsetEntryCopyWith<$Res> {
  _$SubsetEntryCopyWithImpl(this._self, this._then);

  final SubsetEntry _self;
  final $Res Function(SubsetEntry) _then;

/// Create a copy of SubsetEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variableAxisConstraints = null,}) {
  return _then(_self.copyWith(
variableAxisConstraints: null == variableAxisConstraints ? _self.variableAxisConstraints : variableAxisConstraints // ignore: cast_nullable_to_non_nullable
as VariableAxisConstraints,
  ));
}

}



/// @nodoc


class _SubsetEntry implements SubsetEntry {
  const _SubsetEntry({final  VariableAxisConstraints variableAxisConstraints = const {}}): _variableAxisConstraints = variableAxisConstraints;
  

 final  VariableAxisConstraints _variableAxisConstraints;
@override@JsonKey() VariableAxisConstraints get variableAxisConstraints {
  if (_variableAxisConstraints is EqualUnmodifiableMapView) return _variableAxisConstraints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_variableAxisConstraints);
}


/// Create a copy of SubsetEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubsetEntryCopyWith<_SubsetEntry> get copyWith => __$SubsetEntryCopyWithImpl<_SubsetEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubsetEntry&&const DeepCollectionEquality().equals(other._variableAxisConstraints, _variableAxisConstraints));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_variableAxisConstraints));

@override
String toString() {
  return 'SubsetEntry(variableAxisConstraints: $variableAxisConstraints)';
}


}

/// @nodoc
abstract mixin class _$SubsetEntryCopyWith<$Res> implements $SubsetEntryCopyWith<$Res> {
  factory _$SubsetEntryCopyWith(_SubsetEntry value, $Res Function(_SubsetEntry) _then) = __$SubsetEntryCopyWithImpl;
@override @useResult
$Res call({
 VariableAxisConstraints variableAxisConstraints
});




}
/// @nodoc
class __$SubsetEntryCopyWithImpl<$Res>
    implements _$SubsetEntryCopyWith<$Res> {
  __$SubsetEntryCopyWithImpl(this._self, this._then);

  final _SubsetEntry _self;
  final $Res Function(_SubsetEntry) _then;

/// Create a copy of SubsetEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variableAxisConstraints = null,}) {
  return _then(_SubsetEntry(
variableAxisConstraints: null == variableAxisConstraints ? _self._variableAxisConstraints : variableAxisConstraints // ignore: cast_nullable_to_non_nullable
as VariableAxisConstraints,
  ));
}


}

/// @nodoc
mixin _$WriteEntry<T extends Object?> {

 T get value; Uri get path;
/// Create a copy of WriteEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WriteEntryCopyWith<T, WriteEntry<T>> get copyWith => _$WriteEntryCopyWithImpl<T, WriteEntry<T>>(this as WriteEntry<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WriteEntry<T>&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),path);

@override
String toString() {
  return 'WriteEntry<$T>(value: $value, path: $path)';
}


}

/// @nodoc
abstract mixin class $WriteEntryCopyWith<T extends Object?,$Res>  {
  factory $WriteEntryCopyWith(WriteEntry<T> value, $Res Function(WriteEntry<T>) _then) = _$WriteEntryCopyWithImpl;
@useResult
$Res call({
 T value, Uri path
});




}
/// @nodoc
class _$WriteEntryCopyWithImpl<T extends Object?,$Res>
    implements $WriteEntryCopyWith<T, $Res> {
  _$WriteEntryCopyWithImpl(this._self, this._then);

  final WriteEntry<T> _self;
  final $Res Function(WriteEntry<T>) _then;

/// Create a copy of WriteEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? path = null,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}



/// @nodoc


class _WriteEntry<T extends Object?> implements WriteEntry<T> {
  const _WriteEntry(this.value, {required this.path});
  

@override final  T value;
@override final  Uri path;

/// Create a copy of WriteEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteEntryCopyWith<T, _WriteEntry<T>> get copyWith => __$WriteEntryCopyWithImpl<T, _WriteEntry<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteEntry<T>&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),path);

@override
String toString() {
  return 'WriteEntry<$T>(value: $value, path: $path)';
}


}

/// @nodoc
abstract mixin class _$WriteEntryCopyWith<T extends Object?,$Res> implements $WriteEntryCopyWith<T, $Res> {
  factory _$WriteEntryCopyWith(_WriteEntry<T> value, $Res Function(_WriteEntry<T>) _then) = __$WriteEntryCopyWithImpl;
@override @useResult
$Res call({
 T value, Uri path
});




}
/// @nodoc
class __$WriteEntryCopyWithImpl<T extends Object?,$Res>
    implements _$WriteEntryCopyWith<T, $Res> {
  __$WriteEntryCopyWithImpl(this._self, this._then);

  final _WriteEntry<T> _self;
  final $Res Function(_WriteEntry<T>) _then;

/// Create a copy of WriteEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? path = null,}) {
  return _then(_WriteEntry<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

/// @nodoc
mixin _$BindingsEntry {

 SubsetResult get subsetResult; String get className; String? get fontFamily; String? get fontPackage; IconGlyph? get forceTreeShakeIconGlyph;
/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BindingsEntryCopyWith<BindingsEntry> get copyWith => _$BindingsEntryCopyWithImpl<BindingsEntry>(this as BindingsEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BindingsEntry&&(identical(other.subsetResult, subsetResult) || other.subsetResult == subsetResult)&&(identical(other.className, className) || other.className == className)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontPackage, fontPackage) || other.fontPackage == fontPackage)&&(identical(other.forceTreeShakeIconGlyph, forceTreeShakeIconGlyph) || other.forceTreeShakeIconGlyph == forceTreeShakeIconGlyph));
}


@override
int get hashCode => Object.hash(runtimeType,subsetResult,className,fontFamily,fontPackage,forceTreeShakeIconGlyph);

@override
String toString() {
  return 'BindingsEntry(subsetResult: $subsetResult, className: $className, fontFamily: $fontFamily, fontPackage: $fontPackage, forceTreeShakeIconGlyph: $forceTreeShakeIconGlyph)';
}


}

/// @nodoc
abstract mixin class $BindingsEntryCopyWith<$Res>  {
  factory $BindingsEntryCopyWith(BindingsEntry value, $Res Function(BindingsEntry) _then) = _$BindingsEntryCopyWithImpl;
@useResult
$Res call({
 SubsetResult subsetResult, String className, String? fontFamily, String? fontPackage, IconGlyph? forceTreeShakeIconGlyph
});


$IconGlyphCopyWith<$Res>? get forceTreeShakeIconGlyph;

}
/// @nodoc
class _$BindingsEntryCopyWithImpl<$Res>
    implements $BindingsEntryCopyWith<$Res> {
  _$BindingsEntryCopyWithImpl(this._self, this._then);

  final BindingsEntry _self;
  final $Res Function(BindingsEntry) _then;

/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subsetResult = null,Object? className = null,Object? fontFamily = freezed,Object? fontPackage = freezed,Object? forceTreeShakeIconGlyph = freezed,}) {
  return _then(_self.copyWith(
subsetResult: null == subsetResult ? _self.subsetResult : subsetResult // ignore: cast_nullable_to_non_nullable
as SubsetResult,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontPackage: freezed == fontPackage ? _self.fontPackage : fontPackage // ignore: cast_nullable_to_non_nullable
as String?,forceTreeShakeIconGlyph: freezed == forceTreeShakeIconGlyph ? _self.forceTreeShakeIconGlyph : forceTreeShakeIconGlyph // ignore: cast_nullable_to_non_nullable
as IconGlyph?,
  ));
}
/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconGlyphCopyWith<$Res>? get forceTreeShakeIconGlyph {
    if (_self.forceTreeShakeIconGlyph == null) {
    return null;
  }

  return $IconGlyphCopyWith<$Res>(_self.forceTreeShakeIconGlyph!, (value) {
    return _then(_self.copyWith(forceTreeShakeIconGlyph: value));
  });
}
}



/// @nodoc


class _BindingsEntry implements BindingsEntry {
  const _BindingsEntry({required this.subsetResult, required this.className, this.fontFamily, this.fontPackage, this.forceTreeShakeIconGlyph});
  

@override final  SubsetResult subsetResult;
@override final  String className;
@override final  String? fontFamily;
@override final  String? fontPackage;
@override final  IconGlyph? forceTreeShakeIconGlyph;

/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BindingsEntryCopyWith<_BindingsEntry> get copyWith => __$BindingsEntryCopyWithImpl<_BindingsEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BindingsEntry&&(identical(other.subsetResult, subsetResult) || other.subsetResult == subsetResult)&&(identical(other.className, className) || other.className == className)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontPackage, fontPackage) || other.fontPackage == fontPackage)&&(identical(other.forceTreeShakeIconGlyph, forceTreeShakeIconGlyph) || other.forceTreeShakeIconGlyph == forceTreeShakeIconGlyph));
}


@override
int get hashCode => Object.hash(runtimeType,subsetResult,className,fontFamily,fontPackage,forceTreeShakeIconGlyph);

@override
String toString() {
  return 'BindingsEntry(subsetResult: $subsetResult, className: $className, fontFamily: $fontFamily, fontPackage: $fontPackage, forceTreeShakeIconGlyph: $forceTreeShakeIconGlyph)';
}


}

/// @nodoc
abstract mixin class _$BindingsEntryCopyWith<$Res> implements $BindingsEntryCopyWith<$Res> {
  factory _$BindingsEntryCopyWith(_BindingsEntry value, $Res Function(_BindingsEntry) _then) = __$BindingsEntryCopyWithImpl;
@override @useResult
$Res call({
 SubsetResult subsetResult, String className, String? fontFamily, String? fontPackage, IconGlyph? forceTreeShakeIconGlyph
});


@override $IconGlyphCopyWith<$Res>? get forceTreeShakeIconGlyph;

}
/// @nodoc
class __$BindingsEntryCopyWithImpl<$Res>
    implements _$BindingsEntryCopyWith<$Res> {
  __$BindingsEntryCopyWithImpl(this._self, this._then);

  final _BindingsEntry _self;
  final $Res Function(_BindingsEntry) _then;

/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subsetResult = null,Object? className = null,Object? fontFamily = freezed,Object? fontPackage = freezed,Object? forceTreeShakeIconGlyph = freezed,}) {
  return _then(_BindingsEntry(
subsetResult: null == subsetResult ? _self.subsetResult : subsetResult // ignore: cast_nullable_to_non_nullable
as SubsetResult,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,fontPackage: freezed == fontPackage ? _self.fontPackage : fontPackage // ignore: cast_nullable_to_non_nullable
as String?,forceTreeShakeIconGlyph: freezed == forceTreeShakeIconGlyph ? _self.forceTreeShakeIconGlyph : forceTreeShakeIconGlyph // ignore: cast_nullable_to_non_nullable
as IconGlyph?,
  ));
}

/// Create a copy of BindingsEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconGlyphCopyWith<$Res>? get forceTreeShakeIconGlyph {
    if (_self.forceTreeShakeIconGlyph == null) {
    return null;
  }

  return $IconGlyphCopyWith<$Res>(_self.forceTreeShakeIconGlyph!, (value) {
    return _then(_self.copyWith(forceTreeShakeIconGlyph: value));
  });
}
}

// dart format on
