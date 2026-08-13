import 'package:flutter/material.dart';
import 'package:libmonet/libmonet.dart';
import 'package:material_3p/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'floating_navigation_bar.dart';

void main() {
  runApp(const App());
}

extension on DynamicScheme {
  ColorScheme toColorScheme() => ColorScheme(
    brightness: isDark ? .dark : .light,
    // ignore: deprecated_member_use
    background: Color(background),
    // ignore: deprecated_member_use
    onBackground: Color(onBackground),
    surface: Color(surface),
    surfaceDim: Color(surfaceDim),
    surfaceBright: Color(surfaceBright),
    surfaceContainerLowest: Color(surfaceContainerLowest),
    surfaceContainerLow: Color(surfaceContainerLow),
    surfaceContainer: Color(surfaceContainer),
    surfaceContainerHigh: Color(surfaceContainerHigh),
    surfaceContainerHighest: Color(surfaceContainerHighest),
    onSurface: Color(onSurface),
    // ignore: deprecated_member_use
    surfaceVariant: Color(surfaceVariant),
    onSurfaceVariant: Color(onSurfaceVariant),
    outline: Color(outline),
    outlineVariant: Color(outlineVariant),
    inverseSurface: Color(inverseSurface),
    onInverseSurface: Color(inverseOnSurface),
    shadow: Color(shadow),
    scrim: Color(scrim),
    surfaceTint: Color(surfaceTint),
    primary: Color(primary),
    onPrimary: Color(onPrimary),
    primaryContainer: Color(primaryContainer),
    onPrimaryContainer: Color(onPrimaryContainer),
    primaryFixed: Color(primaryFixed),
    primaryFixedDim: Color(primaryFixedDim),
    onPrimaryFixed: Color(onPrimaryFixed),
    onPrimaryFixedVariant: Color(onPrimaryFixedVariant),
    inversePrimary: Color(inversePrimary),
    secondary: Color(secondary),
    onSecondary: Color(onSecondary),
    secondaryContainer: Color(secondaryContainer),
    onSecondaryContainer: Color(onSecondaryContainer),
    secondaryFixed: Color(secondaryFixed),
    secondaryFixedDim: Color(secondaryFixedDim),
    onSecondaryFixed: Color(onSecondaryFixed),
    onSecondaryFixedVariant: Color(onSecondaryFixedVariant),
    tertiary: Color(tertiary),
    onTertiary: Color(onTertiary),
    tertiaryContainer: Color(tertiaryContainer),
    onTertiaryContainer: Color(onTertiaryContainer),
    tertiaryFixed: Color(tertiaryFixed),
    tertiaryFixedDim: Color(tertiaryFixedDim),
    onTertiaryFixed: Color(onTertiaryFixed),
    onTertiaryFixedVariant: Color(onTertiaryFixedVariant),
    error: Color(error),
    onError: Color(onError),
    errorContainer: Color(errorContainer),
    onErrorContainer: Color(onErrorContainer),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  ColorScheme _createColorScheme({
    required Brightness brightness,
    bool highContrast = false,
  }) => DynamicScheme.withDefaults(
    isDark: switch (brightness) {
      .light => false,
      .dark => true,
    },
    contrastLevel: highContrast ? 1.0 : 0.0,
    variant: .vibrant,
    platform: .phone,
    specVersion: .spec2026,
  ).toColorScheme();

  ThemeData _createTheme({required ColorScheme colorScheme}) {
    return ThemeData(
      colorScheme: colorScheme,
      splashFactory: InkSparkle.splashFactory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debugging
      debugShowCheckedModeBanner: false,
      // Theming
      themeMode: .system,
      theme: _createTheme(colorScheme: _createColorScheme(brightness: .light)),
      darkTheme: _createTheme(
        colorScheme: _createColorScheme(brightness: .dark),
      ),
      highContrastTheme: _createTheme(
        colorScheme: _createColorScheme(brightness: .light, highContrast: true),
      ),
      highContrastDarkTheme: _createTheme(
        colorScheme: _createColorScheme(brightness: .dark, highContrast: true),
      ),
      // Navigation
      home: const DemoView(),
    );
  }
}

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  var _selectedIndex = 0;
  var _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const Center(
            child: Wrap(
              alignment: .center,
              runAlignment: .center,
              crossAxisAlignment: .center,
              spacing: 80.0,
              runSpacing: 80.0,
              children: [
                SizedBox.square(
                  dimension: 160.0,
                  child: IndeterminateLoadingIndicator(contained: false),
                ),
                SizedBox.square(
                  dimension: 160.0,
                  child: IndeterminateLoadingIndicator(contained: true),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: .min,
              spacing: 80.0,
              children: [
                Wrap(
                  alignment: .center,
                  runAlignment: .center,
                  crossAxisAlignment: .center,
                  spacing: 80.0,
                  runSpacing: 80.0,
                  children: [
                    SizedBox.square(
                      dimension: 160.0,
                      child: DeterminateLoadingIndicator(
                        contained: false,
                        progress: _progress,
                      ),
                    ),
                    SizedBox.square(
                      dimension: 160.0,
                      child: DeterminateLoadingIndicator(
                        contained: true,
                        progress: _progress,
                      ),
                    ),
                  ],
                ),
                Slider(
                  // ignore: deprecated_member_use
                  year2023: false,
                  onChanged: (value) => setState(() => _progress = value),
                  value: _progress,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: .all(16.0),
        child: Center(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: FloatingNavigationBar(
            onSelectedIndexChanged: (value) =>
                setState(() => _selectedIndex = value),
            selectedIndex: _selectedIndex,
            destinations: const [
              FloatingNavigationBarDestination(
                icon: Icon(Symbols.progress_activity_rounded),
                label: Text("Indeterminate"),
                tooltip: "Indeterminate",
              ),
              FloatingNavigationBarDestination(
                icon: Icon(Symbols.clock_loader_60_rounded),
                label: Text("Determinate"),
                tooltip: "Determinate",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
