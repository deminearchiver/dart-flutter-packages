import 'package:material/src/material/flutter.dart';

abstract interface class CheckboxStates
    implements SelectableStates, InteractiveStates {}

abstract interface class CheckboxDisabledStates
    implements CheckboxStates, InteractiveDisabledStates {}

abstract interface class CheckboxEnabledStates
    implements CheckboxStates, InteractiveEnabledStates {}

typedef CheckboxStateProperty<T extends Object?> =
    StateProperty<T, CheckboxStates>;

abstract class CheckboxThemeDataPartial with Diagnosticable {
  const CheckboxThemeDataPartial();

  const factory CheckboxThemeDataPartial.from({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) = _CheckboxThemeDataPartial;

  CheckboxStateProperty<Size?>? get stateLayerSize;

  CheckboxStateProperty<ShapeBorder?>? get stateLayerShape;

  CheckboxStateProperty<Color?>? get stateLayerColor;

  CheckboxStateProperty<double?>? get stateLayerOpacity;

  CheckboxStateProperty<double?>? get containerSize;

  CheckboxStateProperty<OutlinedBorder?>? get containerShape;

  CheckboxStateProperty<Color?>? get containerColor;

  CheckboxStateProperty<OutlinePartial?>? get containerOutline;

  CheckboxStateProperty<double?>? get iconSize;

  CheckboxStateProperty<Color?>? get iconColor;

  CheckboxThemeDataPartial copy() => copyWith();

  CheckboxThemeDataPartial copyWith({
    covariant CheckboxStateProperty<Size?>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    covariant CheckboxStateProperty<Color?>? stateLayerColor,
    covariant CheckboxStateProperty<double?>? stateLayerOpacity,
    covariant CheckboxStateProperty<double?>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder?>? containerShape,
    covariant CheckboxStateProperty<Color?>? containerColor,
    covariant CheckboxStateProperty<OutlinePartial?>? containerOutline,
    covariant CheckboxStateProperty<double?>? iconSize,
    covariant CheckboxStateProperty<Color?>? iconColor,
  }) => .from(
    stateLayerSize: stateLayerSize ?? this.stateLayerSize,
    stateLayerShape: stateLayerShape ?? this.stateLayerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    containerSize: containerSize ?? this.containerSize,
    containerShape: containerShape ?? this.containerShape,
    containerColor: containerColor ?? this.containerColor,
    containerOutline: containerOutline ?? this.containerOutline,
    iconSize: iconSize ?? this.iconSize,
    iconColor: iconColor ?? this.iconColor,
  );

  CheckboxThemeDataPartial maybeCopyWith({
    covariant CheckboxStateProperty<Size?>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    covariant CheckboxStateProperty<Color?>? stateLayerColor,
    covariant CheckboxStateProperty<double?>? stateLayerOpacity,
    covariant CheckboxStateProperty<double?>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder?>? containerShape,
    covariant CheckboxStateProperty<Color?>? containerColor,
    covariant CheckboxStateProperty<OutlinePartial?>? containerOutline,
    covariant CheckboxStateProperty<double?>? iconSize,
    covariant CheckboxStateProperty<Color?>? iconColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          containerSize != null ||
          containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          iconSize != null ||
          iconColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerSize: containerSize,
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          iconSize: iconSize,
          iconColor: iconColor,
        )
      : this;

  CheckboxThemeDataPartial mergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) => .from(
    stateLayerSize: this.stateLayerSize.maybeMergeNullable(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMergeNullable(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMergeNullable(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
      stateLayerOpacity,
    ),
    containerSize: this.containerSize.maybeMergeNullable(containerSize),
    containerShape: this.containerShape.maybeMergeNullable(containerShape),
    containerColor: this.containerColor.maybeMergeNullable(containerColor),
    containerOutline: this.containerOutline.maybeCombineNullable(
      containerOutline,
      OutlinePartial.combine,
    ),
    iconSize: this.iconSize.maybeMergeNullable(iconSize),
    iconColor: this.iconColor.maybeMergeNullable(iconColor),
  );

  CheckboxThemeDataPartial maybeMergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          containerSize != null ||
          containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          iconSize != null ||
          iconColor != null
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
          containerSize: this.containerSize.maybeMergeNullable(containerSize),
          containerShape: this.containerShape.maybeMergeNullable(
            containerShape,
          ),
          containerColor: this.containerColor.maybeMergeNullable(
            containerColor,
          ),
          containerOutline: this.containerOutline.maybeCombineNullable(
            containerOutline,
            OutlinePartial.maybeCombine,
          ),
          iconSize: this.iconSize.maybeMergeNullable(iconSize),
          iconColor: this.iconColor.maybeMergeNullable(iconColor),
        )
      : this;

  CheckboxThemeDataPartial merge(CheckboxThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          containerSize: other.containerSize,
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          iconSize: other.iconSize,
          iconColor: other.iconColor,
        )
      : copy();

  CheckboxThemeDataPartial maybeMerge(CheckboxThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          containerSize: other.containerSize,
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          iconSize: other.iconSize,
          iconColor: other.iconColor,
        )
      : this;
}

final class _CheckboxThemeDataPartial extends CheckboxThemeDataPartial {
  const _CheckboxThemeDataPartial({
    this.stateLayerSize,
    this.stateLayerShape,
    this.stateLayerColor,
    this.stateLayerOpacity,
    this.containerSize,
    this.containerShape,
    this.containerColor,
    this.containerOutline,
    this.iconSize,
    this.iconColor,
  });

  @override
  final CheckboxStateProperty<Size?>? stateLayerSize;

  @override
  final CheckboxStateProperty<ShapeBorder?>? stateLayerShape;

  @override
  final CheckboxStateProperty<Color?>? stateLayerColor;

  @override
  final CheckboxStateProperty<double?>? stateLayerOpacity;

  @override
  final CheckboxStateProperty<double?>? containerSize;

  @override
  final CheckboxStateProperty<OutlinedBorder?>? containerShape;

  @override
  final CheckboxStateProperty<Color?>? containerColor;

  @override
  final CheckboxStateProperty<OutlinePartial?>? containerOutline;

  @override
  final CheckboxStateProperty<double?>? iconSize;

  @override
  final CheckboxStateProperty<Color?>? iconColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CheckboxThemeDataPartial &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          containerSize == other.containerSize &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          containerOutline == other.containerOutline &&
          iconSize == other.iconSize &&
          iconColor == other.iconColor;

  @override
  int get hashCode => Object.hash(
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    containerSize,
    containerShape,
    containerColor,
    containerOutline,
    iconSize,
    iconColor,
  );
}

abstract class CheckboxThemeData extends CheckboxThemeDataPartial {
  const CheckboxThemeData();

  const factory CheckboxThemeData.from({
    required CheckboxStateProperty<Size> stateLayerSize,
    required CheckboxStateProperty<ShapeBorder> stateLayerShape,
    required CheckboxStateProperty<Color> stateLayerColor,
    required CheckboxStateProperty<double> stateLayerOpacity,
    required CheckboxStateProperty<double> containerSize,
    required CheckboxStateProperty<OutlinedBorder> containerShape,
    required CheckboxStateProperty<Color> containerColor,
    required CheckboxStateProperty<Outline> containerOutline,
    required CheckboxStateProperty<double> iconSize,
    required CheckboxStateProperty<Color> iconColor,
  }) = _CheckboxThemeData;

  const factory CheckboxThemeData.defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    CheckboxThemeDataPartial? overrides,
  }) = _CheckboxThemeDataDefaults;

