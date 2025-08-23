//
//  VerticalPodcastView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct QueuePodcastView: View {
    let model: HomeItemModel
    var body: some View {
        VStack(alignment: .leading, spacing: .thmSpaces.space4) {
            RemoteImage(url: model.imageURL) { image in
                image
                    .resizable()
                    .frame(height: UIScreen.width / 2.6)
                    .clipShape(.rect(cornerRadius: 12))
            }
            
            Text(model.title)
                .typography(.bodyMedium)
                .foregroundStyle(Color.thmColors.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            dateView
        }
        .frame(width: UIScreen.width / 2.4)
    }
    
    private var dateView: some View {
        HStack(alignment: .center, spacing: .thmSpaces.space4) {
            if let date = model.date {
                Text(date)
                    .typography(.caption)
                    .foregroundStyle(Color.thmColors.lightGray)
                Spacer()
            }

            if let duration = model.duration {
                PlayAudioButton(duration: duration)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
    }
}

#Preview {
    QueuePodcastView(model: HomeItemModel.mock.first!)
}
