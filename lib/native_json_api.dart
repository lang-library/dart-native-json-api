import 'dart:convert' as convert;
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;
import 'package:dynamic_function/dynamic_function.dart';

class NativeJsonApi {
  final String $$dllName;
  late final ffi.DynamicLibrary $$lib;
  late final ffi.Pointer<ffi.Utf8> Function(
    ffi.Pointer<ffi.Utf8>,
    ffi.Pointer<ffi.Utf8>,
  )
  $$callFunc;

  NativeJsonApi(this.$$dllName) {
    $$lib = ffi.DynamicLibrary.open($$dllName);
    $$callFunc =
        $$lib
            .lookup<
              ffi.NativeFunction<
                ffi.Pointer<ffi.Utf8> Function(
                  ffi.Pointer<ffi.Utf8>,
                  ffi.Pointer<ffi.Utf8>,
                )
              >
            >('Call')
            .asFunction();
  }

  dynamic call(String $name, dynamic $args) {
    String $input = convert.jsonEncode($args);
    final $namePtr = $name.toNativeUtf8();
    final $inputPtr = $input.toNativeUtf8();
    dynamic $result = convert.jsonDecode(
      $$callFunc($namePtr, $inputPtr).toDartString(),
    );
    ffi.calloc.free($namePtr);
    ffi.calloc.free($inputPtr);
    if ($result is String) {
      throw $result;
    }
    return $result[0];
  }

  late final dynamic call$ = DynamicFunction((
    List<dynamic> $positional,
    Map<Symbol, dynamic> $named,
  ) {
    String $name = $positional[0];
    List $rest = $positional.sublist(1);
    return call($name, $rest);
  });
}
