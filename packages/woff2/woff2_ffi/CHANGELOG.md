## Unreleased

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

## 0.1.2

- Fixed Dart build hook failing on Linux.

- Changed package location in the repository.

## 0.1.1

- Disabled verbose logging in the Dart build hook.

- Minor build hook improvements.

## 0.1.0

- Initial version.

- Added `google/woff2` and `google/brotli` submodules.

- Set up proper `.pubignore` file to decrease published package size.

- Generated FFI bindings.

- Set up Dart build hooks.

- Added WOFF2 C++ API wrapper written in C.
