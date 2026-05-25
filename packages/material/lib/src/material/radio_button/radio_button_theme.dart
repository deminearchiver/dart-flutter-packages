import 'package:material/src/material/flutter.dart';

abstract interface class RadioButtonStates
    implements SelectableStates, InteractiveStates {}

abstract interface class RadioButtonDisabledStates
    implements RadioButtonStates, InteractiveDisabledStates {}

abstract interface class RadioButtonEnabledStates
    implements RadioButtonStates, InteractiveEnabledStates {}

typedef RadioButtonStateProperty<T extends Object?> =
    StateProperty<T, RadioButtonStates>;

abstract class RadioButtonThemeDataPartial with Diagnosticable {
  const RadioButtonThemeDataPartial();

  const factory RadioButtonThemeDataPartial.from({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) = _RadioButtonThemeDataPartial;

  RadioButtonStateProperty<Size?>? get stateLayerSize;

  RadioButtonStateProperty<ShapeBorder?>? get stateLayerShape;

  RadioButtonStateProperty<Color?>? get stateLayerColor;

  RadioButtonStateProperty<double?>? get stateLayerOpacity;

  RadioButtonStateProperty<double?>? get iconSize;

  RadioButtonStateProperty<Color?>? get iconBackgroundColor;

  RadioButtonStateProperty<Color?>? get iconOutlineColor;

  RadioButtonStateProperty<Color?>? get iconDotColor;

  RadioButtonThemeDataPartial copy() => copyWith();

  RadioButtonThemeDataPartial copyWith({
    covariant RadioButtonStateProperty<Size?>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    covariant RadioButtonStateProperty<Color?>? stateLayerColor,
    covariant RadioButtonStateProperty<double?>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double?>? iconSize,
    covariant RadioButtonStateProperty<Color?>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color?>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color?>? iconDotColor,
  }) => .from(
    stateLayerSize: stateLayerSize ?? this.stateLayerSize,
    stateLayerShape: stateLayerShape ?? this.stateLayerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    iconSize: iconSize ?? this.iconSize,
    iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
    iconOutlineColor: iconOutlineColor ?? this.iconOutlineColor,
    iconDotColor: iconDotColor ?? this.iconDotColor,
  );

  RadioButtonThemeDataPartial maybeCopyWith({
    covariant RadioButtonStateProperty<Size?>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    covariant RadioButtonStateProperty<Color?>? stateLayerColor,
    covariant RadioButtonStateProperty<double?>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double?>? iconSize,
    covariant RadioButtonStateProperty<Color?>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color?>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color?>? iconDotColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          iconSize != null ||
          iconBackgroundColor != null ||
          iconOutlineColor != null ||
          iconDotColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          iconSize: iconSize,
          iconBackgroundColor: iconBackgroundColor,
          iconOutlineColor: iconOutlineColor,
          iconDotColor: iconDotColor,
        )
      : this;

  RadioButtonThemeDataPartial mergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) => .from(
    stateLayerSize: this.stateLayerSize.maybeMergeNullable(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMergeNullable(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMergeNullable(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
      stateLayerOpacity,
    ),
    iconSize: this.iconSize.maybeMergeNullable(iconSize),
    iconBackgroundColor: this.iconBackgroundColor.maybeMergeNullable(
      iconBackgroundColor,
    ),
    iconOutlineColor: this.iconOutlineColor.maybeMergeNullable(
      iconOutlineColor,
    ),
    iconDotColor: this.iconDotColor.maybeMergeNullable(iconDotColor),
  );

  RadioButtonThemeDataPartial maybeMergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          iconSize != null ||
          iconBackgroundColor != null ||
          iconOutlineColor != null ||
          iconDotColor != null
      ? .from(
          stateLayerSize: this.stateLayerSize.maybeMergeNullable(
            stateLayerSize,
          ),
          stateLayerShape: this.stateLayerShape.maybeMergeNullable(
            stateLayerShape,
          ),
          stateLayerColor: this.stateLayerColor.maybeMergeNullable(
            stateLayerColor,
          ),
          stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
            stateLayerOpacity,
          ),
          iconSize: this.iconSize.maybeMergeNullable(iconSize),
          iconBackgroundColor: this.iconBackgroundColor.maybeMergeNullable(
            iconBackgroundColor,
          ),
          iconOutlineColor: this.iconOutlineColor.maybeMergeNullable(
            iconOutlineColor,
          ),
          iconDotColor: this.iconDotColor.maybeMergeNullable(iconDotColor),
        )
      : this;

  RadioButtonThemeDataPartial merge(RadioButtonThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          iconSize: other.iconSize,
          iconBackgroundColor: other.iconBackgroundColor,
          iconOutlineColor: other.iconOutlineColor,
          iconDotColor: other.iconDotColor,
        )
      : copy();

  RadioButtonThemeDataPartial maybeMerge(RadioButtonThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          iconSize: other.iconSize,
          iconBackgroundColor: other.iconBackgroundColor,
          iconOutlineColor: other.iconOutlineColor,
          iconDotColor: other.iconDotColor,
        )
      : this;
}

final class _RadioButtonThemeDataPartial extends RadioButtonThemeDataPartial {
  const _RadioButtonThemeDataPartial({
    this.stateLayerSize,
    this.stateLayerShape,
    this.stateLayerColor,
    this.stateLayerOpacity,
    this.iconSize,
    this.iconBackgroundColor,
    this.iconOutlineColor,
    this.iconDotColor,
  });

  @override
  final RadioButtonStateProperty<Size?>? stateLayerSize;

  @override
  final RadioButtonStateProperty<ShapeBorder?>? stateLayerShape;

  @override
  final RadioButtonStateProperty<Color?>? stateLayerColor;

  @override
  final RadioButtonStateProperty<double?>? stateLayerOpacity;

  @override
  final RadioButtonStateProperty<double?>? iconSize;

  @override
  final RadioButtonStateProperty<Color?>? iconBackgroundColor;

  @override
  final RadioButtonStateProperty<Color?>? iconOutlineColor;

  @override
  final RadioButtonStateProperty<Color?>? iconDotColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _RadioButtonThemeDataPartial &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          iconSize == other.iconSize &&
          iconBackgroundColor == other.iconBackgroundColor &&
          iconOutlineColor == other.iconOutlineColor &&
          iconDotColor == other.iconDotColor;

  @override
  int get hashCode => Object.hash(
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    iconSize,
    iconBackgroundColor,
    iconOutlineColor,
    iconDotColor,
  );
}

abstract class RadioButtonThemeData extends RadioButtonThemeDataPartial {
  const RadioButtonThemeData();

  const factory RadioButtonThemeData.from({
    required RadioButtonStateProperty<Size> stateLayerSize,
    required RadioButtonStateProperty<ShapeBorder> stateLayerShape,
    required RadioButtonStateProperty<Color> stateLayerColor,
    required RadioButtonStateProperty<double> stateLayerOpacity,
    required RadioButtonStateProperty<double> iconSize,
    required RadioButtonStateProperty<Color> iconBackgroundColor,
    required RadioButtonStateProperty<Color> iconOutlineColor,
    required RadioButtonStateProperty<Color> iconDotColor,
  }) = _RadioButtonThemeData;

  const factory RadioButtonThemeData.defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    RadioButtonThemeDataPartial? overrides,
  }) = _RadioButtonThemeDataDefaults;

