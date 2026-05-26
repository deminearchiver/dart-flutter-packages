import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:touch_targets/touch_targets.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildNavigatorWrapper(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    return TouchGroup(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Touch Targets Example",
      builder: _buildNavigatorWrapper,
      theme: ThemeData(
        splashFactory: InkSparkle.splashFactory,
        iconTheme: IconThemeData(
          fill: 0.0,
          weight: 400.0,
          grade: 0.0,
          opticalSize: 24.0,
          size: 24.0,
        ),
      ),
      home: const OverlayExampleView(),
    );
  }
}

class WidgetStateLayerColor implements WidgetStateProperty<Color> {
  const WidgetStateLayerColor({this._color, this._opacity});

  const WidgetStateLayerColor.fromColor(WidgetStateProperty<Color> this._color)
    : _opacity = const _DefaultWidgetStateLayerOpacity();

  final WidgetStateProperty<Color?>? _color;
  final WidgetStateProperty<double?>? _opacity;

  @override
  Color resolve(Set<WidgetState> states) {
    final resolvedColor = _color?.resolve(states);
    if (resolvedColor == null) return Colors.transparent;
    if (resolvedColor.a <= 0.0) return resolvedColor;
    final resolvedOpacity = _opacity?.resolve(states) ?? 0.0;
    return resolvedOpacity > 0.0
        ? resolvedColor.withValues(alpha: resolvedColor.a * resolvedOpacity)
        : resolvedColor.withAlpha(0);
  }
}

class _DefaultWidgetStateLayerOpacity implements WidgetStateProperty<double> {
  const _DefaultWidgetStateLayerOpacity();

  @override
  double resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return 0.0;
    }
    if (states.contains(WidgetState.dragged)) {
      return 0.16;
    }
    if (states.contains(WidgetState.pressed)) {
      return 0.1;
    }
    if (states.contains(WidgetState.focused)) {
      return 0.1;
    }
    if (states.contains(WidgetState.hovered)) {
      return 0.08;
    }
    return 0.0;
  }
}

class OverlayExampleView extends StatefulWidget {
  const OverlayExampleView({super.key});

  @override
  State<OverlayExampleView> createState() => _OverlayExampleViewState();
}

class _OverlayExampleViewState extends State<OverlayExampleView> {
  final _controller = MenuController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Scaffold(
      body: Center(
        child: MenuAnchor(
          controller: _controller,
          builder: (context, controller, child) => SizedTouchTarget(
            behavior: .overflow,
            // For demo purposes only. In production, the issue occurs because
            // there are more than one button next to each other.
            minimumSize: const .square(100.0),
            child: SizedBox(
              width: 32,
              height: 40.0,
              child: Material(
                animationDuration: .zero,
                clipBehavior: .antiAlias,
                color: colorScheme.primary,
                borderRadius: .circular(12.0),
                child: InkWell(
                  overlayColor: WidgetStateLayerColor.fromColor(
                    WidgetStatePropertyAll(colorScheme.onPrimary),
                  ),
                  // 1. The user clicks the button or the touch target.
                  // 2. Menu opens.
                  // 3. The user clicks a menu item. (tap down)
                  // 4. Touch target intercepts the hit test (!).
                  // 5. Menu closes.
                  // 6. User lets go (tap up).
                  // 7. Menu opens.
                  onTap: () => controller.open(),
                  child: Icon(
                    Symbols.more_vert_rounded,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
          menuChildren: [
            MenuItemButton(onPressed: () {}, child: Text("Option A")),
            MenuItemButton(onPressed: () {}, child: Text("Option B")),
            MenuItemButton(onPressed: () {}, child: Text("Option C")),
          ],
        ),
      ),
    );
  }
}
