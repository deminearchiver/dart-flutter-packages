import 'dart:typed_data';

import 'package:icongen/src/icongen.dart';
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

@immutable
class BindingsEntry {
  const BindingsEntry({
    required this.inputBytes,
    required this.className,
    this.fontFamily,
    this.fontPackage,
    this.forceTreeShakeIconGlyph,
  });

  final Uint8List inputBytes;

  final String className;

  final String? fontFamily;

  final String? fontPackage;

  final IconGlyph? forceTreeShakeIconGlyph;

  BindingsBuilder toBuilder() => .new(
    inputBytes: inputBytes,
    className: className,
    fontFamily: fontFamily,
    fontPackage: fontPackage,
    forceTreeShakeIconGlyph: forceTreeShakeIconGlyph,
  );

  @override
  String toString() =>
      "BindingsEntry("
      "inputBytes: $inputBytes, "
      "className: $className, "
      "fontFamily: $fontFamily, "
      "fontPackage: $fontPackage, "
      "forceTreeShakeIconGlyph: $forceTreeShakeIconGlyph"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is BindingsEntry &&
          inputBytes == other.inputBytes &&
          className == other.className &&
          fontFamily == other.fontFamily &&
          fontPackage == other.fontPackage &&
          forceTreeShakeIconGlyph == other.forceTreeShakeIconGlyph;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    inputBytes,
    className,
    fontFamily,
    fontPackage,
    forceTreeShakeIconGlyph,
  );
}

BindingsIdToResultMap<IdType> buildBindings<IdType extends Object?>({
  required Map<IdType, BindingsEntry> entries,
}) {
  final results = <IdType, BindingsResultWithId<IdType>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    results[id] = entry.toBuilder().buildWithId(id: id);
  }
  return results;
}
