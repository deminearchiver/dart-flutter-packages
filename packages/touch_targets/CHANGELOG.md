## 0.2.1

- Updated example app.

- Made internal changes to pass static analysis.

## 0.2.0

- Fixed unrelated elements losing their hit tests to touch targets. `TouchGroup` now performs a dry hit test to determine whether the topmost hit object is lineally related to the touch target (ancestor or descendant).

- Added `bool TouchClient.isRelatedTo(RenderObject hit)` to check whether the `RenderObject` which gets hit shares lineage with the touch target.

- Removed unnecessary `markNeedsPaint()` calls in `TouchGroup`'s render object.

- Minor internal changes.

## 0.1.0

- Initial version.
