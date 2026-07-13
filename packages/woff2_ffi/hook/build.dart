import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:logging/logging.dart';
import 'package:native_toolchain_ninja/native_toolchain_ninja.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    final packageName = input.packageName;
    final isWindows = input.config.code.targetOS == .windows;
    final ninjaBuilder = NinjaBuilder.library(
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
      defines: {
        "WOFF2_EXTERN": isWindows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
      },
      optimizationLevel: .o2,
    );
    await ninjaBuilder.run(
      input: input,
      output: output,
      logger: Logger("")
        ..level = .ALL
        // ignore: avoid_print
        ..onRecord.listen((r) => print(r.message)),
    );
  });
}
