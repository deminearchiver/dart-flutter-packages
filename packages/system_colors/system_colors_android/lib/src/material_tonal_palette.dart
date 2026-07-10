part of 'system_colors_android.dart';

abstract class MaterialTonalPalette with Diagnosticable {
  const MaterialTonalPalette();

  const factory MaterialTonalPalette.from({
    required Color primary0,
    required Color primary10,
    required Color primary20,
    required Color primary30,
    required Color primary40,
    required Color primary50,
    required Color primary60,
    required Color primary70,
    required Color primary80,
    required Color primary90,
    required Color primary95,
    required Color primary98,
    required Color primary99,
    required Color primary100,
    required Color secondary0,
    required Color secondary10,
    required Color secondary20,
    required Color secondary30,
    required Color secondary40,
    required Color secondary50,
    required Color secondary60,
    required Color secondary70,
    required Color secondary80,
    required Color secondary90,
    required Color secondary95,
    required Color secondary98,
    required Color secondary99,
    required Color secondary100,
    required Color tertiary0,
    required Color tertiary10,
    required Color tertiary20,
    required Color tertiary30,
    required Color tertiary40,
    required Color tertiary50,
    required Color tertiary60,
    required Color tertiary70,
    required Color tertiary80,
    required Color tertiary90,
    required Color tertiary95,
    required Color tertiary98,
    required Color tertiary99,
    required Color tertiary100,
    required Color neutral0,
    required Color neutral4,
    required Color neutral6,
    required Color neutral10,
    required Color neutral12,
    required Color neutral17,
    required Color neutral20,
    required Color neutral22,
    required Color neutral24,
    required Color neutral30,
    required Color neutral40,
    required Color neutral50,
    required Color neutral60,
    required Color neutral70,
    required Color neutral80,
    required Color neutral87,
    required Color neutral90,
    required Color neutral92,
    required Color neutral94,
    required Color neutral95,
    required Color neutral96,
    required Color neutral98,
    required Color neutral99,
    required Color neutral100,
    required Color neutralVariant0,
    required Color neutralVariant10,
    required Color neutralVariant20,
    required Color neutralVariant30,
    required Color neutralVariant40,
    required Color neutralVariant50,
    required Color neutralVariant60,
    required Color neutralVariant70,
    required Color neutralVariant80,
    required Color neutralVariant90,
    required Color neutralVariant95,
    required Color neutralVariant98,
    required Color neutralVariant99,
    required Color neutralVariant100,
    required Color error0,
    required Color error10,
    required Color error20,
    required Color error30,
    required Color error40,
    required Color error50,
    required Color error60,
    required Color error70,
    required Color error80,
    required Color error90,
    required Color error95,
    required Color error98,
    required Color error99,
    required Color error100,
  }) = _MaterialTonalPalette.from;

