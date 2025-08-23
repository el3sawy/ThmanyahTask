//
//  SearchRepositoryLiveTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Combine
import Testing
@testable import ThmanyahTask

@Suite("SearchRepositoryLive")
final class SearchRepositoryLiveTests {
    private var sut: SearchRepositoryLive!
    private var networkService: NetworkSpy!
    private var cancellables = Set<AnyCancellable>()

    init() {
        networkService = NetworkSpy()
        sut = SearchRepositoryLive(networkService: networkService)
    }

    @Test("Should call network service")
    func testSearch() async throws {

        // When
        sut.search(query: "")
            .sink { _ in
            } receiveValue: { _ in }
            .store(in: &cancellables)

        // Then
        #expect(networkService.isRequestCalled == true)
    }
}
