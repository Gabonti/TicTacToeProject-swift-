//
//  GamePlayView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 14.04.2024.
//

import SwiftUI

struct GamePlayView: View {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    let borderSize = CGFloat(5)
    var body: some View {
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self) {
                row in
                HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        column in
                        
                        Text("X")
                            .font(.system(size: 60, weight: .bold))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(isDarkMode ? .white : .black)
                            .background(isDarkMode ? .black : .white)
                    }
                }
            }
        }
        .background(isDarkMode ? .white : .black)
        .padding()
    }
}

#Preview {
    GamePlayView()
}
