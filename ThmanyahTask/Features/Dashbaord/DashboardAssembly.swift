//
//  DashboardAssembly.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import Foundation

enum DashboardAssembly {
    static func makeView() -> DashboardView {
        let repository = DashboardRepositoryLive(networkService: NetworkServiceLive.shared)
        let useCase = DashboardUseCaseLive(repository: repository)
        let viewModel = DashboardViewModel(useCase: useCase)
        return DashboardView(viewModel: viewModel)
    }
}

