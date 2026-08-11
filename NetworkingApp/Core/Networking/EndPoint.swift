//
//  EndPoint.swift
//  NetworkingApp
//
//  Created by Amitkumar on 11/08/26.
//
import Foundation
protocol EndPoint{
    associatedtype Response:Decodable
    var path:String {get}
    var method:HTTPMethod {get}
    var headers: [String:String] {get}
    var queryItems: [URLQueryItem] {get}
    var body: Data? {get}
}

