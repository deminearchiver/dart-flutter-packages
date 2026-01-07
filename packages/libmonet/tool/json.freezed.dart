// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Figma {
  String get description;
  @ColorConverter()
  Color get seed;
  FigmaCoreColors get coreColors;
  List<FigmaExtendedColor> get extendedColors;
  FigmaSchemes get schemes;
  FigmaPalettes get palettes;

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaCopyWith<Figma> get copyWith =>
      _$FigmaCopyWithImpl<Figma>(this as Figma, _$identity);

  /// Serializes this Figma to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Figma &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.coreColors, coreColors) ||
                other.coreColors == coreColors) &&
            const DeepCollectionEquality().equals(
              other.extendedColors,
              extendedColors,
            ) &&
            (identical(other.schemes, schemes) || other.schemes == schemes) &&
            (identical(other.palettes, palettes) ||
                other.palettes == palettes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    seed,
    coreColors,
    const DeepCollectionEquality().hash(extendedColors),
    schemes,
    palettes,
  );

  @override
  String toString() {
    return 'Figma(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes, palettes: $palettes)';
  }
}

/// @nodoc
abstract mixin class $FigmaCopyWith<$Res> {
  factory $FigmaCopyWith(Figma value, $Res Function(Figma) _then) =
      _$FigmaCopyWithImpl;
  @useResult
  $Res call({
    String description,
    @ColorConverter() Color seed,
    FigmaCoreColors coreColors,
    List<FigmaExtendedColor> extendedColors,
    FigmaSchemes schemes,
    FigmaPalettes palettes,
  });

  $FigmaCoreColorsCopyWith<$Res> get coreColors;
  $FigmaSchemesCopyWith<$Res> get schemes;
  $FigmaPalettesCopyWith<$Res> get palettes;
}

/// @nodoc
class _$FigmaCopyWithImpl<$Res> implements $FigmaCopyWith<$Res> {
  _$FigmaCopyWithImpl(this._self, this._then);

  final Figma _self;
  final $Res Function(Figma) _then;

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? seed = null,
    Object? coreColors = null,
    Object? extendedColors = null,
    Object? schemes = null,
    Object? palettes = null,
  }) {
    return _then(
      _self.copyWith(
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        seed: null == seed
            ? _self.seed
            : seed // ignore: cast_nullable_to_non_nullable
                  as Color,
        coreColors: null == coreColors
            ? _self.coreColors
            : coreColors // ignore: cast_nullable_to_non_nullable
                  as FigmaCoreColors,
        extendedColors: null == extendedColors
            ? _self.extendedColors
            : extendedColors // ignore: cast_nullable_to_non_nullable
                  as List<FigmaExtendedColor>,
        schemes: null == schemes
            ? _self.schemes
            : schemes // ignore: cast_nullable_to_non_nullable
                  as FigmaSchemes,
        palettes: null == palettes
            ? _self.palettes
            : palettes // ignore: cast_nullable_to_non_nullable
                  as FigmaPalettes,
      ),
    );
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaCoreColorsCopyWith<$Res> get coreColors {
    return $FigmaCoreColorsCopyWith<$Res>(_self.coreColors, (value) {
      return _then(_self.copyWith(coreColors: value));
    });
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemesCopyWith<$Res> get schemes {
    return $FigmaSchemesCopyWith<$Res>(_self.schemes, (value) {
      return _then(_self.copyWith(schemes: value));
    });
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPalettesCopyWith<$Res> get palettes {
    return $FigmaPalettesCopyWith<$Res>(_self.palettes, (value) {
      return _then(_self.copyWith(palettes: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Figma implements Figma {
  const _Figma({
    this.description = "",
    @ColorConverter() required this.seed,
    required this.coreColors,
    final List<FigmaExtendedColor> extendedColors = const [],
    required this.schemes,
    required this.palettes,
  }) : _extendedColors = extendedColors;
  factory _Figma.fromJson(Map<String, dynamic> json) => _$FigmaFromJson(json);

  @override
  @JsonKey()
  final String description;
  @override
  @ColorConverter()
  final Color seed;
  @override
  final FigmaCoreColors coreColors;
  final List<FigmaExtendedColor> _extendedColors;
  @override
  @JsonKey()
  List<FigmaExtendedColor> get extendedColors {
    if (_extendedColors is EqualUnmodifiableListView) return _extendedColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extendedColors);
  }

  @override
  final FigmaSchemes schemes;
  @override
  final FigmaPalettes palettes;

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaCopyWith<_Figma> get copyWith =>
      __$FigmaCopyWithImpl<_Figma>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Figma &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.coreColors, coreColors) ||
                other.coreColors == coreColors) &&
            const DeepCollectionEquality().equals(
              other._extendedColors,
              _extendedColors,
            ) &&
            (identical(other.schemes, schemes) || other.schemes == schemes) &&
            (identical(other.palettes, palettes) ||
                other.palettes == palettes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    seed,
    coreColors,
    const DeepCollectionEquality().hash(_extendedColors),
    schemes,
    palettes,
  );

  @override
  String toString() {
    return 'Figma(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes, palettes: $palettes)';
  }
}

/// @nodoc
abstract mixin class _$FigmaCopyWith<$Res> implements $FigmaCopyWith<$Res> {
  factory _$FigmaCopyWith(_Figma value, $Res Function(_Figma) _then) =
      __$FigmaCopyWithImpl;
  @override
  @useResult
  $Res call({
    String description,
    @ColorConverter() Color seed,
    FigmaCoreColors coreColors,
    List<FigmaExtendedColor> extendedColors,
    FigmaSchemes schemes,
    FigmaPalettes palettes,
  });

  @override
  $FigmaCoreColorsCopyWith<$Res> get coreColors;
  @override
  $FigmaSchemesCopyWith<$Res> get schemes;
  @override
  $FigmaPalettesCopyWith<$Res> get palettes;
}

/// @nodoc
class __$FigmaCopyWithImpl<$Res> implements _$FigmaCopyWith<$Res> {
  __$FigmaCopyWithImpl(this._self, this._then);

  final _Figma _self;
  final $Res Function(_Figma) _then;

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? seed = null,
    Object? coreColors = null,
    Object? extendedColors = null,
    Object? schemes = null,
    Object? palettes = null,
  }) {
    return _then(
      _Figma(
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        seed: null == seed
            ? _self.seed
            : seed // ignore: cast_nullable_to_non_nullable
                  as Color,
        coreColors: null == coreColors
            ? _self.coreColors
            : coreColors // ignore: cast_nullable_to_non_nullable
                  as FigmaCoreColors,
        extendedColors: null == extendedColors
            ? _self._extendedColors
            : extendedColors // ignore: cast_nullable_to_non_nullable
                  as List<FigmaExtendedColor>,
        schemes: null == schemes
            ? _self.schemes
            : schemes // ignore: cast_nullable_to_non_nullable
                  as FigmaSchemes,
        palettes: null == palettes
            ? _self.palettes
            : palettes // ignore: cast_nullable_to_non_nullable
                  as FigmaPalettes,
      ),
    );
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaCoreColorsCopyWith<$Res> get coreColors {
    return $FigmaCoreColorsCopyWith<$Res>(_self.coreColors, (value) {
      return _then(_self.copyWith(coreColors: value));
    });
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemesCopyWith<$Res> get schemes {
    return $FigmaSchemesCopyWith<$Res>(_self.schemes, (value) {
      return _then(_self.copyWith(schemes: value));
    });
  }

  /// Create a copy of Figma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPalettesCopyWith<$Res> get palettes {
    return $FigmaPalettesCopyWith<$Res>(_self.palettes, (value) {
      return _then(_self.copyWith(palettes: value));
    });
  }
}

/// @nodoc
mixin _$FigmaCoreColors {
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutral;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutralVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get error;

  /// Create a copy of FigmaCoreColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaCoreColorsCopyWith<FigmaCoreColors> get copyWith =>
      _$FigmaCoreColorsCopyWithImpl<FigmaCoreColors>(
        this as FigmaCoreColors,
        _$identity,
      );

  /// Serializes this FigmaCoreColors to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaCoreColors &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.neutralVariant, neutralVariant) ||
                other.neutralVariant == neutralVariant) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    tertiary,
    neutral,
    neutralVariant,
    error,
  );

  @override
  String toString() {
    return 'FigmaCoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class $FigmaCoreColorsCopyWith<$Res> {
  factory $FigmaCoreColorsCopyWith(
    FigmaCoreColors value,
    $Res Function(FigmaCoreColors) _then,
  ) = _$FigmaCoreColorsCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutral,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutralVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
  });
}

/// @nodoc
class _$FigmaCoreColorsCopyWithImpl<$Res>
    implements $FigmaCoreColorsCopyWith<$Res> {
  _$FigmaCoreColorsCopyWithImpl(this._self, this._then);

  final FigmaCoreColors _self;
  final $Res Function(FigmaCoreColors) _then;

  /// Create a copy of FigmaCoreColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
    Object? neutral = freezed,
    Object? neutralVariant = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _FigmaCoreColors implements FigmaCoreColors {
  const _FigmaCoreColors({
    @JsonKey(includeIfNull: false) @ColorConverter() this.primary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.neutral,
    @JsonKey(includeIfNull: false) @ColorConverter() this.neutralVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.error,
  });
  factory _FigmaCoreColors.fromJson(Map<String, dynamic> json) =>
      _$FigmaCoreColorsFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutral;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutralVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? error;

  /// Create a copy of FigmaCoreColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaCoreColorsCopyWith<_FigmaCoreColors> get copyWith =>
      __$FigmaCoreColorsCopyWithImpl<_FigmaCoreColors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaCoreColorsToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaCoreColors &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.neutralVariant, neutralVariant) ||
                other.neutralVariant == neutralVariant) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    tertiary,
    neutral,
    neutralVariant,
    error,
  );

  @override
  String toString() {
    return 'FigmaCoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FigmaCoreColorsCopyWith<$Res>
    implements $FigmaCoreColorsCopyWith<$Res> {
  factory _$FigmaCoreColorsCopyWith(
    _FigmaCoreColors value,
    $Res Function(_FigmaCoreColors) _then,
  ) = __$FigmaCoreColorsCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutral,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutralVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
  });
}

/// @nodoc
class __$FigmaCoreColorsCopyWithImpl<$Res>
    implements _$FigmaCoreColorsCopyWith<$Res> {
  __$FigmaCoreColorsCopyWithImpl(this._self, this._then);

  final _FigmaCoreColors _self;
  final $Res Function(_FigmaCoreColors) _then;

  /// Create a copy of FigmaCoreColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
    Object? neutral = freezed,
    Object? neutralVariant = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _FigmaCoreColors(
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc
mixin _$FigmaExtendedColor {
  String get name;
  @ColorConverter()
  Color get color;
  String get description;
  bool get harmonized;

  /// Create a copy of FigmaExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaExtendedColorCopyWith<FigmaExtendedColor> get copyWith =>
      _$FigmaExtendedColorCopyWithImpl<FigmaExtendedColor>(
        this as FigmaExtendedColor,
        _$identity,
      );

  /// Serializes this FigmaExtendedColor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaExtendedColor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.harmonized, harmonized) ||
                other.harmonized == harmonized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, color, description, harmonized);

  @override
  String toString() {
    return 'FigmaExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
  }
}

/// @nodoc
abstract mixin class $FigmaExtendedColorCopyWith<$Res> {
  factory $FigmaExtendedColorCopyWith(
    FigmaExtendedColor value,
    $Res Function(FigmaExtendedColor) _then,
  ) = _$FigmaExtendedColorCopyWithImpl;
  @useResult
  $Res call({
    String name,
    @ColorConverter() Color color,
    String description,
    bool harmonized,
  });
}

/// @nodoc
class _$FigmaExtendedColorCopyWithImpl<$Res>
    implements $FigmaExtendedColorCopyWith<$Res> {
  _$FigmaExtendedColorCopyWithImpl(this._self, this._then);

  final FigmaExtendedColor _self;
  final $Res Function(FigmaExtendedColor) _then;

  /// Create a copy of FigmaExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? description = null,
    Object? harmonized = null,
  }) {
    return _then(
      _self.copyWith(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _self.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        harmonized: null == harmonized
            ? _self.harmonized
            : harmonized // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _FigmaExtendedColor implements FigmaExtendedColor {
  const _FigmaExtendedColor({
    required this.name,
    @ColorConverter() required this.color,
    this.description = "",
    this.harmonized = false,
  });
  factory _FigmaExtendedColor.fromJson(Map<String, dynamic> json) =>
      _$FigmaExtendedColorFromJson(json);

  @override
  final String name;
  @override
  @ColorConverter()
  final Color color;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool harmonized;

  /// Create a copy of FigmaExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaExtendedColorCopyWith<_FigmaExtendedColor> get copyWith =>
      __$FigmaExtendedColorCopyWithImpl<_FigmaExtendedColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaExtendedColorToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaExtendedColor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.harmonized, harmonized) ||
                other.harmonized == harmonized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, color, description, harmonized);

  @override
  String toString() {
    return 'FigmaExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
  }
}

/// @nodoc
abstract mixin class _$FigmaExtendedColorCopyWith<$Res>
    implements $FigmaExtendedColorCopyWith<$Res> {
  factory _$FigmaExtendedColorCopyWith(
    _FigmaExtendedColor value,
    $Res Function(_FigmaExtendedColor) _then,
  ) = __$FigmaExtendedColorCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    @ColorConverter() Color color,
    String description,
    bool harmonized,
  });
}

