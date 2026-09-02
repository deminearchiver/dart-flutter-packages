// import 'package:system_colors_android/src/jni_bindings.g.dart' as jb;
// import 'package:jni_flutter/jni_flutter.dart';
// import 'package:jni/jni.dart';
import 'package:material_ui/material_ui.dart';
import 'package:system_colors_android/system_colors_android.dart';

void main() {
  runApp(const MyApp());
}

class const MyApp({super.key}) extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late jb.DynamicTonalPalette _palette;
  // late jb.DynamicColorScheme _lightScheme;
  // late jb.DynamicColorScheme _darkScheme;

  // @override
  // void initState() {
  //   super.initState();
  //   final context = androidApplicationContext;
  //   _palette = jb.SystemColorsPlugin.dynamicPalette(context, 0);
  //   _lightScheme = jb.SystemColorsPlugin.lightDynamicScheme(context, 0);
  //   _darkScheme = jb.SystemColorsPlugin.darkDynamicScheme(context, 0);
  // }

  // @override
  // void dispose() {
  //   _palette.release();
  //   _lightScheme.release();
  //   _darkScheme.release();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final light = SystemColorsAndroid().lightColorScheme().resolve();
    final dark = SystemColorsAndroid().darkColorScheme().resolve();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: ColoredBox(
          color: light.errorDim,
          child: Center(child: Text('Running!!!')),
        ),
      ),
    );
  }
}
