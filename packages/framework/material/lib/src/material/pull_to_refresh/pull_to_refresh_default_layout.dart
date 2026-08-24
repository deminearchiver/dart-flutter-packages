import 'package:material/src/material/flutter.dart';

class const PullToRefreshDefaultLayout({
  super.key,
  required final ValueListenable<PullToRefreshStates> states,
  final Clip clipBehavior = .hardEdge,
  final Widget? child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: states,
    builder: (context, states, child) {
      final height = states.verticalOffset;
      return SizedBox(
        height: height,
        child: ClipRect(
          clipBehavior: clipBehavior,
          child: OverflowBox(
            alignment: .center,
            minHeight: 0.0,
            maxHeight: PullToRefreshController.defaultThreshold,
            child: Visibility(visible: height > 0.0, child: child!),
          ),
        ),
      );
    },
    child: child,
  );
}

// class PullToRefreshBuilder extends StatefulWidget {
//   const PullToRefreshBuilder({
//     super.key,
//     this.controller,
//     this.onRefresh,
//     this.enabled,
//     this.delegate,
//     this.threshold,
//     this.isRefreshing,
//     required this.viewportBuilder,
//     required this.indicatorBuilder,
//   });

//   final PullToRefreshController? controller;

//   final VoidCallback? onRefresh;

//   final bool? enabled;

//   final PullToRefreshDelegate? delegate;

//   final double? threshold;

//   final bool? isRefreshing;

//   final Widget Function(BuildContext context, Widget child) viewportBuilder;

//   final Widget Function(
//     BuildContext context,
//     PullToRefreshController controller,
//   )
//   indicatorBuilder;

//   @override
//   State<PullToRefreshBuilder> createState() => _PullToRefreshBuilderState();
// }

// class _PullToRefreshBuilderState extends State<PullToRefreshBuilder>
//     with SingleTickerProviderStateMixin {
//   PullToRefreshDefaultDelegate? _internalDelegate;

//   PullToRefreshDelegate get _delegate => widget.delegate ?? _internalDelegate!;

//   PullToRefreshController? _internalController;

//   PullToRefreshController get _controller =>
//       widget.controller ?? _internalController!;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.delegate == null) {
//       _internalDelegate = .new(vsync: this);
//     }
//     if (widget.controller == null) {
//       _internalController = .new(
//         onRefresh:
//             widget.onRefresh ?? PullToRefreshController._defaultOnRefresh,
//         enabled: widget.enabled ?? true,
//         delegate: _delegate,
//         threshold: widget.threshold ?? _kPositionalThreshold,
//         isRefreshing: widget.isRefreshing ?? false,
//       );
//     } else {
//       if (widget.onRefresh case final onRefresh?) {
//         _controller.onRefresh = onRefresh;
//       }
//       if (widget.enabled case final enabled?) {
//         _controller.enabled = enabled;
//       }
//       _controller.delegate = _delegate;
//       if (widget.threshold case final threshold?) {
//         _controller.threshold = threshold;
//       }
//       if (widget.isRefreshing case final isRefreshing?) {
//         _controller.isRefreshing = isRefreshing;
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(covariant PullToRefreshBuilder oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller != oldWidget.controller) {}

//     if (widget.onRefresh != oldWidget.onRefresh) {
//       if (widget.controller == null) {
//         _controller.onRefresh =
//             widget.onRefresh ?? PullToRefreshController._defaultOnRefresh;
//       } else if (widget.onRefresh case final onRefresh?) {
//         _controller.onRefresh = onRefresh;
//       }
//     }

//     if (widget.enabled != oldWidget.enabled) {
//       if (widget.controller == null) {
//         _controller.enabled = widget.enabled ?? true;
//       } else if (widget.enabled case final enabled?) {
//         _controller.enabled = enabled;
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _internalController?.dispose();
//     _internalController = null;

//     _internalDelegate?.dispose();
//     _internalDelegate = null;

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final child = PullToRefresh(controller: _controller);
//     return widget.viewportBuilder(context, child);
//   }
// }
