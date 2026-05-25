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

abstract class ListItemThemeDataPartial with Diagnosticable {
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
      ? .from(
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
        )
      : this;

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
          containerShape:
              containerShape?.orElseMaybe(this.containerShape?.resolve) ??
              this.containerShape,
          containerColor:
              containerColor?.orElseMaybe(this.containerColor?.resolve) ??
              this.containerColor,
          stateLayerColor:
              stateLayerColor?.orElseMaybe(this.stateLayerColor?.resolve) ??
              this.stateLayerColor,
          stateLayerOpacity:
              stateLayerOpacity?.orElseMaybe(this.stateLayerOpacity?.resolve) ??
              this.stateLayerOpacity,
          leadingIconTheme:
              leadingIconTheme
                  ?.orElseMaybe(this.leadingIconTheme?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.leadingIconTheme
                            ?.resolve(states)
                            ?.maybeMerge(value) ??
                        value,
                  ) ??
              this.leadingIconTheme,
          leadingTextStyle:
              leadingTextStyle
                  ?.orElseMaybe(this.leadingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.leadingTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.leadingTextStyle,
          overlineTextStyle:
              overlineTextStyle
                  ?.orElseMaybe(this.overlineTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.overlineTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.overlineTextStyle,
          headlineTextStyle:
              headlineTextStyle
                  ?.orElseMaybe(this.headlineTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.headlineTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.headlineTextStyle,
          supportingTextStyle:
              supportingTextStyle
                  ?.orElseMaybe(this.supportingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.supportingTextStyle
                            ?.resolve(states)
                            ?.merge(value) ??
                        value,
                  ) ??
              this.supportingTextStyle,
          trailingTextStyle:
              trailingTextStyle
                  ?.orElseMaybe(this.trailingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.trailingTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              this.trailingTextStyle,
          trailingIconTheme:
              trailingIconTheme
                  ?.orElseMaybe(this.trailingIconTheme?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.trailingIconTheme
                            ?.resolve(states)
                            ?.maybeMerge(value) ??
                        value,
                  ) ??
              this.trailingIconTheme,
        )
      : this;

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

abstract class ListItemThemeData extends ListItemThemeDataPartial {
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
  }) = _ListItemThemeDataDefaults;

  const factory ListItemThemeData._defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    required TypescaleThemeData typescaleTheme,
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
  }) = _ListItemThemeDataDefaults;

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
      ? .from(
          containerShape: containerShape ?? this.containerShape,
          containerColor: containerColor ?? this.containerColor,
          stateLayerColor: stateLayerColor ?? this.stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
          leadingIconTheme: leadingIconTheme ?? this.leadingIconTheme,
          leadingTextStyle: leadingTextStyle ?? this.leadingTextStyle,
          overlineTextStyle: overlineTextStyle ?? this.overlineTextStyle,
          headlineTextStyle: headlineTextStyle ?? this.headlineTextStyle,
          supportingTextStyle: supportingTextStyle ?? this.supportingTextStyle,
          trailingTextStyle: trailingTextStyle ?? this.trailingTextStyle,
          trailingIconTheme: trailingIconTheme ?? this.trailingIconTheme,
        )
      : this;

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
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          leadingIconTheme != null ||
          leadingTextStyle != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? .from(
          containerShape:
              containerShape?.orElse(this.containerShape.resolve) ??
              this.containerShape,
          containerColor:
              containerColor?.orElse(this.containerColor.resolve) ??
              this.containerColor,
          stateLayerColor:
              stateLayerColor?.orElse(this.stateLayerColor.resolve) ??
              this.stateLayerColor,
          stateLayerOpacity:
              stateLayerOpacity?.orElse(this.stateLayerOpacity.resolve) ??
              this.stateLayerOpacity,
          leadingIconTheme:
              leadingIconTheme
                  ?.orElse(this.leadingIconTheme.resolve)
                  .mapValue(
                    (states, value) =>
                        this.leadingIconTheme.resolve(states).maybeMerge(value),
                  ) ??
              this.leadingIconTheme,
          leadingTextStyle:
              leadingTextStyle
                  ?.orElse(this.leadingTextStyle.resolve)
                  .mapValue(
                    (states, value) =>
                        this.leadingTextStyle.resolve(states).merge(value),
                  ) ??
              this.leadingTextStyle,
          overlineTextStyle:
              overlineTextStyle
                  ?.orElse(this.overlineTextStyle.resolve)
                  .mapValue(
                    (states, value) =>
                        this.overlineTextStyle.resolve(states).merge(value),
                  ) ??
              this.overlineTextStyle,
          headlineTextStyle:
              headlineTextStyle
                  ?.orElse(this.headlineTextStyle.resolve)
                  .mapValue(
                    (states, value) =>
                        this.headlineTextStyle.resolve(states).merge(value),
                  ) ??
              this.headlineTextStyle,
          supportingTextStyle:
              supportingTextStyle
                  ?.orElse(this.supportingTextStyle.resolve)
                  .mapValue(
                    (states, value) =>
                        this.supportingTextStyle.resolve(states).merge(value),
                  ) ??
              this.supportingTextStyle,
          trailingTextStyle:
              trailingTextStyle
                  ?.orElse(this.trailingTextStyle.resolve)
                  .mapValue(
                    (states, value) =>
                        this.trailingTextStyle.resolve(states).merge(value),
                  ) ??
              this.trailingTextStyle,
          trailingIconTheme:
              trailingIconTheme
                  ?.orElse(this.trailingIconTheme.resolve)
                  .mapValue(
                    (states, value) => this.trailingIconTheme
                        .resolve(states)
                        .maybeMerge(value),
                  ) ??
              this.trailingIconTheme,
        )
      : this;

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
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    required TypescaleThemeData typescaleTheme,
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
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _typescaleTheme = typescaleTheme,
       _containerShape = containerShape,
       _containerColor = containerColor,
       _stateLayerColor = stateLayerColor,
       _stateLayerOpacity = stateLayerOpacity,
       _leadingIconTheme = leadingIconTheme,
       _leadingTextStyle = leadingTextStyle,
       _overlineTextStyle = overlineTextStyle,
       _headlineTextStyle = headlineTextStyle,
       _supportingTextStyle = supportingTextStyle,
       _trailingTextStyle = trailingTextStyle,
       _trailingIconTheme = trailingIconTheme;

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;
  final TypescaleThemeData _typescaleTheme;

