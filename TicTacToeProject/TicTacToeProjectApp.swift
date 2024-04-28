//
//  TicTacToeProjectApp.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI
import Firebase

@main
struct TicTacToeProjectApp: App {
    @AppStorage("isDarkMode") var isDarkMode = false
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(viewModel)
        }
    }
}
