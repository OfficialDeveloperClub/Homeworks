import CoreFoundation
import CoreServices

class Board: CustomStringConvertible {
    let size = 3
    private(set) var position: [[Int]] = []
    
    init() {
        position = Array(repeating: Array(repeating: 0, count: size), count: size)
    }
    
    func makeMove(_ x: Int, _ y: Int, player: Int) {
        position[x][y] = player
    }
    
    var avaliableMoves: [(Int, Int)] {
        var moves: [(Int, Int)] = []
        for i in 0 ..< size {
            for j in 0 ..< size {
                if position[i][j] == 0 {
                    moves.append((i, j))
                }
            }
        }
        return moves
    }
    
    var description: String {
        var str = "-------\n"
        for i in 0 ..< size {
            str += "|"
            for j in 0 ..< size {
                switch position[i][j] {
                case 1: str += "X"
                case 2: str += "O"
                default: str += " "
                }
                str += "|"
            }
            str += "\n-------\n"
        }
        return str
    }
}

protocol Engine {
    func makeBestMove(on board: Board, player: Int)
}

protocol Checker {
    // returns 1 (or 2) if player 1 (2) won
    // returns 0 if that is a draw
    // returns -1 if game should continue
    func checkGameStatus(on board: Board) -> Int
}

protocol BoardGame {
    var board: Board { get set }
    var engine: Engine { get }
    var checker: Checker { get }
    var activePlayer: Int { get set }
    func makeEngineMove()
    
    init(engine: Engine, checker: Checker)
}

class GameChecker: Checker {
    func checkGameStatus(on board: Board) -> Int {
        // check rows
        for i in 0 ..< board.size {
            let player = board.position[i][0]
            var win = true
            if player == 0 {
                continue
            }
            for j in 0 ..< board.size {
                if board.position[i][j] != player {
                    win = false
                    break
                }
            }
            if win {
                return player
            }
        }
        
        // check columns
        for i in 0 ..< board.size {
            let player = board.position[0][i]
            var win = true
            if player == 0 {
                continue
            }
            for j in 0 ..< board.size {
                if board.position[j][i] != player{
                    win = false
                    break
                }
            }
            if win {
                return player
            }
        }
        
        // check diagonal (\)
        var player = board.position[0][0]
        if player != 0 {
            var win = true
            for i in 0 ..< board.size {
                if board.position[i][i] != player {
                    win = false
                    break
                }
            }
            if win {
                return player
            }
        }
        
        // check diagonal (/)
        player = board.position[board.size - 1][0]
        if player != 0 {
            var win = true
            for i in 0 ..< board.size {
                if board.position[board.size - i - 1][i] != player {
                    win = false
                    break
                }
            }
            if win {
                return player
            }
        }
        // check if game is other
        if (board.avaliableMoves.count == 0) {
            // that is draw
            return 0
        }
        else {
            // there are moves to play
            return -1
        }
    }
}


class GameEngine: Engine {
    func makeBestMove(on board: Board, player: Int) {
        let move = board.avaliableMoves.randomElement()!
        board.makeMove(move.0, move.1, player: player)
    }
}

class TicTacToe: BoardGame {
    
    var status: Bool = true
    
    var board: Board = Board()
    
    var engine: Engine
    
    var checker: Checker
    
    var activePlayer: Int = 1
    
    func makeEngineMove() {
        status = true
        engine.makeBestMove(on: board, player: activePlayer)
        print(board)
        if checkStatus() {
            status = false
            board = Board()
            return
        }
        activePlayer = activePlayer % 2 + 1
    }
    
    func checkStatus() -> Bool {
        switch checker.checkGameStatus(on: board) {
        case 1:
            print("Crosses won!")
            return true
        case 2:
            print("Zeroes won!")
            return true
        case 0:
            print("It is a draw!")
            return true
        default:
            return false
        }
    }
    
    required init(engine: Engine, checker: Checker) {
        self.engine = engine
        self.checker = checker
    }
}

let game = TicTacToe(engine: GameEngine(), checker: GameChecker())

while game.status {
    game.makeEngineMove()
}
// Sample output
//-------
//| | | |
//-------
//| | | |
//-------
//| |X| |
//-------
//
//-------
//| | |O|
//-------
//| | | |
//-------
//| |X| |
//-------
//
//-------
//| |X|O|
//-------
//| | | |
//-------
//| |X| |
//-------
//
//-------
//| |X|O|
//-------
//| |O| |
//-------
//| |X| |
//-------
//
//-------
//|X|X|O|
//-------
//| |O| |
//-------
//| |X| |
//-------
//
//-------
//|X|X|O|
//-------
//| |O| |
//-------
//| |X|O|
//-------
//
//-------
//|X|X|O|
//-------
//| |O| |
//-------
//|X|X|O|
//-------
//
//-------
//|X|X|O|
//-------
//|O|O| |
//-------
//|X|X|O|
//-------
//
//-------
//|X|X|O|
//-------
//|O|O|X|
//-------
//|X|X|O|
//-------
//
//It is a draw!
