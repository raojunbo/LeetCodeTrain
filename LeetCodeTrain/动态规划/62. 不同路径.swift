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
    
    
    static func test(){
        let solution = Solution62()
        let result = solution.uniquePaths(3, 7)
        print(result)
    }
}
