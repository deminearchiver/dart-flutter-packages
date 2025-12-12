<h1>AndroidX Graphics Shapes</h1>

A library for easy creation, transformation, and morphing of rounded polygonal shapes.
Contains predefined Material Design shapes that can be used at various components.

A Flutter port of the [`androidx.graphics.shapes`](https://developer.android.com/reference/kotlin/androidx/graphics/shapes/package-summary) library and the [`androidx.compose.material3.MaterialShapes`](https://developer.android.com/reference/kotlin/androidx/compose/material3/MaterialShapes) object.

<details>
  <summary>
    <h3>Table of contents</h3>
  </summary>

- [Features](#features)
- [Getting started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Install the package](#install-the-package)
  - [Import the library](#import-the-library)
- [Comparisons](#comparisons)
  - [Unpublished packages](#unpublished-packages)
  - [Published packages](#published-packages)
  - [This package](#this-package)

</details>

## Features

Use this package in your Flutter app to:

- Create **rounded polygonal** shapes.

- **Morph** between rounded polygonal shapes.

- Display shapes from the [**M3 Shape library**](https://m3.material.io/styles/shape/overview-principles#579dd4ba-39f3-4e60-bd9b-1d97ed6ef1bf).

- Port Kotlin code which uses [`androidx.graphics.shapes`](https://developer.android.com/reference/kotlin/androidx/graphics/shapes/package-summary) or [`androidx.compose.material3.MaterialShapes`](https://developer.android.com/reference/kotlin/androidx/compose/material3/MaterialShapes) to Dart.

## Getting started

### Prerequisites

This is a **Flutter-only** package.
It requires the **Flutter SDK** to be installed.
It doesn't work in a **Dart-only** environment.

### Install the package

Add the package to a Flutter project:

```sh
flutter pub add androidx_graphics_shapes
```

### Import the library

There are two options for importing the library,
depending on whether you want to use M3 Shapes or not.

Shape manipulation is the base functionality of this package.

#### Only for shape manipulation

```dart
import 'package:androidx_graphics_shapes/shapes.dart`;
```

#### Both for using M3 Shapes and shape manipulation

```dart
import 'package:androidx_graphics_shapes/material_shapes.dart`;
```

<!-- ## Usage -->

<!-- ## Additional information -->

## Comparisons

> This section will be updated once in a while,
> as it's hard to properly collect and compile the features of all packages.

### Unpublished packages

The following packages can only be used as a [Git dependency](https://dart.dev/tools/pub/dependencies#git-packages):

- **m3_expressive_shapes** by [kekland](https://github.com/kekland):

  - **Source code on GitHub**:\
    [`kekland/m3_expressive_shapes`](https://github.com/kekland/m3_expressive_shapes)

  - **Stability**:\
    As stated by the author *"currently I'm only using it internally for my own projects"*.

- **androidx_graphics_shapes** & **m3_expressive_shapes** by [benthillerkus](https://github.com/benthillerkus):

  - **Source code on GitHub**:\
    [`benthillerkus/m3_expressive_shapes`](https://github.com/benthillerkus/m3_expressive_shapes)

### Published packages

The following packages are hosted on Pub and can be added to a project using `flutter pub add`:

- **material_new_shapes** by [ulims](https://github.com/ulims):

  - **Hosted on Pub**:\
    [`material_new_shapes`](https://pub.dev/packages/material_new_shapes)

  - **Source code on GitHub**:\
    [`ulims/material_shapes`](https://github.com/ulims/material_shapes)

- **material_shapes** by [Chitranshu-Nagdawane](https://github.com/Chitranshu-Nagdawane):

  - **Hosted on Pub**:\
    [`material_shapes`](https://pub.dev/packages/material_shapes)

  - **Source code on GitHub**:\
    [`Chitranshu-Nagdawane/material_shapes`](https://github.com/Chitranshu-Nagdawane/material_shapes)

- **flutter_m3shapes**:

  - **Red flags**:

    - Does not implement most of the functionality.

  - More info will be added later.

- **flutter_m3shapes_extended**:

  - **Red flags**:

    - Fork of `flutter_m3shapes`.

    - Does not implement most of the functionality.

  - More info will be added later.

### This package

- **androidx_graphics_shapes** by [deminearchiver](https://github.com/deminearchiver):

  - **Hosted on Pub**:\
    [`androidx_graphics_shapes`](https://pub.dev/packages/androidx_graphics_shapes)

  - **Source code on GitHub**:\
    [`deminearchiver/dart-flutter-packages`](https://github.com/deminearchiver/dart-flutter-packages/tree/main/packages/androidx_graphics_shapess)

  - **Parity**:\
    Fully matches the native library in behavior.
    Contains modifications to original APIs that make the library more idiomatic and optimal to Dart.
    There is some extended functionality, such as the `startAngle` parameter being a `double`.
