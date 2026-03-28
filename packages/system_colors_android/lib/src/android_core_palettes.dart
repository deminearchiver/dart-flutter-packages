import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AndroidSystemPalette with Diagnosticable {
  const AndroidSystemPalette();

  const factory AndroidSystemPalette.fallback() = _AndroidSystemPalette;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {}

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is AndroidSystemPalette;

  @override
  int get hashCode => runtimeType.hashCode;
}

class _AndroidSystemPalette extends AndroidSystemPalette {
  const _AndroidSystemPalette();
}

abstract class AndroidSystemPalette31 extends AndroidSystemPalette {
  const AndroidSystemPalette31();

  const factory AndroidSystemPalette31.from({
    required Color primary0,
    required Color primary10,
    required Color primary50,
    required Color primary100,
    required Color primary200,
    required Color primary300,
    required Color primary400,
    required Color primary500,
    required Color primary600,
    required Color primary700,
    required Color primary800,
    required Color primary900,
    required Color primary1000,
    required Color secondary0,
    required Color secondary10,
    required Color secondary50,
    required Color secondary100,
    required Color secondary200,
    required Color secondary300,
    required Color secondary400,
    required Color secondary500,
    required Color secondary600,
    required Color secondary700,
    required Color secondary800,
    required Color secondary900,
    required Color secondary1000,
    required Color tertiary0,
    required Color tertiary10,
    required Color tertiary50,
    required Color tertiary100,
    required Color tertiary200,
    required Color tertiary300,
    required Color tertiary400,
    required Color tertiary500,
    required Color tertiary600,
    required Color tertiary700,
    required Color tertiary800,
    required Color tertiary900,
    required Color tertiary1000,
    required Color neutral0,
    required Color neutral10,
    required Color neutral50,
    required Color neutral100,
    required Color neutral200,
    required Color neutral300,
    required Color neutral400,
    required Color neutral500,
    required Color neutral600,
    required Color neutral700,
    required Color neutral800,
    required Color neutral900,
    required Color neutral1000,
    required Color neutralVariant0,
    required Color neutralVariant10,
    required Color neutralVariant50,
    required Color neutralVariant100,
    required Color neutralVariant200,
    required Color neutralVariant300,
    required Color neutralVariant400,
    required Color neutralVariant500,
    required Color neutralVariant600,
    required Color neutralVariant700,
    required Color neutralVariant800,
    required Color neutralVariant900,
    required Color neutralVariant1000,
  }) = _AndroidSystemPalette31;

