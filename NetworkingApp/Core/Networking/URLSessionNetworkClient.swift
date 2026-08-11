//
//  URLSessionNetworkClient.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

final class URLSessionNetworkClient: NetworkClient {

    private let session: URLSession
    private let decoder: JSONDecoder

    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }

    func request<E: EndPoint>(
        _ endpoint: E
    ) async throws -> E.Response {

        guard var components = URLComponents(
            string: APIConstants.baseURL + endpoint.path
        ) else {
            throw NetworkError.invalidURL
        }

        components.queryItems = endpoint.queryItems.isEmpty
            ? nil
            : endpoint.queryItems

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        for (field, value) in endpoint.headers {
            request.setValue(value, forHTTPHeaderField: field)
        }

        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError(
                    statusCode: httpResponse.statusCode
                )
            }

            do {
                return try decoder.decode(
                    E.Response.self,
                    from: data
                )
            } catch {
                throw NetworkError.decodingError(error)
            }

        } catch let error as NetworkError {
            throw error

        } catch {
            throw NetworkError.underlying(error)
        }
    }
}
