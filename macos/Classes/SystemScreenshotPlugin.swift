import Cocoa
import FlutterMacOS

public class SystemScreenshotPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "system_screenshot", binaryMessenger: registrar.messenger)
        let instance = SystemScreenshotPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "takeScreenshot":
            let data = TakeScreenshot()
            if (data == nil) {
                result(nil)
            } else {
                result(FlutterStandardTypedData(bytes: data!))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    public func TakeScreenshot() -> Data? {
        let displayID = CGMainDisplayID()
        let screenShot:CGImage? = CGDisplayCreateImage(displayID)
        if (screenShot == nil) {
            return nil
        }
        let bitmapRep = NSBitmapImageRep(cgImage: screenShot!)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
    }
}
