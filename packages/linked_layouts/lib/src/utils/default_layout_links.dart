import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:linked_layouts/src/linked_layouts.dart';

base class SingleLeaderLayoutLink<
  LeaderClientType extends LayoutLeaderClient,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLink<LeaderClientType, FollowerClientType> {
  final _leaderList = <LeaderClientType>[];

  LeaderClientType? get leader {
    assert(_leaderList.length <= 1);
    return _leaderList.isNotEmpty ? _leaderList[0] : null;
  }

  @override
  Iterable<LeaderClientType> get leadersInternal {
    assert(_leaderList.length <= 1);
    return _leaderList;
  }

  @override
  bool isLeaderRegistered(LeaderClientType leader) => leader == this.leader;

  @override
  void registerLeaderInternal(LeaderClientType leader) {
    assert(_leaderList.isEmpty);
    _leaderList.add(leader);
  }

  @override
  void unregisterLeaderInternal(LeaderClientType leader) {
    assert(_leaderList.length == 1);
    _leaderList.removeAt(0);
  }
}

base class SlottedMultiLeaderLayoutLink<
  SlotType extends Object?,
  LeaderClientType extends SlottedLayoutLeaderClient<SlotType, Object>,
  FollowerClientType extends LayoutFollowerClient
>
    extends LayoutLink<LeaderClientType, FollowerClientType> {
  final Map<SlotType, LeaderClientType> _slotToLeader = HashMap();

  LeaderClientType? leaderForSlot(SlotType slot) {
    final leader = _slotToLeader[slot];
    // TODO: throw errors via FlutterError and improve error messages
    assert(
      leader == null || leader.slot == slot,
      "Slotted leader changed slots.",
    );
    assert(() {
      if (leader != null) {
        for (final otherLeader in leadersInternal) {
          if (otherLeader != leader && otherLeader.slot == slot) {
            throw FlutterError(
              "Found multiple leaders with the same slot $slot.",
            );
          }
        }
      }
      return true;
    }());
    return leader;
  }

  @override
  Iterable<LeaderClientType> get leadersInternal => _slotToLeader.values;

  @override
  bool isLeaderRegistered(LeaderClientType leader) {
    // TODO: expand this assertion further
    assert(
      !_slotToLeader.containsKey(leader.slot) ||
          _slotToLeader[leader.slot] == leader,
    );
    return _slotToLeader.containsKey(leader.slot);
  }

  @override
  void registerLeaderInternal(LeaderClientType leader) {
    _slotToLeader[leader.slot] = leader;
  }

  @override
  void unregisterLeaderInternal(LeaderClientType leader) {
    _slotToLeader.remove(leader.slot);
  }
}
