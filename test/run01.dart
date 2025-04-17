import 'package:output/output.dart';
import 'package:native_json_api/native_json_api.dart';

void main() {
  final $api = NativeJsonApi('PROGRAM.dll');
  try{
    $api.call('system', ['ping', '-n', '2', 'www.youtube.com']);
    dump($api.call('add2', [11, 22]));
    dump($api.call$('add2', 111, 222));
    dump($api.call('add2', [11, 22, 33]));
  } catch (e, stacktrace) {
    dump('Exception: $e');
    dump('Stacktrace: $stacktrace');
  }
}
