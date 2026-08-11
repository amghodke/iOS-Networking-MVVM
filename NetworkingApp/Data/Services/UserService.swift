//
//  UserService.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

final class UserService : UserServiceProtocol {
    private let networkClient: NetworkClient
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    func fetchUsers() async throws -> [User] {
        try await networkClient.request(
            UserEndpoint.getUsers
        )
    }
}
