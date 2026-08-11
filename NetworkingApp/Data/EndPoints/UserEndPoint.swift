import Foundation

enum UserEndpoint: EndPoint {

    case getUsers

    typealias Response = [User]

    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }

    var headers: [String: String] {
        [
            "Accept": "application/json"
        ]
    }

    var queryItems: [URLQueryItem] {
        []
    }

    var body: Data? {
        nil
    }
}
