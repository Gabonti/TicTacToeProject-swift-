import SwiftUI

struct GameView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    @ObservedObject var gameState = GameViewModel(firstPlayer: "First player", secondPlayer: "Second player")
    @State var isClosedGame = false
    
    var body: some View {
        let borderSize = CGFloat(5)
        
        HStack {
            Button {
                isClosedGame.toggle()
            } label: {
                    Text("Exit")
                        .font(.system(size: 15, weight: .bold))
                        .padding(7)
                        .padding(.horizontal, 20)
                        .background(Color("AdaptiveColor"))
                        .foregroundColor(isDarkMode ? .black : .white)
                        .cornerRadius(15)
                }.padding()
            Spacer()
        }
        
        Text(gameState.turnText())
            .font(.system(size: 30, weight: .bold))
            .padding()
        
        HStack {
            Text(String(format: "\(gameState.firstPlayer.name): %d", gameState.crossesScore))
                .font(.system(size: 30, weight: .bold))
                .padding()
            
            Text(String(format: "\(gameState.secondPlayer.name): %d", gameState.noughtsScore))
                .font(.system(size: 30, weight: .bold))
                .padding()
        }
        
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self) {
                row in
                HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(isDarkMode ? .white : .black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(isDarkMode ? .black : .white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(isDarkMode ? .white : .black)
        .padding()
        .alert(isPresented: $gameState.showAlert, content: {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Okay")) {
                    gameState.resetBoard()
                }
            )
        })
        .fullScreenCover(isPresented: $isClosedGame) {
            MainView()
        }
        
        Button(action: {
            gameState.resetGame()
        }, label: {
            Text("Reset game")
                .font(.system(size: 15, weight: .bold))
                .padding(15)
                .padding(.horizontal, 20)
                .background(Color("AdaptiveColor"))
                .foregroundColor(isDarkMode ? .black : .white)
                .cornerRadius(15)
        }).padding(.top, 10)
        
        Spacer()
    }
}

#Preview {
    GameView(gameState: GameViewModel(firstPlayer: "First player", secondPlayer: "Second player"))
}
