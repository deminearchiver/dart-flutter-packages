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

  SwitchThemeDataPartial copy() => copyWith();

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
  }) => .from(
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
  );

  SwitchThemeDataPartial maybeCopyWith({
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
      ? copyWith(
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
  }) => .from(
    minTapTargetSize: this.minTapTargetSize.maybeMergeNullable(
      minTapTargetSize,
    ),
    trackSize: this.trackSize.maybeMergeNullable(trackSize),
    trackShape: this.trackShape.maybeMergeNullable(trackShape),
    trackColor: this.trackColor.maybeMergeNullable(trackColor),
    trackOutline: this.trackOutline.maybeCombineNullable(
      trackOutline,
      OutlinePartial.combine,
    ),
    stateLayerSize: this.stateLayerSize.maybeMergeNullable(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMergeNullable(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMergeNullable(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
      stateLayerOpacity,
    ),
    handleSize: this.handleSize.maybeMergeNullable(handleSize),
    handleShape: this.handleShape.maybeMergeNullable(handleShape),
    handleColor: this.handleColor.maybeMergeNullable(handleColor),
    handleOutline: this.handleOutline.maybeCombineNullable(
      handleOutline,
      OutlinePartial.combine,
    ),
    iconTheme: this.iconTheme.maybeCombineNullable(
      iconTheme,
      (a, b) => a.merge(b),
    ),
  );

  SwitchThemeDataPartial maybeMergeWith({
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
          minTapTargetSize: this.minTapTargetSize.maybeMergeNullable(
            minTapTargetSize,
          ),
          trackSize: this.trackSize.maybeMergeNullable(trackSize),
          trackShape: this.trackShape.maybeMergeNullable(trackShape),
          trackColor: this.trackColor.maybeMergeNullable(trackColor),
          trackOutline: this.trackOutline.maybeCombineNullable(
            trackOutline,
            OutlinePartial.maybeCombine,
          ),
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
          handleSize: this.handleSize.maybeMergeNullable(handleSize),
          handleShape: this.handleShape.maybeMergeNullable(handleShape),
          handleColor: this.handleColor.maybeMergeNullable(handleColor),
          handleOutline: this.handleOutline.maybeCombineNullable(
            handleOutline,
            OutlinePartial.maybeCombine,
          ),
          iconTheme: this.iconTheme.maybeCombineNullable(
            iconTheme,
            (a, b) => a.maybeMerge(b),
          ),
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
      : copy();

  SwitchThemeDataPartial maybeMerge(SwitchThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
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
}

final class _SwitchThemeDataPartial extends SwitchThemeDataPartial {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SwitchThemeDataPartial &&
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

  const factory SwitchThemeData.defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    SwitchThemeDataPartial? overrides,
  }) = _SwitchThemeDataDefaults;

  factory SwitchThemeData.defaultsOf(
    BuildContext context, {
    SwitchThemeDataPartial? overrides,
  }) => .defaults(
    colorTheme: ColorTheme.of(context),
    shapeTheme: ShapeTheme.of(context),
    stateTheme: StateTheme.of(context),
    overrides: overrides,
  );

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
  SwitchThemeData copy() => copyWith();

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
  }) => .from(
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
  );

  @override
  SwitchThemeData maybeCopyWith({
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
      ? copyWith(
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
  }) => .from(
    minTapTargetSize: this.minTapTargetSize.maybeMerge(minTapTargetSize),
    trackSize: this.trackSize.maybeMerge(trackSize),
    trackShape: this.trackShape.maybeMerge(trackShape),
    trackColor: this.trackColor.maybeMerge(trackColor),
    trackOutline: this.trackOutline.maybeCombine(trackOutline, Outline.combine),
    stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
    stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
    stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMerge(stateLayerOpacity),
    handleSize: this.handleSize.maybeMerge(handleSize),
    handleShape: this.handleShape.maybeMerge(handleShape),
    handleColor: this.handleColor.maybeMerge(handleColor),
    handleOutline: this.handleOutline.maybeCombine(
      handleOutline,
      Outline.combine,
    ),
    iconTheme: this.iconTheme.maybeCombine(iconTheme, (a, b) => a.merge(b)),
  );

  @override
  SwitchThemeData maybeMergeWith({
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
          minTapTargetSize: this.minTapTargetSize.maybeMerge(minTapTargetSize),
          trackSize: this.trackSize.maybeMerge(trackSize),
          trackShape: this.trackShape.maybeMerge(trackShape),
          trackColor: this.trackColor.maybeMerge(trackColor),
          trackOutline: this.trackOutline.maybeCombine(
            trackOutline,
            Outline.maybeCombine,
          ),
          stateLayerSize: this.stateLayerSize.maybeMerge(stateLayerSize),
          stateLayerShape: this.stateLayerShape.maybeMerge(stateLayerShape),
          stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
          stateLayerOpacity: this.stateLayerOpacity.maybeMerge(
            stateLayerOpacity,
          ),
          handleSize: this.handleSize.maybeMerge(handleSize),
          handleShape: this.handleShape.maybeMerge(handleShape),
          handleColor: this.handleColor.maybeMerge(handleColor),
          handleOutline: this.handleOutline.maybeCombine(
            handleOutline,
            Outline.maybeCombine,
          ),
          iconTheme: this.iconTheme.maybeCombine(
            iconTheme,
            (a, b) => a.maybeMerge(b),
          ),
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
      : copy();

  @override
  SwitchThemeData maybeMerge(SwitchThemeDataPartial? other) => other != null
      ? maybeMergeWith(
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
}

final class _SwitchThemeData extends SwitchThemeData {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SwitchThemeData &&
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

final class _SwitchThemeDataDefaults extends SwitchThemeData {
  const _SwitchThemeDataDefaults({
    required this._colorTheme,
    required this._shapeTheme,
    required this._stateTheme,
    SwitchThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final SwitchThemeDataPartial _overrides;

  @override
  SwitchStateProperty<Size> get minTapTargetSize => .resolveWith(
    (states) =>
        _overrides.minTapTargetSize?.resolve(states) ?? const .square(48.0),
  );

  @override
  SwitchStateProperty<Size> get trackSize => .resolveWith(
    (states) => _overrides.trackSize?.resolve(states) ?? const Size(52.0, 32.0),
  );

  @override
  SwitchStateProperty<OutlinedBorder> get trackShape => .resolveWith(
    (states) =>
        _overrides.trackShape?.resolve(states) ??
        _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
  );

  @override
  SwitchStateProperty<Color> get trackColor => .resolveWith(
    (states) =>
        _overrides.trackColor?.resolve(states) ??
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
    ).maybeMerge(_overrides.trackOutline?.resolve(states)),
  );

  @override
  SwitchStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) =>
        _overrides.stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  SwitchStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _overrides.stateLayerShape?.resolve(states) ??
        _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
  );

  @override
  SwitchStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _overrides.stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  SwitchStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _overrides.stateLayerOpacity?.resolve(states) ??
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
        _overrides.handleSize?.resolve(states) ??
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
        _overrides.handleShape?.resolve(states) ??
        _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
  );

  @override
  SwitchStateProperty<Color> get handleColor => .resolveWith(
    (states) =>
        _overrides.handleColor?.resolve(states) ??
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
    ).maybeMerge(_overrides.handleOutline?.resolve(states)),
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
      weight: 500.0, // TODO: investigate the usefulness of this default
      grade: 0.0,
      opticalSize: 24.0,
      size: 16.0,
      color: color,
    );
    return result.maybeMerge(_overrides.iconTheme?.resolve(states));
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
  }) => _SwitchThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.copyWith(
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
    ),
  );

  @override
  SwitchThemeData maybeCopyWith({
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
      : minTapTargetSize != null ||
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
      ? copyWith(
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
  }) => _SwitchThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    overrides: _overrides.mergeWith(
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
    ),
  );

  @override
  SwitchThemeData maybeMergeWith({
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
  }) {
    final overrides = _overrides.maybeMergeWith(
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
    );
    return identical(_overrides, overrides)
        ? this
        : _SwitchThemeDataDefaults(
            colorTheme: _colorTheme,
            shapeTheme: _shapeTheme,
            stateTheme: _stateTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _SwitchThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode =>
      Object.hash(_colorTheme, _shapeTheme, _stateTheme, _overrides);
}

abstract class SwitchTheme extends StatelessWidget implements ProxyWidget {
  const SwitchTheme._({super.key, required this.child});

  const factory SwitchTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<SwitchThemeDataPartial> resolver,
    required Widget child,
  }) = _SwitchThemeWithResolver<SwitchThemeDataPartial>;

  const factory SwitchTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<SwitchThemeDataPartial> callback,
    required Widget child,
  }) = _SwitchThemeWithCallback<SwitchThemeDataPartial>;

  const factory SwitchTheme.mergeWithData({
    Key? key,
    required SwitchThemeDataPartial data,
    required Widget child,
  }) = _SwitchThemeWithData<SwitchThemeDataPartial>;

  const factory SwitchTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<SwitchThemeData> resolver,
    required Widget child,
  }) = _SwitchThemeWithResolver<SwitchThemeData>;

  const factory SwitchTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<SwitchThemeData> callback,
    required Widget child,
  }) = _SwitchThemeWithCallback<SwitchThemeData>;

  const factory SwitchTheme.replaceWithData({
    Key? key,
    required SwitchThemeData data,
    required Widget child,
  }) = _SwitchThemeWithData<SwitchThemeData>;

  ThemeResolver<SwitchThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _SwitchTheme(resolver: resolver, child: child);

  static SwitchThemeData? maybeOf(BuildContext context) {
    final overrides = _SwitchTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static SwitchThemeData of(BuildContext context) =>
      .defaultsOf(context, overrides: _SwitchTheme.maybeOverridesOf(context));
}

