//
//  518. 零钱兑换II.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/15.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution518 {
    // 求组合数
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        for i in 0..<coins.count {
            let coin = coins[i]
            for j in 0...amount {
                if j < coin {
                    continue
                }
              // 此种情况下是组合数（coin的顺序是固定的）
                dp[j] += dp[j - coin]
            }
        }
        print(dp)
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
