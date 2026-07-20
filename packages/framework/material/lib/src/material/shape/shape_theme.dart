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
    CornersBorderDelegate? cornerFamily,
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

  CornersBorderDelegate? get cornerFamily;

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

  ShapeThemeDataPartial copy() => copyWith();

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
    CornersBorderDelegate? cornerFamily,
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
  }) => .from(
    cornerValueNone: cornerValueNone ?? this.cornerValueNone,
    cornerValueExtraSmall: cornerValueExtraSmall ?? this.cornerValueExtraSmall,
    cornerValueSmall: cornerValueSmall ?? this.cornerValueSmall,
    cornerValueMedium: cornerValueMedium ?? this.cornerValueMedium,
    cornerValueLarge: cornerValueLarge ?? this.cornerValueLarge,
    cornerValueLargeIncreased:
        cornerValueLargeIncreased ?? this.cornerValueLargeIncreased,
    cornerValueExtraLarge: cornerValueExtraLarge ?? this.cornerValueExtraLarge,
    cornerValueExtraLargeIncreased:
        cornerValueExtraLargeIncreased ?? this.cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge:
        cornerValueExtraExtraLarge ?? this.cornerValueExtraExtraLarge,
    cornerFamily: cornerFamily ?? this.cornerFamily,
    cornerNone: cornerNone ?? this.cornerNone,
    cornerExtraSmall: cornerExtraSmall ?? this.cornerExtraSmall,
    cornerExtraSmallTop: cornerExtraSmallTop ?? this.cornerExtraSmallTop,
    cornerSmall: cornerSmall ?? this.cornerSmall,
    cornerMedium: cornerMedium ?? this.cornerMedium,
    cornerLarge: cornerLarge ?? this.cornerLarge,
    cornerLargeStart: cornerLargeStart ?? this.cornerLargeStart,
    cornerLargeEnd: cornerLargeEnd ?? this.cornerLargeEnd,
    cornerLargeTop: cornerLargeTop ?? this.cornerLargeTop,
    cornerLargeIncreased: cornerLargeIncreased ?? this.cornerLargeIncreased,
    cornerExtraLarge: cornerExtraLarge ?? this.cornerExtraLarge,
    cornerExtraLargeTop: cornerExtraLargeTop ?? this.cornerExtraLargeTop,
    cornerExtraLargeIncreased:
        cornerExtraLargeIncreased ?? this.cornerExtraLargeIncreased,
    cornerExtraExtraLarge: cornerExtraExtraLarge ?? this.cornerExtraExtraLarge,
    cornerFull: cornerFull ?? this.cornerFull,
  );

  ShapeThemeDataPartial maybeCopyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    CornersBorderDelegate? cornerFamily,
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
          cornerFamily != null ||
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
      ? copyWith(
          cornerValueNone: cornerValueNone,
          cornerValueExtraSmall: cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall,
          cornerValueMedium: cornerValueMedium,
          cornerValueLarge: cornerValueLarge,
          cornerValueLargeIncreased: cornerValueLargeIncreased,
          cornerValueExtraLarge: cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
          cornerFamily: cornerFamily,
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
      : this;

  ShapeThemeDataPartial merge(ShapeThemeDataPartial? other) => other != null
      ? copyWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerFamily: other.cornerFamily,
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
      : copy();

  ShapeThemeDataPartial maybeMerge(ShapeThemeDataPartial? other) =>
      other != null
      ? maybeCopyWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerFamily: other.cornerFamily,
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

  CornersBorder? applyCornerValue({
    BorderSide side = .none,
    double cornerValue = 0.0,
  }) => applyCorner(side: side, corner: .fixed(cornerValue));

  CornersBorder? applyCorner({
    BorderSide side = .none,
    Corner corner = .zero,
  }) => applyCorners(side: side, corners: .all(corner));

  CornersBorder? applyCorners({
    BorderSide side = .none,
    CornersGeometry corners = .zero,
  }) {
    final delegate = cornerFamily;
    return delegate != null
        ? CornersBorder(side: side, delegate: delegate, corners: corners)
        : null;
  }

  CornersBorder apply(CornersBorder shape) =>
      shape.copyWith(delegate: cornerFamily);

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
        DiagnosticsProperty<CornersBorderDelegate>(
          "cornerFamily",
          cornerFamily,
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
}

final class _ShapeThemeDataPartial extends ShapeThemeDataPartial {
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
    this.cornerFamily,
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
  final CornersBorderDelegate? cornerFamily;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ShapeThemeDataPartial &&
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
          cornerFamily == other.cornerFamily &&
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
    cornerValueNone,
    cornerValueExtraSmall,
    cornerValueSmall,
    cornerValueMedium,
    cornerValueLarge,
    cornerValueLargeIncreased,
    cornerValueExtraLarge,
    cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge,
    cornerFamily,
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
    required CornersBorderDelegate cornerFamily,
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

  const factory ShapeThemeData.defaults({ShapeThemeDataPartial? overrides}) =
      _ShapeThemeDataDefaults;

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
  CornersBorderDelegate get cornerFamily;

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
  ShapeThemeData copy() => copyWith();

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
    CornersBorderDelegate? cornerFamily,
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
  }) => .from(
    cornerValueNone: cornerValueNone ?? this.cornerValueNone,
    cornerValueExtraSmall: cornerValueExtraSmall ?? this.cornerValueExtraSmall,
    cornerValueSmall: cornerValueSmall ?? this.cornerValueSmall,
    cornerValueMedium: cornerValueMedium ?? this.cornerValueMedium,
    cornerValueLarge: cornerValueLarge ?? this.cornerValueLarge,
    cornerValueLargeIncreased:
        cornerValueLargeIncreased ?? this.cornerValueLargeIncreased,
    cornerValueExtraLarge: cornerValueExtraLarge ?? this.cornerValueExtraLarge,
    cornerValueExtraLargeIncreased:
        cornerValueExtraLargeIncreased ?? this.cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge:
        cornerValueExtraExtraLarge ?? this.cornerValueExtraExtraLarge,
    cornerFamily: cornerFamily ?? this.cornerFamily,
    cornerNone: cornerNone ?? this.cornerNone,
    cornerExtraSmall: cornerExtraSmall ?? this.cornerExtraSmall,
    cornerExtraSmallTop: cornerExtraSmallTop ?? this.cornerExtraSmallTop,
    cornerSmall: cornerSmall ?? this.cornerSmall,
    cornerMedium: cornerMedium ?? this.cornerMedium,
    cornerLarge: cornerLarge ?? this.cornerLarge,
    cornerLargeStart: cornerLargeStart ?? this.cornerLargeStart,
    cornerLargeEnd: cornerLargeEnd ?? this.cornerLargeEnd,
    cornerLargeTop: cornerLargeTop ?? this.cornerLargeTop,
    cornerLargeIncreased: cornerLargeIncreased ?? this.cornerLargeIncreased,
    cornerExtraLarge: cornerExtraLarge ?? this.cornerExtraLarge,
    cornerExtraLargeTop: cornerExtraLargeTop ?? this.cornerExtraLargeTop,
    cornerExtraLargeIncreased:
        cornerExtraLargeIncreased ?? this.cornerExtraLargeIncreased,
    cornerExtraExtraLarge: cornerExtraExtraLarge ?? this.cornerExtraExtraLarge,
    cornerFull: cornerFull ?? this.cornerFull,
  );

  @override
  ShapeThemeData maybeCopyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    CornersBorderDelegate? cornerFamily,
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
          cornerFamily != null ||
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
      ? copyWith(
          cornerValueNone: cornerValueNone,
          cornerValueExtraSmall: cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall,
          cornerValueMedium: cornerValueMedium,
          cornerValueLarge: cornerValueLarge,
          cornerValueLargeIncreased: cornerValueLargeIncreased,
          cornerValueExtraLarge: cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
          cornerFamily: cornerFamily,
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
      : this;

  @override
  ShapeThemeData merge(ShapeThemeDataPartial? other) => other != null
      ? copyWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerFamily: other.cornerFamily,
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
      : copy();

  @override
  ShapeThemeData maybeMerge(ShapeThemeDataPartial? other) => other != null
      ? maybeCopyWith(
          cornerValueNone: other.cornerValueNone,
          cornerValueExtraSmall: other.cornerValueExtraSmall,
          cornerValueSmall: other.cornerValueSmall,
          cornerValueMedium: other.cornerValueMedium,
          cornerValueLarge: other.cornerValueLarge,
          cornerValueLargeIncreased: other.cornerValueLargeIncreased,
          cornerValueExtraLarge: other.cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: other.cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: other.cornerValueExtraExtraLarge,
          cornerFamily: other.cornerFamily,
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

  // TODO: modify when the shape / outline API is ready

  @override
  CornersBorder applyCornerValue({
    BorderSide side = .none,
    double cornerValue = 0.0,
  }) => applyCorner(side: side, corner: .fixed(cornerValue));

  @override
  CornersBorder applyCorner({BorderSide side = .none, Corner corner = .zero}) =>
      applyCorners(side: side, corners: .all(corner));

  @override
  CornersBorder applyCorners({
    BorderSide side = .none,
    CornersGeometry corners = .zero,
  }) => CornersBorder(side: side, delegate: cornerFamily, corners: corners);

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
      ..add(
        DiagnosticsProperty<CornersBorderDelegate>(
          "cornerFamily",
          cornerFamily,
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
}

final class _ShapeThemeData extends ShapeThemeData {
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
    required this.cornerFamily,
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
  final CornersBorderDelegate cornerFamily;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ShapeThemeData &&
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
          cornerFamily == other.cornerFamily &&
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
    cornerValueNone,
    cornerValueExtraSmall,
    cornerValueSmall,
    cornerValueMedium,
    cornerValueLarge,
    cornerValueLargeIncreased,
    cornerValueExtraLarge,
    cornerValueExtraLargeIncreased,
    cornerValueExtraExtraLarge,
    cornerFamily,
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

final class _ShapeThemeDataDefaults extends ShapeThemeData {
  const _ShapeThemeDataDefaults({ShapeThemeDataPartial? overrides})
    : _overrides = overrides ?? const .from();

  final ShapeThemeDataPartial _overrides;

  @override
  double get cornerValueNone => _overrides.cornerValueNone ?? 0.0;

  @override
  double get cornerValueExtraSmall => _overrides.cornerValueExtraSmall ?? 4.0;

  @override
  double get cornerValueSmall => _overrides.cornerValueSmall ?? 8.0;

  @override
  double get cornerValueMedium => _overrides.cornerValueMedium ?? 12.0;

  @override
  double get cornerValueLarge => _overrides.cornerValueLarge ?? 16.0;

  @override
  double get cornerValueLargeIncreased =>
      _overrides.cornerValueLargeIncreased ?? 20.0;

  @override
  double get cornerValueExtraLarge => _overrides.cornerValueExtraLarge ?? 28.0;

  @override
  double get cornerValueExtraLargeIncreased =>
      _overrides.cornerValueExtraLargeIncreased ?? 32.0;

  @override
  double get cornerValueExtraExtraLarge =>
      _overrides.cornerValueExtraExtraLarge ?? 48.0;

  @override
  CornersBorderDelegate get cornerFamily => _overrides.cornerFamily ?? .rounded;

  @override
  Corner get cornerNone => _overrides.cornerNone ?? .fixed(cornerValueNone);

  @override
  Corner get cornerExtraSmall =>
      _overrides.cornerExtraSmall ?? .fixed(cornerValueExtraSmall);

  @override
  CornersGeometry get cornerExtraSmallTop =>
      _overrides.cornerExtraSmallTop ?? .vertical(top: cornerExtraSmall);

  @override
  Corner get cornerSmall => _overrides.cornerSmall ?? .fixed(cornerValueSmall);

  @override
  Corner get cornerMedium =>
      _overrides.cornerMedium ?? .fixed(cornerValueMedium);

  @override
  Corner get cornerLarge => _overrides.cornerLarge ?? .fixed(cornerValueLarge);

  @override
  CornersGeometry get cornerLargeStart =>
      _overrides.cornerLargeStart ??
      CornersDirectional.horizontal(start: cornerLarge);

  @override
  CornersGeometry get cornerLargeEnd =>
      _overrides.cornerLargeEnd ??
      CornersDirectional.horizontal(end: cornerLarge);

  @override
  CornersGeometry get cornerLargeTop =>
      _overrides.cornerLargeTop ?? .vertical(top: cornerLarge);

  @override
  Corner get cornerLargeIncreased =>
      _overrides.cornerLargeIncreased ?? .fixed(cornerValueLargeIncreased);

  @override
  Corner get cornerExtraLarge =>
      _overrides.cornerExtraLarge ?? .fixed(cornerValueExtraLarge);

  @override
  CornersGeometry get cornerExtraLargeTop =>
      _overrides.cornerExtraLargeTop ?? .vertical(top: cornerExtraLarge);

  @override
  Corner get cornerExtraLargeIncreased =>
      _overrides.cornerExtraLargeIncreased ??
      .fixed(cornerValueExtraLargeIncreased);

  @override
  Corner get cornerExtraExtraLarge =>
      _overrides.cornerExtraExtraLarge ?? .fixed(cornerValueExtraExtraLarge);

  @override
  Corner get cornerFull => _overrides.cornerFull ?? .round;

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
    CornersBorderDelegate? cornerFamily,
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
  }) => _ShapeThemeDataDefaults(
    overrides: _overrides.copyWith(
      cornerValueNone: cornerValueNone,
      cornerValueExtraSmall: cornerValueExtraSmall,
      cornerValueSmall: cornerValueSmall,
      cornerValueMedium: cornerValueMedium,
      cornerValueLarge: cornerValueLarge,
      cornerValueLargeIncreased: cornerValueLargeIncreased,
      cornerValueExtraLarge: cornerValueExtraLarge,
      cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
      cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
      cornerFamily: cornerFamily,
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
    ),
  );

  @override
  ShapeThemeData maybeCopyWith({
    double? cornerValueNone,
    double? cornerValueExtraSmall,
    double? cornerValueSmall,
    double? cornerValueMedium,
    double? cornerValueLarge,
    double? cornerValueLargeIncreased,
    double? cornerValueExtraLarge,
    double? cornerValueExtraLargeIncreased,
    double? cornerValueExtraExtraLarge,
    CornersBorderDelegate? cornerFamily,
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
          cornerFamily != null &&
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
          cornerFamily: cornerFamily,
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
      : cornerValueNone != null ||
            cornerValueExtraSmall != null ||
            cornerValueSmall != null ||
            cornerValueMedium != null ||
            cornerValueLarge != null ||
            cornerValueLargeIncreased != null ||
            cornerValueExtraLarge != null ||
            cornerValueExtraLargeIncreased != null ||
            cornerValueExtraExtraLarge != null ||
            cornerFamily != null ||
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
      ? copyWith(
          cornerValueNone: cornerValueNone,
          cornerValueExtraSmall: cornerValueExtraSmall,
          cornerValueSmall: cornerValueSmall,
          cornerValueMedium: cornerValueMedium,
          cornerValueLarge: cornerValueLarge,
          cornerValueLargeIncreased: cornerValueLargeIncreased,
          cornerValueExtraLarge: cornerValueExtraLarge,
          cornerValueExtraLargeIncreased: cornerValueExtraLargeIncreased,
          cornerValueExtraExtraLarge: cornerValueExtraExtraLarge,
          cornerFamily: cornerFamily,
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
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ShapeThemeDataDefaults && _overrides == other._overrides;

  @override
  int get hashCode => _overrides.hashCode;
}

abstract class ShapeTheme extends SingleChildStatelessWidget {
  const ShapeTheme._({super.key, super.child});

  const factory ShapeTheme.mergeWithResolver({
    Key? key,
    required ThemeResolver<ShapeThemeDataPartial> resolver,
    Widget? child,
  }) = _ShapeThemeWithResolver<ShapeThemeDataPartial>;

  const factory ShapeTheme.mergeWithCallback({
    Key? key,
    required ThemeResolverCallback<ShapeThemeDataPartial> callback,
    Widget? child,
  }) = _ShapeThemeWithCallback<ShapeThemeDataPartial>;

  const factory ShapeTheme.mergeWithData({
    Key? key,
    required ShapeThemeDataPartial data,
    Widget? child,
  }) = _ShapeThemeWithData<ShapeThemeDataPartial>;

  const factory ShapeTheme.replaceWithResolver({
    Key? key,
    required ThemeResolver<ShapeThemeData> resolver,
    Widget? child,
  }) = _ShapeThemeWithResolver<ShapeThemeData>;

  const factory ShapeTheme.replaceWithCallback({
    Key? key,
    required ThemeResolverCallback<ShapeThemeData> callback,
    Widget? child,
  }) = _ShapeThemeWithCallback<ShapeThemeData>;

  const factory ShapeTheme.replaceWithData({
    Key? key,
    required ShapeThemeData data,
    Widget? child,
  }) = _ShapeThemeWithData<ShapeThemeData>;

  ThemeResolver<ShapeThemeDataPartial> get resolver;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child != null
      ? _ShapeTheme(resolver: resolver, child: child)
      : const SizedBox.shrink();

  static ShapeThemeData? maybeOf(BuildContext context) {
    final overrides = _ShapeTheme.maybeOverridesOf(context);
    if (overrides == null) return null;
    return .defaults(overrides: overrides);
  }

  static ShapeThemeData of(BuildContext context) =>
      .defaults(overrides: _ShapeTheme.maybeOverridesOf(context));
}

class _ShapeThemeWithResolver<T extends ShapeThemeDataPartial>
    extends ShapeTheme {
  const _ShapeThemeWithResolver({
    super.key,
    required this.resolver,
    super.child,
  }) : super._();

  @override
  final ThemeResolver<T> resolver;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ShapeThemeWithResolver(key: key, resolver: resolver, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
  }
}

class _ShapeThemeWithCallback<T extends ShapeThemeDataPartial>
    extends ShapeTheme {
  const _ShapeThemeWithCallback({
    super.key,
    required this.callback,
    super.child,
  }) : super._();

  final ThemeResolverCallback<T> callback;

  @override
  ThemeResolver<T> get resolver => .callback(callback);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ShapeThemeWithCallback(key: key, callback: callback, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
    );
  }
}

class _ShapeThemeWithData<T extends ShapeThemeDataPartial> extends ShapeTheme {
  const _ShapeThemeWithData({super.key, required this.data, super.child})
    : super._();

  final T data;

  @override
  ThemeResolver<T> get resolver => .value(data);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      _ShapeThemeWithData(key: key, data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}

final class _ShapeTheme
    extends
        InheritedThemeResolverWidget<
          ShapeThemeDataPartial,
          _ShapeTheme,
          _ShapeThemeElement
        >
    implements InheritedTheme {
  const _ShapeTheme({super.key, required super.resolver, required super.child});

  @override
  ShapeThemeDataPartial merge(
    ShapeThemeDataPartial fallback,
    ShapeThemeDataPartial? overrides,
  ) => fallback.maybeMerge(overrides);

  @override
  bool isConcrete(ShapeThemeDataPartial data) => data is ShapeThemeData;

  @override
  _ShapeThemeElement createElement() => _ShapeThemeElement(this);

  @override
  Widget wrap(BuildContext context, Widget child) =>
      _ShapeTheme(resolver: resolver, child: child);

  static ThemeResolver<ShapeThemeDataPartial>? maybeResolverOf(
    BuildContext context,
  ) =>
      InheritedThemeResolverWidget.maybeResolverOf<
        ShapeThemeDataPartial,
        _ShapeTheme,
        _ShapeThemeElement
      >(context);

  static ShapeThemeDataPartial? maybeOverridesOf(BuildContext context) =>
      InheritedThemeResolverWidget.maybeOverridesOf<
        ShapeThemeDataPartial,
        _ShapeTheme,
        _ShapeThemeElement
      >(context);
}

final class _ShapeThemeElement
    extends
        InheritedThemeResolverElement<
          ShapeThemeDataPartial,
          _ShapeTheme,
          _ShapeThemeElement
        > {
  _ShapeThemeElement(super.widget);
}