class _SwitchThemeWithResolver<T extends SwitchThemeDataPartial>
    extends SwitchTheme {
  const _SwitchThemeWithResolver({
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

class _SwitchThemeWithCallback<T extends SwitchThemeDataPartial>
    extends SwitchTheme {
  const _SwitchThemeWithCallback({
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

class _SwitchThemeWithData<T extends SwitchThemeDataPartial>
    extends SwitchTheme {
  const _SwitchThemeWithData({
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

final class _SwitchTheme
    extends
        InheritedThemeResolverWidget<
          SwitchThemeDataPartial,
          _SwitchTheme,
          _SwitchThemeElement
        >
    implements InheritedTheme {
  const _SwitchTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  SwitchThemeDataPartial merge(
    SwitchThemeDataPartial fallback,
    SwitchThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _SwitchThemeElement createElement() => _SwitchThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _SwitchTheme(resolver: resolver, child: child);

  static ThemeResolver<SwitchThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        SwitchThemeDataPartial,
        _SwitchTheme,
        _SwitchThemeElement
      >(context);

  static SwitchThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        SwitchThemeDataPartial,
        _SwitchTheme,
        _SwitchThemeElement
      >(context);
}

final class _SwitchThemeElement
    extends
        InheritedThemeResolverElement<
          SwitchThemeDataPartial,
          _SwitchTheme,
          _SwitchThemeElement
        > {
  _SwitchThemeElement(super.widget);
}
