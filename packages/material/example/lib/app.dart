import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material_example/flutter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _typography = TypographyDefaults.material2026;

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

    const variant = DynamicSchemeVariant.expressive;
    const specVersion = DynamicSchemeSpecVersion.spec2025;
    const platform = DynamicSchemePlatform.phone;

    final colorTheme = ColorThemeData.fromSeed(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: variant,
      specVersion: specVersion,
      platform: platform,
    );

    final staticColors = StaticColorsData.fallback(
      brightness: brightness,
      contrastLevel: contrastLevel,
      variant: variant,
      specVersion: specVersion,
      platform: platform,
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

    final legacyTheme = LegacyThemeFactory.createTheme(
      colorTheme: colorTheme,
      elevationTheme: elevationTheme,
      shapeTheme: shapeTheme,
      stateTheme: stateTheme,
      typescaleTheme: typescaleTheme,
      scaffoldBackgroundColor: colorTheme.surfaceContainer,
    );

    return Theme(data: legacyTheme, child: child);
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

    final materialLocalization = Localizations.of<MaterialLocalizations>(
      context,
      MaterialLocalizations,
    );

    final colorTheme = ColorTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final category = materialLocalization?.scriptCategory ?? .englishLike;
    final localizedTextStyle = DefaultTextStyles.geometryStyleFor(category);
    final defaultTextStyle = typescaleTheme.bodyLarge.toTextStyle(
      color: colorTheme.onSurface,
    );
    final mergedTextStyle = defaultTextStyle.merge(localizedTextStyle);

    return DefaultTextStyle.merge(style: mergedTextStyle, child: child);
  }

  Widget _buildApp(BuildContext context) {
    return RawMaterialApp(
      // Debug
      debugShowCheckedModeBanner: false,

      // Localization
      title: "Material",

      // Navigation
      builder: _buildNavigatorWrapper,
      home: const SplashView(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBuilder = Builder(builder: _buildApp);
    return _buildThemes(context, appBuilder);
  }
}

class Splash1View extends StatefulWidget {
  const Splash1View({super.key});

  @override
  State<Splash1View> createState() => _Splash1ViewState();
}

class _Splash1ViewState extends State<Splash1View>
    with TickerProviderStateMixin {
  late AnimationController _colorFraction;
  late AnimationController _fraction;
  late AnimationController _transitionFraction;

  late DurationThemeData _durationTheme;
  late EasingThemeData _easingTheme;
  late SpringThemeData _springTheme;

  Future<void> _animate() async {
    if (!mounted) return;
    await _colorFraction.animateWith(
      SpringSimulation(
        _springTheme.slowEffects.toSpringDescription(),
        _colorFraction.value,
        1.0,
        0.0,
        snapToEnd: true,
      ),
    );
    await Future<void>.delayed(_durationTheme.short4);
    if (!mounted) return;
    await _fraction.animateWith(
      SpringSimulation(
        _springTheme.fastSpatial.toSpringDescription(),
        _fraction.value,
        1.0,
        0.0,
        snapToEnd: true,
      ),
    );
    await Future<void>.delayed(_durationTheme.extraLong4);
    if (!mounted) return;
    await _transitionFraction.animateTo(
      1.0,
      duration: _durationTheme.extraLong2,
      curve: _easingTheme.emphasized,
    );
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    _colorFraction = AnimationController(vsync: this, value: 0.0);
    _fraction = AnimationController.unbounded(vsync: this, value: 0.0);
    _transitionFraction = AnimationController.unbounded(
      vsync: this,
      value: 0.0,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(_animate());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _durationTheme = DurationTheme.of(context);
    _easingTheme = EasingTheme.of(context);
    _springTheme = SpringTheme.of(context);
  }

  @override
  void dispose() {
    _transitionFraction.dispose();
    _fraction.dispose();
    _colorFraction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final displayCornerRadii =
        MediaQuery.displayCornerRadiiOf(context) ?? .zero;
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    final backgroundColor = colorTheme.surfaceContainer;

    final padding1 = padding + const EdgeInsets.all(16.0);
    final padding2 = EdgeInsets.zero;

    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([_colorFraction, _transitionFraction]),
            builder: (context, child) => ColoredBox(
              color: Color.lerp(
                Color.lerp(
                  colorTheme.surface,
                  colorTheme.surfaceContainerLow,
                  _colorFraction.value,
                ),
                colorTheme.surfaceContainer,
                _transitionFraction.value,
              )!,
              child: child,
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  fillOverscroll: false,
                  hasScrollBody: false,
                  child: AnimatedBuilder(
                    animation: _transitionFraction,
                    builder: (context, child) => Padding(
                      padding: EdgeInsets.lerp(
                        padding1,
                        padding2,
                        _transitionFraction.value,
                      )!,
                      child: child,
                    ),
                    child: AnimatedBuilder(
                      animation: Listenable.merge([
                        _colorFraction,
                        _transitionFraction,
                      ]),
                      builder: (context, child) => Material(
                        clipBehavior: .antiAlias,
                        shape: _transitionFraction.isCompleted
                            ? CornersBorder.rounded(
                                corners: .all(shapeTheme.corner.none),
                              )
                            : ShapeBorder.lerp(
                                CornersBorder.rounded(
                                  corners: .all(shapeTheme.corner.full),
                                ),
                                CornersBorder.rounded(
                                  corners: .fromBorderRadius(
                                    displayCornerRadii,
                                  ),
                                ),
                                _transitionFraction.value,
                              ),
                        color: Color.lerp(
                          Color.lerp(
                            colorTheme.surface,
                            colorTheme.surfaceContainerLowest,
                            _colorFraction.value,
                          ),
                          colorTheme.surfaceContainer,
                          _transitionFraction.value,
                        ),
                        child: child,
                      ),
                      child: Align.center(
                        child: AnimatedBuilder(
                          animation: _transitionFraction,
                          builder: (context, child) => Opacity(
                            opacity: clampDouble(
                              lerpDouble(1.0, 0.0, _transitionFraction.value),
                              0.0,
                              1.0,
                            ),
                            child: FractionalTranslation(
                              translation: Offset.lerp(
                                Offset.zero,
                                Offset(0.0, -0.25),
                                _transitionFraction.value,
                              )!,
                              child: child,
                            ),
                          ),
                          child: Flex.vertical(
                            mainAxisSize: .min,
                            children: [
                              Text(
                                "Material 3 Expressive",
                                textAlign: .center,
                                style: typescaleTheme.displayLargeEmphasized
                                    .toTextStyle(color: colorTheme.primary),
                              ),
                              const SizedBox(height: 16.0),
                              AnimatedBuilder(
                                animation: _fraction,
                                builder: (context, child) => Align.center(
                                  heightFactor: math.max(0.0, _fraction.value),
                                  child: Opacity(
                                    opacity: clampDouble(
                                      _fraction.value,
                                      0.0,
                                      1.0,
                                    ),
                                    child: Transform.scale(
                                      scale: _fraction.value,
                                      child: child,
                                    ),
                                  ),
                                ),
                                child: const SizedBox.square(
                                  dimension: 96.0,
                                  child: IndeterminateLoadingIndicator(
                                    contained: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _transitionFraction,
            builder: (context, child) => FractionalTranslation(
              translation: Offset.lerp(
                Offset(0.0, 0.25),
                Offset.zero,
                _transitionFraction.value,
              )!,
              child: Opacity(
                opacity: clampDouble(_transitionFraction.value, 0.0, 1.0),
                child: child,
              ),
            ),
            child: Align.center(child: Text("AAAAAA")),
          ),
        ],
      ),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Simulation get _simulation => DelayingSimulation(
    simulation: ScalingSimulation(
      simulation: SpringSimulation(
        const SpringThemeData.expressive().fastSpatial.toSpringDescription(),
        0.0,
        1.0,
        0.0,
        snapToEnd: true,
      ),
      timeScale: 0.1,
    ),
    delay: const Duration(seconds: 0),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Align.center(
          child: Flex.vertical(
            mainAxisSize: .min,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => FilledButton(
                  style: LegacyThemeFactory.createButtonStyle(
                    colorTheme: colorTheme,
                    elevationTheme: elevationTheme,
                    shapeTheme: shapeTheme,
                    stateTheme: stateTheme,
                    typescaleTheme: typescaleTheme,
                    color: .tonal,
                    size: .medium,
                    isSelected: _controller.isAnimating,
                  ),
                  onPressed: () {
                    if (_controller.isAnimating) {
                      // _controller.value = 0.0;
                      _controller.stop();
                    } else {
                      _controller.animateWith(_simulation);
                    }
                  },
                  child: _controller.isAnimating
                      ? const Text("Stop")
                      : const Text("Start"),
                ),
              ),
              const SizedBox(height: 16.0),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.translate(
                  offset: Offset.lerp(
                    Offset(0.0, 64.0),
                    Offset.zero,
                    _controller.value,
                  )!,
                  child: const SizedBox.square(
                    dimension: 64.0,
                    child: IndeterminateLoadingIndicator(contained: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
