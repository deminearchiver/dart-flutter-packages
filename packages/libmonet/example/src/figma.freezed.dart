// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Theme {
  String get description;
  @_ArgbHexConverter()
  int get seed;
  CoreColors get coreColors;
  List<ExtendedColor> get extendedColors;
  Schemes get schemes;

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeCopyWith<Theme> get copyWith =>
      _$ThemeCopyWithImpl<Theme>(this as Theme, _$identity);

  /// Serializes this Theme to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Theme &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.coreColors, coreColors) ||
                other.coreColors == coreColors) &&
            const DeepCollectionEquality().equals(
              other.extendedColors,
              extendedColors,
            ) &&
            (identical(other.schemes, schemes) || other.schemes == schemes));
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
  );

  @override
  String toString() {
    return 'Theme(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes)';
  }
}

/// @nodoc
abstract mixin class $ThemeCopyWith<$Res> {
  factory $ThemeCopyWith(Theme value, $Res Function(Theme) _then) =
      _$ThemeCopyWithImpl;
  @useResult
  $Res call({
    String description,
    @_ArgbHexConverter() int seed,
    CoreColors coreColors,
    List<ExtendedColor> extendedColors,
    Schemes schemes,
  });

  $CoreColorsCopyWith<$Res> get coreColors;
  $SchemesCopyWith<$Res> get schemes;
}

/// @nodoc
class _$ThemeCopyWithImpl<$Res> implements $ThemeCopyWith<$Res> {
  _$ThemeCopyWithImpl(this._self, this._then);

  final Theme _self;
  final $Res Function(Theme) _then;

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? seed = null,
    Object? coreColors = null,
    Object? extendedColors = null,
    Object? schemes = null,
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
                  as int,
        coreColors: null == coreColors
            ? _self.coreColors
            : coreColors // ignore: cast_nullable_to_non_nullable
                  as CoreColors,
        extendedColors: null == extendedColors
            ? _self.extendedColors
            : extendedColors // ignore: cast_nullable_to_non_nullable
                  as List<ExtendedColor>,
        schemes: null == schemes
            ? _self.schemes
            : schemes // ignore: cast_nullable_to_non_nullable
                  as Schemes,
      ),
    );
  }

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoreColorsCopyWith<$Res> get coreColors {
    return $CoreColorsCopyWith<$Res>(_self.coreColors, (value) {
      return _then(_self.copyWith(coreColors: value));
    });
  }

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemesCopyWith<$Res> get schemes {
    return $SchemesCopyWith<$Res>(_self.schemes, (value) {
      return _then(_self.copyWith(schemes: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Theme extends Theme {
  const _Theme({
    this.description = "",
    @_ArgbHexConverter() required this.seed,
    required this.coreColors,
    final List<ExtendedColor> extendedColors = const [],
    required this.schemes,
  }) : _extendedColors = extendedColors,
       super._();
  factory _Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);

  @override
  @JsonKey()
  final String description;
  @override
  @_ArgbHexConverter()
  final int seed;
  @override
  final CoreColors coreColors;
  final List<ExtendedColor> _extendedColors;
  @override
  @JsonKey()
  List<ExtendedColor> get extendedColors {
    if (_extendedColors is EqualUnmodifiableListView) return _extendedColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extendedColors);
  }

  @override
  final Schemes schemes;

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThemeCopyWith<_Theme> get copyWith =>
      __$ThemeCopyWithImpl<_Theme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ThemeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Theme &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.coreColors, coreColors) ||
                other.coreColors == coreColors) &&
            const DeepCollectionEquality().equals(
              other._extendedColors,
              _extendedColors,
            ) &&
            (identical(other.schemes, schemes) || other.schemes == schemes));
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
  );

  @override
  String toString() {
    return 'Theme(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes)';
  }
}

/// @nodoc
abstract mixin class _$ThemeCopyWith<$Res> implements $ThemeCopyWith<$Res> {
  factory _$ThemeCopyWith(_Theme value, $Res Function(_Theme) _then) =
      __$ThemeCopyWithImpl;
  @override
  @useResult
  $Res call({
    String description,
    @_ArgbHexConverter() int seed,
    CoreColors coreColors,
    List<ExtendedColor> extendedColors,
    Schemes schemes,
  });

  @override
  $CoreColorsCopyWith<$Res> get coreColors;
  @override
  $SchemesCopyWith<$Res> get schemes;
}

/// @nodoc
class __$ThemeCopyWithImpl<$Res> implements _$ThemeCopyWith<$Res> {
  __$ThemeCopyWithImpl(this._self, this._then);

  final _Theme _self;
  final $Res Function(_Theme) _then;

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? seed = null,
    Object? coreColors = null,
    Object? extendedColors = null,
    Object? schemes = null,
  }) {
    return _then(
      _Theme(
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        seed: null == seed
            ? _self.seed
            : seed // ignore: cast_nullable_to_non_nullable
                  as int,
        coreColors: null == coreColors
            ? _self.coreColors
            : coreColors // ignore: cast_nullable_to_non_nullable
                  as CoreColors,
        extendedColors: null == extendedColors
            ? _self._extendedColors
            : extendedColors // ignore: cast_nullable_to_non_nullable
                  as List<ExtendedColor>,
        schemes: null == schemes
            ? _self.schemes
            : schemes // ignore: cast_nullable_to_non_nullable
                  as Schemes,
      ),
    );
  }

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoreColorsCopyWith<$Res> get coreColors {
    return $CoreColorsCopyWith<$Res>(_self.coreColors, (value) {
      return _then(_self.copyWith(coreColors: value));
    });
  }

  /// Create a copy of Theme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemesCopyWith<$Res> get schemes {
    return $SchemesCopyWith<$Res>(_self.schemes, (value) {
      return _then(_self.copyWith(schemes: value));
    });
  }
}

