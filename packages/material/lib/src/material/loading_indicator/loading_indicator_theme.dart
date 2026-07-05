import 'package:material/src/material/flutter.dart';

abstract class LoadingIndicatorThemeDataPartial with Diagnosticable {
  const LoadingIndicatorThemeDataPartial();

  const factory LoadingIndicatorThemeDataPartial.from({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) = _LoadingIndicatorThemeDataPartial;

  Color? get activeIndicatorColor;

  OutlinePartial? get activeIndicatorOutline;

  Color? get containedContainerColor;

  Color? get containedActiveIndicatorColor;

  OutlinePartial? get containedActiveIndicatorOutline;

  LoadingIndicatorThemeDataPartial copy() => copyWith();

  LoadingIndicatorThemeDataPartial copyWith({
    Color? activeIndicatorColor,
    covariant OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant OutlinePartial? containedActiveIndicatorOutline,
  }) => .from(
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline:
        activeIndicatorOutline ?? this.activeIndicatorOutline,
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedActiveIndicatorColor:
        containedActiveIndicatorColor ?? this.containedActiveIndicatorColor,
    containedActiveIndicatorOutline:
        containedActiveIndicatorOutline ?? this.containedActiveIndicatorOutline,
  );

  LoadingIndicatorThemeDataPartial maybeCopyWith({
    Color? activeIndicatorColor,
    covariant OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant OutlinePartial? containedActiveIndicatorOutline,
  }) =>
      activeIndicatorColor != null ||
          activeIndicatorOutline != null ||
          containedContainerColor != null ||
          containedActiveIndicatorColor != null ||
          containedActiveIndicatorOutline != null
      ? copyWith(
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
          containedContainerColor: containedContainerColor,
          containedActiveIndicatorColor: containedActiveIndicatorColor,
          containedActiveIndicatorOutline: containedActiveIndicatorOutline,
        )
      : this;

  LoadingIndicatorThemeDataPartial mergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) => .from(
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline:
        this.activeIndicatorOutline?.merge(activeIndicatorOutline) ??
        activeIndicatorOutline,
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedActiveIndicatorColor:
        containedActiveIndicatorColor ?? this.containedActiveIndicatorColor,
    containedActiveIndicatorOutline:
        this.containedActiveIndicatorOutline?.merge(
          containedActiveIndicatorOutline,
        ) ??
        containedActiveIndicatorOutline,
  );

  LoadingIndicatorThemeDataPartial maybeMergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) =>
      activeIndicatorColor != null ||
          activeIndicatorOutline != null ||
          containedContainerColor != null ||
          containedActiveIndicatorColor != null ||
          containedActiveIndicatorOutline != null
      ? .from(
          activeIndicatorColor:
              activeIndicatorColor ?? this.activeIndicatorColor,
          activeIndicatorOutline:
              this.activeIndicatorOutline?.maybeMerge(activeIndicatorOutline) ??
              activeIndicatorOutline,
          containedContainerColor:
              containedContainerColor ?? this.containedContainerColor,
          containedActiveIndicatorColor:
              containedActiveIndicatorColor ??
              this.containedActiveIndicatorColor,
          containedActiveIndicatorOutline:
              this.containedActiveIndicatorOutline?.maybeMerge(
                containedActiveIndicatorOutline,
              ) ??
              containedActiveIndicatorOutline,
        )
      : this;

  LoadingIndicatorThemeDataPartial merge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? mergeWith(
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
          containedContainerColor: other.containedContainerColor,
          containedActiveIndicatorColor: other.containedActiveIndicatorColor,
          containedActiveIndicatorOutline:
              other.containedActiveIndicatorOutline,
        )
      : copy();

  LoadingIndicatorThemeDataPartial maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeMergeWith(
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
          containedContainerColor: other.containedContainerColor,
          containedActiveIndicatorColor: other.containedActiveIndicatorColor,
          containedActiveIndicatorOutline:
              other.containedActiveIndicatorOutline,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        ColorProperty(
          "activeIndicatorColor",
          activeIndicatorColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<OutlinePartial>(
          "activeIndicatorOutline",
          activeIndicatorOutline,
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
          "containedActiveIndicatorColor",
          containedActiveIndicatorColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<OutlinePartial>(
          "containedActiveIndicatorOutline",
          containedActiveIndicatorOutline,
          defaultValue: null,
        ),
      );
  }
}

