//
//  SearchUseCaseLiveTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Combine
import Testing
import Foundation
@testable import ThmanyahTask

@Suite("SearchUseCaseLive")
struct SearchUseCaseLiveTests {

    private var sut: SearchUseCaseLive!
    private var repository: MockSearchRepository!

    init() {
        self.repository = MockSearchRepository()
        self.sut = SearchUseCaseLive(repository: repository)
    }

    @Test("Successful mapping from repository response")
    func testSearchSuccess() async throws {
        // Given
        let mockResponse = Stub.homeSectionResponse()
        repository.mockResult = { _ in Just(mockResponse).setFailureType(to: Error.self).eraseToAnyPublisher() }

        // When
        let publisher = sut.search(query: "podcast")
        let result = try await publisher.values.first(where: { _ in true })

        // Then
        #expect(result?.count == 7)
        #expect(result?.first?.title == "Top Podcasts")
        #expect(result?.first?.cards.first?.title == "Up First from NPR")
    }

    @Test("Handles nil sections array gracefully")
    func testSearchWithNilSections() async throws {
        // Given
        let mockResponse = HomeSectionResponse(sections: [], pagination: nil) //Stub.homeSectionResponse()
        repository.mockResult = { _ in Just(mockResponse).setFailureType(to: Error.self).eraseToAnyPublisher() }

        // When
        let publisher = sut.search(query: "nil")
        let result = try await publisher.values.first(where: { _ in true })

        // Then
        #expect(result?.isEmpty == true)
    }

    /// This test verifies that the use case propagates errors from the repository.
    @Test("Propagates errors from repository")
    func testSearchFailure() async throws {
        // Given
        repository.mockResult = { _ in Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher() }

        // When
        let publisher = sut.search(query: "fail")

        // Then
        await #expect(throws: NetworkError.self) {
            try await publisher.values.first(where: { _ in true })
        }
    }
}
