import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

class _LeaderLayout {
  _LeaderLayout({this.size, this.transform});

  Size? size;

  Matrix4? transform;

  @override
  String toString() => "_LeaderLayout(size: $size, transform: $transform)";
}

abstract base class LayoutLink<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
> {
  final Set<LeaderClientType> _leaders = HashSet();

  @protected
  Iterable<LeaderClientType> get leadersInternal;

  Iterable<LeaderClientType> get leaders {
    final leaders = leadersInternal;
    assert(debugAssertLeadersAreValid(leaders));
    return leaders;
  }

  @internal
  bool debugAssertLeadersAreValid(Iterable<LeaderClientType> leaders) {
    assert(() {
      final encounteredLeaders = <LeaderClientType>{};
      for (final leader in leaders) {
        if (encounteredLeaders.contains(leader)) {
          throw FlutterError(
            "$runtimeType contains duplicate leaders.\n"
            "Leader $leader was encountered more than once.",
          );
        }
        if (!_leaders.contains(leader)) {
          throw FlutterError(
            "$runtimeType contains foreign leaders.\n"
            "Leader $leader was not properly registered.",
          );
        }
        encounteredLeaders.add(leader);
      }
      if (encounteredLeaders.length != _leaders.length) {
        final missingLeaders = _leaders.difference(encounteredLeaders);
        throw FlutterError(
          "$runtimeType is missing ${missingLeaders.length} registered leaders.\n"
          "Leader ${missingLeaders.first} is registered, but not found in $runtimeType.",
        );
      }
      return true;
    }());
    return true;
  }

  @protected
  bool isLeaderRegistered(LeaderClientType leader) {
    assert(debugAssertLeadersAreValid(leadersInternal));
    return _leaders.contains(leader);
  }

  @protected
  void registerLeaderInternal(LeaderClientType leader);

  @protected
  void unregisterLeaderInternal(LeaderClientType leader);

  LeaderLayoutLinkHandle<LeaderClientType, FollowerClientType> registerLeader(
    LeaderClientType leader,
  ) {
    // Leaders must be in a valid state.
    assert(debugAssertLeadersAreValid(leadersInternal));

    // User-friendly error message if the leader was already registered.
    assert(() {
      if (isLeaderRegistered(leader)) {
        throw FlutterError(
          "Attempted to register an already registered leader.\n"
          "Leader $leader was registered previously.",
        );
      }
      return true;
    }());

    // Register the leader.
    registerLeaderInternal(leader);
    _leaders.add(leader);

    // Leaders must be in a valid state.
    assert(debugAssertLeadersAreValid(leadersInternal));

    // Schedule followers layout.
    _onLeaderCountChanged();

    // Return a finalizer handle.
    return LeaderLayoutLinkHandle._(link: this, leader: leader);
  }

  void _unregisterLeader(LeaderClientType leader) {
    // Leaders must be in a valid state.
    assert(debugAssertLeadersAreValid(leadersInternal));

    // User-friendly error message if the leader was already registered.
    assert(() {
      if (!isLeaderRegistered(leader)) {
        throw FlutterError(
          "Attempted to unregister a leader which was not registered.\n"
          "Leader $leader wasn't registered.",
        );
      }
      return true;
    }());

    // Unregister the leader.
    unregisterLeaderInternal(leader);
    _leaders.remove(leader);
    _lastLeaderLayouts.remove(leader);

    // Leaders must be in a valid state.
    assert(debugAssertLeadersAreValid(leadersInternal));

    // Schedule followers layout.
    _onLeaderCountChanged();
  }

  final Set<FollowerClientType> _followers = HashSet();

  FollowerLayoutLinkHandle<LeaderClientType, FollowerClientType>
  registerFollower(FollowerClientType follower) {
    // User-friendly error message if the follower was already registered.
    assert(() {
      if (_followers.contains(follower)) {
        throw FlutterError(
          "Attempted to register an already registered follower.\n"
          "Follower $follower was registered previously.",
        );
      }
      return true;
    }());

    // Remember empty state.
    final wasEmpty = _followers.isEmpty;

    // Register the follower.
    _followers.add(follower);

    // Schedule a callback if this is the first follower.
    if (wasEmpty) _frameCallbackScheduler.schedule();

    // TODO: should a layout update be forced here?

    // Return a finalizer handle.
    return FollowerLayoutLinkHandle._(link: this, follower: follower);
  }

  void _unregisterFollower(FollowerClientType follower) {
    // User-friendly error message if a leader was already registered.
    assert(() {
      if (!_followers.contains(follower)) {
        throw FlutterError(
          "Attempted to unregister a follower which was not registered.\n"
          "Follower $follower wasn't registered.",
        );
      }
      return true;
    }());

    // Unregister the follower.
    _followers.remove(follower);

    // Cancel the callback if there are no more followers left.
    if (_followers.isEmpty) _frameCallbackScheduler.cancel();

    // TODO: should a layout update be forced here?
  }

  late final _frameCallbackScheduler = FrameCallbackScheduler(_frameCallback);
  var _isSchedulingPostFrameLayout = false;

  void _frameCallback(Duration _) {
    if (_followers.isEmpty) return;

    if (!_isSchedulingPostFrameLayout &&
        _checkLeadersChanged(checkSizes: false, checkTransforms: true)) {
      _scheduleFollowersLayout();
    }

    _frameCallbackScheduler.schedule();
  }

  final Map<LeaderClientType, _LeaderLayout> _lastLeaderLayouts = HashMap();
  final _leaderTransformCache = Matrix4.zero();

  bool _checkLeaderChanged(
    LeaderClientType leader, {
    required bool checkSizes,
    required bool checkTransforms,
  }) {
    assert(checkSizes || checkTransforms);

    if (!leader.renderObject.attached) return false;

    var changed = false;
    final lastLayout = _lastLeaderLayouts[leader] ??= .new();

    if (checkSizes) {
      final size = leader.size;
      if (lastLayout.size != size) {
        lastLayout.size = size;
        changed = true;
      }
    }

    if (checkTransforms) {
      final transform = RenderObjectTransformHelper.tryGetTransformTo(
        leader.renderObject,
        result: _leaderTransformCache,
      );
      final lastTransform = lastLayout.transform;
      if (transform != null) {
        if (lastTransform == null || lastTransform != transform) {
          lastLayout.transform = (lastTransform ?? .zero())
            ..setFrom(_leaderTransformCache);
          changed = true;
        }
      } else {
        if (lastTransform != null) {
          lastLayout.transform = null;
          changed = true;
        }
      }
    }

    return changed;
  }

  bool _checkLeadersChanged({
    required bool checkSizes,
    required bool checkTransforms,
  }) {
    assert(checkSizes || checkTransforms);

    var changed = false;

    for (final leader in _leaders) {
      if (_checkLeaderChanged(
        leader,
        checkSizes: checkSizes,
        checkTransforms: checkTransforms,
      )) {
        changed = true;
      }
    }

    return changed;
  }

  void _markFollowersNeedLayout() {
    for (final follower in _followers) {
      if (!follower.renderObject.attached) continue;

      follower.renderObject.markNeedsLayout();
    }
  }

  void _postFrameCallback(Duration _) {
    _isSchedulingPostFrameLayout = false;
    if (_followers.isEmpty) return;
    _markFollowersNeedLayout();
  }

  void _scheduleFollowersLayout() {
    if (_followers.isEmpty) return;

    final schedulerBinding = SchedulerBinding.instance;
    switch (schedulerBinding.schedulerPhase) {
      case .persistentCallbacks || .postFrameCallbacks:
        if (!_isSchedulingPostFrameLayout) {
          _isSchedulingPostFrameLayout = true;
          schedulerBinding.addPostFrameCallback(_postFrameCallback);
        }
      default:
        _markFollowersNeedLayout();
    }
  }

  void _onLeaderCountChanged() {
    _scheduleFollowersLayout();
  }

  void _onLeaderLayout(LeaderClientType leader) {
    if (_checkLeaderChanged(leader, checkSizes: true, checkTransforms: true)) {
      _scheduleFollowersLayout();
    }
  }

  void _onLeaderPaint(LeaderClientType leader) {
    // TODO: implement leader debug tracking
    if (_checkLeaderChanged(leader, checkSizes: false, checkTransforms: true)) {
      _scheduleFollowersLayout();
    }
  }

  @mustCallSuper
  bool debugAssertIsValid() {
    assert(debugAssertLeadersAreValid(leadersInternal));
    return true;
  }
}

