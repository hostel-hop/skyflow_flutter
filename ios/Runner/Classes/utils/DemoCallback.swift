import Foundation
import Skyflow

class DemoCallback: Callback {
    
    private var resultCallback: FlutterResult
    
    init(_ callback: @escaping FlutterResult) {
        self.resultCallback = callback
    }
    
    func onSuccess(_ responseBody: Any) {
        let strContent = String(data: try! JSONSerialization.data(withJSONObject: responseBody), encoding: .utf8)
        self.resultCallback(strContent)
    }
    
    func onFailure(_ error: Any) {
        self.resultCallback("")
    }
    
}
