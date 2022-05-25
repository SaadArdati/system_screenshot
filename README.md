# system_screenshot

Take a native screenshot from the system interface.

CURRENTLY ONLY SUPPORTS MacOS.

## Getting Started

### Step 1:
Create a new SystemScreenshot object anywhere you like. A good place to put it would be at the top of
your Widget's State class.
```dart
class _MyAppState extends State<MyApp> {
  
  final SystemScreenshot _systemScreenshotPlugin = SystemScreenshot();
```

### Step 2:
Call the `takeScreenshot` method.

```dart
await _systemScreenshotPlugin.takeScreenshot()
```

Note that it is a Future and that the execution is asynchronous.
Be sure to handle the result of the Future properly as it can also be nullable.

The resulting data from the function call is a Uint8List that you can manipulate as much as you like.
```dart
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
```

You can render the image in your app using an Image.memory widget:
```dart
Image.memory(_screenshot)
```

You can also manipulate the data in any way you like. Use a different package to store the data if you need to.