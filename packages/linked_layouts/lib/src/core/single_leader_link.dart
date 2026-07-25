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
