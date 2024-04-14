//
//  TabBar.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        TabView {
            MainMenuView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Main menu")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(Color("AdaptiveColor"))
        
    }
}

#Preview {
    TabBarView()
}
