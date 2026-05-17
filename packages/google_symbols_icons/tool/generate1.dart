import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';

/// Centralized Process runner demonstrating Dart best practices.
/// - Uses [runInShell: false] to prevent shell injection and escaping issues.
/// - Strongly types the expected output via [stdoutEncoding].
/// - Validates [exitCode] strictly, throwing detailed [ProcessException]s.
Future<ProcessResult> _runCommand(
  String executable,
  List<String> arguments, {
  Encoding? stdoutEncoding = utf8,
}) async {
  try {
    final result = await Process.run(
      executable,
      arguments,
      stdoutEncoding: stdoutEncoding,
      runInShell: false,
    );

    if (result.exitCode != 0) {
      throw ProcessException(
        executable,
        arguments,
        'Process failed with exit code ${result.exitCode}.\nSTDERR: ${result.stderr}',
        result.exitCode,
      );
    }
    return result;
  } on ProcessException catch (e) {
    stderr.writeln(
      'Executable "$executable" is missing or failed: ${e.message}',
    );
    exit(1);
  }
}

Future<void> _checkDependencies() async {
  for (final bin in ['hb-info', 'hb-subset']) {
    await _runCommand(bin, ['--version']);
  }
}

String _sanitizeDartIdentifier(String name) {
  var safeName = name.replaceAll(RegExp(r'[^a-zA-Z0-9_$]'), '_');
  safeName = safeName.replaceFirst(RegExp(r'^_+'), '');

  if (safeName.isEmpty) safeName = 'icon';
  if (RegExp(r'^[0-9]').hasMatch(safeName)) safeName = 'icon_$safeName';

  const reservedKeywords = {
    'class',
    'default',
    'extends',
    'assert',
    'null',
    'switch',
    'return',
    'break',
    'case',
    'catch',
    'const',
    'continue',
    'do',
    'else',
    'false',
    'final',
    'for',
    'if',
    'in',
    'is',
    'new',
    'super',
    'this',
    'throw',
    'true',
    'try',
    'var',
    'void',
    'while',
  };

  if (reservedKeywords.contains(safeName)) {
    safeName = '${safeName}_icon';
  }

  return safeName;
}

Future<Map<int, String>> _extractIcons(String ttfPath) async {
  stdout.writeln('Querying font glyphs and unicodes map via hb-info...');

  final resGly = await _runCommand('hb-info', [ttfPath, '--list-glyphs']);
  final resUni = await _runCommand('hb-info', [ttfPath, '--list-unicodes']);

  final glyphMap = <String, String>{};
  final glyphRegex = RegExp(r'(?:glyph\s+)?(\d+)[:\s]+(\S+)');

  for (final line in LineSplitter.split(resGly.stdout as String)) {
    final match = glyphRegex.firstMatch(line.trim());
    if (match != null) {
      final gId = match.group(1)!;
      final gName = match.group(2)!;
      if (!gName.startsWith('.')) glyphMap[gId] = gName;
    }
  }

  final icons = <int, String>{};
  final uniRegex = RegExp(r'U\+([0-9A-Fa-f]+)');
  final idRegex = RegExp(r'(?:glyph\s+)?(\d+)');

  for (final line in LineSplitter.split(resUni.stdout as String)) {
    final uniMatch = uniRegex.firstMatch(line.trim());
    if (uniMatch == null) continue;

    final codepoint = int.parse(uniMatch.group(1)!, radix: 16);
    if (codepoint == 0) continue;

    final remainder = line.replaceFirst(uniMatch.group(0)!, '');
    final idMatch = idRegex.firstMatch(remainder);

    String? gName;
    if (idMatch != null) {
      gName = glyphMap[idMatch.group(1)!];
    }

    if (gName == null) {
      final cleanName = remainder
          .replaceAll(RegExp(r'[()\-:>\s]+'), ' ')
          .trim();
      if (cleanName.isNotEmpty && !cleanName.contains(' ')) {
        gName = cleanName;
      }
    }

    if (gName != null && !gName.startsWith('.')) {
      icons[codepoint] = gName;
    }
  }

  return icons;
}

