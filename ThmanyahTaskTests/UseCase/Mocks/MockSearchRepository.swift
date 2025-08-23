//
//  SearchRepositoryMock.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Combine
@testable import ThmanyahTask

final class MockSearchRepository: SearchRepository {
    var mockResult: ((String) -> AnyPublisher<HomeSectionResponse, Error>) = { _ in
        Just(
            HomeSectionResponse(
                sections: [],
                pagination: nil
            )
        ).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func search(query: String) -> AnyPublisher<HomeSectionResponse, Error> {
        return mockResult(query)
    }
}
