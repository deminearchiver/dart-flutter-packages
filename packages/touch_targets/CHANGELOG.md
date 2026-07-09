## 0.5.0

- Removed `TouchTargetFit` from default touch targets.
  - Overflow touch targets are now the only option.

- Removed `TouchClient.getRectIn()`.
  - Partially replaced by a new `TouchClient.containsIn()` method.

- Added `TouchClient.dryHitTestFrom()` and integrated with `TouchGroup`.
  - This prevents touch targets from intercepting events despite having an active `IgnorePointer` or `AbsorbPointer` ancestor.

- Optimized `TouchClient` weighted scoring in `TouchGroup`.
  - This helps avoid unnecessary dry hit testing

- Fixed default touch targets preventing hit tests from reaching the child when disabled.

- Internal code style and quality improvements.

## 0.4.0

- Fixed hit test result from `TouchGroup` not being populated properly, preventing gestures from reaching arenas such as in a scroll views.

- Fixed potential issues with legacy wrap hit testing.

- Removed `TouchClient.hasLinealRelationWith()` and replaced it with `TouchClient.hasOwn()`, `TouchClient.hasDescendant()`, `TouchClient.hasAncestor()`.

## 0.3.1

- Added `operator==` and `hashCode` overrides to the `TouchClient` implementation of `SizedTouchTarget` and `PaddedTouchTarget`.

## 0.3.0

- Renamed the following elements:
  - `TouchClient.childSize` → `TouchClient.innerSize`;
  - `TouchClient.hitTestFrom()` → `TouchClient.hitTestInnerFrom()`;
  - `TouchTargetBehavior` → `TouchTargetFit` (`behavior` → `fit`).

- Refactored `RenderTouchTargetMixin` into three mixins: base `TouchClientRenderObjectBaseMixin`, optional `TouchClientRenderObjectOptionalMixin` and required `TouchClientRenderObjectRequiredMixin`.

- Added documentation comments to some elements.

- Minor internal changes.

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
