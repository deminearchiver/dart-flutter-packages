## Unreleased

- Internal updates to `MaterialShapes`.

## 1.2.0

- `CornerRounding.new` now uses positional parameters. For named parameters, `CornerRounding.from` can be used.
- Internal code style changes.

## 1.1.1

- Updated `README.md` with expanded information.
- Added an empty `example/main.dart` for future implementation.
- Added documentation comments for more items.

## 1.1.0

- Optimized `Point` internal implementation for raw construction, making it an [extension type](https://dart.dev/language/extension-types).
- Optimized `Cubic.fromPoints` internal constructor implementation.
- Added identity equality checks for `MutableCubic`, making every instance of the class only be equal to itself.
- Changed `startAngle` type from `int` to `double` in various APIs.
- Previously mutable static members of `MaterialShapes` (i.e. `MaterialShapes.circle`, `MaterialShapes.square` etc.) are now `final`.
- Applied [dot shorthands](https://dart.dev/language/dot-shorthands) across the library.
- Improve overall code style and clarity.

## 1.0.0

- Initial version.
