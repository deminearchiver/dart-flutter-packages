import 'package:material/src/material/flutter.dart';

abstract interface class ListItemStates {}

abstract interface class SegmentedListItemStates implements ListItemStates {
  bool get isFirst;
  bool get isLast;
}

abstract interface class InteractiveListItemStates
    implements ListItemStates, InteractiveStates {}

abstract interface class InteractiveListItemDisabledStates
    implements InteractiveListItemStates, InteractiveDisabledStates {}

abstract interface class InteractiveListItemEnabledStates
    implements InteractiveListItemStates, InteractiveEnabledStates {}

abstract interface class SelectableListItemStates
    implements ListItemStates, SelectableStates {}

abstract interface class DraggableListItemStates
    implements ListItemStates, DraggableStates {}

typedef ListItemStateProperty<T extends Object?> =
    StateProperty<T, ListItemStates>;

abstract class ListItemThemeDataPartial with Diagnosticable
// implements
//     ThemeDataPartialCopyMixin<ListItemThemeDataPartial>,
//     ThemeDataPartialCopyWithMixin<ListItemThemeDataPartial>,
//     ThemeDataPartialMergeWithMixin<ListItemThemeDataPartial>,
//     ThemeDataPartialMergeMixin<ListItemThemeDataPartial>
{
  const ListItemThemeDataPartial();

  const factory ListItemThemeDataPartial.from({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) = _ListItemThemeDataPartial;

  ListItemStateProperty<ShapeBorder?>? get containerShape;

  ListItemStateProperty<Color?>? get containerColor;

  ListItemStateProperty<Color?>? get stateLayerColor;

  ListItemStateProperty<double?>? get stateLayerOpacity;

  ListItemStateProperty<IconThemeDataPartial?>? get leadingIconTheme;

  ListItemStateProperty<TextStyle?>? get leadingTextStyle;

  ListItemStateProperty<TextStyle?>? get overlineTextStyle;

  ListItemStateProperty<TextStyle?>? get headlineTextStyle;

  ListItemStateProperty<TextStyle?>? get supportingTextStyle;

  ListItemStateProperty<TextStyle?>? get trailingTextStyle;

  ListItemStateProperty<IconThemeDataPartial?>? get trailingIconTheme;

  ListItemThemeDataPartial copy() => copyWith();

  ListItemThemeDataPartial copyWith({
    covariant ListItemStateProperty<ShapeBorder?>? containerShape,
    covariant ListItemStateProperty<Color?>? containerColor,
    covariant ListItemStateProperty<Color?>? stateLayerColor,
    covariant ListItemStateProperty<double?>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle?>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle?>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle?>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle?>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle?>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) => .from(
    containerShape: containerShape ?? this.containerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    containerColor: containerColor ?? this.containerColor,
    leadingIconTheme: leadingIconTheme ?? this.leadingIconTheme,
    leadingTextStyle: leadingTextStyle ?? this.leadingTextStyle,
    overlineTextStyle: overlineTextStyle ?? this.overlineTextStyle,
    headlineTextStyle: headlineTextStyle ?? this.headlineTextStyle,
    supportingTextStyle: supportingTextStyle ?? this.supportingTextStyle,
    trailingTextStyle: trailingTextStyle ?? this.trailingTextStyle,
    trailingIconTheme: trailingIconTheme ?? this.trailingIconTheme,
  );

  ListItemThemeDataPartial maybeCopyWith({
    covariant ListItemStateProperty<ShapeBorder?>? containerShape,
    covariant ListItemStateProperty<Color?>? containerColor,
    covariant ListItemStateProperty<Color?>? stateLayerColor,
    covariant ListItemStateProperty<double?>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle?>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle?>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle?>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle?>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle?>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) =>
      containerShape != null ||
          containerColor != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          leadingIconTheme != null ||
          leadingTextStyle != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? copyWith(
          containerShape: containerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerColor: containerColor,
          leadingIconTheme: leadingIconTheme,
          leadingTextStyle: leadingTextStyle,
          overlineTextStyle: overlineTextStyle,
          headlineTextStyle: headlineTextStyle,
          supportingTextStyle: supportingTextStyle,
          trailingTextStyle: trailingTextStyle,
          trailingIconTheme: trailingIconTheme,
        )
      : this;

  ListItemThemeDataPartial mergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) => .from(
    containerShape: this.containerShape.maybeMergeNullable(containerShape),
    containerColor: this.containerColor.maybeMergeNullable(containerColor),
    stateLayerColor: this.stateLayerColor.maybeMergeNullable(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
      stateLayerOpacity,
    ),
    leadingIconTheme: this.leadingIconTheme.maybeCombineNullable(
      leadingIconTheme,
      (a, b) => a.merge(b),
    ),
    leadingTextStyle: this.leadingTextStyle.maybeCombineNullable(
      leadingTextStyle,
      (a, b) => a.merge(b),
    ),
    overlineTextStyle: this.overlineTextStyle.maybeCombineNullable(
      overlineTextStyle,
      (a, b) => a.merge(b),
    ),
    headlineTextStyle: this.headlineTextStyle.maybeCombineNullable(
      headlineTextStyle,
      (a, b) => a.merge(b),
    ),
    supportingTextStyle: this.supportingTextStyle.maybeCombineNullable(
      supportingTextStyle,
      (a, b) => a.merge(b),
    ),
    trailingTextStyle: this.trailingTextStyle.maybeCombineNullable(
      trailingTextStyle,
      (a, b) => a.merge(b),
    ),
    trailingIconTheme: this.trailingIconTheme.maybeCombineNullable(
      trailingIconTheme,
      (a, b) => a.merge(b),
    ),
  );

  ListItemThemeDataPartial maybeMergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) =>
      containerShape != null ||
          containerColor != null ||
          leadingIconTheme != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? .from(
          containerShape: this.containerShape.maybeMergeNullable(
            containerShape,
          ),
          containerColor: this.containerColor.maybeMergeNullable(
            containerColor,
          ),
          stateLayerColor: this.stateLayerColor.maybeMergeNullable(
            stateLayerColor,
          ),
          stateLayerOpacity: this.stateLayerOpacity.maybeMergeNullable(
            stateLayerOpacity,
          ),
          leadingIconTheme: this.leadingIconTheme.maybeCombineNullable(
            leadingIconTheme,
            (a, b) => a.maybeMerge(b),
          ),
          leadingTextStyle: this.leadingTextStyle.maybeCombineNullable(
            leadingTextStyle,
            (a, b) => a.merge(b),
          ),
          overlineTextStyle: this.overlineTextStyle.maybeCombineNullable(
            overlineTextStyle,
            (a, b) => a.merge(b),
          ),
          headlineTextStyle: this.headlineTextStyle.maybeCombineNullable(
            headlineTextStyle,
            (a, b) => a.merge(b),
          ),
          supportingTextStyle: this.supportingTextStyle.maybeCombineNullable(
            supportingTextStyle,
            (a, b) => a.merge(b),
          ),
          trailingTextStyle: this.trailingTextStyle.maybeCombineNullable(
            trailingTextStyle,
            (a, b) => a.merge(b),
          ),
          trailingIconTheme: this.trailingIconTheme.maybeCombineNullable(
            trailingIconTheme,
            (a, b) => a.maybeMerge(b),
          ),
        )
      : this;

  ListItemThemeDataPartial merge(ListItemThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          leadingIconTheme: other.leadingIconTheme,
          leadingTextStyle: other.leadingTextStyle,
          overlineTextStyle: other.overlineTextStyle,
          headlineTextStyle: other.headlineTextStyle,
          supportingTextStyle: other.supportingTextStyle,
          trailingTextStyle: other.trailingTextStyle,
          trailingIconTheme: other.trailingIconTheme,
        )
      : copy();

  ListItemThemeDataPartial maybeMerge(ListItemThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          leadingIconTheme: other.leadingIconTheme,
          leadingTextStyle: other.leadingTextStyle,
          overlineTextStyle: other.overlineTextStyle,
          headlineTextStyle: other.headlineTextStyle,
          supportingTextStyle: other.supportingTextStyle,
          trailingTextStyle: other.trailingTextStyle,
          trailingIconTheme: other.trailingIconTheme,
        )
      : this;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<ListItemStateProperty<ShapeBorder?>>(
          "containerShape",
          containerShape,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<Color?>>(
          "containerColor",
          containerColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<Color?>>(
          "stateLayerColor",
          stateLayerColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<double?>>(
          "stateLayerOpacity",
          stateLayerOpacity,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<IconThemeDataPartial?>>(
          "leadingIconTheme",
          leadingIconTheme,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle?>>(
          "leadingTextStyle",
          leadingTextStyle,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle?>>(
          "overlineTextStyle",
          overlineTextStyle,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle?>>(
          "headlineTextStyle",
          headlineTextStyle,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle?>>(
          "supportingTextStyle",
          supportingTextStyle,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle?>>(
          "trailingTextStyle",
          trailingTextStyle,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<IconThemeDataPartial?>>(
          "trailingIconTheme",
          trailingIconTheme,
          defaultValue: null,
        ),
      );
  }
}

final class _ListItemThemeDataPartial extends ListItemThemeDataPartial {
  const _ListItemThemeDataPartial({
    this.containerShape,
    this.containerColor,
    this.stateLayerColor,
    this.stateLayerOpacity,
    this.leadingIconTheme,
    this.leadingTextStyle,
    this.overlineTextStyle,
    this.headlineTextStyle,
    this.supportingTextStyle,
    this.trailingTextStyle,
    this.trailingIconTheme,
  });

  @override
  final ListItemStateProperty<ShapeBorder?>? containerShape;

  @override
  final ListItemStateProperty<Color?>? containerColor;

  @override
  final ListItemStateProperty<Color?>? stateLayerColor;

  @override
  final ListItemStateProperty<double?>? stateLayerOpacity;

  @override
  final ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme;

  @override
  final ListItemStateProperty<TextStyle?>? leadingTextStyle;

  @override
  final ListItemStateProperty<TextStyle?>? overlineTextStyle;

  @override
  final ListItemStateProperty<TextStyle?>? headlineTextStyle;

  @override
  final ListItemStateProperty<TextStyle?>? supportingTextStyle;

  @override
  final ListItemStateProperty<TextStyle?>? trailingTextStyle;

  @override
  final ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ListItemThemeDataPartial &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          leadingIconTheme == other.leadingIconTheme &&
          leadingTextStyle == other.leadingTextStyle &&
          overlineTextStyle == other.overlineTextStyle &&
          headlineTextStyle == other.headlineTextStyle &&
          supportingTextStyle == other.supportingTextStyle &&
          trailingTextStyle == other.trailingTextStyle &&
          trailingIconTheme == other.trailingIconTheme;

  @override
  int get hashCode => Object.hash(
    containerShape,
    containerColor,
    stateLayerColor,
    stateLayerOpacity,
    leadingIconTheme,
    leadingTextStyle,
    overlineTextStyle,
    headlineTextStyle,
    supportingTextStyle,
    trailingTextStyle,
    trailingIconTheme,
  );
}

abstract class ListItemThemeData extends ListItemThemeDataPartial
// implements
//     ThemeDataConcreteCopyMixin<ListItemThemeDataPartial, ListItemThemeData>,
//     ThemeDataConcreteCopyWithMixin<
//       ListItemThemeDataPartial,
//       ListItemThemeData
//     >,
//     ThemeDataConcreteMergeWithMixin<
//       ListItemThemeDataPartial,
//       ListItemThemeData
//     >,
//     ThemeDataConcreteMergeMixin<
//       ListItemThemeDataPartial,
//       ListItemThemeData
//     >
{
  const ListItemThemeData();

  const factory ListItemThemeData.from({
    required ListItemStateProperty<ShapeBorder> containerShape,
    required ListItemStateProperty<Color> containerColor,
    required ListItemStateProperty<Color> stateLayerColor,
    required ListItemStateProperty<double> stateLayerOpacity,
    required ListItemStateProperty<IconThemeDataPartial> leadingIconTheme,
    required ListItemStateProperty<TextStyle> leadingTextStyle,
    required ListItemStateProperty<TextStyle> overlineTextStyle,
    required ListItemStateProperty<TextStyle> headlineTextStyle,
    required ListItemStateProperty<TextStyle> supportingTextStyle,
    required ListItemStateProperty<TextStyle> trailingTextStyle,
    required ListItemStateProperty<IconThemeDataPartial> trailingIconTheme,
  }) = _ListItemThemeData;

  const factory ListItemThemeData.defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    required TypescaleThemeData typescaleTheme,
    ListItemThemeDataPartial? overrides,
  }) = _ListItemThemeDataDefaults;

  factory ListItemThemeData.defaultsOf(
    BuildContext context, {
    ListItemThemeDataPartial? overrides,
  }) => .defaults(
    colorTheme: ColorTheme.of(context),
    shapeTheme: ShapeTheme.of(context),
    stateTheme: StateTheme.of(context),
    typescaleTheme: TypescaleTheme.of(context),
    overrides: overrides,
  );

  @override
  ListItemStateProperty<ShapeBorder> get containerShape;

  @override
  ListItemStateProperty<Color> get containerColor;

  @override
  ListItemStateProperty<Color> get stateLayerColor;

  @override
  ListItemStateProperty<double> get stateLayerOpacity;

  @override
  ListItemStateProperty<IconThemeDataPartial> get leadingIconTheme;

  @override
  ListItemStateProperty<TextStyle> get leadingTextStyle;

  @override
  ListItemStateProperty<TextStyle> get overlineTextStyle;

  @override
  ListItemStateProperty<TextStyle> get headlineTextStyle;

  @override
  ListItemStateProperty<TextStyle> get supportingTextStyle;

  @override
  ListItemStateProperty<TextStyle> get trailingTextStyle;

  @override
  ListItemStateProperty<IconThemeDataPartial> get trailingIconTheme;

  @override
  ListItemThemeData copy() => copyWith();

  @override
  ListItemThemeData copyWith({
    covariant ListItemStateProperty<ShapeBorder>? containerShape,
    covariant ListItemStateProperty<Color>? containerColor,
    covariant ListItemStateProperty<Color>? stateLayerColor,
    covariant ListItemStateProperty<double>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial>? trailingIconTheme,
  }) => .from(
    containerShape: containerShape ?? this.containerShape,
    stateLayerColor: stateLayerColor ?? this.stateLayerColor,
    stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
    containerColor: containerColor ?? this.containerColor,
    leadingIconTheme: leadingIconTheme ?? this.leadingIconTheme,
    leadingTextStyle: leadingTextStyle ?? this.leadingTextStyle,
    overlineTextStyle: overlineTextStyle ?? this.overlineTextStyle,
    headlineTextStyle: headlineTextStyle ?? this.headlineTextStyle,
    supportingTextStyle: supportingTextStyle ?? this.supportingTextStyle,
    trailingTextStyle: trailingTextStyle ?? this.trailingTextStyle,
    trailingIconTheme: trailingIconTheme ?? this.trailingIconTheme,
  );

  @override
  ListItemThemeData maybeCopyWith({
    covariant ListItemStateProperty<ShapeBorder>? containerShape,
    covariant ListItemStateProperty<Color>? containerColor,
    covariant ListItemStateProperty<Color>? stateLayerColor,
    covariant ListItemStateProperty<double>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial>? trailingIconTheme,
  }) =>
      containerShape != null ||
          containerColor != null ||
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          leadingIconTheme != null ||
          leadingTextStyle != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? copyWith(
          containerShape: containerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerColor: containerColor,
          leadingIconTheme: leadingIconTheme,
          leadingTextStyle: leadingTextStyle,
          overlineTextStyle: overlineTextStyle,
          headlineTextStyle: headlineTextStyle,
          supportingTextStyle: supportingTextStyle,
          trailingTextStyle: trailingTextStyle,
          trailingIconTheme: trailingIconTheme,
        )
      : this;

  @override
  ListItemThemeData mergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) => .from(
    containerShape: this.containerShape.maybeMerge(containerShape),
    containerColor: this.containerColor.maybeMerge(containerColor),
    stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
    stateLayerOpacity: this.stateLayerOpacity.maybeMerge(stateLayerOpacity),
    leadingIconTheme: this.leadingIconTheme.maybeCombine(
      leadingIconTheme,
      (a, b) => a.merge(b),
    ),
    leadingTextStyle: this.leadingTextStyle.maybeCombine(
      leadingTextStyle,
      (a, b) => a.merge(b),
    ),
    overlineTextStyle: this.overlineTextStyle.maybeCombine(
      overlineTextStyle,
      (a, b) => a.merge(b),
    ),
    headlineTextStyle: this.headlineTextStyle.maybeCombine(
      headlineTextStyle,
      (a, b) => a.merge(b),
    ),
    supportingTextStyle: this.supportingTextStyle.maybeCombine(
      supportingTextStyle,
      (a, b) => a.merge(b),
    ),
    trailingTextStyle: this.trailingTextStyle.maybeCombine(
      trailingTextStyle,
      (a, b) => a.merge(b),
    ),
    trailingIconTheme: this.trailingIconTheme.maybeCombine(
      trailingIconTheme,
      (a, b) => a.merge(b),
    ),
  );

  @override
  ListItemThemeData maybeMergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) =>
      containerShape != null ||
          containerColor != null ||
          leadingIconTheme != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? .from(
          containerShape: this.containerShape.maybeMerge(containerShape),
          containerColor: this.containerColor.maybeMerge(containerColor),
          stateLayerColor: this.stateLayerColor.maybeMerge(stateLayerColor),
          stateLayerOpacity: this.stateLayerOpacity.maybeMerge(
            stateLayerOpacity,
          ),
          leadingIconTheme: this.leadingIconTheme.maybeCombine(
            leadingIconTheme,
            (a, b) => a.maybeMerge(b),
          ),
          leadingTextStyle: this.leadingTextStyle.maybeCombine(
            leadingTextStyle,
            (a, b) => a.merge(b),
          ),
          overlineTextStyle: this.overlineTextStyle.maybeCombine(
            overlineTextStyle,
            (a, b) => a.merge(b),
          ),
          headlineTextStyle: this.headlineTextStyle.maybeCombine(
            headlineTextStyle,
            (a, b) => a.merge(b),
          ),
          supportingTextStyle: this.supportingTextStyle.maybeCombine(
            supportingTextStyle,
            (a, b) => a.merge(b),
          ),
          trailingTextStyle: this.trailingTextStyle.maybeCombine(
            trailingTextStyle,
            (a, b) => a.merge(b),
          ),
          trailingIconTheme: this.trailingIconTheme.maybeCombine(
            trailingIconTheme,
            (a, b) => a.maybeMerge(b),
          ),
        )
      : this;

  @override
  ListItemThemeData merge(ListItemThemeDataPartial? other) => other != null
      ? mergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          leadingIconTheme: other.leadingIconTheme,
          leadingTextStyle: other.leadingTextStyle,
          overlineTextStyle: other.overlineTextStyle,
          headlineTextStyle: other.headlineTextStyle,
          supportingTextStyle: other.supportingTextStyle,
          trailingTextStyle: other.trailingTextStyle,
          trailingIconTheme: other.trailingIconTheme,
        )
      : copy();

  @override
  ListItemThemeData maybeMerge(ListItemThemeDataPartial? other) => other != null
      ? maybeMergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          stateLayerColor: other.stateLayerColor,
          stateLayerOpacity: other.stateLayerOpacity,
          leadingIconTheme: other.leadingIconTheme,
          leadingTextStyle: other.leadingTextStyle,
          overlineTextStyle: other.overlineTextStyle,
          headlineTextStyle: other.headlineTextStyle,
          supportingTextStyle: other.supportingTextStyle,
          trailingTextStyle: other.trailingTextStyle,
          trailingIconTheme: other.trailingIconTheme,
        )
      : this;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<ListItemStateProperty<ShapeBorder>>(
          "containerShape",
          containerShape,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<Color>>(
          "containerColor",
          containerColor,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<Color>>(
          "stateLayerColor",
          stateLayerColor,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<double>>(
          "stateLayerOpacity",
          stateLayerOpacity,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<IconThemeDataPartial>>(
          "leadingIconTheme",
          leadingIconTheme,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle>>(
          "leadingTextStyle",
          leadingTextStyle,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle>>(
          "overlineTextStyle",
          overlineTextStyle,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle>>(
          "headlineTextStyle",
          headlineTextStyle,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle>>(
          "supportingTextStyle",
          supportingTextStyle,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<TextStyle>>(
          "trailingTextStyle",
          trailingTextStyle,
        ),
      )
      ..add(
        DiagnosticsProperty<ListItemStateProperty<IconThemeDataPartial>>(
          "trailingIconTheme",
          trailingIconTheme,
        ),
      );
  }
}

final class _ListItemThemeData extends ListItemThemeData {
  const _ListItemThemeData({
    required this.containerShape,
    required this.containerColor,
    required this.stateLayerColor,
    required this.stateLayerOpacity,
    required this.leadingIconTheme,
    required this.leadingTextStyle,
    required this.overlineTextStyle,
    required this.headlineTextStyle,
    required this.supportingTextStyle,
    required this.trailingTextStyle,
    required this.trailingIconTheme,
  });

  @override
  final ListItemStateProperty<ShapeBorder> containerShape;

  @override
  final ListItemStateProperty<Color> stateLayerColor;

  @override
  final ListItemStateProperty<double> stateLayerOpacity;

  @override
  final ListItemStateProperty<Color> containerColor;

  @override
  final ListItemStateProperty<IconThemeDataPartial> leadingIconTheme;

  @override
  final ListItemStateProperty<TextStyle> leadingTextStyle;

  @override
  final ListItemStateProperty<TextStyle> overlineTextStyle;

  @override
  final ListItemStateProperty<TextStyle> headlineTextStyle;

  @override
  final ListItemStateProperty<TextStyle> supportingTextStyle;

  @override
  final ListItemStateProperty<TextStyle> trailingTextStyle;

  @override
  final ListItemStateProperty<IconThemeDataPartial> trailingIconTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ListItemThemeData &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          stateLayerColor == other.stateLayerColor &&
          stateLayerOpacity == other.stateLayerOpacity &&
          leadingIconTheme == other.leadingIconTheme &&
          leadingTextStyle == other.leadingTextStyle &&
          overlineTextStyle == other.overlineTextStyle &&
          headlineTextStyle == other.headlineTextStyle &&
          supportingTextStyle == other.supportingTextStyle &&
          trailingTextStyle == other.trailingTextStyle &&
          trailingIconTheme == other.trailingIconTheme;

  @override
  int get hashCode => Object.hash(
    containerShape,
    containerColor,
    stateLayerColor,
    stateLayerOpacity,
    leadingIconTheme,
    leadingTextStyle,
    overlineTextStyle,
    headlineTextStyle,
    supportingTextStyle,
    trailingTextStyle,
    trailingIconTheme,
  );
}

final class _ListItemThemeDataDefaults extends ListItemThemeData {
  const _ListItemThemeDataDefaults({
    required this._colorTheme,
    required this._shapeTheme,
    required this._stateTheme,
    required this._typescaleTheme,
    ListItemThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final TypescaleThemeData _typescaleTheme;
  final ListItemThemeDataPartial _overrides;

  @override
  ListItemStateProperty<ShapeBorder> get containerShape =>
      _ListItemStateProperty(this, _resolveContainerShape);

  static ShapeBorder _resolveContainerShape(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final resolved = defaults._overrides.containerShape?.resolve(states);
    if (resolved != null) return resolved;
    final outerCorner = defaults._shapeTheme.cornerLarge;
    final innerCorner = defaults._shapeTheme.cornerExtraSmall;
    final hoveredCorner = defaults._shapeTheme.cornerMedium;
    final CornersGeometry corners = switch (states) {
      SelectableListItemStates(isSelected: true) ||
      DraggableListItemStates(isDragged: true) ||
      InteractiveListItemEnabledStates(isPressed: true) ||
      InteractiveListItemEnabledStates(isFocused: true) => .all(outerCorner),
      InteractiveListItemEnabledStates(isHovered: true) => .all(hoveredCorner),
      SegmentedListItemStates(isFirst: true, isLast: true) => .all(outerCorner),
      SegmentedListItemStates(isFirst: true) => .vertical(
        top: outerCorner,
        bottom: innerCorner,
      ),
      SegmentedListItemStates(isLast: true) => .vertical(
        top: innerCorner,
        bottom: outerCorner,
      ),
      _ => .all(innerCorner),
    };
    return defaults._shapeTheme.applyCorners(corners: corners);
  }

  @override
  ListItemStateProperty<Color> get containerColor =>
      _ListItemStateProperty(this, _resolveContainerColor);

  static Color _resolveContainerColor(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) =>
      defaults._overrides.containerColor?.resolve(states) ??
      switch (states) {
        InteractiveListItemDisabledStates() =>
          defaults._colorTheme.onSurface.withValues(alpha: 0.10),
        DraggableListItemStates(isDragged: true) =>
          defaults._colorTheme.tertiaryContainer,
        SelectableListItemStates(isSelected: true) =>
          defaults._colorTheme.secondaryContainer,
        _ => defaults._colorTheme.surface,
      };

  @override
  ListItemStateProperty<Color> get stateLayerColor =>
      _ListItemStateProperty(this, _resolveStateLayerColor);

  static Color _resolveStateLayerColor(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) =>
      defaults._overrides.stateLayerColor?.resolve(states) ??
      switch (states) {
        DraggableListItemStates(isDragged: true) =>
          defaults._colorTheme.onTertiaryContainer,
        SelectableListItemStates(isSelected: true) =>
          defaults._colorTheme.onSecondaryContainer,
        _ => defaults._colorTheme.onSurface,
      };

  @override
  ListItemStateProperty<double> get stateLayerOpacity =>
      _ListItemStateProperty(this, _resolveStateLayerOpacity);

  static double _resolveStateLayerOpacity(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) =>
      defaults._overrides.stateLayerOpacity?.resolve(states) ??
      switch (states) {
        InteractiveListItemDisabledStates() => 0.0,
        DraggableListItemStates(isDragged: true) =>
          defaults._stateTheme.draggedStateLayerOpacity,
        InteractiveListItemEnabledStates(isPressed: true) =>
          defaults._stateTheme.pressedStateLayerOpacity,
        InteractiveListItemEnabledStates(isHovered: true) =>
          defaults._stateTheme.hoverStateLayerOpacity,
        InteractiveListItemEnabledStates(isFocused: true) => 0.0,
        _ => 0.0,
      };

  @override
  ListItemStateProperty<IconThemeDataPartial> get leadingIconTheme =>
      _ListItemStateProperty(this, _resolveLeadingIconTheme);

  static IconThemeDataPartial _resolveLeadingIconTheme(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = IconThemeDataPartial.from(
      size: 20.0,
      opticalSize: 20.0,
      color: color,
    );
    return result.maybeMerge(
      defaults._overrides.leadingIconTheme?.resolve(states),
    );
  }

  @override
  ListItemStateProperty<TextStyle> get leadingTextStyle =>
      _ListItemStateProperty(this, _resolveLeadingTextStyle);

  static TextStyle _resolveLeadingTextStyle(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = defaults._typescaleTheme.labelSmall.toTextStyle(
      color: color,
    );
    return result.merge(defaults._overrides.leadingTextStyle?.resolve(states));
  }

  @override
  ListItemStateProperty<TextStyle> get overlineTextStyle =>
      _ListItemStateProperty(this, _resolveOverlineTextStyle);

  static TextStyle _resolveOverlineTextStyle(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = defaults._typescaleTheme.labelSmall.toTextStyle(
      color: color,
    );
    return result.merge(defaults._overrides.overlineTextStyle?.resolve(states));
  }

  @override
  ListItemStateProperty<TextStyle> get headlineTextStyle =>
      _ListItemStateProperty(this, _resolveHeadlineTextStyle);

  static TextStyle _resolveHeadlineTextStyle(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurface,
    };
    final result = defaults._typescaleTheme.bodyLarge.toTextStyle(color: color);
    return result.merge(defaults._overrides.headlineTextStyle?.resolve(states));
  }

  @override
  ListItemStateProperty<TextStyle> get supportingTextStyle =>
      _ListItemStateProperty(this, _resolveSupportingTextStyle);

  static TextStyle _resolveSupportingTextStyle(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = defaults._typescaleTheme.bodyMedium.toTextStyle(
      color: color,
    );
    return result.merge(
      defaults._overrides.supportingTextStyle?.resolve(states),
    );
  }

  @override
  ListItemStateProperty<TextStyle> get trailingTextStyle =>
      _ListItemStateProperty(this, _resolveTrailingTextStyle);

  static TextStyle _resolveTrailingTextStyle(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = defaults._typescaleTheme.labelSmall.toTextStyle(
      color: color,
    );
    return result.merge(defaults._overrides.trailingTextStyle?.resolve(states));
  }

  @override
  ListItemStateProperty<IconThemeDataPartial> get trailingIconTheme =>
      _ListItemStateProperty(this, _resolveTrailingIconTheme);

  static IconThemeDataPartial _resolveTrailingIconTheme(
    ListItemStates states,
    _ListItemThemeDataDefaults defaults,
  ) {
    final color = switch (states) {
      InteractiveListItemDisabledStates() =>
        defaults._colorTheme.onSurface.withValues(
          alpha: defaults._stateTheme.disabledStateLayerOpacity,
        ),
      DraggableListItemStates(isDragged: true) =>
        defaults._colorTheme.onTertiaryContainer,
      SelectableListItemStates(isSelected: true) =>
        defaults._colorTheme.onSecondaryContainer,
      _ => defaults._colorTheme.onSurfaceVariant,
    };
    final result = IconThemeDataPartial.from(
      size: 20.0,
      opticalSize: 20.0,
      color: color,
    );
    return result.maybeMerge(
      defaults._overrides.trailingIconTheme?.resolve(states),
    );
  }

  @override
  ListItemThemeData copyWith({
    covariant ListItemStateProperty<ShapeBorder>? containerShape,
    covariant ListItemStateProperty<Color>? containerColor,
    covariant ListItemStateProperty<Color>? stateLayerColor,
    covariant ListItemStateProperty<double>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial>? trailingIconTheme,
  }) => _ListItemThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    typescaleTheme: _typescaleTheme,
    overrides: _overrides.copyWith(
      containerShape: containerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerColor: containerColor,
      leadingIconTheme: leadingIconTheme,
      leadingTextStyle: leadingTextStyle,
      overlineTextStyle: overlineTextStyle,
      headlineTextStyle: headlineTextStyle,
      supportingTextStyle: supportingTextStyle,
      trailingTextStyle: trailingTextStyle,
      trailingIconTheme: trailingIconTheme,
    ),
  );

  @override
  ListItemThemeData maybeCopyWith({
    covariant ListItemStateProperty<ShapeBorder>? containerShape,
    covariant ListItemStateProperty<Color>? containerColor,
    covariant ListItemStateProperty<Color>? stateLayerColor,
    covariant ListItemStateProperty<double>? stateLayerOpacity,
    covariant ListItemStateProperty<IconThemeDataPartial>? leadingIconTheme,
    covariant ListItemStateProperty<TextStyle>? leadingTextStyle,
    covariant ListItemStateProperty<TextStyle>? overlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? headlineTextStyle,
    covariant ListItemStateProperty<TextStyle>? supportingTextStyle,
    covariant ListItemStateProperty<TextStyle>? trailingTextStyle,
    covariant ListItemStateProperty<IconThemeDataPartial>? trailingIconTheme,
  }) =>
      containerShape != null &&
          containerColor != null &&
          stateLayerColor != null &&
          stateLayerOpacity != null &&
          leadingIconTheme != null &&
          leadingTextStyle != null &&
          overlineTextStyle != null &&
          headlineTextStyle != null &&
          supportingTextStyle != null &&
          trailingTextStyle != null &&
          trailingIconTheme != null
      ? .from(
          containerShape: containerShape,
          containerColor: containerColor,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          leadingIconTheme: leadingIconTheme,
          leadingTextStyle: leadingTextStyle,
          overlineTextStyle: overlineTextStyle,
          headlineTextStyle: headlineTextStyle,
          supportingTextStyle: supportingTextStyle,
          trailingTextStyle: trailingTextStyle,
          trailingIconTheme: trailingIconTheme,
        )
      : containerShape != null ||
            containerColor != null ||
            stateLayerColor != null ||
            stateLayerOpacity != null ||
            leadingIconTheme != null ||
            leadingTextStyle != null ||
            overlineTextStyle != null ||
            headlineTextStyle != null ||
            supportingTextStyle != null ||
            trailingTextStyle != null ||
            trailingIconTheme != null
      ? copyWith(
          containerShape: containerShape,
          stateLayerColor: stateLayerColor,
          stateLayerOpacity: stateLayerOpacity,
          containerColor: containerColor,
          leadingIconTheme: leadingIconTheme,
          leadingTextStyle: leadingTextStyle,
          overlineTextStyle: overlineTextStyle,
          headlineTextStyle: headlineTextStyle,
          supportingTextStyle: supportingTextStyle,
          trailingTextStyle: trailingTextStyle,
          trailingIconTheme: trailingIconTheme,
        )
      : this;

  @override
  ListItemThemeData mergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) => _ListItemThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    stateTheme: _stateTheme,
    typescaleTheme: _typescaleTheme,
    overrides: _overrides.mergeWith(
      containerShape: containerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerColor: containerColor,
      leadingIconTheme: leadingIconTheme,
      leadingTextStyle: leadingTextStyle,
      overlineTextStyle: overlineTextStyle,
      headlineTextStyle: headlineTextStyle,
      supportingTextStyle: supportingTextStyle,
      trailingTextStyle: trailingTextStyle,
      trailingIconTheme: trailingIconTheme,
    ),
  );

  @override
  ListItemThemeData maybeMergeWith({
    ListItemStateProperty<ShapeBorder?>? containerShape,
    ListItemStateProperty<Color?>? containerColor,
    ListItemStateProperty<Color?>? stateLayerColor,
    ListItemStateProperty<double?>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial?>? leadingIconTheme,
    ListItemStateProperty<TextStyle?>? leadingTextStyle,
    ListItemStateProperty<TextStyle?>? overlineTextStyle,
    ListItemStateProperty<TextStyle?>? headlineTextStyle,
    ListItemStateProperty<TextStyle?>? supportingTextStyle,
    ListItemStateProperty<TextStyle?>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial?>? trailingIconTheme,
  }) {
    final overrides = _overrides.maybeMergeWith(
      containerShape: containerShape,
      stateLayerColor: stateLayerColor,
      stateLayerOpacity: stateLayerOpacity,
      containerColor: containerColor,
      leadingIconTheme: leadingIconTheme,
      leadingTextStyle: leadingTextStyle,
      overlineTextStyle: overlineTextStyle,
      headlineTextStyle: headlineTextStyle,
      supportingTextStyle: supportingTextStyle,
      trailingTextStyle: trailingTextStyle,
      trailingIconTheme: trailingIconTheme,
    );
    return identical(_overrides, overrides)
        ? this
        : _ListItemThemeDataDefaults(
            colorTheme: _colorTheme,
            shapeTheme: _shapeTheme,
            stateTheme: _stateTheme,
            typescaleTheme: _typescaleTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ListItemThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _typescaleTheme == other._typescaleTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(
    _colorTheme,
    _shapeTheme,
    _stateTheme,
    _typescaleTheme,
    _overrides,
  );
}

final class _ListItemStateProperty<T extends Object?>
    implements ListItemStateProperty<T> {
  const _ListItemStateProperty(this._defaults, this._resolve);

  final _ListItemThemeDataDefaults _defaults;
  final T Function(ListItemStates states, _ListItemThemeDataDefaults defaults)
  _resolve;

  @override
  T resolve(ListItemStates states) => _resolve(states, _defaults);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ListItemStateProperty<T> &&
          _defaults == other._defaults &&
          _resolve == other._resolve;

  @override
  int get hashCode => Object.hash(_defaults, _resolve);
}

abstract class ListItemTheme extends SingleChildStatelessWidget {
  const ListItemTheme._({super.key, required super.child});

  const factory ListItemTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<ListItemThemeDataPartial> resolver,
    Widget? child,
  }) = _ListItemThemeWithResolver<ListItemThemeDataPartial>;

  const factory ListItemTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<ListItemThemeDataPartial> callback,
    Widget? child,
  }) = _ListItemThemeWithCallback<ListItemThemeDataPartial>;

  const factory ListItemTheme.mergeWithData({
    Key? key,
    required ListItemThemeDataPartial data,
    Widget? child,
  }) = _ListItemThemeWithData<ListItemThemeDataPartial>;

  const factory ListItemTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<ListItemThemeData> resolver,
    Widget? child,
  }) = _ListItemThemeWithResolver<ListItemThemeData>;

  const factory ListItemTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<ListItemThemeData> callback,
    Widget? child,
  }) = _ListItemThemeWithCallback<ListItemThemeData>;

  const factory ListItemTheme.replaceWithData({
    Key? key,
    required ListItemThemeData data,
    Widget? child,
  }) = _ListItemThemeWithData<ListItemThemeData>;

  ThemeResolver<ListItemThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _ListItemTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static ListItemThemeData? maybeOf(BuildContext context) {
    final overrides = _ListItemTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static ListItemThemeData of(BuildContext context) =>
      .defaultsOf(context, overrides: _ListItemTheme.maybeOverridesOf(context));
}

class _ListItemThemeWithResolver<T extends ListItemThemeDataPartial>
    extends ListItemTheme {
  const _ListItemThemeWithResolver({
    super.key,
    required this.resolver,
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ListItemThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _ListItemThemeWithCallback<T extends ListItemThemeDataPartial>
    extends ListItemTheme {
  const _ListItemThemeWithCallback({
    super.key,
    required this.callback,
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ListItemThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _ListItemThemeWithData<T extends ListItemThemeDataPartial>
    extends ListItemTheme {
  const _ListItemThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ListItemThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _ListItemTheme
    extends
        InheritedThemeResolverWidget<
          ListItemThemeDataPartial,
          _ListItemTheme,
          _ListItemThemeElement
        >
    implements InheritedTheme {
  const _ListItemTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  ListItemThemeDataPartial merge(
    ListItemThemeDataPartial fallback,
    ListItemThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(ListItemThemeDataPartial data) => data is ListItemThemeData;

  @override
  _ListItemThemeElement createElement() => _ListItemThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ListItemTheme(resolver: resolver, child: child);

  static ThemeResolver<ListItemThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        ListItemThemeDataPartial,
        _ListItemTheme,
        _ListItemThemeElement
      >(context);

  static ListItemThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        ListItemThemeDataPartial,
        _ListItemTheme,
        _ListItemThemeElement
      >(context);
}

final class _ListItemThemeElement
    extends
        InheritedThemeResolverElement<
          ListItemThemeDataPartial,
          _ListItemTheme,
          _ListItemThemeElement
        > {
  _ListItemThemeElement(super.widget);
}
