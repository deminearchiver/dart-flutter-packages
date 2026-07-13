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