/// @nodoc
class __$FigmaExtendedColorCopyWithImpl<$Res>
    implements _$FigmaExtendedColorCopyWith<$Res> {
  __$FigmaExtendedColorCopyWithImpl(this._self, this._then);

  final _FigmaExtendedColor _self;
  final $Res Function(_FigmaExtendedColor) _then;

  /// Create a copy of FigmaExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? description = null,
    Object? harmonized = null,
  }) {
    return _then(
      _FigmaExtendedColor(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _self.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        harmonized: null == harmonized
            ? _self.harmonized
            : harmonized // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$FigmaSchemes {
  FigmaScheme get light;
  FigmaScheme get lightMediumContrast;
  FigmaScheme get lightHighContrast;
  FigmaScheme get dark;
  FigmaScheme get darkMediumContrast;
  FigmaScheme get darkHighContrast;

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaSchemesCopyWith<FigmaSchemes> get copyWith =>
      _$FigmaSchemesCopyWithImpl<FigmaSchemes>(
        this as FigmaSchemes,
        _$identity,
      );

  /// Serializes this FigmaSchemes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaSchemes &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.lightMediumContrast, lightMediumContrast) ||
                other.lightMediumContrast == lightMediumContrast) &&
            (identical(other.lightHighContrast, lightHighContrast) ||
                other.lightHighContrast == lightHighContrast) &&
            (identical(other.dark, dark) || other.dark == dark) &&
            (identical(other.darkMediumContrast, darkMediumContrast) ||
                other.darkMediumContrast == darkMediumContrast) &&
            (identical(other.darkHighContrast, darkHighContrast) ||
                other.darkHighContrast == darkHighContrast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    light,
    lightMediumContrast,
    lightHighContrast,
    dark,
    darkMediumContrast,
    darkHighContrast,
  );

  @override
  String toString() {
    return 'FigmaSchemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
  }
}

/// @nodoc
abstract mixin class $FigmaSchemesCopyWith<$Res> {
  factory $FigmaSchemesCopyWith(
    FigmaSchemes value,
    $Res Function(FigmaSchemes) _then,
  ) = _$FigmaSchemesCopyWithImpl;
  @useResult
  $Res call({
    FigmaScheme light,
    FigmaScheme lightMediumContrast,
    FigmaScheme lightHighContrast,
    FigmaScheme dark,
    FigmaScheme darkMediumContrast,
    FigmaScheme darkHighContrast,
  });

  $FigmaSchemeCopyWith<$Res> get light;
  $FigmaSchemeCopyWith<$Res> get lightMediumContrast;
  $FigmaSchemeCopyWith<$Res> get lightHighContrast;
  $FigmaSchemeCopyWith<$Res> get dark;
  $FigmaSchemeCopyWith<$Res> get darkMediumContrast;
  $FigmaSchemeCopyWith<$Res> get darkHighContrast;
}

/// @nodoc
class _$FigmaSchemesCopyWithImpl<$Res> implements $FigmaSchemesCopyWith<$Res> {
  _$FigmaSchemesCopyWithImpl(this._self, this._then);

  final FigmaSchemes _self;
  final $Res Function(FigmaSchemes) _then;

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = null,
    Object? lightMediumContrast = null,
    Object? lightHighContrast = null,
    Object? dark = null,
    Object? darkMediumContrast = null,
    Object? darkHighContrast = null,
  }) {
    return _then(
      _self.copyWith(
        light: null == light
            ? _self.light
            : light // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        lightMediumContrast: null == lightMediumContrast
            ? _self.lightMediumContrast
            : lightMediumContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        lightHighContrast: null == lightHighContrast
            ? _self.lightHighContrast
            : lightHighContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        dark: null == dark
            ? _self.dark
            : dark // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        darkMediumContrast: null == darkMediumContrast
            ? _self.darkMediumContrast
            : darkMediumContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        darkHighContrast: null == darkHighContrast
            ? _self.darkHighContrast
            : darkHighContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
      ),
    );
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get light {
    return $FigmaSchemeCopyWith<$Res>(_self.light, (value) {
      return _then(_self.copyWith(light: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get lightMediumContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
      return _then(_self.copyWith(lightMediumContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get lightHighContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
      return _then(_self.copyWith(lightHighContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get dark {
    return $FigmaSchemeCopyWith<$Res>(_self.dark, (value) {
      return _then(_self.copyWith(dark: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get darkMediumContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
      return _then(_self.copyWith(darkMediumContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get darkHighContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
      return _then(_self.copyWith(darkHighContrast: value));
    });
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _FigmaSchemes implements FigmaSchemes {
  const _FigmaSchemes({
    required this.light,
    required this.lightMediumContrast,
    required this.lightHighContrast,
    required this.dark,
    required this.darkMediumContrast,
    required this.darkHighContrast,
  });
  factory _FigmaSchemes.fromJson(Map<String, dynamic> json) =>
      _$FigmaSchemesFromJson(json);

  @override
  final FigmaScheme light;
  @override
  final FigmaScheme lightMediumContrast;
  @override
  final FigmaScheme lightHighContrast;
  @override
  final FigmaScheme dark;
  @override
  final FigmaScheme darkMediumContrast;
  @override
  final FigmaScheme darkHighContrast;

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaSchemesCopyWith<_FigmaSchemes> get copyWith =>
      __$FigmaSchemesCopyWithImpl<_FigmaSchemes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaSchemesToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaSchemes &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.lightMediumContrast, lightMediumContrast) ||
                other.lightMediumContrast == lightMediumContrast) &&
            (identical(other.lightHighContrast, lightHighContrast) ||
                other.lightHighContrast == lightHighContrast) &&
            (identical(other.dark, dark) || other.dark == dark) &&
            (identical(other.darkMediumContrast, darkMediumContrast) ||
                other.darkMediumContrast == darkMediumContrast) &&
            (identical(other.darkHighContrast, darkHighContrast) ||
                other.darkHighContrast == darkHighContrast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    light,
    lightMediumContrast,
    lightHighContrast,
    dark,
    darkMediumContrast,
    darkHighContrast,
  );

  @override
  String toString() {
    return 'FigmaSchemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
  }
}

/// @nodoc
abstract mixin class _$FigmaSchemesCopyWith<$Res>
    implements $FigmaSchemesCopyWith<$Res> {
  factory _$FigmaSchemesCopyWith(
    _FigmaSchemes value,
    $Res Function(_FigmaSchemes) _then,
  ) = __$FigmaSchemesCopyWithImpl;
  @override
  @useResult
  $Res call({
    FigmaScheme light,
    FigmaScheme lightMediumContrast,
    FigmaScheme lightHighContrast,
    FigmaScheme dark,
    FigmaScheme darkMediumContrast,
    FigmaScheme darkHighContrast,
  });

  @override
  $FigmaSchemeCopyWith<$Res> get light;
  @override
  $FigmaSchemeCopyWith<$Res> get lightMediumContrast;
  @override
  $FigmaSchemeCopyWith<$Res> get lightHighContrast;
  @override
  $FigmaSchemeCopyWith<$Res> get dark;
  @override
  $FigmaSchemeCopyWith<$Res> get darkMediumContrast;
  @override
  $FigmaSchemeCopyWith<$Res> get darkHighContrast;
}

/// @nodoc
class __$FigmaSchemesCopyWithImpl<$Res>
    implements _$FigmaSchemesCopyWith<$Res> {
  __$FigmaSchemesCopyWithImpl(this._self, this._then);

  final _FigmaSchemes _self;
  final $Res Function(_FigmaSchemes) _then;

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? light = null,
    Object? lightMediumContrast = null,
    Object? lightHighContrast = null,
    Object? dark = null,
    Object? darkMediumContrast = null,
    Object? darkHighContrast = null,
  }) {
    return _then(
      _FigmaSchemes(
        light: null == light
            ? _self.light
            : light // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        lightMediumContrast: null == lightMediumContrast
            ? _self.lightMediumContrast
            : lightMediumContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        lightHighContrast: null == lightHighContrast
            ? _self.lightHighContrast
            : lightHighContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        dark: null == dark
            ? _self.dark
            : dark // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        darkMediumContrast: null == darkMediumContrast
            ? _self.darkMediumContrast
            : darkMediumContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
        darkHighContrast: null == darkHighContrast
            ? _self.darkHighContrast
            : darkHighContrast // ignore: cast_nullable_to_non_nullable
                  as FigmaScheme,
      ),
    );
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get light {
    return $FigmaSchemeCopyWith<$Res>(_self.light, (value) {
      return _then(_self.copyWith(light: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get lightMediumContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
      return _then(_self.copyWith(lightMediumContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get lightHighContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
      return _then(_self.copyWith(lightHighContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get dark {
    return $FigmaSchemeCopyWith<$Res>(_self.dark, (value) {
      return _then(_self.copyWith(dark: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get darkMediumContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
      return _then(_self.copyWith(darkMediumContrast: value));
    });
  }

  /// Create a copy of FigmaSchemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<$Res> get darkHighContrast {
    return $FigmaSchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
      return _then(_self.copyWith(darkHighContrast: value));
    });
  }
}

/// @nodoc
mixin _$FigmaScheme {
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutralPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutralVariantPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get errorPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get background;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onBackground;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surface;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceBright;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceContainerLowest;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceContainerLow;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceContainerHigh;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceContainerHighest;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSurface;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSurfaceVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get outline;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get outlineVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get inverseSurface;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get inverseOnSurface;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get shadow;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get scrim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get surfaceTint;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onPrimary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onPrimaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryFixedDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onPrimaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onPrimaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get inversePrimary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSecondary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSecondaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryFixedDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSecondaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onSecondaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onTertiary;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onTertiaryContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryFixedDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onTertiaryFixed;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onTertiaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get error;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get errorDim;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onError;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get errorContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onErrorContainer;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get controlActivated;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get controlNormal;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get controlHighlight;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get textPrimaryInverse;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get textSecondaryAndTertiaryInverse;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get textPrimaryInverseDisableOnly;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get textSecondaryAndTertiaryInverseDisabled;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get textHintInverse;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get widgetBackground;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get clockHour;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get clockMinute;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get clockSecond;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get weatherTemp;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get themeApp;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onThemeApp;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get themeAppRing;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get themeNotif;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get brandA;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get brandB;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get brandC;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get brandD;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get underSurface;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get shadeActive;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onShadeActive;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onShadeActiveVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get shadeInactive;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onShadeInactive;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get onShadeInactiveVariant;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get shadeDisabled;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get overviewBackground;

  /// Create a copy of FigmaScheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaSchemeCopyWith<FigmaScheme> get copyWith =>
      _$FigmaSchemeCopyWithImpl<FigmaScheme>(this as FigmaScheme, _$identity);

  /// Serializes this FigmaScheme to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaScheme &&
            (identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) ||
                other.primaryPaletteKeyColor == primaryPaletteKeyColor) &&
            (identical(
                  other.secondaryPaletteKeyColor,
                  secondaryPaletteKeyColor,
                ) ||
                other.secondaryPaletteKeyColor == secondaryPaletteKeyColor) &&
            (identical(
                  other.tertiaryPaletteKeyColor,
                  tertiaryPaletteKeyColor,
                ) ||
                other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor) &&
            (identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) ||
                other.neutralPaletteKeyColor == neutralPaletteKeyColor) &&
            (identical(
                  other.neutralVariantPaletteKeyColor,
                  neutralVariantPaletteKeyColor,
                ) ||
                other.neutralVariantPaletteKeyColor ==
                    neutralVariantPaletteKeyColor) &&
            (identical(other.errorPaletteKeyColor, errorPaletteKeyColor) ||
                other.errorPaletteKeyColor == errorPaletteKeyColor) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.onBackground, onBackground) ||
                other.onBackground == onBackground) &&
            (identical(other.surface, surface) || other.surface == surface) &&
            (identical(other.surfaceDim, surfaceDim) ||
                other.surfaceDim == surfaceDim) &&
            (identical(other.surfaceBright, surfaceBright) ||
                other.surfaceBright == surfaceBright) &&
            (identical(other.surfaceContainerLowest, surfaceContainerLowest) ||
                other.surfaceContainerLowest == surfaceContainerLowest) &&
            (identical(other.surfaceContainerLow, surfaceContainerLow) ||
                other.surfaceContainerLow == surfaceContainerLow) &&
            (identical(other.surfaceContainer, surfaceContainer) ||
                other.surfaceContainer == surfaceContainer) &&
            (identical(other.surfaceContainerHigh, surfaceContainerHigh) ||
                other.surfaceContainerHigh == surfaceContainerHigh) &&
            (identical(
                  other.surfaceContainerHighest,
                  surfaceContainerHighest,
                ) ||
                other.surfaceContainerHighest == surfaceContainerHighest) &&
            (identical(other.onSurface, onSurface) ||
                other.onSurface == onSurface) &&
            (identical(other.surfaceVariant, surfaceVariant) ||
                other.surfaceVariant == surfaceVariant) &&
            (identical(other.onSurfaceVariant, onSurfaceVariant) ||
                other.onSurfaceVariant == onSurfaceVariant) &&
            (identical(other.outline, outline) || other.outline == outline) &&
            (identical(other.outlineVariant, outlineVariant) ||
                other.outlineVariant == outlineVariant) &&
            (identical(other.inverseSurface, inverseSurface) ||
                other.inverseSurface == inverseSurface) &&
            (identical(other.inverseOnSurface, inverseOnSurface) ||
                other.inverseOnSurface == inverseOnSurface) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.scrim, scrim) || other.scrim == scrim) &&
            (identical(other.surfaceTint, surfaceTint) ||
                other.surfaceTint == surfaceTint) &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.primaryDim, primaryDim) ||
                other.primaryDim == primaryDim) &&
            (identical(other.onPrimary, onPrimary) ||
                other.onPrimary == onPrimary) &&
            (identical(other.primaryContainer, primaryContainer) ||
                other.primaryContainer == primaryContainer) &&
            (identical(other.onPrimaryContainer, onPrimaryContainer) ||
                other.onPrimaryContainer == onPrimaryContainer) &&
            (identical(other.primaryFixed, primaryFixed) ||
                other.primaryFixed == primaryFixed) &&
            (identical(other.primaryFixedDim, primaryFixedDim) ||
                other.primaryFixedDim == primaryFixedDim) &&
            (identical(other.onPrimaryFixed, onPrimaryFixed) ||
                other.onPrimaryFixed == onPrimaryFixed) &&
            (identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) ||
                other.onPrimaryFixedVariant == onPrimaryFixedVariant) &&
            (identical(other.inversePrimary, inversePrimary) ||
                other.inversePrimary == inversePrimary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.secondaryDim, secondaryDim) ||
                other.secondaryDim == secondaryDim) &&
            (identical(other.onSecondary, onSecondary) ||
                other.onSecondary == onSecondary) &&
            (identical(other.secondaryContainer, secondaryContainer) ||
                other.secondaryContainer == secondaryContainer) &&
            (identical(other.onSecondaryContainer, onSecondaryContainer) ||
                other.onSecondaryContainer == onSecondaryContainer) &&
            (identical(other.secondaryFixed, secondaryFixed) ||
                other.secondaryFixed == secondaryFixed) &&
            (identical(other.secondaryFixedDim, secondaryFixedDim) ||
                other.secondaryFixedDim == secondaryFixedDim) &&
            (identical(other.onSecondaryFixed, onSecondaryFixed) ||
                other.onSecondaryFixed == onSecondaryFixed) &&
            (identical(
                  other.onSecondaryFixedVariant,
                  onSecondaryFixedVariant,
                ) ||
                other.onSecondaryFixedVariant == onSecondaryFixedVariant) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.tertiaryDim, tertiaryDim) ||
                other.tertiaryDim == tertiaryDim) &&
            (identical(other.onTertiary, onTertiary) ||
                other.onTertiary == onTertiary) &&
            (identical(other.tertiaryContainer, tertiaryContainer) ||
                other.tertiaryContainer == tertiaryContainer) &&
            (identical(other.onTertiaryContainer, onTertiaryContainer) ||
                other.onTertiaryContainer == onTertiaryContainer) &&
            (identical(other.tertiaryFixed, tertiaryFixed) ||
                other.tertiaryFixed == tertiaryFixed) &&
            (identical(other.tertiaryFixedDim, tertiaryFixedDim) ||
                other.tertiaryFixedDim == tertiaryFixedDim) &&
            (identical(other.onTertiaryFixed, onTertiaryFixed) ||
                other.onTertiaryFixed == onTertiaryFixed) &&
            (identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) ||
                other.onTertiaryFixedVariant == onTertiaryFixedVariant) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorDim, errorDim) ||
                other.errorDim == errorDim) &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.errorContainer, errorContainer) ||
                other.errorContainer == errorContainer) &&
            (identical(other.onErrorContainer, onErrorContainer) ||
                other.onErrorContainer == onErrorContainer) &&
            (identical(other.controlActivated, controlActivated) ||
                other.controlActivated == controlActivated) &&
            (identical(other.controlNormal, controlNormal) ||
                other.controlNormal == controlNormal) &&
            (identical(other.controlHighlight, controlHighlight) ||
                other.controlHighlight == controlHighlight) &&
            (identical(other.textPrimaryInverse, textPrimaryInverse) ||
                other.textPrimaryInverse == textPrimaryInverse) &&
            (identical(
                  other.textSecondaryAndTertiaryInverse,
                  textSecondaryAndTertiaryInverse,
                ) ||
                other.textSecondaryAndTertiaryInverse ==
                    textSecondaryAndTertiaryInverse) &&
            (identical(
                  other.textPrimaryInverseDisableOnly,
                  textPrimaryInverseDisableOnly,
                ) ||
                other.textPrimaryInverseDisableOnly ==
                    textPrimaryInverseDisableOnly) &&
            (identical(
                  other.textSecondaryAndTertiaryInverseDisabled,
                  textSecondaryAndTertiaryInverseDisabled,
                ) ||
                other.textSecondaryAndTertiaryInverseDisabled ==
                    textSecondaryAndTertiaryInverseDisabled) &&
            (identical(other.textHintInverse, textHintInverse) ||
                other.textHintInverse == textHintInverse) &&
            (identical(other.widgetBackground, widgetBackground) ||
                other.widgetBackground == widgetBackground) &&
            (identical(other.clockHour, clockHour) ||
                other.clockHour == clockHour) &&
            (identical(other.clockMinute, clockMinute) ||
                other.clockMinute == clockMinute) &&
            (identical(other.clockSecond, clockSecond) ||
                other.clockSecond == clockSecond) &&
            (identical(other.weatherTemp, weatherTemp) ||
                other.weatherTemp == weatherTemp) &&
            (identical(other.themeApp, themeApp) ||
                other.themeApp == themeApp) &&
            (identical(other.onThemeApp, onThemeApp) ||
                other.onThemeApp == onThemeApp) &&
            (identical(other.themeAppRing, themeAppRing) ||
                other.themeAppRing == themeAppRing) &&
            (identical(other.themeNotif, themeNotif) ||
                other.themeNotif == themeNotif) &&
            (identical(other.brandA, brandA) || other.brandA == brandA) &&
            (identical(other.brandB, brandB) || other.brandB == brandB) &&
            (identical(other.brandC, brandC) || other.brandC == brandC) &&
            (identical(other.brandD, brandD) || other.brandD == brandD) &&
            (identical(other.underSurface, underSurface) ||
                other.underSurface == underSurface) &&
            (identical(other.shadeActive, shadeActive) ||
                other.shadeActive == shadeActive) &&
            (identical(other.onShadeActive, onShadeActive) ||
                other.onShadeActive == onShadeActive) &&
            (identical(other.onShadeActiveVariant, onShadeActiveVariant) ||
                other.onShadeActiveVariant == onShadeActiveVariant) &&
            (identical(other.shadeInactive, shadeInactive) ||
                other.shadeInactive == shadeInactive) &&
            (identical(other.onShadeInactive, onShadeInactive) ||
                other.onShadeInactive == onShadeInactive) &&
            (identical(other.onShadeInactiveVariant, onShadeInactiveVariant) ||
                other.onShadeInactiveVariant == onShadeInactiveVariant) &&
            (identical(other.shadeDisabled, shadeDisabled) ||
                other.shadeDisabled == shadeDisabled) &&
            (identical(other.overviewBackground, overviewBackground) ||
                other.overviewBackground == overviewBackground));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
    background,
    onBackground,
    surface,
    surfaceDim,
    surfaceBright,
    surfaceContainerLowest,
    surfaceContainerLow,
    surfaceContainer,
    surfaceContainerHigh,
    surfaceContainerHighest,
    onSurface,
    surfaceVariant,
    onSurfaceVariant,
    outline,
    outlineVariant,
    inverseSurface,
    inverseOnSurface,
    shadow,
    scrim,
    surfaceTint,
    primary,
    primaryDim,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    inversePrimary,
    secondary,
    secondaryDim,
    onSecondary,
    secondaryContainer,
    onSecondaryContainer,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiary,
    tertiaryDim,
    onTertiary,
    tertiaryContainer,
    onTertiaryContainer,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    error,
    errorDim,
    onError,
    errorContainer,
    onErrorContainer,
    controlActivated,
    controlNormal,
    controlHighlight,
    textPrimaryInverse,
    textSecondaryAndTertiaryInverse,
    textPrimaryInverseDisableOnly,
    textSecondaryAndTertiaryInverseDisabled,
    textHintInverse,
    widgetBackground,
    clockHour,
    clockMinute,
    clockSecond,
    weatherTemp,
    themeApp,
    onThemeApp,
    themeAppRing,
    themeNotif,
    brandA,
    brandB,
    brandC,
    brandD,
    underSurface,
    shadeActive,
    onShadeActive,
    onShadeActiveVariant,
    shadeInactive,
    onShadeInactive,
    onShadeInactiveVariant,
    shadeDisabled,
    overviewBackground,
  ]);

  @override
  String toString() {
    return 'FigmaScheme(primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor, background: $background, onBackground: $onBackground, surface: $surface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint, primary: $primary, primaryDim: $primaryDim, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, inversePrimary: $inversePrimary, secondary: $secondary, secondaryDim: $secondaryDim, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, tertiaryDim: $tertiaryDim, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, errorDim: $errorDim, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, controlActivated: $controlActivated, controlNormal: $controlNormal, controlHighlight: $controlHighlight, textPrimaryInverse: $textPrimaryInverse, textSecondaryAndTertiaryInverse: $textSecondaryAndTertiaryInverse, textPrimaryInverseDisableOnly: $textPrimaryInverseDisableOnly, textSecondaryAndTertiaryInverseDisabled: $textSecondaryAndTertiaryInverseDisabled, textHintInverse: $textHintInverse, widgetBackground: $widgetBackground, clockHour: $clockHour, clockMinute: $clockMinute, clockSecond: $clockSecond, weatherTemp: $weatherTemp, themeApp: $themeApp, onThemeApp: $onThemeApp, themeAppRing: $themeAppRing, themeNotif: $themeNotif, brandA: $brandA, brandB: $brandB, brandC: $brandC, brandD: $brandD, underSurface: $underSurface, shadeActive: $shadeActive, onShadeActive: $onShadeActive, onShadeActiveVariant: $onShadeActiveVariant, shadeInactive: $shadeInactive, onShadeInactive: $onShadeInactive, onShadeInactiveVariant: $onShadeInactiveVariant, shadeDisabled: $shadeDisabled, overviewBackground: $overviewBackground)';
  }
}

