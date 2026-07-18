import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:woff2_flutter/woff2_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Woff2FontLoaderFeature", () {
    test("loads valid WOFF2 font", () async {
      const feature = Woff2FontLoaderFeature();
      final bytes = base64Decode(
        // See: https://github.com/filamentgroup/woff2-feature-test
        "d09GMgABAAAAAADwAAoAAAAAAiQAAACoAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmAALAogOAE2AiQDBgsGAAQgBSAHIBuDAciO1EZ3I/mL5/+5/rfPnTt9/9Qa8H4cUUZxaRbh36LiKJoVh61XGzw6ufkpoeZBW4KphwFYIJGHB4LAY4hby++gW+6N1EN94I49v86yCpUdYgqeZrOWN34CMQg2tAmthdli0eePIwAKNIIRS4AGZFzdX9lbBUAQlm//f262/61o8PlYO/D1/X4FrWFFgdCQD9DpGJSxmFyjOAGUU4P0qigcNb82GAAA",
      );
      expect(feature.tryLoadFont(bytes, "TestFont"), completion(true));
    });

    test("fails to load loads invalid WOFF2 font", () async {
      const feature = Woff2FontLoaderFeature();
      final bytes = base64Decode("abcd");
      expect(feature.tryLoadFont(bytes, "TestFont"), completion(false));
    });
  });
}
