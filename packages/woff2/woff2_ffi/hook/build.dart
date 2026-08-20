import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:logging/logging.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    if (!input.config.buildCodeAssets) return;

    final packageName = input.packageName;
    final targetOS = input.config.code.targetOS;

    final cBuilder = CBuilder.library(
      name: packageName,
      assetName: "src/ffi_bindings.g.dart",
      sources: [
        // WOFF2 C API
        "src/woff2_c_api.cc",

        // WOFF2 Common
        "third_party/woff2/src/table_tags.cc",
        "third_party/woff2/src/variable_length.cc",
        "third_party/woff2/src/woff2_common.cc",

        // WOFF2 Decoder
        "third_party/woff2/src/woff2_dec.cc",
        "third_party/woff2/src/woff2_out.cc",

        // WOFF2 Encoder
        "third_party/woff2/src/font.cc",
        "third_party/woff2/src/glyph.cc",
        "third_party/woff2/src/normalize.cc",
        "third_party/woff2/src/transform.cc",
        "third_party/woff2/src/woff2_enc.cc",

        // Brotli Common
        "third_party/woff2/brotli/c/common/dictionary.c",
        "third_party/woff2/brotli/c/common/transform.c",

        // Brotli Decoder
        "third_party/woff2/brotli/c/dec/bit_reader.c",
        "third_party/woff2/brotli/c/dec/decode.c",
        "third_party/woff2/brotli/c/dec/huffman.c",
        "third_party/woff2/brotli/c/dec/state.c",

        // Brotli Encoder
        "third_party/woff2/brotli/c/enc/backward_references_hq.c",
        "third_party/woff2/brotli/c/enc/backward_references.c",
        "third_party/woff2/brotli/c/enc/bit_cost.c",
        "third_party/woff2/brotli/c/enc/block_splitter.c",
        "third_party/woff2/brotli/c/enc/brotli_bit_stream.c",
        "third_party/woff2/brotli/c/enc/cluster.c",
        "third_party/woff2/brotli/c/enc/compress_fragment_two_pass.c",
        "third_party/woff2/brotli/c/enc/compress_fragment.c",
        "third_party/woff2/brotli/c/enc/dictionary_hash.c",
        "third_party/woff2/brotli/c/enc/encode.c",
        "third_party/woff2/brotli/c/enc/encoder_dict.c",
        "third_party/woff2/brotli/c/enc/entropy_encode.c",
        "third_party/woff2/brotli/c/enc/histogram.c",
        "third_party/woff2/brotli/c/enc/literal_cost.c",
        "third_party/woff2/brotli/c/enc/memory.c",
        "third_party/woff2/brotli/c/enc/metablock.c",
        "third_party/woff2/brotli/c/enc/static_dict.c",
        "third_party/woff2/brotli/c/enc/utf8_util.c",
      ],
      includes: [
        // WOFF2
        "third_party/woff2/include",

        // Brotli
        "third_party/woff2/brotli/c/include",
      ],
      optimizationLevel: .o2,
      flags: switch (targetOS) {
        .windows => const [
          // MSVC / clang-cl: no exceptions or RTTI (matches HB_NO_* build).
          "/EHs-",
          "/GR-",
          "/bigobj",
        ],
        .linux => const [
          "-fno-exceptions",
          "-fno-rtti",
          // Embed libstdc++/libgcc so the .so does not depend on the host's
          // shared C++ runtime (AppImage / older distros).
          "-static-libstdc++",
          "-static-libgcc",
        ],
        _ => const ["-fno-exceptions", "-fno-rtti"],
      },
      libraries: switch (targetOS) {
        .windows => const [],
        _ => const ["m", "stdc++"],
      },
      defines: {
        "WOFF2_EXTERN": targetOS == .windows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
      },
      cppLinkStdLib: switch (targetOS) {
        .android => "c++_static",
        .iOS || .macOS || .fuchsia => "c++",
        .linux => "stdc++",
        .windows => null,
        _ => null,
      },
    );
    final logger = Logger("")
      ..level = .WARNING
      // ignore: avoid_print
      ..onRecord.listen((r) => print(r.message));
    await cBuilder.run(input: input, output: output, logger: logger);
  });
}
