part of 'system_colors_platform_interface.dart';

abstract class CupertinoSystemColorScheme extends SystemColorScheme {
  const CupertinoSystemColorScheme();
}

abstract class IosSystemColorScheme extends CupertinoSystemColorScheme {
  const IosSystemColorScheme();
}

abstract class MacosSystemColorScheme extends CupertinoSystemColorScheme {
  const MacosSystemColorScheme();
}
