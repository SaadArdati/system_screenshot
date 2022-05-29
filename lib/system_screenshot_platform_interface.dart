import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_screenshot_method_channel.dart';

abstract class SystemScreenshotPlatform extends PlatformInterface {
  /// Constructs a SystemScreenshotPlatform.
  SystemScreenshotPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemScreenshotPlatform _instance = MethodChannelSystemScreenshot();

  /// The default instance of [SystemScreenshotPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemScreenshot].
  static SystemScreenshotPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemScreenshotPlatform] when
  /// they register themselves.
  static set instance(SystemScreenshotPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Takes a screenshot of the device's main display screen.
  /// [returns] A [Uint8List] containing the image data.
  Future<Uint8List?> takeScreenshot() {
    throw UnimplementedError('takeScreenshot() has not been implemented.');
  }
}
