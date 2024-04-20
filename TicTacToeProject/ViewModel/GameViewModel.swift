import Foundation

class GameViewModel: ObservableObject {
    @Published var firstPlayer: Player
    @Published var secondPlayer: Player
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var noughtsScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    
    init(firstPlayer: String, secondPlayer: String) {
        self.firstPlayer = Player(name: firstPlayer)
        self.secondPlayer = Player(name: secondPlayer)
        resetBoard()
    }
    
    func turnText() -> String {
        return turn == Tile.Cross ? "\(firstPlayer.name)'s turn" : "\(secondPlayer.name)'s turn"
    }
    
    func placeTile(_ row: Int, _ column: Int) {
        if(board[row][column].tile != Tile.Empty) {
            return
        }
        
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        if checkForVictory() {
            if(turn == Tile.Cross) {
                crossesScore += 1
            } else {
                noughtsScore += 1
            }
            
            let winner = turn == Tile.Cross ? firstPlayer.name : secondPlayer.name
            alertMessage = "\(winner) wins!"
            showAlert = true
        } else {
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        
        if checkFowDraw() {
            alertMessage = "Draw"
            showAlert = true
        }
    }
    
    func checkFowDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell.tile == Tile.Empty || checkForVictory() == true {
                    return false
                }
            }
        }
        
        return true
    }
    
    func checkForVictory() -> Bool {
        // vertical victory
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0) {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1) {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2) {
            return true
        }

        // horizontal victory
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2) {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2) {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2) {
            return true
        }

        // diagonal victory
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2) {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0) {
            return true
        }
        
        return false
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        return board[row][column].tile == turn
    }
    
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    
    func resetGame() {
        crossesScore = 0
        noughtsScore = 0
    }
}
