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
    // 像这种背包问题在定义dp时，要想解决最大问题。最大问题就是子问题的的一种。
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
    // 从上面的递推表达式可以看到
    // 始终只是用到了上面一行的记录，所以可以采用滚动数组
    // 所以经过内存优化后的版本
    // 递推表达式 dp[j] = max( dp[j], dp[j - w[i]] + v[i])
    func bagMaxValue2(capacity:Int, w:[Int],v:[Int]) ->Int {
        var dp = Array(repeating: 0, count: capacity + 1)
        for i in 0..<w.count {
            let w = w[i]
            let v = v[i]
            // 用一个数组时，可能出现数据的覆盖，所以从后面开始计算（小技巧）
            for j in (1...capacity).reversed() {
                if j < w {
                    continue
                }
                dp[j] = max(dp[j], dp[j - w] + v)
            }
        }
        return dp[capacity]
    }
    
    static func test() {
        let w = [2, 2, 6, 5, 4]
        let v = [6, 3, 5, 4, 6]
        let solution = Solution0_1BagTrain()
        let result = solution.bagMaxValue2(capacity: 10, w: w, v: v)
        print(result)
    }
}