  Color get primary0;
  Color get primary10;
  Color get primary50;
  Color get primary100;
  Color get primary200;
  Color get primary300;
  Color get primary400;
  Color get primary500;
  Color get primary600;
  Color get primary700;
  Color get primary800;
  Color get primary900;
  Color get primary1000;
  Color get secondary0;
  Color get secondary10;
  Color get secondary50;
  Color get secondary100;
  Color get secondary200;
  Color get secondary300;
  Color get secondary400;
  Color get secondary500;
  Color get secondary600;
  Color get secondary700;
  Color get secondary800;
  Color get secondary900;
  Color get secondary1000;
  Color get tertiary0;
  Color get tertiary10;
  Color get tertiary50;
  Color get tertiary100;
  Color get tertiary200;
  Color get tertiary300;
  Color get tertiary400;
  Color get tertiary500;
  Color get tertiary600;
  Color get tertiary700;
  Color get tertiary800;
  Color get tertiary900;
  Color get tertiary1000;
  Color get neutral0;
  Color get neutral10;
  Color get neutral50;
  Color get neutral100;
  Color get neutral200;
  Color get neutral300;
  Color get neutral400;
  Color get neutral500;
  Color get neutral600;
  Color get neutral700;
  Color get neutral800;
  Color get neutral900;
  Color get neutral1000;
  Color get neutralVariant0;
  Color get neutralVariant10;
  Color get neutralVariant50;
  Color get neutralVariant100;
  Color get neutralVariant200;
  Color get neutralVariant300;
  Color get neutralVariant400;
  Color get neutralVariant500;
  Color get neutralVariant600;
  Color get neutralVariant700;
  Color get neutralVariant800;
  Color get neutralVariant900;
  Color get neutralVariant1000;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primary0", primary0))
      ..add(ColorProperty("primary10", primary10))
      ..add(ColorProperty("primary50", primary50))
      ..add(ColorProperty("primary100", primary100))
      ..add(ColorProperty("primary200", primary200))
      ..add(ColorProperty("primary300", primary300))
      ..add(ColorProperty("primary400", primary400))
      ..add(ColorProperty("primary500", primary500))
      ..add(ColorProperty("primary600", primary600))
      ..add(ColorProperty("primary700", primary700))
      ..add(ColorProperty("primary800", primary800))
      ..add(ColorProperty("primary900", primary900))
      ..add(ColorProperty("primary1000", primary1000))
      ..add(ColorProperty("secondary0", secondary0))
      ..add(ColorProperty("secondary10", secondary10))
      ..add(ColorProperty("secondary50", secondary50))
      ..add(ColorProperty("secondary100", secondary100))
      ..add(ColorProperty("secondary200", secondary200))
      ..add(ColorProperty("secondary300", secondary300))
      ..add(ColorProperty("secondary400", secondary400))
      ..add(ColorProperty("secondary500", secondary500))
      ..add(ColorProperty("secondary600", secondary600))
      ..add(ColorProperty("secondary700", secondary700))
      ..add(ColorProperty("secondary800", secondary800))
      ..add(ColorProperty("secondary900", secondary900))
      ..add(ColorProperty("secondary1000", secondary1000))
      ..add(ColorProperty("tertiary0", tertiary0))
      ..add(ColorProperty("tertiary10", tertiary10))
      ..add(ColorProperty("tertiary50", tertiary50))
      ..add(ColorProperty("tertiary100", tertiary100))
      ..add(ColorProperty("tertiary200", tertiary200))
      ..add(ColorProperty("tertiary300", tertiary300))
      ..add(ColorProperty("tertiary400", tertiary400))
      ..add(ColorProperty("tertiary500", tertiary500))
      ..add(ColorProperty("tertiary600", tertiary600))
      ..add(ColorProperty("tertiary700", tertiary700))
      ..add(ColorProperty("tertiary800", tertiary800))
      ..add(ColorProperty("tertiary900", tertiary900))
      ..add(ColorProperty("tertiary1000", tertiary1000))
      ..add(ColorProperty("neutral0", neutral0))
      ..add(ColorProperty("neutral10", neutral10))
      ..add(ColorProperty("neutral50", neutral50))
      ..add(ColorProperty("neutral100", neutral100))
      ..add(ColorProperty("neutral200", neutral200))
      ..add(ColorProperty("neutral300", neutral300))
      ..add(ColorProperty("neutral400", neutral400))
      ..add(ColorProperty("neutral500", neutral500))
      ..add(ColorProperty("neutral600", neutral600))
      ..add(ColorProperty("neutral700", neutral700))
      ..add(ColorProperty("neutral800", neutral800))
      ..add(ColorProperty("neutral900", neutral900))
      ..add(ColorProperty("neutral1000", neutral1000))
      ..add(ColorProperty("neutralVariant0", neutralVariant0))
      ..add(ColorProperty("neutralVariant10", neutralVariant10))
      ..add(ColorProperty("neutralVariant50", neutralVariant50))
      ..add(ColorProperty("neutralVariant100", neutralVariant100))
      ..add(ColorProperty("neutralVariant200", neutralVariant200))
      ..add(ColorProperty("neutralVariant300", neutralVariant300))
      ..add(ColorProperty("neutralVariant400", neutralVariant400))
      ..add(ColorProperty("neutralVariant500", neutralVariant500))
      ..add(ColorProperty("neutralVariant600", neutralVariant600))
      ..add(ColorProperty("neutralVariant700", neutralVariant700))
      ..add(ColorProperty("neutralVariant800", neutralVariant800))
      ..add(ColorProperty("neutralVariant900", neutralVariant900))
      ..add(ColorProperty("neutralVariant1000", neutralVariant1000));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidSystemPalette31 &&
          primary0 == other.primary0 &&
          primary10 == other.primary10 &&
          primary50 == other.primary50 &&
          primary100 == other.primary100 &&
          primary200 == other.primary200 &&
          primary300 == other.primary300 &&
          primary400 == other.primary400 &&
          primary500 == other.primary500 &&
          primary600 == other.primary600 &&
          primary700 == other.primary700 &&
          primary800 == other.primary800 &&
          primary900 == other.primary900 &&
          primary1000 == other.primary1000 &&
          secondary0 == other.secondary0 &&
          secondary10 == other.secondary10 &&
          secondary50 == other.secondary50 &&
          secondary100 == other.secondary100 &&
          secondary200 == other.secondary200 &&
          secondary300 == other.secondary300 &&
          secondary400 == other.secondary400 &&
          secondary500 == other.secondary500 &&
          secondary600 == other.secondary600 &&
          secondary700 == other.secondary700 &&
          secondary800 == other.secondary800 &&
          secondary900 == other.secondary900 &&
          secondary1000 == other.secondary1000 &&
          tertiary0 == other.tertiary0 &&
          tertiary10 == other.tertiary10 &&
          tertiary50 == other.tertiary50 &&
          tertiary100 == other.tertiary100 &&
          tertiary200 == other.tertiary200 &&
          tertiary300 == other.tertiary300 &&
          tertiary400 == other.tertiary400 &&
          tertiary500 == other.tertiary500 &&
          tertiary600 == other.tertiary600 &&
          tertiary700 == other.tertiary700 &&
          tertiary800 == other.tertiary800 &&
          tertiary900 == other.tertiary900 &&
          tertiary1000 == other.tertiary1000 &&
          neutral0 == other.neutral0 &&
          neutral10 == other.neutral10 &&
          neutral50 == other.neutral50 &&
          neutral100 == other.neutral100 &&
          neutral200 == other.neutral200 &&
          neutral300 == other.neutral300 &&
          neutral400 == other.neutral400 &&
          neutral500 == other.neutral500 &&
          neutral600 == other.neutral600 &&
          neutral700 == other.neutral700 &&
          neutral800 == other.neutral800 &&
          neutral900 == other.neutral900 &&
          neutral1000 == other.neutral1000 &&
          neutralVariant0 == other.neutralVariant0 &&
          neutralVariant10 == other.neutralVariant10 &&
          neutralVariant50 == other.neutralVariant50 &&
          neutralVariant100 == other.neutralVariant100 &&
          neutralVariant200 == other.neutralVariant200 &&
          neutralVariant300 == other.neutralVariant300 &&
          neutralVariant400 == other.neutralVariant400 &&
          neutralVariant500 == other.neutralVariant500 &&
          neutralVariant600 == other.neutralVariant600 &&
          neutralVariant700 == other.neutralVariant700 &&
          neutralVariant800 == other.neutralVariant800 &&
          neutralVariant900 == other.neutralVariant900 &&
          neutralVariant1000 == other.neutralVariant1000;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary0,
    primary10,
    primary50,
    primary100,
    primary200,
    primary300,
    primary400,
    primary500,
    primary600,
    primary700,
    primary800,
    primary900,
    primary1000,
    secondary0,
    secondary10,
    secondary50,
    secondary100,
    secondary200,
    Object.hash(
      secondary300,
      secondary400,
      secondary500,
      secondary600,
      secondary700,
      secondary800,
      secondary900,
      secondary1000,
      tertiary0,
      tertiary10,
      tertiary50,
      tertiary100,
      tertiary200,
      tertiary300,
      tertiary400,
      tertiary500,
      tertiary600,
      tertiary700,
      tertiary800,
      Object.hash(
        tertiary900,
        tertiary1000,
        neutral0,
        neutral10,
        neutral50,
        neutral100,
        neutral200,
        neutral300,
        neutral400,
        neutral500,
        neutral600,
        neutral700,
        neutral800,
        neutral900,
        neutral1000,
        neutralVariant0,
        neutralVariant10,
        neutralVariant50,
        neutralVariant100,
        Object.hash(
          neutralVariant200,
          neutralVariant300,
          neutralVariant400,
          neutralVariant500,
          neutralVariant600,
          neutralVariant700,
          neutralVariant800,
          neutralVariant900,
          neutralVariant1000,
        ),
      ),
    ),
  );
}