/// @nodoc
mixin _$CoreColors {
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get neutral;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get neutralVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get error;

  /// Create a copy of CoreColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoreColorsCopyWith<CoreColors> get copyWith =>
      _$CoreColorsCopyWithImpl<CoreColors>(this as CoreColors, _$identity);

  /// Serializes this CoreColors to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoreColors &&
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
    return 'CoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class $CoreColorsCopyWith<$Res> {
  factory $CoreColorsCopyWith(
    CoreColors value,
    $Res Function(CoreColors) _then,
  ) = _$CoreColorsCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutral,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutralVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
  });
}

/// @nodoc
class _$CoreColorsCopyWithImpl<$Res> implements $CoreColorsCopyWith<$Res> {
  _$CoreColorsCopyWithImpl(this._self, this._then);

  final CoreColors _self;
  final $Res Function(CoreColors) _then;

  /// Create a copy of CoreColors
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
                  as int?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _CoreColors extends CoreColors {
  const _CoreColors({
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.neutral,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.neutralVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.error,
  }) : super._();
  factory _CoreColors.fromJson(Map<String, dynamic> json) =>
      _$CoreColorsFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? neutral;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? neutralVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? error;

  /// Create a copy of CoreColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoreColorsCopyWith<_CoreColors> get copyWith =>
      __$CoreColorsCopyWithImpl<_CoreColors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoreColorsToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoreColors &&
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
    return 'CoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$CoreColorsCopyWith<$Res>
    implements $CoreColorsCopyWith<$Res> {
  factory _$CoreColorsCopyWith(
    _CoreColors value,
    $Res Function(_CoreColors) _then,
  ) = __$CoreColorsCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutral,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? neutralVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
  });
}

/// @nodoc
class __$CoreColorsCopyWithImpl<$Res> implements _$CoreColorsCopyWith<$Res> {
  __$CoreColorsCopyWithImpl(this._self, this._then);

  final _CoreColors _self;
  final $Res Function(_CoreColors) _then;

  /// Create a copy of CoreColors
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
      _CoreColors(
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutral: freezed == neutral
            ? _self.neutral
            : neutral // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralVariant: freezed == neutralVariant
            ? _self.neutralVariant
            : neutralVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$ExtendedColor {
  String get name;
  @_ArgbHexConverter()
  int get color;
  String get description;
  bool get harmonized;

  /// Create a copy of ExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExtendedColorCopyWith<ExtendedColor> get copyWith =>
      _$ExtendedColorCopyWithImpl<ExtendedColor>(
        this as ExtendedColor,
        _$identity,
      );

  /// Serializes this ExtendedColor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtendedColor &&
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
    return 'ExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
  }
}

/// @nodoc
abstract mixin class $ExtendedColorCopyWith<$Res> {
  factory $ExtendedColorCopyWith(
    ExtendedColor value,
    $Res Function(ExtendedColor) _then,
  ) = _$ExtendedColorCopyWithImpl;
  @useResult
  $Res call({
    String name,
    @_ArgbHexConverter() int color,
    String description,
    bool harmonized,
  });
}

/// @nodoc
class _$ExtendedColorCopyWithImpl<$Res>
    implements $ExtendedColorCopyWith<$Res> {
  _$ExtendedColorCopyWithImpl(this._self, this._then);

  final ExtendedColor _self;
  final $Res Function(ExtendedColor) _then;

  /// Create a copy of ExtendedColor
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
                  as int,
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
class _ExtendedColor extends ExtendedColor {
  const _ExtendedColor({
    required this.name,
    @_ArgbHexConverter() required this.color,
    this.description = "",
    this.harmonized = false,
  }) : super._();
  factory _ExtendedColor.fromJson(Map<String, dynamic> json) =>
      _$ExtendedColorFromJson(json);

  @override
  final String name;
  @override
  @_ArgbHexConverter()
  final int color;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool harmonized;

  /// Create a copy of ExtendedColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExtendedColorCopyWith<_ExtendedColor> get copyWith =>
      __$ExtendedColorCopyWithImpl<_ExtendedColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExtendedColorToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExtendedColor &&
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
    return 'ExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
  }
}

/// @nodoc
abstract mixin class _$ExtendedColorCopyWith<$Res>
    implements $ExtendedColorCopyWith<$Res> {
  factory _$ExtendedColorCopyWith(
    _ExtendedColor value,
    $Res Function(_ExtendedColor) _then,
  ) = __$ExtendedColorCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    @_ArgbHexConverter() int color,
    String description,
    bool harmonized,
  });
}

