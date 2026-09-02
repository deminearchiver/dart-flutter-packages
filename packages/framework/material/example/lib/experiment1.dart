import 'dart:math' as math;

import 'package:material/material_color_utilities.dart' show EnergyColors;
import 'package:material/material_shapes.dart'
    show
        MaterialShapes,
        Morph,
        MorphBorder,
        RoundedPolygon,
        RoundedPolygonBorder,
        RoundedPolygonExtension;
import 'package:material_example/flutter.dart';

class Experiment1View extends StatefulWidget {
  const Experiment1View({super.key});

  @override
  State<Experiment1View> createState() => _Experiment1ViewState();
}

class _Experiment1ViewState extends State<Experiment1View> {
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

    // final containerColor = colorTheme.primary;
    // final contentColor = colorTheme.onPrimary;

    // final (middleArgb, endArgb) = EnergyColors.withAccentsArgb(
    //   containerColor.toARGB32(),
    //   colorTheme.primary.toARGB32(),
    //   colorTheme.secondary.toARGB32(),
    //   colorTheme.tertiary.toARGB32(),
    //   colorTheme.surfaceContainer.toARGB32(),
    //   false,
    //   .primary,
    // );
    // final middleColor = Color(middleArgb);
    // final endColor = Color(endArgb);

    // return Scaffold(
    //   body: SizedBox.expand(
    //     child: Padding(
    //       padding: .all(56.0),
    //       child: Surface.ink(
    //         shape: shapeTheme.applyCorner(corner: shapeTheme.cornerExtraLarge),
    //         backgroundDecorations: [.fillColor(colorTheme.surface)],
    //         // decoration: .compound(fills: [.color(colorTheme.surface)]),
    //         // fills: [.color(colorTheme.surface)],
    //         // outlines: [.from(color: colorTheme.outlineVariant, width: 1.0)],
    //         child: Align.center(
    //           child: Surface.ink(
    //             clipBehavior: .antiAlias,
    //             position: .background,
    //             shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
    //             backgroundDecorations: [
    //               .elevationShadow(
    //                 24.0,
    //                 color: colorTheme.primary,
    //                 transparentOccluder: true,
    //               ),
    //               .fillGradient(
    //                 LinearGradient(
    //                   begin: .topStart,
    //                   end: .bottomEnd,
    //                   colors: [containerColor, middleColor, endColor],
    //                 ),
    //                 blendMode: switch (colorTheme.brightness) {
    //                   .light => .hardLight,
    //                   .dark => .screen,
    //                 },
    //               ),
    //             ],
    //             foregroundDecorations: [
    //               // .fillColor(Colors.red),
    //               // .color(colorTheme.outlineVariant, width: 3.0),
    //               // .color(colorTheme.secondary, width: 10.0),
    //               // .color(colorTheme.onSecondary, width: 5.0),
    //               // .borderSide(.new(color: colorTheme.secondary, width: 10.0)),
    //               // .borderSide(.new(color: colorTheme.onSecondary, width: 5.0)),
    //             ],
    //             child: RawSurfaceInteraction(
    //               shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
    //               stateLayerColor: .all(contentColor),
    //               stateLayerOpacity: stateTheme.asWidgetStateLayerOpacity,
    //               onTap: () {},
    //               child: Padding(
    //                 padding: .symmetric(horizontal: 64.0, vertical: 48.0),
    //                 child: Flex.horizontal(
    //                   mainAxisSize: .min,
    //                   mainAxisAlignment: .center,
    //                   spacing: 16.0,
    //                   children: [
    //                     Icon(
    //                       MaterialSymbols.touch_app_rounded,
    //                       fill: 1.0,
    //                       opticalSize: 40.0,
    //                       size: 40.0,
    //                       color: contentColor,
    //                     ),
    //                     Text(
    //                       "Button",
    //                       style: typescaleTheme.headlineLargeEmphasized
    //                           .toTextStyle(color: contentColor),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    final shape = MorphBorder(
      side: BorderSide(
        color: colorTheme.onSecondaryContainer,
        width: 16.0,
        strokeAlign: 0,
      ),
      morph: Morph(MaterialShapes.puffyDiamond, MaterialShapes.puffy),
      progress: _progress,
      strokeCap: .round,
      strokeJoin: .round,
      strokeMiterLimit: 0.0,
    );
    return Scaffold(
      body: Padding(
        padding: const .all(24.0),
        child: Align.center(
          // child: Flex.vertical(
          //   mainAxisSize: .min,
          //   children: [
          //     SizedBox.square(
          //       dimension: 300.0,
          //       child: Surface(
          //         shape: shape,
          //         color: colorTheme.secondaryContainer,
          //         child: InkWell(customBorder: shape, onTap: () {}),
          //       ),
          //     ),
          //     const SizedBox(height: 16.0),
          //     Slider(
          //       value: _progress,
          //       onChanged: (value) => setState(() => _progress = value),
          //       min: 0.0,
          //       max: 1.0,
          //     ),
          //   ],
          // ),
          child: Stack(
            alignment: .center,
            children: [
              Positioned.fill(
                child: LayoutFittedBox(
                  fit: .cover,
                  child: IndeterminateLoadingIndicator(
                    containerColor: const .all(Colors.transparent),
                    activeIndicatorColor: .all(
                      colorTheme.surfaceContainerHighest,
                    ),
                    activeIndicatorOutline: .all(
                      .from(
                        width: 8.0,
                        color: colorTheme.secondaryContainer,
                        alignment: 0,
                      ),
                    ),
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