class _AndroidSystemPalette31 extends AndroidSystemPalette31 {
  const _AndroidSystemPalette31({
    required this.primary0,
    required this.primary10,
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    required this.primary1000,
    required this.secondary0,
    required this.secondary10,
    required this.secondary50,
    required this.secondary100,
    required this.secondary200,
    required this.secondary300,
    required this.secondary400,
    required this.secondary500,
    required this.secondary600,
    required this.secondary700,
    required this.secondary800,
    required this.secondary900,
    required this.secondary1000,
    required this.tertiary0,
    required this.tertiary10,
    required this.tertiary50,
    required this.tertiary100,
    required this.tertiary200,
    required this.tertiary300,
    required this.tertiary400,
    required this.tertiary500,
    required this.tertiary600,
    required this.tertiary700,
    required this.tertiary800,
    required this.tertiary900,
    required this.tertiary1000,
    required this.neutral0,
    required this.neutral10,
    required this.neutral50,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.neutral500,
    required this.neutral600,
    required this.neutral700,
    required this.neutral800,
    required this.neutral900,
    required this.neutral1000,
    required this.neutralVariant0,
    required this.neutralVariant10,
    required this.neutralVariant50,
    required this.neutralVariant100,
    required this.neutralVariant200,
    required this.neutralVariant300,
    required this.neutralVariant400,
    required this.neutralVariant500,
    required this.neutralVariant600,
    required this.neutralVariant700,
    required this.neutralVariant800,
    required this.neutralVariant900,
    required this.neutralVariant1000,
  });