sealed class LayoutLinkHandle<LayoutClientType extends LayoutLinkClient> {
  LayoutLinkHandle._({required LayoutClientType client}) : _client = client;

  LayoutClientType? _client;

  /// The client associated with this handle.
  LayoutClientType get client {
    assert(debugAssertNotDisposed(this));
    assert(_client != null);
    return _client!;
  }

  var _debugDisposed = false;

  /// This method disconnects the [client] from the associated [LayoutLink]
  /// and discards any resources used by the object. After this is called, the
  /// object is not in a usable state and should be discarded (calls to
  /// instance methods will throw after the object is disposed).
  ///
  /// This method should only be called by the object's owner.
  @mustCallSuper
  void dispose() {
    assert(debugAssertNotDisposed(this));
    assert(() {
      _debugDisposed = true;
      return true;
    }());
    _client = null;
  }

  static bool debugAssertNotDisposed(LayoutLinkHandle handle) {
    assert(() {
      if (handle._debugDisposed) {
        throw FlutterError(
          "A ${handle.runtimeType} was used after being disposed.\n"
          "Once you have called dispose() on ${handle.runtimeType}, "
          "it can no longer be used",
        );
      }
      return true;
    }());
    return true;
  }
}

final class LeaderLayoutLinkHandle<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLinkHandle<LeaderClientType> {
  LeaderLayoutLinkHandle._({
    required LayoutLink<LeaderClientType, FollowerClientType> link,
    required LeaderClientType leader,
  }) : _linkOrNull = link,
       super._(client: leader);

