import 'package:material/src/material/flutter.dart';

abstract class LoadingIndicatorThemeDataPartial with Diagnosticable {
  const LoadingIndicatorThemeDataPartial();

  const factory LoadingIndicatorThemeDataPartial.from({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) = _LoadingIndicatorThemeDataPartial.from;

  Color? get indicatorColor;

  Color? get containedContainerColor;

  Color? get containedIndicatorColor;

  LoadingIndicatorThemeDataPartial copy() => copyWith();

  LoadingIndicatorThemeDataPartial copyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) => .from(
    indicatorColor: indicatorColor ?? this.indicatorColor,
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedIndicatorColor:
        containedIndicatorColor ?? this.containedIndicatorColor,
  );

  LoadingIndicatorThemeDataPartial maybeCopyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) =>
      indicatorColor != null ||
          containedIndicatorColor != null ||
          containedContainerColor != null
      ? copyWith(
          indicatorColor: indicatorColor,
          containedContainerColor: containedContainerColor,
          containedIndicatorColor: containedIndicatorColor,
        )
      : this;

  LoadingIndicatorThemeDataPartial merge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? copyWith(
          indicatorColor: other.indicatorColor,
          containedContainerColor: other.containedContainerColor,
          containedIndicatorColor: other.containedIndicatorColor,
        )
      : copy();

  LoadingIndicatorThemeDataPartial maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeCopyWith(
          indicatorColor: other.indicatorColor,
          containedContainerColor: other.containedContainerColor,
          containedIndicatorColor: other.containedIndicatorColor,
        )
      : this;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ColorProperty(
          "activeIndicatorColor",
          indicatorColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "containedContainerColor",
          containedContainerColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "containedIndicatorColor",
          containedIndicatorColor,
          defaultValue: null,
        ),
      );
  }

  static LoadingIndicatorThemeDataPartial? lerp(
    LoadingIndicatorThemeDataPartial? a,
    LoadingIndicatorThemeDataPartial? b,
    double t,
  ) {
    if (a == b) return a;
    return .from(
      indicatorColor: Color.lerp(a?.indicatorColor, b?.indicatorColor, t),
      containedContainerColor: Color.lerp(
        a?.containedContainerColor,
        b?.containedContainerColor,
        t,
      ),
      containedIndicatorColor: Color.lerp(
        a?.containedIndicatorColor,
        b?.containedIndicatorColor,
        t,
      ),
    );
  }
}

final class _LoadingIndicatorThemeDataPartial
    extends LoadingIndicatorThemeDataPartial {
  const _LoadingIndicatorThemeDataPartial.from({
    this.indicatorColor,
    this.containedContainerColor,
    this.containedIndicatorColor,
  });

  @override
  final Color? indicatorColor;

  @override
  final Color? containedContainerColor;

  @override
  final Color? containedIndicatorColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeDataPartial &&
          indicatorColor == other.indicatorColor &&
          containedContainerColor == other.containedContainerColor &&
          containedIndicatorColor == other.containedIndicatorColor;

  @override
  int get hashCode => Object.hash(
    indicatorColor,
    containedContainerColor,
    containedIndicatorColor,
  );
}

