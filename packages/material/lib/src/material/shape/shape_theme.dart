import 'package:material/src/material/flutter.dart';

abstract class ShapeThemeDataPartial with Diagnosticable {
  const ShapeThemeDataPartial();

  const factory ShapeThemeDataPartial.from({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) = _ShapeThemeDataPartial;

  double? get cornerValueNone;
  double? get cornerValueExtraSmall;
  double? get cornerValueSmall;
  double? get cornerValueMedium;
  double? get cornerValueLarge;
  double? get cornerValueLargeIncreased;
  double? get cornerValueExtraLarge;
  double? get cornerValueExtraLargeIncreased;
  double? get cornerValueExtraExtraLarge;
  Corner? get cornerNone;
  Corner? get cornerExtraSmall;
  CornersGeometry? get cornerExtraSmallTop;
  Corner? get cornerSmall;
  Corner? get cornerMedium;
  Corner? get cornerLarge;
  CornersGeometry? get cornerLargeStart;
  CornersGeometry? get cornerLargeEnd;
  CornersGeometry? get cornerLargeTop;
  Corner? get cornerLargeIncreased;
  Corner? get cornerExtraLarge;
  CornersGeometry? get cornerExtraLargeTop;
  Corner? get cornerExtraLargeIncreased;
  Corner? get cornerExtraExtraLarge;
  Corner? get cornerFull;

  ShapeThemeDataPartial copyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) =>
      cornerValueNone != null ||
          cornerValueExtraSmall != null ||
          cornerValueSmall != null ||
          cornerValueMedium != null ||
          cornerValueLarge != null ||
          cornerValueLargeIncreased != null ||
          cornerValueExtraLarge != null ||
          cornerValueExtraLargeIncreased != null ||
          cornerValueExtraExtraLarge != null ||
          cornerNone != null ||
          cornerExtraSmall != null ||
          cornerExtraSmallTop != null ||
          cornerSmall != null ||
          cornerMedium != null ||
          cornerLarge != null ||
          cornerLargeStart != null ||
          cornerLargeEnd != null ||
          cornerLargeTop != null ||
          cornerLargeIncreased != null ||
          cornerExtraLarge != null ||
          cornerExtraLargeTop != null ||
          cornerExtraLargeIncreased != null ||
          cornerExtraExtraLarge != null ||
          cornerFull != null
      ? .from(
          cornerValueNone: cornerValueNone ?? this.cornerValueNone,
          cornerValueExtraSmall:
              cornerValueExtraSmall ?? this.cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall ?? this.cornerValueSmall,
          cornerValueMedium: cornerValueMedium ?? this.cornerValueMedium,
          cornerValueLarge: cornerValueLarge ?? this.cornerValueLarge,
          cornerValueLargeIncreased:
              cornerValueLargeIncreased ?? this.cornerValueLargeIncreased,
          cornerValueExtraLarge:
              cornerValueExtraLarge ?? this.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased:
              cornerValueExtraLargeIncreased ??
              this.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge:
              cornerValueExtraExtraLarge ?? this.cornerValueExtraExtraLarge,
          cornerNone: cornerNone ?? this.cornerNone,
          cornerExtraSmall: cornerExtraSmall ?? this.cornerExtraSmall,
          cornerExtraSmallTop: cornerExtraSmallTop ?? this.cornerExtraSmallTop,
          cornerSmall: cornerSmall ?? this.cornerSmall,
          cornerMedium: cornerMedium ?? this.cornerMedium,
          cornerLarge: cornerLarge ?? this.cornerLarge,
          cornerLargeStart: cornerLargeStart ?? this.cornerLargeStart,
          cornerLargeEnd: cornerLargeEnd ?? this.cornerLargeEnd,
          cornerLargeTop: cornerLargeTop ?? this.cornerLargeTop,
          cornerLargeIncreased:
              cornerLargeIncreased ?? this.cornerLargeIncreased,
          cornerExtraLarge: cornerExtraLarge ?? this.cornerExtraLarge,
          cornerExtraLargeTop: cornerExtraLargeTop ?? this.cornerExtraLargeTop,
          cornerExtraLargeIncreased:
              cornerExtraLargeIncreased ?? this.cornerExtraLargeIncreased,
          cornerExtraExtraLarge:
              cornerExtraExtraLarge ?? this.cornerExtraExtraLarge,
          cornerFull: cornerFull ?? this.cornerFull,
        )
      : this;

