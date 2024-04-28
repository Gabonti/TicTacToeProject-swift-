//
//  ContentView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 28.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
            MainView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