  @override
  final Color primary0;

  @override
  final Color primary10;

  @override
  final Color primary50;

  @override
  final Color primary100;

  @override
  final Color primary200;

  @override
  final Color primary300;

  @override
  final Color primary400;

  @override
  final Color primary500;

  @override
  final Color primary600;

  @override
  final Color primary700;

  @override
  final Color primary800;

  @override
  final Color primary900;

  @override
  final Color primary1000;

  @override
  final Color secondary0;

  @override
  final Color secondary10;

  @override
  final Color secondary50;

  @override
  final Color secondary100;

  @override
  final Color secondary200;

  @override
  final Color secondary300;

  @override
  final Color secondary400;

  @override
  final Color secondary500;

  @override
  final Color secondary600;

  @override
  final Color secondary700;

  @override
  final Color secondary800;

  @override
  final Color secondary900;

  @override
  final Color secondary1000;

  @override
  final Color tertiary0;

  @override
  final Color tertiary10;

  @override
  final Color tertiary50;

  @override
  final Color tertiary100;

  @override
  final Color tertiary200;

  @override
  final Color tertiary300;

  @override
  final Color tertiary400;

  @override
  final Color tertiary500;

  @override
  final Color tertiary600;

  @override
  final Color tertiary700;

  @override
  final Color tertiary800;

  @override
  final Color tertiary900;

  @override
  final Color tertiary1000;

  @override
  final Color neutral0;

  @override
  final Color neutral10;

  @override
  final Color neutral50;

  @override
  final Color neutral100;

  @override
  final Color neutral200;

  @override
  final Color neutral300;

  @override
  final Color neutral400;

  @override
  final Color neutral500;

  @override
  final Color neutral600;

  @override
  final Color neutral700;

  @override
  final Color neutral800;

  @override
  final Color neutral900;

  @override
  final Color neutral1000;

  @override
  final Color neutralVariant0;

  @override
  final Color neutralVariant10;

  @override
  final Color neutralVariant50;

  @override
  final Color neutralVariant100;

  @override
  final Color neutralVariant200;

  @override
  final Color neutralVariant300;

  @override
  final Color neutralVariant400;

  @override
  final Color neutralVariant500;

  @override
  final Color neutralVariant600;

  @override
  final Color neutralVariant700;

  @override
  final Color neutralVariant800;

  @override
  final Color neutralVariant900;

  @override
  final Color neutralVariant1000;
}

abstract class AndroidSystemPalette35 extends AndroidSystemPalette31 {
  const AndroidSystemPalette35();

