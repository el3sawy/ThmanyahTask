//
//  Typography.swift
//  ThmanyahUI
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI

public extension ThmanyahUI {
    enum TypographyStyle {
        // Display
        case displayLarge, displayMedium, displaySmall
        // Headline
        case headlineLarge, headlineMedium, headlineSmall
        // Body
        case bodyLarge, bodyMedium, bodySmall
        // Label
        case labelLarge, labelSmall
        // Caption
        case caption
        
        var font: Font {
            switch self {
                // Display
            case .displayLarge: return .custom(Fonts.Variants.bold.rawValue, size: 34)
            case .displayMedium: return .custom(Fonts.Variants.semiBold.rawValue, size: 25)
            case .displaySmall: return .custom(Fonts.Variants.medium.rawValue, size: 24)
                
                // Headline
            case .headlineLarge: return .custom(Fonts.Variants.semiBold.rawValue, size: 20)
            case .headlineMedium: return .custom(Fonts.Variants.medium.rawValue, size: 18)
            case .headlineSmall: return .custom(Fonts.Variants.regular.rawValue, size: 16)
                
                // Body
            case .bodyLarge: return .custom(Fonts.Variants.regular.rawValue, size: 18)
            case .bodyMedium: return .custom(Fonts.Variants.regular.rawValue, size: 14)
            case .bodySmall: return .custom(Fonts.Variants.light.rawValue, size: 12)
                
                // Label
            case .labelLarge: return .custom(Fonts.Variants.medium.rawValue, size: 14)
            case .labelSmall: return .custom(Fonts.Variants.regular.rawValue, size: 12)
                
                // Caption
            case .caption: return .custom(Fonts.Variants.light.rawValue, size: 12)
            }
        }
    }
}

struct TypographyModifier: ViewModifier {
    let style: ThmanyahUI.TypographyStyle
    func body(content: Content) -> some View {
        content.font(style.font)
    }
}

extension View {
    public func typography(_ style: ThmanyahUI.TypographyStyle) -> some View {
        self.modifier(TypographyModifier(style: style))
    }
}
