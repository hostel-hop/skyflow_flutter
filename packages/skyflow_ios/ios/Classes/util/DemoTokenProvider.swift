import Foundation
import Skyflow

class DemoTokenProvider: TokenProvider {
    private var tokenEndpoint: String
    private var authToken: String


    init(tokenEndpoint: String, authToken: String) {
        self.tokenEndpoint = tokenEndpoint
        self.authToken = authToken
    }

    public func getBearerToken(_ apiCallback: Callback) {
        if let url = URL(string: tokenEndpoint) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)

            request.httpMethod = "GET"
            request.setValue(authToken, forHTTPHeaderField: "x-auth-token")

            let task = session.dataTask(with: request){ data, response, error in
                if(error != nil){
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let x = try JSONSerialization.jsonObject(with: safeData, options:[]) as? [String: String]
                        if let accessToken = x?["accessToken"] {
                            apiCallback.onSuccess(accessToken)
                        }
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
