import 'dart:async';
import 'dart:typed_data';
import 'package:icongen/icongen.dart';
import 'package:squadron/squadron.dart';

import 'service.activator.g.dart';
part 'service.worker.g.dart';

@SquadronService(targetPlatform: TargetPlatform.vm)
base class PipelineService {
  @SquadronMethod()
  Future<Uint8List> buildSubsetBytes(
    Uint8List inputBytes, {
    VariableAxisConstraints variableAxisConstraints = const {},
    bool forceSubset = false,
    SubsetFormat? subsetFormat,
  }) async {
    final subsetBuilder = SubsetBuilder(
      inputBytes: inputBytes,
      variableAxisConstraints: variableAxisConstraints,
      forceSubset: forceSubset,
      subsetFormat: subsetFormat,
    );
    // ignore: invalid_use_of_internal_member
    return subsetBuilder.buildInternal(({required bytes}) => bytes);
  }

  @SquadronMethod()
  Future<String> buildBindingsCode(
    Uint8List inputBytes, {
    required String className,
    String? fontFamily,
    String? fontPackage,
    IconGlyph? forceTreeShakeIconGlyph,
  }) async {
    final subsetBuilder = BindingsBuilder(
      inputBytes: inputBytes,
      className: className,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
      forceTreeShakeIconGlyph: forceTreeShakeIconGlyph,
    );
    // ignore: invalid_use_of_internal_member
    return subsetBuilder.buildInternal(({required code}) => code);
  }
}
