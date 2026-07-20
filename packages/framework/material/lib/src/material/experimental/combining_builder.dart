import 'package:material/src/material/flutter.dart';

@Deprecated("Use Nested instead.")
class CombiningBuilder extends SingleChildStatelessWidget {
  @Deprecated("Use Nested instead.")
  const CombiningBuilder({
    super.key,
    this.useOuterContext = false,
    required this.builders,
    super.child,
  });

  final bool useOuterContext;

  final List<Widget Function(BuildContext context, Widget child)> builders;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      CombiningBuilder(
        key: key,
        useOuterContext: useOuterContext,
        builders: builders,
        child: child,
      );

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => Nested(
    children: [
      for (final builder in builders)
        SingleChildBuilder(
          builder: (innerContext, child) => builder(
            useOuterContext ? context : innerContext,
            child ?? const SizedBox.shrink(),
          ),
        ),
    ],
    child: child,
  );
}
