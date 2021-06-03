//
//  64. 最小路径和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        var result = -1
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if i == 0 && j == 0 {
                    grid[i][j] = grid[i][j]
                    result = grid[i][j]
                    continue
                }
                if i == 0 {
                    grid[i][j] = grid[i][j - 1] + grid[i][j]
                    result = grid[i][j]
                    continue
                }
                if j == 0 {
                    grid[i][j] = grid[i - 1][j] + grid[i][j]
                    continue
                }
                grid[i][j] = min(grid[i - 1][j] , grid[i][j - 1] ) + grid[i][j]
                result = grid[i][j]
            }
        }
        return result
    }
    static func test(){
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        let solution = Solution64()
        let result =  solution.minPathSum(grid)
        print(result)
    }
}
