//
//  ContentViewModel.swift
//  AlgosATesting
//
//  Created by vinay kamra on 29/07/25.
//

import Algos
import Foundation
import SwiftUI

enum ProblemType: String, CaseIterable {
    case FloodFill = "Flood Fill"
    case Matrix01 = "Matrix 01"
    case SurroundedRegion = "Surrounded Region"
    case DirectedGraphCycle = "Directed Graph Cycle"
    case maxAreaOfIsland = "Max Area of Island"
}

class ContentViewModel: ObservableObject {
    
    @Published var items: [ProblemType] = []
    
    
    func inititems() {
        items = [
            .FloodFill
            ,.Matrix01
            ,.SurroundedRegion
            ,.DirectedGraphCycle
            ,.maxAreaOfIsland
    ]
    }
        
    
    func execute(type: ProblemType) {
        
        switch type {
        case .FloodFill:
            floodFill()
        case .Matrix01:
            matrix01()
        case .SurroundedRegion:
            surroundedRegion()
        case .DirectedGraphCycle:
            DirectedGraphCycle()
        case .maxAreaOfIsland:
            maxAreaOfIsland()
        }
       
    }
    
    func floodFill() {
        print(FLoodFill().floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))
    }
    
    func matrix01() {
        print(Matrix01().updateMatrix([[1, 0, 1, 0, 1],
                                   [1, 0, 1, 0, 1],
                                   [1, 0, 1, 0, 1]]))
    }
    
    func surroundedRegion() {
        var value:[[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        SurroundedRegion().solve(&value)
        print(value)
    }
    
    func DirectedGraphCycle() {
        let graph = [
            [1],    // Node 0 → 1
            [2],    // Node 1 → 2
            [0]     // Node 2 → 0 (Cycle)
        ]
        print(DirectedGraph().hasCycle(graph))
    }
    
    
    func calculatyeSubarray() {
        
        print(Solution1221212().maxProfit([2,5], 4))
    }
    
    func triangleSum() {
        print(Others().triangularSum1([1,2,3,4,5]
))
    }
    
    func maxRobots() {
        maxAreaOfIsland()
    }
    
    func maxAreaOfIsland() {
        
       
       // print(self.maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
        
        print(self.maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
            if grid.count == 0 { return 0 }
            let rows = grid.count
            let cols = grid[0].count
            var maxValue = Int.min
            var visited:[[Int]] = Array(repeating: Array(repeating: -1, count: cols), count: rows)

            func dfs(_ row: Int, _ col: Int) -> Int {
                if row >= rows || col >= cols || row < 0 || col < 0 {
                    return 0
                }

                if visited[row][col] == 1 || grid[row][col] == 0 {
                    return 0
                }
                visited[row][col] = 1

                 var area = 1

                 area += dfs(row + 1, col)
                 area += dfs(row, col + 1)
                 area += dfs(row - 1, col)
                 area += dfs(row, col  - 1)

                 return area




            }

            for i in 0 ..< rows {
                for j in 0 ..< cols {
                    if grid[i][j] == 1 && visited[i][j] == -1 {
                        maxValue = max(maxValue, dfs(i, j))
                    }
                }
            }

        return maxValue == Int.min ? 0 : maxValue
        }
}
 