/// @nodoc
abstract mixin class $FigmaSchemeCopyWith<$Res> {
  factory $FigmaSchemeCopyWith(
    FigmaScheme value,
    $Res Function(FigmaScheme) _then,
  ) = _$FigmaSchemeCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? background,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceBright,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerLowest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outline,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outlineVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseOnSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? scrim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceTint,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inversePrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onError,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onErrorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlActivated,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlNormal,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlHighlight,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textHintInverse,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? widgetBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockHour,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockMinute,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockSecond,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? weatherTemp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onThemeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeAppRing,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeNotif,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandA,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandB,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandC,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandD,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? underSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeActive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeActive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeInactive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? overviewBackground,
  });
}

/// @nodoc
class _$FigmaSchemeCopyWithImpl<$Res> implements $FigmaSchemeCopyWith<$Res> {
  _$FigmaSchemeCopyWithImpl(this._self, this._then);

  final FigmaScheme _self;
  final $Res Function(FigmaScheme) _then;

  /// Create a copy of FigmaScheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryPaletteKeyColor = freezed,
    Object? secondaryPaletteKeyColor = freezed,
    Object? tertiaryPaletteKeyColor = freezed,
    Object? neutralPaletteKeyColor = freezed,
    Object? neutralVariantPaletteKeyColor = freezed,
    Object? errorPaletteKeyColor = freezed,
    Object? background = freezed,
    Object? onBackground = freezed,
    Object? surface = freezed,
    Object? surfaceDim = freezed,
    Object? surfaceBright = freezed,
    Object? surfaceContainerLowest = freezed,
    Object? surfaceContainerLow = freezed,
    Object? surfaceContainer = freezed,
    Object? surfaceContainerHigh = freezed,
    Object? surfaceContainerHighest = freezed,
    Object? onSurface = freezed,
    Object? surfaceVariant = freezed,
    Object? onSurfaceVariant = freezed,
    Object? outline = freezed,
    Object? outlineVariant = freezed,
    Object? inverseSurface = freezed,
    Object? inverseOnSurface = freezed,
    Object? shadow = freezed,
    Object? scrim = freezed,
    Object? surfaceTint = freezed,
    Object? primary = freezed,
    Object? primaryDim = freezed,
    Object? onPrimary = freezed,
    Object? primaryContainer = freezed,
    Object? onPrimaryContainer = freezed,
    Object? primaryFixed = freezed,
    Object? primaryFixedDim = freezed,
    Object? onPrimaryFixed = freezed,
    Object? onPrimaryFixedVariant = freezed,
    Object? inversePrimary = freezed,
    Object? secondary = freezed,
    Object? secondaryDim = freezed,
    Object? onSecondary = freezed,
    Object? secondaryContainer = freezed,
    Object? onSecondaryContainer = freezed,
    Object? secondaryFixed = freezed,
    Object? secondaryFixedDim = freezed,
    Object? onSecondaryFixed = freezed,
    Object? onSecondaryFixedVariant = freezed,
    Object? tertiary = freezed,
    Object? tertiaryDim = freezed,
    Object? onTertiary = freezed,
    Object? tertiaryContainer = freezed,
    Object? onTertiaryContainer = freezed,
    Object? tertiaryFixed = freezed,
    Object? tertiaryFixedDim = freezed,
    Object? onTertiaryFixed = freezed,
    Object? onTertiaryFixedVariant = freezed,
    Object? error = freezed,
    Object? errorDim = freezed,
    Object? onError = freezed,
    Object? errorContainer = freezed,
    Object? onErrorContainer = freezed,
    Object? controlActivated = freezed,
    Object? controlNormal = freezed,
    Object? controlHighlight = freezed,
    Object? textPrimaryInverse = freezed,
    Object? textSecondaryAndTertiaryInverse = freezed,
    Object? textPrimaryInverseDisableOnly = freezed,
    Object? textSecondaryAndTertiaryInverseDisabled = freezed,
    Object? textHintInverse = freezed,
    Object? widgetBackground = freezed,
    Object? clockHour = freezed,
    Object? clockMinute = freezed,
    Object? clockSecond = freezed,
    Object? weatherTemp = freezed,
    Object? themeApp = freezed,
    Object? onThemeApp = freezed,
    Object? themeAppRing = freezed,
    Object? themeNotif = freezed,
    Object? brandA = freezed,
    Object? brandB = freezed,
    Object? brandC = freezed,
    Object? brandD = freezed,
    Object? underSurface = freezed,
    Object? shadeActive = freezed,
    Object? onShadeActive = freezed,
    Object? onShadeActiveVariant = freezed,
    Object? shadeInactive = freezed,
    Object? onShadeInactive = freezed,
    Object? onShadeInactiveVariant = freezed,
    Object? shadeDisabled = freezed,
    Object? overviewBackground = freezed,
  }) {
    return _then(
      _self.copyWith(
        primaryPaletteKeyColor: freezed == primaryPaletteKeyColor
            ? _self.primaryPaletteKeyColor
            : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        background: freezed == background
            ? _self.background
            : background // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onBackground: freezed == onBackground
            ? _self.onBackground
            : onBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surface: freezed == surface
            ? _self.surface
            : surface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceDim: freezed == surfaceDim
            ? _self.surfaceDim
            : surfaceDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceBright: freezed == surfaceBright
            ? _self.surfaceBright
            : surfaceBright // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerLowest: freezed == surfaceContainerLowest
            ? _self.surfaceContainerLowest
            : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerLow: freezed == surfaceContainerLow
            ? _self.surfaceContainerLow
            : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainer: freezed == surfaceContainer
            ? _self.surfaceContainer
            : surfaceContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerHigh: freezed == surfaceContainerHigh
            ? _self.surfaceContainerHigh
            : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerHighest: freezed == surfaceContainerHighest
            ? _self.surfaceContainerHighest
            : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSurface: freezed == onSurface
            ? _self.onSurface
            : onSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceVariant: freezed == surfaceVariant
            ? _self.surfaceVariant
            : surfaceVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSurfaceVariant: freezed == onSurfaceVariant
            ? _self.onSurfaceVariant
            : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        outline: freezed == outline
            ? _self.outline
            : outline // ignore: cast_nullable_to_non_nullable
                  as Color?,
        outlineVariant: freezed == outlineVariant
            ? _self.outlineVariant
            : outlineVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inverseSurface: freezed == inverseSurface
            ? _self.inverseSurface
            : inverseSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inverseOnSurface: freezed == inverseOnSurface
            ? _self.inverseOnSurface
            : inverseOnSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as Color?,
        scrim: freezed == scrim
            ? _self.scrim
            : scrim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceTint: freezed == surfaceTint
            ? _self.surfaceTint
            : surfaceTint // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryDim: freezed == primaryDim
            ? _self.primaryDim
            : primaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimary: freezed == onPrimary
            ? _self.onPrimary
            : onPrimary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryContainer: freezed == primaryContainer
            ? _self.primaryContainer
            : primaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryContainer: freezed == onPrimaryContainer
            ? _self.onPrimaryContainer
            : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryFixed: freezed == primaryFixed
            ? _self.primaryFixed
            : primaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryFixedDim: freezed == primaryFixedDim
            ? _self.primaryFixedDim
            : primaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryFixed: freezed == onPrimaryFixed
            ? _self.onPrimaryFixed
            : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryFixedVariant: freezed == onPrimaryFixedVariant
            ? _self.onPrimaryFixedVariant
            : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inversePrimary: freezed == inversePrimary
            ? _self.inversePrimary
            : inversePrimary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryDim: freezed == secondaryDim
            ? _self.secondaryDim
            : secondaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondary: freezed == onSecondary
            ? _self.onSecondary
            : onSecondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryContainer: freezed == secondaryContainer
            ? _self.secondaryContainer
            : secondaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryContainer: freezed == onSecondaryContainer
            ? _self.onSecondaryContainer
            : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryFixed: freezed == secondaryFixed
            ? _self.secondaryFixed
            : secondaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryFixedDim: freezed == secondaryFixedDim
            ? _self.secondaryFixedDim
            : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryFixed: freezed == onSecondaryFixed
            ? _self.onSecondaryFixed
            : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryFixedVariant: freezed == onSecondaryFixedVariant
            ? _self.onSecondaryFixedVariant
            : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryDim: freezed == tertiaryDim
            ? _self.tertiaryDim
            : tertiaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiary: freezed == onTertiary
            ? _self.onTertiary
            : onTertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryContainer: freezed == tertiaryContainer
            ? _self.tertiaryContainer
            : tertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryContainer: freezed == onTertiaryContainer
            ? _self.onTertiaryContainer
            : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryFixed: freezed == tertiaryFixed
            ? _self.tertiaryFixed
            : tertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryFixedDim: freezed == tertiaryFixedDim
            ? _self.tertiaryFixedDim
            : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryFixed: freezed == onTertiaryFixed
            ? _self.onTertiaryFixed
            : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryFixedVariant: freezed == onTertiaryFixedVariant
            ? _self.onTertiaryFixedVariant
            : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorDim: freezed == errorDim
            ? _self.errorDim
            : errorDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onError: freezed == onError
            ? _self.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorContainer: freezed == errorContainer
            ? _self.errorContainer
            : errorContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onErrorContainer: freezed == onErrorContainer
            ? _self.onErrorContainer
            : onErrorContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlActivated: freezed == controlActivated
            ? _self.controlActivated
            : controlActivated // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlNormal: freezed == controlNormal
            ? _self.controlNormal
            : controlNormal // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlHighlight: freezed == controlHighlight
            ? _self.controlHighlight
            : controlHighlight // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textPrimaryInverse: freezed == textPrimaryInverse
            ? _self.textPrimaryInverse
            : textPrimaryInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textSecondaryAndTertiaryInverse:
            freezed == textSecondaryAndTertiaryInverse
            ? _self.textSecondaryAndTertiaryInverse
            : textSecondaryAndTertiaryInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textPrimaryInverseDisableOnly: freezed == textPrimaryInverseDisableOnly
            ? _self.textPrimaryInverseDisableOnly
            : textPrimaryInverseDisableOnly // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textSecondaryAndTertiaryInverseDisabled:
            freezed == textSecondaryAndTertiaryInverseDisabled
            ? _self.textSecondaryAndTertiaryInverseDisabled
            : textSecondaryAndTertiaryInverseDisabled // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textHintInverse: freezed == textHintInverse
            ? _self.textHintInverse
            : textHintInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        widgetBackground: freezed == widgetBackground
            ? _self.widgetBackground
            : widgetBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockHour: freezed == clockHour
            ? _self.clockHour
            : clockHour // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockMinute: freezed == clockMinute
            ? _self.clockMinute
            : clockMinute // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockSecond: freezed == clockSecond
            ? _self.clockSecond
            : clockSecond // ignore: cast_nullable_to_non_nullable
                  as Color?,
        weatherTemp: freezed == weatherTemp
            ? _self.weatherTemp
            : weatherTemp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeApp: freezed == themeApp
            ? _self.themeApp
            : themeApp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onThemeApp: freezed == onThemeApp
            ? _self.onThemeApp
            : onThemeApp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeAppRing: freezed == themeAppRing
            ? _self.themeAppRing
            : themeAppRing // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeNotif: freezed == themeNotif
            ? _self.themeNotif
            : themeNotif // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandA: freezed == brandA
            ? _self.brandA
            : brandA // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandB: freezed == brandB
            ? _self.brandB
            : brandB // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandC: freezed == brandC
            ? _self.brandC
            : brandC // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandD: freezed == brandD
            ? _self.brandD
            : brandD // ignore: cast_nullable_to_non_nullable
                  as Color?,
        underSurface: freezed == underSurface
            ? _self.underSurface
            : underSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeActive: freezed == shadeActive
            ? _self.shadeActive
            : shadeActive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeActive: freezed == onShadeActive
            ? _self.onShadeActive
            : onShadeActive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeActiveVariant: freezed == onShadeActiveVariant
            ? _self.onShadeActiveVariant
            : onShadeActiveVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeInactive: freezed == shadeInactive
            ? _self.shadeInactive
            : shadeInactive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeInactive: freezed == onShadeInactive
            ? _self.onShadeInactive
            : onShadeInactive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeInactiveVariant: freezed == onShadeInactiveVariant
            ? _self.onShadeInactiveVariant
            : onShadeInactiveVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeDisabled: freezed == shadeDisabled
            ? _self.shadeDisabled
            : shadeDisabled // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overviewBackground: freezed == overviewBackground
            ? _self.overviewBackground
            : overviewBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _FigmaScheme implements FigmaScheme {
  const _FigmaScheme({
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() this.errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() this.background,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surface,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceBright,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.surfaceContainerLowest,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceContainerLow,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onSurfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.outline,
    @JsonKey(includeIfNull: false) @ColorConverter() this.outlineVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.inverseSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() this.inverseOnSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() this.shadow,
    @JsonKey(includeIfNull: false) @ColorConverter() this.scrim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.surfaceTint,
    @JsonKey(includeIfNull: false) @ColorConverter() this.primary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.primaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onPrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.primaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onPrimaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.primaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() this.primaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onPrimaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.inversePrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onSecondary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onSecondaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() this.secondaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onTertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onTertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() this.tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.error,
    @JsonKey(includeIfNull: false) @ColorConverter() this.errorDim,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onError,
    @JsonKey(includeIfNull: false) @ColorConverter() this.errorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onErrorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() this.controlActivated,
    @JsonKey(includeIfNull: false) @ColorConverter() this.controlNormal,
    @JsonKey(includeIfNull: false) @ColorConverter() this.controlHighlight,
    @JsonKey(includeIfNull: false) @ColorConverter() this.textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() this.textHintInverse,
    @JsonKey(includeIfNull: false) @ColorConverter() this.widgetBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() this.clockHour,
    @JsonKey(includeIfNull: false) @ColorConverter() this.clockMinute,
    @JsonKey(includeIfNull: false) @ColorConverter() this.clockSecond,
    @JsonKey(includeIfNull: false) @ColorConverter() this.weatherTemp,
    @JsonKey(includeIfNull: false) @ColorConverter() this.themeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onThemeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() this.themeAppRing,
    @JsonKey(includeIfNull: false) @ColorConverter() this.themeNotif,
    @JsonKey(includeIfNull: false) @ColorConverter() this.brandA,
    @JsonKey(includeIfNull: false) @ColorConverter() this.brandB,
    @JsonKey(includeIfNull: false) @ColorConverter() this.brandC,
    @JsonKey(includeIfNull: false) @ColorConverter() this.brandD,
    @JsonKey(includeIfNull: false) @ColorConverter() this.underSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() this.shadeActive,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onShadeActive,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.shadeInactive,
    @JsonKey(includeIfNull: false) @ColorConverter() this.onShadeInactive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() this.shadeDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() this.overviewBackground,
  });
  factory _FigmaScheme.fromJson(Map<String, dynamic> json) =>
      _$FigmaSchemeFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutralPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutralVariantPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? errorPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? background;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onBackground;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surface;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceBright;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceContainerLowest;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceContainerLow;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceContainerHigh;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceContainerHighest;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSurface;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSurfaceVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? outline;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? outlineVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? inverseSurface;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? inverseOnSurface;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? shadow;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? scrim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? surfaceTint;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onPrimary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onPrimaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onPrimaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onPrimaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? inversePrimary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSecondary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSecondaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSecondaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onSecondaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onTertiary;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onTertiaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onTertiaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onTertiaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? error;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? errorDim;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onError;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? errorContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onErrorContainer;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? controlActivated;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? controlNormal;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? controlHighlight;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? textPrimaryInverse;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? textSecondaryAndTertiaryInverse;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? textPrimaryInverseDisableOnly;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? textSecondaryAndTertiaryInverseDisabled;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? textHintInverse;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? widgetBackground;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? clockHour;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? clockMinute;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? clockSecond;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? weatherTemp;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? themeApp;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onThemeApp;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? themeAppRing;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? themeNotif;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? brandA;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? brandB;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? brandC;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? brandD;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? underSurface;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? shadeActive;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onShadeActive;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onShadeActiveVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? shadeInactive;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onShadeInactive;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? onShadeInactiveVariant;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? shadeDisabled;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? overviewBackground;

  /// Create a copy of FigmaScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaSchemeCopyWith<_FigmaScheme> get copyWith =>
      __$FigmaSchemeCopyWithImpl<_FigmaScheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaSchemeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaScheme &&
            (identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) ||
                other.primaryPaletteKeyColor == primaryPaletteKeyColor) &&
            (identical(
                  other.secondaryPaletteKeyColor,
                  secondaryPaletteKeyColor,
                ) ||
                other.secondaryPaletteKeyColor == secondaryPaletteKeyColor) &&
            (identical(
                  other.tertiaryPaletteKeyColor,
                  tertiaryPaletteKeyColor,
                ) ||
                other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor) &&
            (identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) ||
                other.neutralPaletteKeyColor == neutralPaletteKeyColor) &&
            (identical(
                  other.neutralVariantPaletteKeyColor,
                  neutralVariantPaletteKeyColor,
                ) ||
                other.neutralVariantPaletteKeyColor ==
                    neutralVariantPaletteKeyColor) &&
            (identical(other.errorPaletteKeyColor, errorPaletteKeyColor) ||
                other.errorPaletteKeyColor == errorPaletteKeyColor) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.onBackground, onBackground) ||
                other.onBackground == onBackground) &&
            (identical(other.surface, surface) || other.surface == surface) &&
            (identical(other.surfaceDim, surfaceDim) ||
                other.surfaceDim == surfaceDim) &&
            (identical(other.surfaceBright, surfaceBright) ||
                other.surfaceBright == surfaceBright) &&
            (identical(other.surfaceContainerLowest, surfaceContainerLowest) ||
                other.surfaceContainerLowest == surfaceContainerLowest) &&
            (identical(other.surfaceContainerLow, surfaceContainerLow) ||
                other.surfaceContainerLow == surfaceContainerLow) &&
            (identical(other.surfaceContainer, surfaceContainer) ||
                other.surfaceContainer == surfaceContainer) &&
            (identical(other.surfaceContainerHigh, surfaceContainerHigh) ||
                other.surfaceContainerHigh == surfaceContainerHigh) &&
            (identical(
                  other.surfaceContainerHighest,
                  surfaceContainerHighest,
                ) ||
                other.surfaceContainerHighest == surfaceContainerHighest) &&
            (identical(other.onSurface, onSurface) ||
                other.onSurface == onSurface) &&
            (identical(other.surfaceVariant, surfaceVariant) ||
                other.surfaceVariant == surfaceVariant) &&
            (identical(other.onSurfaceVariant, onSurfaceVariant) ||
                other.onSurfaceVariant == onSurfaceVariant) &&
            (identical(other.outline, outline) || other.outline == outline) &&
            (identical(other.outlineVariant, outlineVariant) ||
                other.outlineVariant == outlineVariant) &&
            (identical(other.inverseSurface, inverseSurface) ||
                other.inverseSurface == inverseSurface) &&
            (identical(other.inverseOnSurface, inverseOnSurface) ||
                other.inverseOnSurface == inverseOnSurface) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.scrim, scrim) || other.scrim == scrim) &&
            (identical(other.surfaceTint, surfaceTint) ||
                other.surfaceTint == surfaceTint) &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.primaryDim, primaryDim) ||
                other.primaryDim == primaryDim) &&
            (identical(other.onPrimary, onPrimary) ||
                other.onPrimary == onPrimary) &&
            (identical(other.primaryContainer, primaryContainer) ||
                other.primaryContainer == primaryContainer) &&
            (identical(other.onPrimaryContainer, onPrimaryContainer) ||
                other.onPrimaryContainer == onPrimaryContainer) &&
            (identical(other.primaryFixed, primaryFixed) ||
                other.primaryFixed == primaryFixed) &&
            (identical(other.primaryFixedDim, primaryFixedDim) ||
                other.primaryFixedDim == primaryFixedDim) &&
            (identical(other.onPrimaryFixed, onPrimaryFixed) ||
                other.onPrimaryFixed == onPrimaryFixed) &&
            (identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) ||
                other.onPrimaryFixedVariant == onPrimaryFixedVariant) &&
            (identical(other.inversePrimary, inversePrimary) ||
                other.inversePrimary == inversePrimary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.secondaryDim, secondaryDim) ||
                other.secondaryDim == secondaryDim) &&
            (identical(other.onSecondary, onSecondary) ||
                other.onSecondary == onSecondary) &&
            (identical(other.secondaryContainer, secondaryContainer) ||
                other.secondaryContainer == secondaryContainer) &&
            (identical(other.onSecondaryContainer, onSecondaryContainer) ||
                other.onSecondaryContainer == onSecondaryContainer) &&
            (identical(other.secondaryFixed, secondaryFixed) ||
                other.secondaryFixed == secondaryFixed) &&
            (identical(other.secondaryFixedDim, secondaryFixedDim) ||
                other.secondaryFixedDim == secondaryFixedDim) &&
            (identical(other.onSecondaryFixed, onSecondaryFixed) ||
                other.onSecondaryFixed == onSecondaryFixed) &&
            (identical(
                  other.onSecondaryFixedVariant,
                  onSecondaryFixedVariant,
                ) ||
                other.onSecondaryFixedVariant == onSecondaryFixedVariant) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.tertiaryDim, tertiaryDim) ||
                other.tertiaryDim == tertiaryDim) &&
            (identical(other.onTertiary, onTertiary) ||
                other.onTertiary == onTertiary) &&
            (identical(other.tertiaryContainer, tertiaryContainer) ||
                other.tertiaryContainer == tertiaryContainer) &&
            (identical(other.onTertiaryContainer, onTertiaryContainer) ||
                other.onTertiaryContainer == onTertiaryContainer) &&
            (identical(other.tertiaryFixed, tertiaryFixed) ||
                other.tertiaryFixed == tertiaryFixed) &&
            (identical(other.tertiaryFixedDim, tertiaryFixedDim) ||
                other.tertiaryFixedDim == tertiaryFixedDim) &&
            (identical(other.onTertiaryFixed, onTertiaryFixed) ||
                other.onTertiaryFixed == onTertiaryFixed) &&
            (identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) ||
                other.onTertiaryFixedVariant == onTertiaryFixedVariant) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorDim, errorDim) ||
                other.errorDim == errorDim) &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.errorContainer, errorContainer) ||
                other.errorContainer == errorContainer) &&
            (identical(other.onErrorContainer, onErrorContainer) ||
                other.onErrorContainer == onErrorContainer) &&
            (identical(other.controlActivated, controlActivated) ||
                other.controlActivated == controlActivated) &&
            (identical(other.controlNormal, controlNormal) ||
                other.controlNormal == controlNormal) &&
            (identical(other.controlHighlight, controlHighlight) ||
                other.controlHighlight == controlHighlight) &&
            (identical(other.textPrimaryInverse, textPrimaryInverse) ||
                other.textPrimaryInverse == textPrimaryInverse) &&
            (identical(
                  other.textSecondaryAndTertiaryInverse,
                  textSecondaryAndTertiaryInverse,
                ) ||
                other.textSecondaryAndTertiaryInverse ==
                    textSecondaryAndTertiaryInverse) &&
            (identical(
                  other.textPrimaryInverseDisableOnly,
                  textPrimaryInverseDisableOnly,
                ) ||
                other.textPrimaryInverseDisableOnly ==
                    textPrimaryInverseDisableOnly) &&
            (identical(
                  other.textSecondaryAndTertiaryInverseDisabled,
                  textSecondaryAndTertiaryInverseDisabled,
                ) ||
                other.textSecondaryAndTertiaryInverseDisabled ==
                    textSecondaryAndTertiaryInverseDisabled) &&
            (identical(other.textHintInverse, textHintInverse) ||
                other.textHintInverse == textHintInverse) &&
            (identical(other.widgetBackground, widgetBackground) ||
                other.widgetBackground == widgetBackground) &&
            (identical(other.clockHour, clockHour) ||
                other.clockHour == clockHour) &&
            (identical(other.clockMinute, clockMinute) ||
                other.clockMinute == clockMinute) &&
            (identical(other.clockSecond, clockSecond) ||
                other.clockSecond == clockSecond) &&
            (identical(other.weatherTemp, weatherTemp) ||
                other.weatherTemp == weatherTemp) &&
            (identical(other.themeApp, themeApp) ||
                other.themeApp == themeApp) &&
            (identical(other.onThemeApp, onThemeApp) ||
                other.onThemeApp == onThemeApp) &&
            (identical(other.themeAppRing, themeAppRing) ||
                other.themeAppRing == themeAppRing) &&
            (identical(other.themeNotif, themeNotif) ||
                other.themeNotif == themeNotif) &&
            (identical(other.brandA, brandA) || other.brandA == brandA) &&
            (identical(other.brandB, brandB) || other.brandB == brandB) &&
            (identical(other.brandC, brandC) || other.brandC == brandC) &&
            (identical(other.brandD, brandD) || other.brandD == brandD) &&
            (identical(other.underSurface, underSurface) ||
                other.underSurface == underSurface) &&
            (identical(other.shadeActive, shadeActive) ||
                other.shadeActive == shadeActive) &&
            (identical(other.onShadeActive, onShadeActive) ||
                other.onShadeActive == onShadeActive) &&
            (identical(other.onShadeActiveVariant, onShadeActiveVariant) ||
                other.onShadeActiveVariant == onShadeActiveVariant) &&
            (identical(other.shadeInactive, shadeInactive) ||
                other.shadeInactive == shadeInactive) &&
            (identical(other.onShadeInactive, onShadeInactive) ||
                other.onShadeInactive == onShadeInactive) &&
            (identical(other.onShadeInactiveVariant, onShadeInactiveVariant) ||
                other.onShadeInactiveVariant == onShadeInactiveVariant) &&
            (identical(other.shadeDisabled, shadeDisabled) ||
                other.shadeDisabled == shadeDisabled) &&
            (identical(other.overviewBackground, overviewBackground) ||
                other.overviewBackground == overviewBackground));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
    background,
    onBackground,
    surface,
    surfaceDim,
    surfaceBright,
    surfaceContainerLowest,
    surfaceContainerLow,
    surfaceContainer,
    surfaceContainerHigh,
    surfaceContainerHighest,
    onSurface,
    surfaceVariant,
    onSurfaceVariant,
    outline,
    outlineVariant,
    inverseSurface,
    inverseOnSurface,
    shadow,
    scrim,
    surfaceTint,
    primary,
    primaryDim,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    inversePrimary,
    secondary,
    secondaryDim,
    onSecondary,
    secondaryContainer,
    onSecondaryContainer,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiary,
    tertiaryDim,
    onTertiary,
    tertiaryContainer,
    onTertiaryContainer,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    error,
    errorDim,
    onError,
    errorContainer,
    onErrorContainer,
    controlActivated,
    controlNormal,
    controlHighlight,
    textPrimaryInverse,
    textSecondaryAndTertiaryInverse,
    textPrimaryInverseDisableOnly,
    textSecondaryAndTertiaryInverseDisabled,
    textHintInverse,
    widgetBackground,
    clockHour,
    clockMinute,
    clockSecond,
    weatherTemp,
    themeApp,
    onThemeApp,
    themeAppRing,
    themeNotif,
    brandA,
    brandB,
    brandC,
    brandD,
    underSurface,
    shadeActive,
    onShadeActive,
    onShadeActiveVariant,
    shadeInactive,
    onShadeInactive,
    onShadeInactiveVariant,
    shadeDisabled,
    overviewBackground,
  ]);

  @override
  String toString() {
    return 'FigmaScheme(primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor, background: $background, onBackground: $onBackground, surface: $surface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint, primary: $primary, primaryDim: $primaryDim, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, inversePrimary: $inversePrimary, secondary: $secondary, secondaryDim: $secondaryDim, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, tertiaryDim: $tertiaryDim, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, errorDim: $errorDim, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, controlActivated: $controlActivated, controlNormal: $controlNormal, controlHighlight: $controlHighlight, textPrimaryInverse: $textPrimaryInverse, textSecondaryAndTertiaryInverse: $textSecondaryAndTertiaryInverse, textPrimaryInverseDisableOnly: $textPrimaryInverseDisableOnly, textSecondaryAndTertiaryInverseDisabled: $textSecondaryAndTertiaryInverseDisabled, textHintInverse: $textHintInverse, widgetBackground: $widgetBackground, clockHour: $clockHour, clockMinute: $clockMinute, clockSecond: $clockSecond, weatherTemp: $weatherTemp, themeApp: $themeApp, onThemeApp: $onThemeApp, themeAppRing: $themeAppRing, themeNotif: $themeNotif, brandA: $brandA, brandB: $brandB, brandC: $brandC, brandD: $brandD, underSurface: $underSurface, shadeActive: $shadeActive, onShadeActive: $onShadeActive, onShadeActiveVariant: $onShadeActiveVariant, shadeInactive: $shadeInactive, onShadeInactive: $onShadeInactive, onShadeInactiveVariant: $onShadeInactiveVariant, shadeDisabled: $shadeDisabled, overviewBackground: $overviewBackground)';
  }
}

