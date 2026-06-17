## 0.4.0

- Fixed hit test result from `TouchGroup` not being populated properly, preventing gestures from reaching arenas such as in a scroll views.

- Fixed potential issues with legacy wrap hit testing.

- Removed `TouchClient.hasLinealRelationWith()` and replaced it with `TouchClient.hasOwn()`, `TouchClient.hasDescendant()`, `TouchClient.hasAncestor()`.

## 0.3.1

- Added `operator==` and `hashCode` overrides to the `TouchClient` implementation of `SizedTouchTarget` and `PaddedTouchTarget`.

## 0.3.0

- Performed element renames:
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
