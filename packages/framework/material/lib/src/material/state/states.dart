abstract interface class SelectableStates {
  bool get isSelected;
}

abstract interface class HoverableStates {
  bool get isHovered;
}

abstract interface class FocusableStates {
  bool get isFocused;
}

abstract interface class PressableStates {
  bool get isPressed;
}

abstract interface class DraggableStates {
  bool get isDragged;
}

abstract interface class InteractiveStates {}

abstract interface class InteractiveDisabledStates
    implements InteractiveStates {}

abstract interface class InteractiveEnabledStates
    implements
        InteractiveStates,
        HoverableStates,
        FocusableStates,
        PressableStates {}
