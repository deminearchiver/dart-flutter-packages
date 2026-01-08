import 'dart:io';

import 'package:csscolorparser/csscolorparser.dart';
import 'package:logging/logging.dart';

Logger createDefaultLogger() {
  final logger = Logger.detached("named_colors")..level = .INFO;
  logger.onRecord.listen((record) {
    if (record.level >= .WARNING) {
      stderr.writeln(record.message);
    } else {
      stdout.writeln(record.message);
    }
    if (record.error != null) {
      stderr.writeln(record.error);
    }
    if (record.stackTrace != null) {
      stderr.writeln(record.stackTrace);
    }
  });
  return logger;
}

Future<RunProcessResult> runProcess({
  required Uri executable,
  List<String> arguments = const [],
  Uri? workingDirectory,
  Map<String, String>? environment,
  required Logger? logger,
  bool captureOutput = true,
  Level stdoutLogLevel = Level.FINE,
  int expectedExitCode = 0,
  bool throwOnUnexpectedExitCode = false,
}) async {
  final printWorkingDir =
      workingDirectory != null && workingDirectory != Directory.current.uri;
  final commandString = [
    if (printWorkingDir) '(cd ${workingDirectory.toFilePath()};',
    ...?environment?.entries.map((entry) => '${entry.key}=${entry.value}'),
    executable.toFilePath(),
    ...arguments.map((a) => a.contains(' ') ? "'$a'" : a),
    if (printWorkingDir) ')',
  ].join(' ');
  logger?.info('Running `$commandString`.');

  final stdoutBuffer = StringBuffer();
  final stderrBuffer = StringBuffer();
  final process = await Process.start(
    executable.toFilePath(),
    arguments,
    workingDirectory: workingDirectory?.toFilePath(),
    environment: environment,
    runInShell: Platform.isWindows && workingDirectory != null,
  );

  final stdoutSub = process.stdout.listen((List<int> data) {
    try {
      final decoded = systemEncoding.decode(data);
      logger?.log(stdoutLogLevel, decoded);
      if (captureOutput) {
        stdoutBuffer.write(decoded);
      }
    } catch (e) {
      logger?.warning('Failed to decode stdout: $e');
      stdoutBuffer.write('Failed to decode stdout: $e');
    }
  });
  final stderrSub = process.stderr.listen((List<int> data) {
    try {
      final decoded = systemEncoding.decode(data);
      logger?.severe(decoded);
      if (captureOutput) {
        stderrBuffer.write(decoded);
      }
    } catch (e) {
      logger?.severe('Failed to decode stderr: $e');
      stderrBuffer.write('Failed to decode stderr: $e');
    }
  });

  final (exitCode, _, _) = await (
    process.exitCode,
    stdoutSub.asFuture<void>(),
    stderrSub.asFuture<void>(),
  ).wait;
  final result = RunProcessResult(
    pid: process.pid,
    command: commandString,
    exitCode: exitCode,
    stdout: stdoutBuffer.toString(),
    stderr: stderrBuffer.toString(),
  );
  if (throwOnUnexpectedExitCode && expectedExitCode != exitCode) {
    throw ProcessException(
      executable.toFilePath(),
      arguments,
      "Full command string: '$commandString'.\n"
      "Exit code: '$exitCode'.\n"
      'For the output of the process check the logger output.',
    );
  }
  return result;
}

/// Drop in replacement of [ProcessResult].
class RunProcessResult {
  final int pid;

  final String command;

  final int exitCode;

  final String stderr;

  final String stdout;

  RunProcessResult({
    required this.pid,
    required this.command,
    required this.exitCode,
    required this.stderr,
    required this.stdout,
  });

  @override
  String toString() =>
      '''command: $command
exitCode: $exitCode
stdout: $stdout
stderr: $stderr''';
}

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int argbFromComponents(int a, int r, int g, int b) =>
    (a << 24) | (r & 255) << 16 | (g & 255) << 8 | (b & 255);

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int argbFromColor(Color color) => switch (color.toRgba8()) {
  (final r, final g, final b, final a) => argbFromComponents(a, r, g, b),
};
@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int alphaFromArgb(int argb) => (argb >> 24) & 255;

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int redFromArgb(int argb) => (argb >> 16) & 255;

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int greenFromArgb(int argb) => (argb >> 8) & 255;

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
int blueFromArgb(int argb) => argb & 255;

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
Color colorFromArgb(int argb) => Color.fromRgba8(
  redFromArgb(argb),
  greenFromArgb(argb),
  blueFromArgb(argb),
  alphaFromArgb(argb),
);
