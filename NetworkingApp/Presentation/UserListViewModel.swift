//
//  UserListViewModel.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class UserListViewModel {

    private let userService: UserServiceProtocol

    private(set) var users: [User] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func fetchUsers() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            users = try await userService.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
