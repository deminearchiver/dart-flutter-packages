import 'package:material/src/material/flutter.dart';

mixin LoadingIndicatorStates {
  bool get isContained;
}

typedef LoadingIndicatorStateProperty<T extends Object?> =
    StateProperty<T, LoadingIndicatorStates>;

abstract class LoadingIndicatorThemeDataPartial with Diagnosticable {
  const LoadingIndicatorThemeDataPartial();

  const factory LoadingIndicatorThemeDataPartial.from({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) = _LoadingIndicatorThemeDataPartial;

  LoadingIndicatorStateProperty<OutlinedBorder?>? get containerShape;

  LoadingIndicatorStateProperty<Color?>? get containerColor;

  LoadingIndicatorStateProperty<OutlinePartial?>? get containerOutline;

  LoadingIndicatorStateProperty<Color?>? get activeIndicatorColor;

  LoadingIndicatorStateProperty<OutlinePartial?>? get activeIndicatorOutline;

  LoadingIndicatorThemeDataPartial copy() => copyWith();

  LoadingIndicatorThemeDataPartial copyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    covariant LoadingIndicatorStateProperty<Color?>? containerColor,
    covariant LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<OutlinePartial?>?
    activeIndicatorOutline,
  }) => .from(
    containerShape: containerShape ?? this.containerShape,
    containerColor: containerColor ?? this.containerColor,
    containerOutline: containerOutline ?? this.containerOutline,
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline:
        activeIndicatorOutline ?? this.activeIndicatorOutline,
  );

  LoadingIndicatorThemeDataPartial maybeCopyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    covariant LoadingIndicatorStateProperty<Color?>? containerColor,
    covariant LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<OutlinePartial?>?
    activeIndicatorOutline,
  }) =>
      containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          activeIndicatorColor != null ||
          activeIndicatorOutline != null
      ? copyWith(
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
        )
      : this;

  LoadingIndicatorThemeDataPartial mergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) => .from(
    containerShape: this.containerShape.maybeMergeNullable(containerShape),
    containerColor: this.containerColor.maybeMergeNullable(containerColor),
    containerOutline: this.containerOutline.maybeCombineNullable(
      containerOutline,
      OutlinePartial.combine,
    ),
    activeIndicatorColor: this.activeIndicatorColor.maybeMergeNullable(
      activeIndicatorColor,
    ),
    activeIndicatorOutline: this.activeIndicatorOutline.maybeCombineNullable(
      activeIndicatorOutline,
      OutlinePartial.combine,
    ),
  );

  LoadingIndicatorThemeDataPartial maybeMergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) =>
      containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          activeIndicatorColor != null ||
          activeIndicatorOutline != null
      ? .from(
          containerShape: this.containerShape.maybeMergeNullable(
            containerShape,
          ),
          containerColor: this.containerColor.maybeMergeNullable(
            containerColor,
          ),
          containerOutline: this.containerOutline.maybeCombineNullable(
            containerOutline,
            OutlinePartial.maybeCombine,
          ),
          activeIndicatorColor: this.activeIndicatorColor.maybeMergeNullable(
            activeIndicatorColor,
          ),
          activeIndicatorOutline: this.activeIndicatorOutline
              .maybeCombineNullable(
                activeIndicatorOutline,
                OutlinePartial.maybeCombine,
              ),
        )
      : this;

  LoadingIndicatorThemeDataPartial merge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? mergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
        )
      : copy();

  LoadingIndicatorThemeDataPartial maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeMergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
        )
      : this;

  bool get isEmpty =>
      containerShape == null &&
      containerColor == null &&
      containerOutline == null &&
      activeIndicatorColor == null &&
      activeIndicatorOutline == null;

  bool get isNotEmpty => !isEmpty;

  bool get isConcrete => false;

  LoadingIndicatorThemeData? get asConcrete => null;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<OutlinedBorder?>>(
          "containerShape",
          containerShape,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Color?>>(
          "containerColor",
          containerColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<OutlinePartial?>>(
          "containerOutline",
          containerOutline,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Color?>>(
          "activeIndicatorColor",
          activeIndicatorColor,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<OutlinePartial?>>(
          "activeIndicatorOutline",
          activeIndicatorOutline,
          defaultValue: null,
        ),
      );
  }
}

final class _LoadingIndicatorThemeDataPartial
    extends LoadingIndicatorThemeDataPartial {
  const _LoadingIndicatorThemeDataPartial({
    this.containerShape,
    this.containerColor,
    this.containerOutline,
    this.activeIndicatorColor,
    this.activeIndicatorOutline,
  });

  @override
  final LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape;

  @override
  final LoadingIndicatorStateProperty<Color?>? containerColor;

  @override
  final LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline;

  @override
  final LoadingIndicatorStateProperty<Color?>? activeIndicatorColor;

  @override
  final LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeDataPartial &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          containerOutline == other.containerOutline &&
          activeIndicatorColor == other.activeIndicatorColor &&
          activeIndicatorOutline == other.activeIndicatorOutline;

  @override
  int get hashCode => Object.hash(
    containerShape,
    containerColor,
    containerOutline,
    activeIndicatorColor,
    activeIndicatorOutline,
  );
}

abstract class LoadingIndicatorThemeData
    extends LoadingIndicatorThemeDataPartial {
  const LoadingIndicatorThemeData();

  const factory LoadingIndicatorThemeData.from({
    required LoadingIndicatorStateProperty<OutlinedBorder> containerShape,
    required LoadingIndicatorStateProperty<Color> containerColor,
    required LoadingIndicatorStateProperty<Outline> containerOutline,
    required LoadingIndicatorStateProperty<Color> activeIndicatorColor,
    required LoadingIndicatorStateProperty<Outline> activeIndicatorOutline,
  }) = _LoadingIndicatorThemeData;

  const factory LoadingIndicatorThemeData.defaults({
    required ColorThemeData colorTheme,
    required ShapeThemeData shapeTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) = _LoadingIndicatorThemeDataDefaults;

  factory LoadingIndicatorThemeData.defaultsOf(
    BuildContext context, {
    LoadingIndicatorThemeDataPartial? overrides,
  }) => .defaults(
    colorTheme: ColorTheme.of(context),
    shapeTheme: ShapeTheme.of(context),
    overrides: overrides,
  );

  @override
  LoadingIndicatorStateProperty<OutlinedBorder> get containerShape;

  @override
  LoadingIndicatorStateProperty<Color> get containerColor;

  @override
  LoadingIndicatorStateProperty<Outline> get containerOutline;

  @override
  LoadingIndicatorStateProperty<Color> get activeIndicatorColor;

  @override
  LoadingIndicatorStateProperty<Outline> get activeIndicatorOutline;

  @override
  LoadingIndicatorThemeData copy() => copyWith();

  @override
  LoadingIndicatorThemeData copyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder>? containerShape,
    covariant LoadingIndicatorStateProperty<Color>? containerColor,
    covariant LoadingIndicatorStateProperty<Outline>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<Outline>? activeIndicatorOutline,
  }) => .from(
    containerShape: containerShape ?? this.containerShape,
    containerColor: containerColor ?? this.containerColor,
    containerOutline: containerOutline ?? this.containerOutline,
    activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
    activeIndicatorOutline:
        activeIndicatorOutline ?? this.activeIndicatorOutline,
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder>? containerShape,
    covariant LoadingIndicatorStateProperty<Color>? containerColor,
    covariant LoadingIndicatorStateProperty<Outline>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<Outline>? activeIndicatorOutline,
  }) =>
      containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          activeIndicatorColor != null ||
          activeIndicatorOutline != null
      ? copyWith(
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
        )
      : this;

  @override
  LoadingIndicatorThemeData mergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) => .from(
    containerShape: this.containerShape.maybeMerge(containerShape),
    containerColor: this.containerColor.maybeMerge(containerColor),
    containerOutline: this.containerOutline.maybeCombine(
      containerOutline,
      Outline.combine,
    ),
    activeIndicatorColor: this.activeIndicatorColor.maybeMerge(
      activeIndicatorColor,
    ),
    activeIndicatorOutline: this.activeIndicatorOutline.maybeCombine(
      activeIndicatorOutline,
      Outline.combine,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeMergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) =>
      containerShape != null ||
          containerColor != null ||
          containerOutline != null ||
          activeIndicatorColor != null ||
          activeIndicatorOutline != null
      ? .from(
          containerShape: this.containerShape.maybeMerge(containerShape),
          containerColor: this.containerColor.maybeMerge(containerColor),
          containerOutline: this.containerOutline.maybeCombine(
            containerOutline,
            Outline.maybeCombine,
          ),
          activeIndicatorColor: this.activeIndicatorColor.maybeMerge(
            activeIndicatorColor,
          ),
          activeIndicatorOutline: this.activeIndicatorOutline.maybeCombine(
            activeIndicatorOutline,
            Outline.maybeCombine,
          ),
        )
      : this;

  @override
  LoadingIndicatorThemeData merge(LoadingIndicatorThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
        )
      : copy();

  @override
  LoadingIndicatorThemeData maybeMerge(
    LoadingIndicatorThemeDataPartial? other,
  ) => other != null
      ? maybeMergeWith(
          containerShape: other.containerShape,
          containerColor: other.containerColor,
          containerOutline: other.containerOutline,
          activeIndicatorColor: other.activeIndicatorColor,
          activeIndicatorOutline: other.activeIndicatorOutline,
        )
      : this;

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  bool get isConcrete => true;

  @override
  LoadingIndicatorThemeData get asConcrete => this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<OutlinedBorder>>(
          "containerShape",
          containerShape,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Color>>(
          "containerColor",
          containerColor,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Outline>>(
          "containerOutline",
          containerOutline,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Color>>(
          "activeIndicatorColor",
          activeIndicatorColor,
        ),
      )
      ..add(
        DiagnosticsProperty<LoadingIndicatorStateProperty<Outline>>(
          "activeIndicatorOutline",
          activeIndicatorOutline,
        ),
      );
  }
}

final class _LoadingIndicatorThemeData extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeData({
    required this.containerShape,
    required this.containerColor,
    required this.containerOutline,
    required this.activeIndicatorColor,
    required this.activeIndicatorOutline,
  });

  @override
  final LoadingIndicatorStateProperty<OutlinedBorder> containerShape;

  @override
  final LoadingIndicatorStateProperty<Color> containerColor;

  @override
  final LoadingIndicatorStateProperty<Outline> containerOutline;

  @override
  final LoadingIndicatorStateProperty<Color> activeIndicatorColor;

  @override
  final LoadingIndicatorStateProperty<Outline> activeIndicatorOutline;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeData &&
          containerShape == other.containerShape &&
          containerColor == other.containerColor &&
          containerOutline == other.containerOutline &&
          activeIndicatorColor == other.activeIndicatorColor &&
          activeIndicatorOutline == other.activeIndicatorOutline;

  @override
  int get hashCode => Object.hash(
    containerShape,
    containerColor,
    containerOutline,
    activeIndicatorColor,
    activeIndicatorOutline,
  );
}