  ShapeThemeDataPartial mergeWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) => copyWith(
    cornerValueNone: cornerValueNone,
    cornerValueExtraSmall: cornerValueExtraSmall,
    cornerValueSmall: cornerValueSmall,
    cornerValueMedium: cornerValueMedium,
    cornerValueLarge: cornerValueLarge,
    cornerValueLargeIncreased: cornerValueLargeIncreased,
    cornerValueExtraLarge: cornerValueExtraLarge,
    cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
    cornerNone: cornerNone,
    cornerExtraSmall: cornerExtraSmall,
    cornerExtraSmallTop: cornerExtraSmallTop,
    cornerSmall: cornerSmall,
    cornerMedium: cornerMedium,
    cornerLarge: cornerLarge,
    cornerLargeStart: cornerLargeStart,
    cornerLargeEnd: cornerLargeEnd,
    cornerLargeTop: cornerLargeTop,
    cornerLargeIncreased: cornerLargeIncreased,
    cornerExtraLarge: cornerExtraLarge,
    cornerExtraLargeTop: cornerExtraLargeTop,
    cornerExtraLargeIncreased: cornerExtraLargeIncreased,
    cornerExtraExtraLarge: cornerExtraExtraLarge,
    cornerFull: cornerFull,
  );

  ShapeThemeDataPartial merge(ShapeThemeDataPartial? other) => other != null
      ? mergeWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerNone: other.cornerNone,
          cornerExtraSmall: other.cornerExtraSmall,
          cornerExtraSmallTop: other.cornerExtraSmallTop,
          cornerSmall: other.cornerSmall,
          cornerMedium: other.cornerMedium,
          cornerLarge: other.cornerLarge,
          cornerLargeStart: other.cornerLargeStart,
          cornerLargeEnd: other.cornerLargeEnd,
          cornerLargeTop: other.cornerLargeTop,
          cornerLargeIncreased: other.cornerLargeIncreased,
          cornerExtraLarge: other.cornerExtraLarge,
          cornerExtraLargeTop: other.cornerExtraLargeTop,
          cornerExtraLargeIncreased: other.cornerExtraLargeIncreased,
          cornerExtraExtraLarge: other.cornerExtraExtraLarge,
          cornerFull: other.cornerFull,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DoubleProperty("cornerValueNone", cornerValueNone, defaultValue: null),
      )
      ..add(
        DoubleProperty(
          "cornerValueExtraSmall",
          cornerValueExtraSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueSmall",
          cornerValueSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueMedium",
          cornerValueMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueLarge",
          cornerValueLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueLargeIncreased",
          cornerValueLargeIncreased,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueExtraLarge",
          cornerValueExtraLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueExtraLargeIncreased",
          cornerValueExtraLargeIncreased,
          defaultValue: null,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueExtraExtraLarge",
          cornerValueExtraExtraLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerNone",
          cornerNone,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraSmall",
          cornerExtraSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerExtraSmallTop",
          cornerExtraSmallTop,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerSmall",
          cornerSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerMedium",
          cornerMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerLarge",
          cornerLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerLargeStart",
          cornerLargeStart,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerLargeEnd",
          cornerLargeEnd,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerLargeTop",
          cornerLargeTop,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerLargeIncreased",
          cornerLargeIncreased,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraLarge",
          cornerExtraLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerExtraLargeTop",
          cornerExtraLargeTop,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraLargeIncreased",
          cornerExtraLargeIncreased,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraExtraLarge",
          cornerExtraExtraLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerFull",
          cornerFull,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ShapeThemeDataPartial &&
          cornerValueNone == other.cornerValueNone &&
          cornerValueExtraSmall == other.cornerValueExtraSmall &&
          cornerValueSmall == other.cornerValueSmall &&
          cornerValueMedium == other.cornerValueMedium &&
          cornerValueLarge == other.cornerValueLarge &&
          cornerValueLargeIncreased == other.cornerValueLargeIncreased &&
          cornerValueExtraLarge == other.cornerValueExtraLarge &&
          cornerValueExtraLargeIncreased ==
              other.cornerValueExtraLargeIncreased &&
          cornerValueExtraExtraLarge == other.cornerValueExtraExtraLarge &&
          cornerNone == other.cornerNone &&
          cornerExtraSmall == other.cornerExtraSmall &&
          cornerExtraSmallTop == other.cornerExtraSmallTop &&
          cornerSmall == other.cornerSmall &&
          cornerMedium == other.cornerMedium &&
          cornerLarge == other.cornerLarge &&
          cornerLargeStart == other.cornerLargeStart &&
          cornerLargeEnd == other.cornerLargeEnd &&
          cornerLargeTop == other.cornerLargeTop &&
          cornerLargeIncreased == other.cornerLargeIncreased &&
          cornerExtraLarge == other.cornerExtraLarge &&
          cornerExtraLargeTop == other.cornerExtraLargeTop &&
          cornerExtraLargeIncreased == other.cornerExtraLargeIncreased &&
          cornerExtraExtraLarge == other.cornerExtraExtraLarge &&
          cornerFull == other.cornerFull;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    cornerValueNone,
    cornerValueExtraSmall,
    cornerValueSmall,
    cornerValueMedium,
    cornerValueLarge,
    cornerValueLargeIncreased,
    cornerValueExtraLarge,
    cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge,
    cornerNone,
    cornerExtraSmall,
    cornerExtraSmallTop,
    cornerSmall,
    cornerMedium,
    cornerLarge,
    cornerLargeStart,
    cornerLargeEnd,
    cornerLargeTop,
    Object.hash(
      cornerLargeIncreased,
      cornerExtraLarge,
      cornerExtraLargeTop,
      cornerExtraLargeIncreased,
      cornerExtraExtraLarge,
      cornerFull,
    ),
  );
}

class _ShapeThemeDataPartial extends ShapeThemeDataPartial {
  const _ShapeThemeDataPartial({
    this.cornerValueNone,
    this.cornerValueExtraSmall,
    this.cornerValueSmall,
    this.cornerValueMedium,
    this.cornerValueLarge,
    this.cornerValueLargeIncreased,
    this.cornerValueExtraLarge,
    this.cornerValueExtraLargeIncreased,
    this.cornerValueExtraExtraLarge,
    this.cornerNone,
    this.cornerExtraSmall,
    this.cornerExtraSmallTop,
    this.cornerSmall,
    this.cornerMedium,
    this.cornerLarge,
    this.cornerLargeStart,
    this.cornerLargeEnd,
    this.cornerLargeTop,
    this.cornerLargeIncreased,
    this.cornerExtraLarge,
    this.cornerExtraLargeTop,
    this.cornerExtraLargeIncreased,
    this.cornerExtraExtraLarge,
    this.cornerFull,
  });

  @override
  final double? cornerValueNone;

  @override
  final double? cornerValueExtraSmall;

  @override
  final double? cornerValueSmall;

  @override
  final double? cornerValueMedium;

  @override
  final double? cornerValueLarge;

