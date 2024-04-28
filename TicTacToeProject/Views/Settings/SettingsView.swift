//
//  SettingsView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            List {
                if let user = viewModel.currentUser {
                    Section {
                        NavigationLink {
                            ProfileView()
                        } label: {
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
                    }
                }
                
                Section(header: Text("General"), footer: Text("This option puts the display into dark mode.")) {
                    
                    Toggle(isOn: $isDarkMode, label: {
                        Text("Dark mode")
                    }).tint(.gray)
                    
                    HStack {
                        Label("Version", systemImage: "gear")
                        
                        Spacer()
                        
                        Text("1.0")
                            .font(.subheadline)
                    }
                }
                
                Section("Links") {
                    NavigationLink(
                        destination: ApiView(),
                        label: {
                            Label("Quotes(API)", systemImage: "message")
                        })
                    
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
