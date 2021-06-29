//
//  221. 最大正方形.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/7.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/*
 动态规划的难点在与怎么定义dp,怎么写出状态转移方程
 我们用 dp(i,j) 表示以 (i, j)为右下角，且只包含 1的正方形的边长最大值
 dp[i][j]
 说明：说实话这个状态转移方程不容易想出来；
 */
class Solution221 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else {
            return 0
        }
        var maxSide = 0
        // 二维数组
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count) , count: matrix.count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                guard matrix[i][j] == "1" else {
                    continue
                }
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    // 状态转移方程：
                    // 上，左，斜边
                    dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
                }
                maxSide = max(maxSide, dp[i][j])
            }
        }
        return maxSide * maxSide
    }
    
    static func test() {
       let matrix = [["1","0","1","0","0"],
                     ["1","0","1","1","1"],
                     ["1","1","1","1","1"],
                     ["1","0","0","1","0"]]
        var outmatrix: [[Character]] = []
        for i in 0..<matrix.count {
            var innerMatrix: [Character] = []
            for j in 0..<matrix[0].count {
                let c = Character(matrix[i][j])
                innerMatrix.append(c)
            }
            outmatrix.append(innerMatrix)
        }
        let solution = Solution221()
        let result = solution.maximalSquare(outmatrix)
        print(result)
    }
}