  Color get primary0;
  Color get primary10;
  Color get primary20;
  Color get primary30;
  Color get primary40;
  Color get primary50;
  Color get primary60;
  Color get primary70;
  Color get primary80;
  Color get primary90;
  Color get primary95;
  Color get primary98;
  Color get primary99;
  Color get primary100;
  Color get secondary0;
  Color get secondary10;
  Color get secondary20;
  Color get secondary30;
  Color get secondary40;
  Color get secondary50;
  Color get secondary60;
  Color get secondary70;
  Color get secondary80;
  Color get secondary90;
  Color get secondary95;
  Color get secondary98;
  Color get secondary99;
  Color get secondary100;
  Color get tertiary0;
  Color get tertiary10;
  Color get tertiary20;
  Color get tertiary30;
  Color get tertiary40;
  Color get tertiary50;
  Color get tertiary60;
  Color get tertiary70;
  Color get tertiary80;
  Color get tertiary90;
  Color get tertiary95;
  Color get tertiary98;
  Color get tertiary99;
  Color get tertiary100;
  Color get neutral0;
  Color get neutral4;
  Color get neutral6;
  Color get neutral10;
  Color get neutral12;
  Color get neutral17;
  Color get neutral20;
  Color get neutral22;
  Color get neutral24;
  Color get neutral30;
  Color get neutral40;
  Color get neutral50;
  Color get neutral60;
  Color get neutral70;
  Color get neutral80;
  Color get neutral87;
  Color get neutral90;
  Color get neutral92;
  Color get neutral94;
  Color get neutral95;
  Color get neutral96;
  Color get neutral98;
  Color get neutral99;
  Color get neutral100;
  Color get neutralVariant0;
  Color get neutralVariant10;
  Color get neutralVariant20;
  Color get neutralVariant30;
  Color get neutralVariant40;
  Color get neutralVariant50;
  Color get neutralVariant60;
  Color get neutralVariant70;
  Color get neutralVariant80;
  Color get neutralVariant90;
  Color get neutralVariant95;
  Color get neutralVariant98;
  Color get neutralVariant99;
  Color get neutralVariant100;
  Color get error0;
  Color get error10;
  Color get error20;
  Color get error30;
  Color get error40;
  Color get error50;
  Color get error60;
  Color get error70;
  Color get error80;
  Color get error90;
  Color get error95;
  Color get error98;
  Color get error99;
  Color get error100;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primary0", primary0))
      ..add(ColorProperty("primary10", primary10))
      ..add(ColorProperty("primary20", primary20))
      ..add(ColorProperty("primary30", primary30))
      ..add(ColorProperty("primary40", primary40))
      ..add(ColorProperty("primary50", primary50))
      ..add(ColorProperty("primary60", primary60))
      ..add(ColorProperty("primary70", primary70))
      ..add(ColorProperty("primary80", primary80))
      ..add(ColorProperty("primary90", primary90))
      ..add(ColorProperty("primary95", primary95))
      ..add(ColorProperty("primary98", primary98))
      ..add(ColorProperty("primary99", primary99))
      ..add(ColorProperty("primary100", primary100))
      ..add(ColorProperty("secondary0", secondary0))
      ..add(ColorProperty("secondary10", secondary10))
      ..add(ColorProperty("secondary20", secondary20))
      ..add(ColorProperty("secondary30", secondary30))
      ..add(ColorProperty("secondary40", secondary40))
      ..add(ColorProperty("secondary50", secondary50))
      ..add(ColorProperty("secondary60", secondary60))
      ..add(ColorProperty("secondary70", secondary70))
      ..add(ColorProperty("secondary80", secondary80))
      ..add(ColorProperty("secondary90", secondary90))
      ..add(ColorProperty("secondary95", secondary95))
      ..add(ColorProperty("secondary98", secondary98))
      ..add(ColorProperty("secondary99", secondary99))
      ..add(ColorProperty("secondary100", secondary100))
      ..add(ColorProperty("tertiary0", tertiary0))
      ..add(ColorProperty("tertiary10", tertiary10))
      ..add(ColorProperty("tertiary20", tertiary20))
      ..add(ColorProperty("tertiary30", tertiary30))
      ..add(ColorProperty("tertiary40", tertiary40))
      ..add(ColorProperty("tertiary50", tertiary50))
      ..add(ColorProperty("tertiary60", tertiary60))
      ..add(ColorProperty("tertiary70", tertiary70))
      ..add(ColorProperty("tertiary80", tertiary80))
      ..add(ColorProperty("tertiary90", tertiary90))
      ..add(ColorProperty("tertiary95", tertiary95))
      ..add(ColorProperty("tertiary98", tertiary98))
      ..add(ColorProperty("tertiary99", tertiary99))
      ..add(ColorProperty("tertiary100", tertiary100))
      ..add(ColorProperty("neutral0", neutral0))
      ..add(ColorProperty("neutral4", neutral4))
      ..add(ColorProperty("neutral6", neutral6))
      ..add(ColorProperty("neutral10", neutral10))
      ..add(ColorProperty("neutral12", neutral12))
      ..add(ColorProperty("neutral17", neutral17))
      ..add(ColorProperty("neutral20", neutral20))
      ..add(ColorProperty("neutral22", neutral22))
      ..add(ColorProperty("neutral24", neutral24))
      ..add(ColorProperty("neutral30", neutral30))
      ..add(ColorProperty("neutral40", neutral40))
      ..add(ColorProperty("neutral50", neutral50))
      ..add(ColorProperty("neutral60", neutral60))
      ..add(ColorProperty("neutral70", neutral70))
      ..add(ColorProperty("neutral80", neutral80))
      ..add(ColorProperty("neutral87", neutral87))
      ..add(ColorProperty("neutral90", neutral90))
      ..add(ColorProperty("neutral92", neutral92))
      ..add(ColorProperty("neutral94", neutral94))
      ..add(ColorProperty("neutral95", neutral95))
      ..add(ColorProperty("neutral96", neutral96))
      ..add(ColorProperty("neutral98", neutral98))
      ..add(ColorProperty("neutral99", neutral99))
      ..add(ColorProperty("neutral100", neutral100))
      ..add(ColorProperty("neutralVariant0", neutralVariant0))
      ..add(ColorProperty("neutralVariant10", neutralVariant10))
      ..add(ColorProperty("neutralVariant20", neutralVariant20))
      ..add(ColorProperty("neutralVariant30", neutralVariant30))
      ..add(ColorProperty("neutralVariant40", neutralVariant40))
      ..add(ColorProperty("neutralVariant50", neutralVariant50))
      ..add(ColorProperty("neutralVariant60", neutralVariant60))
      ..add(ColorProperty("neutralVariant70", neutralVariant70))
      ..add(ColorProperty("neutralVariant80", neutralVariant80))
      ..add(ColorProperty("neutralVariant90", neutralVariant90))
      ..add(ColorProperty("neutralVariant95", neutralVariant95))
      ..add(ColorProperty("neutralVariant98", neutralVariant98))
      ..add(ColorProperty("neutralVariant99", neutralVariant99))
      ..add(ColorProperty("neutralVariant100", neutralVariant100))
      ..add(ColorProperty("error0", error0))
      ..add(ColorProperty("error10", error10))
      ..add(ColorProperty("error20", error20))
      ..add(ColorProperty("error30", error30))
      ..add(ColorProperty("error40", error40))
      ..add(ColorProperty("error50", error50))
      ..add(ColorProperty("error60", error60))
      ..add(ColorProperty("error70", error70))
      ..add(ColorProperty("error80", error80))
      ..add(ColorProperty("error90", error90))
      ..add(ColorProperty("error95", error95))
      ..add(ColorProperty("error98", error98))
      ..add(ColorProperty("error99", error99))
      ..add(ColorProperty("error100", error100));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is MaterialTonalPalette &&
          primary0 == other.primary0 &&
          primary10 == other.primary10 &&
          primary20 == other.primary20 &&
          primary30 == other.primary30 &&
          primary40 == other.primary40 &&
          primary50 == other.primary50 &&
          primary60 == other.primary60 &&
          primary70 == other.primary70 &&
          primary80 == other.primary80 &&
          primary90 == other.primary90 &&
          primary95 == other.primary95 &&
          primary98 == other.primary98 &&
          primary99 == other.primary99 &&
          primary100 == other.primary100 &&
          secondary0 == other.secondary0 &&
          secondary10 == other.secondary10 &&
          secondary20 == other.secondary20 &&
          secondary30 == other.secondary30 &&
          secondary40 == other.secondary40 &&
          secondary50 == other.secondary50 &&
          secondary60 == other.secondary60 &&
          secondary70 == other.secondary70 &&
          secondary80 == other.secondary80 &&
          secondary90 == other.secondary90 &&
          secondary95 == other.secondary95 &&
          secondary98 == other.secondary98 &&
          secondary99 == other.secondary99 &&
          secondary100 == other.secondary100 &&
          tertiary0 == other.tertiary0 &&
          tertiary10 == other.tertiary10 &&
          tertiary20 == other.tertiary20 &&
          tertiary30 == other.tertiary30 &&
          tertiary40 == other.tertiary40 &&
          tertiary50 == other.tertiary50 &&
          tertiary60 == other.tertiary60 &&
          tertiary70 == other.tertiary70 &&
          tertiary80 == other.tertiary80 &&
          tertiary90 == other.tertiary90 &&
          tertiary95 == other.tertiary95 &&
          tertiary98 == other.tertiary98 &&
          tertiary99 == other.tertiary99 &&
          tertiary100 == other.tertiary100 &&
          neutral0 == other.neutral0 &&
          neutral4 == other.neutral4 &&
          neutral6 == other.neutral6 &&
          neutral10 == other.neutral10 &&
          neutral12 == other.neutral12 &&
          neutral17 == other.neutral17 &&
          neutral20 == other.neutral20 &&
          neutral22 == other.neutral22 &&
          neutral24 == other.neutral24 &&
          neutral30 == other.neutral30 &&
          neutral40 == other.neutral40 &&
          neutral50 == other.neutral50 &&
          neutral60 == other.neutral60 &&
          neutral70 == other.neutral70 &&
          neutral80 == other.neutral80 &&
          neutral87 == other.neutral87 &&
          neutral90 == other.neutral90 &&
          neutral92 == other.neutral92 &&
          neutral94 == other.neutral94 &&
          neutral95 == other.neutral95 &&
          neutral96 == other.neutral96 &&
          neutral98 == other.neutral98 &&
          neutral99 == other.neutral99 &&
          neutral100 == other.neutral100 &&
          neutralVariant0 == other.neutralVariant0 &&
          neutralVariant10 == other.neutralVariant10 &&
          neutralVariant20 == other.neutralVariant20 &&
          neutralVariant30 == other.neutralVariant30 &&
          neutralVariant40 == other.neutralVariant40 &&
          neutralVariant50 == other.neutralVariant50 &&
          neutralVariant60 == other.neutralVariant60 &&
          neutralVariant70 == other.neutralVariant70 &&
          neutralVariant80 == other.neutralVariant80 &&
          neutralVariant90 == other.neutralVariant90 &&
          neutralVariant95 == other.neutralVariant95 &&
          neutralVariant98 == other.neutralVariant98 &&
          neutralVariant99 == other.neutralVariant99 &&
          neutralVariant100 == other.neutralVariant100 &&
          error0 == other.error0 &&
          error10 == other.error10 &&
          error20 == other.error20 &&
          error30 == other.error30 &&
          error40 == other.error40 &&
          error50 == other.error50 &&
          error60 == other.error60 &&
          error70 == other.error70 &&
          error80 == other.error80 &&
          error90 == other.error90 &&
          error95 == other.error95 &&
          error98 == other.error98 &&
          error99 == other.error99 &&
          error100 == other.error100;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary0,
    primary10,
    primary20,
    primary30,
    primary40,
    primary50,
    primary60,
    primary70,
    primary80,
    primary90,
    primary95,
    primary98,
    primary99,
    primary100,
    secondary0,
    secondary10,
    secondary20,
    secondary30,
    Object.hash(
      secondary40,
      secondary50,
      secondary60,
      secondary70,
      secondary80,
      secondary90,
      secondary95,
      secondary98,
      secondary99,
      secondary100,
      tertiary0,
      tertiary10,
      tertiary20,
      tertiary30,
      tertiary40,
      tertiary50,
      tertiary60,
      tertiary70,
      tertiary80,
      Object.hash(
        tertiary90,
        tertiary95,
        tertiary98,
        tertiary99,
        tertiary100,
        neutral0,
        neutral4,
        neutral6,
        neutral10,
        neutral12,
        neutral17,
        neutral20,
        neutral22,
        neutral24,
        neutral30,
        neutral40,
        neutral50,
        neutral60,
        neutral70,
        Object.hash(
          neutral80,
          neutral87,
          neutral90,
          neutral92,
          neutral94,
          neutral95,
          neutral96,
          neutral98,
          neutral99,
          neutral100,
          neutralVariant0,
          neutralVariant10,
          neutralVariant20,
          neutralVariant30,
          neutralVariant40,
          neutralVariant50,
          neutralVariant60,
          neutralVariant70,
          neutralVariant80,
          Object.hash(
            neutralVariant90,
            neutralVariant95,
            neutralVariant98,
            neutralVariant99,
            neutralVariant100,
            error0,
            error10,
            error20,
            error30,
            error40,
            error50,
            error60,
            error70,
            error80,
            error90,
            error95,
            error98,
            error99,
            error100,
          ),
        ),
      ),
    ),
  );
}

