//
//  User.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//

import Foundation

struct User: Identifiable, Codable {

    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}
