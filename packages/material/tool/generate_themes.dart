// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'generator/generator.dart';

void main(List<String> arguments) async {
  final formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  try {
    formatter.format("");
  } on FormatterException catch (exception) {
    print(exception);
  }
}

String? formatWith({required DartFormatter formatter, required String source}) {
  try {
    final result = formatter.format(source);
    return result;
  } on FormatException catch (exception) {
    print(exception);
    return null;
  }
}
