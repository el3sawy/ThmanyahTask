//
//  DashboardUseCase.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

protocol DashboardUseCase {
    func fetchSections(page: Int?) async throws -> ([HomeSectionModel], Int)
}

final class DashboardUseCaseLive: DashboardUseCase, SectionMapper {
    // MARK: - Dependancies
    
    private let repository: DashboardRepository
    
    // MARK: - Init
    
    init(repository: DashboardRepository) {
        self.repository = repository
    }
    
    func fetchSections(page: Int?) async throws -> ([HomeSectionModel], Int) {
        let response = try await repository.fetchSections(page: page)
        let sections = map(response: response)
        return (sections, response.pagination?.totalPages ?? 0)
    }
    
    private func map(response: HomeSectionResponse) -> [HomeSectionModel] {
        let sortedSections = response.sections?.sorted {
            ($0.order?.intValue ?? 0) < ($1.order?.intValue ?? 0)
        } ?? []
        return sortedSections.map(map)
    }
}
