import Foundation

struct Cell {
    
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile) {
        case Tile.Nought: return "O"
        case Tile.Cross: return "X"
        default: return ""
        }
    }
}

enum Tile {
    case Nought
    case Cross
    case Empty
}