  @override
  RadioButtonStateProperty<Size> get stateLayerSize;

  @override
  RadioButtonStateProperty<ShapeBorder> get stateLayerShape;

  @override
  RadioButtonStateProperty<Color> get stateLayerColor;

  @override
  RadioButtonStateProperty<double> get stateLayerOpacity;

  @override
  RadioButtonStateProperty<double> get iconSize;

  @override
  RadioButtonStateProperty<Color> get iconBackgroundColor;

  @override
  RadioButtonStateProperty<Color> get iconOutlineColor;

  @override
  RadioButtonStateProperty<Color> get iconDotColor;

  @override
  RadioButtonThemeData copy() => copyWith();

  @override
  RadioButtonThemeData copyWith({
    covariant RadioButtonStateProperty<Size>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder>? stateLayerShape,
    covariant RadioButtonStateProperty<Color>? stateLayerColor,
    covariant RadioButtonStateProperty<double>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double>? iconSize,
    covariant RadioButtonStateProperty<Color>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color>? iconDotColor,
  }) => .from(
    stateLayerSize: stateLayerSize ?? this.stateLayerSize,
    stateLayerShape: stateLayerShape ?? this.stateLayerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    iconSize: iconSize ?? this.iconSize,
    iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
    iconOutlineColor: iconOutlineColor ?? this.iconOutlineColor,
    iconDotColor: iconDotColor ?? this.iconDotColor,
  );