  const factory AndroidSystemPalette35.from({
    required Color primary0,
    required Color primary10,
    required Color primary50,
    required Color primary100,
    required Color primary200,
    required Color primary300,
    required Color primary400,
    required Color primary500,
    required Color primary600,
    required Color primary700,
    required Color primary800,
    required Color primary900,
    required Color primary1000,
    required Color secondary0,
    required Color secondary10,
    required Color secondary50,
    required Color secondary100,
    required Color secondary200,
    required Color secondary300,
    required Color secondary400,
    required Color secondary500,
    required Color secondary600,
    required Color secondary700,
    required Color secondary800,
    required Color secondary900,
    required Color secondary1000,
    required Color tertiary0,
    required Color tertiary10,
    required Color tertiary50,
    required Color tertiary100,
    required Color tertiary200,
    required Color tertiary300,
    required Color tertiary400,
    required Color tertiary500,
    required Color tertiary600,
    required Color tertiary700,
    required Color tertiary800,
    required Color tertiary900,
    required Color tertiary1000,
    required Color neutral0,
    required Color neutral10,
    required Color neutral50,
    required Color neutral100,
    required Color neutral200,
    required Color neutral300,
    required Color neutral400,
    required Color neutral500,
    required Color neutral600,
    required Color neutral700,
    required Color neutral800,
    required Color neutral900,
    required Color neutral1000,
    required Color neutralVariant0,
    required Color neutralVariant10,
    required Color neutralVariant50,
    required Color neutralVariant100,
    required Color neutralVariant200,
    required Color neutralVariant300,
    required Color neutralVariant400,
    required Color neutralVariant500,
    required Color neutralVariant600,
    required Color neutralVariant700,
    required Color neutralVariant800,
    required Color neutralVariant900,
    required Color neutralVariant1000,
    required Color error0,
    required Color error10,
    required Color error50,
    required Color error100,
    required Color error200,
    required Color error300,
    required Color error400,
    required Color error500,
    required Color error600,
    required Color error700,
    required Color error800,
    required Color error900,
    required Color error1000,
  }) = _AndroidSystemPalette35;