abstract class LoadingIndicatorThemeData
    extends LoadingIndicatorThemeDataPartial {
  const LoadingIndicatorThemeData();

  const factory LoadingIndicatorThemeData.from({
    required Color indicatorColor,
    required Color containedContainerColor,
    required Color containedIndicatorColor,
  }) = _LoadingIndicatorThemeData.from;

  const factory LoadingIndicatorThemeData.defaults({
    required ColorThemeData colorTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) = _LoadingIndicatorThemeDataDefaults;

  factory LoadingIndicatorThemeData.defaultsOf(
    BuildContext context, {
    LoadingIndicatorThemeDataPartial? overrides,
  }) => .defaults(colorTheme: ColorTheme.of(context), overrides: overrides);

  @override
  Color get indicatorColor;

  @override
  Color get containedContainerColor;

  @override
  Color get containedIndicatorColor;

  @override
  LoadingIndicatorThemeData copy() => copyWith();

  @override
  LoadingIndicatorThemeData copyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) => .from(
    indicatorColor: indicatorColor ?? this.indicatorColor,
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedIndicatorColor:
        containedIndicatorColor ?? this.containedIndicatorColor,
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) =>
      indicatorColor != null ||
          containedIndicatorColor != null ||
          containedContainerColor != null
      ? copyWith(
          indicatorColor: indicatorColor,
          containedContainerColor: containedContainerColor,
          containedIndicatorColor: containedIndicatorColor,
        )
      : this;

  @override
  LoadingIndicatorThemeData merge(LoadingIndicatorThemeDataPartial? other) =>
      other != null
      ? copyWith(
          indicatorColor: other.indicatorColor,
          containedContainerColor: other.containedContainerColor,
          containedIndicatorColor: other.containedIndicatorColor,
        )
      : copy();

  @override
  LoadingIndicatorThemeData maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeCopyWith(
          indicatorColor: other.indicatorColor,
          containedContainerColor: other.containedContainerColor,
          containedIndicatorColor: other.containedIndicatorColor,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("activeIndicatorColor", indicatorColor))
      ..add(ColorProperty("containedContainerColor", containedContainerColor))
      ..add(ColorProperty("containedIndicatorColor", containedIndicatorColor));
  }

  static LoadingIndicatorThemeData lerp(
    LoadingIndicatorThemeData a,
    LoadingIndicatorThemeData b,
    double t,
  ) {
    if (a == b) return a;
    return .from(
      indicatorColor: Color.lerp(a.indicatorColor, b.indicatorColor, t)!,
      containedContainerColor: Color.lerp(
        a.containedContainerColor,
        b.containedContainerColor,
        t,
      )!,
      containedIndicatorColor: Color.lerp(
        a.containedIndicatorColor,
        b.containedIndicatorColor,
        t,
      )!,
    );
  }
}

final class _LoadingIndicatorThemeData extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeData.from({
    required this.indicatorColor,
    required this.containedIndicatorColor,
    required this.containedContainerColor,
  });

  @override
  final Color indicatorColor;

  @override
  final Color containedContainerColor;

  @override
  final Color containedIndicatorColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeData &&
          indicatorColor == other.indicatorColor &&
          containedContainerColor == other.containedContainerColor &&
          containedIndicatorColor == other.containedIndicatorColor;

  @override
  int get hashCode => Object.hash(
    indicatorColor,
    containedContainerColor,
    containedIndicatorColor,
  );
}

final class _LoadingIndicatorThemeDataDefaults
    extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeDataDefaults({
    required ColorThemeData colorTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) : _colorTheme = colorTheme,
       _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final LoadingIndicatorThemeDataPartial _overrides;

  @override
  Color get indicatorColor => _overrides.indicatorColor ?? _colorTheme.primary;

  @override
  Color get containedContainerColor =>
      _overrides.containedContainerColor ?? _colorTheme.primaryContainer;

  @override
  Color get containedIndicatorColor =>
      _overrides.containedIndicatorColor ?? _colorTheme.onPrimaryContainer;

  @override
  LoadingIndicatorThemeData copyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) => _LoadingIndicatorThemeDataDefaults(
    colorTheme: _colorTheme,
    overrides: _overrides.copyWith(
      indicatorColor: indicatorColor,
      containedContainerColor: containedContainerColor,
      containedIndicatorColor: containedIndicatorColor,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    Color? indicatorColor,
    Color? containedContainerColor,
    Color? containedIndicatorColor,
  }) =>
      indicatorColor != null &&
          containedIndicatorColor != null &&
          containedContainerColor != null
      ? .from(
          indicatorColor: indicatorColor,
          containedContainerColor: containedContainerColor,
          containedIndicatorColor: containedIndicatorColor,
        )
      : indicatorColor != null ||
            containedIndicatorColor != null ||
            containedContainerColor != null
      ? copyWith(
          indicatorColor: indicatorColor,
          containedContainerColor: containedContainerColor,
          containedIndicatorColor: containedIndicatorColor,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_colorTheme, _overrides);
}

