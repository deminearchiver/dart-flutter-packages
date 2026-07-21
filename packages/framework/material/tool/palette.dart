// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';

import 'src/hash_code.dart';

extension type const _Token._(
  ({String identifier, String value, String path}) _
) implements Object {
  const _Token({
    required String identifier,
    required String value,
    required String path,
  }) : _ = (identifier: identifier, value: value, path: path);

  String get identifier => _.identifier;

  String get value => _.value;

  String get path => _.path;
}

// dart format off
const _tokens = <_Token>[
  .new(identifier: "black", value: "0xFF000000", path: "md.ref.palette.black"),
  .new(identifier: "blue0", value: "0xFF000000", path: "md.ref.palette.blue0"),
  .new(identifier: "blue10", value: "0xFF001944", path: "md.ref.palette.blue10"),
  .new(identifier: "blue100", value: "0xFFFFFFFF", path: "md.ref.palette.blue100"),
  .new(identifier: "blue20", value: "0xFF012C6F", path: "md.ref.palette.blue20"),
  .new(identifier: "blue30", value: "0xFF04409F", path: "md.ref.palette.blue30"),
  .new(identifier: "blue40", value: "0xFF1157CE", path: "md.ref.palette.blue40"),
  .new(identifier: "blue50", value: "0xFF3271EA", path: "md.ref.palette.blue50"),
  .new(identifier: "blue60", value: "0xFF4E8FF8", path: "md.ref.palette.blue60"),
  .new(identifier: "blue70", value: "0xFF76ACFF", path: "md.ref.palette.blue70"),
  .new(identifier: "blue80", value: "0xFFA1C9FF", path: "md.ref.palette.blue80"),
  .new(identifier: "blue90", value: "0xFFD0E4FF", path: "md.ref.palette.blue90"),
  .new(identifier: "blue95", value: "0xFFE7F2FF", path: "md.ref.palette.blue95"),
  .new(identifier: "blue98", value: "0xFFF5FAFF", path: "md.ref.palette.blue98"),
  .new(identifier: "blueVariant0", value: "0xFF000000", path: "md.ref.palette.blue-variant0"),
  .new(identifier: "blueVariant10", value: "0xFF001F2D", path: "md.ref.palette.blue-variant10"),
  .new(identifier: "blueVariant100", value: "0xFFFFFFFF", path: "md.ref.palette.blue-variant100"),
  .new(identifier: "blueVariant20", value: "0xFF003549", path: "md.ref.palette.blue-variant20"),
  .new(identifier: "blueVariant30", value: "0xFF004D68", path: "md.ref.palette.blue-variant30"),
  .new(identifier: "blueVariant40", value: "0xFF006788", path: "md.ref.palette.blue-variant40"),
  .new(identifier: "blueVariant50", value: "0xFF0081A8", path: "md.ref.palette.blue-variant50"),
  .new(identifier: "blueVariant60", value: "0xFF009DC9", path: "md.ref.palette.blue-variant60"),
  .new(identifier: "blueVariant70", value: "0xFF00BBEA", path: "md.ref.palette.blue-variant70"),
  .new(identifier: "blueVariant80", value: "0xFF67D4FF", path: "md.ref.palette.blue-variant80"),
  .new(identifier: "blueVariant90", value: "0xFFBDE9FF", path: "md.ref.palette.blue-variant90"),
  .new(identifier: "blueVariant95", value: "0xFFE0F4FF", path: "md.ref.palette.blue-variant95"),
  .new(identifier: "blueVariant98", value: "0xFFF4FAFF", path: "md.ref.palette.blue-variant98"),
  .new(identifier: "cyan0", value: "0xFF000000", path: "md.ref.palette.cyan0"),
  .new(identifier: "cyan10", value: "0xFF001F26", path: "md.ref.palette.cyan10"),
  .new(identifier: "cyan100", value: "0xFFFFFFFF", path: "md.ref.palette.cyan100"),
  .new(identifier: "cyan20", value: "0xFF003641", path: "md.ref.palette.cyan20"),
  .new(identifier: "cyan30", value: "0xFF004E5D", path: "md.ref.palette.cyan30"),
  .new(identifier: "cyan40", value: "0xFF00687C", path: "md.ref.palette.cyan40"),
  .new(identifier: "cyan50", value: "0xFF00839B", path: "md.ref.palette.cyan50"),
  .new(identifier: "cyan60", value: "0xFF009EBB", path: "md.ref.palette.cyan60"),
  .new(identifier: "cyan70", value: "0xFF00BBDF", path: "md.ref.palette.cyan70"),
  .new(identifier: "cyan80", value: "0xFF60D5F3", path: "md.ref.palette.cyan80"),
  .new(identifier: "cyan90", value: "0xFFACEDFF", path: "md.ref.palette.cyan90"),
  .new(identifier: "cyan95", value: "0xFFD8F6FF", path: "md.ref.palette.cyan95"),
  .new(identifier: "cyan98", value: "0xFFF0FBFF", path: "md.ref.palette.cyan98"),
  .new(identifier: "error0", value: "0xFF000000", path: "md.ref.palette.error0"),
  .new(identifier: "error10", value: "0xFF410E0B", path: "md.ref.palette.error10"),
  .new(identifier: "error100", value: "0xFFFFFFFF", path: "md.ref.palette.error100"),
  .new(identifier: "error20", value: "0xFF601410", path: "md.ref.palette.error20"),
  .new(identifier: "error30", value: "0xFF8C1D18", path: "md.ref.palette.error30"),
  .new(identifier: "error40", value: "0xFFB3261E", path: "md.ref.palette.error40"),
  .new(identifier: "error50", value: "0xFFDC362E", path: "md.ref.palette.error50"),
  .new(identifier: "error60", value: "0xFFE46962", path: "md.ref.palette.error60"),
  .new(identifier: "error70", value: "0xFFEC928E", path: "md.ref.palette.error70"),
  .new(identifier: "error80", value: "0xFFF2B8B5", path: "md.ref.palette.error80"),
  .new(identifier: "error90", value: "0xFFF9DEDC", path: "md.ref.palette.error90"),
  .new(identifier: "error95", value: "0xFFFCEEEE", path: "md.ref.palette.error95"),
  .new(identifier: "error98", value: "0xFFFFF8F7", path: "md.ref.palette.error98"),
  .new(identifier: "error99", value: "0xFFFFFBF9", path: "md.ref.palette.error99"),
  .new(identifier: "green0", value: "0xFF000000", path: "md.ref.palette.green0"),
  .new(identifier: "green10", value: "0xFF002110", path: "md.ref.palette.green10"),
  .new(identifier: "green100", value: "0xFFFFFFFF", path: "md.ref.palette.green100"),
  .new(identifier: "green20", value: "0xFF00381F", path: "md.ref.palette.green20"),
  .new(identifier: "green30", value: "0xFF00522C", path: "md.ref.palette.green30"),
  .new(identifier: "green40", value: "0xFF006C35", path: "md.ref.palette.green40"),
  .new(identifier: "green50", value: "0xFF128937", path: "md.ref.palette.green50"),
  .new(identifier: "green60", value: "0xFF1AA64A", path: "md.ref.palette.green60"),
  .new(identifier: "green70", value: "0xFF44C265", path: "md.ref.palette.green70"),
  .new(identifier: "green80", value: "0xFF80DA88", path: "md.ref.palette.green80"),
  .new(identifier: "green90", value: "0xFFBEEFBB", path: "md.ref.palette.green90"),
  .new(identifier: "green95", value: "0xFFDDF8D8", path: "md.ref.palette.green95"),
  .new(identifier: "green98", value: "0xFFF2FCEF", path: "md.ref.palette.green98"),
  .new(identifier: "grey0", value: "0xFF000000", path: "md.ref.palette.grey0"),
  .new(identifier: "grey10", value: "0xFF1B1B1C", path: "md.ref.palette.grey10"),
  .new(identifier: "grey100", value: "0xFFFFFFFF", path: "md.ref.palette.grey100"),
  .new(identifier: "grey20", value: "0xFF303030", path: "md.ref.palette.grey20"),
  .new(identifier: "grey30", value: "0xFF474747", path: "md.ref.palette.grey30"),
  .new(identifier: "grey40", value: "0xFF5E5E5E", path: "md.ref.palette.grey40"),
  .new(identifier: "grey50", value: "0xFF777777", path: "md.ref.palette.grey50"),
  .new(identifier: "grey60", value: "0xFF919191", path: "md.ref.palette.grey60"),
  .new(identifier: "grey70", value: "0xFFABABAB", path: "md.ref.palette.grey70"),
  .new(identifier: "grey80", value: "0xFFC7C7C7", path: "md.ref.palette.grey80"),
  .new(identifier: "grey90", value: "0xFFE3E3E3", path: "md.ref.palette.grey90"),
  .new(identifier: "grey95", value: "0xFFF2F2F2", path: "md.ref.palette.grey95"),
  .new(identifier: "grey98", value: "0xFFF9F9F9", path: "md.ref.palette.grey98"),
  .new(identifier: "greyVariant0", value: "0xFF000000", path: "md.ref.palette.grey-variant0"),
  .new(identifier: "greyVariant10", value: "0xFF191D1C", path: "md.ref.palette.grey-variant10"),
  .new(identifier: "greyVariant100", value: "0xFFFFFFFF", path: "md.ref.palette.grey-variant100"),
  .new(identifier: "greyVariant20", value: "0xFF2D312F", path: "md.ref.palette.grey-variant20"),
  .new(identifier: "greyVariant30", value: "0xFF444746", path: "md.ref.palette.grey-variant30"),
  .new(identifier: "greyVariant40", value: "0xFF5C5F5E", path: "md.ref.palette.grey-variant40"),
  .new(identifier: "greyVariant50", value: "0xFF747775", path: "md.ref.palette.grey-variant50"),
  .new(identifier: "greyVariant60", value: "0xFF8E918F", path: "md.ref.palette.grey-variant60"),
  .new(identifier: "greyVariant70", value: "0xFFA9ACAA", path: "md.ref.palette.grey-variant70"),
  .new(identifier: "greyVariant80", value: "0xFFC4C7C5", path: "md.ref.palette.grey-variant80"),
  .new(identifier: "greyVariant90", value: "0xFFE1E3E1", path: "md.ref.palette.grey-variant90"),
  .new(identifier: "greyVariant95", value: "0xFFEFF2EF", path: "md.ref.palette.grey-variant95"),
  .new(identifier: "greyVariant98", value: "0xFFF7FAF7", path: "md.ref.palette.grey-variant98"),
  .new(identifier: "neutral0", value: "0xFF000000", path: "md.ref.palette.neutral0"),
  .new(identifier: "neutral10", value: "0xFF1D1B20", path: "md.ref.palette.neutral10"),
  .new(identifier: "neutral100", value: "0xFFFFFFFF", path: "md.ref.palette.neutral100"),
  .new(identifier: "neutral12", value: "0xFF211F26", path: "md.ref.palette.neutral12"),
  .new(identifier: "neutral17", value: "0xFF2B2930", path: "md.ref.palette.neutral17"),
  .new(identifier: "neutral20", value: "0xFF322F35", path: "md.ref.palette.neutral20"),
  .new(identifier: "neutral22", value: "0xFF36343B", path: "md.ref.palette.neutral22"),
  .new(identifier: "neutral24", value: "0xFF3B383E", path: "md.ref.palette.neutral24"),
  .new(identifier: "neutral30", value: "0xFF48464C", path: "md.ref.palette.neutral30"),
  .new(identifier: "neutral4", value: "0xFF0F0D13", path: "md.ref.palette.neutral4"),
  .new(identifier: "neutral40", value: "0xFF605D64", path: "md.ref.palette.neutral40"),
  .new(identifier: "neutral50", value: "0xFF79767D", path: "md.ref.palette.neutral50"),
  .new(identifier: "neutral6", value: "0xFF141218", path: "md.ref.palette.neutral6"),
  .new(identifier: "neutral60", value: "0xFF938F96", path: "md.ref.palette.neutral60"),
  .new(identifier: "neutral70", value: "0xFFAEA9B1", path: "md.ref.palette.neutral70"),
  .new(identifier: "neutral80", value: "0xFFCAC5CD", path: "md.ref.palette.neutral80"),
  .new(identifier: "neutral87", value: "0xFFDED8E1", path: "md.ref.palette.neutral87"),
  .new(identifier: "neutral90", value: "0xFFE6E0E9", path: "md.ref.palette.neutral90"),
  .new(identifier: "neutral92", value: "0xFFECE6F0", path: "md.ref.palette.neutral92"),
  .new(identifier: "neutral94", value: "0xFFF3EDF7", path: "md.ref.palette.neutral94"),
  .new(identifier: "neutral95", value: "0xFFF5EFF7", path: "md.ref.palette.neutral95"),
  .new(identifier: "neutral96", value: "0xFFF7F2FA", path: "md.ref.palette.neutral96"),
  .new(identifier: "neutral98", value: "0xFFFEF7FF", path: "md.ref.palette.neutral98"),
  .new(identifier: "neutral99", value: "0xFFFFFBFF", path: "md.ref.palette.neutral99"),
  .new(identifier: "neutralVariant0", value: "0xFF000000", path: "md.ref.palette.neutral-variant0"),
  .new(identifier: "neutralVariant10", value: "0xFF1D1A22", path: "md.ref.palette.neutral-variant10"),
  .new(identifier: "neutralVariant100", value: "0xFFFFFFFF", path: "md.ref.palette.neutral-variant100"),
  .new(identifier: "neutralVariant20", value: "0xFF322F37", path: "md.ref.palette.neutral-variant20"),
  .new(identifier: "neutralVariant30", value: "0xFF49454F", path: "md.ref.palette.neutral-variant30"),
  .new(identifier: "neutralVariant40", value: "0xFF605D66", path: "md.ref.palette.neutral-variant40"),
  .new(identifier: "neutralVariant50", value: "0xFF79747E", path: "md.ref.palette.neutral-variant50"),
  .new(identifier: "neutralVariant60", value: "0xFF938F99", path: "md.ref.palette.neutral-variant60"),
  .new(identifier: "neutralVariant70", value: "0xFFAEA9B4", path: "md.ref.palette.neutral-variant70"),
  .new(identifier: "neutralVariant80", value: "0xFFCAC4D0", path: "md.ref.palette.neutral-variant80"),
  .new(identifier: "neutralVariant90", value: "0xFFE7E0EC", path: "md.ref.palette.neutral-variant90"),
  .new(identifier: "neutralVariant95", value: "0xFFF5EEFA", path: "md.ref.palette.neutral-variant95"),
  .new(identifier: "neutralVariant98", value: "0xFFFDF7FF", path: "md.ref.palette.neutral-variant98"),
  .new(identifier: "neutralVariant99", value: "0xFFFFFBFE", path: "md.ref.palette.neutral-variant99"),
  .new(identifier: "orange0", value: "0xFF000000", path: "md.ref.palette.orange0"),
  .new(identifier: "orange10", value: "0xFF321200", path: "md.ref.palette.orange10"),
  .new(identifier: "orange100", value: "0xFFFFFFFF", path: "md.ref.palette.orange100"),
  .new(identifier: "orange20", value: "0xFF522302", path: "md.ref.palette.orange20"),
  .new(identifier: "orange30", value: "0xFF753403", path: "md.ref.palette.orange30"),
  .new(identifier: "orange40", value: "0xFF9A4600", path: "md.ref.palette.orange40"),
  .new(identifier: "orange50", value: "0xFFC05A01", path: "md.ref.palette.orange50"),
  .new(identifier: "orange60", value: "0xFFE86E00", path: "md.ref.palette.orange60"),
  .new(identifier: "orange70", value: "0xFFFF8D41", path: "md.ref.palette.orange70"),
  .new(identifier: "orange80", value: "0xFFFFB683", path: "md.ref.palette.orange80"),
  .new(identifier: "orange90", value: "0xFFFFDCC3", path: "md.ref.palette.orange90"),
  .new(identifier: "orange95", value: "0xFFFFEDE1", path: "md.ref.palette.orange95"),
  .new(identifier: "orange98", value: "0xFFFFF8F4", path: "md.ref.palette.orange98"),
  .new(identifier: "pink0", value: "0xFF000000", path: "md.ref.palette.pink0"),
  .new(identifier: "pink10", value: "0xFF3D0023", path: "md.ref.palette.pink10"),
  .new(identifier: "pink100", value: "0xFFFFFFFF", path: "md.ref.palette.pink100"),
  .new(identifier: "pink20", value: "0xFF620438", path: "md.ref.palette.pink20"),
  .new(identifier: "pink30", value: "0xFF8D0053", path: "md.ref.palette.pink30"),
  .new(identifier: "pink40", value: "0xFFB60D6E", path: "md.ref.palette.pink40"),
  .new(identifier: "pink50", value: "0xFFDC258D", path: "md.ref.palette.pink50"),
  .new(identifier: "pink60", value: "0xFFF94AAB", path: "md.ref.palette.pink60"),
  .new(identifier: "pink70", value: "0xFFFF7DD2", path: "md.ref.palette.pink70"),
  .new(identifier: "pink80", value: "0xFFFFAEE4", path: "md.ref.palette.pink80"),
  .new(identifier: "pink90", value: "0xFFFFD8EF", path: "md.ref.palette.pink90"),
  .new(identifier: "pink95", value: "0xFFFFECF6", path: "md.ref.palette.pink95"),
  .new(identifier: "pink98", value: "0xFFFFF7FC", path: "md.ref.palette.pink98"),
  .new(identifier: "primary0", value: "0xFF000000", path: "md.ref.palette.primary0"),
  .new(identifier: "primary10", value: "0xFF21005D", path: "md.ref.palette.primary10"),
  .new(identifier: "primary100", value: "0xFFFFFFFF", path: "md.ref.palette.primary100"),
  .new(identifier: "primary20", value: "0xFF381E72", path: "md.ref.palette.primary20"),
  .new(identifier: "primary30", value: "0xFF4F378B", path: "md.ref.palette.primary30"),
  .new(identifier: "primary40", value: "0xFF6750A4", path: "md.ref.palette.primary40"),
  .new(identifier: "primary50", value: "0xFF7F67BE", path: "md.ref.palette.primary50"),
  .new(identifier: "primary60", value: "0xFF9A82DB", path: "md.ref.palette.primary60"),
  .new(identifier: "primary70", value: "0xFFB69DF8", path: "md.ref.palette.primary70"),
  .new(identifier: "primary80", value: "0xFFD0BCFF", path: "md.ref.palette.primary80"),
  .new(identifier: "primary90", value: "0xFFEADDFF", path: "md.ref.palette.primary90"),
  .new(identifier: "primary95", value: "0xFFF6EDFF", path: "md.ref.palette.primary95"),
  .new(identifier: "primary98", value: "0xFFFEF7FF", path: "md.ref.palette.primary98"),
  .new(identifier: "primary99", value: "0xFFFFFBFE", path: "md.ref.palette.primary99"),
  .new(identifier: "purple0", value: "0xFF000000", path: "md.ref.palette.purple0"),
  .new(identifier: "purple10", value: "0xFF280255", path: "md.ref.palette.purple10"),
  .new(identifier: "purple100", value: "0xFFFFFFFF", path: "md.ref.palette.purple100"),
  .new(identifier: "purple20", value: "0xFF400B84", path: "md.ref.palette.purple20"),
  .new(identifier: "purple30", value: "0xFF5629A4", path: "md.ref.palette.purple30"),
  .new(identifier: "purple40", value: "0xFF7438D2", path: "md.ref.palette.purple40"),
  .new(identifier: "purple50", value: "0xFF9254EA", path: "md.ref.palette.purple50"),
  .new(identifier: "purple60", value: "0xFFAD72FF", path: "md.ref.palette.purple60"),
  .new(identifier: "purple70", value: "0xFFC597FF", path: "md.ref.palette.purple70"),
  .new(identifier: "purple80", value: "0xFFD9BAFD", path: "md.ref.palette.purple80"),
  .new(identifier: "purple90", value: "0xFFEEDCFE", path: "md.ref.palette.purple90"),
  .new(identifier: "purple95", value: "0xFFF7ECFE", path: "md.ref.palette.purple95"),
  .new(identifier: "purple98", value: "0xFFFDF8FF", path: "md.ref.palette.purple98"),
  .new(identifier: "red0", value: "0xFF000000", path: "md.ref.palette.red0"),
  .new(identifier: "red10", value: "0xFF3A0907", path: "md.ref.palette.red10"),
  .new(identifier: "red100", value: "0xFFFFFFFF", path: "md.ref.palette.red100"),
  .new(identifier: "red20", value: "0xFF60150F", path: "md.ref.palette.red20"),
  .new(identifier: "red30", value: "0xFF8A1A16", path: "md.ref.palette.red30"),
  .new(identifier: "red40", value: "0xFFB3251E", path: "md.ref.palette.red40"),
  .new(identifier: "red50", value: "0xFFDB372D", path: "md.ref.palette.red50"),
  .new(identifier: "red60", value: "0xFFF55E57", path: "md.ref.palette.red60"),
  .new(identifier: "red70", value: "0xFFFF8983", path: "md.ref.palette.red70"),
  .new(identifier: "red80", value: "0xFFFFB3AE", path: "md.ref.palette.red80"),
  .new(identifier: "red90", value: "0xFFFFDADC", path: "md.ref.palette.red90"),
  .new(identifier: "red95", value: "0xFFFFECEE", path: "md.ref.palette.red95"),
  .new(identifier: "red98", value: "0xFFFFF8F8", path: "md.ref.palette.red98"),
  .new(identifier: "secondary0", value: "0xFF000000", path: "md.ref.palette.secondary0"),
  .new(identifier: "secondary10", value: "0xFF1D192B", path: "md.ref.palette.secondary10"),
  .new(identifier: "secondary100", value: "0xFFFFFFFF", path: "md.ref.palette.secondary100"),
  .new(identifier: "secondary20", value: "0xFF332D41", path: "md.ref.palette.secondary20"),
  .new(identifier: "secondary30", value: "0xFF4A4458", path: "md.ref.palette.secondary30"),
  .new(identifier: "secondary40", value: "0xFF625B71", path: "md.ref.palette.secondary40"),
  .new(identifier: "secondary50", value: "0xFF7A7289", path: "md.ref.palette.secondary50"),
  .new(identifier: "secondary60", value: "0xFF958DA5", path: "md.ref.palette.secondary60"),
  .new(identifier: "secondary70", value: "0xFFB0A7C0", path: "md.ref.palette.secondary70"),
  .new(identifier: "secondary80", value: "0xFFCCC2DC", path: "md.ref.palette.secondary80"),
  .new(identifier: "secondary90", value: "0xFFE8DEF8", path: "md.ref.palette.secondary90"),
  .new(identifier: "secondary95", value: "0xFFF6EDFF", path: "md.ref.palette.secondary95"),
  .new(identifier: "secondary98", value: "0xFFFEF7FF", path: "md.ref.palette.secondary98"),
  .new(identifier: "secondary99", value: "0xFFFFFBFE", path: "md.ref.palette.secondary99"),
  .new(identifier: "tertiary0", value: "0xFF000000", path: "md.ref.palette.tertiary0"),
  .new(identifier: "tertiary10", value: "0xFF31111D", path: "md.ref.palette.tertiary10"),
  .new(identifier: "tertiary100", value: "0xFFFFFFFF", path: "md.ref.palette.tertiary100"),
  .new(identifier: "tertiary20", value: "0xFF492532", path: "md.ref.palette.tertiary20"),
  .new(identifier: "tertiary30", value: "0xFF633B48", path: "md.ref.palette.tertiary30"),
  .new(identifier: "tertiary40", value: "0xFF7D5260", path: "md.ref.palette.tertiary40"),
  .new(identifier: "tertiary50", value: "0xFF986977", path: "md.ref.palette.tertiary50"),
  .new(identifier: "tertiary60", value: "0xFFB58392", path: "md.ref.palette.tertiary60"),
  .new(identifier: "tertiary70", value: "0xFFD29DAC", path: "md.ref.palette.tertiary70"),
  .new(identifier: "tertiary80", value: "0xFFEFB8C8", path: "md.ref.palette.tertiary80"),
  .new(identifier: "tertiary90", value: "0xFFFFD8E4", path: "md.ref.palette.tertiary90"),
  .new(identifier: "tertiary95", value: "0xFFFFECF1", path: "md.ref.palette.tertiary95"),
  .new(identifier: "tertiary98", value: "0xFFFFF8F8", path: "md.ref.palette.tertiary98"),
  .new(identifier: "tertiary99", value: "0xFFFFFBFA", path: "md.ref.palette.tertiary99"),
  .new(identifier: "white", value: "0xFFFFFFFF", path: "md.ref.palette.white"),
  .new(identifier: "yellow0", value: "0xFF000000", path: "md.ref.palette.yellow0"),
  .new(identifier: "yellow10", value: "0xFF2F1400", path: "md.ref.palette.yellow10"),
  .new(identifier: "yellow100", value: "0xFFFFFFFF", path: "md.ref.palette.yellow100"),
  .new(identifier: "yellow20", value: "0xFF4D2600", path: "md.ref.palette.yellow20"),
  .new(identifier: "yellow30", value: "0xFF6D3A01", path: "md.ref.palette.yellow30"),
  .new(identifier: "yellow40", value: "0xFF8F4E06", path: "md.ref.palette.yellow40"),
  .new(identifier: "yellow50", value: "0xFFB16300", path: "md.ref.palette.yellow50"),
  .new(identifier: "yellow60", value: "0xFFD37B00", path: "md.ref.palette.yellow60"),
  .new(identifier: "yellow70", value: "0xFFEF9800", path: "md.ref.palette.yellow70"),
  .new(identifier: "yellow80", value: "0xFFFCBD00", path: "md.ref.palette.yellow80"),
  .new(identifier: "yellow90", value: "0xFFFFE07C", path: "md.ref.palette.yellow90"),
  .new(identifier: "yellow95", value: "0xFFFFF2B4", path: "md.ref.palette.yellow95"),
  .new(identifier: "yellow98", value: "0xFFFFFADE", path: "md.ref.palette.yellow98"),
];
// dart format on

