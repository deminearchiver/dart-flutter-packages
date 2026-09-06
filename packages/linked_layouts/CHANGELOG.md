## 0.6.1

- Replaced the classic LCA in transform helpers with a `RenderObject.depth`-based implementation.
  - In most cases, makes the algorithm complete earlier by preventing unnecessary ancestors traversal.
  - Less resilient due to utilizing `RenderObject.depth`, but it should remain stable without other external interferences.

- Fixed `RenderSliver` (`SliverLogicalParentData`) transforms not being applied in release mode.

- Replaced equality `==` with identity `identical()` checks in transform helpers.
  - This aligns the library with standard Flutter framework practices regarding in-tree render object comparisons.

- Fixed matrices multiplication order in transform helpers.

- Cleaned up the `RenderObjectTransformHelper` internal utility class.
  - Removed the now-unused `tryFindAncestorsOf()` method.

## 0.6.0

This release contains a major refactor of the "layout clients" API surface. This is the biggest breaking change in this release.

- Renamed `LayoutLinkClient` to `LayoutClient`.

- Made layout clients self-contained.
  - Removed `LayoutClient.renderObject` property.
  - Removed the `RenderObjectType` type argument from all respective members of the library, so members like `LayoutClient`, `LayoutLeaderClient`, `LayoutFollowerClient`, `LayoutLink`, etc. don't need their render object type specified.
  - Added several new methods and getters that custom layout clients must implement, such as: `attached`, `depth`, `markNeedsLayout`, `tryGetSize`, `tryGetTransformIn`, etc., allowing for complete customization potential.

- Changed layout client types from mixins to pure interfaces.
  - Composition can no longer be achieved via the `with` keyword. Use `implements` instead.
  - This change applies to `LayoutClient`, `LayoutLeaderClient`, `SlottedLayoutLeaderClient` and `LayoutFollowerClient`.

- `DefaultLayoutLeaderClient`, `DefaultSlottedLayoutLeaderClient`, `DefaultLayoutFollowerClient` are now const-constructable.
  - Const-construction will rarely be used typically, but this change means that default layout clients are now fully immutable, allowing to cache them.
  - Added default const factory constructors to `LayoutLeaderClient`, `SlottedLayoutLeaderClient` and `LayoutFollowerClient`, which redirect to the default implementations respectively.

The following breaking changes were introduced in continuation of the layout clients refactor.

- `LayoutLink.getTransformIn`, `LayoutLink.getOffsetIn` and `LayoutLeaderClient.scale` deprecated elements have been removed.
  - Please use `LayoutLeaderClient.tryGetTransformIn()` or `LayoutLeaderClient.tryGetPositionIn()` instead.

- Removed `RenderObjectWithLayoutLinkBaseMixin`, `RenderObjectWithOptionalLayoutLinkMixin`, `RenderObjectWithRequiredLayoutLinkMixin`, `RenderLayoutLeaderMixin`, `RenderLayoutFollowerMixin`.
  - These APIs were removed due to them enforcing a strict property structure in consumer code.
  - A more manual (but flexible) approach should be preferred by applying the newly introduced `LayoutLeaderRenderObjectMixin` and `LayoutFollowerRenderObjectMixin`.

- Removed `AbstractLayoutLeaderClientFactory`, `AbstractLayoutLeader`, `RenderAbstractLayoutLeader`, `CustomLayoutLeader` building blocks in favor of the new, manual system.
  - It's preferred to use `SingleLayoutLeader` and `SlottedLayoutLeader` in most layout leader usecases.
  - When a custom leader is absolutely needed, apply the newly introduced `LayoutLeaderRenderObjectMixin` to a `RenderBox` subclass.

This update also contains the following minor changes.

- Made the `layoutLink` parameter in `SingleLayoutLeader` and `SlottedLayoutLeader` nullable.
  - Now it's possible to conditionally register a layout leader without the need of creating a custom render object.

- Made `FrameCallbackScheduler.callback` property private.
  - It was never supposed to be public.
  - This property can no longer be accesssed inside consumer code.

- Bumped minimum SDK versions to Dart 3.12 and Flutter 3.44.

- Refactored internal file structure.

## 0.5.4

- Improved fallback `RenderBox` size algorithm.
  - The resolver will attempt to access `constraints` and call `getDryLayout()` if other methods fail.
  - When `constraints.isTight` returns true, `getDryLayout()` will not be called, resulting in returning `constraints.biggest` early.
  - This still doesn't guarantee a size will be resolved.

- Actually fixed `RenderFractionalTranslation` paint transform not being applied even in the fallback callback.
  - This change introduces a manual static type check to handle `RenderFractionalTranslation` specifically, simulating its `applyPaintTransform()` call.
  - Custom fallback registry will be introduced in the future.
  - Please mind that the system currently fails to update the transform properly if an inactive `RenderFractionalTranslation` (e.g. in an inactive route) get resized - the size will not be updated, meaning the transform will remain the same until the render object becomes active again.

## 0.5.3

