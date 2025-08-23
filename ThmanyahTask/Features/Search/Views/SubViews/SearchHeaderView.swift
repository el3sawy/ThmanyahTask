//
//  SearchHeaderView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import SwiftUI
import ThmanyahUI

struct SearchHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.thmColors.white)
            .typography(.displaySmall)
            .padding(.vertical, .thmSpaces.space4)
            .padding(.horizontal, .thmSpaces.space16)
            .background(Color.thmColors.header)
    }
}

#Preview {
    SearchHeaderView(title: "Hello Thmanyah ")
}
