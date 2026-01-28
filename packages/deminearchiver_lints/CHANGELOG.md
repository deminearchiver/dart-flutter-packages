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
