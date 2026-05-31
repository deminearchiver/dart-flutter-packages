import 'package:material_example/flutter.dart';

// import 'package:material/src/material/switch/switch2.dart';

// class CustomSwitch extends StatefulWidget {
//   const CustomSwitch({super.key, required this.value});

//   final bool value;

//   @override
//   State<CustomSwitch> createState() => _CustomSwitchState();
// }

// class _CustomSwitchState extends State<CustomSwitch> {
//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = ColorTheme.of(context);
//     final elevationTheme = ElevationTheme.of(context);
//     final measurementTheme = MeasurementTheme.of(context);
//     final shapeTheme = ShapeTheme.of(context);
//     final stateTheme = StateTheme.of(context);
//     final typescaleTheme = TypescaleTheme.of(context);
//     return SwitchLayout(
//       children: [
//         SwitchLayoutItem(
//           slot: .track,
//           child: SizedBox(
//             width: 52.0,
//             height: 32.0,
//             child: Surface(
//               clipBehavior: .none,
//               shape: shapeTheme.applyCorner(
//                 corner: shapeTheme.cornerFull,
//                 side: BorderSide(width: 2.0, color: colorTheme.outline),
//               ),
//               color: colorTheme.surfaceContainerHighest,
//             ),
//           ),
//         ),
//         SwitchLayoutItem(
//           slot: .handle,
//           forcePointer: true,
//           child: SizedBox.square(
//             dimension: 40.0,
//             child: Surface.raw(
//               child: InkWell(
//                 customBorder: shapeTheme.applyCorner(
//                   corner: shapeTheme.cornerFull,
//                 ),
//                 onTap: () {},
//               ),
//             ),
//           ),
//         ),
//         SwitchLayoutItem(
//           slot: .handle,
//           child: SizedBox.square(
//             dimension: 24.0,
//             child: Surface(
//               clipBehavior: .antiAlias,
//               shape: shapeTheme.applyCorner(corner: shapeTheme.cornerFull),
//               color: colorTheme.outline,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class Experiment6View extends StatefulWidget {
  const Experiment6View({super.key});

  @override
  State<Experiment6View> createState() => _Experiment6ViewState();
}

class _Experiment6ViewState extends State<Experiment6View> {
  var _customSwitchChecked = false;
  final _selected = <int>{};

  ListItemThemeDataPartial _listItemTheme1(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return .from(
      containerColor: .resolveWith(
        (states) => _selected.contains(1)
            ? colorTheme.secondaryContainer
            : colorTheme.surfaceContainerLow,
      ),
    );
  }