  Color get error0;
  Color get error10;
  Color get error50;
  Color get error100;
  Color get error200;
  Color get error300;
  Color get error400;
  Color get error500;
  Color get error600;
  Color get error700;
  Color get error800;
  Color get error900;
  Color get error1000;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("error0", error0))
      ..add(ColorProperty("error10", error10))
      ..add(ColorProperty("error50", error50))
      ..add(ColorProperty("error100", error100))
      ..add(ColorProperty("error200", error200))
      ..add(ColorProperty("error300", error300))
      ..add(ColorProperty("error400", error400))
      ..add(ColorProperty("error500", error500))
      ..add(ColorProperty("error600", error600))
      ..add(ColorProperty("error700", error700))
      ..add(ColorProperty("error800", error800))
      ..add(ColorProperty("error900", error900))
      ..add(ColorProperty("error1000", error1000));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is AndroidSystemPalette35 &&
          primary0 == other.primary0 &&
          primary10 == other.primary10 &&
          primary50 == other.primary50 &&
          primary100 == other.primary100 &&
          primary200 == other.primary200 &&
          primary300 == other.primary300 &&
          primary400 == other.primary400 &&
          primary500 == other.primary500 &&
          primary600 == other.primary600 &&
          primary700 == other.primary700 &&
          primary800 == other.primary800 &&
          primary900 == other.primary900 &&
          primary1000 == other.primary1000 &&
          secondary0 == other.secondary0 &&
          secondary10 == other.secondary10 &&
          secondary50 == other.secondary50 &&
          secondary100 == other.secondary100 &&
          secondary200 == other.secondary200 &&
          secondary300 == other.secondary300 &&
          secondary400 == other.secondary400 &&
          secondary500 == other.secondary500 &&
          secondary600 == other.secondary600 &&
          secondary700 == other.secondary700 &&
          secondary800 == other.secondary800 &&
          secondary900 == other.secondary900 &&
          secondary1000 == other.secondary1000 &&
          tertiary0 == other.tertiary0 &&
          tertiary10 == other.tertiary10 &&
          tertiary50 == other.tertiary50 &&
          tertiary100 == other.tertiary100 &&
          tertiary200 == other.tertiary200 &&
          tertiary300 == other.tertiary300 &&
          tertiary400 == other.tertiary400 &&
          tertiary500 == other.tertiary500 &&
          tertiary600 == other.tertiary600 &&
          tertiary700 == other.tertiary700 &&
          tertiary800 == other.tertiary800 &&
          tertiary900 == other.tertiary900 &&
          tertiary1000 == other.tertiary1000 &&
          neutral0 == other.neutral0 &&
          neutral10 == other.neutral10 &&
          neutral50 == other.neutral50 &&
          neutral100 == other.neutral100 &&
          neutral200 == other.neutral200 &&
          neutral300 == other.neutral300 &&
          neutral400 == other.neutral400 &&
          neutral500 == other.neutral500 &&
          neutral600 == other.neutral600 &&
          neutral700 == other.neutral700 &&
          neutral800 == other.neutral800 &&
          neutral900 == other.neutral900 &&
          neutral1000 == other.neutral1000 &&
          neutralVariant0 == other.neutralVariant0 &&
          neutralVariant10 == other.neutralVariant10 &&
          neutralVariant50 == other.neutralVariant50 &&
          neutralVariant100 == other.neutralVariant100 &&
          neutralVariant200 == other.neutralVariant200 &&
          neutralVariant300 == other.neutralVariant300 &&
          neutralVariant400 == other.neutralVariant400 &&
          neutralVariant500 == other.neutralVariant500 &&
          neutralVariant600 == other.neutralVariant600 &&
          neutralVariant700 == other.neutralVariant700 &&
          neutralVariant800 == other.neutralVariant800 &&
          neutralVariant900 == other.neutralVariant900 &&
          neutralVariant1000 == other.neutralVariant1000 &&
          error0 == other.error0 &&
          error10 == other.error10 &&
          error50 == other.error50 &&
          error100 == other.error100 &&
          error200 == other.error200 &&
          error300 == other.error300 &&
          error400 == other.error400 &&
          error500 == other.error500 &&
          error600 == other.error600 &&
          error700 == other.error700 &&
          error800 == other.error800 &&
          error900 == other.error900 &&
          error1000 == other.error1000;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary0,
    primary10,
    primary50,
    primary100,
    primary200,
    primary300,
    primary400,
    primary500,
    primary600,
    primary700,
    primary800,
    primary900,
    primary1000,
    secondary0,
    secondary10,
    secondary50,
    secondary100,
    secondary200,
    Object.hash(
      secondary300,
      secondary400,
      secondary500,
      secondary600,
      secondary700,
      secondary800,
      secondary900,
      secondary1000,
      tertiary0,
      tertiary10,
      tertiary50,
      tertiary100,
      tertiary200,
      tertiary300,
      tertiary400,
      tertiary500,
      tertiary600,
      tertiary700,
      tertiary800,
      Object.hash(
        tertiary900,
        tertiary1000,
        neutral0,
        neutral10,
        neutral50,
        neutral100,
        neutral200,
        neutral300,
        neutral400,
        neutral500,
        neutral600,
        neutral700,
        neutral800,
        neutral900,
        neutral1000,
        neutralVariant0,
        neutralVariant10,
        neutralVariant50,
        neutralVariant100,
        Object.hash(
          neutralVariant200,
          neutralVariant300,
          neutralVariant400,
          neutralVariant500,
          neutralVariant600,
          neutralVariant700,
          neutralVariant800,
          neutralVariant900,
          neutralVariant1000,
          error0,
          error10,
          error50,
          error100,
          error200,
          error300,
          error400,
          error500,
          error600,
          error700,
          Object.hash(error800, error900, error1000),
        ),
      ),
    ),
  );
}

