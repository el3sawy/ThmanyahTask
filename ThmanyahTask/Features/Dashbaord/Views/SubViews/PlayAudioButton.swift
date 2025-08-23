//
//  PlayAudioButton.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

struct PlayAudioButton: View {
    let duration: String
    var body: some View {
        HStack(spacing: .thmSpaces.space2) {
            Image(systemName: "play.fill")
            Text(duration)
        }
        .typography(.labelSmall)
        .foregroundStyle(Color.thmColors.white)
        .padding(.vertical, .thmSpaces.space4)
        .padding(.horizontal, .thmSpaces.space10)
        .background(Color.thmColors.darkGray)
        .clipShape(.capsule)
    }
}

#Preview {
    ZStack {
        Color.black
        PlayAudioButton(duration: "10h 30m")
    }
}

