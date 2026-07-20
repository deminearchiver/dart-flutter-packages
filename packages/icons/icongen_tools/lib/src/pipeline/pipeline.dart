import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// ignore: implementation_imports
import 'package:icongen/src/icongen.dart';
import 'package:icongen_tools/pipeline.dart';
import 'package:interact2/interact2.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

extension on SubsetFormat {
  String get _displayName => switch (this) {
    .ttf => "TTF",
    .woff2 => "WOFF2",
  };
}

extension<ElementType extends PipelineSubsetResult> on Iterable<ElementType> {
  Iterable<ElementType> _uniqueWhereSubsetFormatOrAny(
    SubsetFormat subsetFormat,
  ) {
    final result = <Uri, ElementType>{};
    for (final subsetResult in this) {
      final key = subsetResult.entry.library;
      if (!result.containsKey(key) || subsetResult.format == subsetFormat) {
        result[key] = subsetResult;
      }
    }
    return result.values;
  }
}

String _formatDuration(Stopwatch stopwatch) {
  final elapsedTime = stopwatch.elapsedMilliseconds;
  final displayInMilliseconds = elapsedTime < 100;
  final time = displayInMilliseconds ? elapsedTime : elapsedTime / 1000;
  final formattedTime = displayInMilliseconds
      ? "${time}ms"
      : "${time.toStringAsFixed(1)}s";
  return "\x1B[90m($formattedTime)\x1B[0m";
}

String _formatDouble(double value) =>
    value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(1);

String _formatBytes(int bytes) {
  const bytesInKilobyte = 1024;
  const bytesInMegabyte = 1024 * bytesInKilobyte;
  if (bytes >= bytesInMegabyte) {
    return "${_formatDouble(bytes / bytesInMegabyte)} MB";
  } else if (bytes >= bytesInKilobyte) {
    return "${_formatDouble(bytes / bytesInKilobyte)} KB";
  }
  return "$bytes B";
}

String _formatCompression({
  required String name,
  required SubsetFormat format,
  required int originalSize,
  required int newSize,
}) {
  final before = _formatBytes(originalSize);
  final after = _formatBytes(newSize);
  final delta = 1.0 - newSize / originalSize;
  final sign = switch (delta) {
    < 0.0 => "+",
    > 0.0 => "-",
    _ => "",
  };
  final percentage = "${_formatDouble(delta.abs() * 100)}%";
  return "$name → [${format._displayName}]: "
      "$before → $after ($sign$percentage)";
}

class _ThrottledStdout implements Stdout {
  _ThrottledStdout(this._parent, {required Duration flushInterval}) {
    _timer = Timer.periodic(flushInterval, (_) => _flush());
  }

  final Stdout _parent;

  late final Timer _timer;

  final _buffer = StringBuffer();

  void _flush() {
    if (_buffer.isNotEmpty) {
      _parent.write(_buffer.toString());
      _buffer.clear();
    }
  }

  @mustCallSuper
  void dispose() {
    _timer.cancel();
    _flush();
  }

  // _Stdsink

  @override
  String get lineTerminator => _parent.lineTerminator;

  @override
  set lineTerminator(String value) => _parent.lineTerminator = value;

  @override
  Encoding get encoding => _parent.encoding;

  @override
  set encoding(Encoding value) => _parent.encoding = value;

  @override
  void write(Object? object) {
    _buffer.write(object);
  }

  @override
  void writeln([Object? object = ""]) {
    _buffer.writeln(object);
  }

  @override
  void writeAll(Iterable<Object?> objects, [String separator = ""]) {
    _buffer.writeAll(objects, separator);
  }

  @override
  void add(List<int> data) => _parent.add(data);

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _parent.addError(error, stackTrace);

  @override
  void writeCharCode(int charCode) {
    _buffer.writeCharCode(charCode);
  }

  @override
  Future<void> addStream(Stream<List<int>> stream) => _parent.addStream(stream);

  @override
  Future<void> flush() async {
    _flush();
    return _parent.flush();
  }

  @override
  Future<void> close() async {
    dispose();
    return _parent.close();
  }

  @override
  Future<void> get done => _parent.done;

  // Stdout

  @override
  bool get hasTerminal => _parent.hasTerminal;

  @override
  int get terminalColumns => _parent.terminalColumns;

  @override
  int get terminalLines => _parent.terminalLines;

  @override
  bool get supportsAnsiEscapes => _parent.supportsAnsiEscapes;

  @override
  IOSink get nonBlocking => _parent.nonBlocking;
}

class AssetManager {
  AssetManager({Logger? logger})
    : logger = logger ?? Logger("icongen_tools.pipeline.assets");

  final Logger logger;

