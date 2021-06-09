//
//  62. 不同路径.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/22.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 所谓的动态规划就是利用上次计算出来的结果去推导下一次的问题；
        // 写动态规划的基本规则
        // 就是写出递推表达式，然后是自下由上的写代码
        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            dp[i][0]  = 1
        }
        for j in 0..<n {
            dp[0][j] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    // 第二遍练习(已经完整地做出来了)
    // 定义dp[i][j] 为走到dp[i][j]时所需要的步数
    // 递推表达时 dp[i][j] = dp[i - 1][j] + dp[j - 1][i]
    // 初始表达式 dp[0][j] = 1 dp[i][0] = 1 边缘部分
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        if m <= 0 || n <= 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<dp.count {
            dp[i][0] = 1
        }
        for j in 0..<dp[0].count {
            dp[0][j] = 1
        }
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    static func test(){
        let solution = Solution62()
        let result = solution.uniquePaths2(3, 7)
        print(result)
    }
}
