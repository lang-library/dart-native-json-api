import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:native_json_api/native_json_api.dart';

void main() {
  group('Calculator', () {
    test('addOne', () {
      var calc = new Calculator();
      var result = calc.addOne(123);
      dump(result, 'result');
      expect(result == 124, isTrue);
    });
  });
}
