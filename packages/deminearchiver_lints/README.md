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
  - [Composition over inheritance](#composition-over-inheritance)
  - [Always include the base preset first](#always-include-the-base-preset-first)
- [Additional information](#additional-information)
  - [Composite presets table](#composite-presets-table)
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

### Composition over inheritance

This package is built on the principle of using composition over inheritance:

```yaml
include:
  - package:deminearchiver_lints/a.yaml
  - package:deminearchiver_lints/b.yaml
  - package:deminearchiver_lints/c.yaml
```

### Always include the base preset first

The intended way to use the provided presets is to include the base preset first, as following:

```yaml
include:
  - package:deminearchiver_lints/base.yaml
  # Further overlays must be added after the base.
```

<!-- This section is WIP -->

<!--
### Separate lints for Dart-only and Flutter projects

Flutter-specific lints are commonly ...?????......????
-->

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

### Composite presets table

The table below presents information about the composite presets included in this package.

For brevity, the package name (`package:deminearchiver_lints/`) and the file extension (`.yaml`) have been omitted from preset names. So, given a preset name `{preset}`, the full path for inclusion in `analysis_options.yaml` would be `package:deminearchiver_lints/{preset}.yaml`.

While possible, it's not recommended to mix together presets marked as incompatible.

#### Base layer

| Name | Incompatibilities | Description |
| - | - | - |
| [`base`](#) | None. | The base for all other presets to be overlayed onto. |

#### Public APIs layer

| Name | Incompatibilities | Description |
| - | - | - |
| [`app`](#) | `package`, `package_loose`. | Relaxes all the requirements which are enabled by the `package` preset, as they mostly don't matter when building Flutter apps that don't have a public API surface, unlike packages. |
| [`package_loose`](#) | `app`, `package`. | Same as `package`, but relaxes the requirement of having to document every public API member. |
| [`package`](#) | `app`, `package_loose`. | The strictest of the three, requiring to both annotate with types and document public API members. |

## Acknowledgements

- [`very_good_analysis`](https://pub.dev/packages/very_good_analysis) package for being the solid foundation for linting production-ready Dart & Flutter projects.

- [`lintervention`](https://pub.dev/packages/lintervention) package for inspiring the separation of linter rules for package and app projects.
