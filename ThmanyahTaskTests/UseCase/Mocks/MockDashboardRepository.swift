//
//  DashboardRepositoryLiveMock.swift
//  ThmanyahTaskTests
//
//  Created by Ahmed Naguib  on 22/08/2025.
//

import Foundation
@testable import ThmanyahTask

final class MockDashboardRepository: DashboardRepository {
    var mockResult: ((Int?) throws -> HomeSectionResponse)?

    func fetchSections(page: Int?) async throws -> HomeSectionResponse {
        guard let mockResult = mockResult else {
            return HomeSectionResponse(sections: [], pagination: .init(nextPage: nil, totalPages: 1))
        }
        return try mockResult(page)
    }
}
