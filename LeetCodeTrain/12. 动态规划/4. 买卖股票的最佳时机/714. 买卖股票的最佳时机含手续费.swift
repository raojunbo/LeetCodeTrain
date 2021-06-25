//
//  714. 买卖股票的最佳时机含手续费.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/25.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution714 {
    // 第一遍练习（第一遍练习是自己做出来的）
    // 每次在卖出时都要将手续费考虑进去
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.count == 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        // dp[i][0]表示表示持有股票 dp[i][1] 未持有股票
        dp[0][0] = -prices[0]
        for i in 1..<prices.count {
            // 本身就有票
            dp[i][0] = max(dp[i - 1][0] , dp[i - 1][1] - prices[i])
            // 本身无票; 上次有票，本次卖出票
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] + prices[i] - fee)
        }
        return dp[prices.count - 1][1]
    }
    static func test() {
        let array = [1, 3, 2, 8, 4, 9]
        let restu = Solution714().maxProfit(array, 2)
        print(restu)
    }
}
