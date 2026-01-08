import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:named_colors/src/flat_buffers_schema.g.dart' as fb;

// import 'package:named_colors/flat_buffers_schema.dart';

void main() {
  test("validate", () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final data = await rootBundle.loadStructuredBinaryData(
      "packages/named_colors/assets/named_colors_cache.fb",
      (data) => fb.NamedColorsCache(data.buffer.asUint8List()),
    );
    expect(data.entries, isNotNull);

    final entries = data.entries ?? [];

    for (final entry in entries) {
      expect(entry.oklab, isNotNull);
      expect(entry.identities, isNotNull);
      expect(entry.identities, isNotEmpty);
    }
  });
}