void _generateDartClass(
  Map<int, String> icons,
  String fontFamily,
  String className,
  String outputPath,
) {
  final buffer = StringBuffer()
    ..writeln("import 'package:flutter/widgets.dart';\n")
    ..writeln("/// Generated using HarfBuzz (hb-info) from $fontFamily TTF")
    ..writeln("class $className {")
    ..writeln("  // This class is not meant to be instantiated or extended.")
    ..writeln("  $className._();\n");

  if (icons.isNotEmpty) {
    final sampleHex = icons.keys.first.toRadixString(16).padLeft(4, '0');
    buffer
      ..writeln(
        "  /// This routine exists to FORCE TREE SHAKING of the icon fonts that may not be referenced",
      )
      ..writeln(
        "  /// at all within the application. Tree shaking DOES NOT OCCUR for fonts that are never referenced.",
      )
      ..writeln("  @pragma('vm:entry-point')")
      ..writeln("  static void forceCompileTimeTreeShaking() {")
      ..writeln("    // ignore: unused_local_variable")
      ..writeln(
        "    var forceTreeShake = const IconData(0x$sampleHex, fontFamily: '$fontFamily');",
      )
      ..writeln("  }\n");
  }

  buffer.writeln("  // BEGIN GENERATED ICONS");

  final sortedEntries = icons.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  final seenDartNames = <String, int>{};

  for (final entry in sortedEntries) {
    var dartName = _sanitizeDartIdentifier(entry.value);

    if (seenDartNames.containsKey(dartName)) {
      seenDartNames[dartName] = seenDartNames[dartName]! + 1;
      dartName = '${dartName}_${seenDartNames[dartName]}';
    } else {
      seenDartNames[dartName] = 0;
    }

    final hexCode = entry.key.toRadixString(16).padLeft(4, '0');
    buffer.writeln("  /// Icon: ${entry.value} (0x$hexCode)");

    final proposedLine =
        "  static const IconData $dartName = IconData(0x$hexCode, fontFamily: '$fontFamily');";
    if (proposedLine.length > 80) {
      buffer
        ..writeln("  static const IconData $dartName =")
        ..writeln("      IconData(0x$hexCode, fontFamily: '$fontFamily');");
    } else {
      buffer.writeln(proposedLine);
    }
  }

  buffer.writeln("  // END GENERATED ICONS\n}");

  File(outputPath).writeAsStringSync(buffer.toString());
  stdout.writeln(
    'Successfully generated $outputPath with ${icons.length} icons.',
  );
}

Future<void> _splitFontByRond(String ttfPath) async {
  stdout.writeln('Analyzing $ttfPath for ROND axis variations...');

  final res = await _runCommand('hb-info', [ttfPath, '--list-variations']);
  String? rondLine;

  for (final line in LineSplitter.split(res.stdout as String)) {
    if (line.toUpperCase().contains('ROND')) {
      rondLine = line;
      break;
    }
  }

  if (rondLine == null) {
    stderr.writeln(
      'Warning: ROND axis not found in the font\'s variation metadata.',
    );
    return;
  }

  final minMatch = RegExp(
    r'min[:\s=]+([0-9.-]+)',
    caseSensitive: false,
  ).firstMatch(rondLine);
  final maxMatch = RegExp(
    r'max[:\s=]+([0-9.-]+)',
    caseSensitive: false,
  ).firstMatch(rondLine);

  if (minMatch == null || maxMatch == null) {
    stderr.writeln('Warning: Could not parse variation limits for ROND axis.');
    return;
  }

  final rondMin = double.parse(minMatch.group(1)!);
  final rondMax = double.parse(maxMatch.group(1)!);

  final instances = {
    'sharp': (rondMin >= 0.0) ? rondMin : 0.0,
    'outlined': (rondMin <= 50.0 && 50.0 <= rondMax)
        ? 50.0
        : (rondMin + rondMax) / 2.0,
    'rounded': (rondMax <= 100.0) ? rondMax : 100.0,
  };

  final fileExt = ttfPath.substring(ttfPath.lastIndexOf('.'));
  final baseName = ttfPath.substring(0, ttfPath.lastIndexOf('.'));

  for (final entry in instances.entries) {
    final styleName = entry.key;
    final rondVal = entry.value;
    final outPath = '${baseName}_$styleName$fileExt';

    stdout.writeln(
      "Instantiating '$styleName' (ROND=$rondVal) directly into memory...",
    );

    // Demonstrating the stdout byte buffering discussed previously
    final bufferResult = await _runCommand(
      'hb-subset',
      [
        '--font-file=$ttfPath',
        '-o',
        '-',
        '--unicodes=*',
        '--variations=ROND=$rondVal',
        '--optimize',
      ],
      stdoutEncoding:
          null, // CRITICAL: null ensures stdout is returned as raw List<int>
    );

    // Write the raw bytes to disk manually
    File(outPath).writeAsBytesSync(bufferResult.stdout as List<int>);
    stdout.writeln('Saved split font: $outPath');
  }
}

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'family',
      defaultsTo: 'MyFont',
      help: 'Font family name to use in Flutter',
    )
    ..addOption(
      'class-name',
      defaultsTo: 'MyIcons',
      help: 'Name of the generated Dart class',
    )
    ..addOption(
      'output',
      help: 'Output Dart file path. Defaults to <class_name_lowercase>.dart',
    )
    ..addFlag(
      'split-rond',
      defaultsTo: false,
      help: 'Split the font into Outlined, Rounded, and Sharp variants',
    );

  late ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    stderr.writeln(e);
    exit(1);
  }

  if (args.rest.isEmpty) {
    stderr.writeln('Error: Missing required argument [ttf_file]');
    exit(1);
  }

  final ttfFile = args.rest.first;
  if (!File(ttfFile).existsSync()) {
    stderr.writeln('Error: Input file not found: $ttfFile');
    exit(1);
  }

  await _checkDependencies();

  if (args['split-rond'] as bool) {
    await _splitFontByRond(ttfFile);
  }

  final className = args['class-name'] as String;
  final outputFile =
      args['output'] as String? ?? '${className.toLowerCase()}.dart';

  final iconsMapping = await _extractIcons(ttfFile);

  if (iconsMapping.isEmpty) {
    stderr.writeln('Warning: No valid named icons found in the font.');
  } else {
    _generateDartClass(
      iconsMapping,
      args['family'] as String,
      className,
      outputFile,
    );
  }
}
