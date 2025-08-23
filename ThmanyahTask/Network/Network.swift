//
//  Network.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T: Decodable>(
        endpoint: Requestable
    ) async throws -> T
    
    func request<T: Decodable>(
        endpoint: Requestable
    ) -> AnyPublisher<T, Error>
}

final class NetworkServiceLive: NetworkService {
    static let shared = NetworkServiceLive()
    private init() {}
    
    func request<T: Decodable>(
        endpoint: Requestable
    ) async throws -> T {
        
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        if let body = endpoint.body {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            print(response)
            throw NetworkError.invalidResponse
        }
        
        do {
            return try endpoint.decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
    
    func request<T: Decodable>(
        endpoint: Requestable
    ) -> AnyPublisher<T, Error> {
        Future { [weak self] promise in
            Task {
                do {
                    guard let self else {
                        throw URLError(.badServerResponse)
                    }
                    let value: T = try await self.request(endpoint: endpoint)
                    promise(.success(value))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
