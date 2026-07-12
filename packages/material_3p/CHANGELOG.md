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
