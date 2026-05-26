import 'package:flutter/foundation.dart';
import 'package:touch_targets/touch_targets.dart';

/// An abstract interface for registering and unregistering
/// [TouchClient] instances;
abstract class TouchGroupRegistry {
  /// Register a given [TouchClient] to this registry.
  ///
  /// Throws an error if the client was already registered.
  void registerClient(TouchClient client);

  /// Unregister a given [TouchClient] from this registry.
  ///
  /// Throws an error if the client wasn't registered already.
  void unregisterClient(TouchClient client);
}

bool debugCheckHasTouchGroupRegistry(
  TouchGroupRegistry? registry,
  String target,
) {
  assert(() {
    if (registry == null) {
      throw FlutterError.fromParts([
        ErrorSummary("No TouchGroupRegistry found."),
        ErrorDescription(
          "$target requires a TouchGroupRegistry to function properly.",
        ),
        ErrorHint(
          "This error usually occurs when $target is used without an explicit "
          "TouchTargetRegistry or a TouchGroup ancestor.",
        ),
        ErrorHint(
          "Typically, a TouchGroup widget should placed at the top of"
          "your application widget tree.",
        ),
      ]);
    }
    return true;
  }());
  return true;
}
