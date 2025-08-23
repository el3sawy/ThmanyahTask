//
//  SearchView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Combine
import Foundation
import Observation

@Observable
final class SectionSearchViewModel {

    // MARK: - Outputs
    private(set) var sections: [HomeSectionModel] = []
    private(set) var isLoading: Bool = false
    private(set) var errorMessage = ""

    var isErrorAlertPresented = false
    // MARK: - Inputs

    private(set) var searchText = CurrentValueSubject<String, Never>("")

    private let useCase: SearchUseCase
    private let fireAfter: Int
    private var subscriptions = Set<AnyCancellable>()

    init(
        useCase: SearchUseCase,
        fireAfter: Int =  300
    ) {
        self.useCase = useCase
        self.fireAfter = fireAfter
        search()
    }

    private func search() {
        searchText
            .map { $0.trimmed }
            .removeDuplicates()
            .debounce(for: .milliseconds(fireAfter), scheduler: DispatchQueue.main)
            .flatMap { [weak self] query -> AnyPublisher<[HomeSectionModel], Error> in
                guard let self = self  else {
                    return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
                }
                self.isLoading = true
                return self.useCase.search(query: query)
            }
            .receive(on: DispatchQueue.main)
            .sinkFailureOrValue { [weak self] error in
                self?.isLoading = false
                self?.errorMessage = error.localizedDescription
            } receiveValue: { [weak self] sections in
                self?.isLoading = false
                self?.sections = sections
            }
            .store(in: &subscriptions)
    }
}