abstract class LoadingIndicatorTheme extends StatelessWidget
    implements ProxyWidget {
  const LoadingIndicatorTheme._({super.key, required this.child});

  const factory LoadingIndicatorTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<LoadingIndicatorThemeDataPartial> resolver,
    required Widget child,
  }) = _LoadingIndicatorThemeWithResolver<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<LoadingIndicatorThemeDataPartial> callback,
    required Widget child,
  }) = _LoadingIndicatorThemeWithCallback<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.mergeWithData({
    Key? key,
    required LoadingIndicatorThemeDataPartial data,
    required Widget child,
  }) = _LoadingIndicatorThemeWithData<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<LoadingIndicatorThemeData> resolver,
    required Widget child,
  }) = _LoadingIndicatorThemeWithResolver<LoadingIndicatorThemeData>;

  const factory LoadingIndicatorTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<LoadingIndicatorThemeData> callback,
    required Widget child,
  }) = _LoadingIndicatorThemeWithCallback<LoadingIndicatorThemeData>;

  const factory LoadingIndicatorTheme.replaceWithData({
    Key? key,
    required LoadingIndicatorThemeData data,
    required Widget child,
  }) = _LoadingIndicatorThemeWithData<LoadingIndicatorThemeData>;

  ThemeResolver<LoadingIndicatorThemeDataPartial> get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _LoadingIndicatorTheme(resolver: resolver, child: child);

  static LoadingIndicatorThemeData? maybeOf(BuildContext context) {
    final overrides = _LoadingIndicatorTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaultsOf(context, overrides: overrides);
  }

  static LoadingIndicatorThemeData of(BuildContext context) => .defaultsOf(
    context,
    overrides: _LoadingIndicatorTheme.maybeOverridesOf(context),
  );
}

class _LoadingIndicatorThemeWithResolver<
  T extends LoadingIndicatorThemeDataPartial
>
    extends LoadingIndicatorTheme {
  const _LoadingIndicatorThemeWithResolver({
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

class _LoadingIndicatorThemeWithCallback<
  T extends LoadingIndicatorThemeDataPartial
>
    extends LoadingIndicatorTheme {
  const _LoadingIndicatorThemeWithCallback({
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

class _LoadingIndicatorThemeWithData<T extends LoadingIndicatorThemeDataPartial>
    extends LoadingIndicatorTheme {
  const _LoadingIndicatorThemeWithData({
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

final class _LoadingIndicatorTheme
    extends
        InheritedThemeResolverWidget<
          LoadingIndicatorThemeDataPartial,
          _LoadingIndicatorTheme,
          _LoadingIndicatorThemeElement
        >
    implements InheritedTheme {
  const _LoadingIndicatorTheme({
    super.key,
    required super.resolver,
    required super.child,
  });

  @override
  LoadingIndicatorThemeDataPartial merge(
    LoadingIndicatorThemeDataPartial fallback,
    LoadingIndicatorThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  _LoadingIndicatorThemeElement createElement() =>
      _LoadingIndicatorThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _LoadingIndicatorTheme(resolver: resolver, child: child);

  static ThemeResolver<LoadingIndicatorThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        LoadingIndicatorThemeDataPartial,
        _LoadingIndicatorTheme,
        _LoadingIndicatorThemeElement
      >(context);

  static LoadingIndicatorThemeDataPartial? maybeOverridesOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        LoadingIndicatorThemeDataPartial,
        _LoadingIndicatorTheme,
        _LoadingIndicatorThemeElement
      >(context);
}

final class _LoadingIndicatorThemeElement
    extends
        InheritedThemeResolverElement<
          LoadingIndicatorThemeDataPartial,
          _LoadingIndicatorTheme,
          _LoadingIndicatorThemeElement
        > {
  _LoadingIndicatorThemeElement(super.widget);
}
