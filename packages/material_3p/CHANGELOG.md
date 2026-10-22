## Unreleased

- Introduced `PullToRefreshProgressIndicator` - the classic, arrow-based indicator for Pull-to-Refresh.
  - Closely follows Compose Material 3 specs, bringing some visual improvements.
  - Determinate active indicator is represented by a circular arrow progress indicator.
  - Indeterminate active indicator is represented by a `CircularProgressIndicator`.
  - More customization will be added in a later update.

- Added `PullToRefreshIndicatorCrossFade` to simplify building custom Pull-to-Refresh indicators.
  - This widget can be used to switch between an indeterminate and a determinate active indicator.
  - It's used internally in `PullToRefreshLoadingIndicator` and `PullToRefreshProgressIndicator`.

## 0.6.0

- Migrated to the official [`material_ui`](https://pub.dev/packages/material_ui) package.
  - Make sure to import `package:material_ui/material_ui.dart` instead of `package:flutter/material.dart` in your code.
  - This package will only support one minor version of the `material_ui` package, because of deep integration with it.

- Moved `MaterialShapes`, `DynamicPathBorder`, `StaticPathBorder`, `RoundedPolygonBorder`, and `MorphBorder` back into `androidx_graphics_shapes`.
  - The `androidx_graphics_shapes` package is now a mirror of the `material_ui` API with minor changes and performance improvements.
  - The `material_shapes` library now exports members from `androidx_graphics_shapes` that are currently unavailable in `material_ui` as of `1.8.0`, such as `CubicBezier`, `PolygonFeature`, `Morph`, etc.

- Renamed `LoadingIndicatorHelper` to `LoadingIndicatorDefaults`.

- Exposed previously private `indeterminateIndicatorPolygons` and `determinateIndicatorPolygons` on `LoadingIndicatorDefaults`.

- Replaced in-place list mutation with LRU caching of morph sequence and morph scale factor in `IndeterminateLoadingIndicator` and `DeterminateLoadingIndicator`.
  - Removed `generateMorphSequence` and `updateMorphSequence` in favor of `buildMorphSequence` in `LoadingIndicatorDefaults`.
  - Renamed `calculateScaleFactor` to `calculateMorphScaleFactorRaw` in `LoadingIndicatorDefaults`.
  - Introduced `LoadingIndicatorDefaults.calculateMorphScaleFactor` to calculate the scale factor of the active indicator, following the specific design spec.
  - Caching is private use only: `LoadingIndicatorDefaults.buildMorphSequence` and `LoadingIndicatorDefaults.calculateMorphScaleFactor` will not utilize caching.

- Major update to the Pull-to-Refresh API surface.
  - Merged `PullToRefreshDelegate` with `PullToRefreshController`.
  - Made `PullToRefreshController` truly abstract, creating a default implementation hierarchy: `PullToRefreshTickerController` and `PullToRefreshSpringController`.
  - Improved custom `ScrollPhysics` to handle more edge cases.

- Introduced exprimental `ProxyShapeBorder` and `ProxyOutlinedBorder` abstract classes.
  - They can be used to easily implement custom proxies over arbitrary consumer-supplied `ShapeBorder`s or `OutlinedBorder`s.

- Upgraded hosted dependencies.
  - `androidx_graphics_shapes` to `^2.0.0`.
  - `libmonet` to `2.0.0-dev.23`.
  - `material_ui` to `>=1.8.0 <1.9.0`.

- Removed `PointerProvider` parameter from quantizers in the `material_color_utilities` library.

- Changed the `material_symbols` library to use `show` instead of `hide` when re-exporting from the `material_symbols_icons` package.

- Refactored internal file structure.

- Minor code quality changes.
  - Refactored classes and extension types to use Dart 3.13 [primary constructors](https://dart.dev/language/primary-constructors) and [concise constructor syntax](https://dart.dev/language/constructors#concise-constructor-syntax).

## 0.5.0

- Moved `package:androidx_graphics_shapes/material_shapes` library implementation into `material_3p`.
  - Re-exports base shape types from `package:androidx_graphics_shapes/androidx_graphics_shapes.dart` instead of the deprecated `shapes.dart`.

- Bumped minimum SDK versions to Dart 3.13 and Flutter 3.47.

- Upgraded hosted dependencies.
  - `material_symbols_icons` to `^4.2960.0`.
  - `meta` to `^1.19.0`.
  - `vector_math` to `^2.4.2`.

## 0.4.1

- Bumped `libmonet` dependency to `2.0.0-dev.19` and relaxed the dependency constraint.

## 0.4.0+1

- Updated examples in README to show breaking changes.

## 0.4.0

- Breaking. Encapsulated `PullToRefreshScrollPhysics`, making them private.
  - Use new `PullToRefreshController.createScrollPhysics()` method to get the proper pull-to-refresh `ScrollPhysics`.

- Added `PullToRefreshDefaultDelegate.defaultSpring`, which contains the default spring value used if a user override was not provided.

- Fixed pull-to-refresh activating early if the user pulls on a viewport which has overscroll on the far edge.
  - Pull-to-refresh should now behave as expected on scroll views with `AlwaysScrollableScrollPhysics` applied.

- Fixed pull-to-refresh `ScrollPhysics` incorrectly handling zero user offsets.
  - Now pull-to-refresh should work with `BouncingScrollPhysics` without any issues.

## 0.3.0

- Removed `material_loading_indicator` library. Replaced by `material` library.
  - This ensures all future widgets, classes and utilities are combined together.

- Added experimental [Pull-to-refresh](https://developer.android.com/develop/ui/compose/components/pull-to-refresh) component implementation *without theming support*.
  - Based on Compose Material 3 pull-to-refresh component.
  - Available in `material` library.
  - Flexible, composable API.

- Skip painting loading indicator fill if color is transparent.

- Updated README with examples.

## 0.2.0

- Added Material Color Utilities.
  - Exported the [`libmonet`](https://pub.dev/packages/libmonet) package.
  - Available in the `material_color_utilities` library.
  - Added custom implementation of image quantizers.

- Added Material 3 Expressive shapes:
  - Exported the [`androidx_graphics_shapes`](https://pub.dev/packages/androidx_graphics_shapes) package.
  - Available in the `material_shapes` library.

- Added Material Symbols:
  - Exported the [`material_symbols_icons`](https://pub.dev/packages/material_symbols_icons) package.
  - Available in the `material_symbols` library.

- Removed dependency on the `meta` package.

- Improved package file structure.

## 0.1.0

- Initial version.

- Added the [Loading indicator](https://m3.material.io/components/loading-indicator/overview) Material 3 Expressive component *without theming support*.
  - Available in the `material_loading_indicator` library.
  - Micro-optimizations applied: uses only a single `Ticker`, etc.
