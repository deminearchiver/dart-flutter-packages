import 'dart:typed_data';

import 'package:icongen/icongen.dart';
import 'package:meta/meta.dart';

@immutable
class SubsetResult {
  const SubsetResult({
    required this.bytes,
    this.fontFamily,
    this.iconGlyphs = const [],
  });

  final Uint8List bytes;

  final String? fontFamily;

  final List<IconGlyph> iconGlyphs;

  @override
  String toString() =>
      "SubsetResult("
      "bytes: $bytes, fontFamily: $fontFamily, iconGlyphs: $iconGlyphs"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SubsetResult &&
          bytes == other.bytes &&
          fontFamily == other.fontFamily &&
          iconGlyphs == other.iconGlyphs;

  @override
  int get hashCode => Object.hash(runtimeType, bytes, fontFamily, iconGlyphs);
}

@immutable
class SubsetResultWithId<IdType extends Object?> extends SubsetResult {
  const SubsetResultWithId({
    required this.id,
    required super.bytes,
    super.fontFamily,
    super.iconGlyphs,
  });

  SubsetResultWithId.fromSubsetResult(
    SubsetResult subsetResult, {
    required this.id,
  }) : super(
         bytes: subsetResult.bytes,
         fontFamily: subsetResult.fontFamily,
         iconGlyphs: subsetResult.iconGlyphs,
       );

  final IdType id;

  @override
  String toString() =>
      "SubsetResultWithId<$IdType>("
      "id: $id, bytes: $bytes, fontFamily: $fontFamily, iconGlyphs: $iconGlyphs"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SubsetResultWithId<IdType> &&
          id == other.id &&
          bytes == other.bytes &&
          fontFamily == other.fontFamily &&
          iconGlyphs == other.iconGlyphs;

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bytes, fontFamily, iconGlyphs);
}

@immutable
class BindingsResult {
  const BindingsResult({required this.code});

  final String code;

  @override
  String toString() => "BindingsResult(code: $code)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is BindingsResult &&
          code == other.code;

  @override
  int get hashCode => Object.hash(runtimeType, code);
}

@immutable
class BindingsResultWithId<IdType extends Object?> extends BindingsResult {
  const BindingsResultWithId({required this.id, required super.code});

  BindingsResultWithId.fromBindingsResult(
    BindingsResult bindingsResult, {
    required this.id,
  }) : super(code: bindingsResult.code);

  final IdType id;

  @override
  String toString() => "BindingsResultWithId<$IdType>(id: $id, code: $code)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is BindingsResultWithId<IdType> &&
          id == other.id &&
          code == other.code;

  @override
  int get hashCode => Object.hash(runtimeType, id, code);
}
