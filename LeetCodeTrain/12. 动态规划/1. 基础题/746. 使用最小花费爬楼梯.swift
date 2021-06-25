//
//  746. 使用最小花费爬楼梯.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/8.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

/*
 思路整理
 dp[i] 到达第i层楼梯时的最小消耗
 */
class Solution746 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count + 1)
        dp[0] = 0
        dp[1] = 0
        for i in 2...cost.count {
            // 在走一步与走两步里取出最小值
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }
        return dp[cost.count]
    }
    
    static func test() {
//        let num = [10, 15, 20]
        let num = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
        let solution = Solution746()
        let result = solution.minCostClimbingStairs(num)
        print(result)
    }
}
