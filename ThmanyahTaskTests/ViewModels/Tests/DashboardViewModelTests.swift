//
//  DashboardViewModelTests.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import Testing
import Foundation
@testable import ThmanyahTask

@Suite("DashboardViewModel")
struct DashboardViewModelTests {

    private var useCase: MockDashboardUseCase!
    private var sut: DashboardViewModel!

    init() {
        self.useCase = MockDashboardUseCase()
        self.sut = DashboardViewModel(useCase: useCase)
    }

    @Test("Initial state is correct")
    func testInitialState() {
        #expect(sut.sections.isEmpty)
        #expect(sut.selectedSection.isEmpty)
        #expect(sut.sectionsTitle == ["ALL"])
        #expect(sut.errorMessage == nil)
        #expect(sut.isLoading == false)
    }

    @Test("fetchSections success")
    func testFetchSectionsSuccess() async throws {
        // Given
        let sections: [HomeSectionModel] = Stub.sectionModels()
        useCase.mockResult = { page in
            return (sections, 2)
        }
        // When
        await sut.fetchSections()

        // Then
        #expect(sut.sections.count == sections.count)
        #expect(sut.selectedSection.count == sections.count)
        #expect(sut.sectionsTitle == ["ALL", "Category A", "Category B", "Category C"])
        #expect(sut.errorMessage == nil)
        #expect(sut.isLoading == false)
    }

    @Test("fetchSections failure")
    func testFetchSectionsFailure() async throws {
        // Given
        struct TestError: LocalizedError {
            var errorDescription: String? { "Something went wrong." }
        }
        useCase.mockResult = { page in
            throw TestError()
        }

        // When
        await sut.fetchSections()

        // Then
        #expect(sut.errorMessage == "Something went wrong.")
        #expect(sut.sections.isEmpty)
        #expect(sut.selectedSection.isEmpty)
        #expect(sut.isLoading == false)
    }

    @Test("loadMore appends new data")
    func testLoadMore() async throws {
        // Given
        useCase.mockResult = { page in
            if page == nil {
                return ([Stub.sectionModels()[0]], 2)
            } else if page == 2 {
                return ([Stub.sectionModels()[1]], 2)
            }
            return ([], 2)
        }

        // When
        await sut.fetchSections()
        await sut.loadMore()

        // Then
        #expect(sut.sections.count == 2)
        #expect(sut.sections[0].title == "Category A")
        #expect(sut.sections[1].title == "Category B")
    }

    @Test("loadMore does nothing when no more pages")
    func testLoadMoreDoesNothingWhenNoMorePages() async throws {
        // Given
        useCase.mockResult = { page in
            return ( Stub.sectionModels(), 1)
        }

        // When
        await sut.fetchSections()
        await sut.loadMore()

        // Then
        #expect(sut.sections.count == 3)
    }

    @Test("getSelectSection filters correctly")
    func testGetSelectSectionFiltersCorrectly() async throws {
        // Given
        let sections: [HomeSectionModel] = Stub.sectionModels()

        useCase.mockResult = { page in
            return (sections, 1)
        }
        await sut.fetchSections()
        // When
        sut.getSelectSection(at: "Category A")

        // Then
        #expect(sut.selectedSection.count == 1)
        #expect(sut.selectedSection.allSatisfy { $0.title == "Category A" })
        #expect(sut.selectedSection[0].cards.count == 2)
        #expect(sut.selectedSection[0].cards[0].title == "PR Politics" )

        // When: select ALL
        sut.getSelectSection(at: "ALL")
        #expect(sut.selectedSection.count == 3)
    }
}

