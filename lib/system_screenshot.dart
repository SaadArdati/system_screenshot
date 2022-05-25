import 'dart:typed_data';

import 'system_screenshot_platform_interface.dart';

class SystemScreenshot {
  /// Takes a screenshot of the device's main display screen.
  /// [returns] A [Uint8List] containing the image data.
  Future<Uint8List?> takeScreenshot() {
    return SystemScreenshotPlatform.instance.takeScreenshot();
  }
}