  @override
  RadioButtonThemeData maybeCopyWith({
    covariant RadioButtonStateProperty<Size>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder>? stateLayerShape,
    covariant RadioButtonStateProperty<Color>? stateLayerColor,
    covariant RadioButtonStateProperty<double>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double>? iconSize,
    covariant RadioButtonStateProperty<Color>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color>? iconDotColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          iconSize != null ||
          iconBackgroundColor != null ||
          iconOutlineColor != null ||
          iconDotColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          iconSize: iconSize,
          iconBackgroundColor: iconBackgroundColor,
          iconOutlineColor: iconOutlineColor,
          iconDotColor: iconDotColor,
        )
      : this;

  @override
  RadioButtonThemeData mergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) => .from(
    stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMerge(stateLayerOpacity),
    iconSize: this.iconSize.maybeMerge(iconSize),
    iconBackgroundColor: this.iconBackgroundColor.maybeMerge(
      iconBackgroundColor,
    ),
    iconOutlineColor: this.iconOutlineColor.maybeMerge(iconOutlineColor),
    iconDotColor: this.iconDotColor.maybeMerge(iconDotColor),
  );

  @override
  RadioButtonThemeData maybeMergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          iconSize != null ||
          iconBackgroundColor != null ||
          iconOutlineColor != null ||
          iconDotColor != null
      ? .from(
          stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
          stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
          stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
          stateLayerOpacity: this.stateLayerOpacity.maybeMerge(
            stateLayerOpacity,
          ),
          iconSize: this.iconSize.maybeMerge(iconSize),
          iconBackgroundColor: this.iconBackgroundColor.maybeMerge(
            iconBackgroundColor,
          ),
          iconOutlineColor: this.iconOutlineColor.maybeMerge(iconOutlineColor),
          iconDotColor: this.iconDotColor.maybeMerge(iconDotColor),
        )
      : this;

  @override
  RadioButtonThemeData merge(RadioButtonThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          iconSize: other.iconSize,
          iconBackgroundColor: other.iconBackgroundColor,
          iconOutlineColor: other.iconOutlineColor,
          iconDotColor: other.iconDotColor,
        )
      : copy();

  @override
  RadioButtonThemeData maybeMerge(RadioButtonThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          iconSize: other.iconSize,
          iconBackgroundColor: other.iconBackgroundColor,
          iconOutlineColor: other.iconOutlineColor,
          iconDotColor: other.iconDotColor,
        )
      : this;
}

final class _RadioButtonThemeData extends RadioButtonThemeData {
  const _RadioButtonThemeData({
    required this.stateLayerSize,
    required this.stateLayerShape,
    required this.stateLayerColor,
    required this.stateLayerOpacity,
    required this.iconSize,
    required this.iconBackgroundColor,
    required this.iconOutlineColor,
    required this.iconDotColor,
  });

  @override
  final RadioButtonStateProperty<Size> stateLayerSize;

  @override
  final RadioButtonStateProperty<ShapeBorder> stateLayerShape;

  @override
  final RadioButtonStateProperty<Color> stateLayerColor;

  @override
  final RadioButtonStateProperty<double> stateLayerOpacity;

  @override
  final RadioButtonStateProperty<double> iconSize;

  @override
  final RadioButtonStateProperty<Color> iconBackgroundColor;

  @override
  final RadioButtonStateProperty<Color> iconOutlineColor;

  @override
  final RadioButtonStateProperty<Color> iconDotColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _RadioButtonThemeData &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          iconSize == other.iconSize &&
          iconBackgroundColor == other.iconBackgroundColor &&
          iconOutlineColor == other.iconOutlineColor &&
          iconDotColor == other.iconDotColor;

  @override
  int get hashCode => Object.hash(
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    iconSize,
    iconBackgroundColor,
    iconOutlineColor,
    iconDotColor,
  );
}

final class _RadioButtonThemeDataDefaults extends RadioButtonThemeData {
  const _RadioButtonThemeDataDefaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    RadioButtonThemeDataPartial? overrides,
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final RadioButtonThemeDataPartial _overrides;