  @override
  final double? cornerValueLargeIncreased;

  @override
  final double? cornerValueExtraLarge;

  @override
  final double? cornerValueExtraLargeIncreased;

  @override
  final double? cornerValueExtraExtraLarge;

  @override
  final Corner? cornerNone;

  @override
  final Corner? cornerExtraSmall;

  @override
  final CornersGeometry? cornerExtraSmallTop;

  @override
  final Corner? cornerSmall;

  @override
  final Corner? cornerMedium;

  @override
  final Corner? cornerLarge;

  @override
  final CornersGeometry? cornerLargeStart;

  @override
  final CornersGeometry? cornerLargeEnd;

  @override
  final CornersGeometry? cornerLargeTop;

  @override
  final Corner? cornerLargeIncreased;

  @override
  final Corner? cornerExtraLarge;

  @override
  final CornersGeometry? cornerExtraLargeTop;

  @override
  final Corner? cornerExtraLargeIncreased;

  @override
  final Corner? cornerExtraExtraLarge;

  @override
  final Corner? cornerFull;
}

abstract class ShapeThemeData extends ShapeThemeDataPartial {
  const ShapeThemeData();

  const factory ShapeThemeData.from({
    required double cornerValueNone,
    required double cornerValueExtraSmall,
    required double cornerValueSmall,
    required double cornerValueMedium,
    required double cornerValueLarge,
    required double cornerValueLargeIncreased,
    required double cornerValueExtraLarge,
    required double cornerValueExtraLargeIncreased,
    required double cornerValueExtraExtraLarge,
    required Corner cornerNone,
    required Corner cornerExtraSmall,
    required CornersGeometry cornerExtraSmallTop,
    required Corner cornerSmall,
    required Corner cornerMedium,
    required Corner cornerLarge,
    required CornersGeometry cornerLargeStart,
    required CornersGeometry cornerLargeEnd,
    required CornersGeometry cornerLargeTop,
    required Corner cornerLargeIncreased,
    required Corner cornerExtraLarge,
    required CornersGeometry cornerExtraLargeTop,
    required Corner cornerExtraLargeIncreased,
    required Corner cornerExtraExtraLarge,
    required Corner cornerFull,
  }) = _ShapeThemeData;

  const factory ShapeThemeData.defaults() = _ShapeThemeDataDefaults;

  const factory ShapeThemeData._defaults({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) = _ShapeThemeDataDefaults;

  @override
  double get cornerValueNone;

  @override
  double get cornerValueExtraSmall;

  @override
  double get cornerValueSmall;

  @override
  double get cornerValueMedium;

  @override
  double get cornerValueLarge;

  @override
  double get cornerValueLargeIncreased;

  @override
  double get cornerValueExtraLarge;

  @override
  double get cornerValueExtraLargeIncreased;

  @override
  double get cornerValueExtraExtraLarge;

  @override
  Corner get cornerNone;

  @override
  Corner get cornerExtraSmall;

  @override
  CornersGeometry get cornerExtraSmallTop;

  @override
  Corner get cornerSmall;

  @override
  Corner get cornerMedium;

  @override
  Corner get cornerLarge;

  @override
  CornersGeometry get cornerLargeStart;

  @override
  CornersGeometry get cornerLargeEnd;

  @override
  CornersGeometry get cornerLargeTop;

  @override
  Corner get cornerLargeIncreased;

  @override
  Corner get cornerExtraLarge;

  @override
  CornersGeometry get cornerExtraLargeTop;

  @override
  Corner get cornerExtraLargeIncreased;

  @override
  Corner get cornerExtraExtraLarge;

  @override
  Corner get cornerFull;

  @override
  ShapeThemeData copyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) =>
      cornerValueNone != null ||
          cornerValueExtraSmall != null ||
          cornerValueSmall != null ||
          cornerValueMedium != null ||
          cornerValueLarge != null ||
          cornerValueLargeIncreased != null ||
          cornerValueExtraLarge != null ||
          cornerValueExtraLargeIncreased != null ||
          cornerValueExtraExtraLarge != null ||
          cornerNone != null ||
          cornerExtraSmall != null ||
          cornerExtraSmallTop != null ||
          cornerSmall != null ||
          cornerMedium != null ||
          cornerLarge != null ||
          cornerLargeStart != null ||
          cornerLargeEnd != null ||
          cornerLargeTop != null ||
          cornerLargeIncreased != null ||
          cornerExtraLarge != null ||
          cornerExtraLargeTop != null ||
          cornerExtraLargeIncreased != null ||
          cornerExtraExtraLarge != null ||
          cornerFull != null
      ? .from(
          cornerValueNone: cornerValueNone ?? this.cornerValueNone,
          cornerValueExtraSmall:
              cornerValueExtraSmall ?? this.cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall ?? this.cornerValueSmall,
          cornerValueMedium: cornerValueMedium ?? this.cornerValueMedium,
          cornerValueLarge: cornerValueLarge ?? this.cornerValueLarge,
          cornerValueLargeIncreased:
              cornerValueLargeIncreased ?? this.cornerValueLargeIncreased,
          cornerValueExtraLarge:
              cornerValueExtraLarge ?? this.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased:
              cornerValueExtraLargeIncreased ??
              this.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge:
              cornerValueExtraExtraLarge ?? this.cornerValueExtraExtraLarge,
          cornerNone: cornerNone ?? this.cornerNone,
          cornerExtraSmall: cornerExtraSmall ?? this.cornerExtraSmall,
          cornerExtraSmallTop: cornerExtraSmallTop ?? this.cornerExtraSmallTop,
          cornerSmall: cornerSmall ?? this.cornerSmall,
          cornerMedium: cornerMedium ?? this.cornerMedium,
          cornerLarge: cornerLarge ?? this.cornerLarge,
          cornerLargeStart: cornerLargeStart ?? this.cornerLargeStart,
          cornerLargeEnd: cornerLargeEnd ?? this.cornerLargeEnd,
          cornerLargeTop: cornerLargeTop ?? this.cornerLargeTop,
          cornerLargeIncreased:
              cornerLargeIncreased ?? this.cornerLargeIncreased,
          cornerExtraLarge: cornerExtraLarge ?? this.cornerExtraLarge,
          cornerExtraLargeTop: cornerExtraLargeTop ?? this.cornerExtraLargeTop,
          cornerExtraLargeIncreased:
              cornerExtraLargeIncreased ?? this.cornerExtraLargeIncreased,
          cornerExtraExtraLarge:
              cornerExtraExtraLarge ?? this.cornerExtraExtraLarge,
          cornerFull: cornerFull ?? this.cornerFull,
        )
      : this;

