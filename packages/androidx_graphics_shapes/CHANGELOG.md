## 2.0.0

- Aligned the package API and implementation with the newly-released Material Shapes in the official `material_ui` package.
  - Kept derivative performance optimizations from previous versions.
  - Retained a public `RoundedPolygon` API instead of hiding members behind `RoundedPolygonInternals`.
  - Moved `MaterialShapes`, `DynamicPathBorder`, `StaticPathBorder`, `RoundedPolygonBorder`, and `MorphBorder` back from `material_3p` into `androidx_graphics_shapes`.
  - Removed the `material_3p` dependency.

- Removed the deprecated `shapes` and `material_shapes` libraries.
  - All public APIs are now exported directly from `package:androidx_graphics_shapes/androidx_graphics_shapes.dart`.
  - Updated data-driven fixes to migrate `package:androidx_graphics_shapes/material_shapes.dart` imports to `package:androidx_graphics_shapes/androidx_graphics_shapes.dart`.

- Changed `CornerRounding` constructor parameters from positional to named.
  - The `CornerRounding.from()` constructor is now unnamed (`CornerRounding()`) and the unnamed constructor with positional parameters is now gone.
  - From now on, all instantiations of this class must use named parameters: `CornerRounding(radius: ..., smoothing: ...)`.
  - Added `CornerRounding.toString()` override.

- Renamed `Cubic` to `CubicBezier` and made it a concrete immutable class.
  - Replaced `Cubic.from()` with the unnamed `CubicBezier()` constructor taking four `Offset` points (`anchor0`, `control0`, `control1`, `anchor1`) and an internal `CubicBezier.raw()` constructor.
  - Replaced `Cubic.empty()` with the public `CubicBezier.point()` constructor taking an `Offset`.
  - Updated `CubicBezier.straightLine()` and `CubicBezier.circularArc()` factory constructors to accept `Offset` parameters instead of raw `double` coordinates.
  - Changed `anchor0`, `control0`, `control1`, and `anchor1` getters to return `Offset`.
  - Made `pointOnCurve()` public, renamed it to `pointAt()`, and added `pointAtX()` and `pointAtY()` methods.
  - Made `zeroLength()` public and replaced it with the `isZeroLength` getter.
  - Made bounds calculation public and split `calculateBounds({bool approximate = false})` into `calculateBounds()` and `calculateApproximateBounds()`.
  - Replaced `reverse()` method with the `reversed` getter.
  - Removed `+`, `*`, and `/` operators as well as `Cubic.interpolate()`.

- Removed `MutableCubic` and `MutablePoint`.
  - Curve interpolation now constructs immutable `CubicBezier` instances directly.

- Renamed `PointTransformer` to `ShapePointTransformer` and removed `TransformResult`.
  - Replaced `RoundedPolygonExtension` matrix transformation methods (`transformedWithMatrix2()`, `transformedWithMatrix3()`, `transformedWithMatrix4()`) with `Matrix2ShapePointTransformer`, `Matrix3ShapePointTransformer`, and `Matrix4ShapePointTransformer` extensions on `Matrix2`, `Matrix3`, and `Matrix4`.
  - Each matrix extension provides an `asPointTransformer()` method returning a `ShapePointTransformer` that can be passed to `transformed()`.

- Renamed `Feature` to `PolygonFeature`.
  - Renamed internal `Edge` and `Corner` subclasses to `EdgeFeature` and `CornerFeature`.
  - Hid the default generative constructor; instances are constructed via `PolygonFeature.ignorable()`, `PolygonFeature.edge()`, `PolygonFeature.convexCorner()`, and `PolygonFeature.concaveCorner()`.
  - Renamed `isIgnorableFeature` getter to `isIgnorable` and added `isCorner` getter.
  - Replaced `reversed()` method with the `reversed` getter.
  - `PolygonFeature.cubics` now returns an unmodifiable `List<CubicBezier>`.

- Refactored `RoundedPolygon` constructors, properties, and methods.
  - Hid the raw generative constructor and made `RoundedPolygon.regular()` the unnamed `RoundedPolygon()` factory constructor with `numVertices` as a positional parameter.
  - Removed `RoundedPolygon.fromPolygon()`.
  - Changed `RoundedPolygon.fromVertices()` to take a positional `List<Offset> vertices` parameter instead of a named `List<double> vertices` coordinate list.
  - Changed `RoundedPolygon.fromFeatures()` to take a positional `List<PolygonFeature> features` parameter instead of a named parameter.
  - Replaced `centerX` and `centerY` parameters across all constructors with a single `Offset center` parameter (or `Offset? center` in `fromVertices()` and `fromFeatures()`).
  - Replaced `centerX` and `centerY` getters with a public `center` getter of type `Offset`.
  - Made `features` and `cubics` unmodifiable lists.
  - Split `calculateBounds({bool approximate = true})` into `calculateBounds()` and `calculateApproximateBounds()`.
  - Removed the `approximate` parameter from `normalized()` and added safe handling for degenerate zero-sized polygons.
  - Moved `toPath()` from `RoundedPolygonExtension` directly onto `RoundedPolygon`, changed `startAngle` from degrees to radians, and removed `rotationPivotX` and `rotationPivotY` parameters.
  - Shortened `RoundedPolygon.toString()` to output feature and cubic counts, and updated `==` and `hashCode` to include `center`.

- Refactored `Morph` API and path generation utilities.
  - Made `start` and `end` properties public on `Morph`.
  - Renamed `Morph.asCubics()` to `Morph.toCubics()` and removed `Morph.forEachCubic()`.
  - Split `Morph.calculateBounds({bool approximate = true})` into `calculateBounds()` and `calculateApproximateBounds()`.
  - Moved `toPath()` from `MorphExtension` directly onto `Morph`, made `progress` a positional parameter, changed `startAngle` from degrees to radians, and replaced `rotationPivotX` and `rotationPivotY` with `Offset rotationPivot = Offset.zero`.
  - Added top-level `pathFromCubics()` function to build a `Path` directly from a `List<CubicBezier>`.

- Updated `MaterialShapes` and shape borders.
  - Added `MaterialShapes.all` containing an unmodifiable list of all 35 predefined Material shapes.
  - Removed internal `MaterialShapes.build*()` and `MaterialShapes.customPolygon()` methods as well as `OffsetAndRounding`.
  - Added `MaterialShapeBorder` (`OutlinedBorder`) with support for morphing between shapes, resuming interrupted transitions, and caching `Morph` instances in an LRU cache.
  - Updated `RoundedPolygonBorder` to cache `Morph` instances in an LRU cache for `lerpFrom()` and `lerpTo()`.
  - Updated `StaticPathBorder.getPath()` to return an empty `Path` when given an empty or non-positive `Rect`.

- Fixed edge cases in polygon measurement and feature mapping.
  - Handled degenerate zero-perimeter polygons in `MeasuredPolygon.measure()` by spacing cubics evenly.
  - Preserved cubics ending a rounding error before the cutting point in `MeasuredPolygon.cutAndShift()`.
  - Updated feature mapping to skip duplicate feature progress values instead of throwing and fall back gracefully when candidate pairs are rejected.

- Added upstream unit test suite and GitHub Actions test workflow.

- Upgraded dependencies.
  - `vector_math` to `^2.4.3`.
  - `deminearchiver_lints` to `^3.1.0`.

## 1.7.0

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

- Updated example to use the `material_3p` package.

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