  @override
  RadioButtonStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) =>
        _overrides.stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  RadioButtonStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _overrides.stateLayerShape?.resolve(states) ??
        _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
  );

  @override
  RadioButtonStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _overrides.stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  RadioButtonStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _overrides.stateLayerOpacity?.resolve(states) ??
        switch (states) {
          RadioButtonEnabledStates(isPressed: true) =>
            _stateTheme.pressedStateLayerOpacity,
          RadioButtonEnabledStates(isHovered: true) =>
            _stateTheme.hoverStateLayerOpacity,
          RadioButtonEnabledStates(isFocused: true) => 0.0,
          RadioButtonStates() => 0.0,
        },
  );

  @override
  RadioButtonStateProperty<double> get iconSize =>
      .resolveWith((states) => _overrides.iconSize?.resolve(states) ?? 20.0);

  @override
  RadioButtonStateProperty<Color> get iconBackgroundColor => .resolveWith(
    (states) =>
        _overrides.iconBackgroundColor?.resolve(states) ?? Colors.transparent,
  );

  @override
  RadioButtonStateProperty<Color> get iconOutlineColor => .resolveWith(
    (states) =>
        _overrides.iconOutlineColor?.resolve(states) ??
        switch (states) {
          RadioButtonDisabledStates() => _colorTheme.onSurface.withValues(
            alpha: 0.38,
          ),
          RadioButtonEnabledStates(
            isSelected: false,
            isPressed: false,
            isFocused: false,
            isHovered: false,
          ) =>
            _colorTheme.onSurfaceVariant,
          RadioButtonStates(isSelected: false) => _colorTheme.onSurface,
          RadioButtonStates(isSelected: true) => _colorTheme.primary,
        },
  );

  @override
  RadioButtonStateProperty<Color> get iconDotColor => .resolveWith(
    (states) =>
        _overrides.iconDotColor?.resolve(states) ??
        switch (states) {
          RadioButtonDisabledStates() => _colorTheme.onSurface.withValues(
            alpha: 0.38,
          ),
          RadioButtonEnabledStates(
            isSelected: false,
            isPressed: false,
            isFocused: false,
            isHovered: false,
          ) =>
            _colorTheme.onSurfaceVariant,
          RadioButtonStates(isSelected: false) => _colorTheme.onSurface,
          RadioButtonStates(isSelected: true) => _colorTheme.primary,
        },
  );

  @override
  RadioButtonThemeData copyWith({
    covariant RadioButtonStateProperty<Size>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder>? stateLayerShape,
    covariant RadioButtonStateProperty<Color>? stateLayerColor,
    covariant RadioButtonStateProperty<double>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double>? iconSize,
    covariant RadioButtonStateProperty<Color>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color>? iconDotColor,
  }) => _RadioButtonThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.copyWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      iconSize: iconSize,
      iconBackgroundColor: iconBackgroundColor,
      iconOutlineColor: iconOutlineColor,
      iconDotColor: iconDotColor,
    ),
  );

  @override
  RadioButtonThemeData maybeCopyWith({
    covariant RadioButtonStateProperty<Size>? stateLayerSize,
    covariant RadioButtonStateProperty<ShapeBorder>? stateLayerShape,
    covariant RadioButtonStateProperty<Color>? stateLayerColor,
    covariant RadioButtonStateProperty<double>? stateLayerOpacity,
    covariant RadioButtonStateProperty<double>? iconSize,
    covariant RadioButtonStateProperty<Color>? iconBackgroundColor,
    covariant RadioButtonStateProperty<Color>? iconOutlineColor,
    covariant RadioButtonStateProperty<Color>? iconDotColor,
  }) =>
      stateLayerSize != null &&
          stateLayerShape != null &&
          stateLayerColor != null &&
          stateLayerOpacity != null &&
          iconSize != null &&
          iconBackgroundColor != null &&
          iconOutlineColor != null &&
          iconDotColor != null
      ? .from(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          iconSize: iconSize,
          iconBackgroundColor: iconBackgroundColor,
          iconOutlineColor: iconOutlineColor,
          iconDotColor: iconDotColor,
        )
      : stateLayerSize != null ||
            stateLayerShape != null ||
            stateLayerColor != null ||
            stateLayerOpacity != null ||
            iconSize != null ||
            iconBackgroundColor != null ||
            iconOutlineColor != null ||
            iconDotColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          iconSize: iconSize,
          iconBackgroundColor: iconBackgroundColor,
          iconOutlineColor: iconOutlineColor,
          iconDotColor: iconDotColor,
        )
      : this;

  @override
  RadioButtonThemeData mergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) => _RadioButtonThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.mergeWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      iconSize: iconSize,
      iconBackgroundColor: iconBackgroundColor,
      iconOutlineColor: iconOutlineColor,
      iconDotColor: iconDotColor,
    ),
  );
  @override
  RadioButtonThemeData maybeMergeWith({
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) {
    final overrides = _overrides.maybeMergeWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      iconSize: iconSize,
      iconBackgroundColor: iconBackgroundColor,
      iconOutlineColor: iconOutlineColor,
      iconDotColor: iconDotColor,
    );
    return identical(_overrides, overrides)
        ? this
        : _RadioButtonThemeDataDefaults(
            colorTheme: _colorTheme,
            shapeTheme: _shapeTheme,
            stateTheme: _stateTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _RadioButtonThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode =>
      Object.hash(_colorTheme, _shapeTheme, _stateTheme, _overrides);
}

abstract class RadioButtonTheme extends StatelessWidget implements ProxyWidget {
  const RadioButtonTheme._({super.key, required this.child});

  const factory RadioButtonTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<RadioButtonThemeDataPartial> resolver,
    required Widget child,
  }) = _RadioButtonThemeWithResolver<RadioButtonThemeDataPartial>;

  const factory RadioButtonTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<RadioButtonThemeDataPartial> callback,
    required Widget child,
  }) = _RadioButtonThemeWithCallback<RadioButtonThemeDataPartial>;

  const factory RadioButtonTheme.mergeWithData({
    Key? key,
    required RadioButtonThemeDataPartial data,
    required Widget child,
  }) = _RadioButtonThemeWithData<RadioButtonThemeDataPartial>;

  const factory RadioButtonTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<RadioButtonThemeData> resolver,
    required Widget child,
  }) = _RadioButtonThemeWithResolver<RadioButtonThemeData>;

  const factory RadioButtonTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<RadioButtonThemeData> callback,
    required Widget child,
  }) = _RadioButtonThemeWithCallback<RadioButtonThemeData>;

  const factory RadioButtonTheme.replaceWithData({
    Key? key,
    required RadioButtonThemeData data,
    required Widget child,
  }) = _RadioButtonThemeWithData<RadioButtonThemeData>;

  ThemeResolver<RadioButtonThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _RadioButtonTheme.maybeResolverOf(context);
    return _RadioButtonTheme(
      resolver: inherited != null
          ? .combine(inherited, resolver, _merge)
          : resolver,
      child: child,
    );
  }

  static RadioButtonThemeDataPartial _merge(
    RadioButtonThemeDataPartial a,
    RadioButtonThemeDataPartial b,
  ) => a.maybeMerge(b);

  static RadioButtonThemeData of(BuildContext context) {
    final resolver = _RadioButtonTheme.maybeResolverOf(context);
    return .defaults(
      colorTheme: ColorTheme.of(context),
      shapeTheme: ShapeTheme.of(context),
      stateTheme: StateTheme.of(context),
      overrides: resolver?.resolve(context),
    );
  }
}

class _RadioButtonThemeWithResolver<T extends RadioButtonThemeDataPartial>
    extends RadioButtonTheme {
  const _RadioButtonThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _RadioButtonThemeWithCallback<T extends RadioButtonThemeDataPartial>
    extends RadioButtonTheme {
  const _RadioButtonThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _RadioButtonThemeWithData<T extends RadioButtonThemeDataPartial>
    extends RadioButtonTheme {
  const _RadioButtonThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

class _RadioButtonTheme extends InheritedTheme {
  const _RadioButtonTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final ThemeResolver<RadioButtonThemeDataPartial> resolver;

  @override
  bool updateShouldNotify(_RadioButtonTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _RadioButtonTheme(resolver: resolver, child: child);

  static ThemeResolver<RadioButtonThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      context.dependOnInheritedWidgetOfExactType<_RadioButtonTheme>()?.resolver;
}
