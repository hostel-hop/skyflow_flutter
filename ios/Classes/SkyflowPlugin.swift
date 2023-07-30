import Foundation
import Flutter
import Skyflow

extension FlutterError: Error {}

@objc(SkyflowPlugin)
class SkyflowPlugin: NSObject, FlutterPlugin {
    private var channel: FlutterMethodChannel
    private var skyflow: Skyflow.Client?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        // Method Channel
        let channel = FlutterMethodChannel(name: "flutter.skyflow", binaryMessenger: registrar.messenger(), codec: FlutterJSONMethodCodec())
        
        
        let instance = SkyflowPlugin(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    init(channel : FlutterMethodChannel) {
        self.channel = channel
        super.init()
    }
    
    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            return initialize(call, result: result)
        case "collect":
            return collect(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

    extension  SkyflowPlugin {
        func initialize(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
            guard let params = call.arguments as? NSDictionary else {
                return result(FlutterError.init(code: "BAD_ARGS",
                                            message: "Invalid arguments",
                                             details: nil))
            }

            let demoTokenProvider = DemoTokenProvider(
                tokenEndpoint: params["tokenProviderURL"] as! String, 
                authToken: params["authToken"] as! String
                ) 
 
            let config = Skyflow.Configuration(
                    vaultID: params["vaultID"] as! String,
                    vaultURL: params["vaultURL"] as! String,
                    tokenProvider: demoTokenProvider,
                    options: Skyflow.Options(
                        logLevel: Skyflow.LogLevel.ERROR,    // optional, if not specified default is ERROR
                    env: (params["env"] as! String) == "DEV" ? Skyflow.Env.DEV : Skyflow.Env.PROD
                ) 
            )
            
            skyflow = Skyflow.Client.init(config)
            
            return result(true)
        }

          func collect(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
            guard let params = call.arguments as? NSDictionary else {
                return result(FlutterError.init(code: "BAD_ARGS",
                                            message: "Invalid arguments",
                                             details: nil))
            }
              
            let insertCallback = DemoCallback(result)
              
            skyflow!.insert(
                records: params["records"] as! [String: Any],
                callback: insertCallback
            )
        }
    }

