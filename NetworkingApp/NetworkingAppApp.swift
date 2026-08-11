//
//  NetworkingAppApp.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import SwiftUI

@main
struct NetworkingAppApp: App {
    @State private var appContainer = AppContainer()

    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: appContainer.userListViewModel)
        }
    }
}
