import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:system_screenshot/system_screenshot.dart';
import 'package:system_screenshot/system_screenshot_platform_interface.dart';
import 'package:system_screenshot/system_screenshot_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSystemScreenshotPlatform
    with MockPlatformInterfaceMixin
    implements SystemScreenshotPlatform {
  @override
  Future<Uint8List?> takeScreenshot() => Future<Uint8List>.value(Uint8List(0));
}

void main() {
  final SystemScreenshotPlatform initialPlatform =
      SystemScreenshotPlatform.instance;

  test('$MethodChannelSystemScreenshot is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemScreenshot>());
  });

  test('takeScreenshot', () async {
    SystemScreenshot systemScreenshotPlugin = SystemScreenshot();
    MockSystemScreenshotPlatform fakePlatform = MockSystemScreenshotPlatform();
    SystemScreenshotPlatform.instance = fakePlatform;

    expect(await systemScreenshotPlugin.takeScreenshot(), Uint8List(0));
  });
}
