//
//  AppContainer.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

@MainActor
final class AppContainer {

    let networkClient: NetworkClient
    let userService: UserServiceProtocol
    let userListViewModel: UserListViewModel

    init() {
        let networkClient = URLSessionNetworkClient()

        let userService = UserService(
            networkClient: networkClient
        )

        self.networkClient = networkClient
        self.userService = userService
        self.userListViewModel = UserListViewModel(
            userService: userService
        )
    }
}
