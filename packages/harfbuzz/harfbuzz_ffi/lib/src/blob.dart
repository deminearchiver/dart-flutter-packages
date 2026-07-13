import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
import 'package:meta/meta.dart';

extension type const HarfbuzzMemoryMode._(hb_memory_mode_t _)
    implements hb_memory_mode_t {
  /// HarfBuzz immediately makes a copy of the data.
  static const duplicate = HarfbuzzMemoryMode._(.HB_MEMORY_MODE_DUPLICATE);

  /// HarfBuzz client will never modify the data,
  /// and HarfBuzz will never modify the data.
  static const readOnly = HarfbuzzMemoryMode._(.HB_MEMORY_MODE_READONLY);

  /// HarfBuzz client made a copy of the data solely for HarfBuzz,
  /// so HarfBuzz may modify the data.
  static const writable = HarfbuzzMemoryMode._(.HB_MEMORY_MODE_WRITABLE);

  // TODO: clarify
  /// HarfBuzz client made a copy of the data solely for HarfBuzz,
  /// so HarfBuzz may modify the data.
  static const readOnlyMayMakeWritable = HarfbuzzMemoryMode._(
    .HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE,
  );

  static const values = <HarfbuzzMemoryMode>[
    duplicate,
    readOnly,
    writable,
    readOnlyMayMakeWritable,
  ];
}

sealed class HarfbuzzBlob {
  HarfbuzzBlob._(Pointer<hb_blob_t> nativeBlob, bool attach)
    : assert(nativeBlob != nullptr),
      _nativeBlob = nativeBlob {
    if (attach) _attach();
  }

  factory HarfbuzzBlob.empty() = HarfbuzzImmutableBlob.empty;

  final Pointer<hb_blob_t> _nativeBlob;

  Pointer<hb_blob_t> get asNativeBlob {
    _checkNotDisposed();
    return _nativeBlob;
  }

  int get length {
    _checkNotDisposed();
    return hb_blob_get_length(_nativeBlob);
  }

  bool get isImmutable {
    _checkNotDisposed();
    return hb_blob_is_immutable(_nativeBlob) != 0;
  }

  Uint8List get bytes {
    _checkNotDisposed();
    return using((allocator) {
      final nativeLength = allocator<UnsignedInt>();
      final nativeData = hb_blob_get_data(_nativeBlob, nativeLength);
      if (nativeData == nullptr) return Uint8List(0);
      return nativeData.cast<Uint8>().asTypedList(nativeLength.value);
    });
  }

  HarfbuzzBlob clone();

  void _attach() {
    _finalizer.attach(this, _nativeBlob, detach: this);
  }

  void _detach() {
    _finalizer.detach(this);
  }

  var _disposed = false;

  @mustCallSuper
  void dispose() {
    _checkNotDisposed();
    _detach();
    _disposed = true;
    hb_blob_destroy(_nativeBlob);
  }

  static final _finalizer = Finalizer<Pointer<hb_blob_t>>(hb_blob_destroy);

  void _checkNotDisposed() {
    if (_disposed) {
      throw StateError(
        "A $runtimeType was used after being disposed.\n"
        "Once you have called dispose() on $runtimeType, "
        "it can no longer be used",
      );
    }
  }

  static Pointer<hb_blob_t> _empty() => hb_blob_get_empty();

  static Pointer<hb_blob_t>? _tryFromBytes(
    List<int> bytes, {
    required HarfbuzzMemoryMode memoryMode,
  }) => using((allocator) {
    final nativeBytes = allocator<Uint8>(bytes.length);
    nativeBytes.asTypedList(bytes.length).setAll(0, bytes);
    final nativeBlob = hb_blob_create_or_fail(
      nativeBytes.cast(),
      bytes.length,
      memoryMode,
      nullptr,
      nullptr,
    );
    return nativeBlob != nullptr ? nativeBlob : null;
  });

  static Pointer<hb_blob_t>? _tryFromFile(String path) => using((allocator) {
    final nativePath = path.toNativeUtf8(allocator: allocator);
    final nativeBlob = hb_blob_create_from_file_or_fail(nativePath.cast());
    return nativeBlob != nullptr ? nativeBlob : null;
  });

  static HarfbuzzMutableBlob? tryFromBytes(List<int> bytes) =>
      .tryFromBytes(bytes);

  static HarfbuzzImmutableBlob? tryFromFile(String path) => .tryFromFile(path);
}

final class HarfbuzzImmutableBlob extends HarfbuzzBlob {
  HarfbuzzImmutableBlob._(super.nativeBlob, super.attach) : super._();

  factory HarfbuzzImmutableBlob.empty() =>
      HarfbuzzImmutableBlob._(HarfbuzzBlob._empty(), false);

  @override
  bool get isImmutable {
    assert(super.isImmutable);
    return true;
  }

  @override
  HarfbuzzImmutableBlob clone() {
    _checkNotDisposed();
    hb_blob_reference(_nativeBlob);
    return ._(_nativeBlob, true);
  }

  HarfbuzzMutableBlob? copyWritable() {
    _checkNotDisposed();
    final nativeBlob = hb_blob_copy_writable_or_fail(_nativeBlob);
    return nativeBlob != nullptr ? ._(nativeBlob, true) : null;
  }

  HarfbuzzImmutableBlob createSubBlob(int offset, int length) {
    _checkNotDisposed();
    final nativeBlob = hb_blob_create_sub_blob(_nativeBlob, offset, length);
    return ._(nativeBlob, nativeBlob != HarfbuzzBlob._empty());
  }

  static HarfbuzzImmutableBlob? tryFromFile(String path) {
    final nativeBlob = HarfbuzzBlob._tryFromFile(path);
    return nativeBlob != null ? ._(nativeBlob, true) : null;
  }
}

final class HarfbuzzMutableBlob extends HarfbuzzBlob {
  HarfbuzzMutableBlob._(super.nativeBlob, super.attach) : super._();

  @override
  bool get isImmutable {
    assert(!super.isImmutable);
    return false;
  }

  List<int> get bytesWritable {
    _checkNotDisposed();
    return using((allocator) {
      final nativeLength = allocator<UnsignedInt>();
      final nativeData = hb_blob_get_data_writable(_nativeBlob, nativeLength);
      if (nativeData == nullptr) {
        throw StateError("HarfBuzz failed to provide writable blob data.");
      }
      return nativeData.cast<Uint8>().asTypedList(nativeLength.value);
    });
  }

  @override
  HarfbuzzMutableBlob clone() {
    _checkNotDisposed();
    hb_blob_reference(_nativeBlob);
    return ._(_nativeBlob, true);
  }

  HarfbuzzImmutableBlob makeImmutable() {
    _checkNotDisposed();
    _detach();
    _disposed = true;
    hb_blob_make_immutable(_nativeBlob);
    return HarfbuzzImmutableBlob._(_nativeBlob, true);
  }

  static HarfbuzzMutableBlob? tryFromBytes(List<int> bytes) {
    final nativeBlob = HarfbuzzBlob._tryFromBytes(
      bytes,
      memoryMode: .duplicate,
    );
    return nativeBlob != null ? ._(nativeBlob, true) : null;
  }
}
