import Foundation
import Skyflow

class DemoCallback: Callback {
    
    private var resultCallback: FlutterResult
    
    init(_ callback: @escaping FlutterResult) {
        self.resultCallback = callback
    }
    
    func onSuccess(_ responseBody: Any) {
        self.resultCallback(responseBody)
    }
    
    func onFailure(_ error: Any) {
        let errorResult = error as? [String: Any]
        self.resultCallback(["records": errorResult?["records"] ?? []])
    }
}