class _MaterialTonalPalette extends MaterialTonalPalette {
  const _MaterialTonalPalette.from({
    required this.primary0,
    required this.primary10,
    required this.primary20,
    required this.primary30,
    required this.primary40,
    required this.primary50,
    required this.primary60,
    required this.primary70,
    required this.primary80,
    required this.primary90,
    required this.primary95,
    required this.primary98,
    required this.primary99,
    required this.primary100,
    required this.secondary0,
    required this.secondary10,
    required this.secondary20,
    required this.secondary30,
    required this.secondary40,
    required this.secondary50,
    required this.secondary60,
    required this.secondary70,
    required this.secondary80,
    required this.secondary90,
    required this.secondary95,
    required this.secondary98,
    required this.secondary99,
    required this.secondary100,
    required this.tertiary0,
    required this.tertiary10,
    required this.tertiary20,
    required this.tertiary30,
    required this.tertiary40,
    required this.tertiary50,
    required this.tertiary60,
    required this.tertiary70,
    required this.tertiary80,
    required this.tertiary90,
    required this.tertiary95,
    required this.tertiary98,
    required this.tertiary99,
    required this.tertiary100,
    required this.neutral0,
    required this.neutral4,
    required this.neutral6,
    required this.neutral10,
    required this.neutral12,
    required this.neutral17,
    required this.neutral20,
    required this.neutral22,
    required this.neutral24,
    required this.neutral30,
    required this.neutral40,
    required this.neutral50,
    required this.neutral60,
    required this.neutral70,
    required this.neutral80,
    required this.neutral87,
    required this.neutral90,
    required this.neutral92,
    required this.neutral94,
    required this.neutral95,
    required this.neutral96,
    required this.neutral98,
    required this.neutral99,
    required this.neutral100,
    required this.neutralVariant0,
    required this.neutralVariant10,
    required this.neutralVariant20,
    required this.neutralVariant30,
    required this.neutralVariant40,
    required this.neutralVariant50,
    required this.neutralVariant60,
    required this.neutralVariant70,
    required this.neutralVariant80,
    required this.neutralVariant90,
    required this.neutralVariant95,
    required this.neutralVariant98,
    required this.neutralVariant99,
    required this.neutralVariant100,
    required this.error0,
    required this.error10,
    required this.error20,
    required this.error30,
    required this.error40,
    required this.error50,
    required this.error60,
    required this.error70,
    required this.error80,
    required this.error90,
    required this.error95,
    required this.error98,
    required this.error99,
    required this.error100,
  });

