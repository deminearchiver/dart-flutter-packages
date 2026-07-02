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

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildTypefaceTheme(BuildContext context, Widget child) =>
      TypefaceTheme.mergeWithData(data: _typography.typeface, child: child);

  Widget _buildReferenceThemes(BuildContext context, Widget child) =>
      CombiningBuilder(
        useOuterContext: true,
        builders: [_buildTypefaceTheme],
        child: child,
      );

  Widget _buildColorThemes(BuildContext context, Widget child) {
    final Brightness brightness = switch (_themeMode) {
      .system => MediaQuery.platformBrightnessOf(context),
      .light => .light,
      .dark => .dark,
    };
    final highContrast = MediaQuery.highContrastOf(context);
    final contrastLevel = highContrast ? 1.0 : 0.0;
    final colorTheme = ColorThemeData.fromSeed(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: _variant,
      platform: _platform,
      specVersion: _specVersion,
    );
    final staticColors = StaticColorsData.fallback(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: _variant,
      platform: _platform,
      specVersion: _specVersion,
    );
    return ColorTheme.replaceWithData(
      data: colorTheme,
      // data: .fromPalette(
      //   palette: const .defaults(),
      //   brightness: brightness,
      //   contrastLevel: contrastLevel,
      // ),
      child: StaticColors(data: staticColors, child: child),
    );
  }

  Widget _buildSpringTheme(BuildContext context, Widget child) =>
      SpringTheme.replaceWithData(
        data: const SpringThemeData.defaultsExpressive(),
        child: child,
      );

  Widget _buildTypescaleTheme(BuildContext context, Widget child) =>
      TypescaleTheme.mergeWithData(data: _typography.typescale, child: child);

  Widget _buildSystemThemes(BuildContext context, Widget child) =>
      CombiningBuilder(
        useOuterContext: true,
        builders: [
          _buildColorThemes,
          _buildSpringTheme,
          _buildTypescaleTheme,
          // (context, child) => MeasurementTheme.mergeWithData(
          //   data: const .from(space100: 8.0),
          //   child: child,
          // ),
          // (context, child) => ShapeTheme.mergeWithData(
          //   data: .from(cornerFamily: .cut),
          //   child: child,
          // ),
        ],
        child: child,
      );

  Widget _buildComponentThemes(BuildContext context, Widget child) {
    return child;
  }

  Widget _buildLegacyThemes(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Theme(
      data: LegacyThemeFactory.createTheme(
        colorTheme: colorTheme,
        elevationTheme: elevationTheme,
        shapeTheme: shapeTheme,
        stateTheme: stateTheme,
        typescaleTheme: typescaleTheme,
        scaffoldBackgroundColor: colorTheme.surfaceContainer,
      ),
      child: child,
    );
  }

  Widget _buildThemes(BuildContext context, Widget child) => CombiningBuilder(
    builders: [
      _buildReferenceThemes,
      _buildSystemThemes,
      _buildComponentThemes,
      _buildLegacyThemes,
    ],
    child: child,
  );

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
  static const _typography = TypographyDefaults.material3Expressive2026;
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

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
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
            _ => Scaffold(
              backgroundColor: colorTheme.surfaceContainer,
              body: const Placeholder(),
            ),
          },
        ),
        Padding(
          padding: padding,
          child: Align.centerStart(
            child: Padding(
              padding: .symmetric(horizontal: 4.0, vertical: 4.0),
              child: IconButton(
                style: LegacyThemeFactory.createIconButtonStyle(
                  colorTheme: colorTheme,
                  elevationTheme: elevationTheme,
                  shapeTheme: shapeTheme,
                  stateTheme: stateTheme,
                  width: .normal,
                  color: .tonal,
                  size: .small,
                  shape: .square,
                  containerColor: colorTheme.inverseSurface,
                  iconColor: colorTheme.inverseOnSurface,
                  // containerElevation: elevationTheme.level3,
                ),
                onPressed: () {
                  setState(() => _setSelectedIndex(_selectedIndex + 1));
                },
                icon: const Icon(
                  Symbols.menu_open_rounded,
                  opticalSize: 20.0,
                  size: 20.0,
                ),
                tooltip: "Show next experiment",
              ),
            ),
          ),
        ),
      ],
    );
  }

  static const _firstIndex = 1;
  static const _lastIndex = 8;
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
