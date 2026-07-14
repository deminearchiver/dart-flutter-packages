extension type const VariableAxisTag._(String _) implements String {
  /// Variable font axis tagged "ARRR" - AR Retinal Resolution.
  ///
  ///  Resolution-specific enhancements in AR/VR typefaces to optimize rendering across the different resolutions of the headsets making designs accessible and easy to read.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 10.0     | 10.0 | 60.0 | 1.0   |
  static const arrr = "ARRR" as VariableAxisTag;

  /// Variable font axis tagged "BLED" - Bleed.
  ///
  /// Bleed adjusts the overall darkness in the typographic color of strokes or other forms, without any changes in overall width, line breaks, or page layout. Negative values make the font appearance lighter, while positive values make it darker, similarly to ink bleed or dot gain on paper.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const bled = "BLED" as VariableAxisTag;

  /// Variable font axis tagged "BNCE" - Bounce.
  ///
  /// Shift glyphs up and down in the Y dimension, resulting in an uneven, bouncy baseline.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const bnce = "BNCE" as VariableAxisTag;

  /// Variable font axis tagged "CASL" - Casual.
  ///
  /// Adjust stroke curvature, contrast, and terminals from a sturdy, rational Linear style to a friendly, energetic Casual style.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 1.0  | 0.01  |
  static const casl = "CASL" as VariableAxisTag;

  /// Variable font axis tagged "CTRS" - Contrast.
  ///
  /// Contrast describes the stroke width difference between the thick and thin parts of the font glyphs. A value of zero indicates no visible/apparent contrast. A positive number indicates an increase in contrast relative to the zero-contrast thickness, achieved by making the thin stroke thinner. A value of 100 indicates that the thin stroke has disappeared completely. A negative value indicates “reverse contrast”: the strokes which would conventionally be thick in the writing system are instead made thinner. In western-language fonts this might be perceived as a 19th-century, “circus” or “old West” effect. A value of -100 indicates that the strokes which would normally be thick have disappeared completely.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 10.0  |
  static const ctrs = "CTRS" as VariableAxisTag;

  /// Variable font axis tagged "CRSV" - Cursive.
  ///
  /// Control the substitution of cursive forms along the Slant axis. 'Off' (0) maintains Roman letterforms such as a double-storey a and g, 'Auto' (0.5) allows for Cursive substitution, and 'On' (1) asserts cursive forms even in upright text with a Slant of 0.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.5      | 0.0  | 1.0  | 0.1   |
  static const crsv = "CRSV" as VariableAxisTag;

  /// Variable font axis tagged "EHLT" - Edge Highlight.
  ///
  /// Controls thickness of edge highlight details.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 12.0     | 0.0  | 1000.0 | 1.0   |
  static const ehlt = "EHLT" as VariableAxisTag;

  /// Variable font axis tagged "ELXP" - Element Expansion.
  ///
  /// As the Element Expansion axis progresses, the elements move apart.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const elxp = "ELXP" as VariableAxisTag;

  /// Variable font axis tagged "ELGR" - Element Grid.
  ///
  /// In modular fonts, where glyphs are composed using multiple copies of the same element, this axis controls how many elements are used per one grid unit.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 1.0      | 1.0  | 2.0  | 0.1   |
  static const elgr = "ELGR" as VariableAxisTag;

  /// Variable font axis tagged "ELSH" - Element Shape.
  ///
  /// In modular fonts, where glyphs are composed using multiple copies of the same element, this axis controls the shape of the element
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 0.1   |
  static const elsh = "ELSH" as VariableAxisTag;

  /// Variable font axis tagged "ENLA" - Enlarge.
  ///
  /// Scales lowercase letters to an intermediate size between minuscule and majuscule, as used in medieval manuscripts for enlarged minuscules at sentence openings.Adjusts x-height and character width continuously from 0 (default lowercase) to 100 (fully enlarged).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 0.01  |
  static const enla = "ENLA" as VariableAxisTag;

  /// Variable font axis tagged "EDPT" - Extrusion Depth.
  ///
  /// Controls the 3D depth on contours.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 100.0    | 0.0  | 1000.0 | 1.0   |
  static const edpt = "EDPT" as VariableAxisTag;

  /// Variable font axis tagged "FILL" - Fill.
  ///
  /// Fill in transparent forms with opaque ones. Sometimes interior opaque forms become transparent, to maintain contrasting shapes. This can be useful in animationor interaction to convey a state transition. Ranges from 0 (no treatment) to 1 (completely filled).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 1.0  | 0.01  |
  static const fill = "FILL" as VariableAxisTag;

  /// Variable font axis tagged "FLAR" - Flare.
  ///
  /// As the flare axis grows, the stem terminals go from straight (0%) to develop a swelling (100%).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const flar = "FLAR" as VariableAxisTag;

  /// Variable font axis tagged "GEOM" - Geometric Form.
  ///
  /// It transforms complex letterforms into simplified geometric shapes like circles, triangles, and squares. This transition can occurs through gradual structural shifting and/or character swaps at specific intervals.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 10.0  |
  static const geom = "GEOM" as VariableAxisTag;

  /// Variable font axis tagged "GRAD" - Grade.
  ///
  /// Finesse the style from lighter to bolder in typographic color, without any changes overall width, line breaks or page layout. Negative grade makes the style lighter, while positive grade makes it bolder. The units are the same as in the Weight axis.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 0.0      | -1000.0 | 1000.0 | 1.0   |
  static const grad = "GRAD" as VariableAxisTag;

  /// Variable font axis tagged "GDOP" - Guides Opacity.
  ///
  /// Adjust opacity of guides from 100 (fully visible) down to 0 (fully invisible).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 100.0    | 0.0  | 100.0 | 1.0   |
  static const gdop = "GDOP" as VariableAxisTag;

  /// Variable font axis tagged "HEXP" - Hyper Expansion.
  ///
  /// Expansion of inner and outer space of glyphs.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 0.1   |
  static const hexp = "HEXP" as VariableAxisTag;

  /// Variable font axis tagged "INFM" - Informality.
  ///
  /// Adjusts overall design from formal and traditional (0%) to informal and unconventional (up to 100%).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const infm = "INFM" as VariableAxisTag;

  /// Variable font axis tagged "ital" - Italic.
  ///
  /// Adjust the style from roman to italic. This can be provided as a continuous range within a single font file, like most axes, or as a toggle between two roman and italic files that form a family as a pair.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 1.0  | 1.0   |
  static const ital = "ital" as VariableAxisTag;

  /// Variable font axis tagged "MONO" - Monospace.
  ///
  /// Adjust the style from Proportional (natural widths, default) to Monospace (fixed width). With proportional spacing, each glyph takes up a unique amount of space on a line, while monospace is when all glyphs have the same total character width.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 1.0  | 0.01  |
  static const mono = "MONO" as VariableAxisTag;

  /// Variable font axis tagged "MORF" - Morph.
  ///
  /// Letterforms morph: Changing in unconventional ways, that don't alter other attributes, like width or weight. The range from 0 to 60 can be understood as seconds.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 60.0 | 1.0   |
  static const morf = "MORF" as VariableAxisTag;

  /// Variable font axis tagged "opsz" - Optical Size.
  ///
  /// Adapt the style to specific text sizes. At smaller sizes, letters typically become optimized for more legibility. At larger sizes, optimized for headlines, with more extreme weights and widths. In CSS this axis is activated automatically when it is available.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 14.0     | 5.0  | 1200.0 | 0.1   |
  static const opsz = "opsz" as VariableAxisTag;

  /// Variable font axis tagged "ROND" - Roundness.
  ///
  /// Adjust shapes from angular defaults (0%) to become increasingly rounded (up to 100%).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const rond = "ROND" as VariableAxisTag;

  /// Variable font axis tagged "SCAN" - Scanlines.
  ///
  /// Break up shapes into horizontal segments without any changes in overall width, letter spacing, or kerning, so there are no line breaks or page layout changes. Negative values make the scanlines thinner, and positive values make them thicker.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const scan = "SCAN" as VariableAxisTag;

  /// Variable font axis tagged "SHLN" - Shadow Length.
  ///
  /// Adjusts the font's shadow length from no shadow visible (0 %) to a maximum shadow applied (100%) relative to each family design.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 50.0     | 0.0  | 100.0 | 0.1   |
  static const shln = "SHLN" as VariableAxisTag;

  /// Variable font axis tagged "SHRP" - Sharpness.
  ///
  /// Adjust shapes from angular or blunt default shapes (0%) to become increasingly sharped forms (up to 100%).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const shrp = "SHRP" as VariableAxisTag;

  /// Variable font axis tagged "SZP1" - Size of Paint 1.
  ///
  /// Modifies the size of a paint element going from an initial size (0) to positive values that increase the size (100%) or negative values that shrink it down (-100%). Reducing the size can create transparency.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const szp1 = "SZP1" as VariableAxisTag;

  /// Variable font axis tagged "SZP2" - Size of Paint 2.
  ///
  /// Modifies the size of a paint element going from an initial size (0) to positive values that increase the size (100%) or negative values that shrink it down (-100%). Reducing the size can create transparency. Paint 2 is in front of Paint 1.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const szp2 = "SZP2" as VariableAxisTag;

  /// Variable font axis tagged "slnt" - Slant.
  ///
  /// Adjust the style from upright to slanted. Negative values produce right-leaning forms, also known to typographers as an 'oblique' style. Positive values produce left-leaning forms, also called a 'backslanted' or 'reverse oblique' style.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:  | Max: | Step: |
  /// | -------- | ----- | ---- | ----- |
  /// | 0.0      | -90.0 | 90.0 | 1.0   |
  static const slnt = "slnt" as VariableAxisTag;

  /// Variable font axis tagged "SOFT" - Softness.
  ///
  /// Adjust letterforms to become more and more soft and rounded.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 0.1   |
  static const soft = "SOFT" as VariableAxisTag;

  /// Variable font axis tagged "SPAC" - Spacing.
  ///
  /// Adjusts the overall letter spacing of a font. The range is a relative percentage change from the family’s default spacing, so the default value is 0.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 0.1   |
  static const spac = "SPAC" as VariableAxisTag;

  /// Variable font axis tagged "VOLM" - Volume.
  ///
  /// Expands and exaggerates details of a typeface to emphasize the personality. Understood in a percentage amount, it goes from a neutral state (0%) to a maximum level (100%).
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const volm = "VOLM" as VariableAxisTag;

  /// Variable font axis tagged "wght" - Weight.
  ///
  /// Adjust the style from lighter to bolder in typographic color, by varying stroke weights, spacing and kerning, and other aspects of the type. This typically changes overall width, and so may be used in conjunction with Width and Grade axes.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 400.0    | 1.0  | 1000.0 | 1.0   |
  static const wght = "wght" as VariableAxisTag;

  /// Variable font axis tagged "wdth" - Width.
  ///
  /// Adjust the style from narrower to wider, by varying the proportions of counters, strokes, spacing and kerning, and other aspects of the type. This typically changes the typographic color in a subtle way, and so may be used in conjunction with Weight and Grade axes.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 100.0    | 25.0 | 200.0 | 0.1   |
  static const wdth = "wdth" as VariableAxisTag;

  /// Variable font axis tagged "WONK" - Wonky.
  ///
  /// Toggle the substitution of wonky forms. 'Off' (0) maintains more conventional letterforms, while 'On' (1) maintains wonky letterforms, such as leaning stems inroman, or flagged ascenders in italic. These forms are also controlled by Optical Size.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max: | Step: |
  /// | -------- | ---- | ---- | ----- |
  /// | 0.0      | 0.0  | 1.0  | 1.0   |
  static const wonk = "WONK" as VariableAxisTag;

  /// Variable font axis tagged "XELA" - Horizontal Element Alignment.
  ///
  /// Align glyph elements from their default position (0%), usually the baseline, to a rightmost (100%) or leftmost (-100%) position.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const xela = "XELA" as VariableAxisTag;

  /// Variable font axis tagged "XOPQ" - Thick Stroke.
  ///
  /// A parametric axis for varying thick stroke weights, such as stems.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 88.0     | -1000.0 | 2000.0 | 1.0   |
  static const xopq = "XOPQ" as VariableAxisTag;

  /// Variable font axis tagged "XPN1" - Horizontal Position of Paint 1.
  ///
  /// The position of the paint moves left and right. Negative values move to the left and positive values move to the right, in the X dimension. Paint 1 is behind Paint 2.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const xpn1 = "XPN1" as VariableAxisTag;

  /// Variable font axis tagged "XPN2" - Horizontal Position of Paint 2.
  ///
  /// The position of the paint moves left and right. Negative values move to the left and positive values move to the right, in the X dimension. Paint 2 is in frontof Paint 1.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const xpn2 = "XPN2" as VariableAxisTag;

  /// Variable font axis tagged "XROT" - Rotation in X.
  ///
  /// Glyphs rotate left and right, negative values to the left and positive values to the right, in the X dimension.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -180.0 | 180.0 | 1.0   |
  static const xrot = "XROT" as VariableAxisTag;

  /// Variable font axis tagged "XTRA" - Counter Width.
  ///
  /// A parametric axis for varying counter widths in the X dimension.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 400.0    | -1000.0 | 2000.0 | 1.0   |
  static const xtra = "XTRA" as VariableAxisTag;

  /// Variable font axis tagged "XTFI" - X transparent figures.
  ///
  /// Assigns a 'white' per mille value to each instance of the design space.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 400.0    | -1000.0 | 2000.0 | 1.0   |
  static const xtfi = "XTFI" as VariableAxisTag;

  /// Variable font axis tagged "YELA" - Vertical Element Alignment.
  ///
  /// Align glyphs elements from their default position (0%), usually the baseline, to an upper (100%) or lower (-100%) position.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const yela = "YELA" as VariableAxisTag;

  /// Variable font axis tagged "YOPQ" - Thin Stroke.
  ///
  /// A parametric axis for varying thin stroke weights, such as bars and hairlines.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 116.0    | -1000.0 | 2000.0 | 1.0   |
  static const yopq = "YOPQ" as VariableAxisTag;

  /// Variable font axis tagged "YPN1" - Vertical Position of Paint 1.
  ///
  /// The position of the paint moves up and down. Negative values move down and positive values move up. Paint 1 is behind Paint 2.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const ypn1 = "YPN1" as VariableAxisTag;

  /// Variable font axis tagged "YPN2" - Vertical Position of Paint 2.
  ///
  /// The position of the paint moves up and down. Negative values move down and positive values move up. Paint 2 is in front of Paint 1.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -100.0 | 100.0 | 1.0   |
  static const ypn2 = "YPN2" as VariableAxisTag;

  /// Variable font axis tagged "YROT" - Rotation in Y.
  ///
  /// Glyphs rotate up and down, negative values tilt down and positive values tilt up, in the Y dimension.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -180.0 | 180.0 | 1.0   |
  static const yrot = "YROT" as VariableAxisTag;

  /// Variable font axis tagged "YTAS" - Ascender Height.
  ///
  /// A parametric axis for varying the height of lowercase ascenders.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 750.0    | 0.0  | 1000.0 | 1.0   |
  static const ytas = "YTAS" as VariableAxisTag;

  /// Variable font axis tagged "YTDE" - Descender Depth.
  ///
  /// A parametric axis for varying the depth of lowercase descenders.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max: | Step: |
  /// | -------- | ------- | ---- | ----- |
  /// | -250.0   | -1000.0 | 0.0  | 1.0   |
  static const ytde = "YTDE" as VariableAxisTag;

  /// Variable font axis tagged "YTFI" - Figure Height.
  ///
  /// A parametric axis for varying the height of figures.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 600.0    | -1000.0 | 2000.0 | 1.0   |
  static const ytfi = "YTFI" as VariableAxisTag;

  /// Variable font axis tagged "YTLC" - Lowercase Height.
  ///
  /// A parametric axis for varying the height of the lowercase.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 500.0    | 0.0  | 1000.0 | 1.0   |
  static const ytlc = "YTLC" as VariableAxisTag;

  /// Variable font axis tagged "YTUC" - Uppercase Height.
  ///
  /// A parametric axis for varying the heights of uppercase letterforms.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:   | Step: |
  /// | -------- | ---- | ------ | ----- |
  /// | 725.0    | 0.0  | 1000.0 | 1.0   |
  static const ytuc = "YTUC" as VariableAxisTag;

  /// Variable font axis tagged "YEXT" - Vertical Extension.
  ///
  /// The axis extends glyphs in the Y dimension, such as the Cap Height, Ascender and Descender lengths. This is a relative axis, starting at 0% and going to the typeface's individual maximum extent at 100%.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min: | Max:  | Step: |
  /// | -------- | ---- | ----- | ----- |
  /// | 0.0      | 0.0  | 100.0 | 1.0   |
  static const yext = "YEXT" as VariableAxisTag;

  /// Variable font axis tagged "YEAR" - Year.
  ///
  /// Axis that shows in a metaphoric way the effect of time on a chosen topic.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:    | Max:   | Step: |
  /// | -------- | ------- | ------ | ----- |
  /// | 2000.0   | -4000.0 | 4000.0 | 1.0   |
  static const year = "YEAR" as VariableAxisTag;

  /// Variable font axis tagged "ZROT" - Rotation in Z.
  ///
  /// Glyphs rotate left and right, negative values to the left and positive values to the right, in the Z dimension.
  ///
  /// The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:
  ///
  /// | Default: | Min:   | Max:  | Step: |
  /// | -------- | ------ | ----- | ----- |
  /// | 0.0      | -180.0 | 180.0 | 1.0   |
  static const zrot = "ZROT" as VariableAxisTag;
}
