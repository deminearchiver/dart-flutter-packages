## Unreleased

- Fixed mistakenly calculating WOFF2 uncompressed size for *some* non-WOFF2 fonts.
  - The issue was causing absurdly large allocations before the decompression would fail.
  - Adds a check for the [WOFF2 Header](https://www.w3.org/TR/WOFF2/#woff20Header) signature.
  - Now, non-WOFF2 fonts fill never get passed to the WOFF2 native library.

- Reduced unnecessary memory copies by utilizing Dart native finalizers.
  - Currently, this experimental change only applies to two use cases: decompressing a WOFF2 font before any processing, and compressing subset results to WOFF2.

- Migrated from `package:ffi` allocators to `package:ffi_leak_tracker` adaptive allocators.
  - This integration will help track potential native memory leaks.

- Bumped minimum SDK versions to Dart 3.13 and Flutter 3.47.
  - Refactored classes and extension types to use Dart 3.13 [primary constructors](https://dart.dev/language/primary-constructors) and [concise constructor syntax](https://dart.dev/language/constructors#concise-constructor-syntax).
  - Reformatted the library with [Dart 3.13 formatter changes](https://dart.dev/blog/announcing-dart-3-13#dart-formatter).

- Bumped dependency constraints.
  - `woff2_ffi` to `^0.2.0`.

## 0.1.0

- Initial version
