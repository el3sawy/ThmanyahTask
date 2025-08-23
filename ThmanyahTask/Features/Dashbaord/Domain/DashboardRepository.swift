//
//  DashboardRepository.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import Foundation

protocol DashboardRepository {
    func fetchSections(page: Int?) async throws -> HomeSectionResponse
}
