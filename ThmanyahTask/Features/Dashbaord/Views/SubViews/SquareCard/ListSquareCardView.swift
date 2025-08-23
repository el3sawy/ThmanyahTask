//
//  ListSquareCardView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct ListSquareCardView: View {
    let section: HomeSectionModel
    var body: some View {
        VStack(spacing: .thmSpaces.space10) {
            SectionHeaderView(title: section.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .thmSpaces.space16) {
                    ForEach(section.cards) { item in
                        SquareCardView(model: item)
                    }
                    Spacer()
                }
                .padding(.horizontal, .thmSpaces.space16)
            }
        }
    }
}

#Preview {
    ListSquareCardView(section: HomeSectionModel.mock)
}
