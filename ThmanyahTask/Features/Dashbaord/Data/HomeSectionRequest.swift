//
//  DashboardRequest.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

struct HomeSectionRequest: Requestable {
    let page: Int?
    var path: String { "/home_sections" }
    var method: HTTPMethod = .get
    
    var queryItems: [URLQueryItem]? {
        guard let page else {
            return nil
        }
        return [URLQueryItem(name: "page", value: "\(page)")]
    }
}

