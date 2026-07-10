part of 'system_colors_platform_interface.dart';

abstract class SystemColorScheme with Diagnosticable {
  const SystemColorScheme();
}

abstract class FluentSystemColorScheme extends SystemColorScheme {
  const FluentSystemColorScheme();
}

abstract class WindowsSystemColorScheme extends FluentSystemColorScheme {
  const WindowsSystemColorScheme();
}

abstract class LinuxSystemColorScheme extends SystemColorScheme {
  const LinuxSystemColorScheme();
}
