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
          stateLayerSize:
              stateLayerSize?.orElseMaybe(this.stateLayerSize?.resolve) ??
              this.stateLayerSize,
          stateLayerShape:
              stateLayerShape?.orElseMaybe(this.stateLayerShape?.resolve) ??
              this.stateLayerShape,
          stateLayerColor:
              stateLayerColor?.orElseMaybe(this.stateLayerColor?.resolve) ??
              this.stateLayerColor,
          stateLayerOpacity:
              stateLayerOpacity?.orElseMaybe(this.stateLayerOpacity?.resolve) ??
              this.stateLayerOpacity,
          containerSize:
              containerSize?.orElseMaybe(this.containerSize?.resolve) ??
              this.containerSize,
          containerShape:
              containerShape?.orElseMaybe(this.containerShape?.resolve) ??
              this.containerShape,
          containerColor:
              containerColor?.orElseMaybe(this.containerColor?.resolve) ??
              this.containerColor,
          containerOutline:
              containerOutline
                  ?.orElseMaybe(this.containerOutline?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.containerOutline?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.containerOutline,
          iconSize:
              iconSize?.orElseMaybe(this.iconSize?.resolve) ?? this.iconSize,
          iconColor:
              iconColor?.orElseMaybe(this.iconColor?.resolve) ?? this.iconColor,
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is CheckboxThemeDataPartial &&
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
    runtimeType,
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

class _CheckboxThemeDataPartial extends CheckboxThemeDataPartial {
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
  }) = _CheckboxThemeDataDefaults;

  const factory CheckboxThemeData._defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
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
  }) = _CheckboxThemeDataDefaults;

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
          stateLayerSize:
              stateLayerSize?.orElse(this.stateLayerSize.resolve) ??
              this.stateLayerSize,
          stateLayerShape:
              stateLayerShape?.orElse(this.stateLayerShape.resolve) ??
              this.stateLayerShape,
          stateLayerColor:
              stateLayerColor?.orElse(this.stateLayerColor.resolve) ??
              this.stateLayerColor,
          stateLayerOpacity:
              stateLayerOpacity?.orElse(this.stateLayerOpacity.resolve) ??
              this.stateLayerOpacity,
          containerSize:
              containerSize?.orElse(this.containerSize.resolve) ??
              this.containerSize,
          containerShape:
              containerShape?.orElse(this.containerShape.resolve) ??
              this.containerShape,
          containerColor:
              containerColor?.orElse(this.containerColor.resolve) ??
              this.containerColor,
          containerOutline:
              containerOutline
                  ?.orElse(this.containerOutline.resolve)
                  .mapValue(
                    (states, value) =>
                        this.containerOutline.resolve(states).merge(value),
                  ) ??
              this.containerOutline,
          iconSize: iconSize?.orElse(this.iconSize.resolve) ?? this.iconSize,
          iconColor:
              iconColor?.orElse(this.iconColor.resolve) ?? this.iconColor,
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
      : this;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is CheckboxThemeData &&
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
    runtimeType,
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

class _CheckboxThemeData extends CheckboxThemeData {
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
}

class _CheckboxThemeDataDefaults extends CheckboxThemeData {
  const _CheckboxThemeDataDefaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
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
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _stateLayerSize = stateLayerSize,
       _stateLayerShape = stateLayerShape,
       _stateLayerColor = stateLayerColor,
       _stateLayerOpacity = stateLayerOpacity,
       _containerSize = containerSize,
       _containerShape = containerShape,
       _containerColor = containerColor,
       _containerOutline = containerOutline,
       _iconSize = iconSize,
       _iconColor = iconColor;

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final CheckboxStateProperty<Size?>? _stateLayerSize;
  final CheckboxStateProperty<ShapeBorder?>? _stateLayerShape;
  final CheckboxStateProperty<Color?>? _stateLayerColor;
  final CheckboxStateProperty<double?>? _stateLayerOpacity;
  final CheckboxStateProperty<double?>? _containerSize;
  final CheckboxStateProperty<OutlinedBorder?>? _containerShape;
  final CheckboxStateProperty<Color?>? _containerColor;
  final CheckboxStateProperty<OutlinePartial?>? _containerOutline;
  final CheckboxStateProperty<double?>? _iconSize;
  final CheckboxStateProperty<Color?>? _iconColor;

