//
//  DashbaordView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct DashboardView: View {
    let viewModel: DashboardViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            if !viewModel.isLoading {
                contentView
            }
        }
        .padding(.top, .thmSpaces.space2)
        .task {
            await viewModel.fetchSections()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }

    private var contentView: some View {
        LazyVStack(spacing: .thmSpaces.space32) {
            ListCategoryView(sections: viewModel.sectionsTitle) { index in
                viewModel.getSelectSection(at: index)
            }

            ForEach(viewModel.selectedSection) { section in
                sectionView(section: section)
                    .id(section.id)
                    .onAppear {
                        if section.id == viewModel.selectedSection.last?.id {
                            Task { await viewModel.loadMore() }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private func sectionView(section: HomeSectionModel) -> some View {
        switch section.type {
        case .bigSquare:
            ListSquareCardView(section: section)
        case .queue:
            ListQueuePodcastView(section: section)
        case .square:
            ListSquareCardView(section: section)
        case .twoLinesGrid:
            ListHorizontalPodcastView(section: section)
        }
    }
}
