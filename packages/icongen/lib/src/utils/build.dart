import 'dart:typed_data';

import 'package:icongen/icongen.dart';

Map<IdType, SubsetResultWithId<IdType>> buildSubsets<IdType extends Object?>({
  required Uint8List bytes,
  required Map<IdType, SubsetEntry> entries,
}) {
  final results = <IdType, SubsetResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    final builder = SubsetBuilder(
      inputBytes: bytes,
      variableAxisConstraints: entry.variableAxisConstraints,
    );
    final subsetResult = builder.build();
    results[id] = .fromSubsetResult(subsetResult, id: id);
  }
  return results;
}

Map<IdType, BindingsResultWithId<IdType>> buildBindings<
  IdType extends Object?
>({required Map<IdType, BindingsEntry> entries}) {
  final results = <IdType, BindingsResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    final builder = BindingsBuilder(
      entry.subsetResult,
      className: entry.className,
      fontFamily: entry.fontFamily,
      fontPackage: entry.fontPackage,
      forceTreeShakeIconGlyph: entry.forceTreeShakeIconGlyph,
    );
    final bindingsResult = builder.build();
    results[id] = .fromBindingsResult(bindingsResult, id: id);
  }
  return results;
}