  LayoutLink<LeaderClientType, FollowerClientType>? _linkOrNull;

  LayoutLink<LeaderClientType, FollowerClientType> get _link {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    assert(_linkOrNull != null);
    return _linkOrNull!;
  }

  /// Notify the connected [LayoutLink] that the client was marked dirty for
  /// layout.
  ///
  /// This must be called only from [RenderObject.markNeedsLayout].
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void markNeedsLayout() {
  ///   super.markNeedsLayout();
  ///   layoutLinkHandle?.onClientNeedsLayout();
  /// }
  /// ```
  void onClientNeedsLayout() {
    _link._onLeaderLayout(client);
  }

  /// Notify the connected [LayoutLink] that the client has performed layout.
  ///
  /// This must be called only from [RenderObject.performLayout].
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void performLayout() {
  ///   size = _computeLayout(constraints);
  ///   layoutLinkHandle?.onClientDidLayout();
  /// }
  /// ```
  void onClientDidLayout() {
    _link._onLeaderLayout(client);
  }

  /// Notify the connected [LayoutLink] that the client has performed a paint.
  ///
  /// This must be called only from [RenderObject.paint].
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void paint(PaintingContext context, Offset offset) {
  ///   super.paint(context, offset);
  ///   layoutLinkHandle?.onClientPaint();
  /// }
  /// ```
  void onClientPaint() {
    _link._onLeaderPaint(client);
  }

  @override
  void dispose() {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    _linkOrNull?._unregisterLeader(client);
    _linkOrNull = null;

    super.dispose();
  }
}

final class FollowerLayoutLinkHandle<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLinkHandle<FollowerClientType> {
  FollowerLayoutLinkHandle._({
    required LayoutLink<LeaderClientType, FollowerClientType> link,
    required FollowerClientType follower,
  }) : _linkOrNull = link,
       super._(client: follower);

  LayoutLink<LeaderClientType, FollowerClientType>? _linkOrNull;

  LayoutLink<LeaderClientType, FollowerClientType> get _link {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    assert(_linkOrNull != null);
    return _linkOrNull!;
  }

  /// This method must only be called from the `client.renderObject` instance.
  ///
  /// Returns `true` if the redepth was successful, meaning it's not longer
  /// needed to redepth the children of the client render object. If `false` is
  /// returned, the client may continue with redepthing its children.
  ///
  /// Example:
  /// ```dart
  /// @override
  /// void redepthChildren() {
  ///   // Skip redepthing children only if leader-based redepth succeeded.
  ///   if (layoutLinkHandle?.redepthClientRenderObject() == true) return;
  ///   super.redepthChildren();
  /// }
  /// ```
  bool tryRedepthClient() {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));

    LeaderClientType? deepestLeader;
    for (final leader in _link.leaders) {
      if (!leader.renderObject.attached) continue;

      final maxDepth = deepestLeader?.renderObject.depth;
      if (maxDepth == null || leader.renderObject.depth > maxDepth) {
        deepestLeader = leader;
      }
    }

    if (deepestLeader != null &&
        client.renderObject.depth <= deepestLeader.renderObject.depth) {
      // ignore: invalid_use_of_protected_member
      deepestLeader.renderObject.redepthChild(client.renderObject);

      // Return because leader's render object calls this function recursively.
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    _linkOrNull?._unregisterFollower(client);
    _linkOrNull = null;
    super.dispose();
  }
}
