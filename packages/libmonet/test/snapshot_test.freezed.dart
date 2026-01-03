// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snapshot_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnapshotScheme {
  SnapshotSchemeProperties get properties;
  @ColorConverter()
  Map<String, Color> get materialDynamicColors;
  @ColorConverter()
  Map<String, Color> get androidOnlyDynamicColors;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SnapshotScheme &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            const DeepCollectionEquality().equals(
              other.materialDynamicColors,
              materialDynamicColors,
            ) &&
            const DeepCollectionEquality().equals(
              other.androidOnlyDynamicColors,
              androidOnlyDynamicColors,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    properties,
    const DeepCollectionEquality().hash(materialDynamicColors),
    const DeepCollectionEquality().hash(androidOnlyDynamicColors),
  );

  @override
  String toString() {
    return 'SnapshotScheme(properties: $properties, materialDynamicColors: $materialDynamicColors, androidOnlyDynamicColors: $androidOnlyDynamicColors)';
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SnapshotScheme implements SnapshotScheme {
  const _SnapshotScheme({
    required this.properties,
    @ColorConverter() final Map<String, Color> materialDynamicColors = const {},
    @ColorConverter()
    final Map<String, Color> androidOnlyDynamicColors = const {},
  }) : _materialDynamicColors = materialDynamicColors,
       _androidOnlyDynamicColors = androidOnlyDynamicColors;
  factory _SnapshotScheme.fromJson(Map<String, dynamic> json) =>
      _$SnapshotSchemeFromJson(json);

  @override
  final SnapshotSchemeProperties properties;
  final Map<String, Color> _materialDynamicColors;
  @override
  @JsonKey()
  @ColorConverter()
  Map<String, Color> get materialDynamicColors {
    if (_materialDynamicColors is EqualUnmodifiableMapView)
      return _materialDynamicColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialDynamicColors);
  }

  final Map<String, Color> _androidOnlyDynamicColors;
  @override
  @JsonKey()
  @ColorConverter()
  Map<String, Color> get androidOnlyDynamicColors {
    if (_androidOnlyDynamicColors is EqualUnmodifiableMapView)
      return _androidOnlyDynamicColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_androidOnlyDynamicColors);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnapshotScheme &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            const DeepCollectionEquality().equals(
              other._materialDynamicColors,
              _materialDynamicColors,
            ) &&
            const DeepCollectionEquality().equals(
              other._androidOnlyDynamicColors,
              _androidOnlyDynamicColors,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    properties,
    const DeepCollectionEquality().hash(_materialDynamicColors),
    const DeepCollectionEquality().hash(_androidOnlyDynamicColors),
  );

  @override
  String toString() {
    return 'SnapshotScheme(properties: $properties, materialDynamicColors: $materialDynamicColors, androidOnlyDynamicColors: $androidOnlyDynamicColors)';
  }
}

/// @nodoc
mixin _$SnapshotSchemeProperties {
  String? get fallbackConstructorName;
  @ColorConverter()
  Color get sourceColor;
  bool get isDark;
  double get contrastLevel;
  @VariantConverter()
  Variant get variant;
  @SpecVersionConverter()
  SpecVersion get specVersion;
  @PlatformConverter()
  Platform get platform;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SnapshotSchemeProperties &&
            (identical(
                  other.fallbackConstructorName,
                  fallbackConstructorName,
                ) ||
                other.fallbackConstructorName == fallbackConstructorName) &&
            (identical(other.sourceColor, sourceColor) ||
                other.sourceColor == sourceColor) &&
            (identical(other.isDark, isDark) || other.isDark == isDark) &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.specVersion, specVersion) ||
                other.specVersion == specVersion) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fallbackConstructorName,
    sourceColor,
    isDark,
    contrastLevel,
    variant,
    specVersion,
    platform,
  );

  @override
  String toString() {
    return 'SnapshotSchemeProperties(fallbackConstructorName: $fallbackConstructorName, sourceColor: $sourceColor, isDark: $isDark, contrastLevel: $contrastLevel, variant: $variant, specVersion: $specVersion, platform: $platform)';
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SnapshotSchemeProperties implements SnapshotSchemeProperties {
  const _SnapshotSchemeProperties({
    this.fallbackConstructorName,
    @ColorConverter() required this.sourceColor,
    required this.isDark,
    required this.contrastLevel,
    @VariantConverter() required this.variant,
    @SpecVersionConverter() required this.specVersion,
    @PlatformConverter() required this.platform,
  });
  factory _SnapshotSchemeProperties.fromJson(Map<String, dynamic> json) =>
      _$SnapshotSchemePropertiesFromJson(json);

  @override
  final String? fallbackConstructorName;
  @override
  @ColorConverter()
  final Color sourceColor;
  @override
  final bool isDark;
  @override
  final double contrastLevel;
  @override
  @VariantConverter()
  final Variant variant;
  @override
  @SpecVersionConverter()
  final SpecVersion specVersion;
  @override
  @PlatformConverter()
  final Platform platform;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnapshotSchemeProperties &&
            (identical(
                  other.fallbackConstructorName,
                  fallbackConstructorName,
                ) ||
                other.fallbackConstructorName == fallbackConstructorName) &&
            (identical(other.sourceColor, sourceColor) ||
                other.sourceColor == sourceColor) &&
            (identical(other.isDark, isDark) || other.isDark == isDark) &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.specVersion, specVersion) ||
                other.specVersion == specVersion) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fallbackConstructorName,
    sourceColor,
    isDark,
    contrastLevel,
    variant,
    specVersion,
    platform,
  );

  @override
  String toString() {
    return 'SnapshotSchemeProperties(fallbackConstructorName: $fallbackConstructorName, sourceColor: $sourceColor, isDark: $isDark, contrastLevel: $contrastLevel, variant: $variant, specVersion: $specVersion, platform: $platform)';
  }
}