  factory CheckboxThemeData.defaultsOf(
    BuildContext context, {
    CheckboxThemeDataPartial? overrides,
  }) => .defaults(
    colorTheme: ColorTheme.of(context),
    shapeTheme: ShapeTheme.of(context),
    stateTheme: StateTheme.of(context),
    overrides: overrides,
  );

  @override
  CheckboxStateProperty<Size> get stateLayerSize;

  @override
  CheckboxStateProperty<ShapeBorder> get stateLayerShape;

  @override
  CheckboxStateProperty<Color> get stateLayerColor;

  @override
  CheckboxStateProperty<double> get stateLayerOpacity;

  @override
  CheckboxStateProperty<double> get containerSize;

  @override
  CheckboxStateProperty<OutlinedBorder> get containerShape;

  @override
  CheckboxStateProperty<Color> get containerColor;

  @override
  CheckboxStateProperty<Outline> get containerOutline;

  @override
  CheckboxStateProperty<double> get iconSize;

  @override
  CheckboxStateProperty<Color> get iconColor;

  @override
  CheckboxThemeData copy() => copyWith();

  @override
  CheckboxThemeData copyWith({
    covariant CheckboxStateProperty<Size>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder>? stateLayerShape,
    covariant CheckboxStateProperty<Color>? stateLayerColor,
    covariant CheckboxStateProperty<double>? stateLayerOpacity,
    covariant CheckboxStateProperty<double>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder>? containerShape,
    covariant CheckboxStateProperty<Color>? containerColor,
    covariant CheckboxStateProperty<Outline>? containerOutline,
    covariant CheckboxStateProperty<double>? iconSize,
    covariant CheckboxStateProperty<Color>? iconColor,
  }) => .from(
    stateLayerSize: stateLayerSize ?? this.stateLayerSize,
    stateLayerShape: stateLayerShape ?? this.stateLayerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    containerSize: containerSize ?? this.containerSize,
    containerShape: containerShape ?? this.containerShape,
    containerColor: containerColor ?? this.containerColor,
    containerOutline: containerOutline ?? this.containerOutline,
    iconSize: iconSize ?? this.iconSize,
    iconColor: iconColor ?? this.iconColor,
  );

