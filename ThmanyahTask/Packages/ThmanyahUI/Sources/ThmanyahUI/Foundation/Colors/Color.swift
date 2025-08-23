//
//  File.swift
//  ThmanyahUI
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI

public extension ThmanyahUI {
    struct Colors: Sendable {
        fileprivate init() {}
       
        public let slider = Color(hexString: "#1D1E29")
        public let red = Color.red
        public let white = Color(hexString: "#FFFFFF")
        public let darkGray = Color(hexString: "#212121")
        public let lightGray = Color(hexString: "#B3B3B3")
        public let header = Color(hexString: "#1C1C1E")

    }
    static let colors = ThmanyahUI.Colors()
}

public extension Color {
    static let thmColors = ThmanyahUI.colors
}
