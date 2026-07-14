import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:icongen/icongen.dart';

Map<T, SubsetResultWithId<T>> buildSubsets<T extends Object?>({
  required Uint8List bytes,
  required Map<T, SubsetEntry> entries,
}) {
  final results = <T, SubsetResultWithId<T>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    final builder = SubsetBuilder(
      inputBytes: bytes,
      variableAxisConstraints: entry.variableAxisConstraints,
    );
    final subsetResult = builder.build();
    results[id] = .fromSubsetResult(subsetResult, id: id);
  }
  return results;
}

Map<T, BindingsResultWithId<T>> buildBindings<T extends Object?>({
  required Map<T, BindingsEntry> entries,
}) {
  final results = <T, BindingsResultWithId<T>>{};
  for (final MapEntry(key: id, value: entry) in entries.entries) {
    final builder = BindingsBuilder(
      entry.subsetResult,
      className: entry.className,
      fontFamily: entry.fontFamily,
      fontPackage: entry.fontPackage,
      forceTreeShakeIconGlyph: entry.forceTreeShakeIconGlyph,
    );
    final bindingsResult = builder.build();
    results[id] = .fromBindingsResult(bindingsResult, id: id);
  }
  return results;
}

typedef _WriteEntriesCallback<T extends Object?> =
    Future<void> Function(IOSink sink, T value);

Future<void> _writeEntries<T extends Object?>(
  Iterable<WriteEntry<T>> entries,
  _WriteEntriesCallback<T> write,
) async {
  final used = HashSet<String>();
  final futures = <Future<void>>[];

  for (final entry in entries) {
    final path = entry.path.toFilePath();
    if (!used.add(path)) {
      throw StateError(
        "Attempted to write multiple files to the same path: $path.",
      );
    }

    // TODO: consider replacing with Future(() async { ... })
    futures.add(() async {
      final file = File(path);
      await file.parent.create(recursive: true);

      final sink = file.openWrite();
      try {
        await write(sink, entry.value);
        await sink.flush();
      } finally {
        await sink.close();
      }
    }());
  }

  await Future.wait(futures);
}

Future<void> writeSubsets<T extends Object?>({
  required Iterable<WriteEntry<SubsetResultWithId<T>>> entries,
}) => _writeEntries(entries, (sink, value) async {
  sink.add(value.bytes);
});

Future<void> writeBindings<T extends Object?>({
  required Iterable<WriteEntry<BindingsResultWithId<T>>> entries,
}) => _writeEntries(entries, (sink, value) async {
  sink.write(value.code);
});
