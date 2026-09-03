## Unreleased

- Bumped native HarfBuzz dependency to [`14.4.0`](https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0).

- Fixed FFI bindings generator unable to find standard C headers on Linux.

## 0.5.0

- Bumped minimum SDK version to Dart 3.13.
  - Refactored classes and extension types to use Dart 3.13 [primary constructors](https://dart.dev/language/primary-constructors) and [concise constructor syntax](https://dart.dev/language/constructors#concise-constructor-syntax).
  - Reformatted the library with [Dart 3.13 formatter changes](https://dart.dev/blog/announcing-dart-3-13#dart-formatter).

- Switched from [`native_toolchain_ninja`](https://pub.dev/packages/native_toolchain_ninja) to [`native_toolchain_c`](https://pub.dev/packages/native_toolchain_c) package for building the native library.
  - The `native_toolchain_ninja` tool hasn't had an update in a relatively long time, so it has been decided to switch back to the official package, `native_toolchain_c`.
  - The package no longer depends on `native_toolchain_ninja`, thus unlocking transitive dependency upgrades for dependants.

- Native bindings generator has been upgraded to [`package:ffigen:21.0.0`](https://pub.dev/packages/ffigen), which includes a number of changes in the generated code.

- Bumped dependency constraints.
  - `code_assets` to `^1.2.1`.
  - `meta` to `^1.19.0`.
  - `hooks` to `^2.2.0`.
  - `native_toolchain_c` to `^0.19.3`.
  - `dev:deminearchiver_lints` to `^3.1.0`.
  - `dev:ffigen` to `^21.0.0`.

## 0.4.2

- Included HarfBuzz experimental APIs into the generated bindings and built libraries.

## 0.4.1

- Updated the Dart build hook to fix some potential issues on different hosts.

- Other minor improvements to the Dart build hook.

## 0.4.0

- Moved high-level FFI wrappers (currently only around `hb-blob`) from the now-discontinued `harfbuzz` package to this package.
  - They are now available in the `harfbuzz_ffi` library.
  - FFI bindings are still available in the `harfbuzz_ffi_bindings` library.

- Imported and migrated examples from the discontinued `harfbuzz` package.

## 0.3.1

- Internal code clarity and code style changes.

## 0.3.0

- Included more declarations from the HarfBuzz C++ library into the generated bindings.
  - Now structs, enums, unions, typedefs and constants (macros) can be used.
  - Improved HarfBuzz identifier prefix matching by ignoring letter casing.

## 0.2.1

- Bumped native HarfBuzz dependency to [`14.2.1`](https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.1).

- Optimized native library builds: disabled RTTI, exceptions, and HarfBuzz multithreading.

- Switched from [`native_toolchain_c`](https://pub.dev/packages/native_toolchain_c) to [`native_toolchain_ninja`](https://pub.dev/packages/native_toolchain_ninja) tool for building the native library.

## 0.2.0+1

- Moved all HarfBuzz-related packages to a dedicated subdirectory.

## 0.2.0

- Checked out `harfbuzz` submodule at tag `14.2.0`.
- Moved bindings to `harfbuzz_ffi_bindings` library.

## 0.1.0

- Initial version.
