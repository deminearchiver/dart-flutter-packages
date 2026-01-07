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

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SnapshotSchemeCopyWith<SnapshotScheme> get copyWith =>
      _$SnapshotSchemeCopyWithImpl<SnapshotScheme>(
        this as SnapshotScheme,
        _$identity,
      );

  /// Serializes this SnapshotScheme to a JSON map.
  Map<String, dynamic> toJson();

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
abstract mixin class $SnapshotSchemeCopyWith<$Res> {
  factory $SnapshotSchemeCopyWith(
    SnapshotScheme value,
    $Res Function(SnapshotScheme) _then,
  ) = _$SnapshotSchemeCopyWithImpl;
  @useResult
  $Res call({
    SnapshotSchemeProperties properties,
    @ColorConverter() Map<String, Color> materialDynamicColors,
    @ColorConverter() Map<String, Color> androidOnlyDynamicColors,
  });

  $SnapshotSchemePropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$SnapshotSchemeCopyWithImpl<$Res>
    implements $SnapshotSchemeCopyWith<$Res> {
  _$SnapshotSchemeCopyWithImpl(this._self, this._then);

  final SnapshotScheme _self;
  final $Res Function(SnapshotScheme) _then;

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? materialDynamicColors = null,
    Object? androidOnlyDynamicColors = null,
  }) {
    return _then(
      _self.copyWith(
        properties: null == properties
            ? _self.properties
            : properties // ignore: cast_nullable_to_non_nullable
                  as SnapshotSchemeProperties,
        materialDynamicColors: null == materialDynamicColors
            ? _self.materialDynamicColors
            : materialDynamicColors // ignore: cast_nullable_to_non_nullable
                  as Map<String, Color>,
        androidOnlyDynamicColors: null == androidOnlyDynamicColors
            ? _self.androidOnlyDynamicColors
            : androidOnlyDynamicColors // ignore: cast_nullable_to_non_nullable
                  as Map<String, Color>,
      ),
    );
  }

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SnapshotSchemePropertiesCopyWith<$Res> get properties {
    return $SnapshotSchemePropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
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

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SnapshotSchemeCopyWith<_SnapshotScheme> get copyWith =>
      __$SnapshotSchemeCopyWithImpl<_SnapshotScheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SnapshotSchemeToJson(this);
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
abstract mixin class _$SnapshotSchemeCopyWith<$Res>
    implements $SnapshotSchemeCopyWith<$Res> {
  factory _$SnapshotSchemeCopyWith(
    _SnapshotScheme value,
    $Res Function(_SnapshotScheme) _then,
  ) = __$SnapshotSchemeCopyWithImpl;
  @override
  @useResult
  $Res call({
    SnapshotSchemeProperties properties,
    @ColorConverter() Map<String, Color> materialDynamicColors,
    @ColorConverter() Map<String, Color> androidOnlyDynamicColors,
  });

  @override
  $SnapshotSchemePropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$SnapshotSchemeCopyWithImpl<$Res>
    implements _$SnapshotSchemeCopyWith<$Res> {
  __$SnapshotSchemeCopyWithImpl(this._self, this._then);

  final _SnapshotScheme _self;
  final $Res Function(_SnapshotScheme) _then;

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? properties = null,
    Object? materialDynamicColors = null,
    Object? androidOnlyDynamicColors = null,
  }) {
    return _then(
      _SnapshotScheme(
        properties: null == properties
            ? _self.properties
            : properties // ignore: cast_nullable_to_non_nullable
                  as SnapshotSchemeProperties,
        materialDynamicColors: null == materialDynamicColors
            ? _self._materialDynamicColors
            : materialDynamicColors // ignore: cast_nullable_to_non_nullable
                  as Map<String, Color>,
        androidOnlyDynamicColors: null == androidOnlyDynamicColors
            ? _self._androidOnlyDynamicColors
            : androidOnlyDynamicColors // ignore: cast_nullable_to_non_nullable
                  as Map<String, Color>,
      ),
    );
  }

  /// Create a copy of SnapshotScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SnapshotSchemePropertiesCopyWith<$Res> get properties {
    return $SnapshotSchemePropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
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

  /// Create a copy of SnapshotSchemeProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SnapshotSchemePropertiesCopyWith<SnapshotSchemeProperties> get copyWith =>
      _$SnapshotSchemePropertiesCopyWithImpl<SnapshotSchemeProperties>(
        this as SnapshotSchemeProperties,
        _$identity,
      );

  /// Serializes this SnapshotSchemeProperties to a JSON map.
  Map<String, dynamic> toJson();

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
abstract mixin class $SnapshotSchemePropertiesCopyWith<$Res> {
  factory $SnapshotSchemePropertiesCopyWith(
    SnapshotSchemeProperties value,
    $Res Function(SnapshotSchemeProperties) _then,
  ) = _$SnapshotSchemePropertiesCopyWithImpl;
  @useResult
  $Res call({
    String? fallbackConstructorName,
    @ColorConverter() Color sourceColor,
    bool isDark,
    double contrastLevel,
    @VariantConverter() Variant variant,
    @SpecVersionConverter() SpecVersion specVersion,
    @PlatformConverter() Platform platform,
  });
}

/// @nodoc
class _$SnapshotSchemePropertiesCopyWithImpl<$Res>
    implements $SnapshotSchemePropertiesCopyWith<$Res> {
  _$SnapshotSchemePropertiesCopyWithImpl(this._self, this._then);

  final SnapshotSchemeProperties _self;
  final $Res Function(SnapshotSchemeProperties) _then;

  /// Create a copy of SnapshotSchemeProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fallbackConstructorName = freezed,
    Object? sourceColor = null,
    Object? isDark = null,
    Object? contrastLevel = null,
    Object? variant = null,
    Object? specVersion = null,
    Object? platform = null,
  }) {
    return _then(
      _self.copyWith(
        fallbackConstructorName: freezed == fallbackConstructorName
            ? _self.fallbackConstructorName
            : fallbackConstructorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceColor: null == sourceColor
            ? _self.sourceColor
            : sourceColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        isDark: null == isDark
            ? _self.isDark
            : isDark // ignore: cast_nullable_to_non_nullable
                  as bool,
        contrastLevel: null == contrastLevel
            ? _self.contrastLevel
            : contrastLevel // ignore: cast_nullable_to_non_nullable
                  as double,
        variant: null == variant
            ? _self.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as Variant,
        specVersion: null == specVersion
            ? _self.specVersion
            : specVersion // ignore: cast_nullable_to_non_nullable
                  as SpecVersion,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as Platform,
      ),
    );
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

  /// Create a copy of SnapshotSchemeProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SnapshotSchemePropertiesCopyWith<_SnapshotSchemeProperties> get copyWith =>
      __$SnapshotSchemePropertiesCopyWithImpl<_SnapshotSchemeProperties>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SnapshotSchemePropertiesToJson(this);
  }

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

