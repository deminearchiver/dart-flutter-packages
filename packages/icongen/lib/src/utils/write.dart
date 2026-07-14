import 'dart:collection';
import 'dart:io';

import 'package:icongen/icongen.dart';

typedef _WriteEntriesCallback<ValueType extends Object?> =
    Future<void> Function(IOSink sink, ValueType value);

Future<void> _writeEntries<ValueType extends Object?>(
  Iterable<WriteEntry<ValueType>> entries,
  _WriteEntriesCallback<ValueType> write,
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

Future<void> writeSubsets<ValueType extends Object?>({
  required Iterable<WriteEntry<SubsetResultWithId<ValueType>>> entries,
}) => _writeEntries(entries, (sink, value) async {
  sink.add(value.bytes);
});

Future<void> writeBindings<ValueType extends Object?>({
  required Iterable<WriteEntry<BindingsResultWithId<ValueType>>> entries,
}) => _writeEntries(entries, (sink, value) async {
  sink.write(value.code);
});
