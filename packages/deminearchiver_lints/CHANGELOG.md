## Unreleased

- Disabled the [`avoid_redundant_argument_values`](https://dart.dev/tools/diagnostics/avoid_redundant_argument_values) lint rule.

## 3.0.0

- Fully decoupled the package from the `very_good_analysis` preset.
  - The package is now standalone and no longer depends on any external packages.
  - Removed `lints`, `flutter_lints` and `very_good_analysis` dependencies.

- Introduced a redesigned, modular preset structure based on additive composition.
  - Removed legacy composition-based presets.
  - Removed deprecated analysis presets.

- Updated and tightened linter rules.
  - The package better adheres to the code style and conventions of repositories maintained by [@deminearchiver](https://github.com/deminearchiver).
  - Since the package is mostly used internally, no changes will be listed here.

- Enhanced analyzer and formatter configurations.
  - This change should have no effect on most projects.

- Stopped ignoring own `analysis_options.yaml` configuration.
  - The path has been removed from `.gitignore` and `.pubignore`.
  - `.gitignore` file has been normalized with other packages in the monorepo.

## 2.1.2

- Disabled the [`avoid_private_typedef_functions`](https://dart.dev/lints/avoid_private_typedef_functions) linter rule.

## 2.1.1

- Disabled the [`missing_whitespace_between_adjacent_strings`](https://dart.dev/lints/missing_whitespace_between_adjacent_strings) linter rule.
- Disabled the [`avoid_setters_without_getters`](https://dart.dev/lints/avoid_setters_without_getters) linter rule.

## 2.1.0

- Disabled linter rules related to sorting in order to facilitate manual grouping and sorting by the user.
- Disabled linter rules related to throwing and catching errors.
- Disabled the [`avoid_multiple_declarations_per_line`](https://dart.dev/lints/avoid_multiple_declarations_per_line) linter rule.
- Disabled the [`unnecessary_raw_strings`](https://dart.dev/diagnostics/unnecessary_raw_strings) linter rule.
- Disabled the [`unnecessary_library_directive`](https://dart.dev/lints/unnecessary_library_directive) linter rule.

## 2.0.2

- Disabled the [`lines_longer_than_80_chars`](https://dart.dev/lints/lines_longer_than_80_chars) lint rule in the `app` preset because it is meant to be more relaxed than `package_loose`.

## 2.0.1

- Disabled the [`prefer_constructors_over_static_methods`](https://dart.dev/lints/prefer_constructors_over_static_methods) lint rule, as it conflicts with static `lerp` methods usually found in theme classes.
- Disabled the [`omit_local_variable_types`](https://dart.dev/lints/omit_local_variable_types) lint rule, as it can mess with dot shorthands sometimes.
- Disabled the [avoid_catching_errors](https://dart.dev/lints/avoid_catching_errors) lint rule because Flutter's `Error` type doesn't inherit from `Exception`.

## 2.0.0

- Introduced a new composition-based system for applying linter presets.
- Unified Dart and Flutter lints into a single configuration.
- Added an empty Dart library with documentation comments.
- Expanded the README to provide more information for third-party users of the package.
- Specified relevant topics in `pubspec.yaml` for easier discovery.

## 1.1.1

- Updated package metadata.

## 1.1.0

- Added new `base_dart`, `base_flutter`, `strict_dart` and `strict_flutter` rules.

  It's recommended for new packages to depend on `dart` or `flutter` still.

## 1.0.0

- Initial version.
