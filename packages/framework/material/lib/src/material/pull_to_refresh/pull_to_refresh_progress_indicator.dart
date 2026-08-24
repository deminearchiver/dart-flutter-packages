// TODO: do this after implementing progress indicators
// class PullToRefreshProgressIndicator extends StatefulWidget {
//   const PullToRefreshProgressIndicator({super.key, required this.controller});

//   final PullToRefreshController controller;

//   @override
//   State<PullToRefreshProgressIndicator> createState() =>
//       _PullToRefreshProgressIndicatorState();
// }

// class _PullToRefreshProgressIndicatorState
//     extends State<PullToRefreshProgressIndicator> {
//   late _PullToRefreshArrowIndicatorPainter _painter;

//   @override
//   void initState() {
//     super.initState();
//     _painter = .new(controller: widget.controller);
//   }

//   @override
//   void didUpdateWidget(covariant PullToRefreshProgressIndicator oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _painter.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class _PullToRefreshArrowIndicatorPainter
//     extends StatefulCustomPainter<_PullToRefreshArrowIndicatorPainter> {
//   _PullToRefreshArrowIndicatorPainter({required this._controller}) {
//     controller.addListener(notifyListeners);
//   }

//   PullToRefreshController _controller;

//   PullToRefreshController get controller => _controller;

//   set controller(PullToRefreshController value) {
//     if (_controller == value) return;
//     _controller.removeListener(notifyListeners);
//     _controller = value;
//     _controller.addListener(notifyListeners);
//     notifyListeners();
//   }

//   @override
//   void paint(Canvas canvas, Size size) {}
// }

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
