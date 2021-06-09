//
//  343. 整数拆分.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/9.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 定义dp[i] 表示乘积最大值
// 递推分析：dp[i] 应该是怎么利用历史结果进行计算当前的最大值
// 当前dp[i] 1. 当前拆分成两 2. 拆分成多个（由历史存储）

// 由点类似于完全背包问题
class Solution343 {
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: Int.min, count: n + 1)
        // 初始化
        dp[1] = 1
        // 1开始直到n
        for i in 1...n {
            for j in 1..<i {
                // 将初始值，当前计算的最大值，
                dp[i] = max(dp[i], j * (i - j), dp[i - j] * j)
            }
        }
        return dp[n]
    }
    
    static func test() {
        let solution = Solution343()
        let result = solution.integerBreak(8)
        print(result)
    }
}


