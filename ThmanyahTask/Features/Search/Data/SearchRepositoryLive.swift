//
//  SearchRepository.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Combine

final class SearchRepositoryLive: SearchRepository {
    // MARK: - Dependancies
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func search(query: String) -> AnyPublisher<HomeSectionResponse, Error> {
        networkService.request(endpoint: SearchRequest(query: query))
    }
}
