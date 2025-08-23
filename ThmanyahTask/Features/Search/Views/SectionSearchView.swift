//
//  SeactionSearchViewModel.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import SwiftUI
import ThmanyahUI

struct SectionSearchView: View {
    @State var viewModel: SectionSearchViewModel
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("Search")
        }
        .searchable(text: $searchText, prompt: "Search on Thmanyah")
        .onChange(of: searchText) { _, newValue in
            viewModel.searchText.send(newValue)
        }
        .alert(isPresented: $viewModel.isErrorAlertPresented) {
            Alert(title: Text("Something went wrong"), message: Text(viewModel.errorMessage))
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView {
                    Text("Loading")
                }
            }
        }
    }
    
    private var contentView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: .thmSpaces.space16) {
                ForEach(viewModel.sections) { section in
                    sectionView(section)
                }
            }
        }
    }
    
    private func sectionView(_ section: HomeSectionModel) -> some View {
        VStack(spacing: .thmSpaces.space10) {
            SearchHeaderView(title: section.title)
            ForEach(section.cards) { item in
                SearchView(model: item)
                    .padding(.horizontal, .thmSpaces.space16)
            }
        }
    }
}
