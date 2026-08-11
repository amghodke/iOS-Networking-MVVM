//
//  NetworkError.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

enum NetworkError: LocalizedError {

    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case encodingError(Error)
    case underlying(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."

        case .invalidResponse:
            return "The server returned an invalid response."

        case .httpError(let statusCode):
            return "The server returned status code \(statusCode)."

        case .decodingError:
            return "Failed to decode the server response."

        case .encodingError:
            return "Failed to encode the request."

        case .underlying(let error):
            return error.localizedDescription
        }
    }
}
