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

  FocusRingThemeDataPartial copy() => copyWith();

  FocusRingThemeDataPartial copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double?>? offset,
    covariant FocusRingStateProperty<OutlinedBorder?>? shape,
    covariant FocusRingStateProperty<OutlinePartial?>? outline,
  }) => .from(
    duration: duration ?? this.duration,
    offset: offset ?? this.offset,
    shape: shape ?? this.shape,
    outline: outline ?? this.outline,
  );

  FocusRingThemeDataPartial maybeCopyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double?>? offset,
    covariant FocusRingStateProperty<OutlinedBorder?>? shape,
    covariant FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? copyWith(
          duration: duration,
          offset: offset,
          shape: shape,
          outline: outline,
        )
      : this;

  FocusRingThemeDataPartial mergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => .from(
    duration: duration ?? this.duration,
    offset: this.offset.maybeMergeNullable(offset),
    shape: this.shape.maybeMergeNullable(shape),
    outline: this.outline.maybeCombineNullable(outline, OutlinePartial.combine),
  );

  FocusRingThemeDataPartial maybeMergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: this.offset.maybeMergeNullable(offset),
          shape: this.shape.maybeMergeNullable(shape),
          outline: this.outline.maybeCombineNullable(
            outline,
            OutlinePartial.maybeCombine,
          ),
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
      : copy();

  FocusRingThemeDataPartial maybeMerge(FocusRingThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;
}

final class _FocusRingThemeDataPartial extends FocusRingThemeDataPartial {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FocusRingThemeDataPartial &&
          duration == other.duration &&
          offset == other.offset &&
          shape == other.shape &&
          outline == other.outline;

  @override
  int get hashCode => Object.hash(duration, offset, shape, outline);
}

abstract class FocusRingThemeData extends FocusRingThemeDataPartial {
  const FocusRingThemeData();

  const factory FocusRingThemeData.from({
    required Duration duration,
    required FocusRingStateProperty<double> offset,
    required FocusRingStateProperty<OutlinedBorder> shape,
    required FocusRingStateProperty<Outline> outline,
  }) = _FocusRingThemeData;

  const factory FocusRingThemeData.defaults({
    required ColorThemeData colorTheme,
    required DurationThemeData durationTheme,
    required ShapeThemeData shapeTheme,
    required StateFocusIndicatorThemeData stateFocusIndicatorTheme,
    FocusRingThemeDataPartial? overrides,
  }) = _FocusRingThemeDataDefaults;

  factory FocusRingThemeData.defaultsOf(
    BuildContext context, {
    FocusRingThemeDataPartial? overrides,
  }) => .defaults(
    colorTheme: ColorTheme.of(context),
    durationTheme: DurationTheme.of(context),
    shapeTheme: ShapeTheme.of(context),
    stateFocusIndicatorTheme: StateFocusIndicatorTheme.of(context),
    overrides: overrides,
  );

  @override
  Duration get duration;

  @override
  FocusRingStateProperty<double> get offset;

  @override
  FocusRingStateProperty<OutlinedBorder> get shape;

  @override
  FocusRingStateProperty<Outline> get outline;

  @override
  FocusRingThemeData copy() => copyWith();

