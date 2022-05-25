import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_screenshot/system_screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SystemScreenshot _systemScreenshotPlugin = SystemScreenshot();

  Uint8List? _screenshot;
  bool isError = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> takeScreenshot() async {
    Uint8List? screenshot;

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isError = false;
      screenshot = await _systemScreenshotPlugin.takeScreenshot();
    } on PlatformException {
      isError = true;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _screenshot = screenshot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('System Screenshot Example App'),
        ),
        body: Center(
            child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  child: const Text('Take Screenshot'),
                  onPressed: () {
                    takeScreenshot();
                  },
                ),
                TextButton(
                  child: const Text('Clear'),
                  onPressed: () {
                    setState(() {
                      _screenshot = null;
                    });
                  },
                ),
              ],
            ),
            if (isError)
              const Text(
                'Error',
                style: TextStyle(color: Colors.red),
              )
            else if (_screenshot == null)
              const Text('No screenshot yet.')
            else
              Image.memory(_screenshot!),
          ],
        )),
      ),
    );
  }
}
