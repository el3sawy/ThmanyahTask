//
//  HTTPMethod.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Encodable? { get }
    var headers: [String: String] { get }
    var decoder: JSONDecoder { get }
}

extension Requestable {
    var queryItems: [URLQueryItem]? { nil }
    var body: Encodable? { nil }
    var headers: [String: String] { [:] }
    var decoder: JSONDecoder { JSONDecoder() }
    var baseURL: String { "https://api-v2-b2sit6oh3a-uc.a.run.app" }
    var url: URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = queryItems
        return components?.url
    }
}
