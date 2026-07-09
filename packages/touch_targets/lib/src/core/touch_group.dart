import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_targets/touch_targets.dart';

bool debugCheckHasTouchGroup(BuildContext context) {
  assert(() {
    if (context.widget is! _TouchGroupStateScope &&
        context
                .getElementForInheritedWidgetOfExactType<
                  _TouchGroupStateScope
                >() ==
            null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary("No TouchGroup widget ancestor found."),
        ErrorDescription(
          "${context.widget.runtimeType} widgets require a TouchGroup widget "
          "ancestor.",
        ),
        context.describeWidget(
          "The specific widget that could not find a TouchGroup ancestor was",
        ),
        context.describeOwnershipChain(
          "The ownership chain for the affected widget is",
        ),
        ErrorHint(
          "No TouchGroup ancestor could be found starting from the context "
          "that was passed to TouchGroup.of(). This can happen because the "
          "context used is not a descendant of a TouchGroup widget.",
        ),
      ]);
    }
    return true;
  }());
  return true;
}

class TouchGroup extends StatefulWidget implements ProxyWidget {
  const TouchGroup({super.key, required this.child});

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  @override
  final Widget child;

  @override
  State<TouchGroup> createState() => _TouchGroupState();

  static TouchGroupRegistry? maybeOf(BuildContext context) =>
      _TouchGroupStateScope.maybeOf(context);

  static TouchGroupRegistry of(BuildContext context) {
    assert(debugCheckHasTouchGroup(context));
    return maybeOf(context)!;
  }
}

class _TouchGroupState extends State<TouchGroup> implements TouchGroupRegistry {
  // TODO: improve state management here

  final Set<TouchClient> _clients = HashSet<TouchClient>();

  @override
  void registerClient(TouchClient client) {
    assert(() {
      if (_clients.contains(client)) {
        throw FlutterError(
          "Attempted to register an already registered TouchClient.\n"
          "Client $client was registered previously.",
        );
      }
      return true;
    }());
    _clients.add(client);
  }

  @override
  void unregisterClient(TouchClient client) {
    assert(() {
      if (!_clients.contains(client)) {
        throw FlutterError(
          "Attempted to unregister a TouchClient which was not registered.\n"
          "Client $client wasn't registered.",
        );
      }
      return true;
    }());
    _clients.remove(client);
  }

  @override
  void dispose() {
    _clients.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TouchTheatre(
      registry: this,
      clients: _clients,
      child: _TouchGroupStateScope(state: this, child: widget.child),
    );
  }
}

class _TouchGroupStateScope extends InheritedWidget {
  const _TouchGroupStateScope({
    // super.key,
    required this.state,
    required super.child,
  });

  final _TouchGroupState state;

  @override
  bool updateShouldNotify(_TouchGroupStateScope oldWidget) =>
      state != oldWidget.state;

  static _TouchGroupState? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_TouchGroupStateScope>()
      ?.state;
}

class _TouchTheatre extends SingleChildRenderObjectWidget {
  const _TouchTheatre({
    // super.key,
    required this.registry,
    required this.clients,
    super.child,
  });

  final TouchGroupRegistry registry;
  final Iterable<TouchClient> clients;

  @override
  _RenderTouchTheatre createRenderObject(BuildContext context) =>
      _RenderTouchTheatre(registry: registry, clients: clients);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderTouchTheatre renderObject,
  ) {
    renderObject
      ..registry = registry
      ..clients = clients;
  }
}

class _RenderTouchTheatre extends RenderProxyBox {
  _RenderTouchTheatre({
    required this._registry,
    required this._clients,
    RenderBox? child,
  }) : super(child);

  // TODO: implement debug paint (don't forget to add markNeedsPaint EVERYWHERE)

  TouchGroupRegistry _registry;

  TouchGroupRegistry get registry => _registry;

  set registry(TouchGroupRegistry value) {
    if (_registry == value) return;
    _registry = value;
  }

  Iterable<TouchClient> _clients;
  Iterable<TouchClient> get clients => _clients;
  set clients(Iterable<TouchClient> value) {
    if (_clients == value) return;
    _clients = value;
  }

