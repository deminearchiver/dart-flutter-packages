import 'dart:collection';

import 'package:flutter/rendering.dart';
import 'package:linked_layouts/linked_layouts.dart';

base class SlottedMultiLeaderLayoutLink<SlotType extends Object?>
    extends
        LayoutLink<
          SlottedLayoutLeaderClient<RenderBox, SlotType>,
          LayoutFollowerClient
        > {
  final Map<SlotType, SlottedLayoutLeaderClient<RenderBox, SlotType>>
  _slotToLeader = HashMap();

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
  Iterable<SlottedLayoutLeaderClient<RenderBox, SlotType>>
  get leadersInternal => _slotToLeader.values;

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
  }

  @override
  void unregisterLeaderInternal(
    SlottedLayoutLeaderClient<RenderBox, SlotType> leader,
  ) {
    _slotToLeader.remove(leader.slot);
  }
}
