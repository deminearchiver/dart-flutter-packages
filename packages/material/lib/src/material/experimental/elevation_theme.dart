import 'package:material/src/generator/annotations.dart' as generator;
import 'package:material/src/material/flutter.dart';

part 'elevation_theme.g.dart';

@generator.Partial()
abstract class ElevationThemeDataPartial
    with Diagnosticable, _$ElevationThemeDataPartial {
  const ElevationThemeDataPartial();

  const factory ElevationThemeDataPartial.from({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) = _ElevationThemeDataPartial;

  @override
  double? get level0;

  @override
  double? get level1;

  @override
  double? get level2;

  @override
  double? get level3;

  @override
  double? get level4;

  @override
  double? get level5;

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {}
}

@generator.Concrete()
abstract class ElevationThemeData extends ElevationThemeDataPartial
    with _$ElevationThemeData {
  const ElevationThemeData();

  const factory ElevationThemeData.from({
    required double level0,
    required double level1,
    required double level2,
    required double level3,
    required double level4,
    required double level5,
  }) = _ElevationThemeData;

  @override
  double get level0;

  @override
  double get level1;

  @override
  double get level2;

  @override
  double get level3;

  @override
  double get level4;

  @override
  double get level5;

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {}
}

@generator.Defaults(overrides: ElevationThemeDataPartial)
abstract class _ElevationThemeDataDefaults extends ElevationThemeData
    with _$_ElevationThemeDataDefaults {
  const _ElevationThemeDataDefaults._();

  const factory _ElevationThemeDataDefaults({
    required ColorThemeData colorTheme,
    ElevationThemeDataPartial? overrides,
  }) = __ElevationThemeDataDefaults;

  @override
  double get level0 => _level0 ?? 0.0;

  @override
  double get level1 => _level1 ?? 1.0;

  @override
  double get level2 => _level2 ?? 3.0;

  @override
  double get level3 => _level3 ?? 6.0;

  @override
  double get level4 => _level4 ?? 8.0;

  @override
  double get level5 => _level5 ?? 12.0;
}
