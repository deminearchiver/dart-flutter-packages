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
      body: Flex.vertical(
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
              child: Flex.horizontal(),
            ),
          ),
        ],
      ),
    );
  }
}