  @override
  ShapeThemeData mergeWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) => copyWith(
    cornerValueNone: cornerValueNone,
    cornerValueExtraSmall: cornerValueExtraSmall,
    cornerValueSmall: cornerValueSmall,
    cornerValueMedium: cornerValueMedium,
    cornerValueLarge: cornerValueLarge,
    cornerValueLargeIncreased: cornerValueLargeIncreased,
    cornerValueExtraLarge: cornerValueExtraLarge,
    cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
    cornerNone: cornerNone,
    cornerExtraSmall: cornerExtraSmall,
    cornerExtraSmallTop: cornerExtraSmallTop,
    cornerSmall: cornerSmall,
    cornerMedium: cornerMedium,
    cornerLarge: cornerLarge,
    cornerLargeStart: cornerLargeStart,
    cornerLargeEnd: cornerLargeEnd,
    cornerLargeTop: cornerLargeTop,
    cornerLargeIncreased: cornerLargeIncreased,
    cornerExtraLarge: cornerExtraLarge,
    cornerExtraLargeTop: cornerExtraLargeTop,
    cornerExtraLargeIncreased: cornerExtraLargeIncreased,
    cornerExtraExtraLarge: cornerExtraExtraLarge,
    cornerFull: cornerFull,
  );

  @override
  ShapeThemeData merge(ShapeThemeDataPartial? other) => other != null
      ? mergeWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerNone: other.cornerNone,
          cornerExtraSmall: other.cornerExtraSmall,
          cornerExtraSmallTop: other.cornerExtraSmallTop,
          cornerSmall: other.cornerSmall,
          cornerMedium: other.cornerMedium,
          cornerLarge: other.cornerLarge,
          cornerLargeStart: other.cornerLargeStart,
          cornerLargeEnd: other.cornerLargeEnd,
          cornerLargeTop: other.cornerLargeTop,
          cornerLargeIncreased: other.cornerLargeIncreased,
          cornerExtraLarge: other.cornerExtraLarge,
          cornerExtraLargeTop: other.cornerExtraLargeTop,
          cornerExtraLargeIncreased: other.cornerExtraLargeIncreased,
          cornerExtraExtraLarge: other.cornerExtraExtraLarge,
          cornerFull: other.cornerFull,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DoubleProperty("cornerValueNone", cornerValueNone))
      ..add(DoubleProperty("cornerValueExtraSmall", cornerValueExtraSmall))
      ..add(DoubleProperty("cornerValueSmall", cornerValueSmall))
      ..add(DoubleProperty("cornerValueMedium", cornerValueMedium))
      ..add(DoubleProperty("cornerValueLarge", cornerValueLarge))
      ..add(
        DoubleProperty("cornerValueLargeIncreased", cornerValueLargeIncreased),
      )
      ..add(DoubleProperty("cornerValueExtraLarge", cornerValueExtraLarge))
      ..add(
        DoubleProperty(
          "cornerValueExtraLargeIncreased",
          cornerValueExtraLargeIncreased,
        ),
      )
      ..add(
        DoubleProperty(
          "cornerValueExtraExtraLarge",
          cornerValueExtraExtraLarge,
        ),
      )
      ..add(DiagnosticsProperty<Corner>("cornerNone", cornerNone))
      ..add(DiagnosticsProperty<Corner>("cornerExtraSmall", cornerExtraSmall))
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerExtraSmallTop",
          cornerExtraSmallTop,
        ),
      )
      ..add(DiagnosticsProperty<Corner>("cornerSmall", cornerSmall))
      ..add(DiagnosticsProperty<Corner>("cornerMedium", cornerMedium))
      ..add(DiagnosticsProperty<Corner>("cornerLarge", cornerLarge))
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerLargeStart",
          cornerLargeStart,
        ),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>("cornerLargeEnd", cornerLargeEnd),
      )
      ..add(
        DiagnosticsProperty<CornersGeometry>("cornerLargeTop", cornerLargeTop),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerLargeIncreased",
          cornerLargeIncreased,
        ),
      )
      ..add(DiagnosticsProperty<Corner>("cornerExtraLarge", cornerExtraLarge))
      ..add(
        DiagnosticsProperty<CornersGeometry>(
          "cornerExtraLargeTop",
          cornerExtraLargeTop,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraLargeIncreased",
          cornerExtraLargeIncreased,
        ),
      )
      ..add(
        DiagnosticsProperty<Corner>(
          "cornerExtraExtraLarge",
          cornerExtraExtraLarge,
        ),
      )
      ..add(DiagnosticsProperty<Corner>("cornerFull", cornerFull));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ShapeThemeData &&
          cornerValueNone == other.cornerValueNone &&
          cornerValueExtraSmall == other.cornerValueExtraSmall &&
          cornerValueSmall == other.cornerValueSmall &&
          cornerValueMedium == other.cornerValueMedium &&
          cornerValueLarge == other.cornerValueLarge &&
          cornerValueLargeIncreased == other.cornerValueLargeIncreased &&
          cornerValueExtraLarge == other.cornerValueExtraLarge &&
          cornerValueExtraLargeIncreased ==
              other.cornerValueExtraLargeIncreased &&
          cornerValueExtraExtraLarge == other.cornerValueExtraExtraLarge &&
          cornerNone == other.cornerNone &&
          cornerExtraSmall == other.cornerExtraSmall &&
          cornerExtraSmallTop == other.cornerExtraSmallTop &&
          cornerSmall == other.cornerSmall &&
          cornerMedium == other.cornerMedium &&
          cornerLarge == other.cornerLarge &&
          cornerLargeStart == other.cornerLargeStart &&
          cornerLargeEnd == other.cornerLargeEnd &&
          cornerLargeTop == other.cornerLargeTop &&
          cornerLargeIncreased == other.cornerLargeIncreased &&
          cornerExtraLarge == other.cornerExtraLarge &&
          cornerExtraLargeTop == other.cornerExtraLargeTop &&
          cornerExtraLargeIncreased == other.cornerExtraLargeIncreased &&
          cornerExtraExtraLarge == other.cornerExtraExtraLarge &&
          cornerFull == other.cornerFull;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    cornerValueNone,
    cornerValueExtraSmall,
    cornerValueSmall,
    cornerValueMedium,
    cornerValueLarge,
    cornerValueLargeIncreased,
    cornerValueExtraLarge,
    cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge,
    cornerNone,
    cornerExtraSmall,
    cornerExtraSmallTop,
    cornerSmall,
    cornerMedium,
    cornerLarge,
    cornerLargeStart,
    cornerLargeEnd,
    cornerLargeTop,
    Object.hash(
      cornerLargeIncreased,
      cornerExtraLarge,
      cornerExtraLargeTop,
      cornerExtraLargeIncreased,
      cornerExtraExtraLarge,
      cornerFull,
    ),
  );
}

