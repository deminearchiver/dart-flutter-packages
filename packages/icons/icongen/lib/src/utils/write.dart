import 'dart:collection';
import 'dart:io';

import 'package:icongen/src/icongen.dart';
import 'package:meta/meta.dart';

@immutable
class WriteEntry<ValueType extends Object?> {
  const WriteEntry(this.value, {required this.path});

  final ValueType value;

  final Uri path;

  @override
  String toString() => "WriteEntry<$ValueType>($value, path: $path)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is WriteEntry<ValueType> &&
          value == other.value &&
          path == other.path;

  @override
  int get hashCode => Object.hash(runtimeType, value, path);
}

@internal
typedef WriteEntriesCallback<ValueType extends Object?> =
    Future<void> Function(RandomAccessFile handle, ValueType value);

@internal
Future<void> writeEntries<ValueType extends Object?>(
  Iterable<WriteEntry<ValueType>> entries,
  WriteEntriesCallback<ValueType> write,
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

    futures.add(
      .new(() async {
        final file = File(path);
        RandomAccessFile handle;
        try {
          handle = await file.open(mode: .write);
        } on Object {
          if (!file.existsSync()) {
            file.createSync(recursive: true);
            handle = await file.open(mode: .write);
          } else {
            rethrow;
          }
        }
        await handle.lock(.blockingExclusive);
        try {
          await write(handle, entry.value);
        } finally {
          await handle.flush();
          await handle.close();
        }
      }),
    );
  }

  await Future.wait(futures);
}

Future<void> writeSubsets<IdType extends Object?>({
  required Iterable<WriteEntry<SubsetResultWithId<IdType>>> entries,
}) => writeEntries(entries, (handle, value) => handle.writeFrom(value.bytes));

Future<void> writeBindings<IdType extends Object?>({
  required Iterable<WriteEntry<BindingsResultWithId<IdType>>> entries,
}) => writeEntries(entries, (handle, value) => handle.writeString(value.code));
