import 'package:icongen/icongen.dart';

abstract interface class PipelineEntry {
  const PipelineEntry();

  Uri get input;

  VariableAxisConstraints get variableAxisConstraints;

  Map<SubsetFormat, Uri> get assets;

  Uri get library;

  String get className;

  String get fontFamily;

  String? get fontPackage;
}
