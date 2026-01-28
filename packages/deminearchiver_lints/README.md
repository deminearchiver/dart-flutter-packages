# deminearchiver lints

Opinionated lints for Dart and Flutter projects.

Used in projects created or maintained by [**@deminearchiver**](https://github.com/deminearchiver).

<details>
  <summary>
    <h3>Table of contents</h3>
  </summary>

- [Getting started](#getting-started)
  - [Installation](#installation)
- [Usage](#usage)
  - [Separate lints for Dart-only and Flutter projects](#separate-lints-for-dart-only-and-flutter-projects)
- [Additional information](#additional-information)
  - [Composite presets information](#composite-presets-information)
- [Acknowledgements](#acknowledgements)

</details>



## Getting started

### Installation

This package must only ever be added as a [**dev dependency**](https://dart.dev/tools/pub/dependencies#dev-dependencies) to the consuming package.

#### Manually

You can manually specify the dependency in `pubspec.yaml`.

```yaml
dev_dependencies:
  deminearchiver_lints: ^2.0.0
```

#### In Dart projects

For Dart-only projects, prefer using `dart pub`.

```sh
dart pub add dev:deminearchiver_lints
```

#### In Flutter projects

For Flutter projects, prefer using `flutter pub`.

```sh
flutter pub add dev:deminearchiver_lints
```

## Usage

This package is built on the principle of using composition over inheritance:

```yaml
include:
  - package:deminearchiver_lints/a.yaml
  - package:deminearchiver_lints/b.yaml
  - package:deminearchiver_lints/c.yaml
```

### Separate lints for Dart-only and Flutter projects

<!-- This section is WIP -->

<!-- Flutter-specific lints are commonly ...?????.... -->

<!--
The lints enable strict typing by default.
Since projects may want to gradually migrate to strict types by enabling each of: `strict-casts`, `strict-inference`, `strict-raw-types` - one by one, it's recommended to manually disable them.

```yaml
# In a project that uses a lot of `dynamic`
analyzer:
  language:
    strict-casts: false
    strict-inference: false
    strict-raw-types: false
```
-->

## Additional information

### Composite presets information

The table below presents information about the composite presets included in this package.

For brevity, the package name (`package:deminearchiver_lints/`) and the file extension (`.yaml`) have been omitted from preset names. So, given a preset name `{preset}`, the full path for inclusion in `analysis_options.yaml` would be `package:deminearchiver_lints/{preset}.yaml`.

While possible, it's not recommended to mix together presets marked as incompatible.

| Name | Incompatibilities | Description |
| - | - | - |
| [`base`](#) | | |
| [`package`](#) | `app` | |
| [`app`](#) | `package` | Relaxes certain rules which mostly don't matter when building Flutter apps that don't have a public API surface, unlike packages. |

## Acknowledgements

- [`lintervention`](https://pub.dev/packages/lintervention) package for inspiring the creating of separate linter rules for package and app projects.
