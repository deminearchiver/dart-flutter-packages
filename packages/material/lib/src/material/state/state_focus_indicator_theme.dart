import 'package:material/src/material/flutter.dart';

abstract class StateFocusIndicatorThemeDataPartial with Diagnosticable {
  const StateFocusIndicatorThemeDataPartial();

  const factory StateFocusIndicatorThemeDataPartial.from({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) = _StateFocusIndicatorThemeDataPartial;

  double? get innerOffset;

  double? get outerOffset;

  double? get thickness;

  StateFocusIndicatorThemeDataPartial copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null || outerOffset != null || thickness != null
      ? .from(
          innerOffset: innerOffset ?? this.innerOffset,
          outerOffset: outerOffset ?? this.outerOffset,
          thickness: thickness ?? this.thickness,
        )
      : this;

  StateFocusIndicatorThemeDataPartial merge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? copyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("innerOffset", innerOffset, defaultValue: null))
      ..add(DoubleProperty("outerOffset", outerOffset, defaultValue: null))
      ..add(DoubleProperty("thickness", thickness, defaultValue: null));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateFocusIndicatorThemeDataPartial &&
          innerOffset == other.innerOffset &&
          outerOffset == other.outerOffset &&
          thickness == other.thickness;

  @override
  int get hashCode =>
      Object.hash(runtimeType, innerOffset, outerOffset, thickness);
}

class _StateFocusIndicatorThemeDataPartial
    extends StateFocusIndicatorThemeDataPartial {
  const _StateFocusIndicatorThemeDataPartial({
    this.innerOffset,
    this.outerOffset,
    this.thickness,
  });

  @override
  final double? innerOffset;

  @override
  final double? outerOffset;

  @override
  final double? thickness;
}

abstract class StateFocusIndicatorThemeData
    extends StateFocusIndicatorThemeDataPartial {
  const StateFocusIndicatorThemeData();

  const factory StateFocusIndicatorThemeData.from({
    required double innerOffset,
    required double outerOffset,
    required double thickness,
  }) = _StateFocusIndicatorThemeData;

  const factory StateFocusIndicatorThemeData.fallback() =
      _StateFocusIndicatorThemeData.fallback;

  @override
  double get innerOffset;

  @override
  double get outerOffset;

  @override
  double get thickness;

  @override
  StateFocusIndicatorThemeData copyWith({
    double? innerOffset,
    double? outerOffset,
    double? thickness,
  }) => innerOffset != null || outerOffset != null || thickness != null
      ? .from(
          innerOffset: innerOffset ?? this.innerOffset,
          outerOffset: outerOffset ?? this.outerOffset,
          thickness: thickness ?? this.thickness,
        )
      : this;

  @override
  StateFocusIndicatorThemeData merge(
    StateFocusIndicatorThemeDataPartial? other,
  ) => other != null
      ? copyWith(
          innerOffset: other.innerOffset,
          outerOffset: other.outerOffset,
          thickness: other.thickness,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("innerOffset", innerOffset))
      ..add(DoubleProperty("outerOffset", outerOffset))
      ..add(DoubleProperty("thickness", thickness));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StateFocusIndicatorThemeData &&
          innerOffset == other.innerOffset &&
          outerOffset == other.outerOffset &&
          thickness == other.thickness;

  @override
  int get hashCode =>
      Object.hash(runtimeType, innerOffset, outerOffset, thickness);
}

class _StateFocusIndicatorThemeData extends StateFocusIndicatorThemeData {
  const _StateFocusIndicatorThemeData({
    required this.innerOffset,
    required this.outerOffset,
    required this.thickness,
  });

  const _StateFocusIndicatorThemeData.fallback()
    : innerOffset = -3.0,
      outerOffset = 2.0,
      thickness = 3.0;

  @override
  final double innerOffset;

  @override
  final double outerOffset;

  @override
  final double thickness;
}

class StateFocusIndicatorTheme extends InheritedTheme {
  const StateFocusIndicatorTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final StateFocusIndicatorThemeData data;

  @override
  bool updateShouldNotify(StateFocusIndicatorTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      StateFocusIndicatorTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<StateFocusIndicatorThemeData>("data", data),
    );
  }

  static Widget merge({
    Key? key,
    required StateFocusIndicatorThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) => StateFocusIndicatorTheme(
      key: key,
      data: of(context).merge(data),
      child: child,
    ),
  );

  static StateFocusIndicatorThemeData? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateFocusIndicatorTheme>()
      ?.data;

  static StateFocusIndicatorThemeData of(BuildContext context) =>
      maybeOf(context) ?? const .fallback();
}
