## 1.2.0

- Inlined more utility functions.
- Removed `MathUtils.signum` in favor of `num.sign`.
- Addressed linter feedback.
- Code style updates.
- Upgraded dependencies.

## 1.1.2

- Made sure Flutter-specific directories get ignored when publishing the package.

## 1.1.1

- Deprecated `MathUtils.signum` in favor of `num.sign`.

## 1.1.0

- Added caching to `MaterialDynamicColors` which prevents the class from being const-constructable.
- Removed redundant libraries which were partials of `material_color_utilities`.
- Publicly exposed `ColorSpec2021` and `ColorSpec2025` classes.
- Introduced a new library `android_dynamic_colors` which contains a `AndroidDynamicColors` class which is a port of [`com.android.systemui.monet.CustomDynamicColors`](https://cs.android.com/android/_/android/platform/frameworks/libs/systemui/+/ca0ae237ed2d67f5b05f2572ddbcc6e10b550b92:monet/src/com/android/systemui/monet/CustomDynamicColors.java).
- Fixed incorrect Dart class delegation by replacing it with plain inheritance in `ColorSpec2025`.
- Refactored the library internally to improve code style and readability.
- Updated `analysis_options.yaml` to ensure correct lint rules are being used during development.
- Updated `.gitignore` to match other workspace packages.

## 1.0.0

- Initial version.
