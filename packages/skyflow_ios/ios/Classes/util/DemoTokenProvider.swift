import Foundation
import Skyflow

class DemoTokenProvider: TokenProvider {
    private var tokenEndpoint: String
    private var headers: [String: String] = [:]


    init(tokenEndpoint: String, headers: [String: String]) {
        self.tokenEndpoint = tokenEndpoint
        self.headers = headers
    }

    public func getBearerToken(_ apiCallback: Callback) {
        if let url = URL(string: tokenEndpoint) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)

            request.httpMethod = "GET"

            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }

            let task = session.dataTask(with: request){ data, response, error in
                if(error != nil){
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let x = try JSONSerialization.jsonObject(with: safeData, options:[])
                        
                        let tokenData = (x as! [String: Any])["data"]
                        let accessToken = (tokenData as! [String: String])["accessToken"]
                        
                        apiCallback.onSuccess(accessToken)

                    }
                    catch {
                        apiCallback.onFailure(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
