import 'package:material_example/flutter.dart';

class Experiment6View extends StatefulWidget {
  const Experiment6View({super.key});

  @override
  State<Experiment6View> createState() => _Experiment6ViewState();
}

class _Experiment6ViewState extends State<Experiment6View> {
  final _selected = <int>{};

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    final focusInsetRingTheme = FocusInsetRingTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      // body: Align.center(child: _Layer1(child: _Layer2())),
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const .symmetric(horizontal: 8.0, vertical: 64.0),
                child: Flex.vertical(
                  spacing: 2.0,
                  children: List.generate(
                    100,
                    (index) => ListItemContainer(
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

class _Layer1 extends StatelessWidget implements ProxyWidget {
  const _Layer1({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusInsetRingTheme.withCallback(
      callback: (context) {
        final colorTheme = ColorTheme.of(context);
        return .from(
          outerStrokeInset: 0.0,
          outerStrokeWidth: 10.0,
          outerStrokeColor: colorTheme.tertiary,
          innerStrokeInset: 10.0,
          innerStrokeWidth: 10.0,
          innerStrokeColor: colorTheme.onTertiary,
        );
      },
      child: child,
    );
  }
}

class _Layer2 extends StatefulWidget {
  const _Layer2({super.key});

  @override
  State<_Layer2> createState() => _Layer2State();
}

class _Layer2State extends State<_Layer2> {
  var _showDebugVisuals = false;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final focusInsetRingTheme = FocusInsetRingTheme.of(context);

    const delegate = CornersBorderDelegate.superellipse;
    final corners = Corners.all(.fractional(0.5));

    return SizedBox(
      width: .infinity,
      height: 136.0,
      child: Padding(
        padding: .symmetric(horizontal: 24.0),
        child: Surface(
          shape: CornersBorder(delegate: delegate, corners: corners),
          color: colorTheme.onPrimary,
          child: Stack(
            fit: .expand,
            children: [
              Positioned(
                left: focusInsetRingTheme.outerStrokeInset,
                top: focusInsetRingTheme.outerStrokeInset,
                right: focusInsetRingTheme.outerStrokeInset,
                bottom: focusInsetRingTheme.outerStrokeInset,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: CornersBorder(
                      delegate: delegate,
                      corners: delegate.deflateCorners(
                        corners,
                        focusInsetRingTheme.outerStrokeInset,
                      ),
                      side: BorderSide(
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: focusInsetRingTheme.outerStrokeWidth,
                        color: focusInsetRingTheme.outerStrokeColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: focusInsetRingTheme.innerStrokeInset,
                top: focusInsetRingTheme.innerStrokeInset,
                right: focusInsetRingTheme.innerStrokeInset,
                bottom: focusInsetRingTheme.innerStrokeInset,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: CornersBorder(
                      delegate: delegate,
                      // corners: corners,
                      corners: delegate.deflateCorners(
                        corners,
                        focusInsetRingTheme.innerStrokeInset,
                      ),
                      side: BorderSide(
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: focusInsetRingTheme.innerStrokeWidth,
                        color: _showDebugVisuals
                            ? focusInsetRingTheme.innerStrokeColor.withValues(
                                alpha: 0.75,
                              )
                            : focusInsetRingTheme.innerStrokeColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Visibility(
                  visible: _showDebugVisuals,
                  child: Padding(
                    padding: .all(focusInsetRingTheme.outerStrokeInset),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: focusInsetRingTheme.outerStrokeWidth,
                            color: focusInsetRingTheme.innerStrokeColor
                                .withValues(alpha: 0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Visibility(
                  visible: _showDebugVisuals,
                  child: Padding(
                    padding: .all(focusInsetRingTheme.innerStrokeInset),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: focusInsetRingTheme.innerStrokeInset,
                            color: focusInsetRingTheme.outerStrokeColor
                                .withValues(alpha: 0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align.center(
                  child: Switch(
                    checked: _showDebugVisuals,
                    onCheckedChanged: (value) =>
                        setState(() => _showDebugVisuals = value),
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
