import 'package:material/src/material/flutter.dart';

abstract interface class SwitchStates
    implements SelectableStates, InteractiveStates {
  bool get hasIcon;
}

abstract interface class SwitchDisabledStates
    implements SwitchStates, InteractiveDisabledStates {}

abstract interface class SwitchEnabledStates
    implements SwitchStates, InteractiveEnabledStates {}

typedef SwitchStateProperty<T extends Object?> = StateProperty<T, SwitchStates>;

abstract class SwitchThemeDataPartial with Diagnosticable {
  const SwitchThemeDataPartial();

  const factory SwitchThemeDataPartial.from({
    SwitchStateProperty<Size?>? minTapTargetSize,
    SwitchStateProperty<Size?>? trackSize,
    SwitchStateProperty<OutlinedBorder?>? trackShape,
    SwitchStateProperty<Color?>? trackColor,
    SwitchStateProperty<OutlinePartial?>? trackOutline,
    SwitchStateProperty<Size?>? stateLayerSize,
    SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    SwitchStateProperty<Color?>? stateLayerColor,
    SwitchStateProperty<double?>? stateLayerOpacity,
    SwitchStateProperty<Size?>? handleSize,
    SwitchStateProperty<OutlinedBorder?>? handleShape,
    SwitchStateProperty<Color?>? handleColor,
    SwitchStateProperty<OutlinePartial?>? handleOutline,
    SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) = _SwitchThemeDataPartial;

  SwitchStateProperty<Size?>? get minTapTargetSize;

  SwitchStateProperty<Size?>? get trackSize;

  SwitchStateProperty<OutlinedBorder?>? get trackShape;

  SwitchStateProperty<Color?>? get trackColor;

  SwitchStateProperty<OutlinePartial?>? get trackOutline;

  SwitchStateProperty<Size?>? get stateLayerSize;

  SwitchStateProperty<ShapeBorder?>? get stateLayerShape;

  SwitchStateProperty<Color?>? get stateLayerColor;

  SwitchStateProperty<double?>? get stateLayerOpacity;

  SwitchStateProperty<Size?>? get handleSize;

  SwitchStateProperty<OutlinedBorder?>? get handleShape;

  SwitchStateProperty<Color?>? get handleColor;

  SwitchStateProperty<OutlinePartial?>? get handleOutline;

  SwitchStateProperty<IconThemeDataPartial?>? get iconTheme;

  SwitchThemeDataPartial copyWith({
    covariant SwitchStateProperty<Size?>? minTapTargetSize,
    covariant SwitchStateProperty<Size?>? trackSize,
    covariant SwitchStateProperty<OutlinedBorder?>? trackShape,
    covariant SwitchStateProperty<Color?>? trackColor,
    covariant SwitchStateProperty<OutlinePartial?>? trackOutline,
    covariant SwitchStateProperty<Size?>? stateLayerSize,
    covariant SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    covariant SwitchStateProperty<Color?>? stateLayerColor,
    covariant SwitchStateProperty<double?>? stateLayerOpacity,
    covariant SwitchStateProperty<Size?>? handleSize,
    covariant SwitchStateProperty<OutlinedBorder?>? handleShape,
    covariant SwitchStateProperty<Color?>? handleColor,
    covariant SwitchStateProperty<OutlinePartial?>? handleOutline,
    covariant SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) =>
      minTapTargetSize != null ||
          trackSize != null ||
          trackShape != null ||
          trackColor != null ||
          trackOutline != null ||
          stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          handleSize != null ||
          handleShape != null ||
          handleColor != null ||
          handleOutline != null ||
          iconTheme != null
      ? .from(
          minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
          trackSize: trackSize ?? this.trackSize,
          trackShape: trackShape ?? this.trackShape,
          trackColor: trackColor ?? this.trackColor,
          trackOutline: trackOutline ?? this.trackOutline,
          stateLayerSize: stateLayerSize ?? this.stateLayerSize,
          stateLayerShape: stateLayerShape ?? this.stateLayerShape,
          stateLayerColor: stateLayerColor ?? this.stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
          handleSize: handleSize ?? this.handleSize,
          handleShape: handleShape ?? this.handleShape,
          handleColor: handleColor ?? this.handleColor,
          handleOutline: handleOutline ?? this.handleOutline,
          iconTheme: iconTheme ?? this.iconTheme,
        )
      : this;

  SwitchThemeDataPartial mergeWith({
    SwitchStateProperty<Size?>? minTapTargetSize,
    SwitchStateProperty<Size?>? trackSize,
    SwitchStateProperty<OutlinedBorder?>? trackShape,
    SwitchStateProperty<Color?>? trackColor,
    SwitchStateProperty<OutlinePartial?>? trackOutline,
    SwitchStateProperty<Size?>? stateLayerSize,
    SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    SwitchStateProperty<Color?>? stateLayerColor,
    SwitchStateProperty<double?>? stateLayerOpacity,
    SwitchStateProperty<Size?>? handleSize,
    SwitchStateProperty<OutlinedBorder?>? handleShape,
    SwitchStateProperty<Color?>? handleColor,
    SwitchStateProperty<OutlinePartial?>? handleOutline,
    SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) =>
      minTapTargetSize != null ||
          trackSize != null ||
          trackShape != null ||
          trackColor != null ||
          trackOutline != null ||
          stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          handleSize != null ||
          handleShape != null ||
          handleColor != null ||
          handleOutline != null ||
          iconTheme != null
      ? .from(
          minTapTargetSize:
              minTapTargetSize?.orElseMaybe(this.minTapTargetSize?.resolve) ??
              this.minTapTargetSize,
          trackSize:
              trackSize?.orElseMaybe(this.trackSize?.resolve) ?? this.trackSize,
          trackShape:
              trackShape?.orElseMaybe(this.trackShape?.resolve) ??
              this.trackShape,
          trackColor:
              trackColor?.orElseMaybe(this.trackColor?.resolve) ??
              this.trackColor,
          trackOutline:
              trackOutline
                  ?.orElseMaybe(this.trackOutline?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.trackOutline?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.trackOutline,
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
          handleSize:
              handleSize?.orElseMaybe(this.handleSize?.resolve) ??
              this.handleSize,
          handleShape:
              handleShape?.orElseMaybe(this.handleShape?.resolve) ??
              this.handleShape,
          handleColor:
              handleColor?.orElseMaybe(this.handleColor?.resolve) ??
              this.handleColor,
          handleOutline:
              handleOutline
                  ?.orElseMaybe(this.handleOutline?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.handleOutline?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.handleOutline,
          iconTheme:
              iconTheme
                  ?.orElseMaybe(this.iconTheme?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.iconTheme?.resolve(states)?.merge(value) ?? value,
                  ) ??
              this.iconTheme,
        )
      : this;

  SwitchThemeDataPartial merge(SwitchThemeDataPartial? other) => other != null
      ? mergeWith(
          minTapTargetSize: other.minTapTargetSize,
          trackSize: other.trackSize,
          trackShape: other.trackShape,
          trackColor: other.trackColor,
          trackOutline: other.trackOutline,
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          handleSize: other.handleSize,
          handleShape: other.handleShape,
          handleColor: other.handleColor,
          handleOutline: other.handleOutline,
          iconTheme: other.iconTheme,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SwitchThemeDataPartial &&
          minTapTargetSize == other.minTapTargetSize &&
          trackSize == other.trackSize &&
          trackShape == other.trackShape &&
          trackColor == other.trackColor &&
          trackOutline == other.trackOutline &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          handleSize == other.handleSize &&
          handleShape == other.handleShape &&
          handleColor == other.handleColor &&
          handleOutline == other.handleOutline &&
          iconTheme == other.iconTheme;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    minTapTargetSize,
    trackSize,
    trackShape,
    trackColor,
    trackOutline,
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    handleSize,
    handleShape,
    handleColor,
    handleOutline,
    iconTheme,
  );
}

class _SwitchThemeDataPartial extends SwitchThemeDataPartial {
  const _SwitchThemeDataPartial({
    this.minTapTargetSize,
    this.trackSize,
    this.trackShape,
    this.trackColor,
    this.trackOutline,
    this.stateLayerSize,
    this.stateLayerShape,
    this.stateLayerColor,
    this.stateLayerOpacity,
    this.handleSize,
    this.handleShape,
    this.handleColor,
    this.handleOutline,
    this.iconTheme,
  });

  @override
  final SwitchStateProperty<Size?>? minTapTargetSize;

  @override
  final SwitchStateProperty<Size?>? trackSize;

  @override
  final SwitchStateProperty<OutlinedBorder?>? trackShape;

  @override
  final SwitchStateProperty<Color?>? trackColor;

  @override
  final SwitchStateProperty<OutlinePartial?>? trackOutline;

  @override
  final SwitchStateProperty<Size?>? stateLayerSize;

  @override
  final SwitchStateProperty<ShapeBorder?>? stateLayerShape;

  @override
  final SwitchStateProperty<Color?>? stateLayerColor;

  @override
  final SwitchStateProperty<double?>? stateLayerOpacity;

  @override
  final SwitchStateProperty<Size?>? handleSize;

  @override
  final SwitchStateProperty<OutlinedBorder?>? handleShape;

  @override
  final SwitchStateProperty<Color?>? handleColor;

  @override
  final SwitchStateProperty<OutlinePartial?>? handleOutline;

  @override
  final SwitchStateProperty<IconThemeDataPartial?>? iconTheme;
}

abstract class SwitchThemeData extends SwitchThemeDataPartial {
  const SwitchThemeData();

  const factory SwitchThemeData.from({
    required SwitchStateProperty<Size> minTapTargetSize,
    required SwitchStateProperty<Size> trackSize,
    required SwitchStateProperty<OutlinedBorder> trackShape,
    required SwitchStateProperty<Color> trackColor,
    required SwitchStateProperty<Outline> trackOutline,
    required SwitchStateProperty<Size> stateLayerSize,
    required SwitchStateProperty<ShapeBorder> stateLayerShape,
    required SwitchStateProperty<Color> stateLayerColor,
    required SwitchStateProperty<double> stateLayerOpacity,
    required SwitchStateProperty<Size> handleSize,
    required SwitchStateProperty<OutlinedBorder> handleShape,
    required SwitchStateProperty<Color> handleColor,
    required SwitchStateProperty<Outline> handleOutline,
    required SwitchStateProperty<IconThemeDataPartial> iconTheme,
  }) = _SwitchThemeData;

  const factory SwitchThemeData.fallback({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
  }) = _SwitchThemeDataDefaults;

  @override
  SwitchStateProperty<Size> get minTapTargetSize;

  @override
  SwitchStateProperty<Size> get trackSize;

  @override
  SwitchStateProperty<OutlinedBorder> get trackShape;

  @override
  SwitchStateProperty<Color> get trackColor;

  @override
  SwitchStateProperty<Outline> get trackOutline;

  @override
  SwitchStateProperty<Size> get stateLayerSize;

  @override
  SwitchStateProperty<ShapeBorder> get stateLayerShape;

  @override
  SwitchStateProperty<Color> get stateLayerColor;

  @override
  SwitchStateProperty<double> get stateLayerOpacity;

  @override
  SwitchStateProperty<Size> get handleSize;

  @override
  SwitchStateProperty<OutlinedBorder> get handleShape;

  @override
  SwitchStateProperty<Color> get handleColor;

  @override
  SwitchStateProperty<Outline> get handleOutline;

  @override
  SwitchStateProperty<IconThemeDataPartial> get iconTheme;

  @override
  SwitchThemeData copyWith({
    covariant SwitchStateProperty<Size>? minTapTargetSize,
    covariant SwitchStateProperty<Size>? trackSize,
    covariant SwitchStateProperty<OutlinedBorder>? trackShape,
    covariant SwitchStateProperty<Color>? trackColor,
    covariant SwitchStateProperty<Outline>? trackOutline,
    covariant SwitchStateProperty<Size>? stateLayerSize,
    covariant SwitchStateProperty<ShapeBorder>? stateLayerShape,
    covariant SwitchStateProperty<Color>? stateLayerColor,
    covariant SwitchStateProperty<double>? stateLayerOpacity,
    covariant SwitchStateProperty<Size>? handleSize,
    covariant SwitchStateProperty<OutlinedBorder>? handleShape,
    covariant SwitchStateProperty<Color>? handleColor,
    covariant SwitchStateProperty<Outline>? handleOutline,
    covariant SwitchStateProperty<IconThemeDataPartial>? iconTheme,
  }) =>
      minTapTargetSize != null ||
          trackSize != null ||
          trackShape != null ||
          trackColor != null ||
          trackOutline != null ||
          stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          handleSize != null ||
          handleShape != null ||
          handleColor != null ||
          handleOutline != null ||
          iconTheme != null
      ? .from(
          minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
          trackSize: trackSize ?? this.trackSize,
          trackShape: trackShape ?? this.trackShape,
          trackColor: trackColor ?? this.trackColor,
          trackOutline: trackOutline ?? this.trackOutline,
          stateLayerSize: stateLayerSize ?? this.stateLayerSize,
          stateLayerShape: stateLayerShape ?? this.stateLayerShape,
          stateLayerColor: stateLayerColor ?? this.stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
          handleSize: handleSize ?? this.handleSize,
          handleShape: handleShape ?? this.handleShape,
          handleColor: handleColor ?? this.handleColor,
          handleOutline: handleOutline ?? this.handleOutline,
          iconTheme: iconTheme ?? this.iconTheme,
        )
      : this;

  @override
  SwitchThemeData mergeWith({
    SwitchStateProperty<Size?>? minTapTargetSize,
    SwitchStateProperty<Size?>? trackSize,
    SwitchStateProperty<OutlinedBorder?>? trackShape,
    SwitchStateProperty<Color?>? trackColor,
    SwitchStateProperty<OutlinePartial?>? trackOutline,
    SwitchStateProperty<Size?>? stateLayerSize,
    SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    SwitchStateProperty<Color?>? stateLayerColor,
    SwitchStateProperty<double?>? stateLayerOpacity,
    SwitchStateProperty<Size?>? handleSize,
    SwitchStateProperty<OutlinedBorder?>? handleShape,
    SwitchStateProperty<Color?>? handleColor,
    SwitchStateProperty<OutlinePartial?>? handleOutline,
    SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) =>
      minTapTargetSize != null ||
          trackSize != null ||
          trackShape != null ||
          trackColor != null ||
          trackOutline != null ||
          stateLayerSize != null ||
          stateLayerShape != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          handleSize != null ||
          handleShape != null ||
          handleColor != null ||
          handleOutline != null ||
          iconTheme != null
      ? .from(
          minTapTargetSize:
              minTapTargetSize?.orElse(this.minTapTargetSize.resolve) ??
              this.minTapTargetSize,
          trackSize:
              trackSize?.orElse(this.trackSize.resolve) ?? this.trackSize,
          trackShape:
              trackShape?.orElse(this.trackShape.resolve) ?? this.trackShape,
          trackColor:
              trackColor?.orElse(this.trackColor.resolve) ?? this.trackColor,
          trackOutline:
              trackOutline
                  ?.orElse(this.trackOutline.resolve)
                  .mapValue(
                    (states, value) =>
                        this.trackOutline.resolve(states).merge(value),
                  ) ??
              this.trackOutline,
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
          handleSize:
              handleSize?.orElse(this.handleSize.resolve) ?? this.handleSize,
          handleShape:
              handleShape?.orElse(this.handleShape.resolve) ?? this.handleShape,
          handleColor:
              handleColor?.orElse(this.handleColor.resolve) ?? this.handleColor,
          handleOutline:
              handleOutline
                  ?.orElse(this.handleOutline.resolve)
                  .mapValue(
                    (states, value) =>
                        this.handleOutline.resolve(states).merge(value),
                  ) ??
              this.handleOutline,
          iconTheme:
              iconTheme
                  ?.orElse(this.iconTheme.resolve)
                  .mapValue(
                    (states, value) =>
                        this.iconTheme.resolve(states).merge(value),
                  ) ??
              this.iconTheme,
        )
      : this;

  @override
  SwitchThemeData merge(SwitchThemeDataPartial? other) => other != null
      ? mergeWith(
          minTapTargetSize: other.minTapTargetSize,
          trackSize: other.trackSize,
          trackShape: other.trackShape,
          trackColor: other.trackColor,
          trackOutline: other.trackOutline,
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          handleSize: other.handleSize,
          handleShape: other.handleShape,
          handleColor: other.handleColor,
          handleOutline: other.handleOutline,
          iconTheme: other.iconTheme,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SwitchThemeData &&
          minTapTargetSize == other.minTapTargetSize &&
          trackSize == other.trackSize &&
          trackShape == other.trackShape &&
          trackColor == other.trackColor &&
          trackOutline == other.trackOutline &&
          stateLayerSize == other.stateLayerSize &&
          stateLayerShape == other.stateLayerShape &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          handleSize == other.handleSize &&
          handleShape == other.handleShape &&
          handleColor == other.handleColor &&
          handleOutline == other.handleOutline &&
          iconTheme == other.iconTheme;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    trackSize,
    trackShape,
    trackColor,
    trackOutline,
    stateLayerSize,
    stateLayerShape,
    stateLayerColor,
    stateLayerOpacity,
    handleSize,
    handleShape,
    handleColor,
    handleOutline,
    iconTheme,
  );
}

class _SwitchThemeData extends SwitchThemeData {
  const _SwitchThemeData({
    required this.minTapTargetSize,
    required this.trackSize,
    required this.trackShape,
    required this.trackColor,
    required this.trackOutline,
    required this.stateLayerSize,
    required this.stateLayerShape,
    required this.stateLayerColor,
    required this.stateLayerOpacity,
    required this.handleSize,
    required this.handleShape,
    required this.handleColor,
    required this.handleOutline,
    required this.iconTheme,
  });

  @override
  final SwitchStateProperty<Size> minTapTargetSize;

  @override
  final SwitchStateProperty<Size> trackSize;

  @override
  final SwitchStateProperty<OutlinedBorder> trackShape;

  @override
  final SwitchStateProperty<Color> trackColor;

  @override
  final SwitchStateProperty<Outline> trackOutline;

  @override
  final SwitchStateProperty<Size> stateLayerSize;

  @override
  final SwitchStateProperty<ShapeBorder> stateLayerShape;

  @override
  final SwitchStateProperty<Color> stateLayerColor;

  @override
  final SwitchStateProperty<double> stateLayerOpacity;

  @override
  final SwitchStateProperty<Size> handleSize;

  @override
  final SwitchStateProperty<OutlinedBorder> handleShape;

  @override
  final SwitchStateProperty<Color> handleColor;

  @override
  final SwitchStateProperty<Outline> handleOutline;

  @override
  final SwitchStateProperty<IconThemeDataPartial> iconTheme;
}

class _SwitchThemeDataDefaults extends SwitchThemeData {
  const _SwitchThemeDataDefaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    SwitchStateProperty<Size?>? minTapTargetSize,
    SwitchStateProperty<Size?>? trackSize,
    SwitchStateProperty<OutlinedBorder?>? trackShape,
    SwitchStateProperty<Color?>? trackColor,
    SwitchStateProperty<OutlinePartial?>? trackOutline,
    SwitchStateProperty<Size?>? stateLayerSize,
    SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    SwitchStateProperty<Color?>? stateLayerColor,
    SwitchStateProperty<double?>? stateLayerOpacity,
    SwitchStateProperty<Size?>? handleSize,
    SwitchStateProperty<OutlinedBorder?>? handleShape,
    SwitchStateProperty<Color?>? handleColor,
    SwitchStateProperty<OutlinePartial?>? handleOutline,
    SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _minTapTargetSize = minTapTargetSize,
       _trackSize = trackSize,
       _trackShape = trackShape,
       _trackColor = trackColor,
       _trackOutline = trackOutline,
       _stateLayerSize = stateLayerSize,
       _stateLayerShape = stateLayerShape,
       _stateLayerColor = stateLayerColor,
       _stateLayerOpacity = stateLayerOpacity,
       _handleSize = handleSize,
       _handleShape = handleShape,
       _handleColor = handleColor,
       _handleOutline = handleOutline,
       _iconTheme = iconTheme;

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;

  final SwitchStateProperty<Size?>? _minTapTargetSize;
  final SwitchStateProperty<Size?>? _trackSize;
  final SwitchStateProperty<OutlinedBorder?>? _trackShape;
  final SwitchStateProperty<Color?>? _trackColor;
  final SwitchStateProperty<OutlinePartial?>? _trackOutline;
  final SwitchStateProperty<Size?>? _stateLayerSize;
  final SwitchStateProperty<ShapeBorder?>? _stateLayerShape;
  final SwitchStateProperty<Color?>? _stateLayerColor;
  final SwitchStateProperty<double?>? _stateLayerOpacity;
  final SwitchStateProperty<Size?>? _handleSize;
  final SwitchStateProperty<OutlinedBorder?>? _handleShape;
  final SwitchStateProperty<Color?>? _handleColor;
  final SwitchStateProperty<OutlinePartial?>? _handleOutline;
  final SwitchStateProperty<IconThemeDataPartial?>? _iconTheme;

  @override
  SwitchStateProperty<Size> get minTapTargetSize => .resolveWith(
    (states) => _minTapTargetSize?.resolve(states) ?? const .square(48.0),
  );

  @override
  SwitchStateProperty<Size> get trackSize => .resolveWith(
    (states) => _trackSize?.resolve(states) ?? const Size(52.0, 32.0),
  );

  @override
  SwitchStateProperty<OutlinedBorder> get trackShape => .resolveWith(
    (states) =>
        _trackShape?.resolve(states) ??
        CornersBorder.rounded(corners: .all(_shapeTheme.corner.full)),
  );

  @override
  SwitchStateProperty<Color> get trackColor => .resolveWith(
    (states) =>
        _trackColor?.resolve(states) ??
        switch (states) {
          SwitchDisabledStates(isSelected: false) =>
            _colorTheme.surfaceContainerHighest.withValues(alpha: 0.1),
          SwitchDisabledStates(isSelected: true) =>
            _colorTheme.onSurface.withValues(alpha: 0.1),
          SwitchStates(isSelected: false) =>
            _colorTheme.surfaceContainerHighest,
          SwitchStates(isSelected: true) => _colorTheme.primary,
        },
  );

  @override
  SwitchStateProperty<Outline> get trackOutline => .resolveWith(
    (states) => .from(
      width: 2.0,
      alignment: Outline.alignmentInside,
      color: switch (states) {
        SwitchDisabledStates(isSelected: false) =>
          _colorTheme.onSurface.withValues(alpha: 0.1),
        SwitchDisabledStates(isSelected: true) =>
          _colorTheme.primary.withValues(alpha: 0.0),
        SwitchStates(isSelected: false) => _colorTheme.outline,
        SwitchStates(isSelected: true) => _colorTheme.primary.withValues(
          alpha: 0.0,
        ),
      },
    ).merge(_trackOutline?.resolve(states)),
  );

  @override
  SwitchStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) => _stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  SwitchStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _stateLayerShape?.resolve(states) ??
        CornersBorder.rounded(corners: .all(_shapeTheme.corner.full)),
  );

  @override
  SwitchStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  SwitchStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _stateLayerOpacity?.resolve(states) ??
        switch (states) {
          SwitchEnabledStates(isPressed: true) =>
            _stateTheme.pressedStateLayerOpacity,
          SwitchEnabledStates(isHovered: true) =>
            _stateTheme.hoverStateLayerOpacity,
          SwitchEnabledStates(isFocused: true) => 0.0,
          SwitchStates() => 0.0,
        },
  );

  @override
  SwitchStateProperty<Size> get handleSize => .resolveWith(
    (states) =>
        _handleSize?.resolve(states) ??
        switch (states) {
          SwitchEnabledStates(isPressed: true) => const .square(28.0),
          SwitchStates(hasIcon: true) ||
          SwitchStates(isSelected: true) => const .square(24.0),
          SwitchStates() => const .square(16.0),
        },
  );

  @override
  SwitchStateProperty<OutlinedBorder> get handleShape => .resolveWith(
    (states) =>
        _handleShape?.resolve(states) ??
        CornersBorder.rounded(corners: .all(_shapeTheme.corner.full)),
  );

  @override
  SwitchStateProperty<Color> get handleColor => .resolveWith(
    (states) =>
        _handleColor?.resolve(states) ??
        switch (states) {
          SwitchDisabledStates(isSelected: false) =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          SwitchDisabledStates(isSelected: true) => _colorTheme.surface,
          SwitchStates(isSelected: false) => _colorTheme.outline,
          SwitchStates(isSelected: true) => _colorTheme.onPrimary,
        },
  );

  @override
  SwitchStateProperty<Outline> get handleOutline => .resolveWith(
    (states) => const Outline.from(
      width: 0.0,
      alignment: Outline.alignmentInside,
      color: Colors.transparent,
    ).merge(_handleOutline?.resolve(states)),
  );

  @override
  SwitchStateProperty<IconThemeDataPartial> get iconTheme => .resolveWith((
    states,
  ) {
    final color = switch (states) {
      SwitchDisabledStates(isSelected: false) =>
        _colorTheme.surfaceContainerHighest.withValues(alpha: 0.38),
      SwitchDisabledStates(isSelected: true) =>
        _colorTheme.onSurface.withValues(alpha: 0.38),
      SwitchStates(isSelected: false) => _colorTheme.surfaceContainerHighest,
      SwitchStates(isSelected: true) => _colorTheme.primary,
    };
    final result = IconThemeDataPartial.from(
      fill: 1.0,
      weight: 400.0,
      grade: 0.0,
      opticalSize: 24.0,
      size: 16.0,
      color: color,
    );
    return result.merge(_iconTheme?.resolve(states));
  });

  @override
  SwitchThemeData copyWith({
    covariant SwitchStateProperty<Size>? minTapTargetSize,
    covariant SwitchStateProperty<Size>? trackSize,
    covariant SwitchStateProperty<OutlinedBorder>? trackShape,
    covariant SwitchStateProperty<Color>? trackColor,
    covariant SwitchStateProperty<Outline>? trackOutline,
    covariant SwitchStateProperty<Size>? stateLayerSize,
    covariant SwitchStateProperty<ShapeBorder>? stateLayerShape,
    covariant SwitchStateProperty<Color>? stateLayerColor,
    covariant SwitchStateProperty<double>? stateLayerOpacity,
    covariant SwitchStateProperty<Size>? handleSize,
    covariant SwitchStateProperty<OutlinedBorder>? handleShape,
    covariant SwitchStateProperty<Color>? handleColor,
    covariant SwitchStateProperty<Outline>? handleOutline,
    covariant SwitchStateProperty<IconThemeDataPartial>? iconTheme,
  }) =>
      minTapTargetSize != null &&
          trackSize != null &&
          trackShape != null &&
          trackColor != null &&
          trackOutline != null &&
          stateLayerSize != null &&
          stateLayerShape != null &&
          stateLayerColor != null &&
          stateLayerOpacity != null &&
          handleSize != null &&
          handleShape != null &&
          handleColor != null &&
          handleOutline != null &&
          iconTheme != null
      ? .from(
          minTapTargetSize: minTapTargetSize,
          trackSize: trackSize,
          trackShape: trackShape,
          trackColor: trackColor,
          trackOutline: trackOutline,
          stateLayerSize: stateLayerSize,
          stateLayerShape: stateLayerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          handleSize: handleSize,
          handleShape: handleShape,
          handleColor: handleColor,
          handleOutline: handleOutline,
          iconTheme: iconTheme,
        )
      : _SwitchThemeDataDefaults(
          colorTheme: _colorTheme,
          shapeTheme: _shapeTheme,
          stateTheme: _stateTheme,
          minTapTargetSize: minTapTargetSize ?? _minTapTargetSize,
          trackSize: trackSize ?? _trackSize,
          trackShape: trackShape ?? _trackShape,
          trackColor: trackColor ?? _trackColor,
          trackOutline: trackOutline ?? _trackOutline,
          stateLayerSize: stateLayerSize ?? _stateLayerSize,
          stateLayerShape: stateLayerShape ?? _stateLayerShape,
          stateLayerColor: stateLayerColor ?? _stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
          handleSize: handleSize ?? _handleSize,
          handleShape: handleShape ?? _handleShape,
          handleColor: handleColor ?? _handleColor,
          handleOutline: handleOutline ?? _handleOutline,
          iconTheme: iconTheme ?? _iconTheme,
        );

  @override
  SwitchThemeData mergeWith({
    SwitchStateProperty<Size?>? minTapTargetSize,
    SwitchStateProperty<Size?>? trackSize,
    SwitchStateProperty<OutlinedBorder?>? trackShape,
    SwitchStateProperty<Color?>? trackColor,
    SwitchStateProperty<OutlinePartial?>? trackOutline,
    SwitchStateProperty<Size?>? stateLayerSize,
    SwitchStateProperty<ShapeBorder?>? stateLayerShape,
    SwitchStateProperty<Color?>? stateLayerColor,
    SwitchStateProperty<double?>? stateLayerOpacity,
    SwitchStateProperty<Size?>? handleSize,
    SwitchStateProperty<OutlinedBorder?>? handleShape,
    SwitchStateProperty<Color?>? handleColor,
    SwitchStateProperty<OutlinePartial?>? handleOutline,
    SwitchStateProperty<IconThemeDataPartial?>? iconTheme,
  }) => _SwitchThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    minTapTargetSize:
        minTapTargetSize?.orElseMaybe(_minTapTargetSize?.resolve) ??
        _minTapTargetSize,
    trackSize: trackSize?.orElseMaybe(_trackSize?.resolve) ?? _trackSize,
    trackShape: trackShape?.orElseMaybe(_trackShape?.resolve) ?? _trackShape,
    trackColor: trackColor?.orElseMaybe(_trackColor?.resolve) ?? _trackColor,
    trackOutline:
        trackOutline
            ?.orElseMaybe(_trackOutline?.resolve)
            .mapValue(
              (states, value) =>
                  _trackOutline?.resolve(states)?.merge(value) ?? value,
            ) ??
        _trackOutline,
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
    handleSize: handleSize?.orElseMaybe(_handleSize?.resolve) ?? _handleSize,
    handleShape:
        handleShape?.orElseMaybe(_handleShape?.resolve) ?? _handleShape,
    handleColor:
        handleColor?.orElseMaybe(_handleColor?.resolve) ?? _handleColor,
    handleOutline:
        handleOutline
            ?.orElseMaybe(_handleOutline?.resolve)
            .mapValue(
              (states, value) =>
                  _handleOutline?.resolve(states)?.merge(value) ?? value,
            ) ??
        _handleOutline,
    iconTheme:
        iconTheme
            ?.orElseMaybe(_iconTheme?.resolve)
            .mapValue(
              (states, value) =>
                  _iconTheme?.resolve(states)?.merge(value) ?? value,
            ) ??
        _iconTheme,
  );

  @override
  SwitchThemeData merge(SwitchThemeDataPartial? other) => other != null
      ? mergeWith(
          minTapTargetSize: other.minTapTargetSize,
          trackSize: other.trackSize,
          trackShape: other.trackShape,
          trackColor: other.trackColor,
          trackOutline: other.trackOutline,
          stateLayerSize: other.stateLayerSize,
          stateLayerShape: other.stateLayerShape,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          handleSize: other.handleSize,
          handleShape: other.handleShape,
          handleColor: other.handleColor,
          handleOutline: other.handleOutline,
          iconTheme: other.iconTheme,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SwitchThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _minTapTargetSize == other._minTapTargetSize &&
          _trackSize == other._trackSize &&
          _trackShape == other._trackShape &&
          _trackColor == other._trackColor &&
          _trackOutline == other._trackOutline &&
          _stateLayerSize == other._stateLayerSize &&
          _stateLayerShape == other._stateLayerShape &&
          _stateLayerColor == other._stateLayerColor &&
          _stateLayerOpacity == other._stateLayerOpacity &&
          _handleSize == other._handleSize &&
          _handleShape == other._handleShape &&
          _handleColor == other._handleColor &&
          _handleOutline == other._handleOutline &&
          _iconTheme == other._iconTheme;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorTheme,
    _shapeTheme,
    _stateTheme,
    _minTapTargetSize,
    _trackSize,
    _trackShape,
    _trackColor,
    _trackOutline,
    _stateLayerSize,
    _stateLayerShape,
    _stateLayerColor,
    _stateLayerOpacity,
    _handleSize,
    _handleShape,
    _handleColor,
    _handleOutline,
    _iconTheme,
  );
}

class SwitchTheme extends InheritedTheme {
  const SwitchTheme({super.key, required this.data, required super.child});

  final SwitchThemeData data;

  @override
  bool updateShouldNotify(SwitchTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      SwitchTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required SwitchThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        SwitchTheme(key: key, data: of(context).merge(data), child: child),
  );

  static SwitchThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SwitchTheme>()?.data;

  static SwitchThemeData of(BuildContext context) =>
      maybeOf(context) ??
      .fallback(
        colorTheme: ColorTheme.of(context),
        shapeTheme: ShapeTheme.of(context),
        stateTheme: StateTheme.of(context),
      );
}
