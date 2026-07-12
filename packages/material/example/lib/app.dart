import 'package:dynamic_color_ffi/dynamic_color_ffi.dart';
import 'package:flutter/gestures.dart';
import 'package:material_example/flutter.dart';
import 'package:material_example/experiment1.dart' show Experiment1View;
import 'package:material_example/experiment2.dart' show Experiment2View;
import 'package:material_example/experiment3.dart' show Experiment3View;
import 'package:material_example/experiment4.dart' show Experiment4View;
import 'package:material_example/experiment5.dart' show Experiment5View;
import 'package:material_example/experiment6.dart' show Experiment6View;
import 'package:material_example/experiment7.dart' show Experiment7View;
import 'package:material_example/experiment8.dart' show Experiment8View;
import 'package:material_example/experiment9.dart' show Experiment9View;
import 'package:material_example/experiment10.dart' show Experiment10View;
import 'package:vector_math/vector_math_64.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  SingleChildWidget _buildTypefaceTheme(BuildContext context) =>
      TypefaceTheme.mergeWithData(data: _typography.typeface);

  List<SingleChildWidget> _buildReferenceThemes(BuildContext context) => [
    _buildTypefaceTheme(context),
  ];

  List<SingleChildWidget> _buildColorThemes(BuildContext context) {
    final Brightness brightness = switch (_themeMode) {
      .system => MediaQuery.platformBrightnessOf(context),
      .light => .light,
      .dark => .dark,
    };

    final highContrast = MediaQuery.highContrastOf(context);
    final contrastLevel = highContrast ? 1.0 : 0.0;

    var colorTheme = ColorThemeData.fromSeed(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: _variant,
      platform: _platform,
      specVersion: _specVersion,
    );

    final dynamicColorScheme = DynamicColor.dynamicColorScheme(brightness);
    colorTheme = colorTheme.maybeMerge(dynamicColorScheme?.toColorTheme());

    final staticColors = StaticColorsData.fallback(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: _variant,
      platform: _platform,
      specVersion: _specVersion,
    );

    return [
      ColorTheme.replaceWithData(data: colorTheme),
      SingleChildBuilder(
        builder: (context, child) => StaticColors(
          data: staticColors,
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    ];
  }

  SingleChildWidget _buildSpringTheme(BuildContext context) =>
      const SpringTheme.replaceWithData(data: .defaultsExpressive());

  SingleChildWidget _buildTypescaleTheme(BuildContext context) =>
      TypescaleTheme.mergeWithData(data: _typography.typescale);

  List<SingleChildWidget> _buildSystemThemes(BuildContext context) => [
    ..._buildColorThemes(context),
    _buildSpringTheme(context),
    _buildTypescaleTheme(context),
    // const MeasurementTheme.mergeWithData(data: .from(space100: 4.0)),
    // const ShapeTheme.mergeWithData(data: .from(cornerFamily: .cut)),
  ];

  List<SingleChildWidget> _buildComponentThemes(BuildContext context) => [];

  List<SingleChildWidget> _buildLegacyThemes(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return [
      SingleChildBuilder(
        builder: (context, child) => Theme(
          data: LegacyThemeFactory.createTheme(
            colorTheme: colorTheme,
            elevationTheme: elevationTheme,
            shapeTheme: shapeTheme,
            stateTheme: stateTheme,
            typescaleTheme: typescaleTheme,
            scaffoldBackgroundColor: colorTheme.surfaceContainer,
          ),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    ];
  }

  Widget _buildThemes(BuildContext context, Widget child) {
    final builders = <List<SingleChildWidget> Function(BuildContext context)>[
      _buildReferenceThemes,
      _buildSystemThemes,
      _buildComponentThemes,
      _buildLegacyThemes,
    ];
    return Nested(
      children: [
        for (final builder in builders)
          SingleChildBuilder(
            builder: (context, child) =>
                Nested(children: builder(context), child: child),
          ),
      ],
      child: child,
    );
  }

  Widget _buildNavigatorWrapper(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    final colorTheme = ColorTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return DefaultLocalizedTextStyle(
      style: typescaleTheme.bodyLarge.toTextStyle(color: colorTheme.onSurface),
      child: TouchGroup(child: child),
    );
  }

  Widget _buildApp(BuildContext context) => RawMaterialApp(
    // Debugging
    debugShowCheckedModeBanner: false,

    // Localization
    title: "Material Example",
    // localizationsDelegates: context.localizationDelegates,
    // supportedLocales: context.supportedLocales,
    // locale: context.locale,
    scrollBehavior: kDebugMode
        ? const MaterialScrollBehavior().copyWith(
            dragDevices: PointerDeviceKind.values.toSet(),
          )
        : null,
    // Navigation
    // navigatorKey: globalNavigatorKey,
    builder: _buildNavigatorWrapper,
    home: const NavigationView(),
  );

  @override
  Widget build(BuildContext context) {
    final appBuilder = Builder(key: GlobalObjectKey(this), builder: _buildApp);
    return _buildThemes(context, appBuilder);
  }

  static const _themeMode = ThemeMode.system;
  static const _variant = DynamicSchemeVariant.vibrant;
  static const _platform = DynamicSchemePlatform.phone;
  static const _specVersion = DynamicSchemeSpecVersion.spec2026;
  static const _typography = TypographyDefaults.expressive2026;
}

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  var _selectedIndex = 1;

  void _setSelectedIndex(int value) {
    _selectedIndex =
        (value - _firstIndex) % (_lastIndex - _firstIndex + 1) + _firstIndex;
  }

  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final durationTheme = DurationTheme.of(context);
    final easingTheme = EasingTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final duration = durationTheme.long4;
    final easing = easingTheme.emphasized;

    return Stack(
      fit: .expand,
      children: [
        KeyedSubtree(
          key: ValueKey(_selectedIndex),
          child: switch (_selectedIndex) {
            1 => const Experiment1View(),
            2 => const Experiment2View(),
            3 => const Experiment3View(),
            4 => const Experiment4View(),
            5 => const Experiment5View(),
            6 => const Experiment6View(),
            7 => const Experiment7View(),
            8 => const Experiment8View(),
            9 => const Experiment9View(),
            10 => const Experiment10View(),
            _ => Scaffold(
              backgroundColor: colorTheme.surfaceContainer,
              body: const Placeholder(),
            ),
          },
        ),
        DeveloperToolbar(
          selectedIndex: _selectedIndex,
          onSelectedIndexChanged: (value) =>
              setState(() => _setSelectedIndex(value)),
        ),
      ],
    );
  }

  static const _firstIndex = 1;
  static const _lastIndex = 10;
}

class DeveloperToolbar extends StatefulWidget {
  const DeveloperToolbar({
    super.key,
    required this.selectedIndex,
    required this.onSelectedIndexChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelectedIndexChanged;

  @override
  State<DeveloperToolbar> createState() => _DeveloperToolbarState();
}

const _kTapTargetSize = 64.0;

enum _DragPhase { idle, down, drag }

class _DeveloperToolbarState extends State<DeveloperToolbar> {
  final _alignKey = GlobalKey();
  final _toolbarKey = GlobalKey();

  Size? get _alignSizeOrNull {
    final alignBox = _alignKey.currentContext?.findRenderObject() as RenderBox?;
    if (alignBox == null) return null;
    return alignBox.hasSize ? alignBox.size : null;
  }

  Size? get _toolbarSizeOrNull {
    final toolbarBox =
        _toolbarKey.currentContext?.findRenderObject() as RenderBox?;
    if (toolbarBox == null) return null;
    return toolbarBox.hasSize ? toolbarBox.size : null;
  }

  var _isOpen = false;

  var _horizontalAlignment = 1.0;
  var _verticalAlignment = 0.0;

  _DragPhase _dragPhase = .idle;

  void _onDragDown(DragDownDetails details) {
    setState(() {
      _dragPhase = .down;
    });
  }

  void _onDragStart(DragStartDetails details) {
    setState(() {
      _dragPhase = .drag;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPhase = .drag;
    });

    assert(details.primaryDelta != null);
    final delta = details.primaryDelta!;

    final alignBox = _alignKey.currentContext?.findRenderObject() as RenderBox?;
    final toolbarBox =
        _toolbarKey.currentContext?.findRenderObject() as RenderBox?;

    if (alignBox == null || toolbarBox == null) return;

    final currentLocalPosition = alignBox.globalToLocal(details.globalPosition);
    final previousLocalPosition = alignBox.globalToLocal(
      details.globalPosition - details.delta,
    );

    final localDelta = currentLocalPosition.dy - previousLocalPosition.dy;

    if (!alignBox.hasSize || !toolbarBox.hasSize) return;

    final distance = alignBox.size.height - toolbarBox.size.height;
    if (distance <= 0.0) return;

    final scaledDelta = localDelta * 2.0 / distance;

    final verticalAlignment = clampDouble(
      _verticalAlignment + scaledDelta,
      -1.0,
      1.0,
    );
    setState(() {
      _verticalAlignment = verticalAlignment;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() {
      _dragPhase = .idle;
    });
  }

  void _onDragCancel() {
    setState(() {
      _dragPhase = .idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    final colorTheme = ColorTheme.of(context);
    final durationTheme = DurationTheme.of(context);
    final easingTheme = EasingTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final duration = durationTheme.long4;
    final easing = easingTheme.emphasized;

    final resolvedAlignment = Alignment(
      _horizontalAlignment,
      _verticalAlignment,
    );

    final isOpen = _isOpen;

    final topCorners = Corners.vertical(
      top: shapeTheme.cornerFull,
      bottom: shapeTheme.cornerExtraSmall,
    );

    final bottomCorners = Corners.vertical(
      top: shapeTheme.cornerExtraSmall,
      bottom: shapeTheme.cornerFull,
    );

    Widget buildPager() {
      return IntrinsicWidth(
        child: Flex.vertical(
          mainAxisSize: .min,
          spacing: 2.0,
          children: [
            SizedTouchTarget(
              minimumSize: const .square(_kTapTargetSize),
              child: IconButton(
                style:
                    LegacyThemeFactory.createIconButtonStyle(
                      colorTheme: colorTheme,
                      elevationTheme: elevationTheme,
                      shapeTheme: shapeTheme,
                      stateTheme: stateTheme,
                      size: .small,
                      color: .standard,
                      tapTargetSize: .shrinkWrap,
                      containerColor: colorTheme.surfaceContainerLow,
                    ).copyWith(
                      shape: .all(shapeTheme.applyCorners(corners: topCorners)),
                    ),
                onPressed: () {
                  widget.onSelectedIndexChanged(widget.selectedIndex - 1);
                },
                icon: CenterOptically(
                  corners: topCorners,
                  maxOffsets: .infinity,
                  child: const Icon(
                    Symbols.arrow_upward_rounded,
                    opticalSize: 20.0,
                    size: 20.0,
                  ),
                ),
                tooltip: "Previous",
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Surface(
                shape: shapeTheme.applyCorner(
                  corner: shapeTheme.cornerExtraSmall,
                ),
                color: colorTheme.surfaceContainerLow,
                child: Align.center(
                  child: Text(
                    "${widget.selectedIndex}",
                    style: typescaleTheme.labelLargeEmphasized.toTextStyle(
                      color: colorTheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
            SizedTouchTarget(
              minimumSize: const .square(_kTapTargetSize),
              child: IconButton(
                style:
                    LegacyThemeFactory.createIconButtonStyle(
                      colorTheme: colorTheme,
                      elevationTheme: elevationTheme,
                      shapeTheme: shapeTheme,
                      stateTheme: stateTheme,
                      size: .small,
                      color: .standard,
                      tapTargetSize: .shrinkWrap,
                      containerColor: colorTheme.surfaceContainerLow,
                    ).copyWith(
                      shape: .all(
                        shapeTheme.applyCorners(corners: bottomCorners),
                      ),
                    ),
                onPressed: () {
                  widget.onSelectedIndexChanged(widget.selectedIndex + 1);
                },
                icon: CenterOptically(
                  corners: bottomCorners,
                  maxOffsets: .infinity,
                  child: const Icon(
                    Symbols.arrow_downward_rounded,
                    opticalSize: 20.0,
                    size: 20.0,
                  ),
                ),
                tooltip: "Next",
              ),
            ),
          ],
        ),
      );
    }

    Widget buildDragButton() {
      final isDragging = switch (_dragPhase) {
        .idle => false,
        .down || .drag => true,
      };
      final containerShape = isDragging
          ? shapeTheme.applyCorner(corner: shapeTheme.cornerFull)
          : shapeTheme.applyCorner(corner: shapeTheme.cornerExtraSmall);
      final containerColor = isDragging
          ? colorTheme.tertiaryContainer
          : colorTheme.surfaceContainerLow;
      final contentColor = isDragging
          ? colorTheme.onTertiaryContainer
          : colorTheme.onSurfaceVariant;
      return SizedTouchTarget(
        minimumSize: const .square(_kTapTargetSize),
        child: SizedBox.square(
          dimension: 40.0,
          child: Surface(
            clipBehavior: .antiAlias,
            shape: containerShape,
            color: containerColor,
            child: GestureDetector(
              behavior: .translucent,
              onVerticalDragDown: _onDragDown,
              onVerticalDragStart: _onDragStart,
              onVerticalDragUpdate: _onDragUpdate,
              onVerticalDragEnd: _onDragEnd,
              onVerticalDragCancel: _onDragCancel,
              child: InkWell(
                overlayColor: WidgetStateLayerColor(
                  color: .all(contentColor),
                  opacity: stateTheme.asWidgetStateLayerOpacity,
                ),
                onTap: () {},
                child: Icon(
                  Symbols.drag_indicator_rounded,
                  opticalSize: 24.0,
                  size: 24.0,
                  color: contentColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildExpandedContent() {
      return SizedBox(
        width: 64.0,
        child: Flex.vertical(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 12.0),
            SizedTouchTarget(
              minimumSize: const .square(_kTapTargetSize),
              child: IconButton(
                style:
                    LegacyThemeFactory.createIconButtonStyle(
                      colorTheme: colorTheme,
                      elevationTheme: elevationTheme,
                      shapeTheme: shapeTheme,
                      stateTheme: stateTheme,
                      color: .standard,
                      tapTargetSize: .shrinkWrap,
                      containerColor: colorTheme.surfaceContainerLow,
                    ).copyWith(
                      shape: .all(shapeTheme.applyCorners(corners: topCorners)),
                    ),
                onPressed: () => setState(() => _isOpen = false),
                icon: CenterOptically(
                  corners: topCorners,
                  maxOffsets: .infinity,
                  child: const Icon(Symbols.close_rounded),
                ),
                tooltip: "Close",
              ),
            ),
            const SizedBox(height: 2.0),
            buildDragButton(),
            const SizedBox(height: 2.0),
            SizedTouchTarget(
              minimumSize: const .square(_kTapTargetSize),
              child: IconButton(
                style:
                    LegacyThemeFactory.createIconButtonStyle(
                      colorTheme: colorTheme,
                      elevationTheme: elevationTheme,
                      shapeTheme: shapeTheme,
                      stateTheme: stateTheme,
                      color: .standard,
                      tapTargetSize: .shrinkWrap,
                      containerColor: colorTheme.surfaceContainerLow,
                    ).copyWith(
                      shape: .all(
                        shapeTheme.applyCorners(corners: bottomCorners),
                      ),
                    ),
                onPressed: () => setState(
                  () => _horizontalAlignment = -_horizontalAlignment,
                ),
                icon: CenterOptically(
                  corners: bottomCorners,
                  maxOffsets: .infinity,
                  child: _horizontalAlignment > 0.0
                      ? const Icon(Symbols.chevron_left_rounded)
                      : const Icon(Symbols.chevron_right_rounded),
                ),
                tooltip: "Close",
              ),
            ),
            const SizedBox(height: 8.0),
            buildPager(),
            // const SizedBox(height: 8.0),
            // SizedTouchTarget(
            //   minimumSize: const .square(_kTapTargetSize),
            //   child: IconButton(
            //     style: LegacyThemeFactory.createIconButtonStyle(
            //       colorTheme: colorTheme,
            //       elevationTheme: elevationTheme,
            //       shapeTheme: shapeTheme,
            //       stateTheme: stateTheme,
            //       color: .standard,
            //       tapTargetSize: .shrinkWrap,
            //       containerColor: colorTheme.surfaceContainerLow,
            //     ),
            //     onPressed: () {},
            //     icon: const Icon(Symbols.more_vert_rounded),
            //     tooltip: "More",
            //   ),
            // ),
            const SizedBox(height: 12.0),
          ],
        ),
      );
    }

    Widget buildCollapsedContent() {
      return Padding(
        padding: const .symmetric(horizontal: 2.0, vertical: 38.0),
        child: Icon(
          Symbols.code_rounded,
          fill: 1.0,
          opticalSize: 16.0,
          size: 16.0,
          color: colorTheme.onSurfaceVariant,
        ),
      );
    }

    return Padding(
      padding: padding + const .all(16.0),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(end: _horizontalAlignment),
        duration: duration,
        curve: easing,
        builder: (context, value, child) => Align(
          key: _alignKey,
          alignment: Alignment(value, _verticalAlignment),
          child: child,
        ),
        child: MouseRegion(
          opaque: true,
          // onEnter: (event) {
          //   if (_dragPhase == .drag) return;
          //   switch (event.kind) {
          //     case .mouse || .trackpad:
          //       setState(() => _isOpen = true);
          //     default:
          //   }
          // },
          // onExit: (event) {
          //   if (_dragPhase == .drag) return;
          //   switch (event.kind) {
          //     case .mouse || .trackpad:
          //       setState(() => _isOpen = false);
          //     default:
          //   }
          // },
          child: GestureDetector(
            onTapUp: (details) {
              if (_dragPhase == .drag) return;
              // switch (details.kind) {
              //   case .mouse || .trackpad:
              //     break;
              //   default:
              setState(() => _isOpen = true);
              // }
            },
            onVerticalDragDown: !_isOpen ? _onDragDown : null,
            onVerticalDragStart: !_isOpen ? _onDragStart : null,
            onVerticalDragUpdate: !_isOpen ? _onDragUpdate : null,
            onVerticalDragEnd: !_isOpen ? _onDragEnd : null,
            onVerticalDragCancel: !_isOpen ? _onDragCancel : null,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(end: isOpen ? 1.0 : 0.0),
              duration: duration,
              curve: easing,
              builder: (context, value, child) {
                return Surface(
                  key: _toolbarKey,
                  clipBehavior: .antiAlias,
                  shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
                  color: Color.lerp(
                    colorTheme.surfaceContainerHigh,
                    colorTheme.surfaceContainerLowest,
                    value,
                  ),
                  elevation: lerpDouble(
                    elevationTheme.level0,
                    elevationTheme.level3,
                    value,
                  ),
                  child: IgnorePointer(
                    ignoring: value != 0.0 && value != 1.0,
                    child: child,
                  ),
                );
              },
              child: AnimatedSize(
                duration: duration,
                curve: easing,
                clipBehavior: .none,
                alignment: resolvedAlignment,
                child: AnimatedSwitcher(
                  duration: duration,
                  child: isOpen
                      ? buildExpandedContent()
                      : buildCollapsedContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Navigation2View extends StatefulWidget {
  const Navigation2View({super.key});

  @override
  State<Navigation2View> createState() => _Navigation2ViewState();
}

class _Navigation2ViewState extends State<Navigation2View> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(backgroundColor: colorTheme.surfaceContainer);
  }
}