- Fixed fallback paint transform failing to apply because of method renames (stupid mistake).
  - Complex usecases, such as `FractionTranslation` (`RenderFractionalTranslation`) between leader and follower (e.g. in page routes), should now work properly again.
  - Please mind that fallback paint transform was never able to account for all usecases, such as using a `Transform` (`RenderTransform`) widget with alignment applied, or any other render objects that attempt to access `RenderBox.size` in `RenderObject.applyPaintTransform()` without modifying `RenderObject.parentData` of their child (children). This issue is unlikely to be solved in the near future.

## 0.5.2

- Added `LayoutLeaderClient.tryGetTransformIn()` and `LayoutLeaderClient.tryGetPositionIn()`.
  - `LayoutLink.getTransformIn()` and `LayoutLink.getOffsetIn()` have been deprecated in favor of the new methods on `LayoutLeaderClient`. They will be removed in the `0.6.0` minor pre-release.

- Deprecated `LayoutLeaderClient.scale` getter in favor of `LayoutLeaderClient.tryGetTransformIn()` method.
  - Reverted `LayoutLeaderClient.scale` to use the old `RenderView` boundary logic, restoring behaviors broken in `0.5.1`.
  - The deprecated getter uses incorrect logic: attempts to get the leader's scale in global coordinate space.
  - Migrating to `LayoutLeaderClient.tryGetTransformIn()` is highly advised, because the replacement returns a full transform from the leader to the specified render object (e.g. follower), avoiding hacky workarounds (i.e. `RenderView` boundaries).
  - `LayoutLeaderClient.scale` will be removed in the `0.6.0` minor pre-release.

- Fixed `LayoutLeaderClient.size` setter logic to handle detached render objects properly.

- Improved internal file structure.

## 0.5.1

- Added `onClientDidLayout()` method to `LeaderLayoutLinkHandle`.
  - Captures leader size and transform immediately upon completing layout.

- Optimized `LayoutLink.getOffsetIn` matrix calculations and tree traversals.
  - Implemented Lowest Common Ancestor (LCA) algorithm to find common parent nodes.
  - Added fast-paths for parent-child layout relationships.
  - Prunes upper-tree nodes above the LCA and avoids unnecessary matrix operations.

- Optimized leader transform tracking and validation performance.
  - Refactored leader validation logic into single-leader checks.
  - Removed redundant computation overhead when verifying layout state across multi-leader setups.

- Improved assertion efficiency in `SlottedMultiLeaderLayoutLink.leaderForSlot`.

- Improved re-scheduling logic in `FrameCallbackScheduler`.

- Improved changelog formatting.

## 0.5.0

- Fixed internal update order of `RenderObjectWithOptionalLayoutLinkMixin.layoutLink`, `RenderObjectWithRequiredLayoutLinkMixin.layoutLink`, `RenderSlottedLayoutLeader.slot`.

- Exposed public API `LeaderLayoutLinkHandle` to enforce encapsulation of `didLeaderDoPaint` and `didLeaderDoLayout` of `LayoutLink`. Access to those methods is now provided via `LeaderLayoutLinkHandle` instance methods.

- Exposed public API `FollowerLayoutLinkHandle` to encapsulate follower redepthing logic. Added a `tryRedepthClient` method.

- Introduced a shared `RenderObjectWithLayoutLinkBaseMixin` interface to make `RenderObjectWithRequiredLayoutLinkMixin` independant of `RenderObjectWithOptionalLayoutLinkMixin`.

- Declared `LayoutLinkHandle` `final`, and `LayoutLink` - `base` to prevent incorrect implementations.

- Added more documentation comments.

- Improved internal file structure.

## 0.4.0+1

- Added a proper package description to `pubspec.yaml`.

- Added placeholder package example.

## 0.4.0

- Extracted client registration logic from `RenderLayout*Mixin` into `RenderObjectWith*LinkMixin`s.

- Added `RenderObjectWithOptionalLayoutLinkMixin` and renamed `RenderObjectWithLayoutLinkMixin` to `RenderObjectWithRequiredLayoutLinkMixin`.

- Added optional named `schedulerBinding` parameter to `FrameCallbackScheduler` for mocking purposes.

- Organized source file structure.

## 0.3.0

- Fixed `RenderObject` mutation error when attempting to schedule layout run during `SchedulerPhase.persistentCallbacks`.

- Optimized leader transforms and size checking.

- Added more user-friendly error messages across the library.

- Added registered leaders validation to `LayoutLink`.

- Internal code cleanup and refactoring.

## 0.2.0

- Fixed leader size not persisting across reattachments.

- Introduced `RenderObjectWithLayoutLinkMixin.createLayoutClientInternal` method to handle internal state. Implementers are expected to replace `createLayoutClient` with the new method.

- Refactored `LayoutLeader` into `AbstractLayoutLeader` and introduced `SingleLayoutLeader` and `CustomLayoutLeader` as replacements.

- Renamed `LayoutLink.leaderOffsetIn` to `LayoutLink.getOffsetIn` and made the method static.

- Fixed `LayoutLeaderClient.scale` wasn't DPI-aware. Now it looks for the nearest `RenderView` ancestor.

- Fixed `LayoutLink` transient frame callback was empty by mistake.

- Removed unnecessary assertions in `LayoutLinkHandle`.

## 0.1.0

- Initial version.
