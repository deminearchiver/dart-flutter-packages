library;

// SDK packages

export 'package:flutter/foundation.dart' hide clampDouble;

export 'package:flutter/services.dart';

export 'package:flutter/physics.dart';

export 'package:flutter/rendering.dart'
    hide
        ChildLayoutHelper,
        FlexParentData,
        FloatingHeaderSnapConfiguration,
        OverScrollHeaderStretchConfiguration,
        PersistentHeaderShowOnScreenConfiguration,
        RenderFlex,
        RenderPadding;

export 'package:flutter/material.dart'
    hide
        // package:layout
        // ---
        Padding,
        Align,
        Center,
        Flex,
        Row,
        Column,
        Flexible,
        Expanded,
        Spacer,
        // ---
        // package:material
        // ---
        DynamicSchemeVariant,
        // ---
        WidgetStateProperty,
        WidgetStatesConstraint,
        WidgetStateMap,
        WidgetStateMapper,
        WidgetStatePropertyAll,
        WidgetStatesController,
        // ---
        Material,
        MaterialType,
        // ---
        Icon,
        IconTheme,
        IconThemeData,
        // ---
        // Force migration to Material Symbols
        Icons,
        AnimatedIcons,
        // ---
        CircularProgressIndicator,
        LinearProgressIndicator,
        ProgressIndicator,
        // ---
        Checkbox,
        CheckboxTheme,
        CheckboxThemeData,
        // ---
        Switch,
        SwitchTheme,
        SwitchThemeData;

// Synchronized packages
export 'package:animation/animation.dart';
export 'package:layout/layout.dart';

// Third-party packages
export 'package:meta/meta.dart';
export 'package:motor/motor.dart';
export 'package:touch_targets/touch_targets.dart';

// Own exports
export 'package:material/material.dart';
export 'package:material/material_symbols.dart';
