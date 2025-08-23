//
//  MainTabBar.swift
//  ThmanyahTask
//
//  Created by Ahmed Naguib  on 23/08/2025.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            DashboardAssembly.makeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SearchAssembly.makeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MainTabBar()
}
