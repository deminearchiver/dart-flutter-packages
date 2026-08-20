import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:icongen/src/icongen.dart';
import 'package:meta/meta.dart';

typedef SubsetIdToResultMap<IdType extends Object?> =
    Map<IdType, SubsetResultWithId<IdType>>;

@immutable
class const SubsetResultWithId<IdType extends Object?>({
  required final IdType id,
  required super.bytes,
}) extends SubsetResult {
  new fromSubsetResult(SubsetResult subsetResult, {required IdType id})
    : this(id: id, bytes: subsetResult.bytes);

  @override
  String toString() => "SubsetResultWithId<$IdType>(id: $id, bytes: $bytes)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SubsetResultWithId<IdType> &&
          id == other.id &&
          bytes == other.bytes;

  @override
  int get hashCode => Object.hash(runtimeType, id, bytes);
}

extension SubsetBuilderIdExtension on SubsetBuilder {
  SubsetResultWithId<IdType> buildWithId<IdType extends Object?>({
    required IdType id,
  }) => buildInternal(({required bytes}) => .new(id: id, bytes: bytes));
}

@immutable
class const SubsetEntry({
  final bool forceSubset = false,
  final SubsetFormat? subsetFormat,
  final VariableAxisConstraints variableAxisConstraints = const {},
}) {
  SubsetBuilder toBuilder({required Uint8List inputBytes}) => .new(
    inputBytes: inputBytes,
    forceSubset: forceSubset,
    subsetFormat: subsetFormat,
    variableAxisConstraints: variableAxisConstraints,
  );

  @override
  String toString() =>
      "SubsetEntry("
      "forceSubset: $forceSubset, "
      "subsetFormat: $subsetFormat, "
      "variableAxisConstraints: $variableAxisConstraints"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SubsetEntry &&
          forceSubset == other.forceSubset &&
          subsetFormat == other.subsetFormat &&
          _variableAxisConstraintsEquality.equals(
            variableAxisConstraints,
            other.variableAxisConstraints,
          );

  @override
  int get hashCode => Object.hash(
    runtimeType,
    forceSubset,
    subsetFormat,
    _variableAxisConstraintsEquality.hash(variableAxisConstraints),
  );

  static const _variableAxisConstraintsEquality =
      MapEquality<VariableAxisTag, VariableAxisConstraint>();
}

SubsetIdToResultMap<IdType> buildSubsets<IdType extends Object?>({
  required Uint8List inputBytes,
  required Map<IdType, SubsetEntry> entries,
}) {
  final results = <IdType, SubsetResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    results[id] = entry.toBuilder(inputBytes: inputBytes).buildWithId(id: id);
  }
  return results;
}
