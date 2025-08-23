//
//  ThmanyahTaskApp.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib on 21/08/2025.
//

import SwiftUI
import ThmanyahUI

@main
struct ThmanyahTaskApp: App {
    
    init() {
        ThmanyahUI.Fonts.register()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabBar()
        }
    }
}