final class _LoadingIndicatorThemeDataDefaults
    extends LoadingIndicatorThemeData {
  const _LoadingIndicatorThemeDataDefaults({
    required this._colorTheme,
    required this._shapeTheme,
    LoadingIndicatorThemeDataPartial? overrides,
  }) : _overrides = overrides ?? const .from();

  final ColorThemeData _colorTheme;
  final ShapeThemeData _shapeTheme;
  final LoadingIndicatorThemeDataPartial _overrides;

  @override
  LoadingIndicatorStateProperty<OutlinedBorder> get containerShape =>
      _LoadingIndicatorStateProperty(this, _resolveContainerShape);

  static OutlinedBorder _resolveContainerShape(
    LoadingIndicatorStates states,
    _LoadingIndicatorThemeDataDefaults defaults,
  ) =>
      defaults._shapeTheme.applyCorner(corner: defaults._shapeTheme.cornerFull);

  @override
  LoadingIndicatorStateProperty<Color> get containerColor =>
      _LoadingIndicatorStateProperty(this, _resolveContainerColor);

  static Color _resolveContainerColor(
    LoadingIndicatorStates states,
    _LoadingIndicatorThemeDataDefaults defaults,
  ) => states.isContained
      ? defaults._colorTheme.primaryContainer
      : Colors.transparent;

  @override
  LoadingIndicatorStateProperty<Outline> get containerOutline =>
      const .all(.from());

  @override
  LoadingIndicatorStateProperty<Color> get activeIndicatorColor =>
      _LoadingIndicatorStateProperty(this, _resolveActiveIndicatorColor);

  static Color _resolveActiveIndicatorColor(
    LoadingIndicatorStates states,
    _LoadingIndicatorThemeDataDefaults defaults,
  ) => states.isContained
      ? defaults._colorTheme.onPrimaryContainer
      : defaults._colorTheme.primary;

  @override
  LoadingIndicatorStateProperty<Outline> get activeIndicatorOutline =>
      const .all(.from());

  @override
  LoadingIndicatorThemeData copyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder>? containerShape,
    covariant LoadingIndicatorStateProperty<Color>? containerColor,
    covariant LoadingIndicatorStateProperty<Outline>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<Outline>? activeIndicatorOutline,
  }) => _LoadingIndicatorThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    overrides: _overrides.copyWith(
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeCopyWith({
    covariant LoadingIndicatorStateProperty<OutlinedBorder>? containerShape,
    covariant LoadingIndicatorStateProperty<Color>? containerColor,
    covariant LoadingIndicatorStateProperty<Outline>? containerOutline,
    covariant LoadingIndicatorStateProperty<Color>? activeIndicatorColor,
    covariant LoadingIndicatorStateProperty<Outline>? activeIndicatorOutline,
  }) =>
      containerShape != null &&
          containerColor != null &&
          containerOutline != null &&
          activeIndicatorColor != null &&
          activeIndicatorOutline != null
      ? .from(
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
        )
      : containerShape != null ||
            containerColor != null ||
            containerOutline != null ||
            activeIndicatorColor != null ||
            activeIndicatorOutline != null
      ? copyWith(
          containerShape: containerShape,
          containerColor: containerColor,
          containerOutline: containerOutline,
          activeIndicatorColor: activeIndicatorColor,
          activeIndicatorOutline: activeIndicatorOutline,
        )
      : this;

  @override
  LoadingIndicatorThemeData mergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) => _LoadingIndicatorThemeDataDefaults(
    colorTheme: _colorTheme,
    shapeTheme: _shapeTheme,
    overrides: _overrides.mergeWith(
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
    ),
  );

  @override
  LoadingIndicatorThemeData maybeMergeWith({
    LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,
    LoadingIndicatorStateProperty<Color?>? containerColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,
    LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,
    LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,
  }) {
    final overrides = _overrides.maybeMergeWith(
      containerShape: containerShape,
      containerColor: containerColor,
      containerOutline: containerOutline,
      activeIndicatorColor: activeIndicatorColor,
      activeIndicatorOutline: activeIndicatorOutline,
    );
    return identical(_overrides, overrides)
        ? this
        : _LoadingIndicatorThemeDataDefaults(
            colorTheme: _colorTheme,
            shapeTheme: _shapeTheme,
            overrides: overrides,
          );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorThemeDataDefaults &&
          _colorTheme == other._colorTheme &&
          _shapeTheme == other._shapeTheme &&
          _overrides == other._overrides;

  @override
  int get hashCode => Object.hash(_colorTheme, _shapeTheme, _overrides);
}