  @override
  FocusRingThemeData copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double>? offset,
    covariant FocusRingStateProperty<OutlinedBorder>? shape,
    covariant FocusRingStateProperty<Outline>? outline,
  }) => .from(
    duration: duration ?? this.duration,
    offset: offset ?? this.offset,
    shape: shape ?? this.shape,
    outline: outline ?? this.outline,
  );

  @override
  FocusRingThemeData maybeCopyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double>? offset,
    covariant FocusRingStateProperty<OutlinedBorder>? shape,
    covariant FocusRingStateProperty<Outline>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? copyWith(
          duration: duration,
          offset: offset,
          shape: shape,
          outline: outline,
        )
      : this;

  @override
  FocusRingThemeData mergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => .from(
    duration: duration ?? this.duration,
    offset: this.offset.maybeMerge(offset),
    shape: this.shape.maybeMerge(shape),
    outline: this.outline.maybeCombine(outline, Outline.combine),
  );

  @override
  FocusRingThemeData maybeMergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) => duration != null || offset != null || shape != null || outline != null
      ? .from(
          duration: duration ?? this.duration,
          offset: this.offset.maybeMerge(offset),
          shape: this.shape.maybeMerge(shape),
          outline: this.outline.maybeCombine(outline, Outline.maybeCombine),
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
      : copy();

  @override
  FocusRingThemeData maybeMerge(FocusRingThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;
}

final class _FocusRingThemeData extends FocusRingThemeData {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FocusRingThemeData &&
          duration == other.duration &&
          offset == other.offset &&
          shape == other.shape &&
          outline == other.outline;

  @override
  int get hashCode => Object.hash(duration, offset, shape, outline);
}

final class _FocusRingThemeDataDefaults extends FocusRingThemeData {
  const _FocusRingThemeDataDefaults({
    required ColorThemeData colorTheme,
    required DurationThemeData durationTheme,
    required ShapeThemeData shapeTheme,
    required StateFocusIndicatorThemeData stateFocusIndicatorTheme,
    FocusRingThemeDataPartial? overrides,
  }) : _colorTheme = colorTheme,
       _durationTheme = durationTheme,
       _shapeTheme = shapeTheme,
       _stateFocusIndicatorTheme = stateFocusIndicatorTheme,
       _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final DurationThemeData _durationTheme;
  final ShapeThemeData _shapeTheme;
  final StateFocusIndicatorThemeData _stateFocusIndicatorTheme;
  final FocusRingThemeDataPartial _overrides;

  @override
  Duration get duration => _durationTheme.long4;

  @override
  FocusRingStateProperty<double> get offset => .resolveWith(
    (states) =>
        _overrides.offset?.resolve(states) ??
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
        _overrides.shape?.resolve(states) ??
        _shapeTheme.applyCorner(
          // TODO: change to something like md.sys.shape.corner.medium
          corner: _shapeTheme.cornerFull,
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
    ).maybeMerge(_overrides.outline?.resolve(states)),
  );

  @override
  FocusRingThemeData copyWith({
    covariant Duration? duration,
    covariant FocusRingStateProperty<double>? offset,
    covariant FocusRingStateProperty<OutlinedBorder>? shape,
    covariant FocusRingStateProperty<Outline>? outline,
  }) => _FocusRingThemeDataDefaults(
    colorTheme: _colorTheme,
    durationTheme: _durationTheme,
    shapeTheme: _shapeTheme,
    stateFocusIndicatorTheme: _stateFocusIndicatorTheme,
    overrides: _overrides.copyWith(
      duration: duration,
      offset: offset,
      shape: shape,
      outline: outline,
    ),
  );

  @override
  FocusRingThemeData maybeCopyWith({
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
      : duration != null || offset != null || shape != null || outline != null
      ? copyWith(
          duration: duration,
          offset: offset,
          shape: shape,
          outline: outline,
        )
      : this;

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
    overrides: _overrides.mergeWith(
      duration: duration,
      offset: offset,
      shape: shape,
      outline: outline,
    ),
  );

  @override
  FocusRingThemeData maybeMergeWith({
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
  }) {
    final overrides = _overrides.maybeMergeWith(
      duration: duration,
      offset: offset,
      shape: shape,
      outline: outline,
    );
    return identical(_overrides, overrides)
        ? this
        : _FocusRingThemeDataDefaults(
            colorTheme: _colorTheme,
            durationTheme: _durationTheme,
            shapeTheme: _shapeTheme,
            stateFocusIndicatorTheme: _stateFocusIndicatorTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FocusRingThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _durationTheme == other._durationTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateFocusIndicatorTheme == other._stateFocusIndicatorTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(
    _colorTheme,
    _durationTheme,
    _shapeTheme,
    _stateFocusIndicatorTheme,
    _overrides,
  );
}

abstract class FocusRingTheme extends StatelessWidget implements ProxyWidget {
  const FocusRingTheme._({super.key, required this.child});

  const factory FocusRingTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<FocusRingThemeDataPartial> resolver,
    required Widget child,
  }) = _FocusRingThemeWithResolver<FocusRingThemeDataPartial>;

  const factory FocusRingTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<FocusRingThemeDataPartial> callback,
    required Widget child,
  }) = _FocusRingThemeWithCallback<FocusRingThemeDataPartial>;

  const factory FocusRingTheme.mergeWithData({
    Key? key,
    required FocusRingThemeDataPartial data,
    required Widget child,
  }) = _FocusRingThemeWithData<FocusRingThemeDataPartial>;

  const factory FocusRingTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<FocusRingThemeData> resolver,
    required Widget child,
  }) = _FocusRingThemeWithResolver<FocusRingThemeData>;

  const factory FocusRingTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<FocusRingThemeData> callback,
    required Widget child,
  }) = _FocusRingThemeWithCallback<FocusRingThemeData>;

  const factory FocusRingTheme.replaceWithData({
    Key? key,
    required FocusRingThemeData data,
    required Widget child,
  }) = _FocusRingThemeWithData<FocusRingThemeData>;

  ThemeResolver<FocusRingThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _FocusRingTheme(resolver: resolver, child: child);

  static FocusRingThemeData? maybeOf(BuildContext context) {
    final overrides = _FocusRingTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static FocusRingThemeData of(BuildContext context) => .defaultsOf(
    context,
    overrides: _FocusRingTheme.maybeOverridesOf(context),
  );
}

class _FocusRingThemeWithResolver<T extends FocusRingThemeDataPartial>
    extends FocusRingTheme {
  const _FocusRingThemeWithResolver({
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

class _FocusRingThemeWithCallback<T extends FocusRingThemeDataPartial>
    extends FocusRingTheme {
  const _FocusRingThemeWithCallback({
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

class _FocusRingThemeWithData<T extends FocusRingThemeDataPartial>
    extends FocusRingTheme {
  const _FocusRingThemeWithData({
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

final class _FocusRingTheme
    extends
        InheritedThemeResolverWidget<
          FocusRingThemeDataPartial,
          _FocusRingTheme,
          _FocusRingThemeElement
        >
    implements InheritedTheme {
  const _FocusRingTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  FocusRingThemeDataPartial merge(
    FocusRingThemeDataPartial fallback,
    FocusRingThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _FocusRingThemeElement createElement() => _FocusRingThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _FocusRingTheme(resolver: resolver, child: child);

  static ThemeResolver<FocusRingThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        FocusRingThemeDataPartial,
        _FocusRingTheme,
        _FocusRingThemeElement
      >(context);

  static FocusRingThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        FocusRingThemeDataPartial,
        _FocusRingTheme,
        _FocusRingThemeElement
      >(context);
}

final class _FocusRingThemeElement
    extends
        InheritedThemeResolverElement<
          FocusRingThemeDataPartial,
          _FocusRingTheme,
          _FocusRingThemeElement
        > {
  _FocusRingThemeElement(super.widget);
}
