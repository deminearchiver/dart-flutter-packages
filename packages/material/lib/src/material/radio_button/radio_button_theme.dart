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

  RadioButtonThemeDataPartial copyWith({
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
      ? .from(
          stateLayerSize: stateLayerSize ?? this.stateLayerSize,
          stateLayerShape: stateLayerShape ?? this.stateLayerShape,
          stateLayerColor: stateLayerColor ?? this.stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
          iconSize: iconSize ?? this.iconSize,
          iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
          iconOutlineColor: iconOutlineColor ?? this.iconOutlineColor,
          iconDotColor: iconDotColor ?? this.iconDotColor,
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
          iconSize:
              iconSize?.orElseMaybe(this.iconSize?.resolve) ?? this.iconSize,
          iconBackgroundColor:
              iconBackgroundColor?.orElseMaybe(
                this.iconBackgroundColor?.resolve,
              ) ??
              this.iconBackgroundColor,
          iconOutlineColor:
              iconOutlineColor?.orElseMaybe(this.iconOutlineColor?.resolve) ??
              this.iconOutlineColor,
          iconDotColor:
              iconDotColor?.orElseMaybe(this.iconDotColor?.resolve) ??
              this.iconDotColor,
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is RadioButtonThemeDataPartial &&
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
    runtimeType,
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

class _RadioButtonThemeDataPartial extends RadioButtonThemeDataPartial {
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
  }) = _RadioButtonThemeDataDefaults;

  const factory RadioButtonThemeData._defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
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
  RadioButtonThemeData copyWith({
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
      ? .from(
          stateLayerSize: stateLayerSize ?? this.stateLayerSize,
          stateLayerShape: stateLayerShape ?? this.stateLayerShape,
          stateLayerColor: stateLayerColor ?? this.stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
          iconSize: iconSize ?? this.iconSize,
          iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
          iconOutlineColor: iconOutlineColor ?? this.iconOutlineColor,
          iconDotColor: iconDotColor ?? this.iconDotColor,
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
          iconSize: iconSize?.orElse(this.iconSize.resolve) ?? this.iconSize,
          iconBackgroundColor:
              iconBackgroundColor?.orElse(this.iconBackgroundColor.resolve) ??
              this.iconBackgroundColor,
          iconOutlineColor:
              iconOutlineColor?.orElse(this.iconOutlineColor.resolve) ??
              this.iconOutlineColor,
          iconDotColor:
              iconDotColor?.orElse(this.iconDotColor.resolve) ??
              this.iconDotColor,
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is RadioButtonThemeData &&
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
    runtimeType,
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

class _RadioButtonThemeData extends RadioButtonThemeData {
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
}

class _RadioButtonThemeDataDefaults extends RadioButtonThemeData {
  const _RadioButtonThemeDataDefaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    required StateThemeData stateTheme,
    RadioButtonStateProperty<Size?>? stateLayerSize,
    RadioButtonStateProperty<ShapeBorder?>? stateLayerShape,
    RadioButtonStateProperty<Color?>? stateLayerColor,
    RadioButtonStateProperty<double?>? stateLayerOpacity,
    RadioButtonStateProperty<double?>? iconSize,
    RadioButtonStateProperty<Color?>? iconBackgroundColor,
    RadioButtonStateProperty<Color?>? iconOutlineColor,
    RadioButtonStateProperty<Color?>? iconDotColor,
  }) : _colorTheme = colorTheme,
       _shapeTheme = shapeTheme,
       _stateTheme = stateTheme,
       _stateLayerSize = stateLayerSize,
       _stateLayerShape = stateLayerShape,
       _stateLayerColor = stateLayerColor,
       _stateLayerOpacity = stateLayerOpacity,
       _iconSize = iconSize,
       _iconBackgroundColor = iconBackgroundColor,
       _iconOutlineColor = iconOutlineColor,
       _iconDotColor = iconDotColor;

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final StateThemeData _stateTheme;

  final RadioButtonStateProperty<Size?>? _stateLayerSize;
  final RadioButtonStateProperty<ShapeBorder?>? _stateLayerShape;
  final RadioButtonStateProperty<Color?>? _stateLayerColor;
  final RadioButtonStateProperty<double?>? _stateLayerOpacity;
  final RadioButtonStateProperty<double?>? _iconSize;
  final RadioButtonStateProperty<Color?>? _iconBackgroundColor;
  final RadioButtonStateProperty<Color?>? _iconOutlineColor;
  final RadioButtonStateProperty<Color?>? _iconDotColor;

  @override
  RadioButtonStateProperty<Size> get stateLayerSize => .resolveWith(
    (states) => _stateLayerSize?.resolve(states) ?? const .square(40.0),
  );

  @override
  RadioButtonStateProperty<ShapeBorder> get stateLayerShape => .resolveWith(
    (states) =>
        _stateLayerShape?.resolve(states) ??
        CornersBorder.rounded(corners: .all(_shapeTheme.cornerFull)),
  );

  @override
  RadioButtonStateProperty<Color> get stateLayerColor => .resolveWith(
    (states) =>
        _stateLayerColor?.resolve(states) ??
        (states.isSelected ? _colorTheme.primary : _colorTheme.onSurface),
  );

  @override
  RadioButtonStateProperty<double> get stateLayerOpacity => .resolveWith(
    (states) =>
        _stateLayerOpacity?.resolve(states) ??
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
      .resolveWith((states) => _iconSize?.resolve(states) ?? 20.0);

  @override
  RadioButtonStateProperty<Color> get iconBackgroundColor => .resolveWith(
    (states) => _iconBackgroundColor?.resolve(states) ?? Colors.transparent,
  );

  @override
  RadioButtonStateProperty<Color> get iconOutlineColor => .resolveWith(
    (states) =>
        _iconOutlineColor?.resolve(states) ??
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
        _iconDotColor?.resolve(states) ??
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
      : _RadioButtonThemeDataDefaults(
          colorTheme: _colorTheme,
          shapeTheme: _shapeTheme,
          stateTheme: _stateTheme,
          stateLayerSize: stateLayerSize ?? _stateLayerSize,
          stateLayerShape: stateLayerShape ?? _stateLayerShape,
          stateLayerColor: stateLayerColor ?? _stateLayerColor,
          stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
          iconSize: iconSize ?? _iconSize,
          iconBackgroundColor: iconBackgroundColor ?? _iconBackgroundColor,
          iconOutlineColor: iconOutlineColor ?? _iconOutlineColor,
          iconDotColor: iconDotColor ?? _iconDotColor,
        );

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
    iconSize: iconSize?.orElseMaybe(_iconSize?.resolve) ?? _iconSize,
    iconBackgroundColor:
        iconBackgroundColor?.orElseMaybe(_iconBackgroundColor?.resolve) ??
        _iconBackgroundColor,
    iconOutlineColor:
        iconOutlineColor?.orElseMaybe(_iconOutlineColor?.resolve) ??
        _iconOutlineColor,
    iconDotColor:
        iconDotColor?.orElseMaybe(_iconDotColor?.resolve) ?? _iconDotColor,
  );

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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _RadioButtonThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _stateTheme == other._stateTheme &&
          _stateLayerSize == other._stateLayerSize &&
          _stateLayerShape == other._stateLayerShape &&
          _stateLayerColor == other._stateLayerColor &&
          _stateLayerOpacity == other._stateLayerOpacity &&
          _iconSize == other._iconSize &&
          _iconBackgroundColor == other._iconBackgroundColor &&
          _iconOutlineColor == other._iconOutlineColor &&
          _iconDotColor == other._iconDotColor;

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
    _iconSize,
    _iconBackgroundColor,
    _iconOutlineColor,
    _iconDotColor,
  );
}

typedef RadioButtonThemeResolver = ThemeResolver<RadioButtonThemeDataPartial>;

typedef RadioButtonThemeResolverCallback =
    ThemeResolverCallback<RadioButtonThemeDataPartial>;

class _RadioButtonThemeResolver
    extends CombiningThemeResolver<RadioButtonThemeDataPartial> {
  const _RadioButtonThemeResolver(super.a, super.b);

  @override
  RadioButtonThemeDataPartial combine(
    RadioButtonThemeDataPartial a,
    RadioButtonThemeDataPartial b,
  ) => a.merge(b);
}

abstract class RadioButtonTheme extends StatelessWidget implements ProxyWidget {
  const RadioButtonTheme._({super.key, required this.child});

  const factory RadioButtonTheme.withResolver({
    Key? key,
    required RadioButtonThemeResolver resolver,
    required Widget child,
  }) = _RadioButtonThemeWithResolver;

  const factory RadioButtonTheme.withCallback({
    Key? key,
    required RadioButtonThemeResolverCallback callback,
    required Widget child,
  }) = _RadioButtonThemeWithCallback;

  const factory RadioButtonTheme.withData({
    Key? key,
    required RadioButtonThemeDataPartial data,
    required Widget child,
  }) = _RadioButtonThemeWithData;

  RadioButtonThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _RadioButtonTheme.maybeResolverOf(context);
    return _RadioButtonTheme(
      resolver: inherited != null
          ? _RadioButtonThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static RadioButtonThemeData of(BuildContext context) {
    final resolver = _RadioButtonTheme.maybeResolverOf(context);
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
        iconSize: data.iconSize,
        iconBackgroundColor: data.iconBackgroundColor,
        iconOutlineColor: data.iconOutlineColor,
        iconDotColor: data.iconDotColor,
      );
    }
    return .defaults(
      colorTheme: colorTheme,
      shapeTheme: shapeTheme,
      stateTheme: stateTheme,
    );
  }
}

class _RadioButtonThemeWithResolver extends RadioButtonTheme {
  const _RadioButtonThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final RadioButtonThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<RadioButtonThemeResolver>("resolver", resolver),
    );
  }
}

class _RadioButtonThemeWithCallback extends RadioButtonTheme {
  const _RadioButtonThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final RadioButtonThemeResolverCallback callback;

  @override
  RadioButtonThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<RadioButtonThemeResolverCallback>(
        "callback",
        callback,
      ),
    );
  }
}

class _RadioButtonThemeWithData extends RadioButtonTheme {
  const _RadioButtonThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final RadioButtonThemeDataPartial data;

  @override
  RadioButtonThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<RadioButtonThemeDataPartial>("data", data),
    );
  }
}

class _RadioButtonTheme extends InheritedTheme {
  const _RadioButtonTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final RadioButtonThemeResolver resolver;

  @override
  bool updateShouldNotify(_RadioButtonTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _RadioButtonTheme(resolver: resolver, child: child);

  static RadioButtonThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_RadioButtonTheme>()?.resolver;
}
