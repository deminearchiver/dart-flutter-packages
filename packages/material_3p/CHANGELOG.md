## Unreleased

- Upgraded hosted dependencies.
  - `libmonet` to `^2.0.0-dev.20`.

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