  ListItemThemeDataPartial _listItemTheme2(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return .from(
      containerColor: .resolveWith(
        (states) => _selected.contains(2) ? colorTheme.tertiaryContainer : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    // .copyWith(hoverStateLayerOpacity: 0.32, pressedStateLayerOpacity: 0.32);
    final typescaleTheme = TypescaleTheme.of(context);

    // final focusInsetRingTheme = FocusInsetRingTheme.of(context);

    // final listItemTheme = material_experimental.ListItemTheme.of(context);
    // print(listItemTheme);

    // Widget buildConnectedButtonGroupButton({
    //   required ButtonSize size,
    //   required ButtonShape shape,
    //   required ConnectedButtonGroupColor color,
    //   required bool isSelected,
    //   required Widget child,
    // }) {
    //   late final unselectedContainerColor = switch (color) {
    //     .filled => colorTheme.surfaceContainer,
    //     .tonal => colorTheme.secondaryContainer,
    //     .outlined => Colors.transparent,
    //   };
    //   late final selectedContainerColor = switch (color) {
    //     .filled => colorTheme.primary,
    //     .tonal => colorTheme.secondary,
    //     .outlined => colorTheme.inverseSurface,
    //   };
    //   final containerColor = isSelected
    //       ? selectedContainerColor
    //       : unselectedContainerColor;
    //   late final unselectedContentColor = switch (color) {
    //     .filled => colorTheme.onSurfaceVariant,
    //     .tonal => colorTheme.onSecondaryContainer,
    //     .outlined => colorTheme.onSurfaceVariant,
    //   };
    //   late final selectedContentColor = switch (color) {
    //     .filled => colorTheme.onPrimary,
    //     .tonal => colorTheme.onSecondary,
    //     .outlined => colorTheme.inverseOnSurface,
    //   };
    //   final contentColor = isSelected
    //       ? selectedContentColor
    //       : unselectedContentColor;
    //   return Surface(
    //     clipBehavior: .antiAlias,
    //     color: containerColor,
    //     child: child,
    //   );
    // }
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      // body: Align.center(child: _Layer1(child: _Layer2())),
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            // SliverFillRemaining(
            //   fillOverscroll: false,
            //   hasScrollBody: false,
            //   child: Flex.vertical(
            //     mainAxisAlignment: .center,
            //     children: [
            //       // SizedBox.square(
            //       //   dimension: 100.0,
            //       //   child: SwitchTheme.mergeWithData(
            //       //     // data: const .from(),
            //       //     data: const .from(minTapTargetSize: .all(.square(100.0))),
            //       //     child: Switch(
            //       //       onCheckedChanged: (value) {},
            //       //       checked: false,
            //       //     ),
            //       //   ),
            //       // ),
            //       // Switch(onCheckedChanged: (value) {}, checked: false),
            //       // Wrap(
            //       //   children: [
            //       //     SizedBox.square(
            //       //       dimension: 100.0,
            //       //       child: Surface(
            //       //         shape: shapeTheme.applyCorner(
            //       //           corner: shapeTheme.cornerLarge,
            //       //         ),
            //       //         color: colorTheme.surface,
            //       //         child: Align.center(
            //       //           child: CustomSwitch(value: _customSwitchChecked),
            //       //         ),
            //       //       ),
            //       //     ),
            //       //     SizedBox.square(
            //       //       dimension: 100.0,
            //       //       child: Surface(
            //       //         shape: shapeTheme.applyCorner(
            //       //           corner: shapeTheme.cornerLarge,
            //       //         ),
            //       //         color: colorTheme.surface,
            //       //         child: CustomSwitch(value: _customSwitchChecked),
            //       //       ),
            //       //     ),
            //       //   ],
            //       // ),
            //       Wrap(
            //         direction: .horizontal,
            //         alignment: .center,
            //         spacing: 12.0,
            //         children: [
            //           // SizedTouchTarget(
            //           //   behavior: .overflow,
            //           //   minimumSize: .square(48.0),
            //           //   child: ConstrainedBox(
            //           //     constraints: BoxConstraints(
            //           //       minWidth: 48.0,
            //           //       minHeight: 24.0,
            //           //     ),
            //           //     child: Surface(
            //           //       clipBehavior: .antiAlias,
            //           //       color: colorTheme.primary,
            //           //       shape: shapeTheme.applyCorners(
            //           //         corners: .all(shapeTheme.cornerSmall),
            //           //       ),
            //           //       child: InkWell(
            //           //         overlayColor: WidgetStateLayerColor(
            //           //           color: .all(colorTheme.onPrimary),
            //           //           opacity: stateTheme.asWidgetStateLayerOpacity,
            //           //         ),
            //           //         onTap: () {},
            //           //         child: Align.center(
            //           //           widthFactor: 1.0,
            //           //           heightFactor: 1.0,
            //           //           child: Padding(
            //           //             padding: .symmetric(
            //           //               horizontal: measurementTheme.space100,
            //           //               vertical: measurementTheme.space50,
            //           //             ),
            //           //             child: Flex.horizontal(
            //           //               mainAxisSize: .min,
            //           //               spacing: 4.0,
            //           //               children: [
            //           //                 Icon(
            //           //                   Symbols.add_2_rounded,
            //           //                   opticalSize: 24.0,
            //           //                   size: 16.0,
            //           //                   color: colorTheme.onPrimary,
            //           //                 ),
            //           //                 Flexible.loose(
            //           //                   child: Text(
            //           //                     "Option A",
            //           //                     style: typescaleTheme.labelMedium
            //           //                         .toTextStyle(
            //           //                           color: colorTheme.onPrimary,
            //           //                         ),
            //           //                   ),
            //           //                 ),
            //           //               ],
            //           //             ),
            //           //           ),
            //           //         ),
            //           //       ),
            //           //     ),
            //           //   ),
            //           // ),
            //           SizedTouchTarget(
            //             fit: .overflow,
            //             minimumSize: const .square(48.0),
            //             child: SizedBox(
            //               width: 32.0,
            //               height: 40.0,
            //               child: Surface(
            //                 clipBehavior: .antiAlias,
            //                 color: colorTheme.primary,
            //                 shape: shapeTheme.applyCorners(
            //                   corners: .all(shapeTheme.cornerFull),
            //                 ),
            //                 child: InkWell(
            //                   overlayColor: WidgetStateLayerColor(
            //                     color: .all(colorTheme.onPrimary),
            //                     opacity: stateTheme.asWidgetStateLayerOpacity,
            //                   ),
            //                   onTap: () {},
            //                   child: Icon(
            //                     Symbols.add_rounded,
            //                     fill: 1.0,
            //                     opticalSize: 24.0,
            //                     size: 24.0,
            //                     color: colorTheme.onPrimary,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedTouchTarget(
            //             fit: .overflow,
            //             minimumSize: const .square(48.0),
            //             child: SizedBox(
            //               width: 32.0,
            //               height: 40.0,
            //               child: Surface(
            //                 clipBehavior: .antiAlias,
            //                 color: colorTheme.secondaryContainer,
            //                 shape: shapeTheme.applyCorners(
            //                   corners: .all(shapeTheme.cornerFull),
            //                 ),
            //                 child: InkWell(
            //                   overlayColor: WidgetStateLayerColor(
            //                     color: .all(colorTheme.onSecondaryContainer),
            //                     opacity: stateTheme.asWidgetStateLayerOpacity,
            //                   ),
            //                   onTap: () {},
            //                   child: Icon(
            //                     Symbols.share_rounded,
            //                     fill: 1.0,
            //                     opticalSize: 24.0,
            //                     size: 24.0,
            //                     color: colorTheme.onSecondaryContainer,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedTouchTarget(
            //             fit: .overflow,
            //             minimumSize: const .square(48.0),
            //             child: SizedBox(
            //               width: 32.0,
            //               height: 40.0,
            //               child: Surface(
            //                 clipBehavior: .antiAlias,
            //                 shape: shapeTheme.applyCorners(
            //                   corners: .all(shapeTheme.cornerFull),
            //                 ),
            //                 child: InkWell(
            //                   overlayColor: WidgetStateLayerColor(
            //                     color: .all(colorTheme.onSurfaceVariant),
            //                     opacity: stateTheme.asWidgetStateLayerOpacity,
            //                   ),
            //                   onTap: () {},
            //                   child: Icon(
            //                     Symbols.more_vert_rounded,
            //                     fill: 1.0,
            //                     opticalSize: 24.0,
            //                     size: 24.0,
            //                     color: colorTheme.onSurfaceVariant,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            ListItemTheme.mergeWithCallback(
              callback: _listItemTheme1,
              // ListItemTheme.mergeWithData(
              // data: .from(
              //   containerColor: .all(
              //     _selected.contains(2)
              //         ? colorTheme.tertiaryContainer
              //         : colorTheme.surface,
              //   ),
              // ),
              child: ListItemTheme.mergeWithCallback(
                callback: _listItemTheme2,
                child: ColorTheme.mergeWithData(
                  data: .from(),
                  // data: .from(surfaceBright: Colors.red),
                  child: SliverToBoxAdapter(
                    child: Padding(
                      padding: const .symmetric(
                        horizontal: 8.0,
                        vertical: 64.0,
                      ),
                      child: Flex.vertical(
                        // itemCount: 100,
                        // separatorBuilder: (context, index) =>
                        //     const SizedBox(height: 2.0),
                        // itemBuilder: (context, index) {
                        spacing: 2.0,
                        children: List.generate(100, (index) {
                          return ListItemContainer(
                            isFirst: index == 0,
                            isLast: index == 100 - 1,
                            child: ListItemInteraction(
                              onTap: () {
                                if (_selected.contains(index)) {
                                  setState(() {
                                    _selected.remove(index);
                                  });
                                } else {
                                  setState(() {
                                    _selected.add(index);
                                  });
                                }
                              },
                              child: ListItemLayout(
                                padding: .fromSTEB(16.0 - 4.0, 0.0, 16.0, 0.0),
                                leadingPadding: const .symmetric(
                                  vertical: 10.0 - (48.0 - 40.0) / 2.0,
                                ),
                                leading: ExcludeFocus(
                                  // child: Checkbox.bistate(
                                  //   onCheckedChanged: (value) {
                                  //     if (value) {
                                  //       setState(() {
                                  //         _selected.add(index);
                                  //       });
                                  //     } else {
                                  //       setState(() {
                                  //         _selected.remove(index);
                                  //       });
                                  //     }
                                  //   },
                                  //   checked: _selected.contains(index),
                                  // ),
                                  child: Switch(
                                    onCheckedChanged: (value) {
                                      if (value) {
                                        setState(() {
                                          _selected.add(index);
                                        });
                                      } else {
                                        setState(() {
                                          _selected.remove(index);
                                        });
                                      }
                                    },
                                    checked: _selected.contains(index),
                                  ),
                                  // child: RadioButton(
                                  //   onTap: () {
                                  //     if (_selected.contains(index)) {
                                  //       setState(() {
                                  //         _selected.remove(index);
                                  //       });
                                  //     } else {
                                  //       setState(() {
                                  //         _selected.add(index);
                                  //       });
                                  //     }
                                  //   },
                                  //   selected: _selected.contains(index),
                                  // ),
                                ),
                                headline: Text("Item ${index + 1}"),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _Layer1 extends StatelessWidget implements ProxyWidget {
//   const _Layer1({super.key, required this.child});

//   @override
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return FocusInsetRingTheme.withCallback(
//       callback: (context) {
//         final colorTheme = ColorTheme.of(context);
//         return .from(
//           outerStrokeInset: 0.0,
//           outerStrokeWidth: 10.0,
//           outerStrokeColor: colorTheme.tertiary,
//           innerStrokeInset: 10.0,
//           innerStrokeWidth: 10.0,
//           innerStrokeColor: colorTheme.onTertiary,
//         );
//       },
//       child: child,
//     );
//   }
// }

// class _Layer2 extends StatefulWidget {
//   const _Layer2({super.key});

//   @override
//   State<_Layer2> createState() => _Layer2State();
// }

// class _Layer2State extends State<_Layer2> {
//   var _showDebugVisuals = false;

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = ColorTheme.of(context);
//     final shapeTheme = ShapeTheme.of(context);
//     final focusInsetRingTheme = FocusInsetRingTheme.of(context);

//     const delegate = CornersBorderDelegate.smooth;
//     final corners = Corners.all(.fractional(0.5));

//     return SizedBox(
//       width: .infinity,
//       height: 136.0,
//       child: Padding(
//         padding: .symmetric(horizontal: 24.0),
//         child: Surface(
//           shape: CornersBorder(delegate: delegate, corners: corners),
//           color: colorTheme.onPrimary,
//           child: Stack(
//             fit: .expand,
//             children: [
//               Positioned(
//                 left: focusInsetRingTheme.outerStrokeInset,
//                 top: focusInsetRingTheme.outerStrokeInset,
//                 right: focusInsetRingTheme.outerStrokeInset,
//                 bottom: focusInsetRingTheme.outerStrokeInset,
//                 child: DecoratedBox(
//                   decoration: ShapeDecoration(
//                     shape: CornersBorder(
//                       delegate: delegate,
//                       corners: delegate.deflateCorners(
//                         corners,
//                         focusInsetRingTheme.outerStrokeInset,
//                       ),
//                       side: BorderSide(
//                         strokeAlign: BorderSide.strokeAlignInside,
//                         width: focusInsetRingTheme.outerStrokeWidth,
//                         color: focusInsetRingTheme.outerStrokeColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: focusInsetRingTheme.innerStrokeInset,
//                 top: focusInsetRingTheme.innerStrokeInset,
//                 right: focusInsetRingTheme.innerStrokeInset,
//                 bottom: focusInsetRingTheme.innerStrokeInset,
//                 child: DecoratedBox(
//                   decoration: ShapeDecoration(
//                     shape: CornersBorder(
//                       delegate: delegate,
//                       // corners: corners,
//                       corners: delegate.deflateCorners(
//                         corners,
//                         focusInsetRingTheme.innerStrokeInset,
//                       ),
//                       side: BorderSide(
//                         strokeAlign: BorderSide.strokeAlignInside,
//                         width: focusInsetRingTheme.innerStrokeWidth,
//                         color: _showDebugVisuals
//                             ? focusInsetRingTheme.innerStrokeColor.withValues(
//                                 alpha: 0.75,
//                               )
//                             : focusInsetRingTheme.innerStrokeColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Visibility(
//                   visible: _showDebugVisuals,
//                   child: Padding(
//                     padding: .all(focusInsetRingTheme.outerStrokeInset),
//                     child: DecoratedBox(
//                       decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: focusInsetRingTheme.outerStrokeWidth,
//                             color: focusInsetRingTheme.innerStrokeColor
//                                 .withValues(alpha: 0.1),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Visibility(
//                   visible: _showDebugVisuals,
//                   child: Padding(
//                     padding: .all(focusInsetRingTheme.innerStrokeInset),
//                     child: DecoratedBox(
//                       decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: focusInsetRingTheme.innerStrokeInset,
//                             color: focusInsetRingTheme.outerStrokeColor
//                                 .withValues(alpha: 0.1),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: Align.center(
//                   child: Switch(
//                     checked: _showDebugVisuals,
//                     onCheckedChanged: (value) =>
//                         setState(() => _showDebugVisuals = value),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
