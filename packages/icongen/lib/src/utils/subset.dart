import 'dart:typed_data';

import 'package:icongen/icongen.dart';
import 'package:meta/meta.dart';

typedef SubsetIdToResultMap<IdType extends Object?> =
    Map<IdType, SubsetResultWithId<IdType>>;

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

extension SubsetBuilderIdExtension on SubsetBuilder {
  SubsetResultWithId<IdType> buildWithId<IdType extends Object?>({
    required IdType id,
  }) => buildInternal(
    ({required bytes, fontFamily, required iconGlyphs}) => .new(
      id: id,
      bytes: bytes,
      fontFamily: fontFamily,
      iconGlyphs: iconGlyphs,
    ),
  );
}

SubsetIdToResultMap<IdType> buildSubsets<IdType extends Object?>({
  required Uint8List bytes,
  required Map<IdType, SubsetEntry> entries,
}) {
  final results = <IdType, SubsetResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    results[id] = SubsetBuilder(
      inputBytes: bytes,
      variableAxisConstraints: entry.variableAxisConstraints,
      forceSubset: entry.forceSubset,
      subsetFormat: entry.subsetFormat,
    ).buildWithId(id: id);
  }
  return results;
}
