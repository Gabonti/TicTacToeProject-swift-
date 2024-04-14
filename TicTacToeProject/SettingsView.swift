//
//  SettingsView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("This option puts the display into dark mode.")) {
                    Toggle(isOn: $isDarkMode, label: {
                        Text("Dark mode")
                    })
                }
                
                Section {
                    Button {
                        guard let url = URL(string: "https://www.instagram.com/gabdilkarim") else { return }
                        UIApplication.shared.open(url)
                    } label: {
                        Label("Follow me on inst @gabdilkarim", systemImage: "link")
                    }
                }
            }
            .foregroundColor(Color("AdaptiveColor"))
            .navigationTitle("Settings")
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    SettingsView()
}
