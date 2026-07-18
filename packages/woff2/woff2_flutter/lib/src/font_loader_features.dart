import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

@immutable
abstract interface class FontLoaderFeature {
  const FontLoaderFeature();

  @visibleForOverriding
  FutureOr<bool> tryLoadFont(Uint8List list, String family);
}

@immutable
class FallbackFontLoaderFeature implements FontLoaderFeature {
  const FallbackFontLoaderFeature();

  @override
  Future<bool> tryLoadFont(Uint8List list, String family) async {
    try {
      await loadFontFromList(list);
      return true;
    } on Object {
      return false;
    }
  }
}

@immutable
class FontLoaderFeatures {
  const FontLoaderFeatures(this.features);

  final List<FontLoaderFeature> features;

  FontLoader fromFamily(String family) => FeaturesFontLoader(features, family);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is FontLoaderFeatures &&
          _featuresEquality.equals(features, other.features);

  @override
  int get hashCode =>
      Object.hash(runtimeType, _featuresEquality.hash(features));

  static const _featuresEquality = ListEquality<FontLoaderFeature>();
}

@visibleForTesting
class FeaturesFontLoader extends FontLoader {
  FeaturesFontLoader(this.features, super.family);

  final List<FontLoaderFeature> features;

  Future<bool> tryLoadFont(Uint8List list, String family) async {
    for (final feature in features) {
      final result = switch (feature.tryLoadFont(list, family)) {
        final Future<bool> future => await future,
        final bool value => value,
      };
      if (result) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<void> loadFont(Uint8List list, String family) async {
    final result = await tryLoadFont(list, family);
    if (!result) {
      throw StateError("Failed to load $family with features: $features.");
    }
  }
}
