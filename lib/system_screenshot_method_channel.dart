import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'system_screenshot_platform_interface.dart';

/// An implementation of [SystemScreenshotPlatform] that uses method channels.
class MethodChannelSystemScreenshot extends SystemScreenshotPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_screenshot');

  /// Takes a screenshot of the device's main display screen.
  /// [returns] A [Uint8List] containing the image data.
  @override
  Future<Uint8List?> takeScreenshot() async {
    final data = await methodChannel.invokeMethod<Uint8List>('takeScreenshot');
    return data;
  }
}