  @override
  final Color primary0;

  @override
  final Color primary10;

  @override
  final Color primary20;

  @override
  final Color primary30;

  @override
  final Color primary40;

  @override
  final Color primary50;

  @override
  final Color primary60;

  @override
  final Color primary70;

  @override
  final Color primary80;

  @override
  final Color primary90;

  @override
  final Color primary95;

  @override
  final Color primary98;

  @override
  final Color primary99;

  @override
  final Color primary100;

  @override
  final Color secondary0;

  @override
  final Color secondary10;

  @override
  final Color secondary20;

  @override
  final Color secondary30;

  @override
  final Color secondary40;

  @override
  final Color secondary50;

  @override
  final Color secondary60;

  @override
  final Color secondary70;

  @override
  final Color secondary80;

  @override
  final Color secondary90;

  @override
  final Color secondary95;

  @override
  final Color secondary98;

  @override
  final Color secondary99;

  @override
  final Color secondary100;

  @override
  final Color tertiary0;

  @override
  final Color tertiary10;

  @override
  final Color tertiary20;

  @override
  final Color tertiary30;

  @override
  final Color tertiary40;

  @override
  final Color tertiary50;

  @override
  final Color tertiary60;

  @override
  final Color tertiary70;

  @override
  final Color tertiary80;