  @override
  CheckboxStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) => _stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  CheckboxStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _stateLayerShape?.resolve(states) ??
        CornersBorder.rounded(corners: .all(_shapeTheme.cornerFull)),
  );

  @override
  CheckboxStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  CheckboxStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _stateLayerOpacity?.resolve(states) ??
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
  CheckboxStateProperty<double> get containerSize =>
      .resolveWith((states) => _containerSize?.resolve(states) ?? 18.0);

  @override
  CheckboxStateProperty<OutlinedBorder> get containerShape => .resolveWith(
    (states) =>
        _containerShape?.resolve(states) ??
        const CornersBorder.rounded(corners: .all(.fixed(2.0))),
  );

  @override
  CheckboxStateProperty<Color> get containerColor => .resolveWith(
    (states) =>
        _containerColor?.resolve(states) ??
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
    ).merge(_containerOutline?.resolve(states)),
  );

  @override
  CheckboxStateProperty<double> get iconSize =>
      .resolveWith((states) => _iconSize?.resolve(states) ?? 18.0);

  @override
  CheckboxStateProperty<Color> get iconColor => .resolveWith(
    (states) =>
        _iconColor?.resolve(states) ??
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
      : _CheckboxThemeDataDefaults(
          colorTheme: _colorTheme,
          shapeTheme: _shapeTheme,
          stateTheme: _stateTheme,
          stateLayerSize: stateLayerSize ?? _stateLayerSize,
          stateLayerShape: stateLayerShape ?? _stateLayerShape,
          stateLayerColor: stateLayerColor ?? _stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
          containerSize: containerSize ?? _containerSize,
          containerShape: containerShape ?? _containerShape,
          containerColor: containerColor ?? _containerColor,
          containerOutline: containerOutline ?? _containerOutline,
          iconSize: iconSize ?? _iconSize,
          iconColor: iconColor ?? _iconColor,
        );

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
    stateLayerSize:
        stateLayerSize?.orElseMaybe(_stateLayerSize?.resolve) ??
        _stateLayerSize,
    stateLayerShape:
        stateLayerShape?.orElseMaybe(_stateLayerShape?.resolve) ??
        _stateLayerShape,
    stateLayerColor:
        stateLayerColor?.orElseMaybe(_stateLayerColor?.resolve) ??
        _stateLayerColor,
    stateLayerOpacity:
        stateLayerOpacity?.orElseMaybe(_stateLayerOpacity?.resolve) ??
        _stateLayerOpacity,
    containerSize:
        containerSize?.orElseMaybe(_containerSize?.resolve) ?? _containerSize,
    containerShape:
        containerShape?.orElseMaybe(_containerShape?.resolve) ??
        _containerShape,
    containerColor:
        containerColor?.orElseMaybe(_containerColor?.resolve) ??
        _containerColor,
    containerOutline:
        containerOutline
            ?.orElseMaybe(_containerOutline?.resolve)
            .mapValue(
              (states, value) =>
                  _containerOutline?.resolve(states)?.merge(value) ?? value,
            ) ??
        _containerOutline,
    iconSize: iconSize?.orElseMaybe(_iconSize?.resolve) ?? _iconSize,
    iconColor: iconColor?.orElseMaybe(_iconColor?.resolve) ?? _iconColor,
  );

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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _CheckboxThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _stateLayerSize == other._stateLayerSize &&
          _stateLayerShape == other._stateLayerShape &&
          _stateLayerColor == other._stateLayerColor &&
          _stateLayerOpacity == other._stateLayerOpacity &&
          _containerSize == other._containerSize &&
          _containerShape == other._containerShape &&
          _containerColor == other._containerColor &&
          _containerOutline == other._containerOutline &&
          _iconSize == other._iconSize &&
          _iconColor == other._iconColor;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorTheme,
    _shapeTheme,
    _stateTheme,
    _stateLayerSize,
    _stateLayerShape,
    _stateLayerColor,
    _stateLayerOpacity,
    _containerSize,
    _containerShape,
    _containerColor,
    _containerOutline,
    _iconSize,
    _iconColor,
  );
}

