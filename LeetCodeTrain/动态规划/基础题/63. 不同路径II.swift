//
//  63. 不同路径II.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/9.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

// 已经是完全自己写出来地了
class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count == 0 {
            return 0
        }
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        // 初始化第一行
        var firstRowHasObstacle = false
        for i in 0..<dp.count {
            if obstacleGrid[i][0] != 0 {
                dp[i][0] = 0
                firstRowHasObstacle = true
                continue
            }
            if firstRowHasObstacle {
                dp[i][0] = 0
                continue
            }
            dp[i][0] = 1
        }
        // 初始化第一列
        var firstColumnObstacle = false
        for j in 0..<dp[0].count {
            if obstacleGrid[0][j] != 0 {
                dp[0][j] = 0
                firstColumnObstacle = true
            }
            if firstColumnObstacle {
                dp[0][j] = 0
                continue
            }
            dp[0][j] = 1
        }
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                // 如果有障碍
                if obstacleGrid[i][j] != 0{
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    static func test() {
//        let obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
        let obstacleGrid = [[0,1],[0,0]]
        let solution = Solution63()
        let result = solution.uniquePathsWithObstacles(obstacleGrid)
        print(result)
    }
}
