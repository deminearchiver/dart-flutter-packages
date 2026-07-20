import 'dart:math' as math;

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
