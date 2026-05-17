import 'dart:convert';
import 'dart:io';

class VariationAxis {
  const VariationAxis({
    required this.tag,
    required this.minimumValue,
    required this.defaultValue,
    required this.maximumValue,
    required this.name,
  });

  final String tag;
  final double minimumValue;
  final double defaultValue;
  final double maximumValue;
  final String name;
}

void main(List<String> arguments) async {
  // final result = Process.runSync(executable, arguments);
}
