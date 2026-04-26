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
