//
//  Matrix 01.swift
//  Algos
//
//  Created by vinay kamra on 30/07/25.
//



public class Matrix01 {
    
    public init() {
        
    }
    public func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let rows = mat.count
        let cols = mat[0].count
        
        var queue = [(Int, Int)]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 0 {
                    queue.append((i, j))
                } else {
                    mat[i][j] = Int.max
                }
            }
        }

        let directions = [(0,1), (1,0), (0,-1), (-1,0)]

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            for (dx, dy) in directions {
                let nx = x + dx
                let ny = y + dy

                if nx >= 0, ny >= 0, nx < rows, ny < cols,
                   mat[nx][ny] > mat[x][y] + 1 {
                    print(mat[nx][ny], mat[x][y])
                    mat[nx][ny] = mat[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }

        return mat
    }

}


public class SurroundedRegion {

    public init(rows: Int = 0, cols: Int = 0) {
        self.rows = rows
        self.cols = cols
    }
    
    var rows = 0
    var cols = 0
    public func solve(_ board: inout [[Character]]) {
        if board.count == 0 {return}
        rows = board.count
        cols = board[0].count
        var visited: [[Bool]]  = Array(repeating: Array(repeating: false,
                                                count: board[0].count),
                                        count: board.count )

        for i in 0 ..< rows {
            if board[i][0] == "O" && visited[i][0] == false {
                dfs(i, 0, board, &visited)

            }

            if board[i][cols - 1] == "O" && visited[i][cols - 1] == false {
                dfs(i, cols - 1, board, &visited)
            }
        }

         for j in 0 ..< cols {
            if board[0][j] == "O" && visited[0][j] == false {
                dfs(0, j, board, &visited)
            }

            if board[rows - 1][j] == "O" && visited[rows - 1][j]  == false {
                dfs(rows - 1, j, board, &visited)
            }
        }

        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if board[i][j] == "O" && visited[i][j] == false {
                    board[i][j] = "X"
                }
            }
        }
    }

    func dfs(_ row: Int, _ col: Int , _ board: [[Character]], _ visited: inout [[Bool]]) {

        if row < 0 || col < 0 || row >= rows || col >= cols || board[row][col] != "O" || visited[row][col] == true {
            return
        }
        visited[row][col] = true

        let possibility = [(0, -1), (0, 1), (-1, 0), (1, 0)]

        for (i, j) in possibility {

            let newRow = row + i
            let newCol = col + j

        //    if visited[newRow][newCol] == false &&   board[row][col] == "O" {
                dfs(newRow, newCol, board, &visited)

        //    }

        }


    }
}

public class DirectedGraph {
    
    public init() {
        
    }
    public func hasCycle(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var visited = [Bool](repeating: false, count: n)
        var recStack = [Bool](repeating: false, count: n)

        func dfs(_ node: Int) -> Bool {
            visited[node] = true
            recStack[node] = true

            for neighbor in graph[node] {
                if !visited[neighbor] {
                    if dfs(neighbor) {
                        return true
                    }
                } else if recStack[neighbor] {
                    return true
                }
            }

            recStack[node] = false
            return false
        }

        for i in 0..<n {
            if !visited[i] {
                if dfs(i) {
                    return true
                }
            }
        }

        return false
    }
}


