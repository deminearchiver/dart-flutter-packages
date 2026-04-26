import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:linked_layouts/linked_layouts.dart';

abstract class LayoutLink<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
> {
  final _leaders = <LeaderClientType>{};

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

  LayoutLinkHandle<LeaderClientType> registerLeader(LeaderClientType leader) {
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

    // Force layout update in all followers.
    didLeaderDoLayout();

    // Return a finalizer handle.
    return _LeaderLayoutLinkHandle(link: this, leader: leader);
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

    // Leaders must be in a valid state.
    assert(debugAssertLeadersAreValid(leadersInternal));

    // Force layout update in all followers.
    didLeaderDoLayout();
  }

  final _followers = <FollowerClientType>{};

  LayoutLinkHandle<FollowerClientType> registerFollower(
    FollowerClientType follower,
  ) {
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
    return _FollowerLayoutLinkHandle(link: this, follower: follower);
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
  final _lastLeaderTransforms = <LeaderClientType, Matrix4>{};
  final _lastLeaderSizes = <LeaderClientType, Size>{};
  var _isSchedulingPostFrameLayout = false;

  void _frameCallback(Duration _) {
    if (_followers.isNotEmpty) {
      if (_checkForLeaderChanges(checkTransforms: true, checkSizes: true)) {
        _scheduleFollowersLayout();
      }
      _frameCallbackScheduler.schedule();
    }
  }

  bool _checkForLeaderChanges({
    required bool checkTransforms,
    required bool checkSizes,
  }) {
    if (!checkTransforms && !checkSizes) return false;

    var changed = false;

    // Remove transforms of removed leaders.
    if (checkTransforms) {
      _lastLeaderTransforms.removeWhere(
        (leader, _) => !_leaders.contains(leader) && (changed = true),
      );
    }
    if (checkSizes) {
      _lastLeaderSizes.removeWhere(
        (leader, _) => !_leaders.contains(leader) && (changed = true),
      );
    }

    // Check if transforms have changed and update last transforms.
    for (final leader in _leaders) {
      if (!leader.renderObject.attached) continue;
      if (checkTransforms) {
        final currentTransform =
            tryGetTransformTo(leader.renderObject) ?? .identity();
        final lastTransform = _lastLeaderTransforms[leader];
        if (lastTransform == null || lastTransform != currentTransform) {
          changed = true;
          _lastLeaderTransforms[leader] = currentTransform;
        }
      }
      if (checkSizes) {
        final currentSize = leader.size ?? .zero;
        final lastSize = _lastLeaderSizes[leader];
        if (lastSize != currentSize) {
          changed = true;
          _lastLeaderSizes[leader] = currentSize;
        }
      }
    }
    return changed;
  }

  void _markFollowersNeedLayout() {
    for (final follower in _followers) {
      if (follower.renderObject.attached) {
        follower.renderObject.markNeedsLayout();
      }
    }
  }

  void _scheduleFollowersLayout() {
    if (_followers.isEmpty) return;
    final schedulerPhase = SchedulerBinding.instance.schedulerPhase;
    if (schedulerPhase == .persistentCallbacks ||
        schedulerPhase == .postFrameCallbacks) {
      if (!_isSchedulingPostFrameLayout) {
        _isSchedulingPostFrameLayout = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _isSchedulingPostFrameLayout = false;
          _markFollowersNeedLayout();
        });
      }
    } else {
      _markFollowersNeedLayout();
    }
  }

  @internal
  void didLeaderDoLayout() {
    // TODO: implement leader debug tracking
    _checkForLeaderChanges(checkTransforms: true, checkSizes: true);
    _scheduleFollowersLayout();
  }

  @internal
  void didLeaderDoPaint() {
    // TODO: implement leader debug tracking
    if (_checkForLeaderChanges(checkTransforms: true, checkSizes: false)) {
      _scheduleFollowersLayout();
    }
  }

  @mustCallSuper
  bool debugAssertIsValid() {
    assert(debugAssertLeadersAreValid(leadersInternal));
    return true;
  }

  static Offset? getOffsetIn(
    RenderObject leader,
    RenderObject coordinateSpace,
  ) {
    if (!leader.attached || !coordinateSpace.attached) return null;
    final leaderGlobal = tryGetTransformTo(leader);
    final transform = tryGetTransformTo(coordinateSpace);
    if (leaderGlobal == null || transform == null) return null;
    final determinant = transform.invert();
    if (determinant == 0.0) return null;
    return MatrixUtils.transformPoint(transform..multiply(leaderGlobal), .zero);
  }

  @internal
  static Matrix4? tryGetTransformTo(
    RenderObject descendant, {
    RenderObject? ancestor,
  }) {
    if (!descendant.attached) return null;
    RenderObject? object;
    final objects = <RenderObject>[
      for (
        object = descendant;
        object != null && object != ancestor;
        object = object.parent
      )
        object,
    ];

    if (ancestor != null && object != ancestor) return null;

    final transform = Matrix4.identity();
    for (var index = objects.length - 1; index > 0; index -= 1) {
      final parent = objects[index];
      final child = objects[index - 1];
      try {
        parent.applyPaintTransform(child, transform);
      } on Object {
        final childParentData = child.parentData;
        if (childParentData is BoxParentData) {
          final offset = childParentData.offset;
          transform.translateByDouble(offset.dx, offset.dy, 0.0, 1.0);
        }
      }
    }
    return transform;
  }
}

abstract class LayoutLinkHandle<LayoutClientType extends LayoutLinkClient> {
  LayoutLinkHandle._({required LayoutClientType client}) : _client = client;

  LayoutClientType? _client;

  LayoutClientType get client {
    assert(debugAssertNotDisposed(this));
    assert(_client != null);
    return _client!;
  }

  var _debugDisposed = false;

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

class _LeaderLayoutLinkHandle<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLinkHandle<LeaderClientType> {
  _LeaderLayoutLinkHandle({
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

  @override
  void dispose() {
    _link._unregisterLeader(client);
    _linkOrNull = null;
    super.dispose();
  }
}

class _FollowerLayoutLinkHandle<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLinkHandle<FollowerClientType> {
  _FollowerLayoutLinkHandle({
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

  @override
  void dispose() {
    _link._unregisterFollower(client);
    _linkOrNull = null;
    super.dispose();
  }
}