  final ListItemStateProperty<ShapeBorder?>? _containerShape;
  final ListItemStateProperty<Color?>? _containerColor;
  final ListItemStateProperty<Color?>? _stateLayerColor;
  final ListItemStateProperty<double?>? _stateLayerOpacity;
  final ListItemStateProperty<IconThemeDataPartial?>? _leadingIconTheme;
  final ListItemStateProperty<TextStyle?>? _leadingTextStyle;
  final ListItemStateProperty<TextStyle?>? _overlineTextStyle;
  final ListItemStateProperty<TextStyle?>? _headlineTextStyle;
  final ListItemStateProperty<TextStyle?>? _supportingTextStyle;
  final ListItemStateProperty<TextStyle?>? _trailingTextStyle;
  final ListItemStateProperty<IconThemeDataPartial?>? _trailingIconTheme;

  @override
  ListItemStateProperty<ShapeBorder> get containerShape =>
      .resolveWith((states) {
        final resolved = _containerShape?.resolve(states);
        if (resolved != null) return resolved;
        final outerCorner = _shapeTheme.cornerLarge;
        final innerCorner = _shapeTheme.cornerExtraSmall;
        final CornersGeometry corners = switch (states) {
          SegmentedListItemStates(isFirst: true, isLast: true) ||
          SelectableListItemStates(isSelected: true) => .all(outerCorner),
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
        return _shapeTheme.applyCorners(corners: corners);
      });

  @override
  ListItemStateProperty<Color> get containerColor => .resolveWith(
    (states) =>
        _containerColor?.resolve(states) ??
        switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.10),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.tertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.secondaryContainer,
          _ => _colorTheme.surface,
        },
  );

  @override
  ListItemStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _stateLayerColor?.resolve(states) ??
        switch (states) {
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurface,
        },
  );

  @override
  ListItemStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _stateLayerOpacity?.resolve(states) ??
        switch (states) {
          InteractiveListItemDisabledStates() => 0.0,
          DraggableListItemStates(isDragged: true) =>
            _stateTheme.draggedStateLayerOpacity,
          InteractiveListItemEnabledStates(isPressed: true) =>
            _stateTheme.pressedStateLayerOpacity,
          InteractiveListItemEnabledStates(isHovered: true) =>
            _stateTheme.hoverStateLayerOpacity,
          InteractiveListItemEnabledStates(isFocused: true) => 0.0,
          _ => 0.0,
        },
  );

  @override
  ListItemStateProperty<IconThemeDataPartial> get leadingIconTheme =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = IconThemeDataPartial.from(
          size: 24.0,
          opticalSize: 24.0,
          color: color,
        );
        return result.maybeMerge(_leadingIconTheme?.resolve(states));
      });

  @override
  ListItemStateProperty<TextStyle> get leadingTextStyle =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = _typescaleTheme.labelLarge.toTextStyle(color: color);
        return result.merge(_leadingTextStyle?.resolve(states));
      });

  @override
  ListItemStateProperty<TextStyle> get overlineTextStyle =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = _typescaleTheme.labelMedium.toTextStyle(color: color);
        return result.merge(_overlineTextStyle?.resolve(states));
      });

  @override
  ListItemStateProperty<TextStyle> get headlineTextStyle =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurface,
        };
        final result = _typescaleTheme.bodyLarge.toTextStyle(color: color);
        return result.merge(_headlineTextStyle?.resolve(states));
      });

  @override
  ListItemStateProperty<TextStyle> get supportingTextStyle =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = _typescaleTheme.bodyMedium.toTextStyle(color: color);
        return result.merge(_supportingTextStyle?.resolve(states));
      });

  @override
  ListItemStateProperty<TextStyle> get trailingTextStyle =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = _typescaleTheme.labelLarge.toTextStyle(color: color);
        return result.merge(_trailingTextStyle?.resolve(states));
      });

  @override
  ListItemStateProperty<IconThemeDataPartial> get trailingIconTheme =>
      .resolveWith((states) {
        final color = switch (states) {
          InteractiveListItemDisabledStates() =>
            _colorTheme.onSurface.withValues(alpha: 0.38),
          DraggableListItemStates(isDragged: true) =>
            _colorTheme.onTertiaryContainer,
          SelectableListItemStates(isSelected: true) =>
            _colorTheme.onSecondaryContainer,
          _ => _colorTheme.onSurfaceVariant,
        };
        final result = IconThemeDataPartial.from(
          size: 24.0,
          opticalSize: 24.0,
          color: color,
        );
        return result.maybeMerge(_trailingIconTheme?.resolve(states));
      });
  @override
  ListItemThemeData maybeCopyWith({
    ListItemStateProperty<ShapeBorder>? containerShape,
    ListItemStateProperty<Color>? containerColor,
    ListItemStateProperty<Color>? stateLayerColor,
    ListItemStateProperty<double>? stateLayerOpacity,
    ListItemStateProperty<IconThemeDataPartial>? leadingIconTheme,
    ListItemStateProperty<TextStyle>? leadingTextStyle,
    ListItemStateProperty<TextStyle>? overlineTextStyle,
    ListItemStateProperty<TextStyle>? headlineTextStyle,
    ListItemStateProperty<TextStyle>? supportingTextStyle,
    ListItemStateProperty<TextStyle>? trailingTextStyle,
    ListItemStateProperty<IconThemeDataPartial>? trailingIconTheme,
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
      : _ListItemThemeDataDefaults(
          colorTheme: _colorTheme,
          shapeTheme: _shapeTheme,
          stateTheme: _stateTheme,
          typescaleTheme: _typescaleTheme,
          containerShape: containerShape ?? _containerShape,
          containerColor: containerColor ?? _containerColor,
          stateLayerColor: stateLayerColor ?? _stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
          leadingIconTheme: leadingIconTheme ?? _leadingIconTheme,
          leadingTextStyle: leadingTextStyle ?? _leadingTextStyle,
          overlineTextStyle: overlineTextStyle ?? _overlineTextStyle,
          headlineTextStyle: headlineTextStyle ?? _headlineTextStyle,
          supportingTextStyle: supportingTextStyle ?? _supportingTextStyle,
          trailingTextStyle: trailingTextStyle ?? _trailingTextStyle,
          trailingIconTheme: trailingIconTheme ?? _trailingIconTheme,
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
          stateLayerColor != null ||
          stateLayerOpacity != null ||
          leadingIconTheme != null ||
          leadingTextStyle != null ||
          overlineTextStyle != null ||
          headlineTextStyle != null ||
          supportingTextStyle != null ||
          trailingTextStyle != null ||
          trailingIconTheme != null
      ? _ListItemThemeDataDefaults(
          colorTheme: _colorTheme,
          shapeTheme: _shapeTheme,
          stateTheme: _stateTheme,
          typescaleTheme: _typescaleTheme,
          containerShape:
              containerShape?.orElseMaybe(_containerShape?.resolve) ??
              _containerShape,
          containerColor:
              containerColor?.orElseMaybe(_containerColor?.resolve) ??
              _containerColor,
          stateLayerColor:
              stateLayerColor?.orElseMaybe(_stateLayerColor?.resolve) ??
              _stateLayerColor,
          stateLayerOpacity:
              stateLayerOpacity?.orElseMaybe(_stateLayerOpacity?.resolve) ??
              _stateLayerOpacity,
          leadingIconTheme:
              leadingIconTheme
                  ?.orElseMaybe(_leadingIconTheme?.resolve)
                  .mapValue(
                    (states, value) =>
                        _leadingIconTheme?.resolve(states)?.maybeMerge(value) ??
                        value,
                  ) ??
              _leadingIconTheme,
          leadingTextStyle:
              leadingTextStyle
                  ?.orElseMaybe(_leadingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        _leadingTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              _leadingTextStyle,
          overlineTextStyle:
              overlineTextStyle
                  ?.orElseMaybe(_overlineTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        _overlineTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              _overlineTextStyle,
          headlineTextStyle:
              headlineTextStyle
                  ?.orElseMaybe(_headlineTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        _headlineTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              _headlineTextStyle,
          supportingTextStyle:
              supportingTextStyle
                  ?.orElseMaybe(_supportingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        _supportingTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              _supportingTextStyle,
          trailingTextStyle:
              trailingTextStyle
                  ?.orElseMaybe(_trailingTextStyle?.resolve)
                  .mapValue(
                    (states, value) =>
                        _trailingTextStyle?.resolve(states)?.merge(value) ??
                        value,
                  ) ??
              _trailingTextStyle,
          trailingIconTheme:
              trailingIconTheme
                  ?.orElseMaybe(_trailingIconTheme?.resolve)
                  .mapValue(
                    (states, value) =>
                        _trailingIconTheme
                            ?.resolve(states)
                            ?.maybeMerge(value) ??
                        value,
                  ) ??
              _trailingIconTheme,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ListItemThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _typescaleTheme == other._typescaleTheme &&
          _containerShape == other._containerShape &&
          _containerColor == other._containerColor &&
          _stateLayerColor == other._stateLayerColor &&
          _stateLayerOpacity == other._stateLayerOpacity &&
          _leadingIconTheme == other._leadingIconTheme &&
          _leadingTextStyle == other._leadingTextStyle &&
          _overlineTextStyle == other._overlineTextStyle &&
          _headlineTextStyle == other._headlineTextStyle &&
          _supportingTextStyle == other._supportingTextStyle &&
          _trailingTextStyle == other._trailingTextStyle &&
          _trailingIconTheme == other._trailingIconTheme;

  @override
  int get hashCode => Object.hash(
    _colorTheme,
    _shapeTheme,
    _stateTheme,
    _typescaleTheme,
    _containerShape,
    _containerColor,
    _stateLayerColor,
    _stateLayerOpacity,
    _leadingIconTheme,
    _leadingTextStyle,
    _overlineTextStyle,
    _headlineTextStyle,
    _supportingTextStyle,
    _trailingTextStyle,
    _trailingIconTheme,
  );
}

typedef ListItemThemeResolver = ThemeResolver<ListItemThemeDataPartial>;

typedef ListItemThemeResolverCallback =
    ThemeResolverCallback<ListItemThemeDataPartial>;

class _ListItemThemeResolver
    extends CombiningThemeResolver<ListItemThemeDataPartial> {
  const _ListItemThemeResolver(super.a, super.b);

  @override
  ListItemThemeDataPartial combine(
    ListItemThemeDataPartial a,
    ListItemThemeDataPartial b,
  ) => a.maybeMerge(b);
}

abstract class ListItemTheme extends StatelessWidget implements ProxyWidget {
  const ListItemTheme._({super.key, required this.child});

  const factory ListItemTheme.withResolver({
    Key? key,
    required ListItemThemeResolver resolver,
    required Widget child,
  }) = _ListItemThemeWithResolver;

  const factory ListItemTheme.withCallback({
    Key? key,
    required ListItemThemeResolverCallback callback,
    required Widget child,
  }) = _ListItemThemeWithCallback;

  const factory ListItemTheme.withData({
    Key? key,
    required ListItemThemeDataPartial data,
    required Widget child,
  }) = _ListItemThemeWithData;

  ListItemThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _ListItemTheme.maybeResolverOf(context);
    return _ListItemTheme(
      resolver: inherited != null
          ? _ListItemThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static ListItemThemeData of(BuildContext context) {
    final resolver = _ListItemTheme.maybeResolverOf(context);
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        colorTheme: colorTheme,
        shapeTheme: shapeTheme,
        stateTheme: stateTheme,
        typescaleTheme: typescaleTheme,
        containerShape: data.containerShape,
        containerColor: data.containerColor,
        stateLayerColor: data.stateLayerColor,
        stateLayerOpacity: data.stateLayerOpacity,
        leadingIconTheme: data.leadingIconTheme,
        leadingTextStyle: data.leadingTextStyle,
        overlineTextStyle: data.overlineTextStyle,
        headlineTextStyle: data.headlineTextStyle,
        supportingTextStyle: data.supportingTextStyle,
        trailingTextStyle: data.trailingTextStyle,
        trailingIconTheme: data.trailingIconTheme,
      );
    }
    return .defaults(
      colorTheme: colorTheme,
      shapeTheme: shapeTheme,
      stateTheme: stateTheme,
      typescaleTheme: typescaleTheme,
    );
  }
}

class _ListItemThemeWithResolver extends ListItemTheme {
  const _ListItemThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ListItemThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ListItemThemeResolver>("resolver", resolver),
    );
  }
}

class _ListItemThemeWithCallback extends ListItemTheme {
  const _ListItemThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ListItemThemeResolverCallback callback;

  @override
  ListItemThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ListItemThemeResolverCallback>("callback", callback),
    );
  }
}

class _ListItemThemeWithData extends ListItemTheme {
  const _ListItemThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final ListItemThemeDataPartial data;

  @override
  ListItemThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ListItemThemeDataPartial>("data", data));
  }
}

class _ListItemTheme extends InheritedTheme {
  const _ListItemTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final ListItemThemeResolver resolver;

  @override
  bool updateShouldNotify(_ListItemTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ListItemTheme(resolver: resolver, child: child);

  static ListItemThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ListItemTheme>()?.resolver;
}
