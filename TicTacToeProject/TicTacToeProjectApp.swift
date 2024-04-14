//
//  TicTacToeProjectApp.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

@main
struct TicTacToeProjectApp: App {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