/// @nodoc
class __$ExtendedColorCopyWithImpl<$Res>
    implements _$ExtendedColorCopyWith<$Res> {
  __$ExtendedColorCopyWithImpl(this._self, this._then);

  final _ExtendedColor _self;
  final $Res Function(_ExtendedColor) _then;

  /// Create a copy of ExtendedColor
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
      _ExtendedColor(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _self.color
            : color // ignore: cast_nullable_to_non_nullable
                  as int,
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
mixin _$Schemes {
  Scheme get light;
  Scheme get lightMediumContrast;
  Scheme get lightHighContrast;
  Scheme get dark;
  Scheme get darkMediumContrast;
  Scheme get darkHighContrast;

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SchemesCopyWith<Schemes> get copyWith =>
      _$SchemesCopyWithImpl<Schemes>(this as Schemes, _$identity);

  /// Serializes this Schemes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Schemes &&
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
    return 'Schemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
  }
}

/// @nodoc
abstract mixin class $SchemesCopyWith<$Res> {
  factory $SchemesCopyWith(Schemes value, $Res Function(Schemes) _then) =
      _$SchemesCopyWithImpl;
  @useResult
  $Res call({
    Scheme light,
    Scheme lightMediumContrast,
    Scheme lightHighContrast,
    Scheme dark,
    Scheme darkMediumContrast,
    Scheme darkHighContrast,
  });

  $SchemeCopyWith<$Res> get light;
  $SchemeCopyWith<$Res> get lightMediumContrast;
  $SchemeCopyWith<$Res> get lightHighContrast;
  $SchemeCopyWith<$Res> get dark;
  $SchemeCopyWith<$Res> get darkMediumContrast;
  $SchemeCopyWith<$Res> get darkHighContrast;
}

/// @nodoc
class _$SchemesCopyWithImpl<$Res> implements $SchemesCopyWith<$Res> {
  _$SchemesCopyWithImpl(this._self, this._then);

  final Schemes _self;
  final $Res Function(Schemes) _then;

  /// Create a copy of Schemes
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
                  as Scheme,
        lightMediumContrast: null == lightMediumContrast
            ? _self.lightMediumContrast
            : lightMediumContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        lightHighContrast: null == lightHighContrast
            ? _self.lightHighContrast
            : lightHighContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        dark: null == dark
            ? _self.dark
            : dark // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        darkMediumContrast: null == darkMediumContrast
            ? _self.darkMediumContrast
            : darkMediumContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        darkHighContrast: null == darkHighContrast
            ? _self.darkHighContrast
            : darkHighContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
      ),
    );
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get light {
    return $SchemeCopyWith<$Res>(_self.light, (value) {
      return _then(_self.copyWith(light: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get lightMediumContrast {
    return $SchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
      return _then(_self.copyWith(lightMediumContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get lightHighContrast {
    return $SchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
      return _then(_self.copyWith(lightHighContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get dark {
    return $SchemeCopyWith<$Res>(_self.dark, (value) {
      return _then(_self.copyWith(dark: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get darkMediumContrast {
    return $SchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
      return _then(_self.copyWith(darkMediumContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get darkHighContrast {
    return $SchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
      return _then(_self.copyWith(darkHighContrast: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Schemes extends Schemes {
  const _Schemes({
    required this.light,
    required this.lightMediumContrast,
    required this.lightHighContrast,
    required this.dark,
    required this.darkMediumContrast,
    required this.darkHighContrast,
  }) : super._();
  factory _Schemes.fromJson(Map<String, dynamic> json) =>
      _$SchemesFromJson(json);

  @override
  final Scheme light;
  @override
  final Scheme lightMediumContrast;
  @override
  final Scheme lightHighContrast;
  @override
  final Scheme dark;
  @override
  final Scheme darkMediumContrast;
  @override
  final Scheme darkHighContrast;

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SchemesCopyWith<_Schemes> get copyWith =>
      __$SchemesCopyWithImpl<_Schemes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SchemesToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Schemes &&
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
    return 'Schemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
  }
}

/// @nodoc
abstract mixin class _$SchemesCopyWith<$Res> implements $SchemesCopyWith<$Res> {
  factory _$SchemesCopyWith(_Schemes value, $Res Function(_Schemes) _then) =
      __$SchemesCopyWithImpl;
  @override
  @useResult
  $Res call({
    Scheme light,
    Scheme lightMediumContrast,
    Scheme lightHighContrast,
    Scheme dark,
    Scheme darkMediumContrast,
    Scheme darkHighContrast,
  });

  @override
  $SchemeCopyWith<$Res> get light;
  @override
  $SchemeCopyWith<$Res> get lightMediumContrast;
  @override
  $SchemeCopyWith<$Res> get lightHighContrast;
  @override
  $SchemeCopyWith<$Res> get dark;
  @override
  $SchemeCopyWith<$Res> get darkMediumContrast;
  @override
  $SchemeCopyWith<$Res> get darkHighContrast;
}

/// @nodoc
class __$SchemesCopyWithImpl<$Res> implements _$SchemesCopyWith<$Res> {
  __$SchemesCopyWithImpl(this._self, this._then);

  final _Schemes _self;
  final $Res Function(_Schemes) _then;

  /// Create a copy of Schemes
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
      _Schemes(
        light: null == light
            ? _self.light
            : light // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        lightMediumContrast: null == lightMediumContrast
            ? _self.lightMediumContrast
            : lightMediumContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        lightHighContrast: null == lightHighContrast
            ? _self.lightHighContrast
            : lightHighContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        dark: null == dark
            ? _self.dark
            : dark // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        darkMediumContrast: null == darkMediumContrast
            ? _self.darkMediumContrast
            : darkMediumContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
        darkHighContrast: null == darkHighContrast
            ? _self.darkHighContrast
            : darkHighContrast // ignore: cast_nullable_to_non_nullable
                  as Scheme,
      ),
    );
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get light {
    return $SchemeCopyWith<$Res>(_self.light, (value) {
      return _then(_self.copyWith(light: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get lightMediumContrast {
    return $SchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
      return _then(_self.copyWith(lightMediumContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get lightHighContrast {
    return $SchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
      return _then(_self.copyWith(lightHighContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get dark {
    return $SchemeCopyWith<$Res>(_self.dark, (value) {
      return _then(_self.copyWith(dark: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get darkMediumContrast {
    return $SchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
      return _then(_self.copyWith(darkMediumContrast: value));
    });
  }

  /// Create a copy of Schemes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<$Res> get darkHighContrast {
    return $SchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
      return _then(_self.copyWith(darkHighContrast: value));
    });
  }
}

/// @nodoc
mixin _$Scheme {
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiaryPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get neutralPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get neutralVariantPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get errorPaletteKeyColor;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get background;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onBackground;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surface;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceBright;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceContainerLowest;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceContainerLow;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceContainerHigh;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceContainerHighest;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSurface;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSurfaceVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get outline;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get outlineVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get inverseSurface;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get inverseOnSurface;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get shadow;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get scrim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get surfaceTint;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primaryDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onPrimary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onPrimaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get primaryFixedDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onPrimaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onPrimaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get inversePrimary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondaryDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSecondary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSecondaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get secondaryFixedDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSecondaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onSecondaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiaryDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onTertiary;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onTertiaryContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get tertiaryFixedDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onTertiaryFixed;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onTertiaryFixedVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get error;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get errorDim;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onError;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get errorContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onErrorContainer;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get controlActivated;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get controlNormal;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get controlHighlight;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get textPrimaryInverse;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get textSecondaryAndTertiaryInverse;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get textPrimaryInverseDisableOnly;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get textSecondaryAndTertiaryInverseDisabled;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get textHintInverse;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get widgetBackground;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get clockHour;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get clockMinute;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get clockSecond;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get weatherTemp;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get themeApp;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onThemeApp;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get themeAppRing;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get themeNotif;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get brandA;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get brandB;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get brandC;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get brandD;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get underSurface;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get shadeActive;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onShadeActive;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onShadeActiveVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get shadeInactive;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onShadeInactive;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get onShadeInactiveVariant;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get shadeDisabled;
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  int? get overviewBackground;

  /// Create a copy of Scheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SchemeCopyWith<Scheme> get copyWith =>
      _$SchemeCopyWithImpl<Scheme>(this as Scheme, _$identity);

  /// Serializes this Scheme to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Scheme &&
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
    return 'Scheme(primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor, background: $background, onBackground: $onBackground, surface: $surface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint, primary: $primary, primaryDim: $primaryDim, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, inversePrimary: $inversePrimary, secondary: $secondary, secondaryDim: $secondaryDim, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, tertiaryDim: $tertiaryDim, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, errorDim: $errorDim, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, controlActivated: $controlActivated, controlNormal: $controlNormal, controlHighlight: $controlHighlight, textPrimaryInverse: $textPrimaryInverse, textSecondaryAndTertiaryInverse: $textSecondaryAndTertiaryInverse, textPrimaryInverseDisableOnly: $textPrimaryInverseDisableOnly, textSecondaryAndTertiaryInverseDisabled: $textSecondaryAndTertiaryInverseDisabled, textHintInverse: $textHintInverse, widgetBackground: $widgetBackground, clockHour: $clockHour, clockMinute: $clockMinute, clockSecond: $clockSecond, weatherTemp: $weatherTemp, themeApp: $themeApp, onThemeApp: $onThemeApp, themeAppRing: $themeAppRing, themeNotif: $themeNotif, brandA: $brandA, brandB: $brandB, brandC: $brandC, brandD: $brandD, underSurface: $underSurface, shadeActive: $shadeActive, onShadeActive: $onShadeActive, onShadeActiveVariant: $onShadeActiveVariant, shadeInactive: $shadeInactive, onShadeInactive: $onShadeInactive, onShadeInactiveVariant: $onShadeInactiveVariant, shadeDisabled: $shadeDisabled, overviewBackground: $overviewBackground)';
  }
}

/// @nodoc
abstract mixin class $SchemeCopyWith<$Res> {
  factory $SchemeCopyWith(Scheme value, $Res Function(Scheme) _then) =
      _$SchemeCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? background,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceBright,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLowest,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outline,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outlineVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseOnSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? scrim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceTint,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inversePrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onError,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onErrorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlActivated,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlNormal,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlHighlight,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textHintInverse,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? widgetBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockHour,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockMinute,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockSecond,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? weatherTemp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onThemeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeAppRing,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeNotif,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandA,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandB,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandC,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandD,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? underSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeActive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeActive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeInactive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? overviewBackground,
  });
}

/// @nodoc
class _$SchemeCopyWithImpl<$Res> implements $SchemeCopyWith<$Res> {
  _$SchemeCopyWithImpl(this._self, this._then);

  final Scheme _self;
  final $Res Function(Scheme) _then;

  /// Create a copy of Scheme
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
                  as int?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        background: freezed == background
            ? _self.background
            : background // ignore: cast_nullable_to_non_nullable
                  as int?,
        onBackground: freezed == onBackground
            ? _self.onBackground
            : onBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
        surface: freezed == surface
            ? _self.surface
            : surface // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceDim: freezed == surfaceDim
            ? _self.surfaceDim
            : surfaceDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceBright: freezed == surfaceBright
            ? _self.surfaceBright
            : surfaceBright // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerLowest: freezed == surfaceContainerLowest
            ? _self.surfaceContainerLowest
            : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerLow: freezed == surfaceContainerLow
            ? _self.surfaceContainerLow
            : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainer: freezed == surfaceContainer
            ? _self.surfaceContainer
            : surfaceContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerHigh: freezed == surfaceContainerHigh
            ? _self.surfaceContainerHigh
            : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerHighest: freezed == surfaceContainerHighest
            ? _self.surfaceContainerHighest
            : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSurface: freezed == onSurface
            ? _self.onSurface
            : onSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceVariant: freezed == surfaceVariant
            ? _self.surfaceVariant
            : surfaceVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSurfaceVariant: freezed == onSurfaceVariant
            ? _self.onSurfaceVariant
            : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        outline: freezed == outline
            ? _self.outline
            : outline // ignore: cast_nullable_to_non_nullable
                  as int?,
        outlineVariant: freezed == outlineVariant
            ? _self.outlineVariant
            : outlineVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        inverseSurface: freezed == inverseSurface
            ? _self.inverseSurface
            : inverseSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        inverseOnSurface: freezed == inverseOnSurface
            ? _self.inverseOnSurface
            : inverseOnSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as int?,
        scrim: freezed == scrim
            ? _self.scrim
            : scrim // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceTint: freezed == surfaceTint
            ? _self.surfaceTint
            : surfaceTint // ignore: cast_nullable_to_non_nullable
                  as int?,
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryDim: freezed == primaryDim
            ? _self.primaryDim
            : primaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimary: freezed == onPrimary
            ? _self.onPrimary
            : onPrimary // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryContainer: freezed == primaryContainer
            ? _self.primaryContainer
            : primaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryContainer: freezed == onPrimaryContainer
            ? _self.onPrimaryContainer
            : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryFixed: freezed == primaryFixed
            ? _self.primaryFixed
            : primaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryFixedDim: freezed == primaryFixedDim
            ? _self.primaryFixedDim
            : primaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryFixed: freezed == onPrimaryFixed
            ? _self.onPrimaryFixed
            : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryFixedVariant: freezed == onPrimaryFixedVariant
            ? _self.onPrimaryFixedVariant
            : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        inversePrimary: freezed == inversePrimary
            ? _self.inversePrimary
            : inversePrimary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryDim: freezed == secondaryDim
            ? _self.secondaryDim
            : secondaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondary: freezed == onSecondary
            ? _self.onSecondary
            : onSecondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryContainer: freezed == secondaryContainer
            ? _self.secondaryContainer
            : secondaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryContainer: freezed == onSecondaryContainer
            ? _self.onSecondaryContainer
            : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryFixed: freezed == secondaryFixed
            ? _self.secondaryFixed
            : secondaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryFixedDim: freezed == secondaryFixedDim
            ? _self.secondaryFixedDim
            : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryFixed: freezed == onSecondaryFixed
            ? _self.onSecondaryFixed
            : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryFixedVariant: freezed == onSecondaryFixedVariant
            ? _self.onSecondaryFixedVariant
            : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryDim: freezed == tertiaryDim
            ? _self.tertiaryDim
            : tertiaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiary: freezed == onTertiary
            ? _self.onTertiary
            : onTertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryContainer: freezed == tertiaryContainer
            ? _self.tertiaryContainer
            : tertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryContainer: freezed == onTertiaryContainer
            ? _self.onTertiaryContainer
            : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryFixed: freezed == tertiaryFixed
            ? _self.tertiaryFixed
            : tertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryFixedDim: freezed == tertiaryFixedDim
            ? _self.tertiaryFixedDim
            : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryFixed: freezed == onTertiaryFixed
            ? _self.onTertiaryFixed
            : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryFixedVariant: freezed == onTertiaryFixedVariant
            ? _self.onTertiaryFixedVariant
            : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorDim: freezed == errorDim
            ? _self.errorDim
            : errorDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onError: freezed == onError
            ? _self.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorContainer: freezed == errorContainer
            ? _self.errorContainer
            : errorContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onErrorContainer: freezed == onErrorContainer
            ? _self.onErrorContainer
            : onErrorContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlActivated: freezed == controlActivated
            ? _self.controlActivated
            : controlActivated // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlNormal: freezed == controlNormal
            ? _self.controlNormal
            : controlNormal // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlHighlight: freezed == controlHighlight
            ? _self.controlHighlight
            : controlHighlight // ignore: cast_nullable_to_non_nullable
                  as int?,
        textPrimaryInverse: freezed == textPrimaryInverse
            ? _self.textPrimaryInverse
            : textPrimaryInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        textSecondaryAndTertiaryInverse:
            freezed == textSecondaryAndTertiaryInverse
            ? _self.textSecondaryAndTertiaryInverse
            : textSecondaryAndTertiaryInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        textPrimaryInverseDisableOnly: freezed == textPrimaryInverseDisableOnly
            ? _self.textPrimaryInverseDisableOnly
            : textPrimaryInverseDisableOnly // ignore: cast_nullable_to_non_nullable
                  as int?,
        textSecondaryAndTertiaryInverseDisabled:
            freezed == textSecondaryAndTertiaryInverseDisabled
            ? _self.textSecondaryAndTertiaryInverseDisabled
            : textSecondaryAndTertiaryInverseDisabled // ignore: cast_nullable_to_non_nullable
                  as int?,
        textHintInverse: freezed == textHintInverse
            ? _self.textHintInverse
            : textHintInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        widgetBackground: freezed == widgetBackground
            ? _self.widgetBackground
            : widgetBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockHour: freezed == clockHour
            ? _self.clockHour
            : clockHour // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockMinute: freezed == clockMinute
            ? _self.clockMinute
            : clockMinute // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockSecond: freezed == clockSecond
            ? _self.clockSecond
            : clockSecond // ignore: cast_nullable_to_non_nullable
                  as int?,
        weatherTemp: freezed == weatherTemp
            ? _self.weatherTemp
            : weatherTemp // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeApp: freezed == themeApp
            ? _self.themeApp
            : themeApp // ignore: cast_nullable_to_non_nullable
                  as int?,
        onThemeApp: freezed == onThemeApp
            ? _self.onThemeApp
            : onThemeApp // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeAppRing: freezed == themeAppRing
            ? _self.themeAppRing
            : themeAppRing // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeNotif: freezed == themeNotif
            ? _self.themeNotif
            : themeNotif // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandA: freezed == brandA
            ? _self.brandA
            : brandA // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandB: freezed == brandB
            ? _self.brandB
            : brandB // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandC: freezed == brandC
            ? _self.brandC
            : brandC // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandD: freezed == brandD
            ? _self.brandD
            : brandD // ignore: cast_nullable_to_non_nullable
                  as int?,
        underSurface: freezed == underSurface
            ? _self.underSurface
            : underSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeActive: freezed == shadeActive
            ? _self.shadeActive
            : shadeActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeActive: freezed == onShadeActive
            ? _self.onShadeActive
            : onShadeActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeActiveVariant: freezed == onShadeActiveVariant
            ? _self.onShadeActiveVariant
            : onShadeActiveVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeInactive: freezed == shadeInactive
            ? _self.shadeInactive
            : shadeInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeInactive: freezed == onShadeInactive
            ? _self.onShadeInactive
            : onShadeInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeInactiveVariant: freezed == onShadeInactiveVariant
            ? _self.onShadeInactiveVariant
            : onShadeInactiveVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeDisabled: freezed == shadeDisabled
            ? _self.shadeDisabled
            : shadeDisabled // ignore: cast_nullable_to_non_nullable
                  as int?,
        overviewBackground: freezed == overviewBackground
            ? _self.overviewBackground
            : overviewBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _Scheme extends Scheme {
  const _Scheme({
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.background,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surfaceDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surfaceBright,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.surfaceContainerLowest,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.surfaceContainerLow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surfaceContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onSurfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.outline,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.outlineVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.inverseSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.inverseOnSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.shadow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.scrim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.surfaceTint,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onPrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onPrimaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.primaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.inversePrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onSecondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onSecondaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.secondaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onTertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onTertiaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.error,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.errorDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onError,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.errorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onErrorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.controlActivated,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.controlNormal,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.controlHighlight,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.textHintInverse,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.widgetBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.clockHour,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.clockMinute,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.clockSecond,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.weatherTemp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.themeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onThemeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.themeAppRing,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.themeNotif,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.brandA,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.brandB,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.brandC,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.brandD,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.underSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.shadeActive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onShadeActive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.shadeInactive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.onShadeInactive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    this.onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.shadeDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() this.overviewBackground,
  }) : super._();
  factory _Scheme.fromJson(Map<String, dynamic> json) => _$SchemeFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiaryPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? neutralPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? neutralVariantPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? errorPaletteKeyColor;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? background;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onBackground;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surface;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceBright;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceContainerLowest;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceContainerLow;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceContainerHigh;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceContainerHighest;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSurface;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSurfaceVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? outline;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? outlineVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? inverseSurface;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? inverseOnSurface;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? shadow;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? scrim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? surfaceTint;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onPrimary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onPrimaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? primaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onPrimaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onPrimaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? inversePrimary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSecondary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSecondaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? secondaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSecondaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onSecondaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiaryDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onTertiary;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onTertiaryContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? tertiaryFixedDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onTertiaryFixed;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onTertiaryFixedVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? error;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? errorDim;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onError;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? errorContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onErrorContainer;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? controlActivated;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? controlNormal;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? controlHighlight;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? textPrimaryInverse;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? textSecondaryAndTertiaryInverse;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? textPrimaryInverseDisableOnly;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? textSecondaryAndTertiaryInverseDisabled;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? textHintInverse;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? widgetBackground;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? clockHour;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? clockMinute;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? clockSecond;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? weatherTemp;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? themeApp;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onThemeApp;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? themeAppRing;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? themeNotif;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? brandA;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? brandB;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? brandC;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? brandD;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? underSurface;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? shadeActive;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onShadeActive;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onShadeActiveVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? shadeInactive;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onShadeInactive;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? onShadeInactiveVariant;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? shadeDisabled;
  @override
  @JsonKey(includeIfNull: false)
  @_ArgbHexConverter()
  final int? overviewBackground;

  /// Create a copy of Scheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SchemeCopyWith<_Scheme> get copyWith =>
      __$SchemeCopyWithImpl<_Scheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SchemeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Scheme &&
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
    return 'Scheme(primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor, background: $background, onBackground: $onBackground, surface: $surface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint, primary: $primary, primaryDim: $primaryDim, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, inversePrimary: $inversePrimary, secondary: $secondary, secondaryDim: $secondaryDim, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, tertiaryDim: $tertiaryDim, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, errorDim: $errorDim, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, controlActivated: $controlActivated, controlNormal: $controlNormal, controlHighlight: $controlHighlight, textPrimaryInverse: $textPrimaryInverse, textSecondaryAndTertiaryInverse: $textSecondaryAndTertiaryInverse, textPrimaryInverseDisableOnly: $textPrimaryInverseDisableOnly, textSecondaryAndTertiaryInverseDisabled: $textSecondaryAndTertiaryInverseDisabled, textHintInverse: $textHintInverse, widgetBackground: $widgetBackground, clockHour: $clockHour, clockMinute: $clockMinute, clockSecond: $clockSecond, weatherTemp: $weatherTemp, themeApp: $themeApp, onThemeApp: $onThemeApp, themeAppRing: $themeAppRing, themeNotif: $themeNotif, brandA: $brandA, brandB: $brandB, brandC: $brandC, brandD: $brandD, underSurface: $underSurface, shadeActive: $shadeActive, onShadeActive: $onShadeActive, onShadeActiveVariant: $onShadeActiveVariant, shadeInactive: $shadeInactive, onShadeInactive: $onShadeInactive, onShadeInactiveVariant: $onShadeInactiveVariant, shadeDisabled: $shadeDisabled, overviewBackground: $overviewBackground)';
  }
}

/// @nodoc
abstract mixin class _$SchemeCopyWith<$Res> implements $SchemeCopyWith<$Res> {
  factory _$SchemeCopyWith(_Scheme value, $Res Function(_Scheme) _then) =
      __$SchemeCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? errorPaletteKeyColor,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? background,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceBright,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLowest,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerLow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHigh,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? surfaceContainerHighest,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSurfaceVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outline,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? outlineVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inverseOnSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadow,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? scrim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? surfaceTint,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? primaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onPrimaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onPrimaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? inversePrimary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? secondaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onSecondaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onSecondaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiary,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryContainer,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixed,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? tertiaryFixedDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onTertiaryFixed,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onTertiaryFixedVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? error,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorDim,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onError,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? errorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onErrorContainer,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlActivated,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlNormal,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? controlHighlight,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textPrimaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverse,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textPrimaryInverseDisableOnly,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? textSecondaryAndTertiaryInverseDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? textHintInverse,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? widgetBackground,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockHour,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockMinute,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? clockSecond,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? weatherTemp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onThemeApp,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeAppRing,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? themeNotif,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandA,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandB,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandC,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? brandD,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? underSurface,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeActive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeActive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeActiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeInactive,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? onShadeInactive,
    @JsonKey(includeIfNull: false)
    @_ArgbHexConverter()
    int? onShadeInactiveVariant,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? shadeDisabled,
    @JsonKey(includeIfNull: false) @_ArgbHexConverter() int? overviewBackground,
  });
}

/// @nodoc
class __$SchemeCopyWithImpl<$Res> implements _$SchemeCopyWith<$Res> {
  __$SchemeCopyWithImpl(this._self, this._then);

  final _Scheme _self;
  final $Res Function(_Scheme) _then;

  /// Create a copy of Scheme
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
      _Scheme(
        primaryPaletteKeyColor: freezed == primaryPaletteKeyColor
            ? _self.primaryPaletteKeyColor
            : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor
            ? _self.secondaryPaletteKeyColor
            : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor
            ? _self.tertiaryPaletteKeyColor
            : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralPaletteKeyColor: freezed == neutralPaletteKeyColor
            ? _self.neutralPaletteKeyColor
            : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor
            ? _self.neutralVariantPaletteKeyColor
            : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorPaletteKeyColor: freezed == errorPaletteKeyColor
            ? _self.errorPaletteKeyColor
            : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
                  as int?,
        background: freezed == background
            ? _self.background
            : background // ignore: cast_nullable_to_non_nullable
                  as int?,
        onBackground: freezed == onBackground
            ? _self.onBackground
            : onBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
        surface: freezed == surface
            ? _self.surface
            : surface // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceDim: freezed == surfaceDim
            ? _self.surfaceDim
            : surfaceDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceBright: freezed == surfaceBright
            ? _self.surfaceBright
            : surfaceBright // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerLowest: freezed == surfaceContainerLowest
            ? _self.surfaceContainerLowest
            : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerLow: freezed == surfaceContainerLow
            ? _self.surfaceContainerLow
            : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainer: freezed == surfaceContainer
            ? _self.surfaceContainer
            : surfaceContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerHigh: freezed == surfaceContainerHigh
            ? _self.surfaceContainerHigh
            : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceContainerHighest: freezed == surfaceContainerHighest
            ? _self.surfaceContainerHighest
            : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSurface: freezed == onSurface
            ? _self.onSurface
            : onSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceVariant: freezed == surfaceVariant
            ? _self.surfaceVariant
            : surfaceVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSurfaceVariant: freezed == onSurfaceVariant
            ? _self.onSurfaceVariant
            : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        outline: freezed == outline
            ? _self.outline
            : outline // ignore: cast_nullable_to_non_nullable
                  as int?,
        outlineVariant: freezed == outlineVariant
            ? _self.outlineVariant
            : outlineVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        inverseSurface: freezed == inverseSurface
            ? _self.inverseSurface
            : inverseSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        inverseOnSurface: freezed == inverseOnSurface
            ? _self.inverseOnSurface
            : inverseOnSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as int?,
        scrim: freezed == scrim
            ? _self.scrim
            : scrim // ignore: cast_nullable_to_non_nullable
                  as int?,
        surfaceTint: freezed == surfaceTint
            ? _self.surfaceTint
            : surfaceTint // ignore: cast_nullable_to_non_nullable
                  as int?,
        primary: freezed == primary
            ? _self.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryDim: freezed == primaryDim
            ? _self.primaryDim
            : primaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimary: freezed == onPrimary
            ? _self.onPrimary
            : onPrimary // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryContainer: freezed == primaryContainer
            ? _self.primaryContainer
            : primaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryContainer: freezed == onPrimaryContainer
            ? _self.onPrimaryContainer
            : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryFixed: freezed == primaryFixed
            ? _self.primaryFixed
            : primaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        primaryFixedDim: freezed == primaryFixedDim
            ? _self.primaryFixedDim
            : primaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryFixed: freezed == onPrimaryFixed
            ? _self.onPrimaryFixed
            : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onPrimaryFixedVariant: freezed == onPrimaryFixedVariant
            ? _self.onPrimaryFixedVariant
            : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        inversePrimary: freezed == inversePrimary
            ? _self.inversePrimary
            : inversePrimary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondary: freezed == secondary
            ? _self.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryDim: freezed == secondaryDim
            ? _self.secondaryDim
            : secondaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondary: freezed == onSecondary
            ? _self.onSecondary
            : onSecondary // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryContainer: freezed == secondaryContainer
            ? _self.secondaryContainer
            : secondaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryContainer: freezed == onSecondaryContainer
            ? _self.onSecondaryContainer
            : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryFixed: freezed == secondaryFixed
            ? _self.secondaryFixed
            : secondaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        secondaryFixedDim: freezed == secondaryFixedDim
            ? _self.secondaryFixedDim
            : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryFixed: freezed == onSecondaryFixed
            ? _self.onSecondaryFixed
            : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSecondaryFixedVariant: freezed == onSecondaryFixedVariant
            ? _self.onSecondaryFixedVariant
            : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiary: freezed == tertiary
            ? _self.tertiary
            : tertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryDim: freezed == tertiaryDim
            ? _self.tertiaryDim
            : tertiaryDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiary: freezed == onTertiary
            ? _self.onTertiary
            : onTertiary // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryContainer: freezed == tertiaryContainer
            ? _self.tertiaryContainer
            : tertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryContainer: freezed == onTertiaryContainer
            ? _self.onTertiaryContainer
            : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryFixed: freezed == tertiaryFixed
            ? _self.tertiaryFixed
            : tertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        tertiaryFixedDim: freezed == tertiaryFixedDim
            ? _self.tertiaryFixedDim
            : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryFixed: freezed == onTertiaryFixed
            ? _self.onTertiaryFixed
            : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTertiaryFixedVariant: freezed == onTertiaryFixedVariant
            ? _self.onTertiaryFixedVariant
            : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorDim: freezed == errorDim
            ? _self.errorDim
            : errorDim // ignore: cast_nullable_to_non_nullable
                  as int?,
        onError: freezed == onError
            ? _self.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as int?,
        errorContainer: freezed == errorContainer
            ? _self.errorContainer
            : errorContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        onErrorContainer: freezed == onErrorContainer
            ? _self.onErrorContainer
            : onErrorContainer // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlActivated: freezed == controlActivated
            ? _self.controlActivated
            : controlActivated // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlNormal: freezed == controlNormal
            ? _self.controlNormal
            : controlNormal // ignore: cast_nullable_to_non_nullable
                  as int?,
        controlHighlight: freezed == controlHighlight
            ? _self.controlHighlight
            : controlHighlight // ignore: cast_nullable_to_non_nullable
                  as int?,
        textPrimaryInverse: freezed == textPrimaryInverse
            ? _self.textPrimaryInverse
            : textPrimaryInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        textSecondaryAndTertiaryInverse:
            freezed == textSecondaryAndTertiaryInverse
            ? _self.textSecondaryAndTertiaryInverse
            : textSecondaryAndTertiaryInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        textPrimaryInverseDisableOnly: freezed == textPrimaryInverseDisableOnly
            ? _self.textPrimaryInverseDisableOnly
            : textPrimaryInverseDisableOnly // ignore: cast_nullable_to_non_nullable
                  as int?,
        textSecondaryAndTertiaryInverseDisabled:
            freezed == textSecondaryAndTertiaryInverseDisabled
            ? _self.textSecondaryAndTertiaryInverseDisabled
            : textSecondaryAndTertiaryInverseDisabled // ignore: cast_nullable_to_non_nullable
                  as int?,
        textHintInverse: freezed == textHintInverse
            ? _self.textHintInverse
            : textHintInverse // ignore: cast_nullable_to_non_nullable
                  as int?,
        widgetBackground: freezed == widgetBackground
            ? _self.widgetBackground
            : widgetBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockHour: freezed == clockHour
            ? _self.clockHour
            : clockHour // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockMinute: freezed == clockMinute
            ? _self.clockMinute
            : clockMinute // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockSecond: freezed == clockSecond
            ? _self.clockSecond
            : clockSecond // ignore: cast_nullable_to_non_nullable
                  as int?,
        weatherTemp: freezed == weatherTemp
            ? _self.weatherTemp
            : weatherTemp // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeApp: freezed == themeApp
            ? _self.themeApp
            : themeApp // ignore: cast_nullable_to_non_nullable
                  as int?,
        onThemeApp: freezed == onThemeApp
            ? _self.onThemeApp
            : onThemeApp // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeAppRing: freezed == themeAppRing
            ? _self.themeAppRing
            : themeAppRing // ignore: cast_nullable_to_non_nullable
                  as int?,
        themeNotif: freezed == themeNotif
            ? _self.themeNotif
            : themeNotif // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandA: freezed == brandA
            ? _self.brandA
            : brandA // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandB: freezed == brandB
            ? _self.brandB
            : brandB // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandC: freezed == brandC
            ? _self.brandC
            : brandC // ignore: cast_nullable_to_non_nullable
                  as int?,
        brandD: freezed == brandD
            ? _self.brandD
            : brandD // ignore: cast_nullable_to_non_nullable
                  as int?,
        underSurface: freezed == underSurface
            ? _self.underSurface
            : underSurface // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeActive: freezed == shadeActive
            ? _self.shadeActive
            : shadeActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeActive: freezed == onShadeActive
            ? _self.onShadeActive
            : onShadeActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeActiveVariant: freezed == onShadeActiveVariant
            ? _self.onShadeActiveVariant
            : onShadeActiveVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeInactive: freezed == shadeInactive
            ? _self.shadeInactive
            : shadeInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeInactive: freezed == onShadeInactive
            ? _self.onShadeInactive
            : onShadeInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
        onShadeInactiveVariant: freezed == onShadeInactiveVariant
            ? _self.onShadeInactiveVariant
            : onShadeInactiveVariant // ignore: cast_nullable_to_non_nullable
                  as int?,
        shadeDisabled: freezed == shadeDisabled
            ? _self.shadeDisabled
            : shadeDisabled // ignore: cast_nullable_to_non_nullable
                  as int?,
        overviewBackground: freezed == overviewBackground
            ? _self.overviewBackground
            : overviewBackground // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
