//
//  SectionsView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct ListCategoryView: View {
    // MARK: - Private Properties
    
    @State private var selectedItem: String?
    
    // MARK: - Dependancies
    
    let sections: [String]
    let onSelect: (String) -> Void
    init(
        selectedItem: String? = nil,
        sections: [String],
        onSelect: @escaping (String) -> Void
    ) {
        self.selectedItem = selectedItem
        self.sections = sections
        self.onSelect = onSelect
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .thmSpaces.space12) {
                    ForEach(sections, id: \.self) { section in
                        getSectionView(section, isSelected: section == selectedItem)
                            .id(selectedItem)
                            .onTapGesture {
                                select(section, proxy: proxy)
                            }
                    }
                }
            }
            .animation(.smooth, value: selectedItem)
            .onAppear {
                if selectedItem == nil {
                    select(sections.first ?? "ALL", proxy: proxy)
                }
            }
        }
    }
    
    private func select(_ item: String, proxy: ScrollViewProxy) {
        selectedItem = item
        onSelect(item)
        withAnimation {
            proxy.scrollTo(item, anchor: .center)
        }
    }
    
    private func getSectionView(
        _ section: String,
        isSelected: Bool
    ) -> some View {
        Text(section)
            .foregroundStyle(Color.thmColors.white)
            .typography(.bodyLarge)
            .padding(.horizontal, .thmSpaces.space12)
            .padding(.vertical, .thmSpaces.space10)
            .background(isSelected ? Color.thmColors.red : Color.thmColors.slider)
            .clipShape(.capsule)
    }
}

#Preview {
    ListCategoryView(sections: ["Ahmed", "Naguib", "Mohamed"]) { _ in}
}
