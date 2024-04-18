//
//  GamePlayView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

struct GamePlayView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    @StateObject var gameState = GameState()
    
    var body: some View {
        let borderSize = CGFloat(5)
        
        Text(gameState.turnText())
            .font(.system(size: 30, weight: .bold))
            .padding()
        
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
    }
}

#Preview {
    GamePlayView()
}
