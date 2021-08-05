import 'package:flutter/services.dart';
import 'package:flutter_easy_protector/flutter_easy_protector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.io/flutter_easy_protector');

  TestWidgetsFlutterBinding.ensureInitialized();

  test('checkIsDebug', () async {
    expect(await FlutterEasyProtector.checkIsDebug, false);
  });
}