enum _DataObjectKind { partial, concrete }

enum _DataObjectPart {
  partialInterface(kind: .partial, overrides: false),
  partialImplementation(kind: .partial, overrides: true),
  partialAsConcreteImplementation(kind: .concrete, overrides: true),
  concreteInterface(kind: .concrete, overrides: true),
  concreteImplementation(kind: .concrete, overrides: true),
  concreteDefaultsImplementation(kind: .concrete, overrides: true);

  const _DataObjectPart({required this.kind, required this.overrides});

  final _DataObjectKind kind;

  final bool overrides;
}

extension type const _DataObjectIdentifiers._(
  ({
    String partialInterface,
    String partialImplementation,
    String partialAsConcreteImplementation,
    String concreteInterface,
    String concreteImplementation,
    String concreteDefaultsImplementation,
  })
  _
) implements Object {
  const _DataObjectIdentifiers({
    required String partialInterface,
    required String partialImplementation,
    required String partialAsConcreteImplementation,
    required String concreteInterface,
    required String concreteImplementation,
    required String concreteDefaultsImplementation,
  }) : _ = (
         partialInterface: partialInterface,
         partialImplementation: partialImplementation,
         partialAsConcreteImplementation: partialAsConcreteImplementation,
         concreteInterface: concreteInterface,
         concreteImplementation: concreteImplementation,
         concreteDefaultsImplementation: concreteDefaultsImplementation,
       );

  String get partialInterface => _.partialInterface;

  String get partialImplementation => _.partialImplementation;

  String get partialAsConcreteImplementation =>
      _.partialAsConcreteImplementation;

  String get concreteInterface => _.concreteInterface;

  String get concreteImplementation => _.concreteImplementation;

  String get concreteDefaultsImplementation => _.concreteDefaultsImplementation;

  String operator [](_DataObjectPart part) => switch (part) {
    .partialInterface => partialInterface,
    .partialImplementation => partialImplementation,
    .partialAsConcreteImplementation => partialAsConcreteImplementation,
    .concreteInterface => concreteInterface,
    .concreteImplementation => concreteImplementation,
    .concreteDefaultsImplementation => concreteDefaultsImplementation,
  };
}