/// @nodoc
abstract mixin class _$FigmaSchemeCopyWith<$Res>
    implements $FigmaSchemeCopyWith<$Res> {
  factory _$FigmaSchemeCopyWith(
    _FigmaScheme value,
    $Res Function(_FigmaScheme) _then,
  ) = __$FigmaSchemeCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? background,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceBright,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerLowest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outline,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? outlineVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inverseOnSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadow,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? scrim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? surfaceTint,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? inversePrimary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixed,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorDim,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onError,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? errorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onErrorContainer,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlActivated,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlNormal,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? controlHighlight,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? textHintInverse,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? widgetBackground,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockHour,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockMinute,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? clockSecond,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? weatherTemp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onThemeApp,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeAppRing,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? themeNotif,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandA,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandB,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandC,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? brandD,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? underSurface,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeActive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeActive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeInactive,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? shadeDisabled,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? overviewBackground,
  });
}

/// @nodoc
class __$FigmaSchemeCopyWithImpl<$Res> implements _$FigmaSchemeCopyWith<$Res> {
  __$FigmaSchemeCopyWithImpl(this._self, this._then);

  final _FigmaScheme _self;
  final $Res Function(_FigmaScheme) _then;

  /// Create a copy of FigmaScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? primaryPaletteKeyColor = freezed,
    Object? secondaryPaletteKeyColor = freezed,
    Object? tertiaryPaletteKeyColor = freezed,
    Object? neutralPaletteKeyColor = freezed,
    Object? neutralVariantPaletteKeyColor = freezed,
    Object? errorPaletteKeyColor = freezed,
    Object? background = freezed,
    Object? onBackground = freezed,
    Object? surface = freezed,
    Object? surfaceDim = freezed,
    Object? surfaceBright = freezed,
    Object? surfaceContainerLowest = freezed,
    Object? surfaceContainerLow = freezed,
    Object? surfaceContainer = freezed,
    Object? surfaceContainerHigh = freezed,
    Object? surfaceContainerHighest = freezed,
    Object? onSurface = freezed,
    Object? surfaceVariant = freezed,
    Object? onSurfaceVariant = freezed,
    Object? outline = freezed,
    Object? outlineVariant = freezed,
    Object? inverseSurface = freezed,
    Object? inverseOnSurface = freezed,
    Object? shadow = freezed,
    Object? scrim = freezed,
    Object? surfaceTint = freezed,
    Object? primary = freezed,
    Object? primaryDim = freezed,
    Object? onPrimary = freezed,
    Object? primaryContainer = freezed,
    Object? onPrimaryContainer = freezed,
    Object? primaryFixed = freezed,
    Object? primaryFixedDim = freezed,
    Object? onPrimaryFixed = freezed,
    Object? onPrimaryFixedVariant = freezed,
    Object? inversePrimary = freezed,
    Object? secondary = freezed,
    Object? secondaryDim = freezed,
    Object? onSecondary = freezed,
    Object? secondaryContainer = freezed,
    Object? onSecondaryContainer = freezed,
    Object? secondaryFixed = freezed,
    Object? secondaryFixedDim = freezed,
    Object? onSecondaryFixed = freezed,
    Object? onSecondaryFixedVariant = freezed,
    Object? tertiary = freezed,
    Object? tertiaryDim = freezed,
    Object? onTertiary = freezed,
    Object? tertiaryContainer = freezed,
    Object? onTertiaryContainer = freezed,
    Object? tertiaryFixed = freezed,
    Object? tertiaryFixedDim = freezed,
    Object? onTertiaryFixed = freezed,
    Object? onTertiaryFixedVariant = freezed,
    Object? error = freezed,
    Object? errorDim = freezed,
    Object? onError = freezed,
    Object? errorContainer = freezed,
    Object? onErrorContainer = freezed,
    Object? controlActivated = freezed,
    Object? controlNormal = freezed,
    Object? controlHighlight = freezed,
    Object? textPrimaryInverse = freezed,
    Object? textSecondaryAndTertiaryInverse = freezed,
    Object? textPrimaryInverseDisableOnly = freezed,
    Object? textSecondaryAndTertiaryInverseDisabled = freezed,
    Object? textHintInverse = freezed,
    Object? widgetBackground = freezed,
    Object? clockHour = freezed,
    Object? clockMinute = freezed,
    Object? clockSecond = freezed,
    Object? weatherTemp = freezed,
    Object? themeApp = freezed,
    Object? onThemeApp = freezed,
    Object? themeAppRing = freezed,
    Object? themeNotif = freezed,
    Object? brandA = freezed,
    Object? brandB = freezed,
    Object? brandC = freezed,
    Object? brandD = freezed,
    Object? underSurface = freezed,
    Object? shadeActive = freezed,
    Object? onShadeActive = freezed,
    Object? onShadeActiveVariant = freezed,
    Object? shadeInactive = freezed,
    Object? onShadeInactive = freezed,
    Object? onShadeInactiveVariant = freezed,
    Object? shadeDisabled = freezed,
    Object? overviewBackground = freezed,
  }) {
    return _then(
      _FigmaScheme(
        primaryPaletteKeyColor: freezed == primaryPaletteKeyColor
            ? _self.primaryPaletteKeyColor
            : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        background: freezed == background
            ? _self.background
            : background // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onBackground: freezed == onBackground
            ? _self.onBackground
            : onBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surface: freezed == surface
            ? _self.surface
            : surface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceDim: freezed == surfaceDim
            ? _self.surfaceDim
            : surfaceDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceBright: freezed == surfaceBright
            ? _self.surfaceBright
            : surfaceBright // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerLowest: freezed == surfaceContainerLowest
            ? _self.surfaceContainerLowest
            : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerLow: freezed == surfaceContainerLow
            ? _self.surfaceContainerLow
            : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainer: freezed == surfaceContainer
            ? _self.surfaceContainer
            : surfaceContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerHigh: freezed == surfaceContainerHigh
            ? _self.surfaceContainerHigh
            : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceContainerHighest: freezed == surfaceContainerHighest
            ? _self.surfaceContainerHighest
            : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSurface: freezed == onSurface
            ? _self.onSurface
            : onSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceVariant: freezed == surfaceVariant
            ? _self.surfaceVariant
            : surfaceVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSurfaceVariant: freezed == onSurfaceVariant
            ? _self.onSurfaceVariant
            : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        outline: freezed == outline
            ? _self.outline
            : outline // ignore: cast_nullable_to_non_nullable
                  as Color?,
        outlineVariant: freezed == outlineVariant
            ? _self.outlineVariant
            : outlineVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inverseSurface: freezed == inverseSurface
            ? _self.inverseSurface
            : inverseSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inverseOnSurface: freezed == inverseOnSurface
            ? _self.inverseOnSurface
            : inverseOnSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as Color?,
        scrim: freezed == scrim
            ? _self.scrim
            : scrim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceTint: freezed == surfaceTint
            ? _self.surfaceTint
            : surfaceTint // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryDim: freezed == primaryDim
            ? _self.primaryDim
            : primaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimary: freezed == onPrimary
            ? _self.onPrimary
            : onPrimary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryContainer: freezed == primaryContainer
            ? _self.primaryContainer
            : primaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryContainer: freezed == onPrimaryContainer
            ? _self.onPrimaryContainer
            : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryFixed: freezed == primaryFixed
            ? _self.primaryFixed
            : primaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryFixedDim: freezed == primaryFixedDim
            ? _self.primaryFixedDim
            : primaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryFixed: freezed == onPrimaryFixed
            ? _self.onPrimaryFixed
            : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onPrimaryFixedVariant: freezed == onPrimaryFixedVariant
            ? _self.onPrimaryFixedVariant
            : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        inversePrimary: freezed == inversePrimary
            ? _self.inversePrimary
            : inversePrimary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryDim: freezed == secondaryDim
            ? _self.secondaryDim
            : secondaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondary: freezed == onSecondary
            ? _self.onSecondary
            : onSecondary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryContainer: freezed == secondaryContainer
            ? _self.secondaryContainer
            : secondaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryContainer: freezed == onSecondaryContainer
            ? _self.onSecondaryContainer
            : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryFixed: freezed == secondaryFixed
            ? _self.secondaryFixed
            : secondaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryFixedDim: freezed == secondaryFixedDim
            ? _self.secondaryFixedDim
            : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryFixed: freezed == onSecondaryFixed
            ? _self.onSecondaryFixed
            : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onSecondaryFixedVariant: freezed == onSecondaryFixedVariant
            ? _self.onSecondaryFixedVariant
            : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryDim: freezed == tertiaryDim
            ? _self.tertiaryDim
            : tertiaryDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiary: freezed == onTertiary
            ? _self.onTertiary
            : onTertiary // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryContainer: freezed == tertiaryContainer
            ? _self.tertiaryContainer
            : tertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryContainer: freezed == onTertiaryContainer
            ? _self.onTertiaryContainer
            : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryFixed: freezed == tertiaryFixed
            ? _self.tertiaryFixed
            : tertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryFixedDim: freezed == tertiaryFixedDim
            ? _self.tertiaryFixedDim
            : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryFixed: freezed == onTertiaryFixed
            ? _self.onTertiaryFixed
            : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onTertiaryFixedVariant: freezed == onTertiaryFixedVariant
            ? _self.onTertiaryFixedVariant
            : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorDim: freezed == errorDim
            ? _self.errorDim
            : errorDim // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onError: freezed == onError
            ? _self.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorContainer: freezed == errorContainer
            ? _self.errorContainer
            : errorContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onErrorContainer: freezed == onErrorContainer
            ? _self.onErrorContainer
            : onErrorContainer // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlActivated: freezed == controlActivated
            ? _self.controlActivated
            : controlActivated // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlNormal: freezed == controlNormal
            ? _self.controlNormal
            : controlNormal // ignore: cast_nullable_to_non_nullable
                  as Color?,
        controlHighlight: freezed == controlHighlight
            ? _self.controlHighlight
            : controlHighlight // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textPrimaryInverse: freezed == textPrimaryInverse
            ? _self.textPrimaryInverse
            : textPrimaryInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textSecondaryAndTertiaryInverse:
            freezed == textSecondaryAndTertiaryInverse
            ? _self.textSecondaryAndTertiaryInverse
            : textSecondaryAndTertiaryInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textPrimaryInverseDisableOnly: freezed == textPrimaryInverseDisableOnly
            ? _self.textPrimaryInverseDisableOnly
            : textPrimaryInverseDisableOnly // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textSecondaryAndTertiaryInverseDisabled:
            freezed == textSecondaryAndTertiaryInverseDisabled
            ? _self.textSecondaryAndTertiaryInverseDisabled
            : textSecondaryAndTertiaryInverseDisabled // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textHintInverse: freezed == textHintInverse
            ? _self.textHintInverse
            : textHintInverse // ignore: cast_nullable_to_non_nullable
                  as Color?,
        widgetBackground: freezed == widgetBackground
            ? _self.widgetBackground
            : widgetBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockHour: freezed == clockHour
            ? _self.clockHour
            : clockHour // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockMinute: freezed == clockMinute
            ? _self.clockMinute
            : clockMinute // ignore: cast_nullable_to_non_nullable
                  as Color?,
        clockSecond: freezed == clockSecond
            ? _self.clockSecond
            : clockSecond // ignore: cast_nullable_to_non_nullable
                  as Color?,
        weatherTemp: freezed == weatherTemp
            ? _self.weatherTemp
            : weatherTemp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeApp: freezed == themeApp
            ? _self.themeApp
            : themeApp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onThemeApp: freezed == onThemeApp
            ? _self.onThemeApp
            : onThemeApp // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeAppRing: freezed == themeAppRing
            ? _self.themeAppRing
            : themeAppRing // ignore: cast_nullable_to_non_nullable
                  as Color?,
        themeNotif: freezed == themeNotif
            ? _self.themeNotif
            : themeNotif // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandA: freezed == brandA
            ? _self.brandA
            : brandA // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandB: freezed == brandB
            ? _self.brandB
            : brandB // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandC: freezed == brandC
            ? _self.brandC
            : brandC // ignore: cast_nullable_to_non_nullable
                  as Color?,
        brandD: freezed == brandD
            ? _self.brandD
            : brandD // ignore: cast_nullable_to_non_nullable
                  as Color?,
        underSurface: freezed == underSurface
            ? _self.underSurface
            : underSurface // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeActive: freezed == shadeActive
            ? _self.shadeActive
            : shadeActive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeActive: freezed == onShadeActive
            ? _self.onShadeActive
            : onShadeActive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeActiveVariant: freezed == onShadeActiveVariant
            ? _self.onShadeActiveVariant
            : onShadeActiveVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeInactive: freezed == shadeInactive
            ? _self.shadeInactive
            : shadeInactive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeInactive: freezed == onShadeInactive
            ? _self.onShadeInactive
            : onShadeInactive // ignore: cast_nullable_to_non_nullable
                  as Color?,
        onShadeInactiveVariant: freezed == onShadeInactiveVariant
            ? _self.onShadeInactiveVariant
            : onShadeInactiveVariant // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadeDisabled: freezed == shadeDisabled
            ? _self.shadeDisabled
            : shadeDisabled // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overviewBackground: freezed == overviewBackground
            ? _self.overviewBackground
            : overviewBackground // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc
mixin _$FigmaPalettes {
  @JsonKey(includeIfNull: false)
  FigmaPalette? get primary;
  @JsonKey(includeIfNull: false)
  FigmaPalette? get secondary;
  @JsonKey(includeIfNull: false)
  FigmaPalette? get tertiary;
  @JsonKey(includeIfNull: false)
  FigmaPalette? get neutral;
  @JsonKey(includeIfNull: false)
  FigmaPalette? get neutralVariant;
  @JsonKey(includeIfNull: false)
  FigmaPalette? get error;

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaPalettesCopyWith<FigmaPalettes> get copyWith =>
      _$FigmaPalettesCopyWithImpl<FigmaPalettes>(
        this as FigmaPalettes,
        _$identity,
      );

  /// Serializes this FigmaPalettes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaPalettes &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.neutralVariant, neutralVariant) ||
                other.neutralVariant == neutralVariant) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    tertiary,
    neutral,
    neutralVariant,
    error,
  );

  @override
  String toString() {
    return 'FigmaPalettes(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class $FigmaPalettesCopyWith<$Res> {
  factory $FigmaPalettesCopyWith(
    FigmaPalettes value,
    $Res Function(FigmaPalettes) _then,
  ) = _$FigmaPalettesCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) FigmaPalette? primary,
    @JsonKey(includeIfNull: false) FigmaPalette? secondary,
    @JsonKey(includeIfNull: false) FigmaPalette? tertiary,
    @JsonKey(includeIfNull: false) FigmaPalette? neutral,
    @JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,
    @JsonKey(includeIfNull: false) FigmaPalette? error,
  });

  $FigmaPaletteCopyWith<$Res>? get primary;
  $FigmaPaletteCopyWith<$Res>? get secondary;
  $FigmaPaletteCopyWith<$Res>? get tertiary;
  $FigmaPaletteCopyWith<$Res>? get neutral;
  $FigmaPaletteCopyWith<$Res>? get neutralVariant;
  $FigmaPaletteCopyWith<$Res>? get error;
}

