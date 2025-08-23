//
//  NetworkError.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}