  Future<Map<PipelineEntry, Uint8List>> loadFonts(
    Iterable<PipelineEntry> entries,
  ) async {
    final cache = <Uri, Uint8List>{};
    final result = <PipelineEntry, Uint8List>{};

    for (final entry in entries) {
      final uri = entry.input;
      if (!cache.containsKey(uri)) {
        final file = File(uri.toFilePath());
        if (!file.existsSync()) {
          final errorMsg =
              "\x1B[91mInput font file not found: ${file.path}\x1B[0m";
          logger.severe(errorMsg);
          throw FileSystemException(errorMsg, file.path);
        }
        final stopwatch = Stopwatch()..start();
        var statusText = "Reading source font: ${uri.pathSegments.last}...";
        logger.info(statusText);

        final spinner = Spinner(
          icon: "\x1B[92m✓\x1B[0m",
          failedIcon: "\x1B[91m✗\x1B[0m",
          rightPrompt: (_) => statusText,
        ).interact();

        final bytes = await file.readAsBytes();
        cache[uri] = bytes;

        statusText =
            "Loaded source font ${uri.pathSegments.last} (${(bytes.length / 1024 / 1024).toStringAsFixed(2)} MB) ${_formatDuration(stopwatch)}";
        spinner.done();
        logger.fine(statusText);
      }
      result[entry] = cache[uri]!;
    }
    return result;
  }

