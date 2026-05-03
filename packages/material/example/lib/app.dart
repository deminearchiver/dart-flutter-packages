import 'package:flutter/gestures.dart';
import 'package:material_example/flutter.dart';
import 'package:material_example/experiment1.dart' show Experiment1View;
import 'package:material_example/experiment2.dart' show Experiment2View;
import 'package:material_example/experiment3.dart' show Experiment3View;
import 'package:material_example/experiment4.dart' show Experiment4View;
import 'package:material_example/experiment5.dart' show Experiment5View;
import 'package:material_example/experiment6.dart' show Experiment6View;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildTypefaceTheme(BuildContext context, Widget child) =>
      TypefaceTheme.merge(data: _typography.typeface, child: child);

  Widget _buildReferenceThemes(BuildContext context, Widget child) =>
      CombiningBuilder(
        useOuterContext: true,
        builders: [_buildTypefaceTheme],
        child: child,
      );

  Widget _buildColorThemes(BuildContext context, Widget child) {
    final brightness = MediaQuery.platformBrightnessOf(context);
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
    return ColorTheme(
      data: colorTheme,
      child: StaticColors(data: staticColors, child: child),
    );
  }

  Widget _buildSpringTheme(BuildContext context, Widget child) =>
      SpringTheme(data: const .expressive(), child: child);

  Widget _buildTypescaleTheme(BuildContext context, Widget child) =>
      TypescaleTheme.merge(data: _typography.typescale, child: child);

  Widget _buildSystemThemes(BuildContext context, Widget child) =>
      CombiningBuilder(
        useOuterContext: true,
        builders: [_buildColorThemes, _buildSpringTheme, _buildTypescaleTheme],
        child: child,
      );

  Widget _buildComponentThemes(BuildContext context, Widget child) => child;

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
    return DefaultTextGeometry(
      style: typescaleTheme.bodyLarge.toTextStyle(color: colorTheme.onSurface),
      child: child,
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
    home: const Experiment6View(),
  );

  @override
  Widget build(BuildContext context) {
    final appBuilder = Builder(builder: _buildApp);
    return _buildThemes(context, appBuilder);
  }

  static const _variant = DynamicSchemeVariant.expressive;
  static const _platform = DynamicSchemePlatform.phone;
  static const _specVersion = DynamicSchemeSpecVersion.spec2026;
  static const _typography = TypographyDefaults.material3Expressive2026;
}