class _ShapeThemeData extends ShapeThemeData {
  const _ShapeThemeData({
    required this.cornerValueNone,
    required this.cornerValueExtraSmall,
    required this.cornerValueSmall,
    required this.cornerValueMedium,
    required this.cornerValueLarge,
    required this.cornerValueLargeIncreased,
    required this.cornerValueExtraLarge,
    required this.cornerValueExtraLargeIncreased,
    required this.cornerValueExtraExtraLarge,
    required this.cornerNone,
    required this.cornerExtraSmall,
    required this.cornerExtraSmallTop,
    required this.cornerSmall,
    required this.cornerMedium,
    required this.cornerLarge,
    required this.cornerLargeStart,
    required this.cornerLargeEnd,
    required this.cornerLargeTop,
    required this.cornerLargeIncreased,
    required this.cornerExtraLarge,
    required this.cornerExtraLargeTop,
    required this.cornerExtraLargeIncreased,
    required this.cornerExtraExtraLarge,
    required this.cornerFull,
  });

  @override
  final double cornerValueNone;

  @override
  final double cornerValueExtraSmall;

  @override
  final double cornerValueSmall;

  @override
  final double cornerValueMedium;

  @override
  final double cornerValueLarge;

  @override
  final double cornerValueLargeIncreased;

  @override
  final double cornerValueExtraLarge;

  @override
  final double cornerValueExtraLargeIncreased;

  @override
  final double cornerValueExtraExtraLarge;

  @override
  final Corner cornerNone;

  @override
  final Corner cornerExtraSmall;

  @override
  final CornersGeometry cornerExtraSmallTop;

  @override
  final Corner cornerSmall;

  @override
  final Corner cornerMedium;

  @override
  final Corner cornerLarge;

  @override
  final CornersGeometry cornerLargeStart;

  @override
  final CornersGeometry cornerLargeEnd;

  @override
  final CornersGeometry cornerLargeTop;

  @override
  final Corner cornerLargeIncreased;

  @override
  final Corner cornerExtraLarge;

  @override
  final CornersGeometry cornerExtraLargeTop;

  @override
  final Corner cornerExtraLargeIncreased;

  @override
  final Corner cornerExtraExtraLarge;

  @override
  final Corner cornerFull;
}

