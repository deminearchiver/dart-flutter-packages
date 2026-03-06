import 'package:material/src/material/flutter.dart';

abstract interface class FocusRingStates {
  FocusRingPlacement get placement;
  bool get isVisible;
  bool get isActive;
}

typedef FocusRingStateProperty<T extends Object?> =
    StateProperty<T, FocusRingStates>;

abstract class FocusRingThemeDataPartial {
  const FocusRingThemeDataPartial();

  const factory FocusRingThemeDataPartial.from({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) = _FocusRingThemeDataPartial;

  Duration? get duration;

  FocusRingStateProperty<double?>? get offset;

  FocusRingStateProperty<OutlinedBorder?>? get shape;

  FocusRingStateProperty<OutlinePartial?>? get outline;

  FocusRingThemeDataPartial copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double?>? offset,
    covariant FocusRingStateProperty<OutlinedBorder?>? shape,
    covariant FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: offset ?? this.offset,
          shape: shape ?? this.shape,
          outline: outline ?? this.outline,
        )
      : this;

  FocusRingThemeDataPartial mergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: offset?.orElseMaybe(this.offset?.resolve) ?? this.offset,
          shape: shape?.orElseMaybe(this.shape?.resolve) ?? this.shape,
          outline:
              outline
                  ?.orElseMaybe(this.outline?.resolve)
                  .mapValue(
                    (states, value) =>
                        this.outline?.resolve(states)?.merge(value) ?? value,
                  ) ??
              this.outline,
        )
      : this;

  FocusRingThemeDataPartial merge(FocusRingThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is FocusRingThemeDataPartial &&
          duration == other.duration &&
          offset == other.offset &&
          shape == other.shape &&
          outline == other.outline;

  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, offset, shape, outline);
}

class _FocusRingThemeDataPartial extends FocusRingThemeDataPartial {
  const _FocusRingThemeDataPartial({
    this.duration,
    this.offset,
    this.shape,
    this.outline,
  });

  @override
  final Duration? duration;

  @override
  final FocusRingStateProperty<double?>? offset;

  @override
  final FocusRingStateProperty<OutlinedBorder?>? shape;

  @override
  final FocusRingStateProperty<OutlinePartial?>? outline;
}

abstract class FocusRingThemeData extends FocusRingThemeDataPartial {
  const FocusRingThemeData();

  const factory FocusRingThemeData.from({
    required Duration duration,
    required FocusRingStateProperty<double> offset,
    required FocusRingStateProperty<OutlinedBorder> shape,
    required FocusRingStateProperty<Outline> outline,
  }) = _FocusRingThemeData;

  const factory FocusRingThemeData.fallback({
    required ColorThemeData colorTheme,
    required DurationThemeData durationTheme,
    required ShapeThemeData shapeTheme,
    required StateFocusIndicatorThemeData stateFocusIndicatorTheme,
  }) = _FocusRingThemeDataDefaults;

  @override
  Duration get duration;

  @override
  FocusRingStateProperty<double> get offset;

  @override
  FocusRingStateProperty<OutlinedBorder> get shape;

  @override
  FocusRingStateProperty<Outline> get outline;

  @override
  FocusRingThemeData copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double>? offset,
    covariant FocusRingStateProperty<OutlinedBorder>? shape,
    covariant FocusRingStateProperty<Outline>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: offset ?? this.offset,
          shape: shape ?? this.shape,
          outline: outline ?? this.outline,
        )
      : this;

  @override
  FocusRingThemeData mergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: offset?.orElse(this.offset.resolve) ?? this.offset,
          shape: shape?.orElse(this.shape.resolve) ?? this.shape,
          outline:
              outline
                  ?.orElse(this.outline.resolve)
                  .mapValue(
                    (states, value) =>
                        this.outline.resolve(states).merge(value),
                  ) ??
              this.outline,
        )
      : this;

  @override
  FocusRingThemeData merge(FocusRingThemeDataPartial? other) => other != null
      ? mergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is FocusRingThemeData &&
          duration == other.duration &&
          offset == other.offset &&
          shape == other.shape &&
          outline == other.outline;

  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, offset, shape, outline);
}

class _FocusRingThemeData extends FocusRingThemeData {
  const _FocusRingThemeData({
    required this.duration,
    required this.offset,
    required this.shape,
    required this.outline,
  });

  @override
  final Duration duration;

  @override
  final FocusRingStateProperty<double> offset;

  @override
  final FocusRingStateProperty<OutlinedBorder> shape;

  @override
  final FocusRingStateProperty<Outline> outline;
}

