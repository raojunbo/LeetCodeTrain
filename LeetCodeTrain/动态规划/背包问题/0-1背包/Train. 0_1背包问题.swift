//
//  Train. 0_1背包问题.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/10.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution0_1BagTrain {
    // 背包的容量capacity, w为背包的重量, v为物品的价值
    func bagMaxValue(capacity:Int, w:[Int],v:[Int]) ->Int {
        // 在容量有限的条件下，能拿到的最大物品价值
        // dp[i][j] 有前i个物品可选，j最大承重; dp[i][j]表示钱i个物品，最大承重为j的最大物品价值
        // 怎么去定义dp；这里是从整体去推导
        var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: w.count + 1)
        // 并且每个物体都只能有一次
        for i in 1...w.count {
            let w = w[i - 1]
            let v = v[i - 1]
            for j in 1...capacity {
                // 当前容量j 小于 w ，表示最大承重已经不能承受了
                if j < w {
                    dp[i][j] = dp[i - 1][j]
                    continue
                }
                // dp[i][j] 有前i个物品可选，“最大承重”为j;
                // 1. 不选，2. 选中了当前的价值 + 还剩下的最大容量的z最大价值
                dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - w] + v)
            }
        }
        return dp[w.count][capacity]
    }
    
    static func test() {
        let w = [2, 2, 6, 5, 4]
        let v = [6, 3, 5, 4, 6]
        let solution = Solution0_1BagTrain()
        let result = solution.bagMaxValue(capacity: 10, w: w, v: v)
        print(result)
    }
}
