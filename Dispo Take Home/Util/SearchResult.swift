import UIKit

struct SearchResult {
    var id: String
    var gifUrl: URL
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case gifUrl = "url"
    }
}
