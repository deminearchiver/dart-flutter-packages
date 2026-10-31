import 'package:material_example/flutter.dart';

class const Experiment3View({super.key}) extends StatefulWidget {
  @override
  State<Experiment3View> createState() => _Experiment3ViewState();
}

class _Experiment3ViewState extends State<Experiment3View>
    with SingleTickerProviderStateMixin {
  var _heightSlider = 64.0;
  var _height = 64.0;

  var _showNavigationIcon = true;
  var _showActionIcon1 = true;
  var _showActionIcon2 = false;

  final _centerAlignmentFraction = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    final extent = padding.top + _height;
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: CustomScrollView(
          slivers: [
            SliverHeader(
              minExtent: extent,
              maxExtent: extent,
              builder: (context, shrinkOffset, overlapsContent) => AppBarWithSearch(
                height: _height,
                leading: _showNavigationIcon
                    ? Padding(
                        padding: const .fromSTEB(8.0, 0.0, 12.0, 0.0),
                        child: Align.center(
                          widthFactor: 1.0,
                          child: SizedTouchTarget(
                            minimumSize: const .square(48.0),
                            child: IconButton(
                              style: LegacyThemeFactory.createIconButtonStyle(
                                colorTheme: colorTheme,
                                elevationTheme: elevationTheme,
                                shapeTheme: shapeTheme,
                                stateTheme: stateTheme,
                                color: .standard,
                                tapTargetSize: .shrinkWrap,
                              ),
                              onPressed: () {},
                              icon: const Icon(MaterialSymbols.menu_rounded),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(width: 24.0),
                searchBarSupporting: const Text("Search"),
                trailing: _showActionIcon1 || _showActionIcon2
                    ? Padding(
                        padding: const .fromSTEB(12.0, 0.0, 8.0, 0.0),
                        child: Align.center(
                          widthFactor: 1.0,
                          child: Flex.horizontal(
                            mainAxisSize: .min,
                            spacing: 8.0,
                            children: [
                              if (_showActionIcon1)
                                SizedTouchTarget(
                                  minimumSize: const .square(48.0),
                                  child: IconButton(
                                    style:
                                        LegacyThemeFactory.createIconButtonStyle(
                                          colorTheme: colorTheme,
                                          elevationTheme: elevationTheme,
                                          shapeTheme: shapeTheme,
                                          stateTheme: stateTheme,
                                          color: .standard,
                                          tapTargetSize: .shrinkWrap,
                                        ),
                                    onPressed: () {},
                                    icon: const Icon(
                                      MaterialSymbols.cast_rounded,
                                    ),
                                  ),
                                ),
                              if (_showActionIcon2)
                                SizedTouchTarget(
                                  minimumSize: const .square(48.0),
                                  child: IconButton(
                                    style:
                                        LegacyThemeFactory.createIconButtonStyle(
                                          colorTheme: colorTheme,
                                          elevationTheme: elevationTheme,
                                          shapeTheme: shapeTheme,
                                          stateTheme: stateTheme,
                                          color: .standard,
                                          tapTargetSize: .shrinkWrap,
                                        ),
                                    onPressed: () {},
                                    icon: const Icon(
                                      MaterialSymbols.more_vert_rounded,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(width: 24.0),
              ),
            ),
            SliverPadding(
              padding: .fromLTRB(
                padding.left + 8.0,
                // math.max(16.0 - (_height - 56.0) / 2.0, 0.0),
                0.0,
                padding.right + 8.0,
                0.0,
              ),
              sliver: SliverList.list(
                children: [
                  ListItemContainer(
                    isFirst: true,
                    child: Flex.vertical(
                      children: [
                        ListItemLayout(
                          leading: const Icon(MaterialSymbols.height_rounded),
                          headline: const Text("App bar height"),
                          supportingText: const Text(
                            "Height will change after dragging is stopped.",
                          ),
                          trailing: Text(
                            "${_heightSlider.round()}dp",
                            textAlign: .end,
                            style: const TextStyle(
                              fontFamily: "Monaspace Argon",
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Slider(
                          padding: const .symmetric(horizontal: 16.0),
                          divisions: ((136 - 64) / 8.0).toInt(),
                          min: 64.0,
                          max: 136.0,
                          value: _heightSlider,
                          onChanged: (value) =>
                              setState(() => _heightSlider = value),
                          onChangeEnd: (value) =>
                              setState(() => _height = _heightSlider = value),
                        ),
                        const SizedBox(height: 14.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () => setState(
                        () => _showNavigationIcon = !_showNavigationIcon,
                      ),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(MaterialSymbols.menu_rounded),
                        headline: const Text("Show navigation icon"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showNavigationIcon,
                            onCheckedChanged: (value) =>
                                setState(() => _showNavigationIcon = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () =>
                          setState(() => _showActionIcon1 = !_showActionIcon1),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(MaterialSymbols.star_rounded),
                        headline: const Text("Show action icon 1"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showActionIcon1,
                            onCheckedChanged: (value) =>
                                setState(() => _showActionIcon1 = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    child: ListItemInteraction(
                      onTap: () =>
                          setState(() => _showActionIcon2 = !_showActionIcon2),
                      child: ListItemLayout(
                        padding: const .fromSTEB(16.0, 0.0, 16.0 - 8.0, 0.0),
                        trailingPadding: const .symmetric(
                          vertical: 10.0 - (48.0 - 40.0) / 2.0,
                        ),
                        leading: const Icon(MaterialSymbols.more_horiz_rounded),
                        headline: const Text("Show action icon 2"),
                        trailing: ExcludeFocus(
                          child: Switch(
                            checked: _showActionIcon2,
                            onCheckedChanged: (value) =>
                                setState(() => _showActionIcon2 = value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  ListItemContainer(
                    isLast: true,
                    child: ListItemLayout(
                      trailingPadding: const .symmetric(
                        vertical: 10.0 - (48.0 - 40.0) / 2.0,
                      ),
                      leading: const Icon(MaterialSymbols.restart_alt_rounded),
                      headline: const Text("Reset all properties"),
                      supportingText: const Text(
                        "Set all values to their respective defaults.",
                      ),
                      trailing: FilledButton(
                        style: LegacyThemeFactory.createButtonStyle(
                          colorTheme: colorTheme,
                          elevationTheme: elevationTheme,
                          shapeTheme: shapeTheme,
                          stateTheme: stateTheme,
                          typescaleTheme: typescaleTheme,
                          color: .tonal,
                        ),
                        onPressed: () {
                          setState(() {
                            _heightSlider = _height = 64.0;
                            _showNavigationIcon = true;
                            _showActionIcon1 = true;
                            _showActionIcon2 = false;
                          });
                        },
                        child: const Text("Reset"),
                      ),
                    ),
                  ),
                  SearchBarPaint(
                    centerAlignmentFraction: _centerAlignmentFraction,
                    containerColor: colorTheme.surfaceContainerHighest,
                    supportingText: const Text("Search"),
                    leading: Padding(
                      padding: const .fromSTEB(16.0, 0.0, 12.0, 0.0),
                      child: Icon(
                        MaterialSymbols.search_rounded,
                        color: colorTheme.onSurface,
                      ),
                    ),
                    trailing: Padding(
                      padding: const .symmetric(horizontal: 4.0),
                      child: Flex.horizontal(
                        mainAxisSize: .min,
                        children: [
                          IconButton(
                            style: LegacyThemeFactory.createIconButtonStyle(
                              colorTheme: colorTheme,
                              elevationTheme: elevationTheme,
                              shapeTheme: shapeTheme,
                              stateTheme: stateTheme,
                              color: .standard,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              MaterialSymbols.cast_rounded,
                              fill: 0.0,
                            ),
                          ),
                          IconButton(
                            style: LegacyThemeFactory.createIconButtonStyle(
                              colorTheme: colorTheme,
                              elevationTheme: elevationTheme,
                              shapeTheme: shapeTheme,
                              stateTheme: stateTheme,
                              color: .standard,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              MaterialSymbols.more_vert_rounded,
                              fill: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _centerAlignmentFraction,
                    builder: (context, value, child) => Slider(
                      value: value,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (value) =>
                          _centerAlignmentFraction.value = value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