class _AndroidSystemPalette35 extends AndroidSystemPalette35 {
  const _AndroidSystemPalette35({
    required this.primary0,
    required this.primary10,
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    required this.primary1000,
    required this.secondary0,
    required this.secondary10,
    required this.secondary50,
    required this.secondary100,
    required this.secondary200,
    required this.secondary300,
    required this.secondary400,
    required this.secondary500,
    required this.secondary600,
    required this.secondary700,
    required this.secondary800,
    required this.secondary900,
    required this.secondary1000,
    required this.tertiary0,
    required this.tertiary10,
    required this.tertiary50,
    required this.tertiary100,
    required this.tertiary200,
    required this.tertiary300,
    required this.tertiary400,
    required this.tertiary500,
    required this.tertiary600,
    required this.tertiary700,
    required this.tertiary800,
    required this.tertiary900,
    required this.tertiary1000,
    required this.neutral0,
    required this.neutral10,
    required this.neutral50,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.neutral500,
    required this.neutral600,
    required this.neutral700,
    required this.neutral800,
    required this.neutral900,
    required this.neutral1000,
    required this.neutralVariant0,
    required this.neutralVariant10,
    required this.neutralVariant50,
    required this.neutralVariant100,
    required this.neutralVariant200,
    required this.neutralVariant300,
    required this.neutralVariant400,
    required this.neutralVariant500,
    required this.neutralVariant600,
    required this.neutralVariant700,
    required this.neutralVariant800,
    required this.neutralVariant900,
    required this.neutralVariant1000,
    required this.error0,
    required this.error10,
    required this.error50,
    required this.error100,
    required this.error200,
    required this.error300,
    required this.error400,
    required this.error500,
    required this.error600,
    required this.error700,
    required this.error800,
    required this.error900,
    required this.error1000,
  });

  @override
  final Color primary0;

  @override
  final Color primary10;

  @override
  final Color primary50;

  @override
  final Color primary100;

  @override
  final Color primary200;

  @override
  final Color primary300;

  @override
  final Color primary400;

  @override
  final Color primary500;

  @override
  final Color primary600;

  @override
  final Color primary700;

  @override
  final Color primary800;

  @override
  final Color primary900;

  @override
  final Color primary1000;

  @override
  final Color secondary0;

  @override
  final Color secondary10;

  @override
  final Color secondary50;

  @override
  final Color secondary100;

  @override
  final Color secondary200;

  @override
  final Color secondary300;

  @override
  final Color secondary400;

  @override
  final Color secondary500;

  @override
  final Color secondary600;

  @override
  final Color secondary700;

  @override
  final Color secondary800;

  @override
  final Color secondary900;

  @override
  final Color secondary1000;

  @override
  final Color tertiary0;

  @override
  final Color tertiary10;

  @override
  final Color tertiary50;

  @override
  final Color tertiary100;

  @override
  final Color tertiary200;

  @override
  final Color tertiary300;

  @override
  final Color tertiary400;

  @override
  final Color tertiary500;

  @override
  final Color tertiary600;

  @override
  final Color tertiary700;

  @override
  final Color tertiary800;

  @override
  final Color tertiary900;

  @override
  final Color tertiary1000;

  @override
  final Color neutral0;

  @override
  final Color neutral10;

  @override
  final Color neutral50;

  @override
  final Color neutral100;

  @override
  final Color neutral200;

  @override
  final Color neutral300;

  @override
  final Color neutral400;

  @override
  final Color neutral500;

  @override
  final Color neutral600;

  @override
  final Color neutral700;

  @override
  final Color neutral800;

  @override
  final Color neutral900;

  @override
  final Color neutral1000;

  @override
  final Color neutralVariant0;

  @override
  final Color neutralVariant10;

  @override
  final Color neutralVariant50;

  @override
  final Color neutralVariant100;

  @override
  final Color neutralVariant200;

  @override
  final Color neutralVariant300;

  @override
  final Color neutralVariant400;

  @override
  final Color neutralVariant500;

  @override
  final Color neutralVariant600;

  @override
  final Color neutralVariant700;

  @override
  final Color neutralVariant800;

  @override
  final Color neutralVariant900;

  @override
  final Color neutralVariant1000;

  @override
  final Color error0;

  @override
  final Color error10;

  @override
  final Color error50;

  @override
  final Color error100;

  @override
  final Color error200;

  @override
  final Color error300;

  @override
  final Color error400;

  @override
  final Color error500;

  @override
  final Color error600;

  @override
  final Color error700;

  @override
  final Color error800;

  @override
  final Color error900;

  @override
  final Color error1000;
}
