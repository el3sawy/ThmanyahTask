//
//  SectionHeader.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct SectionHeaderView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .typography(.displayMedium)
            Spacer()
            Image(systemName: "chevron.compact.forward")
            
        }
        .foregroundStyle(Color.thmColors.white)
        .padding(.vertical, .thmSpaces.space4)
        .padding(.horizontal, .thmSpaces.space16)
        .background(Color.thmColors.header)
    }
}

#Preview {
    SectionHeaderView(title: "The latest news in five minutes.")
}
