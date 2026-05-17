import 'dart:io';

void main(List<String> arguments) async {
  final packageRoot = Platform.script.resolve("../");
  final process = await Process.start("hb-subset", [
    "--font-file",
    packageRoot.resolve("lib/fonts/GoogleSymbols.ttf").toFilePath(),
    "--output-file",
    "-",
    // packageRoot.resolve("lib/fonts/GoogleSymbolsRounded.ttf").toFilePath(),
    "--unicodes=*",
    "--variations=ROND=100",
    "--optimize",
  ], runInShell: false);
}
