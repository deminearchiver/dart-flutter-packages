## 2.0.0

- Bumped minimum SDK versions to Dart 3.11 and Flutter 3.41 stable.
- Ported upstream commits:
  - [`19ad665`](https://github.com/material-foundation/material-color-utilities/commit/19ad665aff08662e949f6759d34d65ba8acc1b83): *"Added CMF Scheme in 2026 spec."*
  - [`4578d0a`](https://github.com/material-foundation/material-color-utilities/commit/4578d0a1d40f1d17f1ca6f34cc9c484bea8f0a9d): *"Refactor DynamicScheme to accept a list of source colors."*
  - [`91da30d`](https://github.com/material-foundation/material-color-utilities/commit/91da30d89e70c3dc9575ec71a1ebe8874d881f29): *"Updated background for on-fixed colors in ColorSpec2026."*
- Made `Hct` immutable to avoid issues with value equality in collections:
  - Removed `hue`, `chroma` and `tone` setters.
  - Added a new `copyWith` method.
- Massively refactored `DynamicScheme` (including deviations from upstream):
  - Removed custom palette key colors support from `DynamicScheme`.
  - Replaced `sourceColorHct` with `sourceColor` of type `TonalPaletteSourceColor`.
  - Renamed `DynamicScheme.fromPalettesOrKeyColors` to `DynamicScheme.withDefaults`.
  - All `DynamicScheme.withDefaults` and `Scheme*` constructor parameters are now optional (`isDark` defaults to `false` as per `md.sys.color` token defaults).
- Added `year` property to `SpecVersion` and implemented `Comparable<SpecVersion>` in order to make spec versions comparable.
- Ported `Cam16.getInt` and `Cam16.getIntInViewingConditions` from Android source code.
- Color generation algorithms from Android:
  - Renamed `android_dynamic_colors` library to `android_color_utilities`.
  - Added `SchemeClock` and `SchemeClockVibrant` to the `android_color_utilities` library.
  - Fixed an upstream issue of `AndroidDynamicColors.clockSecond` and `AndroidDynamicColors.weatherTemp` having a medium contrast of `70`, when it should've been `7`.
- Renamed `TemperatureCache.getComplement` to `TemperatureCache.complement` and made it a getter.
- Added a default `libmonet` library which exports all members from the other libraries.
- Refactored internal file structure (breaks source code imports).
- Other minor changes.

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
