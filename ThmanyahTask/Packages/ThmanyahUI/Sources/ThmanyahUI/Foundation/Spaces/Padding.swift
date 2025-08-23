//
//  Padding.swift
//  ThmanyahUI
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI

public extension ThmanyahUI {
    struct Spaces: Sendable {
        fileprivate init() {}
        public let space2: CGFloat = 2
        public let space4: CGFloat = 4
        public let space8: CGFloat = 8
        public let space10: CGFloat = 10
        public let space12: CGFloat = 12
        public let space16: CGFloat = 16
        public let space24: CGFloat = 24
        public let space32: CGFloat = 32
        public let space36: CGFloat = 36
        public let space40: CGFloat = 40
        public let space48: CGFloat = 48
    }
    
    static let spaces = ThmanyahUI.Spaces()
}

public extension CGFloat {
    static let thmSpaces = ThmanyahUI.spaces
}
