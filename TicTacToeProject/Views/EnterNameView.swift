import SwiftUI

struct EnterNameView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    @State var firstPlayer = ""
    @State var secondPlayer = ""
    @State var isShowedGame = false
    @State var showAlert = false
    @State private var viewModel: GameViewModel? = nil
    
    var body: some View {
        VStack {
            Text("Enter your name")
                .font(.system(size: 45, weight: .bold))
            
            Section(footer: Text("Reminder!\nIf you want to start with \"X\", write your name first!")) {
                PlayerTextField(placeHolder: "First player's name", player: $firstPlayer)
                
                PlayerTextField(placeHolder: "Second player's name", player: $secondPlayer)
            }.font(.system(size: 14, weight: .bold))
            
            Button {
                if firstPlayer.isEmpty || secondPlayer.isEmpty {
                    showAlert = true
                } else {
                    isShowedGame.toggle()
                }
            } label: {
                Text("Play")
                    .font(.system(size: 30, weight: .bold))
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color("AdaptiveColor"))
                    .foregroundColor(isDarkMode ? .black : .white)
                    .cornerRadius(20)
            }.padding(.top, 85)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onChange(of: firstPlayer) { oldValue, newValue in
            viewModel = GameViewModel(firstPlayer: newValue, secondPlayer: secondPlayer)
        }
        .onChange(of: secondPlayer) { oldValue, newValue in
            viewModel = GameViewModel(firstPlayer: firstPlayer, secondPlayer: newValue)
        }
        .fullScreenCover(isPresented: $isShowedGame) {
            GameView(gameState: GameViewModel(firstPlayer: firstPlayer, secondPlayer: secondPlayer))
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Please enter name before starting the game"), dismissButton: .default(Text("OK")))
        }
    }
}

struct PlayerTextField: View {
    
    var placeHolder : String
    @State var player : Binding<String>
    
    var body: some View {
        TextField(placeHolder, text: player)
            .padding()
            .font(.system(size: 20))
            .background(.gray)
            .cornerRadius (12)
            .padding()
    }
}

#Preview {
    EnterNameView()
}
