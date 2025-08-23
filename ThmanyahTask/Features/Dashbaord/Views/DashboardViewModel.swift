//
//  DashbaordViewModel.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Foundation
import Observation

@Observable
final class DashboardViewModel {
    // MARK: - Private Properties
    private var currentPage = 1
    private var totalPages = 1
    private var selectedCategory = ""

    // MARK: - Outputs
    
    private(set) var sections: [HomeSectionModel] = []
    private(set) var selectedSection: [HomeSectionModel] = []
    private(set) var sectionsTitle: [String] = ["ALL"]
    private(set) var errorMessage: String? = nil
    private(set) var isLoading: Bool = false
    
    // MARK: - Dependancies
    
    private let useCase: DashboardUseCase
    
    // MARK: - Init
    
    init(useCase: DashboardUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Actions
    
    @MainActor
    func fetchSections() async {
        guard sections.isEmpty else {
            return
        }
        isLoading = true
        defer { isLoading = false }
        
        do {
            (sections, totalPages) = try await useCase.fetchSections(page: nil)
            selectedSection = sections
            sectionsTitle.append(contentsOf: sections.map(\.title))
            errorMessage = nil
            
        } catch {
            errorMessage = error.localizedDescription
            sections = []
        }
    }
    
    @MainActor
    func loadMore() async {
        currentPage += 1
        guard currentPage <= totalPages else {
            return
        }
        
        if let (newSections, total) = try? await useCase.fetchSections(page: currentPage) {
            totalPages = total
            sections.append(contentsOf: newSections)
            if selectedCategory != sectionsTitle.first {
                selectedSection = sections.filter { $0.title == selectedCategory }
            } else {
                selectedSection = sections
            }
        }
    }
    
    func getSelectSection(at categoryName: String) {
        // Need to set category type ID to match with it.
        self.selectedCategory = categoryName
        let filteredSections = sections.filter { $0.title == categoryName }
        selectedSection = filteredSections.isEmpty ? sections : filteredSections
    }
}
