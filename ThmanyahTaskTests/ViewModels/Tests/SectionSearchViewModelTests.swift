//
//  SectionSearchViewModelTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Combine
import Testing
import Foundation
@testable import ThmanyahTask

@Suite("SectionSearchViewModel")
struct SectionSearchViewModelTests {

    var useCase: MockSearchUseCase!
    var sut: SectionSearchViewModel!

    init() {
        self.useCase = MockSearchUseCase()
        self.sut = SectionSearchViewModel(useCase: useCase, fireAfter: 100)
    }

    @Test("Initial State")
    func testInitialState() {
        #expect(sut.sections.isEmpty)
        #expect(sut.isLoading == false)
        #expect(sut.errorMessage.isEmpty)
    }

    @Test("Search Success")
    func testSearchSuccess() async throws {
        // Given
        let expectedSections: [HomeSectionModel] = Stub.sectionModels()

        useCase.mockResult = { query in
            Just(expectedSections).setFailureType(to: Error.self).eraseToAnyPublisher()
        }

        // When
        sut.searchText.send("Books")
        try await Task.sleep(for: .milliseconds(200))

        // Then
        #expect(sut.isLoading == false)
        #expect(sut.sections.count == expectedSections.count)
        #expect(sut.errorMessage.isEmpty)
    }

    @Test("Search Failure")
    func testSearchFailure() async throws {
        // Given
        struct TestError: LocalizedError {
            var errorDescription: String? { "Something went wrong" }
        }

        useCase.mockResult = { query in
            Fail(error: TestError()).eraseToAnyPublisher()
        }

        // When
        sut.searchText.send("fail")
        try await Task.sleep(for: .milliseconds(200))

        // Then
        #expect(sut.isLoading == false)
        #expect(sut.sections.isEmpty)
        #expect(sut.errorMessage == "Something went wrong")
    }

    @Test("Debounce")
    func testDebounce() async throws {
        // Given: A counter to track how many times the use case is called.
        var searchCallCount = 0
        useCase.mockResult = { query in
            searchCallCount += 1
            return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
        }

        // When: The search text is updated multiple times in quick succession.
        sut.searchText.send("a")
        sut.searchText.send("b")
        sut.searchText.send("c")
        try await Task.sleep(for: .milliseconds(50))

        // Then
        #expect(searchCallCount == 0)
        try await Task.sleep(for: .milliseconds(150))
        #expect(searchCallCount == 1)
    }
}
