## 0.4.1

- Added WOFF2 support via the `woff2_ffi` package.
  - WOFF2 fonts are automatically decompressed before subsetting.
  - Font format (TTF / WOFF2) is preserved after subsetting.
  - You can use the `SubsetBuilder.forceSubset` property to override the output format.

- Added `SubsetBuilder.forceSubset` flag.
  - Defaults to `false`. Setting to `true` will enforce a subset even if it would be unnecessary.

- Updated `SubsetEntry` to support new `SubsetBuilder` parameters: `forceSubset` and `subsetFormat`.

- Added extension methods `SubsetBuilder.buildWithId()` and `BindingsBuilder.buildWithId()`.
  - They simplify creating `SubsetResultWithId` or `BindingsResultWithId` directly, without unnecessary intermediate `SubsetResult` or `BindingsResult`.

- Added utility `SubsetIdToResultMap<IdType>` and `BindingsIdToResultMap<IdType>` type aliases.
  - They can help when building from multiple font sources with different ID classes.

- Improved internal source file structure.

- Updated `.gitignore` to use the standard template.

- Clarified `uniXXXX` icon names filtration in the `0.4.0` changelog.

## 0.4.0+1

- Fixed grammar mistakes in the `0.4.0` changelog.

## 0.4.0

- Moved the main APIs away from being ID-aware.
  - Removed `generateFontSubsets` and `generateIconBindings` utility functions.
  - Removed automatic font loading functionality for maximum flexibility.
  - The low-level APIs are now fully synchronous, because they don't perform I/O operations anymore.
  - Renamed `FontSubsetBuilder` to `SubsetBuilder`, `IconBindingsBuilder` to `BindingsBuilder` and marked them as `@immutable`.
  - Renamed `SubsetAxisConstraint` to `VariableAxisConstraint`.
  - Removed type parameters from all low-level classes (`SubsetBuilder` and `SubsetResult` no longer accept an ID type parameter).

- Added mid-level utility functions to serve as replacements for the removed ID-based generator APIs.
  - `buildSubsets` and `buildIcons` build ID-mapped subsets and icons respectively, fully synchronously.
  - `SubsetEntry` (replacement for `SubsetOutput`) and `BindingsEntry` provide configuration for the build methods.
  - `SubsetResultWithId<IdType>` and `BindingsResultWithId<IdType>` represent the results of the build methods.
  - `writeSubsets` and `writeBindings` are small utility functions that help write the generated font subset bytes and icon bindings code to the file system. `WriteEntry<T>` serves as the main primitive for these functions.

- Added a new type to store predefined tags: `VariableAxisTag`.
  - This extension type is erased at runtime, meaning casts from `String` are safe for custom axis tags.
  - This class contains extensive metadata about each axis tag defined in the Google Fonts Axis Registry.
  - Added a Python script to generate the data automatically from the latest Google Fonts Axis Registry data.

- Removed the `tag` property from `VariableAxisConstraint`.
  - Constraints are now defined by a new type: `VariableAxisConstraints`, which is a `Map<VariableAxisTag, VariableAxisConstraint>` - prevents duplicate constraint issues.

- Migrated result models (i.e. `SubsetResult`, `BindingsResult`, etc.) away from Freezed data classes because they may store large amounts of data now (`Uint8List`, etc.).

- Icon names matching the following regular expression are now filtered out: `^u(ni)?[0-9a-fA-F]{4,}$`.

- Reviewed and fixed icon identifier sanitization logic.
  - Aligned the reserved keyword list with the Dart language specification.
  - The surrounding class name is now considered a reserved identifier.

- Enabled JSON serialization functionality for `VariableAxisConstraint` (deserialized based on the `type` field) and `IconGlyph`.

- Fixed `build_runner` builds failing if the `example` directory had generated icon bindings files which didn't belong to the package.

- Heavily improved internal file structure.

- Updated examples and README.

## 0.3.0

- Migrated away from discontinued `harfbuzz` dependency to `harfbuzz_ffi`, which has fully replaced the former package.
  - Removed discontinued `harfbuzz` dependency.
  - Bumped `harfbuzz_ffi` dependency to `^0.4.0`.

## 0.2.0

- The generator will now add `fontFamily` and `fontPackage` static constants to generated classes.
  - This information can be used when creating dynamic `IconData` instances at runtime.

- The generator will now add documentation comments to most of the generated declarations.

- The generator will now sanitize generated icon identifiers which match identifiers of other generated declarations (e.g. `fontFamily`, `fontPackage`, `forceCompileTimeTreeShaking`).
  - This should not affect most icon fonts.

- Disabled formatting in generated source code files.
  - This should reduce line count and improve clarity.

- Updated usage examples.

- Updated package README.

- Removed `code_builder` dependency due to unnecessary complexity.
  - Icon bindings generator now uses raw strings.

- Bumped `meta` dependency to `^0.18.0`.
  - Aligned with latest stable SDK pinned dependency constraint.

## 0.1.0

- Initial version.

- Added basic usage example.

- Cleaned up dependencies.
