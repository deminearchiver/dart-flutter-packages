// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SnapshotScheme _$SnapshotSchemeFromJson(Map<String, dynamic> json) =>
    _SnapshotScheme(
      properties: SnapshotSchemeProperties.fromJson(
        json['properties'] as Map<String, dynamic>,
      ),
      materialDynamicColors:
          (json['material_dynamic_colors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, const ColorConverter().fromJson(e as String)),
          ) ??
          const {},
      androidOnlyDynamicColors:
          (json['android_only_dynamic_colors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, const ColorConverter().fromJson(e as String)),
          ) ??
          const {},
    );

_SnapshotSchemeProperties _$SnapshotSchemePropertiesFromJson(
  Map<String, dynamic> json,
) => _SnapshotSchemeProperties(
  fallbackConstructorName: json['fallback_constructor_name'] as String?,
  sourceColor: const ColorConverter().fromJson(json['source_color'] as String),
  isDark: json['is_dark'] as bool,
  contrastLevel: (json['contrast_level'] as num).toDouble(),
  variant: const VariantConverter().fromJson(json['variant'] as String),
  specVersion: const SpecVersionConverter().fromJson(
    json['spec_version'] as String,
  ),
  platform: const PlatformConverter().fromJson(json['platform'] as String),
);
