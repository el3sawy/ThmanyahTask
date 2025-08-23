//
//  DashboardRepositoryLiveTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Testing
@testable import ThmanyahTask

@Suite("DashboardRepositoryLive")
struct DashboardRepositoryLiveTests {
    private var sut: DashboardRepositoryLive!
    private var networkService: NetworkSpy!

    init() {
        networkService = NetworkSpy()
        sut = DashboardRepositoryLive(networkService: networkService)
    }

    @Test("Should call network service")
    func testFetchSections() async throws {
        // When
        do {
            _ = try await sut.fetchSections(page: 1)
        } catch {
            // ignore error because our spy always throws
        }

       // Then
        #expect(networkService.isRequestCalled == true)
    }
}
