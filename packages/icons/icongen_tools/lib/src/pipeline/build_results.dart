import 'package:icongen/icongen.dart';
import 'package:icongen_tools/pipeline.dart';
import 'package:meta/meta.dart';

@optionalTypeArgs
@immutable
class PipelineSubsetResult<EntryType extends PipelineEntry>
    extends SubsetResult {
  const PipelineSubsetResult(
    this.entry, {
    required super.bytes,
    required this.format,
    required this.asset,
  });

  PipelineSubsetResult.fromSubsetResult(
    SubsetResult subsetResult, {
    required this.entry,
    required this.format,
    required this.asset,
  }) : super(bytes: subsetResult.bytes);

  final EntryType entry;

  final SubsetFormat format;

  final Uri asset;

  @override
  String toString() =>
      "PipelineSubsetResult<$EntryType>("
      "$entry, bytes: $bytes, format: $format, asset: $asset"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is PipelineSubsetResult<EntryType> &&
          entry == other.entry &&
          bytes == other.bytes &&
          format == other.format &&
          asset == other.asset;

  @override
  int get hashCode => Object.hash(runtimeType, entry, bytes, format, asset);
}

@optionalTypeArgs
@immutable
class PipelineBindingsResult<EntryType extends PipelineEntry>
    extends BindingsResult {
  const PipelineBindingsResult(this.entry, {required super.code});

  PipelineBindingsResult.fromBindingsResult(
    BindingsResult bindingsResult, {
    required this.entry,
  }) : super(code: bindingsResult.code);

  final EntryType entry;

  @override
  String toString() =>
      "PipelineBindingsResult<$EntryType>($entry, code: $code)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is PipelineBindingsResult<EntryType> &&
          entry == other.entry &&
          code == other.code;

  @override
  int get hashCode => Object.hash(runtimeType, entry, code);
}
