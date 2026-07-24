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
  late ValueNotifier<Set<int>> _selected;

  void _toggle(int index) {
    final selected = _selected.value;
    if (selected.contains(index)) {
      selected.remove(index);
    } else {
      selected.add(index);
    }
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    _selected.notifyListeners();
  }

  ListItemThemeDataPartial _listItemTheme1(
    BuildContext context,
    Set<int> selected,
  ) {
    final colorTheme = ColorTheme.of(context);
    return .from(
      containerColor: .all(
        selected.contains(1)
            ? colorTheme.secondaryContainer
            : colorTheme.surfaceContainerLow,
      ),
    );
  }

  ListItemThemeDataPartial _listItemTheme2(
    BuildContext context,
    Set<int> selected,
  ) {
    final colorTheme = ColorTheme.of(context);
    return .from(
      containerColor: .all(
        selected.contains(2) ? colorTheme.tertiaryContainer : null,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selected = .new({});
  }

  @override
  void dispose() {
    _selected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        top: false,
        bottom: false,
        child: ValueListenableBuilder<Set<int>>(
          valueListenable: _selected,
          builder: (context, selected, child) =>
              // TODO: replace with tear-offs.
              ListItemTheme.mergeWithCallback(
                callback: (context) => _listItemTheme1(context, selected),
                child: ListItemTheme.mergeWithCallback(
                  callback: (context) => _listItemTheme2(context, selected),
                  child: CustomScrollView(
                    slivers: [
                      ColorTheme.mergeWithData(
                        data: const .from(),
                        child: SliverPadding(
                          padding: const .symmetric(
                            horizontal: 8.0,
                            vertical: 64.0,
                          ),
                          sliver: SliverList.separated(
                            itemCount: 100,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 2.0),
                            itemBuilder: (context, index) =>
                                ValueListenableBuilder<Set<int>>(
                                  valueListenable: _selected,
                                  builder: (context, selected, child) {
                                    final isSelected = selected.contains(index);
                                    return ListItemContainer(
                                      isFirst: index == 0,
                                      isLast: index == 100 - 1,
                                      child: ListItemInteraction(
                                        onTap: () => _toggle(index),
                                        child: ListItemLayout(
                                          padding: const .fromSTEB(
                                            16.0 - 4.0,
                                            0.0,
                                            16.0,
                                            0.0,
                                          ),
                                          leadingPadding: const .symmetric(
                                            vertical:
                                                10.0 - (48.0 - 40.0) / 2.0,
                                          ),
                                          leading: ExcludeFocus(
                                            child: Switch(
                                              onCheckedChanged: (_) =>
                                                  _toggle(index),
                                              checked: isSelected,
                                            ),
                                          ),
                                          headline: Text("Item ${index + 1}"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
