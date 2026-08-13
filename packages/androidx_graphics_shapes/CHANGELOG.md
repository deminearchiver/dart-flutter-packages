## Unreleased

- Introduced a new main library `androidx_graphics_shapes`.
  - The `shapes` library is now deprecated in favor of `androidx_graphics_shapes`.
  - Added [data-driven fixes](https://github.com/flutter/flutter/blob/master/docs/contributing/Data-driven-Fixes.md) for automatic migration from `package:androidx_graphics_shapes/shapes.dart` to `package:androidx_graphics_shapes/androidx_graphics_shapes.dart`.

- Deprecated the `material_shapes` library in favor of `package:material_3p/material_shapes.dart`.
  - Added [data-driven fixes](https://github.com/flutter/flutter/blob/master/docs/contributing/Data-driven-Fixes.md) for automatic migration from `package:androidx_graphics_shapes/material_shapes.dart` to `package:material_3p/material_shapes.dart`.

- Bumped minimum SDK versions to Dart 3.13 and Flutter 3.47.
  - Refactored classes and extension types to use Dart 3.13 [primary constructors](https://dart.dev/language/primary-constructors) and [concise constructor syntax](https://dart.dev/language/constructors#concise-constructor-syntax).
  - Reformatted the library with [Dart 3.13 formatter changes](https://dart.dev/blog/announcing-dart-3-13#dart-formatter).

- Made `Feature` a `sealed class`.
  - This restricts subclass hierarchy solely to `Edge` and `Corner`, which are already `final` classes.

- Upgraded dependencies to latest pinned SDK constraints.
  - `meta` to `^1.19.0`.
  - `vector_math` to `^2.4.2`.

- Minor internal changes.

## 1.6.1

- Applied minor optimizations to `Cubic.split()` (cartesian optimization) and `Cubic.pointOnCurve()`.

- Fixed changelog formatting.

## 1.6.0

- Introduced a new abstract `DynamicPathBorder` class, which allows implementing bounds-dependent path borders while handling the painting logic automatically.
  - This change adds proper `BorderSide` support to both `RoundedPolygonBorder` and `MorphBorder`, including proper stroke alignment.
  - New `strokeCap`, `strokeJoin` and `strokeMiterLimit` properties allow customizing how the shape's outline will be painted. This change was propagated down to `StaticPathBorder`, `RoundedPolygonBorder` and `MorphBorder` as well.
  - The `DynamicPathBorder.paintPathStroke()` static method provides painting logic to help paint path strokes on a `Canvas`, e.g. in `CustomPainter.paint()`, `RenderObject.paint()`, etc.

- Renamed `PathBorder` to `StaticPathBorder` and changed its superclass to `DynamicPathBorder`.

- Added `Object.toString()` overrides for all custom borders: `DynamicPathBorder`, `StaticPathBorder`, `RoundedPolygonBorder` and `MorphBorder`.

- Added documentation clarifying the normalized path requirements to  `StaticPathBorder.path`.

- Removed deprecated internal extensions: `RoundedPolygonInternalExtension` and `MorphInternalExtension`.
  - Code that previously relied on these extension must switch to the public extensions: `RoundedPolygonExtension` and `MorphExtension` respectively.

- Bumped minimum SDK versions to Dart 3.12 and Flutter 3.44.

- Cleaned up internal code.

- Reformatted the library with Dart 3.12 formatter changes.

- Reformatted the changelog.

## 1.5.0

- Changed `RoundedPolygonExtension.transformedWithMatrix4()` to always perform perspective transform. Removed the `usePerspectiveTransform` parameter.

- Fixed `RoundedPolygon.hashCode` returning different hash codes for equal objects. The `features` list is now being properly hashed by values.

- Replaced usages of `listEquals()` and `Object.hashAll()` with `ListEquality().equals()` and `ListEquality().hash()`.

- Minor optimizations, as well as internal and code style changes.

## 1.4.0+1

- Added missing 1.4.0 changelog entries.

## 1.4.0

- Bumped minimum Dart SDK to 3.11 and Flutter to 3.41.

- Marked internal extension methods on `RoundedPolygon` and `Morph` as deprecated.

- Fixed `RoundedPolygonBorder.copyWith()` skipping `side` and `squash` properties.

- Exposed `PathBorder` for public use.

- Added `transformedWithMatrix2()`, `transformedWithMatrix3()` and `transformedWithMatrix4()` methods to `RoundedPolygonExtension`.

- Added more arguments to `RoundedPolygonExtension.toPath()` and `MorphExtension.toPath()` methods.

- Optimized internal calculations and algorithms in the `material_shapes` library only.

## 1.3.2

- Downgraded the dependency constraint of `meta` to `^1.17.0` to match the version pinned by the stable SDK.

## 1.3.1

- Removed usages of the `@immutable` annotation.

- Internal changes.

- Addressed linter feedback.

- Upgraded dependencies.

## 1.3.0

- Added path caching to `RoundedPolygonBorder` and `MorphBorder` so they are no longer const-constructable.

- Implemented morphing between `RoundedPolygonBorder` shapes and between `MorphBorder` shapes (with the same `morph` values).

- Exposed `start` and `end` properties of `Morph` as internal members.

- Internal updates to `MaterialShapes`.

- Added inline pragmas to internal utils.

## 1.2.0

- `CornerRounding()` now uses positional parameters. For named parameters, `CornerRounding.from()` can be used.

- Internal code style changes.

## 1.1.1

- Updated `README.md` with expanded information.

- Added an empty `example/main.dart` for future implementation.

- Added documentation comments for more items.

## 1.1.0

- Optimized `Point` internal implementation for raw construction, making it an [extension type](https://dart.dev/language/extension-types).

- Optimized `Cubic.fromPoints()` internal constructor implementation.

- Added identity equality checks for `MutableCubic`, making every instance of the class only be equal to itself.

- Changed `startAngle` type from `int` to `double` in various APIs.

- Previously mutable static members of `MaterialShapes` (i.e. `MaterialShapes.circle`, `MaterialShapes.square` etc.) are now `final`.

- Applied [dot shorthands](https://dart.dev/language/dot-shorthands) across the library.

- Improve overall code style and clarity.

## 1.0.0

- Initial version.
