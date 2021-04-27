//
//  剑指 Offer 47 礼物的最大价值.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/4/25.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        let rowCount = grid.count
        let colomCount = grid[0].count
        var dp:[[Int]] = Array()
        // 动态规划的问题： 从小问题推导出大问题的解决办法
        // 定义初始化：
        // 定义递归表达式
        for _ in 0..<rowCount {
            let array = Array(repeating: 0, count: colomCount)
            dp.append(array)
        }
        for i in 0..<rowCount {
            for j in 0..<colomCount {
                if i == 0 && j == 0 {
                    dp[i][j] = grid[i][j]
                    continue
                }
                if i == 0 {
                    dp[i][j] = dp[i][j - 1] + grid[i][j]
                    continue
                }
                if j == 0 {
                    dp[i][j] = dp[i - 1][j] + grid[i][j]
                    continue
                }
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])  + grid[i][j]
            }
        }
        
        return dp[rowCount - 1][colomCount - 1]
    }
    
    static func test() {
        let solution = SolutionSord47()
        let grid: [[Int]] =
        [
            [1, 3, 1],
            [1, 5, 1],
            
        ]
//        [[1,2,5],[3,2,1]]
        let result = solution.maxValue(grid)
        print(result)
    }
}