final class _LoadingIndicatorThemeDataPartial
    extends LoadingIndicatorThemeDataPartial {
  const _LoadingIndicatorThemeDataPartial({
    this.activeIndicatorColor,
    this.activeIndicatorOutline,
    this.containedContainerColor,
    this.containedActiveIndicatorColor,
    this.containedActiveIndicatorOutline,
  });

  @override
  final Color? activeIndicatorColor;

  @override
  final OutlinePartial? activeIndicatorOutline;

  @override
  final Color? containedContainerColor;

  @override
  final Color? containedActiveIndicatorColor;

  @override
  final OutlinePartial? containedActiveIndicatorOutline;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeDataPartial &&
          activeIndicatorColor == other.activeIndicatorColor &&
          activeIndicatorOutline == other.activeIndicatorOutline &&
          containedContainerColor == other.containedContainerColor &&
          containedActiveIndicatorColor ==
              other.containedActiveIndicatorColor &&
          containedActiveIndicatorOutline ==
              other.containedActiveIndicatorOutline;

  @override
  int get hashCode => Object.hash(
    activeIndicatorColor,
    activeIndicatorOutline,
    containedContainerColor,
    containedActiveIndicatorColor,
    containedActiveIndicatorOutline,
  );
}

abstract class LoadingIndicatorThemeData
    extends LoadingIndicatorThemeDataPartial {
  const LoadingIndicatorThemeData();

  const factory LoadingIndicatorThemeData.from({
    required Color activeIndicatorColor,
    required Outline activeIndicatorOutline,
    required Color containedContainerColor,
    required Color containedActiveIndicatorColor,
    required Outline containedActiveIndicatorOutline,
  }) = _LoadingIndicatorThemeData;

  factory LoadingIndicatorThemeData.defaults({
    required ColorThemeData colorTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) = _LoadingIndicatorThemeDataDefaults;

  factory LoadingIndicatorThemeData.defaultsOf(
    BuildContext context, {
    LoadingIndicatorThemeDataPartial? overrides,
  }) => .defaults(colorTheme: ColorTheme.of(context), overrides: overrides);

  @override
  Color get activeIndicatorColor;

  @override
  Outline get activeIndicatorOutline;

  @override
  Color get containedContainerColor;

  @override
  Color get containedActiveIndicatorColor;

  @override
  Outline get containedActiveIndicatorOutline;

  @override
  LoadingIndicatorThemeData copy() => copyWith();

  @override
  LoadingIndicatorThemeData copyWith({
    Color? activeIndicatorColor,
    covariant Outline? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant Outline? containedActiveIndicatorOutline,
  }) => .from(
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline:
        activeIndicatorOutline ?? this.activeIndicatorOutline,
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedActiveIndicatorColor:
        containedActiveIndicatorColor ?? this.containedActiveIndicatorColor,
    containedActiveIndicatorOutline:
        containedActiveIndicatorOutline ?? this.containedActiveIndicatorOutline,
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    Color? activeIndicatorColor,
    covariant Outline? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant Outline? containedActiveIndicatorOutline,
  }) =>
      activeIndicatorColor != null ||
          activeIndicatorOutline != null ||
          containedContainerColor != null ||
          containedActiveIndicatorColor != null ||
          containedActiveIndicatorOutline != null
      ? copyWith(
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
          containedContainerColor: containedContainerColor,
          containedActiveIndicatorColor: containedActiveIndicatorColor,
          containedActiveIndicatorOutline: containedActiveIndicatorOutline,
        )
      : this;

  @override
  LoadingIndicatorThemeData mergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) => .from(
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline: this.activeIndicatorOutline.merge(
      activeIndicatorOutline,
    ),
    containedContainerColor:
        containedContainerColor ?? this.containedContainerColor,
    containedActiveIndicatorColor:
        containedActiveIndicatorColor ?? this.containedActiveIndicatorColor,
    containedActiveIndicatorOutline: this.containedActiveIndicatorOutline.merge(
      containedActiveIndicatorOutline,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeMergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) =>
      activeIndicatorColor != null ||
          activeIndicatorOutline != null ||
          containedContainerColor != null ||
          containedActiveIndicatorColor != null ||
          containedActiveIndicatorOutline != null
      ? .from(
          activeIndicatorColor:
              activeIndicatorColor ?? this.activeIndicatorColor,
          activeIndicatorOutline: this.activeIndicatorOutline.maybeMerge(
            activeIndicatorOutline,
          ),
          containedContainerColor:
              containedContainerColor ?? this.containedContainerColor,
          containedActiveIndicatorColor:
              containedActiveIndicatorColor ??
              this.containedActiveIndicatorColor,
          containedActiveIndicatorOutline: this.containedActiveIndicatorOutline
              .maybeMerge(containedActiveIndicatorOutline),
        )
      : this;

  @override
  LoadingIndicatorThemeData merge(LoadingIndicatorThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
          containedContainerColor: other.containedContainerColor,
          containedActiveIndicatorColor: other.containedActiveIndicatorColor,
          containedActiveIndicatorOutline:
              other.containedActiveIndicatorOutline,
        )
      : copy();

  @override
  LoadingIndicatorThemeData maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeMergeWith(
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
          containedContainerColor: other.containedContainerColor,
          containedActiveIndicatorColor: other.containedActiveIndicatorColor,
          containedActiveIndicatorOutline:
              other.containedActiveIndicatorOutline,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("activeIndicatorColor", activeIndicatorColor))
      ..add(
        DiagnosticsProperty<OutlinePartial>(
          "activeIndicatorOutline",
          activeIndicatorOutline,
        ),
      )
      ..add(ColorProperty("containedContainerColor", containedContainerColor))
      ..add(
        ColorProperty(
          "containedActiveIndicatorColor",
          containedActiveIndicatorColor,
        ),
      )
      ..add(
        DiagnosticsProperty<OutlinePartial>(
          "containedActiveIndicatorOutline",
          containedActiveIndicatorOutline,
        ),
      );
  }
}

