import 'dart:io';

import 'utils.dart';

void main(List<String> arguments) async {
  final logger = createDefaultLogger();

  final packageRoot = Directory.current.uri;

  final fbExecutable = packageRoot.resolve("tool/flatc.exe");
  final fbInput = packageRoot.resolve("src/flat_buffers_schema.fbs");

  final fbResult = await runProcess(
    executable: fbExecutable,
    arguments: [
      "--dart",
      "-o",
      "./lib/src",
      "--filename-suffix",
      ".g",
      fbInput.toFilePath(),
    ],
    logger: logger,
    throwOnUnexpectedExitCode: true,
  );

  if (fbResult.exitCode != 0) {
    exit(fbResult.exitCode);
  }

  final dartExecutable = Uri.parse("dart");

  final fixResult = await runProcess(
    executable: dartExecutable,
    arguments: ["fix", "--apply", "lib/src/flat_buffers_schema.g.dart"],
    logger: logger,
    throwOnUnexpectedExitCode: true,
  );
  stdout.write(fixResult.stdout);
  stderr.write(fixResult.stderr);
  final formatResult = await runProcess(
    executable: dartExecutable,
    arguments: ["format", "lib/src/flat_buffers_schema.g.dart"],
    logger: logger,
    throwOnUnexpectedExitCode: true,
  );
  stdout.write(formatResult.stdout);
  stderr.write(formatResult.stderr);

  // process = await Process.start("dart", [
  //   "format",
  //   "./lib/src/flat_buffers_schema.g.dart",
  // ], mode: .inheritStdio);

  // exitCode = await process.exitCode;

  // if (exitCode != 0) {
  //   exit(exitCode);
  // }
}
