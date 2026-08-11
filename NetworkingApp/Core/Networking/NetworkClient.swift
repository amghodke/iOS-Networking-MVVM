//
//  NetworkClient.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

protocol NetworkClient {
    func request<E: EndPoint>(
        _ endpoint: E
    ) async throws -> E.Response
}