  TouchClient? _clientForPosition(Offset position) {
    final weightedClients = <_WeightedTouchClient>[];

    for (final client in _clients) {
      if (!client.isActive) continue;

      if (client.containsIn(this, position)) {
        // Weight is proportional to child's size.
        final distanceToEdge = client.getDistanceToEdgeIn(this, position);
        final childSize = client.innerSize;
        final childDiagonal = math.sqrt(
          childSize.width * childSize.width +
              childSize.height * childSize.height,
        );

        // Smaller targets receive higher priority.
        final weight = distanceToEdge * (childDiagonal + 1.0);

        // Add weighted client for scoring.
        weightedClients.add(.new(client, weight));
      }
    }

    // Score clients by weight.
    weightedClients.sort((a, b) => a.weight.compareTo(b.weight));

    // Choose the first reachable candidate.
    for (var i = 0; i < weightedClients.length; i++) {
      final client = weightedClients[i].client;
      if (client.dryHitTestFrom(this)) {
        return client;
      }
    }

    return null;
  }

  T? _firstHitTestTargetOfType<T extends HitTestTarget>(Offset position) {
    final result = BoxHitTestResult();
    if (!super.hitTest(result, position: position)) return null;
    for (final HitTestEntry(:target) in result.path) {
      if (target is T) return target;
    }
    return null;
  }

  var _doingDryHitTest = false;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (_doingDryHitTest) return super.hitTest(result, position: position);

    // Find the best candidate for hit testing.
    TouchClient? client;
    _doingDryHitTest = true;
    try {
      client = _clientForPosition(position);
    } finally {
      _doingDryHitTest = false;
    }

    if (client != null) {
      final leaf = _firstHitTestTargetOfType<RenderObject>(position);

      if (leaf == null ||
          client.hasOwn(leaf) ||
          client.hasDescendant(leaf) ||
          client.hasAncestor(leaf)) {
        if (leaf != null &&
            (client.hasOwn(leaf) || client.hasDescendant(leaf))) {
          return super.hitTest(result, position: position);
        }

        // Important: always make sure both hit tests are run
        // (don't inline logical OR).
        var isHit = false;
        if (client.hitTestInnerFrom(this, result, position)) {
          isHit = true;
        }
        if (super.hitTest(result, position: position)) {
          isHit = true;
        }
        // assert(_debugPrintResultPath(result));
        return isHit;
      }
    }
    return super.hitTest(result, position: position);
  }
}

extension type const _WeightedTouchClient._(
  ({TouchClient client, double weight}) _
) implements Object {
  const _WeightedTouchClient(TouchClient client, double weight)
    : _ = (client: client, weight: weight);

  TouchClient get client => _.client;

  double get weight => _.weight;
}

// To quickly check if the hit test result has a correct path during debugging,
// is to make sure that the path contains both
// _RenderTheatre (Overlay) and _RenderTouchTheatre (TouchGroup),
// these objects are easily distinguishable from the rest,
// but _RenderTheatre is between the touch group and the touch target,
// meaning it has a chance of not being included. Any further changes to the
// hit testing logic must ensure that the result has a correct path
// (until automated testing is implemented).

// bool _debugPrintResultPath(HitTestResult result) {
//   assert(() {
//     final buffer = StringBuffer()
//       ..writeln("---")
//       ..write("${describeIdentity(result)}.path: START");
//     final seen = HashSet<HitTestTarget>();
//     final duplicates = <HitTestTarget>{};
//     RenderObject? previous;
//     for (final entry in result.path) {
//       final target = entry.target;
//       if (!seen.add(target)) {
//         duplicates.add(target);
//       }
//       if (target is RenderObject &&
//           previous?.parent != null &&
//           target != previous?.parent) {
//         buffer.write(" -> ${describeIdentity(previous?.parent)}");
//       }
//       buffer.write("\n${describeIdentity(target)}");
//       if (target is RenderObject) {
//         previous = target;
//       } else {
//         previous = null;
//       }
//     }
//     buffer.writeln("\n${describeIdentity(result)}.path: END");
//     if (duplicates.isNotEmpty) {
//       buffer.writeln(
//         "${describeIdentity(result)}.path DUPLICATES (original order)",
//       );
//       for (final target in duplicates) {
//         buffer.writeln(describeIdentity(target));
//       }
//     }
//     buffer.writeln("---");
//     debugPrint(buffer.toString());
//     return true;
//   }());
//   return true;
// }
