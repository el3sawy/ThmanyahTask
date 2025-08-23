//
//  DashboardUseCaseMock.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

@testable import ThmanyahTask

final class MockDashboardUseCase: DashboardUseCase {
    var mockResult: (Int?) throws -> ([HomeSectionModel], Int) = { page in
        return (Stub.sectionModels(), 1 )
    }

    func fetchSections(page: Int?) async throws -> ([HomeSectionModel], Int) {
        return try mockResult(page)
    }
}
