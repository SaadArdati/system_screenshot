import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_screenshot/system_screenshot_method_channel.dart';

void main() {
  MethodChannelSystemScreenshot platform = MethodChannelSystemScreenshot();
  const MethodChannel channel = MethodChannel('system_screenshot');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return Uint8List(0);
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('takeScreenshot', () async {
    expect(await platform.takeScreenshot(), Uint8List(0));
  });
}