/// @nodoc
abstract mixin class _$SnapshotSchemePropertiesCopyWith<$Res>
    implements $SnapshotSchemePropertiesCopyWith<$Res> {
  factory _$SnapshotSchemePropertiesCopyWith(
    _SnapshotSchemeProperties value,
    $Res Function(_SnapshotSchemeProperties) _then,
  ) = __$SnapshotSchemePropertiesCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? fallbackConstructorName,
    @ColorConverter() Color sourceColor,
    bool isDark,
    double contrastLevel,
    @VariantConverter() Variant variant,
    @SpecVersionConverter() SpecVersion specVersion,
    @PlatformConverter() Platform platform,
  });
}

/// @nodoc
class __$SnapshotSchemePropertiesCopyWithImpl<$Res>
    implements _$SnapshotSchemePropertiesCopyWith<$Res> {
  __$SnapshotSchemePropertiesCopyWithImpl(this._self, this._then);

  final _SnapshotSchemeProperties _self;
  final $Res Function(_SnapshotSchemeProperties) _then;

  /// Create a copy of SnapshotSchemeProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fallbackConstructorName = freezed,
    Object? sourceColor = null,
    Object? isDark = null,
    Object? contrastLevel = null,
    Object? variant = null,
    Object? specVersion = null,
    Object? platform = null,
  }) {
    return _then(
      _SnapshotSchemeProperties(
        fallbackConstructorName: freezed == fallbackConstructorName
            ? _self.fallbackConstructorName
            : fallbackConstructorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceColor: null == sourceColor
            ? _self.sourceColor
            : sourceColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        isDark: null == isDark
            ? _self.isDark
            : isDark // ignore: cast_nullable_to_non_nullable
                  as bool,
        contrastLevel: null == contrastLevel
            ? _self.contrastLevel
            : contrastLevel // ignore: cast_nullable_to_non_nullable
                  as double,
        variant: null == variant
            ? _self.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as Variant,
        specVersion: null == specVersion
            ? _self.specVersion
            : specVersion // ignore: cast_nullable_to_non_nullable
                  as SpecVersion,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as Platform,
      ),
    );
  }
}
