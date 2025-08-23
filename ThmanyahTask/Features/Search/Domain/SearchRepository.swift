//
//  SearchRepository.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Combine

protocol SearchRepository {
    func search(query: String) -> AnyPublisher<HomeSectionResponse, Error>
}
