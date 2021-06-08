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
        if cost.count <= 2 {
            return cost[cost.count - 1]
        }
        
        // 从cost0开始
        var p = cost[0]
        var q = cost[1]
        
        // 从cost1开始
        var p1 = 0 // dp[1]
        var q1 = cost[1] // dp[2]
        
        
        for _ in 3..<cost.count {
            // 第一种
            let tmp = min(p, q)
            p = q
            q = tmp
            
            // 第二种
            let tmpp = p1 + q1
            p1 = q1
            q1 = tmpp
        }
        
        return min(q, q1)
    }
    
    static func test() {
//        let num = [10, 15, 20]
        let num = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
        let solution = Solution746()
        let result = solution.minCostClimbingStairs(num)
        print(result)
    }
}
