import 'package:lz4_ffi/lz4_ffi.dart' as lz4;
import 'package:test/test.dart';

void main() {
  // group('A group of tests', () {
  //   final awesome = Awesome();

  //   setUp(() {
  //     // Additional setup goes here.
  //   });

  //   test('First Test', () {
  //     expect(awesome.isAwesome, isTrue);
  //   });
  // });
  test("ffi", () {
    print(lz4.LZ4_versionNumber());
  });
}