class _FocusRingThemeDataDefaults extends FocusRingThemeData {
  const _FocusRingThemeDataDefaults({
    required ColorThemeData colorTheme,
    required DurationThemeData durationTheme,
    required ShapeThemeData shapeTheme,
    required StateFocusIndicatorThemeData stateFocusIndicatorTheme,
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) : _colorTheme = colorTheme,
       _durationTheme = durationTheme,
       _shapeTheme = shapeTheme,
       _stateFocusIndicatorTheme = stateFocusIndicatorTheme,
       _duration = duration,
       _offset = offset,
       _shape = shape,
       _outline = outline;

  final ColorThemeData _colorTheme;
  final DurationThemeData _durationTheme;
  final ShapeThemeData _shapeTheme;
  final StateFocusIndicatorThemeData _stateFocusIndicatorTheme;

  final Duration? _duration;
  final FocusRingStateProperty<double?>? _offset;
  final FocusRingStateProperty<OutlinedBorder?>? _shape;
  final FocusRingStateProperty<OutlinePartial?>? _outline;

  @override
  Duration get duration => _durationTheme.long4;

  @override
  FocusRingStateProperty<double> get offset => .resolveWith(
    (states) =>
        _offset?.resolve(states) ??
        switch (states) {
          FocusRingStates(placement: .inward) =>
            _stateFocusIndicatorTheme.innerOffset,
          FocusRingStates(placement: .outward) =>
            _stateFocusIndicatorTheme.outerOffset,
        },
  );

  @override
  FocusRingStateProperty<OutlinedBorder> get shape => .resolveWith(
    (states) =>
        _shape?.resolve(states) ??
        CornersBorder.rounded(
          // TODO: change to something like md.sys.shape.corner.medium
          corners: .all(_shapeTheme.corner.full),
        ),
  );

  @override
  FocusRingStateProperty<Outline> get outline => .resolveWith(
    (states) => .from(
      alignment: switch (states) {
        FocusRingStates(placement: .inward) => Outline.alignmentInside,
        FocusRingStates(placement: .outward) => Outline.alignmentOutside,
      },
      width: switch (states) {
        // TODO: REPLACE WITH SPRINGS to avoid manual overshooting!!!!!!
        FocusRingStates(isVisible: false) => 0.0,
        FocusRingStates(isActive: true) => 8.0,
        FocusRingStates(isVisible: true) => _stateFocusIndicatorTheme.thickness,
      },
      color: _colorTheme.secondary,
    ).merge(_outline?.resolve(states)),
  );

  @override
  FocusRingThemeData copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double>? offset,
    covariant FocusRingStateProperty<OutlinedBorder>? shape,
    covariant FocusRingStateProperty<Outline>? outline,
  }) => duration != null && offset != null && shape != null && outline != null
      ? .from(
          duration: duration,
          offset: offset,
          shape: shape,
          outline: outline,
        )
      : _FocusRingThemeDataDefaults(
          colorTheme: _colorTheme,
          durationTheme: _durationTheme,
          shapeTheme: _shapeTheme,
          stateFocusIndicatorTheme: _stateFocusIndicatorTheme,
          duration: duration ?? _duration,
          offset: offset ?? _offset,
          shape: shape ?? _shape,
          outline: outline ?? _outline,
        );

  @override
  FocusRingThemeData mergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => _FocusRingThemeDataDefaults(
    colorTheme: _colorTheme,
    durationTheme: _durationTheme,
    shapeTheme: _shapeTheme,
    stateFocusIndicatorTheme: _stateFocusIndicatorTheme,
    duration: duration ?? _duration,
    offset: offset?.orElseMaybe(_offset?.resolve) ?? _offset,
    shape: shape?.orElseMaybe(_shape?.resolve) ?? _shape,
    outline:
        outline
            ?.orElseMaybe(_outline?.resolve)
            .mapValue(
              (states, value) =>
                  _outline?.resolve(states)?.merge(value) ?? value,
            ) ??
        _outline,
  );

  @override
  FocusRingThemeData merge(FocusRingThemeDataPartial? other) => other != null
      ? mergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _FocusRingThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _durationTheme == other._durationTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateFocusIndicatorTheme == other._stateFocusIndicatorTheme &&
          _duration == other._duration &&
          _offset == other._offset &&
          _shape == other._shape &&
          _outline == other._outline;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorTheme,
    _durationTheme,
    _shapeTheme,
    _stateFocusIndicatorTheme,
    _duration,
    _offset,
    _shape,
    _outline,
  );
}

class FocusRingTheme extends InheritedTheme {
  const FocusRingTheme({super.key, required this.data, required super.child});

  final FocusRingThemeData data;

  @override
  bool updateShouldNotify(FocusRingTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      FocusRingTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<FocusRingThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required FocusRingThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        FocusRingTheme(key: key, data: of(context).merge(data), child: child),
  );

  static FocusRingThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FocusRingTheme>()?.data;

  static FocusRingThemeData of(BuildContext context) =>
      maybeOf(context) ??
      .fallback(
        colorTheme: ColorTheme.of(context),
        durationTheme: DurationTheme.of(context),
        shapeTheme: ShapeTheme.of(context),
        stateFocusIndicatorTheme: StateFocusIndicatorTheme.of(context),
      );
}
