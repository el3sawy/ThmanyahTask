//
//  MockSearchUseCase.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Combine
import Foundation
@testable import ThmanyahTask

final class MockSearchUseCase: SearchUseCase {
    var mockResult: ((String) -> AnyPublisher<[HomeSectionModel], Error>) = { _ in
        Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func search(query: String) -> AnyPublisher<[HomeSectionModel], Error> {
        return mockResult(query)
    }
}
