import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

const int _hashMask = 0x7fffffff;

class _KeyedPersistentHashMapEntry {
  _KeyedPersistentHashMapEntry(this.equality, this.key, this.value);

  final KeyedPersistentHashMapEquality equality;
  final Object key;
  final Object? value;

  @override
  int get hashCode =>
      (3 * equality._keyEquality.hash(key) +
          7 * equality._valueEquality.hash(value)) &
      _hashMask;

  @override
  bool operator ==(Object other) =>
      other is _KeyedPersistentHashMapEntry &&
      equality._keyEquality.equals(key, other.key) &&
      equality._valueEquality.equals(value, other.value);
}

class KeyedPersistentHashMapEquality<K extends Object, V extends Object?>
    implements Equality<KeyedPersistentHashMap<K, V>> {
  const KeyedPersistentHashMapEquality({
    Equality<K> keys = const DefaultEquality<Never>(),
    Equality<V> values = const DefaultEquality<Never>(),
  }) : _keyEquality = keys,
       _valueEquality = values;

  final Equality<K> _keyEquality;
  final Equality<V> _valueEquality;

  @override
  bool equals(
    KeyedPersistentHashMap<K, V>? map1,
    KeyedPersistentHashMap<K, V>? map2,
  ) {
    if (identical(map1, map2)) return true;
    if (map1 == null || map2 == null) return false;
    final length = map1._keys.length;
    if (length != map2._keys.length) return false;
    final Map<_KeyedPersistentHashMapEntry, int> equalElementCounts = HashMap();
    for (final key in map1._keys) {
      final entry = _KeyedPersistentHashMapEntry(this, key, map1[key]);
      final count = equalElementCounts[entry] ?? 0;
      equalElementCounts[entry] = count + 1;
    }
    for (final key in map2._keys) {
      final entry = _KeyedPersistentHashMapEntry(this, key, map2[key]);
      final count = equalElementCounts[entry];
      if (count == null || count == 0) return false;
      equalElementCounts[entry] = count - 1;
    }
    return true;
  }

  @override
  int hash(KeyedPersistentHashMap<K, V>? map) {
    if (map == null) return null.hashCode;
    var hash = 0;
    for (final key in map._keys) {
      final keyHash = _keyEquality.hash(key);
      final valueHash = _valueEquality.hash(map[key] as V);
      hash = (hash + 3 * keyHash + 7 * valueHash) & _hashMask;
    }
    hash = (hash + (hash << 3)) & _hashMask;
    hash ^= hash >> 11;
    hash = (hash + (hash << 15)) & _hashMask;
    return hash;
  }

  @override
  bool isValidKey(Object? o) => o is KeyedPersistentHashMap<K, V>;
}

class KeyedPersistentHashMap<K extends Object, V extends Object?>
    implements PersistentHashMap<K, V> {
  const KeyedPersistentHashMap._({required this._map, required this._keys});

  KeyedPersistentHashMap.empty()
    : this._(map: PersistentHashMap<K, V>.empty(), keys: HashSet<K>());

  final PersistentHashMap<K, V> _map;
  final Set<K> _keys;

  @override
  KeyedPersistentHashMap<K, V> put(K key, V value) => ._(
    map: _map.put(key, value),
    keys: _keys.contains(key) ? _keys : HashSet.of(_keys)
      ..add(key),
  );

  @override
  V? operator [](K key) => _map[key];
}
