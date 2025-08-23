//
//  ListHorizontalPodcastView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI

struct ListHorizontalPodcastView: View {
    private let podcastRows = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
    let section: HomeSectionModel
    var body: some View {
        VStack(spacing: .thmSpaces.space10) {
            SectionHeaderView(title: section.title)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: podcastRows, spacing: 16) {
                    ForEach(section.cards) { item in
                        HorizontalPodcastView(model: item)
                            .frame(width: UIScreen.width * 0.85)
                    }
                }
                .padding(.horizontal, .thmSpaces.space16)
            }
            .frame(height: 220)
        }
    }
}

#Preview {
    ListHorizontalPodcastView(section: HomeSectionModel.mock)
}
