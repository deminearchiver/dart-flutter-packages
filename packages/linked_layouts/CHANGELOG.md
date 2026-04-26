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