/// @nodoc
class _$FigmaPalettesCopyWithImpl<$Res>
    implements $FigmaPalettesCopyWith<$Res> {
  _$FigmaPalettesCopyWithImpl(this._self, this._then);

  final FigmaPalettes _self;
  final $Res Function(FigmaPalettes) _then;

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
    Object? neutral = freezed,
    Object? neutralVariant = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
      ),
    );
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get primary {
    if (_self.primary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.primary!, (value) {
      return _then(_self.copyWith(primary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get secondary {
    if (_self.secondary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.secondary!, (value) {
      return _then(_self.copyWith(secondary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get tertiary {
    if (_self.tertiary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.tertiary!, (value) {
      return _then(_self.copyWith(tertiary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get neutral {
    if (_self.neutral == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.neutral!, (value) {
      return _then(_self.copyWith(neutral: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get neutralVariant {
    if (_self.neutralVariant == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.neutralVariant!, (value) {
      return _then(_self.copyWith(neutralVariant: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _FigmaPalettes implements FigmaPalettes {
  const _FigmaPalettes({
    @JsonKey(includeIfNull: false) this.primary,
    @JsonKey(includeIfNull: false) this.secondary,
    @JsonKey(includeIfNull: false) this.tertiary,
    @JsonKey(includeIfNull: false) this.neutral,
    @JsonKey(includeIfNull: false) this.neutralVariant,
    @JsonKey(includeIfNull: false) this.error,
  });
  factory _FigmaPalettes.fromJson(Map<String, dynamic> json) =>
      _$FigmaPalettesFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? primary;
  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? secondary;
  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? tertiary;
  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? neutral;
  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? neutralVariant;
  @override
  @JsonKey(includeIfNull: false)
  final FigmaPalette? error;

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaPalettesCopyWith<_FigmaPalettes> get copyWith =>
      __$FigmaPalettesCopyWithImpl<_FigmaPalettes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaPalettesToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaPalettes &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.tertiary, tertiary) ||
                other.tertiary == tertiary) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.neutralVariant, neutralVariant) ||
                other.neutralVariant == neutralVariant) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    tertiary,
    neutral,
    neutralVariant,
    error,
  );

  @override
  String toString() {
    return 'FigmaPalettes(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FigmaPalettesCopyWith<$Res>
    implements $FigmaPalettesCopyWith<$Res> {
  factory _$FigmaPalettesCopyWith(
    _FigmaPalettes value,
    $Res Function(_FigmaPalettes) _then,
  ) = __$FigmaPalettesCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) FigmaPalette? primary,
    @JsonKey(includeIfNull: false) FigmaPalette? secondary,
    @JsonKey(includeIfNull: false) FigmaPalette? tertiary,
    @JsonKey(includeIfNull: false) FigmaPalette? neutral,
    @JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,
    @JsonKey(includeIfNull: false) FigmaPalette? error,
  });

  @override
  $FigmaPaletteCopyWith<$Res>? get primary;
  @override
  $FigmaPaletteCopyWith<$Res>? get secondary;
  @override
  $FigmaPaletteCopyWith<$Res>? get tertiary;
  @override
  $FigmaPaletteCopyWith<$Res>? get neutral;
  @override
  $FigmaPaletteCopyWith<$Res>? get neutralVariant;
  @override
  $FigmaPaletteCopyWith<$Res>? get error;
}

/// @nodoc
class __$FigmaPalettesCopyWithImpl<$Res>
    implements _$FigmaPalettesCopyWith<$Res> {
  __$FigmaPalettesCopyWithImpl(this._self, this._then);

  final _FigmaPalettes _self;
  final $Res Function(_FigmaPalettes) _then;

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? tertiary = freezed,
    Object? neutral = freezed,
    Object? neutralVariant = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _FigmaPalettes(
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as FigmaPalette?,
      ),
    );
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get primary {
    if (_self.primary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.primary!, (value) {
      return _then(_self.copyWith(primary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get secondary {
    if (_self.secondary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.secondary!, (value) {
      return _then(_self.copyWith(secondary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get tertiary {
    if (_self.tertiary == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.tertiary!, (value) {
      return _then(_self.copyWith(tertiary: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get neutral {
    if (_self.neutral == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.neutral!, (value) {
      return _then(_self.copyWith(neutral: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get neutralVariant {
    if (_self.neutralVariant == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.neutralVariant!, (value) {
      return _then(_self.copyWith(neutralVariant: value));
    });
  }

  /// Create a copy of FigmaPalettes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $FigmaPaletteCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$FigmaPalette {
  @JsonKey(name: "0")
  @ColorConverter()
  Color get t0;
  @JsonKey(name: "5")
  @ColorConverter()
  Color get t5;
  @JsonKey(name: "10")
  @ColorConverter()
  Color get t10;
  @JsonKey(name: "15")
  @ColorConverter()
  Color get t15;
  @JsonKey(name: "20")
  @ColorConverter()
  Color get t20;
  @JsonKey(name: "25")
  @ColorConverter()
  Color get t25;
  @JsonKey(name: "30")
  @ColorConverter()
  Color get t30;
  @JsonKey(name: "35")
  @ColorConverter()
  Color get t35;
  @JsonKey(name: "40")
  @ColorConverter()
  Color get t40;
  @JsonKey(name: "50")
  @ColorConverter()
  Color get t50;
  @JsonKey(name: "60")
  @ColorConverter()
  Color get t60;
  @JsonKey(name: "70")
  @ColorConverter()
  Color get t70;
  @JsonKey(name: "80")
  @ColorConverter()
  Color get t80;
  @JsonKey(name: "90")
  @ColorConverter()
  Color get t90;
  @JsonKey(name: "95")
  @ColorConverter()
  Color get t95;
  @JsonKey(name: "98")
  @ColorConverter()
  Color get t98;
  @JsonKey(name: "99")
  @ColorConverter()
  Color get t99;
  @JsonKey(name: "100")
  @ColorConverter()
  Color get t100;

  /// Create a copy of FigmaPalette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaPaletteCopyWith<FigmaPalette> get copyWith =>
      _$FigmaPaletteCopyWithImpl<FigmaPalette>(
        this as FigmaPalette,
        _$identity,
      );

  /// Serializes this FigmaPalette to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaPalette &&
            (identical(other.t0, t0) || other.t0 == t0) &&
            (identical(other.t5, t5) || other.t5 == t5) &&
            (identical(other.t10, t10) || other.t10 == t10) &&
            (identical(other.t15, t15) || other.t15 == t15) &&
            (identical(other.t20, t20) || other.t20 == t20) &&
            (identical(other.t25, t25) || other.t25 == t25) &&
            (identical(other.t30, t30) || other.t30 == t30) &&
            (identical(other.t35, t35) || other.t35 == t35) &&
            (identical(other.t40, t40) || other.t40 == t40) &&
            (identical(other.t50, t50) || other.t50 == t50) &&
            (identical(other.t60, t60) || other.t60 == t60) &&
            (identical(other.t70, t70) || other.t70 == t70) &&
            (identical(other.t80, t80) || other.t80 == t80) &&
            (identical(other.t90, t90) || other.t90 == t90) &&
            (identical(other.t95, t95) || other.t95 == t95) &&
            (identical(other.t98, t98) || other.t98 == t98) &&
            (identical(other.t99, t99) || other.t99 == t99) &&
            (identical(other.t100, t100) || other.t100 == t100));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    t0,
    t5,
    t10,
    t15,
    t20,
    t25,
    t30,
    t35,
    t40,
    t50,
    t60,
    t70,
    t80,
    t90,
    t95,
    t98,
    t99,
    t100,
  );

  @override
  String toString() {
    return 'FigmaPalette(t0: $t0, t5: $t5, t10: $t10, t15: $t15, t20: $t20, t25: $t25, t30: $t30, t35: $t35, t40: $t40, t50: $t50, t60: $t60, t70: $t70, t80: $t80, t90: $t90, t95: $t95, t98: $t98, t99: $t99, t100: $t100)';
  }
}

/// @nodoc
abstract mixin class $FigmaPaletteCopyWith<$Res> {
  factory $FigmaPaletteCopyWith(
    FigmaPalette value,
    $Res Function(FigmaPalette) _then,
  ) = _$FigmaPaletteCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: "0") @ColorConverter() Color t0,
    @JsonKey(name: "5") @ColorConverter() Color t5,
    @JsonKey(name: "10") @ColorConverter() Color t10,
    @JsonKey(name: "15") @ColorConverter() Color t15,
    @JsonKey(name: "20") @ColorConverter() Color t20,
    @JsonKey(name: "25") @ColorConverter() Color t25,
    @JsonKey(name: "30") @ColorConverter() Color t30,
    @JsonKey(name: "35") @ColorConverter() Color t35,
    @JsonKey(name: "40") @ColorConverter() Color t40,
    @JsonKey(name: "50") @ColorConverter() Color t50,
    @JsonKey(name: "60") @ColorConverter() Color t60,
    @JsonKey(name: "70") @ColorConverter() Color t70,
    @JsonKey(name: "80") @ColorConverter() Color t80,
    @JsonKey(name: "90") @ColorConverter() Color t90,
    @JsonKey(name: "95") @ColorConverter() Color t95,
    @JsonKey(name: "98") @ColorConverter() Color t98,
    @JsonKey(name: "99") @ColorConverter() Color t99,
    @JsonKey(name: "100") @ColorConverter() Color t100,
  });
}

/// @nodoc
class _$FigmaPaletteCopyWithImpl<$Res> implements $FigmaPaletteCopyWith<$Res> {
  _$FigmaPaletteCopyWithImpl(this._self, this._then);

  final FigmaPalette _self;
  final $Res Function(FigmaPalette) _then;

  /// Create a copy of FigmaPalette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t0 = null,
    Object? t5 = null,
    Object? t10 = null,
    Object? t15 = null,
    Object? t20 = null,
    Object? t25 = null,
    Object? t30 = null,
    Object? t35 = null,
    Object? t40 = null,
    Object? t50 = null,
    Object? t60 = null,
    Object? t70 = null,
    Object? t80 = null,
    Object? t90 = null,
    Object? t95 = null,
    Object? t98 = null,
    Object? t99 = null,
    Object? t100 = null,
  }) {
    return _then(
      _self.copyWith(
        t0: null == t0
            ? _self.t0
            : t0 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t5: null == t5
            ? _self.t5
            : t5 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t10: null == t10
            ? _self.t10
            : t10 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t15: null == t15
            ? _self.t15
            : t15 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t20: null == t20
            ? _self.t20
            : t20 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t25: null == t25
            ? _self.t25
            : t25 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t30: null == t30
            ? _self.t30
            : t30 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t35: null == t35
            ? _self.t35
            : t35 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t40: null == t40
            ? _self.t40
            : t40 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t50: null == t50
            ? _self.t50
            : t50 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t60: null == t60
            ? _self.t60
            : t60 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t70: null == t70
            ? _self.t70
            : t70 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t80: null == t80
            ? _self.t80
            : t80 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t90: null == t90
            ? _self.t90
            : t90 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t95: null == t95
            ? _self.t95
            : t95 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t98: null == t98
            ? _self.t98
            : t98 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t99: null == t99
            ? _self.t99
            : t99 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t100: null == t100
            ? _self.t100
            : t100 // ignore: cast_nullable_to_non_nullable
                  as Color,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _FigmaPalette extends FigmaPalette {
  const _FigmaPalette({
    @JsonKey(name: "0") @ColorConverter() required this.t0,
    @JsonKey(name: "5") @ColorConverter() required this.t5,
    @JsonKey(name: "10") @ColorConverter() required this.t10,
    @JsonKey(name: "15") @ColorConverter() required this.t15,
    @JsonKey(name: "20") @ColorConverter() required this.t20,
    @JsonKey(name: "25") @ColorConverter() required this.t25,
    @JsonKey(name: "30") @ColorConverter() required this.t30,
    @JsonKey(name: "35") @ColorConverter() required this.t35,
    @JsonKey(name: "40") @ColorConverter() required this.t40,
    @JsonKey(name: "50") @ColorConverter() required this.t50,
    @JsonKey(name: "60") @ColorConverter() required this.t60,
    @JsonKey(name: "70") @ColorConverter() required this.t70,
    @JsonKey(name: "80") @ColorConverter() required this.t80,
    @JsonKey(name: "90") @ColorConverter() required this.t90,
    @JsonKey(name: "95") @ColorConverter() required this.t95,
    @JsonKey(name: "98") @ColorConverter() required this.t98,
    @JsonKey(name: "99") @ColorConverter() required this.t99,
    @JsonKey(name: "100") @ColorConverter() required this.t100,
  }) : super._();
  factory _FigmaPalette.fromJson(Map<String, dynamic> json) =>
      _$FigmaPaletteFromJson(json);

  @override
  @JsonKey(name: "0")
  @ColorConverter()
  final Color t0;
  @override
  @JsonKey(name: "5")
  @ColorConverter()
  final Color t5;
  @override
  @JsonKey(name: "10")
  @ColorConverter()
  final Color t10;
  @override
  @JsonKey(name: "15")
  @ColorConverter()
  final Color t15;
  @override
  @JsonKey(name: "20")
  @ColorConverter()
  final Color t20;
  @override
  @JsonKey(name: "25")
  @ColorConverter()
  final Color t25;
  @override
  @JsonKey(name: "30")
  @ColorConverter()
  final Color t30;
  @override
  @JsonKey(name: "35")
  @ColorConverter()
  final Color t35;
  @override
  @JsonKey(name: "40")
  @ColorConverter()
  final Color t40;
  @override
  @JsonKey(name: "50")
  @ColorConverter()
  final Color t50;
  @override
  @JsonKey(name: "60")
  @ColorConverter()
  final Color t60;
  @override
  @JsonKey(name: "70")
  @ColorConverter()
  final Color t70;
  @override
  @JsonKey(name: "80")
  @ColorConverter()
  final Color t80;
  @override
  @JsonKey(name: "90")
  @ColorConverter()
  final Color t90;
  @override
  @JsonKey(name: "95")
  @ColorConverter()
  final Color t95;
  @override
  @JsonKey(name: "98")
  @ColorConverter()
  final Color t98;
  @override
  @JsonKey(name: "99")
  @ColorConverter()
  final Color t99;
  @override
  @JsonKey(name: "100")
  @ColorConverter()
  final Color t100;

  /// Create a copy of FigmaPalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FigmaPaletteCopyWith<_FigmaPalette> get copyWith =>
      __$FigmaPaletteCopyWithImpl<_FigmaPalette>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FigmaPaletteToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FigmaPalette &&
            (identical(other.t0, t0) || other.t0 == t0) &&
            (identical(other.t5, t5) || other.t5 == t5) &&
            (identical(other.t10, t10) || other.t10 == t10) &&
            (identical(other.t15, t15) || other.t15 == t15) &&
            (identical(other.t20, t20) || other.t20 == t20) &&
            (identical(other.t25, t25) || other.t25 == t25) &&
            (identical(other.t30, t30) || other.t30 == t30) &&
            (identical(other.t35, t35) || other.t35 == t35) &&
            (identical(other.t40, t40) || other.t40 == t40) &&
            (identical(other.t50, t50) || other.t50 == t50) &&
            (identical(other.t60, t60) || other.t60 == t60) &&
            (identical(other.t70, t70) || other.t70 == t70) &&
            (identical(other.t80, t80) || other.t80 == t80) &&
            (identical(other.t90, t90) || other.t90 == t90) &&
            (identical(other.t95, t95) || other.t95 == t95) &&
            (identical(other.t98, t98) || other.t98 == t98) &&
            (identical(other.t99, t99) || other.t99 == t99) &&
            (identical(other.t100, t100) || other.t100 == t100));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    t0,
    t5,
    t10,
    t15,
    t20,
    t25,
    t30,
    t35,
    t40,
    t50,
    t60,
    t70,
    t80,
    t90,
    t95,
    t98,
    t99,
    t100,
  );

  @override
  String toString() {
    return 'FigmaPalette(t0: $t0, t5: $t5, t10: $t10, t15: $t15, t20: $t20, t25: $t25, t30: $t30, t35: $t35, t40: $t40, t50: $t50, t60: $t60, t70: $t70, t80: $t80, t90: $t90, t95: $t95, t98: $t98, t99: $t99, t100: $t100)';
  }
}

/// @nodoc
abstract mixin class _$FigmaPaletteCopyWith<$Res>
    implements $FigmaPaletteCopyWith<$Res> {
  factory _$FigmaPaletteCopyWith(
    _FigmaPalette value,
    $Res Function(_FigmaPalette) _then,
  ) = __$FigmaPaletteCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "0") @ColorConverter() Color t0,
    @JsonKey(name: "5") @ColorConverter() Color t5,
    @JsonKey(name: "10") @ColorConverter() Color t10,
    @JsonKey(name: "15") @ColorConverter() Color t15,
    @JsonKey(name: "20") @ColorConverter() Color t20,
    @JsonKey(name: "25") @ColorConverter() Color t25,
    @JsonKey(name: "30") @ColorConverter() Color t30,
    @JsonKey(name: "35") @ColorConverter() Color t35,
    @JsonKey(name: "40") @ColorConverter() Color t40,
    @JsonKey(name: "50") @ColorConverter() Color t50,
    @JsonKey(name: "60") @ColorConverter() Color t60,
    @JsonKey(name: "70") @ColorConverter() Color t70,
    @JsonKey(name: "80") @ColorConverter() Color t80,
    @JsonKey(name: "90") @ColorConverter() Color t90,
    @JsonKey(name: "95") @ColorConverter() Color t95,
    @JsonKey(name: "98") @ColorConverter() Color t98,
    @JsonKey(name: "99") @ColorConverter() Color t99,
    @JsonKey(name: "100") @ColorConverter() Color t100,
  });
}

/// @nodoc
class __$FigmaPaletteCopyWithImpl<$Res>
    implements _$FigmaPaletteCopyWith<$Res> {
  __$FigmaPaletteCopyWithImpl(this._self, this._then);

  final _FigmaPalette _self;
  final $Res Function(_FigmaPalette) _then;

  /// Create a copy of FigmaPalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? t0 = null,
    Object? t5 = null,
    Object? t10 = null,
    Object? t15 = null,
    Object? t20 = null,
    Object? t25 = null,
    Object? t30 = null,
    Object? t35 = null,
    Object? t40 = null,
    Object? t50 = null,
    Object? t60 = null,
    Object? t70 = null,
    Object? t80 = null,
    Object? t90 = null,
    Object? t95 = null,
    Object? t98 = null,
    Object? t99 = null,
    Object? t100 = null,
  }) {
    return _then(
      _FigmaPalette(
        t0: null == t0
            ? _self.t0
            : t0 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t5: null == t5
            ? _self.t5
            : t5 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t10: null == t10
            ? _self.t10
            : t10 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t15: null == t15
            ? _self.t15
            : t15 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t20: null == t20
            ? _self.t20
            : t20 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t25: null == t25
            ? _self.t25
            : t25 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t30: null == t30
            ? _self.t30
            : t30 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t35: null == t35
            ? _self.t35
            : t35 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t40: null == t40
            ? _self.t40
            : t40 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t50: null == t50
            ? _self.t50
            : t50 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t60: null == t60
            ? _self.t60
            : t60 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t70: null == t70
            ? _self.t70
            : t70 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t80: null == t80
            ? _self.t80
            : t80 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t90: null == t90
            ? _self.t90
            : t90 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t95: null == t95
            ? _self.t95
            : t95 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t98: null == t98
            ? _self.t98
            : t98 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t99: null == t99
            ? _self.t99
            : t99 // ignore: cast_nullable_to_non_nullable
                  as Color,
        t100: null == t100
            ? _self.t100
            : t100 // ignore: cast_nullable_to_non_nullable
                  as Color,
      ),
    );
  }
}

/// @nodoc
mixin _$Template {
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get sourceColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get primaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get secondaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get tertiaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutralPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get neutralVariantPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  Color? get errorPaletteKeyColor;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateCopyWith<Template> get copyWith =>
      _$TemplateCopyWithImpl<Template>(this as Template, _$identity);

  /// Serializes this Template to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Template &&
            (identical(other.sourceColor, sourceColor) ||
                other.sourceColor == sourceColor) &&
            (identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) ||
                other.primaryPaletteKeyColor == primaryPaletteKeyColor) &&
            (identical(
                  other.secondaryPaletteKeyColor,
                  secondaryPaletteKeyColor,
                ) ||
                other.secondaryPaletteKeyColor == secondaryPaletteKeyColor) &&
            (identical(
                  other.tertiaryPaletteKeyColor,
                  tertiaryPaletteKeyColor,
                ) ||
                other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor) &&
            (identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) ||
                other.neutralPaletteKeyColor == neutralPaletteKeyColor) &&
            (identical(
                  other.neutralVariantPaletteKeyColor,
                  neutralVariantPaletteKeyColor,
                ) ||
                other.neutralVariantPaletteKeyColor ==
                    neutralVariantPaletteKeyColor) &&
            (identical(other.errorPaletteKeyColor, errorPaletteKeyColor) ||
                other.errorPaletteKeyColor == errorPaletteKeyColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sourceColor,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
  );

  @override
  String toString() {
    return 'Template(sourceColor: $sourceColor, primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor)';
  }
}

/// @nodoc
abstract mixin class $TemplateCopyWith<$Res> {
  factory $TemplateCopyWith(Template value, $Res Function(Template) _then) =
      _$TemplateCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? sourceColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
  });
}

/// @nodoc
class _$TemplateCopyWithImpl<$Res> implements $TemplateCopyWith<$Res> {
  _$TemplateCopyWithImpl(this._self, this._then);

  final Template _self;
  final $Res Function(Template) _then;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceColor = freezed,
    Object? primaryPaletteKeyColor = freezed,
    Object? secondaryPaletteKeyColor = freezed,
    Object? tertiaryPaletteKeyColor = freezed,
    Object? neutralPaletteKeyColor = freezed,
    Object? neutralVariantPaletteKeyColor = freezed,
    Object? errorPaletteKeyColor = freezed,
  }) {
    return _then(
      _self.copyWith(
        sourceColor: freezed == sourceColor
            ? _self.sourceColor
            : sourceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryPaletteKeyColor: freezed == primaryPaletteKeyColor
            ? _self.primaryPaletteKeyColor
            : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _Template implements Template {
  const _Template({
    @JsonKey(includeIfNull: false) @ColorConverter() this.sourceColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    this.neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false) @ColorConverter() this.errorPaletteKeyColor,
  });
  factory _Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? sourceColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? primaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? secondaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? tertiaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutralPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? neutralVariantPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @ColorConverter()
  final Color? errorPaletteKeyColor;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateCopyWith<_Template> get copyWith =>
      __$TemplateCopyWithImpl<_Template>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Template &&
            (identical(other.sourceColor, sourceColor) ||
                other.sourceColor == sourceColor) &&
            (identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) ||
                other.primaryPaletteKeyColor == primaryPaletteKeyColor) &&
            (identical(
                  other.secondaryPaletteKeyColor,
                  secondaryPaletteKeyColor,
                ) ||
                other.secondaryPaletteKeyColor == secondaryPaletteKeyColor) &&
            (identical(
                  other.tertiaryPaletteKeyColor,
                  tertiaryPaletteKeyColor,
                ) ||
                other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor) &&
            (identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) ||
                other.neutralPaletteKeyColor == neutralPaletteKeyColor) &&
            (identical(
                  other.neutralVariantPaletteKeyColor,
                  neutralVariantPaletteKeyColor,
                ) ||
                other.neutralVariantPaletteKeyColor ==
                    neutralVariantPaletteKeyColor) &&
            (identical(other.errorPaletteKeyColor, errorPaletteKeyColor) ||
                other.errorPaletteKeyColor == errorPaletteKeyColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sourceColor,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
  );

  @override
  String toString() {
    return 'Template(sourceColor: $sourceColor, primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor)';
  }
}

/// @nodoc
abstract mixin class _$TemplateCopyWith<$Res>
    implements $TemplateCopyWith<$Res> {
  factory _$TemplateCopyWith(_Template value, $Res Function(_Template) _then) =
      __$TemplateCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? sourceColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
  });
}

/// @nodoc
class __$TemplateCopyWithImpl<$Res> implements _$TemplateCopyWith<$Res> {
  __$TemplateCopyWithImpl(this._self, this._then);

  final _Template _self;
  final $Res Function(_Template) _then;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceColor = freezed,
    Object? primaryPaletteKeyColor = freezed,
    Object? secondaryPaletteKeyColor = freezed,
    Object? tertiaryPaletteKeyColor = freezed,
    Object? neutralPaletteKeyColor = freezed,
    Object? neutralVariantPaletteKeyColor = freezed,
    Object? errorPaletteKeyColor = freezed,
  }) {
    return _then(
      _Template(
        sourceColor: freezed == sourceColor
            ? _self.sourceColor
            : sourceColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        primaryPaletteKeyColor: freezed == primaryPaletteKeyColor
            ? _self.primaryPaletteKeyColor
            : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}
