import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icongen/icongen.dart';

part 'entries.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class SubsetEntry with _$SubsetEntry {
  const factory SubsetEntry({
    @Default({}) VariableAxisConstraints variableAxisConstraints,
  }) = _SubsetEntry;
}

@Freezed(fromJson: false, toJson: false)
abstract class WriteEntry<T extends Object?> with _$WriteEntry<T> {
  const factory WriteEntry(T value, {required Uri path}) = _WriteEntry<T>;
}

@Freezed(fromJson: false, toJson: false)
abstract class BindingsEntry with _$BindingsEntry {
  const factory BindingsEntry({
    required SubsetResult subsetResult,
    required String className,
    String? fontFamily,
    String? fontPackage,
    IconGlyph? forceTreeShakeIconGlyph,
  }) = _BindingsEntry;
}
