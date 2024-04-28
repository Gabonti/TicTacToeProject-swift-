//
//  ProfileView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 28.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(isDarkMode ? .black : .white)
                            .frame(width: 72, height: 72)
                            .background(Color("AdaptiveColor"))
                            .cornerRadius(100)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(Color("AdaptiveColor"))
                        }
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        Label("Sign Out", systemImage: "arrow.left.circle.fill")
                    }
                    
                    Button {
                        Task {
                             await viewModel.deleteAccount()
                        }
                    } label: {
                        Label("Delete Account", systemImage: "xmark.circle.fill")
                    }
                }
            }.foregroundColor(Color("AdaptiveColor"))
        }
    }
}

#Preview {
    ProfileView()
}
