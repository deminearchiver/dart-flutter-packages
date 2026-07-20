/// # Icongen
///
/// Subsets icon fonts and generates Flutter bindings for them.
///
/// This utility utilizes HarfBuzz to strip unused glyph data from
/// TrueType/OpenType font files and generates corresponding Dart source files
/// containing static `IconData` definitions for Flutter applications.
library;

export 'src/icongen.dart'
    hide
        sanitizeIconIdentifier,
        BindingsBuilderResultFactory,
        SubsetBuilderResultFactory,
        tryCreateBlob,
        createBlob,
        tryCreateFace,
        createFace,
        createFaceSubset,
        faceToBytes,
        tryCreateFont,
        createFont,
        tryCreateTag,
        createTag,
        extractFontFamily,
        extractIconGlyphs,
        extractSmallestIconGlyph,
        WriteEntriesCallback,
        writeEntries;
