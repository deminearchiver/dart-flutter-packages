// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon_glyph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IconGlyph {

 int get codePoint; String? get name;
/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconGlyphCopyWith<IconGlyph> get copyWith => _$IconGlyphCopyWithImpl<IconGlyph>(this as IconGlyph, _$identity);

  /// Serializes this IconGlyph to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IconGlyph&&(identical(other.codePoint, codePoint) || other.codePoint == codePoint)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
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
@JsonSerializable()

class _IconGlyph implements IconGlyph {
  const _IconGlyph({required this.codePoint, this.name});
  factory _IconGlyph.fromJson(Map<String, dynamic> json) => _$IconGlyphFromJson(json);

@override final  int codePoint;
@override final  String? name;

/// Create a copy of IconGlyph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconGlyphCopyWith<_IconGlyph> get copyWith => __$IconGlyphCopyWithImpl<_IconGlyph>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IconGlyphToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IconGlyph&&(identical(other.codePoint, codePoint) || other.codePoint == codePoint)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
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
