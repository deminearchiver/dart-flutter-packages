import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:material_example/experiment3.dart' show Experiment3View;
import 'package:material_example/experiment4.dart' show Experiment4View;
import 'package:material_example/flutter.dart';

// ignore: implementation_imports
import 'package:material/src/material_shapes/material_shapes.dart' hide Corner;

import 'experiment5.dart' show Experiment5View;

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
    home: const Experiment5View(),
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

class Example1View extends StatefulWidget {
  const Example1View({super.key});

  @override
  State<Example1View> createState() => _Example1ViewState();
}

class _Example1ViewState extends State<Example1View> {
  final _geminiPolygons = <RoundedPolygon>[
    // MaterialShapes.gemini
    MaterialShapes.clover4Leaf,
    MaterialShapes.oval,
    MaterialShapes.flower,
    MaterialShapes.pentagon,
    MaterialShapes.clover4Leaf,
    MaterialShapes.oval,
    // MaterialShapes.gemini
    MaterialShapes.triangle,
    MaterialShapes.flower,
    MaterialShapes.pentagon,
    MaterialShapes.oval,
    // MaterialShapes.gemini
    MaterialShapes.sunny,
    MaterialShapes.oval,
    MaterialShapes.clover4Leaf,
    MaterialShapes.triangle,
    // MaterialShapes.gemini
  ];

