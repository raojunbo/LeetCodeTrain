//
//  200. 岛屿的数量.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution200 {
    var count: Int = 0
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
      return numIsLands2(&grid)
    }
    func numIsLands2(_ grid: inout [[Character]]) -> Int {
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                let item = grid[i][j]
                // 如果当前节点为1 深度优先遍历，并且将访问过的置位0
                if item == Character("1") {
                    count = count + 1
                    dfs(&grid, i, j)
                }
            }
        }
        return count
    }
    // 开始深度优先遍历
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) -> Bool {
        if i < 0 || i >= grid.count  {
            return false
        }
        
        if j < 0 || j >= grid[0].count {
            return false
        }
        if grid[i][j] == Character("0") {
            return false
        }
        // 如果当前节点为0
        grid[i][j] = Character("0")
        
        let up = dfs(&grid, i - 1, j)
        let down = dfs(&grid, i + 1, j)
        let left = dfs(&grid, i, j - 1)
        let right = dfs(&grid, i, j + 1)
        
        return up || down || left || right
    }
//    let array =  [
//       ["1","0","0"],
//       ["1","1","0"],
//       ["0","0","1"],
//       ["0","0","0"]
//     ]
    
    static func test() {
        let array = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"],
        ]
//       let array =  [
//          ["1","1","0","0","0"],
//          ["1","1","0","0","0"],
//          ["0","0","1","0","0"],
//          ["0","0","0","1","1"]
//        ]
        
//        let array =  [
//           ["1","0","0"],
//           ["1","1","0"],
//           ["0","0","1"],
//           ["0","0","0"]
//         ]

        
        var bigArray:[[Character]] = []
        for small in array {
            var smallS: [Character] = []
            for item in small {
                smallS.append(Character(item))
            }
            bigArray.append(smallS)
        }
        let solution = Solution200()
        let result = solution.numIslands(bigArray)
        print(result)
    }
}
