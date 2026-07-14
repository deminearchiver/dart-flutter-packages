import 'package:icongen/icongen.dart';
import 'package:meta/meta.dart';

typedef BindingsIdToResultMap<IdType extends Object?> =
    Map<IdType, BindingsResultWithId<IdType>>;

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

extension BindingsBuilderIdExtension on BindingsBuilder {
  BindingsResultWithId<IdType> buildWithId<IdType extends Object?>({
    required IdType id,
  }) => buildInternal(({required code}) => .new(id: id, code: code));
}

BindingsIdToResultMap<IdType> buildBindings<IdType extends Object?>({
  required Map<IdType, BindingsEntry> entries,
}) {
  final results = <IdType, BindingsResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    results[id] = BindingsBuilder(
      entry.subsetResult,
      className: entry.className,
      fontFamily: entry.fontFamily,
      fontPackage: entry.fontPackage,
      forceTreeShakeIconGlyph: entry.forceTreeShakeIconGlyph,
    ).buildWithId(id: id);
  }
  return results;
}