class _ShapeThemeDataDefaults extends ShapeThemeData {
  const _ShapeThemeDataDefaults({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) : _cornerValueNone = cornerValueNone,
       _cornerValueExtraSmall = cornerValueExtraSmall,
       _cornerValueSmall = cornerValueSmall,
       _cornerValueMedium = cornerValueMedium,
       _cornerValueLarge = cornerValueLarge,
       _cornerValueLargeIncreased = cornerValueLargeIncreased,
       _cornerValueExtraLarge = cornerValueExtraLarge,
       _cornerValueExtraLargeIncreased = cornerValueExtraLargeIncreased,
       _cornerValueExtraExtraLarge = cornerValueExtraExtraLarge,
       _cornerNone = cornerNone,
       _cornerExtraSmall = cornerExtraSmall,
       _cornerExtraSmallTop = cornerExtraSmallTop,
       _cornerSmall = cornerSmall,
       _cornerMedium = cornerMedium,
       _cornerLarge = cornerLarge,
       _cornerLargeStart = cornerLargeStart,
       _cornerLargeEnd = cornerLargeEnd,
       _cornerLargeTop = cornerLargeTop,
       _cornerLargeIncreased = cornerLargeIncreased,
       _cornerExtraLarge = cornerExtraLarge,
       _cornerExtraLargeTop = cornerExtraLargeTop,
       _cornerExtraLargeIncreased = cornerExtraLargeIncreased,
       _cornerExtraExtraLarge = cornerExtraExtraLarge,
       _cornerFull = cornerFull;

  final double? _cornerValueNone;
  final double? _cornerValueExtraSmall;
  final double? _cornerValueSmall;
  final double? _cornerValueMedium;
  final double? _cornerValueLarge;
  final double? _cornerValueLargeIncreased;
  final double? _cornerValueExtraLarge;
  final double? _cornerValueExtraLargeIncreased;
  final double? _cornerValueExtraExtraLarge;
  final Corner? _cornerNone;
  final Corner? _cornerExtraSmall;
  final CornersGeometry? _cornerExtraSmallTop;
  final Corner? _cornerSmall;
  final Corner? _cornerMedium;
  final Corner? _cornerLarge;
  final CornersGeometry? _cornerLargeStart;
  final CornersGeometry? _cornerLargeEnd;
  final CornersGeometry? _cornerLargeTop;
  final Corner? _cornerLargeIncreased;
  final Corner? _cornerExtraLarge;
  final CornersGeometry? _cornerExtraLargeTop;
  final Corner? _cornerExtraLargeIncreased;
  final Corner? _cornerExtraExtraLarge;
  final Corner? _cornerFull;

  @override
  double get cornerValueNone => _cornerValueNone ?? 0.0;

  @override
  double get cornerValueExtraSmall => _cornerValueExtraSmall ?? 4.0;

  @override
  double get cornerValueSmall => _cornerValueSmall ?? 8.0;

  @override
  double get cornerValueMedium => _cornerValueMedium ?? 12.0;

  @override
  double get cornerValueLarge => _cornerValueLarge ?? 16.0;

  @override
  double get cornerValueLargeIncreased => _cornerValueLargeIncreased ?? 20.0;

  @override
  double get cornerValueExtraLarge => _cornerValueExtraLarge ?? 28.0;

  @override
  double get cornerValueExtraLargeIncreased =>
      _cornerValueExtraLargeIncreased ?? 32.0;

  @override
  double get cornerValueExtraExtraLarge => _cornerValueExtraExtraLarge ?? 48.0;

  @override
  Corner get cornerNone => _cornerNone ?? .fixed(cornerValueNone);

  @override
  Corner get cornerExtraSmall =>
      _cornerExtraSmall ?? .fixed(cornerValueExtraSmall);

  @override
  CornersGeometry get cornerExtraSmallTop =>
      _cornerExtraSmallTop ?? .vertical(top: cornerExtraSmall);

  @override
  Corner get cornerSmall => _cornerSmall ?? .fixed(cornerValueSmall);

  @override
  Corner get cornerMedium => _cornerMedium ?? .fixed(cornerValueMedium);

  @override
  Corner get cornerLarge => _cornerLarge ?? .fixed(cornerValueLarge);

  @override
  CornersGeometry get cornerLargeStart =>
      _cornerLargeStart ?? CornersDirectional.horizontal(start: cornerLarge);

  @override
  CornersGeometry get cornerLargeEnd =>
      _cornerLargeEnd ?? CornersDirectional.horizontal(end: cornerLarge);

  @override
  CornersGeometry get cornerLargeTop =>
      _cornerLargeTop ?? .vertical(top: cornerLarge);

  @override
  Corner get cornerLargeIncreased =>
      _cornerLargeIncreased ?? .fixed(cornerValueLargeIncreased);

  @override
  Corner get cornerExtraLarge =>
      _cornerExtraLarge ?? .fixed(cornerValueExtraLarge);

  @override
  CornersGeometry get cornerExtraLargeTop =>
      _cornerExtraLargeTop ?? .vertical(top: cornerExtraLarge);

  @override
  Corner get cornerExtraLargeIncreased =>
      _cornerExtraLargeIncreased ?? .fixed(cornerValueExtraLargeIncreased);

  @override
  Corner get cornerExtraExtraLarge =>
      _cornerExtraExtraLarge ?? .fixed(cornerValueExtraExtraLarge);

  @override
  Corner get cornerFull => _cornerFull ?? .round;

  @override
  ShapeThemeData copyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) =>
      cornerValueNone != null &&
          cornerValueExtraSmall != null &&
          cornerValueSmall != null &&
          cornerValueMedium != null &&
          cornerValueLarge != null &&
          cornerValueLargeIncreased != null &&
          cornerValueExtraLarge != null &&
          cornerValueExtraLargeIncreased != null &&
          cornerValueExtraExtraLarge != null &&
          cornerNone != null &&
          cornerExtraSmall != null &&
          cornerExtraSmallTop != null &&
          cornerSmall != null &&
          cornerMedium != null &&
          cornerLarge != null &&
          cornerLargeStart != null &&
          cornerLargeEnd != null &&
          cornerLargeTop != null &&
          cornerLargeIncreased != null &&
          cornerExtraLarge != null &&
          cornerExtraLargeTop != null &&
          cornerExtraLargeIncreased != null &&
          cornerExtraExtraLarge != null &&
          cornerFull != null
      ? .from(
          cornerValueNone: cornerValueNone,
          cornerValueExtraSmall: cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall,
          cornerValueMedium: cornerValueMedium,
          cornerValueLarge: cornerValueLarge,
          cornerValueLargeIncreased: cornerValueLargeIncreased,
          cornerValueExtraLarge: cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
          cornerNone: cornerNone,
          cornerExtraSmall: cornerExtraSmall,
          cornerExtraSmallTop: cornerExtraSmallTop,
          cornerSmall: cornerSmall,
          cornerMedium: cornerMedium,
          cornerLarge: cornerLarge,
          cornerLargeStart: cornerLargeStart,
          cornerLargeEnd: cornerLargeEnd,
          cornerLargeTop: cornerLargeTop,
          cornerLargeIncreased: cornerLargeIncreased,
          cornerExtraLarge: cornerExtraLarge,
          cornerExtraLargeTop: cornerExtraLargeTop,
          cornerExtraLargeIncreased: cornerExtraLargeIncreased,
          cornerExtraExtraLarge: cornerExtraExtraLarge,
          cornerFull: cornerFull,
        )
      : _ShapeThemeDataDefaults(
          cornerValueNone: cornerValueNone ?? _cornerValueNone,
          cornerValueExtraSmall:
              cornerValueExtraSmall ?? _cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall ?? _cornerValueSmall,
          cornerValueMedium: cornerValueMedium ?? _cornerValueMedium,
          cornerValueLarge: cornerValueLarge ?? _cornerValueLarge,
          cornerValueLargeIncreased:
              cornerValueLargeIncreased ?? _cornerValueLargeIncreased,
          cornerValueExtraLarge:
              cornerValueExtraLarge ?? _cornerValueExtraLarge,
          cornerValueExtraLargeIncreased:
              cornerValueExtraLargeIncreased ?? _cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge:
              cornerValueExtraExtraLarge ?? _cornerValueExtraExtraLarge,
          cornerNone: cornerNone ?? _cornerNone,
          cornerExtraSmall: cornerExtraSmall ?? _cornerExtraSmall,
          cornerExtraSmallTop: cornerExtraSmallTop ?? _cornerExtraSmallTop,
          cornerSmall: cornerSmall ?? _cornerSmall,
          cornerMedium: cornerMedium ?? _cornerMedium,
          cornerLarge: cornerLarge ?? _cornerLarge,
          cornerLargeStart: cornerLargeStart ?? _cornerLargeStart,
          cornerLargeEnd: cornerLargeEnd ?? _cornerLargeEnd,
          cornerLargeTop: cornerLargeTop ?? _cornerLargeTop,
          cornerLargeIncreased: cornerLargeIncreased ?? _cornerLargeIncreased,
          cornerExtraLarge: cornerExtraLarge ?? _cornerExtraLarge,
          cornerExtraLargeTop: cornerExtraLargeTop ?? _cornerExtraLargeTop,
          cornerExtraLargeIncreased:
              cornerExtraLargeIncreased ?? _cornerExtraLargeIncreased,
          cornerExtraExtraLarge:
              cornerExtraExtraLarge ?? _cornerExtraExtraLarge,
          cornerFull: cornerFull ?? _cornerFull,
        );