final class _LoadingIndicatorThemeData extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeData({
    required this.activeIndicatorColor,
    required this.activeIndicatorOutline,
    required this.containedContainerColor,
    required this.containedActiveIndicatorColor,
    required this.containedActiveIndicatorOutline,
  });

  @override
  final Color activeIndicatorColor;

  @override
  final Outline activeIndicatorOutline;

  @override
  final Color containedContainerColor;

  @override
  final Color containedActiveIndicatorColor;

  @override
  final Outline containedActiveIndicatorOutline;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeData &&
          activeIndicatorColor == other.activeIndicatorColor &&
          activeIndicatorOutline == other.activeIndicatorOutline &&
          containedContainerColor == other.containedContainerColor &&
          containedActiveIndicatorColor ==
              other.containedActiveIndicatorColor &&
          containedActiveIndicatorOutline ==
              other.containedActiveIndicatorOutline;

  @override
  int get hashCode => Object.hash(
    activeIndicatorColor,
    activeIndicatorOutline,
    containedContainerColor,
    containedActiveIndicatorColor,
    containedActiveIndicatorOutline,
  );
}

final class _LoadingIndicatorThemeDataDefaults
    extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeDataDefaults({
    required this._colorTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final LoadingIndicatorThemeDataPartial _overrides;

  @override
  Color get activeIndicatorColor =>
      _overrides.activeIndicatorColor ?? _colorTheme.primary;

  @override
  Outline get activeIndicatorOutline => const .from();

  @override
  Color get containedContainerColor =>
      _overrides.containedContainerColor ?? _colorTheme.primaryContainer;

  @override
  Color get containedActiveIndicatorColor =>
      _overrides.containedActiveIndicatorColor ??
      _colorTheme.onPrimaryContainer;

  @override
  Outline get containedActiveIndicatorOutline => const .from();

  @override
  LoadingIndicatorThemeData copyWith({
    Color? activeIndicatorColor,
    covariant Outline? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant Outline? containedActiveIndicatorOutline,
  }) => _LoadingIndicatorThemeDataDefaults(
    colorTheme: _colorTheme,
    overrides: _overrides.copyWith(
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
      containedContainerColor: containedContainerColor,
      containedActiveIndicatorColor: containedActiveIndicatorColor,
      containedActiveIndicatorOutline: containedActiveIndicatorOutline,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    Color? activeIndicatorColor,
    covariant Outline? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    covariant Outline? containedActiveIndicatorOutline,
  }) =>
      activeIndicatorColor != null &&
          activeIndicatorOutline != null &&
          containedContainerColor != null &&
          containedActiveIndicatorColor != null &&
          containedActiveIndicatorOutline != null
      ? .from(
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
          containedContainerColor: containedContainerColor,
          containedActiveIndicatorColor: containedActiveIndicatorColor,
          containedActiveIndicatorOutline: containedActiveIndicatorOutline,
        )
      : activeIndicatorColor != null ||
            activeIndicatorOutline != null ||
            containedContainerColor != null ||
            containedActiveIndicatorColor != null ||
            containedActiveIndicatorOutline != null
      ? copyWith(
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
          containedContainerColor: containedContainerColor,
          containedActiveIndicatorColor: containedActiveIndicatorColor,
          containedActiveIndicatorOutline: containedActiveIndicatorOutline,
        )
      : this;

  @override
  LoadingIndicatorThemeData mergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) => _LoadingIndicatorThemeDataDefaults(
    colorTheme: _colorTheme,
    overrides: _overrides.mergeWith(
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
      containedContainerColor: containedContainerColor,
      containedActiveIndicatorColor: containedActiveIndicatorColor,
      containedActiveIndicatorOutline: containedActiveIndicatorOutline,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeMergeWith({
    Color? activeIndicatorColor,
    OutlinePartial? activeIndicatorOutline,
    Color? containedContainerColor,
    Color? containedActiveIndicatorColor,
    OutlinePartial? containedActiveIndicatorOutline,
  }) {
    final overrides = _overrides.maybeMergeWith(
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
      containedContainerColor: containedContainerColor,
      containedActiveIndicatorColor: containedActiveIndicatorColor,
      containedActiveIndicatorOutline: containedActiveIndicatorOutline,
    );
    return identical(_overrides, overrides)
        ? this
        : _LoadingIndicatorThemeDataDefaults(
            colorTheme: _colorTheme,
            overrides: overrides,
          );
  }

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
  bool isConcrete(LoadingIndicatorThemeDataPartial data) =>
      data is LoadingIndicatorThemeData;

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
