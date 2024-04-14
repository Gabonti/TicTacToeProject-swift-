import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Tic Tac Toe")
                    .font(.system(size: 45, weight: .bold))
                
                Image("ticTacToe")
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
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }) .padding(.top, 140)
            }
        }
    }
}

#Preview {
    MainMenuView()
}