  @override
  final Color tertiary90;

  @override
  final Color tertiary95;

  @override
  final Color tertiary98;

  @override
  final Color tertiary99;

  @override
  final Color tertiary100;

  @override
  final Color neutral0;

  @override
  final Color neutral4;

  @override
  final Color neutral6;

  @override
  final Color neutral10;

  @override
  final Color neutral12;

  @override
  final Color neutral17;

  @override
  final Color neutral20;

  @override
  final Color neutral22;

  @override
  final Color neutral24;

  @override
  final Color neutral30;

  @override
  final Color neutral40;

  @override
  final Color neutral50;

  @override
  final Color neutral60;

  @override
  final Color neutral70;

  @override
  final Color neutral80;

  @override
  final Color neutral87;

  @override
  final Color neutral90;

  @override
  final Color neutral92;

  @override
  final Color neutral94;

  @override
  final Color neutral95;

  @override
  final Color neutral96;

  @override
  final Color neutral98;

  @override
  final Color neutral99;

  @override
  final Color neutral100;

  @override
  final Color neutralVariant0;

  @override
  final Color neutralVariant10;

  @override
  final Color neutralVariant20;

  @override
  final Color neutralVariant30;

  @override
  final Color neutralVariant40;

  @override
  final Color neutralVariant50;

  @override
  final Color neutralVariant60;

  @override
  final Color neutralVariant70;

  @override
  final Color neutralVariant80;

  @override
  final Color neutralVariant90;

  @override
  final Color neutralVariant95;

  @override
  final Color neutralVariant98;

  @override
  final Color neutralVariant99;

  @override
  final Color neutralVariant100;

  @override
  final Color error0;

  @override
  final Color error10;

  @override
  final Color error20;

  @override
  final Color error30;

  @override
  final Color error40;

  @override
  final Color error50;

  @override
  final Color error60;

  @override
  final Color error70;

  @override
  final Color error80;

  @override
  final Color error90;

  @override
  final Color error95;

  @override
  final Color error98;

  @override
  final Color error99;

  @override
  final Color error100;
}
