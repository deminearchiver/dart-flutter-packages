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
