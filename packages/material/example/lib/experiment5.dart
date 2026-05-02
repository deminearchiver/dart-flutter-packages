import 'package:material_example/flutter.dart';

import 'magnetic_swipe.dart';

class Experiment5View extends StatefulWidget {
  const Experiment5View({super.key});

  @override
  State<Experiment5View> createState() => _Experiment5ViewState();
}

class _Experiment5ViewState extends State<Experiment5View> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: Stack(
        fit: .expand,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: colorTheme.surfaceContainer,
                title: Text(
                  "Mini music player demo",
                  style: typescaleTheme.titleLargeEmphasized.toTextStyle(
                    color: colorTheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          Flex.vertical(
            mainAxisAlignment: .end,
            children: [
              MagneticSwipe(
                builder: (context) => ListItemContainer(
                  isFirst: true,
                  isLast: true,
                  containerColor: .all(colorTheme.surfaceContainerHighest),
                  child: ListItemInteraction(
                    onTap: () {},
                    child: ListItemLayout(
                      minHeight: 64.0,
                      maxHeight: 64.0,
                      leading: const Icon(Symbols.frame_exclamation_rounded),
                      headline: Text("Swipe me!"),
                      supportingText: Text("Let's see what you're capable of!"),
                      trailing: const Icon(Symbols.swipe_right_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              SizedBox(
                height: 64.0,
                child: ListItemContainer(
                  isFirst: true,
                  containerColor: .all(colorTheme.surfaceContainerHighest),
                  child: const Flex.horizontal(
                    children: [
                      Flexible.tight(
                        child: _VerticalNavigationItem(
                          isSelected: true,
                          icon: Icon(Symbols.home),
                          label: Text("Home"),
                        ),
                      ),
                      Flexible.tight(
                        child: _VerticalNavigationItem(
                          isSelected: false,
                          icon: Icon(Symbols.library_music_rounded),
                          label: Text("Library"),
                        ),
                      ),
                      Flexible.tight(
                        child: _VerticalNavigationItem(
                          isSelected: false,
                          icon: Icon(Symbols.settings_rounded),
                          label: Text("Settings"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VerticalNavigationItem extends StatefulWidget {
  const _VerticalNavigationItem({
    super.key,
    required this.isSelected,
    required this.icon,
    this.label,
  });

  final bool isSelected;
  final Widget icon;
  final Text? label;

  @override
  State<_VerticalNavigationItem> createState() =>
      _VerticalNavigationItemState();
}

class _VerticalNavigationItemState extends State<_VerticalNavigationItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;
    final icon = widget.icon;
    final label = widget.label;

    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    return SizedBox(
      width: .infinity,
      child: Padding(
        padding: .symmetric(vertical: label != null ? 6.0 : 4.0),
        child: Flex.vertical(
          mainAxisSize: .max,
          mainAxisAlignment: .center,
          spacing: 4.0,
          children: [
            SizedBox(
              width: 56.0,
              height: label != null ? 32.0 : 56.0,
              child: Material(
                clipBehavior: .antiAlias,
                shape: CornersBorder.rounded(
                  corners: .all(shapeTheme.corner.full),
                ),
                color: isSelected
                    ? colorTheme.secondaryContainer
                    : colorTheme.secondaryContainer.withValues(alpha: 0.0),
                child: InkWell(
                  overlayColor: WidgetStateLayerColor(
                    color: .all(
                      isSelected
                          ? colorTheme.onSecondaryContainer
                          : colorTheme.onSurface,
                    ),
                    opacity: stateTheme.asWidgetStateLayerOpacity,
                  ),
                  onTap: () {},
                  child: IconTheme.merge(
                    data: .from(
                      fill: isSelected ? 1.0 : 0.0,
                      opticalSize: 24.0,
                      size: 24.0,
                      color: isSelected
                          ? colorTheme.onSecondaryContainer
                          : colorTheme.onSurfaceVariant,
                    ),
                    child: icon,
                  ),
                ),
              ),
            ),
            if (label != null)
              DefaultTextStyle(
                maxLines: 1,
                softWrap: false,
                overflow: .ellipsis,
                style:
                    (widget.isSelected
                            ? typescaleTheme.labelMediumEmphasized
                            : typescaleTheme.labelMedium)
                        .toTextStyle(
                          color: isSelected
                              ? colorTheme.secondary
                              : colorTheme.onSurfaceVariant,
                        ),
                child: label,
              ),
          ],
        ),
      ),
    );
  }
}
