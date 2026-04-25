import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

abstract class LayoutLink<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType
      extends LayoutLink<LeaderClientType, FollowerClientType, LayoutLinkType>
> {
  Iterable<LeaderClientType> get leaders;

  @protected
  bool isLeaderRegistered(LeaderClientType leader) => leaders.contains(leader);

  @protected
  void registerLeaderInternal(LeaderClientType leader);

  @protected
  void unregisterLeaderInternal(LeaderClientType leader);

  @protected
  LayoutLinkType get self;

  LayoutLinkHandle<LayoutLinkType, LeaderClientType> registerLeader(
    LeaderClientType leader,
  ) {
    assert(!isLeaderRegistered(leader));
    registerLeaderInternal(leader);
    return _LeaderLayoutLinkHandle(link: self, leader: leader);
  }

  void _unregisterLeader(LeaderClientType leader) {
    assert(isLeaderRegistered(leader));
    unregisterLeaderInternal(leader);
  }

  final _followers = StrictSet<FollowerClientType>();

  LayoutLinkHandle<LayoutLinkType, FollowerClientType> registerFollower(
    FollowerClientType follower,
  ) {
    assert(!_followers.contains(follower));
    final wasEmpty = _followers.isEmpty;
    _followers.add(follower);
    if (wasEmpty) _frameCallbackScheduler.schedule();
    return _FollowerLayoutLinkHandle(link: self, follower: follower);
  }

  void _unregisterFollower(FollowerClientType follower) {
    assert(_followers.contains(follower));
    _followers.remove(follower);
    if (_followers.isEmpty) {
      _frameCallbackScheduler.cancel();
    }
  }

  late final _frameCallbackScheduler = FrameCallbackScheduler(_frameCallback);
  var _lastLeaderTransforms = <LeaderClientType, Matrix4>{};
  var _lastLeaderSizes = <LeaderClientType, Size>{};
  var _isSchedulingPostFrameLayout = false;

  void _frameCallback(Duration _) {}

  bool _checkForLeaderChanges({required bool includeSize}) {
    var changed = false;
    final currentTransforms = <LeaderClientType, Matrix4>{};
    final currentSizes = <LeaderClientType, Size>{};
    for (final leader in leaders) {
      if (leader.renderObject.attached) {
        currentTransforms[leader] =
            _safeGlobalTransform(leader.renderObject) ?? .identity();
        if (includeSize) {
          currentSizes[leader] = leader.size ?? .zero;
        }
      }
    }
    if (_lastLeaderTransforms.length != currentTransforms.length ||
        (includeSize && _lastLeaderSizes.length != currentSizes.length)) {
      changed = true;
    } else {
      for (final leader in currentTransforms.keys) {
        if (_lastLeaderTransforms[leader] != currentTransforms[leader]) {
          changed = true;
          break;
        }
      }
      if (!changed && includeSize) {
        for (final leader in currentSizes.keys) {
          if (_lastLeaderSizes[leader] != currentSizes[leader]) {
            changed = true;
            break;
          }
        }
      }
    }
    _lastLeaderTransforms = currentTransforms;
    if (includeSize) {
      _lastLeaderSizes = currentSizes;
    }
    return changed;
  }

  @internal
  void didLeaderDoLayout(LeaderClientType? leader) {
    // TODO: implement leader debug tracking
    _checkForLeaderChanges(includeSize: true);
    for (final follower in _followers) {
      if (follower.renderObject.attached) {
        follower.renderObject.markNeedsLayout();
      }
    }
  }

  @internal
  void didLeaderDoPaint(LeaderClientType? leader) {
    // TODO: implement leader debug tracking
    if (_checkForLeaderChanges(includeSize: false)) {
      if (!_isSchedulingPostFrameLayout) {
        _isSchedulingPostFrameLayout = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _isSchedulingPostFrameLayout = false;
          for (final follower in _followers) {
            if (follower.renderObject.attached) {
              follower.renderObject.markNeedsLayout();
            }
          }
        });
      }
    }
  }

  Offset? leaderOffsetIn(RenderObject leader, RenderObject coordinateSpace) {
    if (!leader.attached || !coordinateSpace.attached) return null;
    final leaderGlobal = _safeGlobalTransform(leader);
    final transform = _safeGlobalTransform(coordinateSpace);
    if (leaderGlobal == null || transform == null) return null;
    final determinant = transform.invert();
    if (determinant == 0.0) return null;
    return MatrixUtils.transformPoint(transform..multiply(leaderGlobal), .zero);
  }

  @mustCallSuper
  bool debugAssertIsValid() {
    return true;
  }

  static Matrix4? _safeGlobalTransform(RenderObject descendant) {
    if (!descendant.attached) return null;
    final objects = <RenderObject>[
      for (
        RenderObject? object = descendant;
        object != null;
        object = object.parent
      )
        object,
    ];
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

class SingleLeaderLayoutLink<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends
        LayoutLink<
          LeaderClientType,
          FollowerClientType,
          SingleLeaderLayoutLink<LeaderClientType, FollowerClientType>
        > {
  final _leaderList = <LeaderClientType>[];

  LeaderClientType? get leader {
    assert(_leaderList.length <= 1);
    return _leaderList.isNotEmpty ? _leaderList[0] : null;
  }

  @override
  Iterable<LeaderClientType> get leaders {
    assert(_leaderList.length <= 1);
    return _leaderList;
  }

  @override
  bool isLeaderRegistered(LeaderClientType leader) => leader == this.leader;

  @override
  void registerLeaderInternal(LeaderClientType leader) {
    assert(_leaderList.isEmpty);
    _leaderList.add(leader);
    didLeaderDoLayout(leader);
  }

  @override
  void unregisterLeaderInternal(LeaderClientType leader) {
    assert(_leaderList.length == 1);
    _leaderList.removeAt(0);
    didLeaderDoLayout(null);
  }

  @override
  SingleLeaderLayoutLink<LeaderClientType, FollowerClientType> get self => this;
}

class SlottedMultiLeaderLayoutLink<SlotType extends Object?>
    extends
        LayoutLink<
          SlottedLayoutLeaderClient<RenderBox, SlotType>,
          LayoutFollowerClient,
          SlottedMultiLeaderLayoutLink<SlotType>
        > {
  final _slotToLeader =
      <SlotType, SlottedLayoutLeaderClient<RenderBox, SlotType>>{};

  SlottedLayoutLeaderClient<RenderBox, SlotType>? leaderForSlot(SlotType slot) {
    final leader = _slotToLeader[slot];
    // TODO: throw errors via FlutterError and improve error messages
    assert(
      leader == null || leader.slot == slot,
      "Slotted leader changed slots.",
    );
    assert(
      leader == null ||
          !leaders.any(
            (otherLeader) => otherLeader != leader && otherLeader.slot == slot,
          ),
      "Found multiple leaders with the same slot $slot.",
    );
    return leader;
  }

  @override
  Iterable<SlottedLayoutLeaderClient<RenderBox, SlotType>> get leaders =>
      _slotToLeader.values;

  @override
  bool isLeaderRegistered(
    SlottedLayoutLeaderClient<RenderBox, SlotType> leader,
  ) {
    // TODO: expand this assertion further
    assert(
      !_slotToLeader.containsKey(leader.slot) ||
          _slotToLeader[leader.slot] == leader,
    );
    return _slotToLeader.containsKey(leader.slot);
  }

  @override
  void registerLeaderInternal(
    SlottedLayoutLeaderClient<RenderBox, SlotType> leader,
  ) {
    _slotToLeader[leader.slot] = leader;
    didLeaderDoLayout(leader);
  }

  @override
  void unregisterLeaderInternal(
    SlottedLayoutLeaderClient<RenderBox, SlotType> leader,
  ) {
    _slotToLeader.remove(leader.slot);
    didLeaderDoLayout(null);
  }

  @override
  SlottedMultiLeaderLayoutLink<SlotType> get self => this;
}

abstract class LayoutLinkHandle<
  LayoutLinkType extends LayoutLink<
    LayoutLeaderClient,
    LayoutFollowerClient,
    LayoutLinkType
  >,
  LayoutClientType extends LayoutLinkClient
> {
  LayoutLinkHandle._({
    required LayoutLinkType link,
    required LayoutClientType client,
  }) : _link = link,
       _client = client;

  LayoutLinkType? _link;

  LayoutLinkType get link {
    assert(debugAssertNotDisposed(this));
    assert(_link != null);
    return _link!;
  }

  final LayoutClientType _client;

  LayoutClientType get client {
    assert(debugAssertNotDisposed(this));
    return _client;
  }

  var _debugDisposed = false;

  @mustCallSuper
  void dispose() {
    assert(debugAssertNotDisposed(this));
    assert(() {
      _debugDisposed = true;
      return true;
    }());
    _link = null;
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
  LayoutLinkType
      extends LayoutLink<LeaderClientType, LayoutFollowerClient, LayoutLinkType>
>
    extends LayoutLinkHandle<LayoutLinkType, LeaderClientType> {
  _LeaderLayoutLinkHandle({
    required super.link,
    required LeaderClientType leader,
  }) : super._(client: leader);

  @override
  void dispose() {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    link._unregisterLeader(client);
    super.dispose();
  }
}

class _FollowerLayoutLinkHandle<
  FollowerClientType extends LayoutFollowerClient,
  LayoutLinkType
      extends LayoutLink<LayoutLeaderClient, FollowerClientType, LayoutLinkType>
>
    extends LayoutLinkHandle<LayoutLinkType, FollowerClientType> {
  _FollowerLayoutLinkHandle({
    required super.link,
    required FollowerClientType follower,
  }) : super._(client: follower);

  @override
  void dispose() {
    assert(LayoutLinkHandle.debugAssertNotDisposed(this));
    link._unregisterFollower(client);
    super.dispose();
  }
}

mixin LayoutLinkClient<RenderObjectType extends RenderObject> {
  RenderObjectType get renderObject;
}

mixin LayoutLeaderClient<RenderObjectType extends RenderBox>
    on LayoutLinkClient<RenderObjectType> {
  Size? _size;

  Size? get size => renderObject.attached ? _size : null;

  set size(Size? value) {
    if (renderObject.attached) _size = value;
  }

  Size? get scale {
    if (!renderObject.attached) return null;
    final transform = LayoutLink._safeGlobalTransform(renderObject);
    if (transform == null) return null;
    // TODO: replace with a perspective transform (inline logic)
    final matrix = transform.storage;
    return Size(matrix[0], matrix[5]);
    // Initial calculation:
    // return Size(
    //   transform.transform3(.new(1, 0, 0)).x - transform.transform3(.zero()).x,
    //   transform.transform3(.new(0, 1, 0)).y - transform.transform3(.zero()).y,
    // );
  }
}

mixin SlottedLayoutLeaderClient<
  RenderObjectType extends RenderBox,
  SlotType extends Object?
>
    on LayoutLeaderClient<RenderObjectType> {
  SlotType get slot;
}

mixin LayoutFollowerClient<RenderObjectType extends RenderObject>
    on LayoutLinkClient<RenderObjectType> {}

class DefaultLayoutLeaderClient<RenderObjectType extends RenderBox>
    with
        LayoutLinkClient<RenderObjectType>,
        LayoutLeaderClient<RenderObjectType> {
  DefaultLayoutLeaderClient(this.renderObject);

  @override
  final RenderObjectType renderObject;
}

class DefaultSlottedLayoutLeaderClient<
  RenderObjectType extends RenderBox,
  SlotType extends Object?
>
    extends DefaultLayoutLeaderClient<RenderObjectType>
    with SlottedLayoutLeaderClient<RenderObjectType, SlotType> {
  DefaultSlottedLayoutLeaderClient(super.renderObject, this.slot);

  @override
  final SlotType slot;
}

class DefaultLayoutFollowerClient<RenderObjectType extends RenderObject>
    with
        LayoutLinkClient<RenderObjectType>,
        LayoutFollowerClient<RenderObjectType> {
  DefaultLayoutFollowerClient(this.renderObject);

  @override
  final RenderObjectType renderObject;
}