  @override
  CheckboxThemeData maybeCopyWith({
    covariant CheckboxStateProperty<Size>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder>? stateLayerShape,
    covariant CheckboxStateProperty<Color>? stateLayerColor,
    covariant CheckboxStateProperty<double>? stateLayerOpacity,
    covariant CheckboxStateProperty<double>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder>? containerShape,
    covariant CheckboxStateProperty<Color>? containerColor,
    covariant CheckboxStateProperty<Outline>? containerOutline,
    covariant CheckboxStateProperty<double>? iconSize,
    covariant CheckboxStateProperty<Color>? iconColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          containerSize != null ||
          containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          iconSize != null ||
          iconColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerSize: containerSize,
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          iconSize: iconSize,
          iconColor: iconColor,
        )
      : this;

  @override
  CheckboxThemeData mergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) => .from(
    stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMerge(stateLayerOpacity),
    containerSize: this.containerSize.maybeMerge(containerSize),
    containerShape: this.containerShape.maybeMerge(containerShape),
    containerColor: this.containerColor.maybeMerge(containerColor),
    containerOutline: this.containerOutline.maybeCombine(
      containerOutline,
      Outline.combine,
    ),
    iconSize: this.iconSize.maybeMerge(iconSize),
    iconColor: this.iconColor.maybeMerge(iconColor),
  );

  @override
  CheckboxThemeData maybeMergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) =>
      stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          containerSize != null ||
          containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          iconSize != null ||
          iconColor != null
      ? .from(
          stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
          stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
          stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
          stateLayerOpacity: this.stateLayerOpacity.maybeMerge(
            stateLayerOpacity,
          ),
          containerSize: this.containerSize.maybeMerge(containerSize),
          containerShape: this.containerShape.maybeMerge(containerShape),
          containerColor: this.containerColor.maybeMerge(containerColor),
          containerOutline: this.containerOutline.maybeCombine(
            containerOutline,
            Outline.maybeCombine,
          ),
          iconSize: this.iconSize.maybeMerge(iconSize),
          iconColor: this.iconColor.maybeMerge(iconColor),
        )
      : this;

  @override
  CheckboxThemeData merge(CheckboxThemeDataPartial? other) => other != null
      ? mergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          containerSize: other.containerSize,
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          iconSize: other.iconSize,
          iconColor: other.iconColor,
        )
      : copy();

  @override
  CheckboxThemeData maybeMerge(CheckboxThemeDataPartial? other) => other != null
      ? maybeMergeWith(
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          containerSize: other.containerSize,
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          iconSize: other.iconSize,
          iconColor: other.iconColor,
        )
      : this;
}

