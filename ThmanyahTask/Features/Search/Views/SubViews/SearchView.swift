//
//  SearchView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 22/08/2025.
//

import SwiftUI
import ThmanyahUI

struct SearchView: View {
    let model: HomeItemModel
    
    var body: some View {
        HStack(spacing: .thmSpaces.space12) {
            RemoteImage(url: model.imageURL) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                Color.thmColors.lightGray
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }

            VStack(alignment: .leading, spacing: .thmSpaces.space10) {
                Text(model.title)
                    .lineLimit(1)
                    .typography(.bodyLarge)
                    .foregroundStyle(Color.thmColors.white)
                Text(model.duration ?? "")
                    .typography(.bodySmall)
                    .foregroundStyle(Color.thmColors.lightGray)
            }
            Spacer()
        }
        .padding(.thmSpaces.space8)
        .background(Color.thmColors.slider)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    SearchView(model: HomeItemModel.mock.first!)
}
