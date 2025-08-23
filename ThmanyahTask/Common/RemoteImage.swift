//
//  RemoteImage.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI
import SDWebImageSwiftUI

public struct RemoteImage<I: View, P: View>: View {
    // MARK: - Dependancies
    
    private let url: URL?
    private let content: (Image) -> I
    private let placeholder: (() -> P)?
    
    // MARK: - Init
    
    public init(
        url: String?,
        @ViewBuilder content: @escaping (Image) -> I,
        @ViewBuilder placeholder: @escaping () -> P
    ) {
        self.url = URL(string: url ?? "")
        self.content = content
        self.placeholder = placeholder
    }
    
    public init(
        url: String?,
        @ViewBuilder content: @escaping (Image) -> I
    ) where P == EmptyView {
        self.url = URL(string: url ?? "")
        self.content = content
        self.placeholder = nil
    }
    
    public var body: some View {
        WebImage(url: url, content: content) {
            // Placeholder for image
            if let placeholder {
                placeholder()
            } else {
                Color.thmColors.lightGray
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    VStack {
        let url = "https://media.npr.org/assets/img/2024/01/11/podcast-politics_2023_update1_sq-be7ef464dd058fe663d9e4cfe836fb9309ad0a4d.jpg?s=1400&c=66&f=jpg"
        RemoteImage(url: url) { image in
            image
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(.rect(cornerRadius: 10))
        }
        
        RemoteImage(url: "Invalid URL") { image in
            image
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(.rect(cornerRadius: 10))
        } placeholder: {
            Color.red
                .frame(width: 200, height: 200)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}
