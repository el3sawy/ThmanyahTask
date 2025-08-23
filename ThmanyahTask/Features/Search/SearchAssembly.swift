//
//  SearchAssembly.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

enum SearchAssembly {
    static func makeView() -> SectionSearchView {
        let networkService = NetworkServiceLive.shared
        let repository = SearchRepositoryLive(networkService: networkService)
        let useCase = SearchUseCaseLive(repository: repository)
        let viewModel = SectionSearchViewModel(useCase: useCase)
        return SectionSearchView(viewModel: viewModel)
    }
}