  Future<void> saveSubsets(Iterable<PipelineSubsetResult> results) async {
    final stopwatch = Stopwatch()..start();
    var statusText = "Writing ${results.length} font subsets to disk...";
    logger.info(statusText);

    final spinner = Spinner(
      icon: "\x1B[92m✓\x1B[0m",
      failedIcon: "\x1B[91m✗\x1B[0m",
      rightPrompt: (_) => statusText,
    ).interact();

    try {
      // ignore: invalid_use_of_internal_member
      await writeEntries(
        results.map((result) => .new(result, path: result.asset)),
        (handle, result) => handle.writeFrom(result.bytes),
      );

      statusText =
          "Wrote ${results.length} font subsets to disk ${_formatDuration(stopwatch)}";
      spinner.done();
      logger.fine(statusText);
    } catch (e, stackTrace) {
      logger.severe(
        "\x1B[91mFailed writing font subsets to disk\x1B[0m",
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveBindings(Iterable<PipelineBindingsResult> bindings) async {
    final stopwatch = Stopwatch()..start();
    var statusText = "Writing ${bindings.length} Dart bindings to disk...";
    logger.info(statusText);

    final spinner = Spinner(
      icon: "\x1B[92m✓\x1B[0m",
      failedIcon: "\x1B[91m✗\x1B[0m",
      rightPrompt: (_) => statusText,
    ).interact();

    try {
      // ignore: invalid_use_of_internal_member
      await writeEntries(
        bindings.map((result) => .new(result, path: result.entry.library)),
        (handle, result) => handle.writeString(result.code),
      );

      statusText =
          "Wrote ${bindings.length} Dart bindings to disk ${_formatDuration(stopwatch)}";
      spinner.done();
      logger.fine(statusText);
    } catch (e, stackTrace) {
      logger.severe(
        "\x1B[91mFailed writing Dart bindings to disk\x1B[0m",
        e,
        stackTrace,
      );
      rethrow;
    }
  }
}

class SubsetEngine {
  SubsetEngine({Logger? logger})
    : _logger = logger ?? Logger("icongen_tools.pipeline.subset");

  final Logger _logger;

  Future<Iterable<PipelineSubsetResult>> buildSubsets(
    Iterable<PipelineEntry> entries,
    Map<PipelineEntry, Uint8List> fontMap, {
    required PipelineServiceWorkerPool pool,
  }) async {
    _logger.info(
      "Starting multithreaded font subsetting across ${entries.length} font families...",
    );

    final multiSpinner = MultiSpinner();
    final tasks = <Future<PipelineSubsetResult>>[];

    for (final entry in entries) {
      final inputBytes = fontMap[entry]!;
      for (final MapEntry(key: format, value: assetUri)
          in entry.assets.entries) {
        tasks.add(() async {
          final stopwatch = Stopwatch()..start();
          var statusText = "${entry.fontFamily} → [${format._displayName}]...";
          _logger.fine(statusText);

          final spinner = multiSpinner.add(
            Spinner(
              icon: "\x1B[92m✓\x1B[0m",
              failedIcon: "\x1B[91m✗\x1B[0m",
              rightPrompt: (_) => statusText,
            ),
          );

          try {
            final bytes = await pool.buildSubsetBytes(
              inputBytes,
              variableAxisConstraints: entry.variableAxisConstraints,
              forceSubset: true,
              subsetFormat: format,
            );

            statusText =
                "${_formatCompression(name: entry.fontFamily, format: format, originalSize: inputBytes.length, newSize: bytes.length)} ${_formatDuration(stopwatch)}";
            spinner.done();
            _logger.fine("Completed: $statusText");

            return PipelineSubsetResult(
              entry,
              bytes: bytes,
              format: format,
              asset: assetUri,
            );
          } catch (e, stackTrace) {
            _logger.severe(
              "\x1B[91mFailed subsetting ${entry.fontFamily} [${format.name}]\x1B[0m",
              e,
              stackTrace,
            );
            rethrow;
          }
        }());
      }
    }

    return Future.wait(tasks);
  }
}

class BindingsEngine {
  BindingsEngine({Logger? logger})
    : _logger = logger ?? Logger("icongen_tools.pipeline.bindings");

  final Logger _logger;

  Future<Iterable<PipelineBindingsResult>> buildBindings(
    Iterable<PipelineSubsetResult> subsetResults, {
    required PipelineServiceWorkerPool pool,
  }) async {
    _logger.info("Generating Dart code bindings from subsets...");

    subsetResults = subsetResults._uniqueWhereSubsetFormatOrAny(.ttf);

    final allBindings = <PipelineEntry, PipelineBindingsResult>{};
    final multiSpinner = MultiSpinner();

    final tasks = <Future<void>>[];

    for (final result in subsetResults) {
      tasks.add(() async {
        final stopwatch = Stopwatch()..start();
        var statusText =
            "Generating bindings for ${result.entry.fontFamily}...";
        _logger.fine(statusText);

        final spinner = multiSpinner.add(
          Spinner(
            icon: "\x1B[92m✓\x1B[0m",
            failedIcon: "\x1B[91m✗\x1B[0m",
            rightPrompt: (_) => statusText,
          ),
        );

        try {
          final code = await pool.buildBindingsCode(
            result.bytes,
            className: result.entry.className,
            fontFamily: result.entry.fontFamily,
            fontPackage: result.entry.fontPackage,
          );

          allBindings[result.entry] = .new(result.entry, code: code);

          statusText =
              "Generated bindings for ${result.entry.fontFamily} ${_formatDuration(stopwatch)}";
          spinner.done();
          _logger.fine(statusText);
        } catch (e, stackTrace) {
          _logger.severe(
            "\x1B[91mFailed generating bindings for ${result.entry.fontFamily}\x1B[0m",
            e,
            stackTrace,
          );
          rethrow;
        }
      }());
    }

    await Future.wait(tasks);
    return allBindings.values;
  }
}

class Pipeline {
  Pipeline({
    Logger? logger,
    PipelineServiceWorkerPool? pool,
    AssetManager? assetManager,
    SubsetEngine? subsetEngine,
    BindingsEngine? bindingEngine,
  }) : _logger = logger ?? .new("icongen_tools.pipeline"),
       _pool =
           pool ??
           .new(
             concurrencySettings: const .new(
               minWorkers: 1,
               maxWorkers: 4,
               maxParallel: 1,
             ),
           ),
       _assets = assetManager ?? .new(),
       _subset = subsetEngine ?? .new(),
       _bindings = bindingEngine ?? .new();

  final Logger _logger;

  final PipelineServiceWorkerPool _pool;

  final AssetManager _assets;

  final SubsetEngine _subset;

  final BindingsEngine _bindings;

  Future<void> run({required Iterable<PipelineEntry> entries}) async {
    final previousDefaultTheme = Theme.defaultTheme;

    Theme.defaultTheme = previousDefaultTheme.copyWith(
      successPrefix: "\x1B[92m✓\x1B[0m ",
      errorPrefix: "\x1B[91m✗\x1B[0m ",
    );

    final throttledStdout = _ThrottledStdout(
      stdout,
      flushInterval: const .new(milliseconds: 80),
    );
    try {
      await IOOverrides.runZoned(
        () => _runInternal(entries: entries),
        stdout: () => throttledStdout,
      );
    } finally {
      throttledStdout.dispose();
    }

    Theme.defaultTheme = previousDefaultTheme;
  }

  Future<void> _runInternal({required Iterable<PipelineEntry> entries}) async {
    try {
      _logger.info(
        "\x1B[36m\x1B[1mStarting Icon Generation Pipeline...\x1B[0m",
      );

      await _pool.start();

      final fontMap = await _assets.loadFonts(entries);

      final subsetResults = await _subset.buildSubsets(
        entries,
        fontMap,
        pool: _pool,
      );

      await _assets.saveSubsets(subsetResults);

      final bindings = await _bindings.buildBindings(
        subsetResults,
        pool: _pool,
      );

      await _assets.saveBindings(bindings);

      _logger.info(
        "✅ \x1B[92m\x1B[1mPipeline executed successfully without errors!\x1B[0m\n",
      );
    } catch (e, stackTrace) {
      _logger.severe("\x1B[91mPipeline failed abruptly\x1B[0m", e, stackTrace);
      exitCode = 1;
      if (e is! FileSystemException) {
        _logger.fine("Detailed stack trace for failure:", e, stackTrace);
      }
    } finally {
      _pool.stop();
    }
  }
}