String _buildCode(List<_Token> tokens) {
  final buffer = StringBuffer();

  void writePart({
    required _DataObjectPart part,
    required _DataObjectIdentifiers identifiers,
  }) {
    final parameterPrefix = switch (part.kind) {
      .partial => "",
      .concrete => "required ",
    };

    final partialType = identifiers.partialInterface;
    final implementationType = switch (part.kind) {
      .partial => identifiers.partialImplementation,
      .concrete => identifiers.concreteImplementation,
    };
    final concreteType = identifiers.concreteInterface;
    final thisType = identifiers[part];
    final interfaceType = switch (part.kind) {
      .partial => identifiers.partialInterface,
      .concrete => identifiers.concreteInterface,
    };

    const concreteValueType = "Color";
    const partialValueType = "$concreteValueType?";
    final thisValueType = switch (part.kind) {
      .partial => partialValueType,
      .concrete => concreteValueType,
    };

    final overridesParameter = switch (part) {
      .partialAsConcreteImplementation => "value",
      .concreteDefaultsImplementation => "overrides",
      _ => "",
    };

    final overridesIdentifier = switch (part) {
      .partialAsConcreteImplementation => "_value",
      .concreteDefaultsImplementation => "_overrides",
      _ => "",
    };

    {
      switch (part) {
        case .partialInterface || .concreteInterface:
          buffer.writeln("@immutable");
        default:
      }
      switch (part) {
        case .partialInterface || .concreteInterface:
          buffer.write("abstract ");
        case .partialImplementation ||
            .partialAsConcreteImplementation ||
            .concreteImplementation ||
            .concreteDefaultsImplementation:
          buffer.write("final ");
      }
      buffer.write("class $thisType ");
      switch (part) {
        case .partialInterface:
          buffer.write("with Diagnosticable");
        case .partialImplementation || .concreteInterface:
          buffer.write("extends ${identifiers.partialInterface}");
        case .partialAsConcreteImplementation ||
            .concreteImplementation ||
            .concreteDefaultsImplementation:
          buffer.write("extends ${identifiers.concreteInterface}");
      }
      buffer.writeln(" {");
    }

    switch (part) {
      case .partialInterface || .concreteInterface:
        buffer
          ..writeln("  const $thisType();")
          ..writeln()
          ..write("  const factory $thisType.from({")
          ..write(
            tokens
                .map(
                  (token) =>
                      "$parameterPrefix$thisValueType ${token.identifier}",
                )
                .join(", "),
          )
          ..writeln("}) = $implementationType;");
        if (part == .concreteInterface) {
          buffer
            ..writeln()
            ..writeln(
              "  const factory $thisType.defaults({"
              "${identifiers.partialInterface}? overrides"
              "}) = ${identifiers.concreteDefaultsImplementation};",
            );
        }
      case .partialImplementation || .concreteImplementation:
        buffer
          ..write("  const $thisType({")
          ..write(
            tokens
                .map((token) => "${parameterPrefix}this.${token.identifier}")
                .join(","),
          )
          ..writeln("});");
      case .partialAsConcreteImplementation:
        buffer
          ..write(
            "  $thisType(${identifiers.partialInterface} $overridesParameter) : ",
          )
          ..writeln(
            "assert($overridesParameter.isConcrete), $overridesIdentifier = $overridesParameter;",
          );
      case .concreteDefaultsImplementation:
        buffer
          ..write("  const $thisType({")
          ..write("${identifiers.partialInterface}? $overridesParameter")
          ..writeln(
            "}) : $overridesIdentifier = $overridesParameter ?? const .from();",
          );
    }

    switch (part) {
      case .partialAsConcreteImplementation || .concreteDefaultsImplementation:
        buffer
          ..writeln()
          ..writeln(
            "  final ${identifiers.partialInterface} $overridesIdentifier;",
          );
      default:
    }

    switch (part) {
      case .partialInterface || .concreteInterface:
        for (final token in tokens) {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          } else {
            buffer.writeln("  /// `${token.path}`.");
          }
          buffer.writeln("  $thisValueType get ${token.identifier};");
        }
      case .partialImplementation || .concreteImplementation:
        buffer
          ..writeln()
          ..write("  ")
          ..writeln(
            tokens
                .map(
                  (token) =>
                      "@override final $thisValueType ${token.identifier};",
                )
                .join(" "),
          );
      case .partialAsConcreteImplementation:
        buffer
          ..writeln()
          ..write("  ")
          ..writeln(
            tokens
                .map(
                  (token) =>
                      "@override $thisValueType get ${token.identifier} => "
                      "$overridesIdentifier.${token.identifier}!;",
                )
                .join(" "),
          );
      case .concreteDefaultsImplementation:
        buffer
          ..writeln()
          ..write("  ")
          ..writeln(
            tokens
                .map(
                  (token) =>
                      "@override $thisValueType get ${token.identifier} => "
                      "$overridesIdentifier.${token.identifier} ?? "
                      "const $concreteValueType(${token.value});",
                )
                .join(" "),
          );
    }

    switch (part) {
      case .partialInterface || .concreteInterface:
        {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          }
          buffer.writeln("  $interfaceType copy() => copyWith();");
        }

        {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          }
          buffer
            ..write("  $interfaceType copyWith({")
            ..write(
              tokens
                  .map((token) => "$partialValueType ${token.identifier}")
                  .join(", "),
            )
            ..write("}) => .from(")
            ..write(
              tokens
                  .map(
                    (token) =>
                        "${token.identifier}: "
                        "${token.identifier} ?? this.${token.identifier}",
                  )
                  .join(","),
            )
            ..writeln(");");
        }

        {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          }
          buffer
            ..write("  $interfaceType maybeCopyWith({")
            ..write(
              tokens
                  .map((token) => "$partialValueType ${token.identifier}")
                  .join(", "),
            )
            ..write("}) => ")
            ..write(
              tokens.map((token) => "${token.identifier} != null").join(" || "),
            )
            ..write(" ? copyWith(")
            ..write(
              tokens
                  .map((token) => "${token.identifier}: ${token.identifier}")
                  .join(", "),
            )
            ..writeln(") : this;");
        }

        {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          }
          buffer
            ..write("  $interfaceType merge($partialType? other) => ")
            ..write("other != null ? copyWith(")
            ..write(
              tokens
                  .map(
                    (token) => "${token.identifier}: other.${token.identifier}",
                  )
                  .join(", "),
            )
            ..writeln(") : copy();");
        }

        {
          buffer.writeln();
          if (part.overrides) {
            buffer.writeln("  @override");
          }
          buffer
            ..write("  $interfaceType maybeMerge($partialType? other) => ")
            ..write("other != null ? maybeCopyWith(")
            ..write(
              tokens
                  .map(
                    (token) => "${token.identifier}: other.${token.identifier}",
                  )
                  .join(", "),
            )
            ..writeln(") : this;");
        }
      case .partialAsConcreteImplementation || .concreteDefaultsImplementation:
        {
          buffer
            ..writeln()
            ..writeln("  @override")
            ..write("  $interfaceType copyWith({")
            ..write(
              tokens
                  .map((token) => "$partialValueType ${token.identifier}")
                  .join(", "),
            )
            ..write("}) => $thisType(");
          switch (part) {
            case .partialAsConcreteImplementation:
              buffer.write("$overridesIdentifier.copyWith(");
            case .concreteDefaultsImplementation:
              buffer.write(
                "$overridesParameter: $overridesIdentifier.copyWith(",
              );
            default:
          }
          buffer
            ..write(
              tokens
                  .map((token) => "${token.identifier}: ${token.identifier}")
                  .join(", "),
            )
            ..writeln("));");
        }

        {
          buffer
            ..writeln()
            ..writeln("  @override")
            ..write("  $interfaceType maybeCopyWith({")
            ..write(
              tokens
                  .map((token) => "$partialValueType ${token.identifier}")
                  .join(", "),
            )
            ..write("}) => ")
            ..write(
              tokens.map((token) => "${token.identifier} != null").join(" && "),
            )
            ..write(" ? .from(")
            ..write(
              tokens
                  .map((token) => "${token.identifier}: ${token.identifier}")
                  .join(", "),
            )
            ..write(") : ")
            ..write(
              tokens.map((token) => "${token.identifier} != null").join(" || "),
            )
            ..write(" ? copyWith(")
            ..write(
              tokens
                  .map((token) => "${token.identifier}: ${token.identifier}")
                  .join(", "),
            )
            ..writeln(") : this;");
        }

      default:
    }

    switch (part) {
      case .partialInterface:
        buffer
          ..writeln()
          ..write("  bool get isEmpty => ")
          ..write(
            tokens.map((token) => "${token.identifier} == null").join(" && "),
          )
          ..writeln(";")
          ..writeln()
          ..writeln("  bool get isNotEmpty => !isEmpty;")
          ..writeln()
          ..write("  bool get isConcrete => ")
          ..write(
            tokens.map((token) => "${token.identifier} != null").join(" && "),
          )
          ..writeln(";")
          ..writeln()
          ..write("  $concreteType? get asConcrete => ")
          ..writeln(
            "isConcrete ? "
            "${identifiers.partialAsConcreteImplementation}(this)"
            " : null;",
          );
      case .concreteInterface:
        buffer
          ..writeln()
          ..writeln("  @override")
          ..writeln("  bool get isEmpty => false;")
          ..writeln()
          ..writeln("  @override")
          ..writeln("  bool get isNotEmpty => true;")
          ..writeln()
          ..writeln("  @override")
          ..writeln("  bool get isConcrete => true;")
          ..writeln()
          ..writeln("  @override")
          ..writeln("  $concreteType get asConcrete => this;");
      default:
    }

    switch (part) {
      case .partialInterface || .concreteInterface:
        {
          buffer
            ..writeln()
            ..writeln("  @override")
            ..writeln("  // ignore: must_call_super")
            ..writeln(
              "  void debugFillProperties(DiagnosticPropertiesBuilder properties) {",
            )
            ..write("    properties")
            ..write(
              tokens
                  .map(
                    (token) =>
                        "..add(ColorProperty("
                        "\"${token.identifier}\", "
                        "${token.identifier}, "
                        "defaultValue: null"
                        "))",
                  )
                  .join(""),
            )
            ..writeln(";")
            ..writeln("  }");
        }
      default:
    }

    switch (part) {
      case .partialImplementation || .concreteImplementation:
        buffer
          ..writeln()
          ..writeln("  @override")
          ..write("  bool operator ==(Object other) => ")
          ..write("identical(this,other) || ")
          ..write("other is $thisType && ")
          ..write(
            tokens
                .map(
                  (token) => "${token.identifier} == other.${token.identifier}",
                )
                .join(" && "),
          )
          ..writeln(";")
          ..writeln()
          ..writeln("  @override")
          ..write("  int get hashCode => ")
          ..write(
            buildObjectHashExpression(
              tokens.map((token) => token.identifier).toList(),
            ),
          )
          ..writeln(";");
      case .partialAsConcreteImplementation || .concreteDefaultsImplementation:
        buffer
          ..writeln()
          ..writeln("  @override")
          ..write("  bool operator ==(Object other) => ")
          ..write("identical(this,other) || ")
          ..write("other is $thisType && ")
          ..writeln("$overridesIdentifier == other.$overridesIdentifier;")
          ..writeln()
          ..writeln("  @override")
          ..writeln("  int get hashCode => $overridesIdentifier.hashCode;");
      default:
    }

    buffer.writeln("}");
  }

  {
    buffer
      ..writeln("// GENERATED CODE - DO NOT MODIFY BY HAND")
      ..writeln("// dart format off");
  }

  {
    buffer
      ..writeln()
      ..writeln("import 'package:material/src/material/flutter.dart';");
  }

  buffer.writeln();

  const identifiers = _DataObjectIdentifiers(
    partialInterface: "PaletteThemeDataPartial",
    partialImplementation: "_PaletteThemeDataPartial",
    partialAsConcreteImplementation: "_PaletteThemeDataPartialAsConcrete",
    concreteInterface: "PaletteThemeData",
    concreteImplementation: "_PaletteThemeData",
    concreteDefaultsImplementation: "_PaletteThemeDataDefaults",
  );

  writePart(part: .partialInterface, identifiers: identifiers);
  buffer.writeln();
  writePart(part: .partialImplementation, identifiers: identifiers);
  buffer.writeln();
  writePart(part: .partialAsConcreteImplementation, identifiers: identifiers);
  buffer.writeln();
  writePart(part: .concreteInterface, identifiers: identifiers);
  buffer.writeln();
  writePart(part: .concreteImplementation, identifiers: identifiers);
  buffer.writeln();
  writePart(part: .concreteDefaultsImplementation, identifiers: identifiers);

  return buffer.toString();
}

Future<void> main(List<String> arguments) async {
  final tokens = _tokens.sortedByCompare(
    (token) => token.identifier,
    compareNatural,
  );
  final code = _buildCode(tokens);
  // final code = _buildCode(const [
  //   .new(
  //     identifier: "white",
  //     value: "0xFFFFFFFF",
  //     path: "md.ref.palette.white",
  //   ),
  //   .new(
  //     identifier: "black",
  //     value: "0xFF000000",
  //     path: "md.ref.palette.black",
  //   ),
  // ]);
  stdout.write(code);
}
