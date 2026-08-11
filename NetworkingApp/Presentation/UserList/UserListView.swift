//
//  UserListView.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import SwiftUI

struct UserListView: View {

    @State private var viewModel: UserListViewModel

    init(viewModel: UserListViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle(AppStrings.Users.title)
                .task {
                    await viewModel.fetchUsers()
                }
                .refreshable {
                    await viewModel.fetchUsers()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading && viewModel.users.isEmpty {
            ProgressView(AppStrings.Common.loading)

        } else if let errorMessage = viewModel.errorMessage,
                  viewModel.users.isEmpty {
            errorContent(errorMessage)

        } else if viewModel.users.isEmpty {
            Text(AppStrings.Users.emptyMessage)
                .font(AppFont.body)
                .foregroundStyle(AppColor.secondary)

        } else {
            userList
        }
    }

    private var userList: some View {
        List(viewModel.users) { user in
            userRow(user)
        }
    }

    private func userRow(_ user: User) -> some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(user.name)
                .font(AppFont.sectionTitle)

            Text("@\(user.username)")
                .font(AppFont.secondary)
                .foregroundStyle(AppColor.secondary)

            Text(user.email)
                .font(AppFont.caption)
                .foregroundStyle(AppColor.secondary)
        }
        .padding(.vertical, AppSpacing.small)
    }

    private func errorContent(_ message: String) -> some View {
        ContentUnavailableView {
            Label(
                AppStrings.Common.somethingWentWrong,
                systemImage: "exclamationmark.triangle"
            )
        } description: {
            Text(message)
        } actions: {
            Button(AppStrings.Users.retry) {
                Task {
                    await viewModel.fetchUsers()
                }
            }
        }
    }
}