final class _LoadingIndicatorStateProperty<T extends Object?>
    implements LoadingIndicatorStateProperty<T> {
  const _LoadingIndicatorStateProperty(this._defaults, this._resolve);

  final _LoadingIndicatorThemeDataDefaults _defaults;
  final T Function(
    LoadingIndicatorStates states,
    _LoadingIndicatorThemeDataDefaults defaults,
  )
  _resolve;

  @override
  T resolve(LoadingIndicatorStates states) => _resolve(states, _defaults);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorStateProperty<T> &&
          _defaults == other._defaults &&
          _resolve == other._resolve;

  @override
  int get hashCode => Object.hash(_defaults, _resolve);
}

abstract class LoadingIndicatorTheme extends SingleChildStatelessWidget {
  const LoadingIndicatorTheme._({super.key, super.child});

  const factory LoadingIndicatorTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<LoadingIndicatorThemeDataPartial> resolver,
    Widget? child,
  }) = _LoadingIndicatorThemeWithResolver<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<LoadingIndicatorThemeDataPartial> callback,
    Widget? child,
  }) = _LoadingIndicatorThemeWithCallback<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.mergeWithData({
    Key? key,
    required LoadingIndicatorThemeDataPartial data,
    Widget? child,
  }) = _LoadingIndicatorThemeWithData<LoadingIndicatorThemeDataPartial>;

  const factory LoadingIndicatorTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<LoadingIndicatorThemeData> resolver,
    Widget? child,
  }) = _LoadingIndicatorThemeWithResolver<LoadingIndicatorThemeData>;

  const factory LoadingIndicatorTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<LoadingIndicatorThemeData> callback,
    Widget? child,
  }) = _LoadingIndicatorThemeWithCallback<LoadingIndicatorThemeData>;

  const factory LoadingIndicatorTheme.replaceWithData({
    Key? key,
    required LoadingIndicatorThemeData data,
    Widget? child,
  }) = _LoadingIndicatorThemeWithData<LoadingIndicatorThemeData>;

  ThemeResolver<LoadingIndicatorThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _LoadingIndicatorTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

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
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _LoadingIndicatorThemeWithResolver(
        key: key,
        resolver: resolver,
        child: child,
      );

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
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _LoadingIndicatorThemeWithCallback(
        key: key,
        callback: callback,
        child: child,
      );

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
    super.child,
  }) : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _LoadingIndicatorThemeWithData(key: key, data: data, child: child);

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
  bool isConcrete(LoadingIndicatorThemeDataPartial data) => data.isConcrete;

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
