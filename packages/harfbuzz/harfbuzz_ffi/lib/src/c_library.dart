import 'package:code_assets/code_assets.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

CLibrary createCLibrary({required String packageName, required OS targetOS}) =>
    .new(
      name: packageName,
      assetName: "src/ffi_bindings.g.dart",
      sources: ["third_party/harfbuzz/src/harfbuzz-world.cc"],
      language: .cpp,
      std: "c++17",
      optimizationLevel: .o2,
      flags: switch (targetOS) {
        .windows => const [
          // MSVC / clang-cl: no exceptions or RTTI (matches HB_NO_* build).
          "/EHs-",
          "/GR-",
          "/bigobj",
          "/Gy",
          "/Gw",
        ],
        .linux => const [
          "-fno-exceptions",
          "-fno-rtti",
          "-ffunction-sections",
          "-fdata-sections",
          // Embed libstdc++/libgcc so the .so does not depend on the host's
          // shared C++ runtime (AppImage / older distros).
          "-static-libstdc++",
          "-static-libgcc",
          "-x",
          "none",
        ],
        _ => const [
          "-fno-exceptions",
          "-fno-rtti",
          "-ffunction-sections",
          "-fdata-sections",
          "-x",
          "none",
        ],
      },
      libraries: switch (targetOS) {
        .windows => const [],
        _ => const ["m"],
      },
      defines: {
        "HB_EXTERN": targetOS == .windows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
        "HB_HAS_SUBSET": "",
        "HB_EXPERIMENTAL_API": "",
        "HB_NO_MT": "1",
        "HB_NO_PRAGMA_GCC_DIAGNOSTIC": "1",
        if (targetOS == .windows) "_HAS_EXCEPTIONS": "0",
      },
      cppLinkStdLib: switch (targetOS) {
        .android => "c++_static",
        .iOS || .macOS || .fuchsia => "c++",
        .linux => "stdc++",
        .windows => null,
        _ => null,
      },
    );