  var _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const .all(24.0),
        child: Align.center(
          child: Stack(
            alignment: .center,
            children: [
              Positioned.fill(
                child: FittedBox(
                  fit: .cover,
                  child: IndeterminateLoadingIndicator(
                    contained: false,
                    indicatorColor: colorTheme.surfaceContainerHighest,
                    // indicatorPolygons: _geminiPolygons,
                  ),
                  // child: DeterminateLoadingIndicator(
                  //   contained: false,
                  //   indicatorColor: colorTheme.surfaceContainerHighest,
                  //   // indicatorPolygons: [
                  //   //   // ignore: invalid_use_of_internal_member
                  //   //   MaterialShapes.triangle.transformedWithMatrix(
                  //   //     Matrix4.identity()..translateByDouble(0.0, 0.0, 0.0, 0.5),
                  //   //     usePerspectiveTransform: true,
                  //   //   ),
                  //   //   MaterialShapes.triangle,
                  //   // ],
                  //   // indicatorPolygons: _geminiPolygons,
                  //   // forEachPolygon: (polygon) => polygon,
                  //   progress: _progress,
                  // ),
                ),
              ),
              IntrinsicWidth(
                child: Visibility.maintain(
                  visible: true,
                  child: Flex.vertical(
                    mainAxisSize: .min,
                    children: [
                      Text(
                        "Material 3 Expressive",
                        textAlign: .center,
                        style: typescaleTheme.displaySmallEmphasized
                            .toTextStyle(color: colorTheme.onSurface),
                      ),
                      // const SizedBox(height: 24.0),
                      // Slider(
                      //   onChanged: (value) => setState(() => _progress = value),
                      //   value: _progress,
                      // ),
                    ],
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

class Example2View extends StatefulWidget {
  const Example2View({super.key});

  @override
  State<Example2View> createState() => _Example2ViewState();
}

class _Example2ViewState extends State<Example2View> {
  var _width = 1.0;
  var _height = 1.0;

  var _fixedTopLeft = 0.0;
  var _fixedTopRight = 0.0;
  var _fixedBottomLeft = 0.0;
  var _fixedBottomRight = 0.0;

  var _fractionalTopLeft = 0.0;
  var _fractionalTopRight = 0.0;
  var _fractionalBottomLeft = 0.0;
  var _fractionalBottomRight = 0.0;

  String _fractionToPercentage(double value, bool fill) {
    final unpadded = "${(value * 100).round()}%";
    return fill ? unpadded.padLeft(4, " ") : unpadded;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    // Candidates: 128, 192, 256, 312, 360
    const maxWidth = 192.0;
    const maxHeight = 192.0;

    final innerCorner = shapeTheme.corner.extraSmall;
    final outerCorner = shapeTheme.corner.large;

    final width = _width * maxWidth;
    final height = _height * maxHeight;
    final aspectRatio = width == 0.0 && height == 0.0
        ? 0.0
        : math.min(width, height) / math.max(width, height);

    final thickness = lerpDouble(
      1.0,
      lerpDouble(1.0, 3.0, math.min(_width, _height)),
      aspectRatio,
    );

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: colorTheme.surfaceContainer,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Shape",
                style: typescaleTheme.titleLargeEmphasized.toTextStyle(
                  color: colorTheme.onSurface,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0,
                thumbSize: .resolveWith(
                  (states) => states.contains(WidgetState.pressed)
                      ? const Size(2.0, 32.0)
                      : const Size(4.0, 32.0),
                ),
              ),
              child: SliverPadding(
                padding: .symmetric(horizontal: 8.0),
                sliver: SliverList.list(
                  children: [
                    Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: Align.center(
                        child: SizedBox(
                          width: maxWidth,
                          height: maxHeight,
                          child: Material(
                            borderOnForeground: false,
                            shape: CornersBorder.rounded(
                              corners: .all(shapeTheme.corner.large),
                            ),
                            color: colorTheme.surfaceContainerLowest,
                            child: Align.center(
                              child: SizedBox(
                                width: width,
                                height: height,
                                child: Material(
                                  clipBehavior: .antiAlias,
                                  borderOnForeground: true,
                                  shape: CornersBorder.rounded(
                                    corners: .only(
                                      topLeft:
                                          Corner.fixed(_fixedTopLeft * 48.0) +
                                          .fractional(_fractionalTopLeft),
                                      topRight:
                                          Corner.fixed(_fixedTopRight * 48.0) +
                                          .fractional(_fractionalTopRight),
                                      bottomLeft:
                                          Corner.fixed(
                                            _fixedBottomLeft * 48.0,
                                          ) +
                                          .fractional(_fractionalBottomLeft),
                                      bottomRight:
                                          Corner.fixed(
                                            _fixedBottomRight * 48.0,
                                          ) +
                                          .fractional(_fractionalBottomRight),
                                    ),
                                    side: .new(
                                      width: thickness,
                                      color: colorTheme.onSecondaryContainer,
                                    ),
                                  ),
                                  color: colorTheme.secondaryContainer,
                                  child: InkWell(
                                    overlayColor: WidgetStateLayerColor(
                                      color: .all(
                                        colorTheme.onSecondaryContainer,
                                      ),
                                      opacity:
                                          stateTheme.asWidgetStateLayerOpacity,
                                    ),
                                    onTap: () {},
                                    child: Align.center(
                                      child: ConstrainedBox(
                                        constraints: .new(
                                          maxWidth: 64.0,
                                          maxHeight: 64.0,
                                        ),
                                        child: FittedBox(
                                          fit: .contain,
                                          child: DeterminateLoadingIndicator(
                                            contained: false,
                                            indicatorColor:
                                                colorTheme.onSecondaryContainer,
                                            progress: aspectRatio,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    IntrinsicHeight(
                      child: Flex.horizontal(
                        children: [
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                CornersBorder.rounded(
                                  corners: .directional(
                                    topStart: outerCorner,
                                    topEnd: innerCorner,
                                    bottomStart: innerCorner,
                                    bottomEnd: innerCorner,
                                  ),
                                ),
                              ),
                              child: Flex.vertical(
                                children: [
                                  ListItemLayout(
                                    leading: const Icon(Symbols.width_rounded),
                                    headline: Text("Width"),
                                    trailing: Text(
                                      _fractionToPercentage(_width, false),
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(16.0, 0.0, 16.0, 10.0),
                                    value: _width,
                                    onChanged: (value) =>
                                        setState(() => _width = value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                CornersBorder.rounded(
                                  corners: .directional(
                                    topStart: innerCorner,
                                    topEnd: outerCorner,
                                    bottomStart: innerCorner,
                                    bottomEnd: innerCorner,
                                  ),
                                ),
                              ),
                              child: Flex.vertical(
                                children: [
                                  ListItemLayout(
                                    leading: const Icon(Symbols.width_rounded),
                                    headline: Text("Height"),
                                    trailing: Text(
                                      _fractionToPercentage(_height, false),
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(16.0, 0.0, 16.0, 10.0),
                                    value: _height,
                                    onChanged: (value) =>
                                        setState(() => _height = value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    ListItemContainer(
                      containerShape: .all(
                        CornersBorder.rounded(corners: .all(innerCorner)),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(Symbols.width_rounded),
                            headline: Text("Fixed"),
                            trailing: Text(
                              "${_fractionToPercentage(_fixedTopLeft, true)} "
                              "${_fractionToPercentage(_fixedTopRight, true)}\n"
                              "${_fractionToPercentage(_fixedBottomLeft, true)} "
                              "${_fractionToPercentage(_fixedBottomRight, true)}",
                              textAlign: .end,
                              style: const TextStyle(
                                fontFamily: "Monaspace Argon",
                              ),
                            ),
                          ),
                          Padding(
                            padding: .fromLTRB(16.0, 6.0, 16.0, 16.0),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedTopLeft,
                                        onChanged: (value) => setState(
                                          () => _fixedTopLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedTopRight,
                                        onChanged: (value) => setState(
                                          () => _fixedTopRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedBottomLeft,
                                        onChanged: (value) => setState(
                                          () => _fixedBottomLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedBottomRight,
                                        onChanged: (value) => setState(
                                          () => _fixedBottomRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    ListItemContainer(
                      containerShape: .all(
                        CornersBorder.rounded(
                          corners: .vertical(
                            top: innerCorner,
                            bottom: outerCorner,
                          ),
                        ),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(Symbols.width_rounded),
                            headline: Text("Fractional"),
                            trailing: Text(
                              "${_fractionToPercentage(_fractionalTopLeft, true)} "
                              "${_fractionToPercentage(_fractionalTopRight, true)}\n"
                              "${_fractionToPercentage(_fractionalBottomLeft, true)} "
                              "${_fractionToPercentage(_fractionalBottomRight, true)}",
                              textAlign: .end,
                              style: const TextStyle(
                                fontFamily: "Monaspace Argon",
                              ),
                            ),
                          ),
                          Padding(
                            padding: .fromLTRB(16.0, 6.0, 16.0, 16.0),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalTopLeft,
                                        onChanged: (value) => setState(
                                          () => _fractionalTopLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalTopRight,
                                        onChanged: (value) => setState(
                                          () => _fractionalTopRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalBottomLeft,
                                        onChanged: (value) => setState(
                                          () => _fractionalBottomLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalBottomRight,
                                        onChanged: (value) => setState(
                                          () => _fractionalBottomRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