typedef CheckboxThemeResolver = ThemeResolver<CheckboxThemeDataPartial>;

typedef CheckboxThemeResolverCallback =
    ThemeResolverCallback<CheckboxThemeDataPartial>;

class _CheckboxThemeResolver
    extends CombiningThemeResolver<CheckboxThemeDataPartial> {
  const _CheckboxThemeResolver(super.a, super.b);

  @override
  CheckboxThemeDataPartial combine(
    CheckboxThemeDataPartial a,
    CheckboxThemeDataPartial b,
  ) => a.merge(b);
}

abstract class CheckboxTheme extends StatelessWidget implements ProxyWidget {
  const CheckboxTheme._({super.key, required this.child});

  const factory CheckboxTheme.withResolver({
    Key? key,
    required CheckboxThemeResolver resolver,
    required Widget child,
  }) = _CheckboxThemeWithResolver;

  const factory CheckboxTheme.withCallback({
    Key? key,
    required CheckboxThemeResolverCallback callback,
    required Widget child,
  }) = _CheckboxThemeWithCallback;

  const factory CheckboxTheme.withData({
    Key? key,
    required CheckboxThemeDataPartial data,
    required Widget child,
  }) = _CheckboxThemeWithData;

  CheckboxThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _CheckboxTheme.maybeResolverOf(context);
    return _CheckboxTheme(
      resolver: inherited != null
          ? _CheckboxThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static CheckboxThemeData of(BuildContext context) {
    final resolver = _CheckboxTheme.maybeResolverOf(context);
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        colorTheme: colorTheme,
        shapeTheme: shapeTheme,
        stateTheme: stateTheme,
        stateLayerSize: data.stateLayerSize,
        stateLayerShape: data.stateLayerShape,
        stateLayerColor: data.stateLayerColor,
        stateLayerOpacity: data.stateLayerOpacity,
        containerSize: data.containerSize,
        containerShape: data.containerShape,
        containerColor: data.containerColor,
        containerOutline: data.containerOutline,
        iconSize: data.iconSize,
        iconColor: data.iconColor,
      );
    }
    return .defaults(
      colorTheme: colorTheme,
      shapeTheme: shapeTheme,
      stateTheme: stateTheme,
    );
  }
}

class _CheckboxThemeWithResolver extends CheckboxTheme {
  const _CheckboxThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final CheckboxThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<CheckboxThemeResolver>("resolver", resolver),
    );
  }
}

class _CheckboxThemeWithCallback extends CheckboxTheme {
  const _CheckboxThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final CheckboxThemeResolverCallback callback;

  @override
  CheckboxThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<CheckboxThemeResolverCallback>("callback", callback),
    );
  }
}

class _CheckboxThemeWithData extends CheckboxTheme {
  const _CheckboxThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final CheckboxThemeDataPartial data;

  @override
  CheckboxThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CheckboxThemeDataPartial>("data", data));
  }
}

class _CheckboxTheme extends InheritedTheme {
  const _CheckboxTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final CheckboxThemeResolver resolver;

  @override
  bool updateShouldNotify(_CheckboxTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _CheckboxTheme(resolver: resolver, child: child);

  static CheckboxThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_CheckboxTheme>()?.resolver;
}
