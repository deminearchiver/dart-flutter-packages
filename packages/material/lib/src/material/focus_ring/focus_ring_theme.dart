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

  FocusRingThemeDataPartial maybeCopyWith({
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

  FocusRingThemeDataPartial maybeMergeWith({
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
  }) = _FocusRingThemeDataDefaults;

  const factory FocusRingThemeData._defaults({
    required ColorThemeData colorTheme,
    required DurationThemeData durationTheme,
    required ShapeThemeData shapeTheme,
    required StateFocusIndicatorThemeData stateFocusIndicatorTheme,
    Duration? duration,
    FocusRingStateProperty<double?>? offset,
    FocusRingStateProperty<OutlinedBorder?>? shape,
    FocusRingStateProperty<OutlinePartial?>? outline,
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
  FocusRingThemeData maybeCopyWith({
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
  FocusRingThemeData maybeMergeWith({
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
    ).merge(_outline?.resolve(states)),
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
  FocusRingThemeData maybeMergeWith({
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
  FocusRingThemeData maybeMerge(FocusRingThemeDataPartial? other) =>
      other != null
      ? maybeMergeWith(
          duration: other.duration,
          offset: other.offset,
          shape: other.shape,
          outline: other.outline,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
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

typedef FocusRingThemeResolver = ThemeResolver<FocusRingThemeDataPartial>;

typedef FocusRingThemeResolverCallback =
    ThemeResolverCallback<FocusRingThemeDataPartial>;

abstract class FocusRingTheme extends StatelessWidget implements ProxyWidget {
  const FocusRingTheme._({super.key, required this.child});

  const factory FocusRingTheme.resolver({
    Key? key,
    required FocusRingThemeResolver resolver,
    required Widget child,
  }) = _FocusRingThemeWithResolver;

  const factory FocusRingTheme.callback({
    Key? key,
    required FocusRingThemeResolverCallback callback,
    required Widget child,
  }) = _FocusRingThemeWithCallback;

  const factory FocusRingTheme.partial({
    Key? key,
    required FocusRingThemeDataPartial data,
    required Widget child,
  }) = _FocusRingThemeWithData<FocusRingThemeDataPartial>;

  const factory FocusRingTheme.concrete({
    Key? key,
    required FocusRingThemeData data,
    required Widget child,
  }) = _FocusRingThemeWithData<FocusRingThemeData>;

  FocusRingThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _FocusRingTheme.maybeResolverOf(context);
    return _FocusRingTheme(
      resolver: inherited != null
          ? .combine(inherited, resolver, _combine)
          : resolver,
      child: child,
    );
  }

  static FocusRingThemeDataPartial _combine(
    FocusRingThemeDataPartial a,
    FocusRingThemeDataPartial b,
  ) => a.maybeMerge(b);

  static FocusRingThemeData of(BuildContext context) {
    final resolver = _FocusRingTheme.maybeResolverOf(context);
    final colorTheme = ColorTheme.of(context);
    final durationTheme = DurationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateFocusIndicatorTheme = StateFocusIndicatorTheme.of(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        colorTheme: colorTheme,
        durationTheme: durationTheme,
        shapeTheme: shapeTheme,
        stateFocusIndicatorTheme: stateFocusIndicatorTheme,
        duration: data.duration,
        offset: data.offset,
        shape: data.shape,
        outline: data.outline,
      );
    }
    return .defaults(
      colorTheme: colorTheme,
      durationTheme: durationTheme,
      shapeTheme: shapeTheme,
      stateFocusIndicatorTheme: stateFocusIndicatorTheme,
    );
  }
}

class _FocusRingThemeWithResolver extends FocusRingTheme {
  const _FocusRingThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final FocusRingThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FocusRingThemeResolver>("resolver", resolver),
    );
  }
}

class _FocusRingThemeWithCallback extends FocusRingTheme {
  const _FocusRingThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final FocusRingThemeResolverCallback callback;

  @override
  FocusRingThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FocusRingThemeResolverCallback>("callback", callback),
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
  FocusRingThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

class _FocusRingTheme extends InheritedTheme {
  const _FocusRingTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final FocusRingThemeResolver resolver;

  @override
  bool updateShouldNotify(_FocusRingTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _FocusRingTheme(resolver: resolver, child: child);

  static FocusRingThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FocusRingTheme>()?.resolver;
}
