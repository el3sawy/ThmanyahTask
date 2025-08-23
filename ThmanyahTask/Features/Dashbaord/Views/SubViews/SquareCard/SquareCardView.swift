//
//  SquareCardView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct SquareCardView: View {
    let model: HomeItemModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RemoteImage(url: model.imageURL) { image in
                image
                    .resizable()
                    .clipShape(.rect(cornerRadius: 12))
            }
            
            VStack {
                Text(model.title)
                    .foregroundStyle(Color.thmColors.white)
                    .typography(.displaySmall)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.bottom, .leading], .thmSpaces.space10)
        }
        .frame(width: UIScreen.width * 0.6, height: UIScreen.width * 0.6)
    }
}

#Preview {
    SquareCardView(model: HomeItemModel.mock.first!)
}
