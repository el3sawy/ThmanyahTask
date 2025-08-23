//
//  SearchUseCase.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Combine

protocol SearchUseCase {
    func search(query: String) -> AnyPublisher<[HomeSectionModel], Error>
}

final class SearchUseCaseLive: SectionMapper, SearchUseCase {
    // MARK: - Dependancies
    
    private let repository: SearchRepository
    
    // MARK: - Init
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
    
    func search(query: String) -> AnyPublisher<[HomeSectionModel], Error> {
        repository.search(query: query)
            .map { [weak self] response in
                guard let self else { return [] }
                return response.sections?.compactMap(self.map(_:)) ?? []
            }
            .eraseToAnyPublisher()
    }
}
