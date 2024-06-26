import SwiftUI

struct MainView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    Text("Tic Tac Toe")
                        .font(.system(size: 45, weight: .bold))
                    
                    Image(isDarkMode ? "ticTacToeWhite" : "ticTacToeBlack")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                    
                    NavigationLink(
                        destination: EnterNameView(),
                        label: {
                            Text("Let's start!")
                                .font(.system(size: 30, weight: .bold))
                                .padding()
                                .padding(.horizontal, 50)
                                .background(Color("AdaptiveColor"))
                                .foregroundColor(isDarkMode ? .black : .white)
                                .cornerRadius(20)
                        }).padding(.top, 140)
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
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
        }.accentColor(Color("AdaptiveColor"))
    }
}

#Preview {
    MainView()
}
