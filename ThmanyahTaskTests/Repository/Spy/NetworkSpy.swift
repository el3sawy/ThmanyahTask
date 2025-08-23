//
//  NetworkSpy.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Combine
@testable import ThmanyahTask

final class NetworkSpy: NetworkService {
    // MARK: - Testing Propertites

    private(set) var isRequestCalled: Bool = false

    // MARK: - Spy Functions

    func request<T>(endpoint: any Requestable) async throws -> T where T : Decodable {
        isRequestCalled = true
        throw NetworkSpyError.notImplemented
    }

    func request<T>(endpoint: any Requestable) -> AnyPublisher<T, any Error> where T : Decodable {
        isRequestCalled = true
       return Fail(error: NetworkSpyError.notImplemented)
            .eraseToAnyPublisher()
    }

    enum NetworkSpyError: Error {
        case notImplemented
    }
}
