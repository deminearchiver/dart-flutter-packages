import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:ffi_leak_tracker/ffi_leak_tracker.dart';
import 'package:icongen/src/icongen.dart';
import 'package:meta/meta.dart';

@immutable
class const SubsetResult({required final Uint8List bytes}) {
  @override
  String toString() => "SubsetResult(bytes: $bytes)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SubsetResult &&
          bytes == other.bytes;

  @override
  int get hashCode => Object.hash(runtimeType, bytes);
}

@internal
typedef SubsetBuilderResultFactory<ResultType extends Object?> =
    ResultType Function({required Uint8List bytes});

@immutable
final class const SubsetBuilder({
  required final Uint8List inputBytes,
  final VariableAxisConstraints variableAxisConstraints = const {},
  final bool forceSubset = false,
  final SubsetFormat? subsetFormat,
}) {
  @internal
  ResultType buildInternal<ResultType extends Object?>(
    SubsetBuilderResultFactory<ResultType> factory,
  ) => using((arena) {
    final (inputFormat, inputBlob) = createBlob(
      inputBytes,
      "Unsupported font format or failed to create hb_blob_t.",
      arena: arena,
    );
    final inputFace = createFace(
      inputBlob,
      "Unsupported font format or failed to create hb_face_t.",
      arena: arena,
    );

    final subsetFace = forceSubset || variableAxisConstraints.isNotEmpty
        ? createFaceSubset(inputFace, variableAxisConstraints, arena: arena)
        : inputFace;
    final subsetFormat = this.subsetFormat ?? inputFormat;
    return factory(bytes: faceToBytes(subsetFace, subsetFormat, arena: arena));
  }, adaptiveCalloc);

  SubsetResult build() => buildInternal(SubsetResult.new);
}