final class _CheckboxThemeData extends CheckboxThemeData {
  const _CheckboxThemeData({
    required this.stateLayerSize,
    required this.stateLayerShape,
    required this.stateLayerColor,
    required this.stateLayerOpacity,
    required this.containerSize,
    required this.containerShape,
    required this.containerColor,
    required this.containerOutline,
    required this.iconSize,
    required this.iconColor,
  });

  @override
  final CheckboxStateProperty<Size> stateLayerSize;

  @override
  final CheckboxStateProperty<ShapeBorder> stateLayerShape;

  @override
  final CheckboxStateProperty<Color> stateLayerColor;

  @override
  final CheckboxStateProperty<double> stateLayerOpacity;

  @override
  final CheckboxStateProperty<double> containerSize;

  @override
  final CheckboxStateProperty<OutlinedBorder> containerShape;

  @override
  final CheckboxStateProperty<Color> containerColor;

  @override
  final CheckboxStateProperty<Outline> containerOutline;

  @override
  final CheckboxStateProperty<double> iconSize;

  @override
  final CheckboxStateProperty<Color> iconColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CheckboxThemeData &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          containerSize == other.containerSize &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          containerOutline == other.containerOutline &&
          iconSize == other.iconSize &&
          iconColor == other.iconColor;

  @override
  int get hashCode => Object.hash(
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    containerSize,
    containerShape,
    containerColor,
    containerOutline,
    iconSize,
    iconColor,
  );
}

final class _CheckboxThemeDataDefaults extends CheckboxThemeData {
  const _CheckboxThemeDataDefaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    CheckboxThemeDataPartial? overrides,
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final CheckboxThemeDataPartial _overrides;

