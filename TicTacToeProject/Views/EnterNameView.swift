import SwiftUI

struct EnterNameView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    @State var firstPlayer = ""
    @State var secondPlayer = ""
    
    var body: some View {
        VStack {
            Text("Enter your name")
                .font(.system(size: 45, weight: .bold))
            
            Section(footer: Text("Reminder!\nIf you want to start with \"X\", write your name first!")) {
                PlayerTextField(placeHolder: "First player's name", player: $firstPlayer)
                
                PlayerTextField(placeHolder: "Second player's name", player: $secondPlayer)
            }.font(.system(size: 14, weight: .bold))
            
            NavigationLink(
                destination: GamePlayView(),
                label: {
                    Text("Play")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color("AdaptiveColor"))
                        .foregroundColor(isDarkMode ? .black : .white)
                        .cornerRadius(20)
                }).padding(.top, 140)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
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