  @override
  ShapeThemeData mergeWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    Corner? cornerNone,
    Corner? cornerExtraSmall,
    CornersGeometry? cornerExtraSmallTop,
    Corner? cornerSmall,
    Corner? cornerMedium,
    Corner? cornerLarge,
    CornersGeometry? cornerLargeStart,
    CornersGeometry? cornerLargeEnd,
    CornersGeometry? cornerLargeTop,
    Corner? cornerLargeIncreased,
    Corner? cornerExtraLarge,
    CornersGeometry? cornerExtraLargeTop,
    Corner? cornerExtraLargeIncreased,
    Corner? cornerExtraExtraLarge,
    Corner? cornerFull,
  }) => copyWith(
    cornerValueNone: cornerValueNone,
    cornerValueExtraSmall: cornerValueExtraSmall,
    cornerValueSmall: cornerValueSmall,
    cornerValueMedium: cornerValueMedium,
    cornerValueLarge: cornerValueLarge,
    cornerValueLargeIncreased: cornerValueLargeIncreased,
    cornerValueExtraLarge: cornerValueExtraLarge,
    cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
    cornerNone: cornerNone,
    cornerExtraSmall: cornerExtraSmall,
    cornerExtraSmallTop: cornerExtraSmallTop,
    cornerSmall: cornerSmall,
    cornerMedium: cornerMedium,
    cornerLarge: cornerLarge,
    cornerLargeStart: cornerLargeStart,
    cornerLargeEnd: cornerLargeEnd,
    cornerLargeTop: cornerLargeTop,
    cornerLargeIncreased: cornerLargeIncreased,
    cornerExtraLarge: cornerExtraLarge,
    cornerExtraLargeTop: cornerExtraLargeTop,
    cornerExtraLargeIncreased: cornerExtraLargeIncreased,
    cornerExtraExtraLarge: cornerExtraExtraLarge,
    cornerFull: cornerFull,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ShapeThemeDataDefaults &&
          _cornerValueNone == other._cornerValueNone &&
          _cornerValueExtraSmall == other._cornerValueExtraSmall &&
          _cornerValueSmall == other._cornerValueSmall &&
          _cornerValueMedium == other._cornerValueMedium &&
          _cornerValueLarge == other._cornerValueLarge &&
          _cornerValueLargeIncreased == other._cornerValueLargeIncreased &&
          _cornerValueExtraLarge == other._cornerValueExtraLarge &&
          _cornerValueExtraLargeIncreased ==
              other._cornerValueExtraLargeIncreased &&
          _cornerValueExtraExtraLarge == other._cornerValueExtraExtraLarge &&
          _cornerNone == other._cornerNone &&
          _cornerExtraSmall == other._cornerExtraSmall &&
          _cornerExtraSmallTop == other._cornerExtraSmallTop &&
          _cornerSmall == other._cornerSmall &&
          _cornerMedium == other._cornerMedium &&
          _cornerLarge == other._cornerLarge &&
          _cornerLargeStart == other._cornerLargeStart &&
          _cornerLargeEnd == other._cornerLargeEnd &&
          _cornerLargeTop == other._cornerLargeTop &&
          _cornerLargeIncreased == other._cornerLargeIncreased &&
          _cornerExtraLarge == other._cornerExtraLarge &&
          _cornerExtraLargeTop == other._cornerExtraLargeTop &&
          _cornerExtraLargeIncreased == other._cornerExtraLargeIncreased &&
          _cornerExtraExtraLarge == other._cornerExtraExtraLarge &&
          _cornerFull == other._cornerFull;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    _cornerValueNone,
    _cornerValueExtraSmall,
    _cornerValueSmall,
    _cornerValueMedium,
    _cornerValueLarge,
    _cornerValueLargeIncreased,
    _cornerValueExtraLarge,
    _cornerValueExtraLargeIncreased,
    _cornerValueExtraExtraLarge,
    _cornerNone,
    _cornerExtraSmall,
    _cornerExtraSmallTop,
    _cornerSmall,
    _cornerMedium,
    _cornerLarge,
    _cornerLargeStart,
    _cornerLargeEnd,
    _cornerLargeTop,
    Object.hash(
      _cornerLargeIncreased,
      _cornerExtraLarge,
      _cornerExtraLargeTop,
      _cornerExtraLargeIncreased,
      _cornerExtraExtraLarge,
      _cornerFull,
    ),
  );
}

