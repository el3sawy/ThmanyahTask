//
//  DashboardRepositoryLive.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

final class DashboardRepositoryLive: DashboardRepository {
    // MARK: - Dependancies
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchSections(page: Int?) async throws -> HomeSectionResponse {
        try await networkService.request(endpoint: HomeSectionRequest(page: page))
    }
}
