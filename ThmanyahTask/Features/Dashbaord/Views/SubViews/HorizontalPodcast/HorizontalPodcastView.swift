//
//  HorizontalPodcastView.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct HorizontalPodcastView: View {
    // MARK: - Dependancies
    
    let model: HomeItemModel
    
    var body: some View {
        HStack(spacing: .thmSpaces.space12) {
            image
            infoView
        }
    }
    
    private var image: some View {
        RemoteImage(url: model.imageURL) { image in
            image
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 12))
        }
    }
    
    private var infoView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if let date = model.date {
                Text(date)
                    .typography(.caption)
                    .foregroundStyle(Color.thmColors.lightGray)
                Spacer()
            }
            
            Text(model.title)
                .typography(.bodyMedium)
                .foregroundStyle(Color.thmColors.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            Spacer()
            if let duration = model.duration {
                PlayAudioButton(duration: duration)
            }
        }
        .padding(.vertical, .thmSpaces.space4)
    }
}

#Preview {
    ZStack {
        Color.black
        HorizontalPodcastView(model:
                HomeItemModel(
                    title: "PR Politics Live From Cleveland",
                    imageURL: "https://media.npr.org/assets/img/2024/01/11/podcast-politics_2023_update1_sq-be7ef464dd058fe663d9e4cfe836fb9309ad0a4d.jpg?s=1400&c=66&f=jpg",
                    date: "10-10-2020",
                    duration: "10h 30m"
                )
        )
        .frame(height: 80)
    }
}