  @override
  CheckboxStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) =>
        _overrides.stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  CheckboxStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _overrides.stateLayerShape?.resolve(states) ??
        _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
  );

  @override
  CheckboxStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _overrides.stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  CheckboxStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _overrides.stateLayerOpacity?.resolve(states) ??
        switch (states) {
          CheckboxEnabledStates(isPressed: true) =>
            _stateTheme.pressedStateLayerOpacity,
          CheckboxEnabledStates(isHovered: true) =>
            _stateTheme.hoverStateLayerOpacity,
          CheckboxEnabledStates(isFocused: true) => 0.0,
          CheckboxStates() => 0.0,
        },
  );

  @override
  CheckboxStateProperty<double> get containerSize => .resolveWith(
    (states) => _overrides.containerSize?.resolve(states) ?? 18.0,
  );

  @override
  CheckboxStateProperty<OutlinedBorder> get containerShape => .resolveWith(
    (states) =>
        _overrides.containerShape?.resolve(states) ??
        _shapeTheme.applyCornerValue(cornerValue: 2.0),
  );

  @override
  CheckboxStateProperty<Color> get containerColor => .resolveWith(
    (states) =>
        _overrides.containerColor?.resolve(states) ??
        switch (states) {
          CheckboxDisabledStates(isSelected: false) =>
            _colorTheme.onSurface.withValues(alpha: 0.0),
          CheckboxDisabledStates(isSelected: true) =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          CheckboxStates(isSelected: false) => _colorTheme.primary.withValues(
            alpha: 0.0,
          ),
          CheckboxStates(isSelected: true) => _colorTheme.primary,
        },
  );

  @override
  CheckboxStateProperty<Outline> get containerOutline => .resolveWith(
    (states) => .from(
      width: 2.0,
      alignment: Outline.alignmentInside,
      color: switch (states) {
        CheckboxDisabledStates(isSelected: false) =>
          _colorTheme.onSurface.withValues(alpha: 0.38),
        CheckboxDisabledStates(isSelected: true) =>
          _colorTheme.onSurface.withValues(alpha: 0.0),
        CheckboxEnabledStates(
          isSelected: false,
          isPressed: false,
          isFocused: false,
          isHovered: false,
        ) =>
          _colorTheme.onSurfaceVariant,
        CheckboxStates(isSelected: false) => _colorTheme.onSurface,
        CheckboxStates(isSelected: true) => _colorTheme.primary.withValues(
          alpha: 0.0,
        ),
      },
    ).maybeMerge(_overrides.containerOutline?.resolve(states)),
  );

  @override
  CheckboxStateProperty<double> get iconSize =>
      .resolveWith((states) => _overrides.iconSize?.resolve(states) ?? 18.0);

  @override
  CheckboxStateProperty<Color> get iconColor => .resolveWith(
    (states) =>
        _overrides.iconColor?.resolve(states) ??
        switch (states) {
          CheckboxDisabledStates(isSelected: true) =>
            _colorTheme.surface.withValues(alpha: 0.38),
          CheckboxEnabledStates(isSelected: true) => _colorTheme.onPrimary,
          // Color #00000000 from androidx.compose.material3.Checkbox implementation
          CheckboxStates() => Colors.transparent,
        },
  );

  @override
  CheckboxThemeData copyWith({
    covariant CheckboxStateProperty<Size>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder>? stateLayerShape,
    covariant CheckboxStateProperty<Color>? stateLayerColor,
    covariant CheckboxStateProperty<double>? stateLayerOpacity,
    covariant CheckboxStateProperty<double>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder>? containerShape,
    covariant CheckboxStateProperty<Color>? containerColor,
    covariant CheckboxStateProperty<Outline>? containerOutline,
    covariant CheckboxStateProperty<double>? iconSize,
    covariant CheckboxStateProperty<Color>? iconColor,
  }) => _CheckboxThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.copyWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerSize: containerSize,
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      iconSize: iconSize,
      iconColor: iconColor,
    ),
  );

  @override
  CheckboxThemeData maybeCopyWith({
    covariant CheckboxStateProperty<Size>? stateLayerSize,
    covariant CheckboxStateProperty<ShapeBorder>? stateLayerShape,
    covariant CheckboxStateProperty<Color>? stateLayerColor,
    covariant CheckboxStateProperty<double>? stateLayerOpacity,
    covariant CheckboxStateProperty<double>? containerSize,
    covariant CheckboxStateProperty<OutlinedBorder>? containerShape,
    covariant CheckboxStateProperty<Color>? containerColor,
    covariant CheckboxStateProperty<Outline>? containerOutline,
    covariant CheckboxStateProperty<double>? iconSize,
    covariant CheckboxStateProperty<Color>? iconColor,
  }) =>
      stateLayerSize != null &&
          stateLayerShape != null &&
          stateLayerColor != null &&
          stateLayerOpacity != null &&
          containerSize != null &&
          containerShape != null &&
          containerColor != null &&
          containerOutline != null &&
          iconSize != null &&
          iconColor != null
      ? .from(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerSize: containerSize,
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          iconSize: iconSize,
          iconColor: iconColor,
        )
      : stateLayerSize != null ||
            stateLayerShape != null ||
            stateLayerColor != null ||
            stateLayerOpacity != null ||
            containerSize != null ||
            containerShape != null ||
            containerColor != null ||
            containerOutline != null ||
            iconSize != null ||
            iconColor != null
      ? copyWith(
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerSize: containerSize,
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          iconSize: iconSize,
          iconColor: iconColor,
        )
      : this;

  @override
  CheckboxThemeData mergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) => _CheckboxThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.mergeWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerSize: containerSize,
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      iconSize: iconSize,
      iconColor: iconColor,
    ),
  );

  @override
  CheckboxThemeData maybeMergeWith({
    CheckboxStateProperty<Size?>? stateLayerSize,
    CheckboxStateProperty<ShapeBorder?>? stateLayerShape,
    CheckboxStateProperty<Color?>? stateLayerColor,
    CheckboxStateProperty<double?>? stateLayerOpacity,
    CheckboxStateProperty<double?>? containerSize,
    CheckboxStateProperty<OutlinedBorder?>? containerShape,
    CheckboxStateProperty<Color?>? containerColor,
    CheckboxStateProperty<OutlinePartial?>? containerOutline,
    CheckboxStateProperty<double?>? iconSize,
    CheckboxStateProperty<Color?>? iconColor,
  }) {
    final overrides = _overrides.maybeMergeWith(
      stateLayerSize: stateLayerSize,
      stateLayerShape: stateLayerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerSize: containerSize,
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      iconSize: iconSize,
      iconColor: iconColor,
    );
    return identical(_overrides, overrides)
        ? this
        : _CheckboxThemeDataDefaults(
            colorTheme: _colorTheme,
            shapeTheme: _shapeTheme,
            stateTheme: _stateTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CheckboxThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode =>
      Object.hash(_colorTheme, _shapeTheme, _stateTheme, _overrides);
}

abstract class CheckboxTheme extends StatelessWidget implements ProxyWidget {
  const CheckboxTheme._({super.key, required this.child});

  const factory CheckboxTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<CheckboxThemeDataPartial> resolver,
    required Widget child,
  }) = _CheckboxThemeWithResolver<CheckboxThemeDataPartial>;

  const factory CheckboxTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<CheckboxThemeDataPartial> callback,
    required Widget child,
  }) = _CheckboxThemeWithCallback<CheckboxThemeDataPartial>;

  const factory CheckboxTheme.mergeWithData({
    Key? key,
    required CheckboxThemeDataPartial data,
    required Widget child,
  }) = _CheckboxThemeWithData<CheckboxThemeDataPartial>;

  const factory CheckboxTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<CheckboxThemeData> resolver,
    required Widget child,
  }) = _CheckboxThemeWithResolver<CheckboxThemeData>;

  const factory CheckboxTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<CheckboxThemeData> callback,
    required Widget child,
  }) = _CheckboxThemeWithCallback<CheckboxThemeData>;

  const factory CheckboxTheme.replaceWithData({
    Key? key,
    required CheckboxThemeData data,
    required Widget child,
  }) = _CheckboxThemeWithData<CheckboxThemeData>;

  ThemeResolver<CheckboxThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _CheckboxTheme(resolver: resolver, child: child);

  static CheckboxThemeData? maybeOf(BuildContext context) {
    final overrides = _CheckboxTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static CheckboxThemeData of(BuildContext context) =>
      .defaultsOf(context, overrides: _CheckboxTheme.maybeOverridesOf(context));
}

