//
//  SearchRequest.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Foundation

struct SearchRequest: Requestable {
    let query: String
    var path: String { "/search"}
    var baseURL: String { "https://mock.apidog.com/m1/735111-711675-default" }
    var method: HTTPMethod = .get
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "q", value: "\(query)")]
    }
}