typedef ShapeThemeResolver = ThemeResolver<ShapeThemeDataPartial>;

typedef ShapeThemeResolverCallback =
    ThemeResolverCallback<ShapeThemeDataPartial>;

class _ShapeThemeResolver
    extends CombiningThemeResolver<ShapeThemeDataPartial> {
  const _ShapeThemeResolver(super.a, super.b);

  @override
  ShapeThemeDataPartial combine(
    ShapeThemeDataPartial a,
    ShapeThemeDataPartial b,
  ) => a.merge(b);
}

abstract class ShapeTheme extends StatelessWidget implements ProxyWidget {
  const ShapeTheme._({super.key, required this.child});

  const factory ShapeTheme.withResolver({
    Key? key,
    required ShapeThemeResolver resolver,
    required Widget child,
  }) = _ShapeThemeWithResolver;

  const factory ShapeTheme.withCallback({
    Key? key,
    required ShapeThemeResolverCallback callback,
    required Widget child,
  }) = _ShapeThemeWithCallback;

  const factory ShapeTheme.withData({
    Key? key,
    required ShapeThemeDataPartial data,
    required Widget child,
  }) = _ShapeThemeWithData;

  ShapeThemeResolver get resolver;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inherited = _ShapeTheme.maybeResolverOf(context);
    return _ShapeTheme(
      resolver: inherited != null
          ? _ShapeThemeResolver(inherited, resolver)
          : resolver,
      child: child,
    );
  }

  static ShapeThemeData of(BuildContext context) {
    final resolver = _ShapeTheme.maybeResolverOf(context);
    if (resolver != null) {
      final data = resolver.resolve(context);
      return ._defaults(
        cornerValueNone: data.cornerValueNone,
        cornerValueExtraSmall: data.cornerValueExtraSmall,
        cornerValueSmall: data.cornerValueSmall,
        cornerValueMedium: data.cornerValueMedium,
        cornerValueLarge: data.cornerValueLarge,
        cornerValueLargeIncreased: data.cornerValueLargeIncreased,
        cornerValueExtraLarge: data.cornerValueExtraLarge,
        cornerValueExtraLargeIncreased: data.cornerValueExtraLargeIncreased,
        cornerValueExtraExtraLarge: data.cornerValueExtraExtraLarge,
        cornerNone: data.cornerNone,
        cornerExtraSmall: data.cornerExtraSmall,
        cornerExtraSmallTop: data.cornerExtraSmallTop,
        cornerSmall: data.cornerSmall,
        cornerMedium: data.cornerMedium,
        cornerLarge: data.cornerLarge,
        cornerLargeStart: data.cornerLargeStart,
        cornerLargeEnd: data.cornerLargeEnd,
        cornerLargeTop: data.cornerLargeTop,
        cornerLargeIncreased: data.cornerLargeIncreased,
        cornerExtraLarge: data.cornerExtraLarge,
        cornerExtraLargeTop: data.cornerExtraLargeTop,
        cornerExtraLargeIncreased: data.cornerExtraLargeIncreased,
        cornerExtraExtraLarge: data.cornerExtraExtraLarge,
        cornerFull: data.cornerFull,
      );
    }
    return const .defaults();
  }
}

class _ShapeThemeWithResolver extends ShapeTheme {
  const _ShapeThemeWithResolver({
    super.key,
    required this.resolver,
    required super.child,
  }) : super._();

  @override
  final ShapeThemeResolver resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ShapeThemeResolver>("resolver", resolver),
    );
  }
}

class _ShapeThemeWithCallback extends ShapeTheme {
  const _ShapeThemeWithCallback({
    super.key,
    required this.callback,
    required super.child,
  }) : super._();

  final ShapeThemeResolverCallback callback;

  @override
  ShapeThemeResolver get resolver => .callback(callback);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ShapeThemeResolverCallback>("callback", callback),
    );
  }
}

class _ShapeThemeWithData extends ShapeTheme {
  const _ShapeThemeWithData({
    super.key,
    required this.data,
    required super.child,
  }) : super._();

  final ShapeThemeDataPartial data;

  @override
  ShapeThemeResolver get resolver => .value(data);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ShapeThemeDataPartial>("data", data));
  }
}

class _ShapeTheme extends InheritedTheme {
  const _ShapeTheme({super.key, required this.resolver, required super.child});

  final ShapeThemeResolver resolver;

  @override
  bool updateShouldNotify(_ShapeTheme oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ShapeTheme(resolver: resolver, child: child);

  static ShapeThemeResolver? maybeResolverOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ShapeTheme>()?.resolver;
}
