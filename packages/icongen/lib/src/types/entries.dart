import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icongen/icongen.dart';

part 'entries.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class SubsetEntry with _$SubsetEntry {
  const factory SubsetEntry({
    @Default({}) VariableAxisConstraints variableAxisConstraints,
    @Default(false) bool forceSubset,
    SubsetFormat? subsetFormat,
  }) = _SubsetEntry;
}

@Freezed(fromJson: false, toJson: false)
abstract class WriteEntry<ValueType extends Object?>
    with _$WriteEntry<ValueType> {
  const factory WriteEntry(ValueType value, {required Uri path}) =
      _WriteEntry<ValueType>;
}

@Freezed(fromJson: false, toJson: false)
abstract class BindingsEntry with _$BindingsEntry {
  const factory BindingsEntry(
    SubsetResult subsetResult, {
    required String className,
    String? fontFamily,
    String? fontPackage,
    IconGlyph? forceTreeShakeIconGlyph,
  }) = _BindingsEntry;
}
