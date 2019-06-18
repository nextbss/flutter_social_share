import Flutter
import UIKit
import FacebookCore
import FacebookShare

public class SwiftFlutterSocialSharePlugin: NSObject, FlutterPlugin {
  private let methodShareLinkToFacebook = "shareLinkToFacebook"
  private let argumentContentUri = "contentUrl"
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_social_share", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSocialSharePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == methodShareLinkToFacebook {
        let arguments = call.arguments as! NSDictionary
        let uriToShare = arguments[argumentContentUri] as! String
        let content = LinkShareContent(url: URL(string: uriToShare)!)
        
        do {
            let shareDialog = ShareDialog(content: content)
            shareDialog.completion = { dialogResult in
                switch dialogResult {
                case .success(_):
                    result([
                        "status" : "success",
                        "postId" : ""
                    ])
                case .failed(_):
                    result([
                        "status" : "error",
                        "errorMessage" : "",
                    ])
                case .cancelled:
                    result([
                        "status" : "cancelledByUser"
                    ])
                }
            }
            
            try shareDialog.show()
        } catch {
            result([
                "status" : "error",
                "errorMessage" : "",
            ])
        }
    }
  }
}
