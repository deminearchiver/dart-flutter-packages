import 'package:material/src/material/flutter.dart';

abstract class DurationThemeDataPartial with Diagnosticable {
  const DurationThemeDataPartial();

  const factory DurationThemeDataPartial.from({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) = _DurationThemeDataPartial;

  Duration? get short1;

  Duration? get short2;

  Duration? get short3;

  Duration? get short4;

  Duration? get medium1;

  Duration? get medium2;

  Duration? get medium3;

  Duration? get medium4;

  Duration? get long1;

  Duration? get long2;

  Duration? get long3;

  Duration? get long4;

  Duration? get extraLong1;

  Duration? get extraLong2;

  Duration? get extraLong3;

  Duration? get extraLong4;

  DurationThemeDataPartial copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null ||
          short2 != null ||
          short3 != null ||
          short4 != null ||
          medium1 != null ||
          medium2 != null ||
          medium3 != null ||
          medium4 != null ||
          long1 != null ||
          long2 != null ||
          long3 != null ||
          long4 != null ||
          extraLong1 != null ||
          extraLong2 != null ||
          extraLong3 != null ||
          extraLong4 != null
      ? .from(
          short1: short1 ?? this.short1,
          short2: short2 ?? this.short2,
          short3: short3 ?? this.short3,
          short4: short4 ?? this.short4,
          medium1: medium1 ?? this.medium1,
          medium2: medium2 ?? this.medium2,
          medium3: medium3 ?? this.medium3,
          medium4: medium4 ?? this.medium4,
          long1: long1 ?? this.long1,
          long2: long2 ?? this.long2,
          long3: long3 ?? this.long3,
          long4: long4 ?? this.long4,
          extraLong1: extraLong1 ?? this.extraLong1,
          extraLong2: extraLong2 ?? this.extraLong2,
          extraLong3: extraLong3 ?? this.extraLong3,
          extraLong4: extraLong4 ?? this.extraLong4,
        )
      : this;

  DurationThemeDataPartial merge(DurationThemeDataPartial? other) =>
      other != null
      ? copyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Duration>("short1", short1, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short2", short2, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short3", short3, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("short4", short4, defaultValue: null))
      ..add(
        DiagnosticsProperty<Duration>("medium1", medium1, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium2", medium2, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium3", medium3, defaultValue: null),
      )
      ..add(
        DiagnosticsProperty<Duration>("medium4", medium4, defaultValue: null),
      )
      ..add(DiagnosticsProperty<Duration>("long1", long1, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long2", long2, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long3", long3, defaultValue: null))
      ..add(DiagnosticsProperty<Duration>("long4", long4, defaultValue: null))
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong1",
          extraLong1,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong2",
          extraLong2,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong3",
          extraLong3,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "extraLong4",
          extraLong4,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DurationThemeDataPartial &&
          short1 == other.short1 &&
          short2 == other.short2 &&
          short3 == other.short3 &&
          short4 == other.short4 &&
          medium1 == other.medium1 &&
          medium2 == other.medium2 &&
          medium3 == other.medium3 &&
          medium4 == other.medium4 &&
          long1 == other.long1 &&
          long2 == other.long2 &&
          long3 == other.long3 &&
          long4 == other.long4 &&
          extraLong1 == other.extraLong1 &&
          extraLong2 == other.extraLong2 &&
          extraLong3 == other.extraLong3 &&
          extraLong4 == other.extraLong4;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

class _DurationThemeDataPartial extends DurationThemeDataPartial {
  const _DurationThemeDataPartial({
    this.short1,
    this.short2,
    this.short3,
    this.short4,
    this.medium1,
    this.medium2,
    this.medium3,
    this.medium4,
    this.long1,
    this.long2,
    this.long3,
    this.long4,
    this.extraLong1,
    this.extraLong2,
    this.extraLong3,
    this.extraLong4,
  });

  @override
  final Duration? short1;

  @override
  final Duration? short2;

  @override
  final Duration? short3;

  @override
  final Duration? short4;

  @override
  final Duration? medium1;

  @override
  final Duration? medium2;

  @override
  final Duration? medium3;

  @override
  final Duration? medium4;

  @override
  final Duration? long1;

  @override
  final Duration? long2;

  @override
  final Duration? long3;

  @override
  final Duration? long4;

  @override
  final Duration? extraLong1;

  @override
  final Duration? extraLong2;

  @override
  final Duration? extraLong3;

  @override
  final Duration? extraLong4;
}

abstract class DurationThemeData extends DurationThemeDataPartial {
  const DurationThemeData();

  const factory DurationThemeData.from({
    required Duration short1,
    required Duration short2,
    required Duration short3,
    required Duration short4,
    required Duration medium1,
    required Duration medium2,
    required Duration medium3,
    required Duration medium4,
    required Duration long1,
    required Duration long2,
    required Duration long3,
    required Duration long4,
    required Duration extraLong1,
    required Duration extraLong2,
    required Duration extraLong3,
    required Duration extraLong4,
  }) = _DurationThemeData;

  const factory DurationThemeData.defaults() = _DurationThemeDataDefaults;

  const factory DurationThemeData._defaults({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) = _DurationThemeDataDefaults;

  @override
  Duration get short1;

  @override
  Duration get short2;

  @override
  Duration get short3;

  @override
  Duration get short4;

  @override
  Duration get medium1;

  @override
  Duration get medium2;

  @override
  Duration get medium3;

  @override
  Duration get medium4;

  @override
  Duration get long1;

  @override
  Duration get long2;

  @override
  Duration get long3;

  @override
  Duration get long4;

  @override
  Duration get extraLong1;

  @override
  Duration get extraLong2;

  @override
  Duration get extraLong3;

  @override
  Duration get extraLong4;

  @override
  DurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null ||
          short2 != null ||
          short3 != null ||
          short4 != null ||
          medium1 != null ||
          medium2 != null ||
          medium3 != null ||
          medium4 != null ||
          long1 != null ||
          long2 != null ||
          long3 != null ||
          long4 != null ||
          extraLong1 != null ||
          extraLong2 != null ||
          extraLong3 != null ||
          extraLong4 != null
      ? .from(
          short1: short1 ?? this.short1,
          short2: short2 ?? this.short2,
          short3: short3 ?? this.short3,
          short4: short4 ?? this.short4,
          medium1: medium1 ?? this.medium1,
          medium2: medium2 ?? this.medium2,
          medium3: medium3 ?? this.medium3,
          medium4: medium4 ?? this.medium4,
          long1: long1 ?? this.long1,
          long2: long2 ?? this.long2,
          long3: long3 ?? this.long3,
          long4: long4 ?? this.long4,
          extraLong1: extraLong1 ?? this.extraLong1,
          extraLong2: extraLong2 ?? this.extraLong2,
          extraLong3: extraLong3 ?? this.extraLong3,
          extraLong4: extraLong4 ?? this.extraLong4,
        )
      : this;

  @override
  DurationThemeData merge(DurationThemeDataPartial? other) => other != null
      ? copyWith(
          short1: other.short1,
          short2: other.short2,
          short3: other.short3,
          short4: other.short4,
          medium1: other.medium1,
          medium2: other.medium2,
          medium3: other.medium3,
          medium4: other.medium4,
          long1: other.long1,
          long2: other.long2,
          long3: other.long3,
          long4: other.long4,
          extraLong1: other.extraLong1,
          extraLong2: other.extraLong2,
          extraLong3: other.extraLong3,
          extraLong4: other.extraLong4,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<Duration>("short1", short1))
      ..add(DiagnosticsProperty<Duration>("short2", short2))
      ..add(DiagnosticsProperty<Duration>("short3", short3))
      ..add(DiagnosticsProperty<Duration>("short4", short4))
      ..add(DiagnosticsProperty<Duration>("medium1", medium1))
      ..add(DiagnosticsProperty<Duration>("medium2", medium2))
      ..add(DiagnosticsProperty<Duration>("medium3", medium3))
      ..add(DiagnosticsProperty<Duration>("medium4", medium4))
      ..add(DiagnosticsProperty<Duration>("long1", long1))
      ..add(DiagnosticsProperty<Duration>("long2", long2))
      ..add(DiagnosticsProperty<Duration>("long3", long3))
      ..add(DiagnosticsProperty<Duration>("long4", long4))
      ..add(DiagnosticsProperty<Duration>("extraLong1", extraLong1))
      ..add(DiagnosticsProperty<Duration>("extraLong2", extraLong2))
      ..add(DiagnosticsProperty<Duration>("extraLong3", extraLong3))
      ..add(DiagnosticsProperty<Duration>("extraLong4", extraLong4));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DurationThemeData &&
          short1 == other.short1 &&
          short2 == other.short2 &&
          short3 == other.short3 &&
          short4 == other.short4 &&
          medium1 == other.medium1 &&
          medium2 == other.medium2 &&
          medium3 == other.medium3 &&
          medium4 == other.medium4 &&
          long1 == other.long1 &&
          long2 == other.long2 &&
          long3 == other.long3 &&
          long4 == other.long4 &&
          extraLong1 == other.extraLong1 &&
          extraLong2 == other.extraLong2 &&
          extraLong3 == other.extraLong3 &&
          extraLong4 == other.extraLong4;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

class _DurationThemeData extends DurationThemeData {
  const _DurationThemeData({
    required this.short1,
    required this.short2,
    required this.short3,
    required this.short4,
    required this.medium1,
    required this.medium2,
    required this.medium3,
    required this.medium4,
    required this.long1,
    required this.long2,
    required this.long3,
    required this.long4,
    required this.extraLong1,
    required this.extraLong2,
    required this.extraLong3,
    required this.extraLong4,
  });

  @override
  final Duration short1;

  @override
  final Duration short2;

  @override
  final Duration short3;

  @override
  final Duration short4;

  @override
  final Duration medium1;

  @override
  final Duration medium2;

  @override
  final Duration medium3;

  @override
  final Duration medium4;

  @override
  final Duration long1;

  @override
  final Duration long2;

  @override
  final Duration long3;

  @override
  final Duration long4;

  @override
  final Duration extraLong1;

  @override
  final Duration extraLong2;

  @override
  final Duration extraLong3;

  @override
  final Duration extraLong4;
}

class _DurationThemeDataDefaults extends DurationThemeData {
  const _DurationThemeDataDefaults({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) : _short1 = short1,
       _short2 = short2,
       _short3 = short3,
       _short4 = short4,
       _medium1 = medium1,
       _medium2 = medium2,
       _medium3 = medium3,
       _medium4 = medium4,
       _long1 = long1,
       _long2 = long2,
       _long3 = long3,
       _long4 = long4,
       _extraLong1 = extraLong1,
       _extraLong2 = extraLong2,
       _extraLong3 = extraLong3,
       _extraLong4 = extraLong4;

  final Duration? _short1;
  final Duration? _short2;
  final Duration? _short3;
  final Duration? _short4;
  final Duration? _medium1;
  final Duration? _medium2;
  final Duration? _medium3;
  final Duration? _medium4;
  final Duration? _long1;
  final Duration? _long2;
  final Duration? _long3;
  final Duration? _long4;
  final Duration? _extraLong1;
  final Duration? _extraLong2;
  final Duration? _extraLong3;
  final Duration? _extraLong4;

  @override
  Duration get short1 => _short1 ?? const .new(milliseconds: 50);

  @override
  Duration get short2 => _short2 ?? const .new(milliseconds: 100);

  @override
  Duration get short3 => _short3 ?? const .new(milliseconds: 150);

  @override
  Duration get short4 => _short4 ?? const .new(milliseconds: 200);

  @override
  Duration get medium1 => _medium1 ?? const .new(milliseconds: 250);

  @override
  Duration get medium2 => _medium2 ?? const .new(milliseconds: 300);

  @override
  Duration get medium3 => _medium3 ?? const .new(milliseconds: 350);

  @override
  Duration get medium4 => _medium4 ?? const .new(milliseconds: 400);

  @override
  Duration get long1 => _long1 ?? const .new(milliseconds: 450);

  @override
  Duration get long2 => _long2 ?? const .new(milliseconds: 500);

  @override
  Duration get long3 => _long3 ?? const .new(milliseconds: 550);

  @override
  Duration get long4 => _long4 ?? const .new(milliseconds: 600);

  @override
  Duration get extraLong1 => _extraLong1 ?? const .new(milliseconds: 700);

  @override
  Duration get extraLong2 => _extraLong2 ?? const .new(milliseconds: 800);

  @override
  Duration get extraLong3 => _extraLong3 ?? const .new(milliseconds: 900);

  @override
  Duration get extraLong4 => _extraLong4 ?? const .new(milliseconds: 1000);

  @override
  DurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) =>
      short1 != null &&
          short2 != null &&
          short3 != null &&
          short4 != null &&
          medium1 != null &&
          medium2 != null &&
          medium3 != null &&
          medium4 != null &&
          long1 != null &&
          long2 != null &&
          long3 != null &&
          long4 != null &&
          extraLong1 != null &&
          extraLong2 != null &&
          extraLong3 != null &&
          extraLong4 != null
      ? .from(
          short1: short1,
          short2: short2,
          short3: short3,
          short4: short4,
          medium1: medium1,
          medium2: medium2,
          medium3: medium3,
          medium4: medium4,
          long1: long1,
          long2: long2,
          long3: long3,
          long4: long4,
          extraLong1: extraLong1,
          extraLong2: extraLong2,
          extraLong3: extraLong3,
          extraLong4: extraLong4,
        )
      : _DurationThemeDataDefaults(
          short1: short1 ?? _short1,
          short2: short2 ?? _short2,
          short3: short3 ?? _short3,
          short4: short4 ?? _short4,
          medium1: medium1 ?? _medium1,
          medium2: medium2 ?? _medium2,
          medium3: medium3 ?? _medium3,
          medium4: medium4 ?? _medium4,
          long1: long1 ?? _long1,
          long2: long2 ?? _long2,
          long3: long3 ?? _long3,
          long4: long4 ?? _long4,
          extraLong1: extraLong1 ?? _extraLong1,
          extraLong2: extraLong2 ?? _extraLong2,
          extraLong3: extraLong3 ?? _extraLong3,
          extraLong4: extraLong4 ?? _extraLong4,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _DurationThemeDataDefaults &&
          _short1 == other._short1 &&
          _short2 == other._short2 &&
          _short3 == other._short3 &&
          _short4 == other._short4 &&
          _medium1 == other._medium1 &&
          _medium2 == other._medium2 &&
          _medium3 == other._medium3 &&
          _medium4 == other._medium4 &&
          _long1 == other._long1 &&
          _long2 == other._long2 &&
          _long3 == other._long3 &&
          _long4 == other._long4 &&
          _extraLong1 == other._extraLong1 &&
          _extraLong2 == other._extraLong2 &&
          _extraLong3 == other._extraLong3 &&
          _extraLong4 == other._extraLong4;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _short1,
    _short2,
    _short3,
    _short4,
    _medium1,
    _medium2,
    _medium3,
    _medium4,
    _long1,
    _long2,
    _long3,
    _long4,
    _extraLong1,
    _extraLong2,
    _extraLong3,
    _extraLong4,
  );
}

typedef DurationThemeResolver = ThemeResolver<DurationThemeDataPartial>;

typedef DurationThemeResolverCallback =
    ThemeResolverCallback<DurationThemeDataPartial>;

class _DurationThemeResolver
    extends CombiningThemeResolver<DurationThemeDataPartial> {
  const _DurationThemeResolver(super.a, super.b);

  @override
  DurationThemeDataPartial combine(
    DurationThemeDataPartial a,
    DurationThemeDataPartial b,
  ) => a.merge(b);
}

abstract class DurationTheme extends StatelessWidget implements ProxyWidget {
  const DurationTheme._({super.key, required this.child});

  const factory DurationTheme.withResolver({
    Key? key,
    required DurationThemeResolver resolver,
    required Widget child,
  }) = _DurationThemeWithResolver;

  const factory DurationTheme.withCallback({
    Key? key,
    required DurationThemeResolverCallback callback,
    required Widget child,
  }) = _DurationThemeWithCallback;

  const factory DurationTheme.withData({
    Key? key,
    required DurationThemeDataPartial data,
    required Widget child,
  }) = _DurationThemeWithData;

  DurationThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _DurationTheme.maybeResolverOf(context);
    return _DurationTheme(
      resolver: inherited != null
          ? _DurationThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static DurationThemeData of(BuildContext context) {
    final resolver = _DurationTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        short1: data.short1,
        short2: data.short2,
        short3: data.short3,
        short4: data.short4,
        medium1: data.medium1,
        medium2: data.medium2,
        medium3: data.medium3,
        medium4: data.medium4,
        long1: data.long1,
        long2: data.long2,
        long3: data.long3,
        long4: data.long4,
        extraLong1: data.extraLong1,
        extraLong2: data.extraLong2,
        extraLong3: data.extraLong3,
        extraLong4: data.extraLong4,
      );
    }
    return const .defaults();
  }
}

class _DurationThemeWithResolver extends DurationTheme {
  const _DurationThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final DurationThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<DurationThemeResolver>("resolver", resolver),
    );
  }
}

class _DurationThemeWithCallback extends DurationTheme {
  const _DurationThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final DurationThemeResolverCallback callback;

  @override
  DurationThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<DurationThemeResolverCallback>("callback", callback),
    );
  }
}

class _DurationThemeWithData extends DurationTheme {
  const _DurationThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final DurationThemeDataPartial data;

  @override
  DurationThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DurationThemeDataPartial>("data", data));
  }
}

class _DurationTheme extends InheritedTheme {
  const _DurationTheme({
    super.key,
    required this.resolver,
    required super.child,
  });

  final DurationThemeResolver resolver;

  @override
  bool updateShouldNotify(_DurationTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _DurationTheme(resolver: resolver, child: child);

  static DurationThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_DurationTheme>()?.resolver;
}
