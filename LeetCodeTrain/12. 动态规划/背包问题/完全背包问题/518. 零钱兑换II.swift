//
//  518. 零钱兑换II.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/15.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

/**
 实际上是一个完全背包问题
 */
class Solution518 {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        // 定义dp表示dp[i][j]有前面i这些硬币最大容量为j的可能种数
        dp[0] = 1
        for i in 0..<coins.count {
            let v = coins[i]
            for j in 0...amount {
                if j < v {
                    continue
                }
                // 所有容量为j种数和，即所有dp[j - v]相加
                dp[j] += dp[j - v]
            }
        }
        return dp[amount]
    }
    
    static func test() {
        let coins = [1, 2, 5]
        let amount = 5
        let solution = Solution518()
        let result = solution.change(amount, coins)
        print(result)
    }
}