class _CheckboxThemeWithResolver<T extends CheckboxThemeDataPartial>
    extends CheckboxTheme {
  const _CheckboxThemeWithResolver({
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

class _CheckboxThemeWithCallback<T extends CheckboxThemeDataPartial>
    extends CheckboxTheme {
  const _CheckboxThemeWithCallback({
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

class _CheckboxThemeWithData<T extends CheckboxThemeDataPartial>
    extends CheckboxTheme {
  const _CheckboxThemeWithData({
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

final class _CheckboxTheme
    extends
        InheritedThemeResolverWidget<
          CheckboxThemeDataPartial,
          _CheckboxTheme,
          _CheckboxThemeElement
        >
    implements InheritedTheme {
  const _CheckboxTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  CheckboxThemeDataPartial merge(
    CheckboxThemeDataPartial fallback,
    CheckboxThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _CheckboxThemeElement createElement() => _CheckboxThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _CheckboxTheme(resolver: resolver, child: child);

  static ThemeResolver<CheckboxThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        CheckboxThemeDataPartial,
        _CheckboxTheme,
        _CheckboxThemeElement
      >(context);

  static CheckboxThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        CheckboxThemeDataPartial,
        _CheckboxTheme,
        _CheckboxThemeElement
      >(context);
}

final class _CheckboxThemeElement
    extends
        InheritedThemeResolverElement<
          CheckboxThemeDataPartial,
          _CheckboxTheme,
          _CheckboxThemeElement
        > {
  _CheckboxThemeElement(super.widget);
}
