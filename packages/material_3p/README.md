# Material 3P

3P (third-party) version of the [Material 3 Expressive](https://github.com/deminearchiver/dart-flutter-packages/tree/main/packages/material) package.

The main Material 3 Expressive package is hosted on GitHub to avoid name collisions here, on Pub. To make it easier for people to discover component implementation from that package, a 3P package has been made.

This package contains only the bare minimum from the original package, stripping away: custom Flutter overrides, inherited theme resolver system, nested widgets system, styling system, state properties system, etc.

## Getting started

### Install the package

```console
flutter pub add material_3p
```

## Usage

### Loading indicators

[Overview](https://m3.material.io/components/loading-indicator/overview) · [Specs](https://m3.material.io/components/loading-indicator/specs) · [Guidelines](https://m3.material.io/components/loading-indicator/guidelines) · [Accessibility](https://m3.material.io/components/loading-indicator/accessibility)

Loading indicators show the progress of a process for a short wait time.

They use animation to grab attention, mitigate perceived latency, and indicate that an activity is in progress. They should be used when progress isn’t detectable, or when it’s not necessary to indicate how long an activity will take.

#### Example

```dart
// Indeterminate loading indicator
IndeterminateLoadingIndicator(
  // Whether to surround the indicator with a container.
  contained: false
);

// Determinate loading indicator
DeterminateLoadingIndicator(
  // Whether to surround the indicator with a container.
  contained: false,
  // Progress fraction, ranging from 0% to 100%.
  progress: 0.5
);
```

### Pull-to-refresh

<!-- [Guidelines](https://developer.android.com/develop/ui/compose/components/pull-to-refresh) -->

The pull to refresh component allows users to drag downwards at the beginning of an app's content to refresh the data.

#### Expressive indicator example

This example shows how to create a pull-to-refresh which will affect the layout during the pull gesture, but snap back to zero height once the user releases the gesture. The indicator widget is simulated to be positioned on top of scrolling content, not affecting layout.

```dart
PullToRefresh(
  onRefresh: () => Future.delayed(const Duration(seconds: 3)),
  builder: (context, controller) => CustomScrollView(
    physics: AlwaysScrollableScrollPhysics(
      // Using PullToRefreshScrollPhysics is mandatory.
      parent: PullToRefreshScrollPhysics(controller: controller),
    ),
    slivers: [
      ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, states, child) {
          // Whether the component is currently refreshing.
          final isRefreshing = states.isRefreshing;

          // Goes to threshold when the user stops holding.
          final verticalOffset = states.verticalOffset;

          // Same as verticalOffset, but animates to zero once the user stops holding.
          // Useful for when you want the indicator to stop affecting layout.
          final layoutHeight = states.layoutHeight;

          // SliverAppBar.bottom must be a PreferredSizeWidget.
          final PreferredSizeWidget bottom = PreferredSize(
            preferredSize: Size(.infinity, layoutHeight),
            child: SizedBox(
              height: layoutHeight,
              child: OverflowBox(
                alignment: .topCenter,
                minHeight: verticalOffset,
                maxHeight: verticalOffset,
                child: OverflowBox(
                  alignment: .center,
                  minHeight: 0.0,
                  maxHeight: PullToRefresh.defaultThreshold,
                  child: Visibility(
                    visible: isRefreshing || verticalOffset > 0.0,
                    child: child!,
                  ),
                ),
              ),
            ),
          );

          // Important: clipBehavior must be set to Clip.none (default).
          return SliverAppBar(
            pinned: true,
            title: const Text("Pull to refresh!"),
            bottom: bottom,
          );
        },
        // Center the loading indicator in the pull-to-refresh area.
        child: Center(
          // Apply a scale & fade transition.
          child: PullToRefreshFadeTransition(
            states: controller,
            // This value makes the fade-in finish faster.
            endFraction: 0.4,
            // Starting with a large scale makes the animation less abrupt.
            dismissedScale: 0.4,
            // The loading indicator, provided by the library.
            child: PullToRefreshLoadingIndicator(states: controller),
          ),
        ),
      ),
    ],
  ),
);
```
