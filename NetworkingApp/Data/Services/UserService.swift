//
//  UserService.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

final class UserService : UserServiceProtocol {
    private let neetworkClient: NetworkClient
    init(neetworkClient: NetworkClient) {
        self.neetworkClient = neetworkClient
    }
    func fetchUsers() async throws -> [User] {
        try await neetworkClient.request(
            UserEndpoint.getUsers
        )
    }
}
