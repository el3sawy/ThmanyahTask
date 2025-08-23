//
//  DashboardUseCaseLiveTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Testing
@testable import ThmanyahTask

@Suite("DashboardUseCaseLive")
struct DashboardUseCaseLiveTests {

    private var sut: DashboardUseCaseLive!
    private var repository: MockDashboardRepository!

    init() {
        self.repository = MockDashboardRepository()
        self.sut = DashboardUseCaseLive(repository: repository)
    }

    @Test("Successful fetch and sorting of sections")
    func testFetchSectionsSuccessAndSorting() async throws {
        // Given
        let mockResponse = Stub.homeSectionResponse()
        repository.mockResult = { _ in mockResponse }

        // When
        let (sections, totalPages) = try await sut.fetchSections(page: nil)

        // Then
        #expect(sections.count == 7)
        #expect(sections[0].title == "Top Podcasts")
        #expect(sections[1].title == "Trending Episodes")
        #expect(totalPages == 10)
    }

    @Test("Propagates errors from repository")
    func testFetchSectionsThrowsError() async throws {
        // When
        repository.mockResult = { _ in throw NetworkError.invalidResponse }

        // Then
        await #expect(throws: NetworkError.self) {
            _ = try await self.sut.fetchSections(page: nil)
        }
    }

    @Test("Handles nil pagination object")
    func testFetchSectionsWithNilPagination() async throws {
        // Given
        let mockResponse = HomeSectionResponse(sections: [], pagination: nil)
        repository.mockResult = { _ in mockResponse }

        // When
        let (sections, totalPages) = try await sut.fetchSections(page: nil)

        // Then
        #expect(sections.isEmpty)
        #expect(totalPages == 0)
    }
}
