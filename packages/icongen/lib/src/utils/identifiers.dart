// This list is sourced from the latest Dart language specification draft,
// section "Reserved Words".
//
// See: https://dart.dev/resources/language/spec.
import 'package:meta/meta.dart';

const _reservedWords = <String>[
  "assert",
  "break",
  "case",
  "catch",
  "class",
  "const",
  "continue",
  "default",
  "do",
  "else",
  "enum",
  "extends",
  "false",
  "final",
  "finally",
  "for",
  "if",
  "in",
  "is",
  "new",
  "null",
  "rethrow",
  "return",
  "super",
  "switch",
  "this",
  "throw",
  "true",
  "try",
  "var",
  "void",
  "while",
  "with",
];

const _ones = <String>[
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen",
];

const _tens = <String>[
  "",
  "",
  "twenty",
  "thirty",
  "forty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety",
];

String _intToNaturalLanguage(int value) {
  if (value < 20) return _ones[value];
  if (value < 100) {
    final t = value ~/ 10;
    final r = value % 10;
    return _tens[t] + (r > 0 ? "_${_ones[r]}" : "");
  }
  if (value < 1000) {
    final h = value ~/ 100;
    final r = value % 100;
    if (r == 0) return "${_ones[h]}_hundred";
    if (r < 10) return "${_ones[h]}_o_${_ones[r]}";
    return "${_ones[h]}_${_intToNaturalLanguage(r)}";
  }
  return value.toString();
}

@internal
String sanitizeIconIdentifier(
  String name, {
  Set<String> reservedIdentifiers = const {},
}) {
  name = name.replaceAll(RegExp(r"^_+"), "");
  name = name.replaceAll("-", "_");
  name = name.replaceAll(".", "_");
  final match = RegExp(r"^(\d+)(.*)").firstMatch(name);
  if (match != null) {
    final numStr = match.group(1)!;
    final rest = match.group(2)!;
    final words = _intToNaturalLanguage(int.parse(numStr));
    if (rest.isEmpty) {
      name = words;
    } else if (rest.startsWith('_')) {
      name = words + rest;
    } else {
      name = '${words}_$rest';
    }
  }
  if (_reservedWords.contains(name) || reservedIdentifiers.contains(name)) {
    name = "$name\$";
  }
  if (RegExp(r"^\d").hasMatch(name) || name.isEmpty) {
    name = "\$$name";
  }
  return name;
}
