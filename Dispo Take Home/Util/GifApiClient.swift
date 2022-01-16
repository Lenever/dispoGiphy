import UIKit

struct GifAPIClient {
  // TODO: Implement
    var urlSession = URLSession.shared
    var baseUrl = "https://api.giphy.com/v1/gifs"
    
    enum HttpMethodType: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
        case put = "PUT"
    }
    
    enum EndPointType: String {
        case trending = "trending"
        case search = "search"
        case id = "id"
    }
    
    func request <ResponseBody: Decodable> (requestType: HttpMethodType = .get, endpointType: EndPointType, params: [String: Any] = [:], success: @escaping (ResponseBody) -> (), failure: @escaping (String) -> ()) {
        
        let url = URL(string: "\(baseUrl)/\(endpointType.rawValue)api_key=\(Constants.giphyApiKey)")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = requestType.rawValue
        
        let parameters = params
        
        request.httpBody = parameters.percentEncoded()
        
        
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                failure(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response ?? URLResponse())")
                return
            }
            
            if let data = data,
               let postData = try? JSONDecoder().decode(ResponseBody.self, from: data) {
                success(postData)
            }
        })
        task.resume()
    }
}
