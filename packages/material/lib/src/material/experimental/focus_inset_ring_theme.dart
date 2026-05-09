import 'package:material/src/material/flutter.dart';

abstract class FocusInsetRingThemeDataPartial with Diagnosticable {
  const FocusInsetRingThemeDataPartial();

  const factory FocusInsetRingThemeDataPartial.from({
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) = _FocusInsetRingThemeDataPartial;

  double? get outerStrokeInset;
  double? get outerStrokeWidth;
  Color? get outerStrokeColor;
  double? get innerStrokeInset;
  double? get innerStrokeWidth;
  Color? get innerStrokeColor;

  FocusInsetRingThemeDataPartial copyWith({
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) =>
      outerStrokeInset != null ||
          outerStrokeWidth != null ||
          outerStrokeColor != null ||
          innerStrokeInset != null ||
          innerStrokeWidth != null ||
          innerStrokeColor != null
      ? .from(
          outerStrokeInset: outerStrokeInset ?? this.outerStrokeInset,
          outerStrokeWidth: outerStrokeWidth ?? this.outerStrokeWidth,
          outerStrokeColor: outerStrokeColor ?? this.outerStrokeColor,
          innerStrokeInset: innerStrokeInset ?? this.innerStrokeInset,
          innerStrokeWidth: innerStrokeWidth ?? this.innerStrokeWidth,
          innerStrokeColor: innerStrokeColor ?? this.innerStrokeColor,
        )
      : this;

  FocusInsetRingThemeDataPartial merge(FocusInsetRingThemeDataPartial? other) =>
      other != null
      ? copyWith(
          outerStrokeInset: other.outerStrokeInset,
          outerStrokeWidth: other.outerStrokeWidth,
          outerStrokeColor: other.outerStrokeColor,
          innerStrokeInset: other.innerStrokeInset,
          innerStrokeWidth: other.innerStrokeWidth,
          innerStrokeColor: other.innerStrokeColor,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DoubleProperty(
          "outerStrokeInset",
          outerStrokeInset,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "outerStrokeWidth",
          outerStrokeWidth,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("outerStrokeColor", outerStrokeColor, defaultValue: null),
      )
      ..add(
        DoubleProperty(
          "innerStrokeInset",
          innerStrokeInset,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "innerStrokeWidth",
          innerStrokeWidth,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("innerStrokeColor", innerStrokeColor, defaultValue: null),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is FocusInsetRingThemeDataPartial &&
          outerStrokeInset == other.outerStrokeInset &&
          outerStrokeWidth == other.outerStrokeWidth &&
          outerStrokeColor == other.outerStrokeColor &&
          innerStrokeInset == other.innerStrokeInset &&
          innerStrokeWidth == other.innerStrokeWidth &&
          innerStrokeColor == other.innerStrokeColor;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    outerStrokeInset,
    outerStrokeWidth,
    outerStrokeColor,
    innerStrokeInset,
    innerStrokeWidth,
    innerStrokeColor,
  );
}

class _FocusInsetRingThemeDataPartial extends FocusInsetRingThemeDataPartial {
  const _FocusInsetRingThemeDataPartial({
    this.outerStrokeInset,
    this.outerStrokeWidth,
    this.outerStrokeColor,
    this.innerStrokeInset,
    this.innerStrokeWidth,
    this.innerStrokeColor,
  });

  @override
  final double? outerStrokeInset;

  @override
  final double? outerStrokeWidth;

  @override
  final Color? outerStrokeColor;

  @override
  final double? innerStrokeInset;

  @override
  final double? innerStrokeWidth;

  @override
  final Color? innerStrokeColor;
}

abstract class FocusInsetRingThemeData extends FocusInsetRingThemeDataPartial {
  const FocusInsetRingThemeData();

  const factory FocusInsetRingThemeData.from({
    required double outerStrokeInset,
    required double outerStrokeWidth,
    required Color outerStrokeColor,
    required double innerStrokeInset,
    required double innerStrokeWidth,
    required Color innerStrokeColor,
  }) = _FocusInsetRingThemeData;

  const factory FocusInsetRingThemeData.defaults({
    required ColorThemeData colorTheme,
  }) = _FocusInsetRingThemeDataDefaults;

  const factory FocusInsetRingThemeData._defaults({
    required ColorThemeData colorTheme,
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) = _FocusInsetRingThemeDataDefaults;

  @override
  double get outerStrokeInset;

  @override
  double get outerStrokeWidth;

  @override
  Color get outerStrokeColor;

  @override
  double get innerStrokeInset;

  @override
  double get innerStrokeWidth;

  @override
  Color get innerStrokeColor;

  @override
  FocusInsetRingThemeData copyWith({
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) =>
      outerStrokeInset != null ||
          outerStrokeWidth != null ||
          outerStrokeColor != null ||
          innerStrokeInset != null ||
          innerStrokeWidth != null ||
          innerStrokeColor != null
      ? .from(
          outerStrokeInset: outerStrokeInset ?? this.outerStrokeInset,
          outerStrokeWidth: outerStrokeWidth ?? this.outerStrokeWidth,
          outerStrokeColor: outerStrokeColor ?? this.outerStrokeColor,
          innerStrokeInset: innerStrokeInset ?? this.innerStrokeInset,
          innerStrokeWidth: innerStrokeWidth ?? this.innerStrokeWidth,
          innerStrokeColor: innerStrokeColor ?? this.innerStrokeColor,
        )
      : this;

  @override
  FocusInsetRingThemeData merge(FocusInsetRingThemeDataPartial? other) =>
      other != null
      ? copyWith(
          outerStrokeInset: other.outerStrokeInset,
          outerStrokeWidth: other.outerStrokeWidth,
          outerStrokeColor: other.outerStrokeColor,
          innerStrokeInset: other.innerStrokeInset,
          innerStrokeWidth: other.innerStrokeWidth,
          innerStrokeColor: other.innerStrokeColor,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("outerStrokeInset", outerStrokeInset))
      ..add(DoubleProperty("outerStrokeWidth", outerStrokeWidth))
      ..add(ColorProperty("outerStrokeColor", outerStrokeColor))
      ..add(DoubleProperty("innerStrokeInset", innerStrokeInset))
      ..add(DoubleProperty("innerStrokeWidth", innerStrokeWidth))
      ..add(ColorProperty("innerStrokeColor", innerStrokeColor));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is FocusInsetRingThemeData &&
          outerStrokeInset == other.outerStrokeInset &&
          outerStrokeWidth == other.outerStrokeWidth &&
          outerStrokeColor == other.outerStrokeColor &&
          innerStrokeInset == other.innerStrokeInset &&
          innerStrokeWidth == other.innerStrokeWidth &&
          innerStrokeColor == other.innerStrokeColor;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    outerStrokeInset,
    outerStrokeWidth,
    outerStrokeColor,
    innerStrokeInset,
    innerStrokeWidth,
    innerStrokeColor,
  );
}

class _FocusInsetRingThemeData extends FocusInsetRingThemeData {
  const _FocusInsetRingThemeData({
    required this.outerStrokeInset,
    required this.outerStrokeWidth,
    required this.outerStrokeColor,
    required this.innerStrokeInset,
    required this.innerStrokeWidth,
    required this.innerStrokeColor,
  });

  @override
  final double outerStrokeInset;

  @override
  final double outerStrokeWidth;

  @override
  final Color outerStrokeColor;

  @override
  final double innerStrokeInset;

  @override
  final double innerStrokeWidth;

  @override
  final Color innerStrokeColor;
}

class _FocusInsetRingThemeDataDefaults extends FocusInsetRingThemeData {
  const _FocusInsetRingThemeDataDefaults({
    required ColorThemeData colorTheme,
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) : _colorTheme = colorTheme,
       _outerStrokeInset = outerStrokeInset,
       _outerStrokeWidth = outerStrokeWidth,
       _outerStrokeColor = outerStrokeColor,
       _innerStrokeInset = innerStrokeInset,
       _innerStrokeWidth = innerStrokeWidth,
       _innerStrokeColor = innerStrokeColor;

  final ColorThemeData _colorTheme;

  final double? _outerStrokeInset;
  final double? _outerStrokeWidth;
  final Color? _outerStrokeColor;
  final double? _innerStrokeInset;
  final double? _innerStrokeWidth;
  final Color? _innerStrokeColor;

  @override
  double get outerStrokeInset => _outerStrokeInset ?? 0.0;

  @override
  double get outerStrokeWidth => _outerStrokeWidth ?? 2.0;

  @override
  Color get outerStrokeColor => _outerStrokeColor ?? _colorTheme.secondary;

  @override
  double get innerStrokeInset => _innerStrokeInset ?? 1.0;

  @override
  double get innerStrokeWidth => _innerStrokeWidth ?? 3.0;

  @override
  Color get innerStrokeColor => _innerStrokeColor ?? _colorTheme.onSecondary;

  @override
  FocusInsetRingThemeData copyWith({
    double? outerStrokeInset,
    double? outerStrokeWidth,
    Color? outerStrokeColor,
    double? innerStrokeInset,
    double? innerStrokeWidth,
    Color? innerStrokeColor,
  }) =>
      outerStrokeInset != null &&
          outerStrokeWidth != null &&
          outerStrokeColor != null &&
          innerStrokeInset != null &&
          innerStrokeWidth != null &&
          innerStrokeColor != null
      ? .from(
          outerStrokeInset: outerStrokeInset,
          outerStrokeWidth: outerStrokeWidth,
          outerStrokeColor: outerStrokeColor,
          innerStrokeInset: innerStrokeInset,
          innerStrokeWidth: innerStrokeWidth,
          innerStrokeColor: innerStrokeColor,
        )
      : _FocusInsetRingThemeDataDefaults(
          colorTheme: _colorTheme,
          outerStrokeInset: outerStrokeInset ?? _outerStrokeInset,
          outerStrokeWidth: outerStrokeWidth ?? _outerStrokeWidth,
          outerStrokeColor: outerStrokeColor ?? _outerStrokeColor,
          innerStrokeInset: innerStrokeInset ?? _innerStrokeInset,
          innerStrokeWidth: innerStrokeWidth ?? _innerStrokeWidth,
          innerStrokeColor: innerStrokeColor ?? _innerStrokeColor,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _FocusInsetRingThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _outerStrokeInset == other._outerStrokeInset &&
          _outerStrokeWidth == other._outerStrokeWidth &&
          _outerStrokeColor == other._outerStrokeColor &&
          _innerStrokeInset == other._innerStrokeInset &&
          _innerStrokeWidth == other._innerStrokeWidth &&
          _innerStrokeColor == other._innerStrokeColor;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _colorTheme,
    _outerStrokeInset,
    _outerStrokeWidth,
    _outerStrokeColor,
    _innerStrokeInset,
    _innerStrokeWidth,
    _innerStrokeColor,
  );
}

typedef FocusInsetRingThemeResolver =
    ThemeResolver<FocusInsetRingThemeDataPartial>;

typedef FocusInsetRingThemeResolverCallback =
    ThemeResolverCallback<FocusInsetRingThemeDataPartial>;

class _FocusInsetRingThemeResolver
    extends CombiningThemeResolver<FocusInsetRingThemeDataPartial> {
  const _FocusInsetRingThemeResolver(super.a, super.b);

  @override
  FocusInsetRingThemeDataPartial combine(
    FocusInsetRingThemeDataPartial a,
    FocusInsetRingThemeDataPartial b,
  ) => a.merge(b);
}

abstract class FocusInsetRingTheme extends StatelessWidget
    implements ProxyWidget {
  const FocusInsetRingTheme._({super.key, required this.child});

  const factory FocusInsetRingTheme.withResolver({
    Key? key,
    required FocusInsetRingThemeResolver resolver,
    required Widget child,
  }) = _FocusInsetRingThemeWithResolver;

  const factory FocusInsetRingTheme.withCallback({
    Key? key,
    required FocusInsetRingThemeResolverCallback callback,
    required Widget child,
  }) = _FocusInsetRingThemeWithCallback;

  const factory FocusInsetRingTheme.withData({
    Key? key,
    required FocusInsetRingThemeDataPartial data,
    required Widget child,
  }) = _FocusInsetRingThemeWithData;

  FocusInsetRingThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = maybeOf(context);
    return _FocusInsetRingTheme(
      resolver: inherited != null
          ? _FocusInsetRingThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static FocusInsetRingThemeResolver? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_FocusInsetRingTheme>()
      ?.resolver;

  static FocusInsetRingThemeData of(BuildContext context) {
    final resolver = maybeOf(context);
    final colorTheme = ColorTheme.of(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        colorTheme: colorTheme,
        outerStrokeInset: data.outerStrokeInset,
        outerStrokeWidth: data.outerStrokeWidth,
        outerStrokeColor: data.outerStrokeColor,
        innerStrokeInset: data.innerStrokeInset,
        innerStrokeWidth: data.innerStrokeWidth,
        innerStrokeColor: data.innerStrokeColor,
      );
    }
    return .defaults(colorTheme: colorTheme);
  }
}

class _FocusInsetRingThemeWithResolver extends FocusInsetRingTheme {
  const _FocusInsetRingThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final FocusInsetRingThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FocusInsetRingThemeResolver>("resolver", resolver),
    );
  }
}

class _FocusInsetRingThemeWithCallback extends FocusInsetRingTheme {
  const _FocusInsetRingThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final FocusInsetRingThemeResolverCallback callback;

  @override
  FocusInsetRingThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FocusInsetRingThemeResolverCallback>(
        "callback",
        callback,
      ),
    );
  }
}

class _FocusInsetRingThemeWithData extends FocusInsetRingTheme {
  const _FocusInsetRingThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final FocusInsetRingThemeDataPartial data;

  @override
  FocusInsetRingThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<FocusInsetRingThemeDataPartial>("data", data),
    );
  }
}

class _FocusInsetRingTheme extends InheritedTheme {
  const _FocusInsetRingTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final FocusInsetRingThemeResolver resolver;

  @override
  bool updateShouldNotify(_FocusInsetRingTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _FocusInsetRingTheme(resolver: resolver, child: child);
}
