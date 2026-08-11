    //
//  UserServiceProtocol.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

protocol UserServiceProtocol {

    func fetchUsers() async throws -> [User]
}
