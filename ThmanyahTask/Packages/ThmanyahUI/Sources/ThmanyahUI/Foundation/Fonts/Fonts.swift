//
//  FontRegistrar.swift
//  ThmanyahUI
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import CoreText
import Foundation

public extension ThmanyahUI {
    struct Fonts {
        enum Variants: String, CaseIterable {
            case bold        = "IBMPlexSansArabic-Bold"
            case extraLight  = "IBMPlexSansArabic-ExtraLight"
            case light       = "IBMPlexSansArabic-Light"
            case medium      = "IBMPlexSansArabic-Medium"
            case regular     = "IBMPlexSansArabic-Regular"
            case semiBold    = "IBMPlexSansArabic-SemiBold"
            case text        = "IBMPlexSansArabic-Text"
            case thin        = "IBMPlexSansArabic-Thin"
        }
        
        public static func register() {
            for font in Variants.allCases {
                registerFont(name: font.rawValue)
            }
        }
        
        static func registerFont(name: String) {
            if let fontUrl = Bundle.module.url(forResource: name, withExtension: "otf"),
               let dataProvider = CGDataProvider(url: fontUrl as CFURL),
               let newFont = CGFont(dataProvider) {
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(newFont, &error) {
                    print("Error loading Font!")
                } else {
                }
            } else {
                assertionFailure("Error loading font")
            }
        }
    }
}
