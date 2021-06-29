/*
 * @lc app=leetcode.cn id=188 lang=swift
 *
 * [188] 买卖股票的最佳时机 IV
 */

// @lc code=start
class Solution188 {
    // 最多可以完成k笔交易
    // 那么有2k + 1 种状态
    // 哈哈这个还是自己在没有看答案的情况下做出来的
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        // 关键在于至多买卖两次，这意味着可以买卖一次，可以买卖两次，也可以不买卖。
        // 一天就会有这几个状态
        // 0. 未进行任何买卖
        // 1. 买了一次
        // 2. 卖了一次
        // 3. 买了两次，卖一次
        // 4. 卖了两次
        // 即这5种状态
        // 定义dp[i][j] i表示第i天,j表示状态，第i天状态为j所剩余的最大现金
        // 本题是123题的升级版本。实际用k次交易生成多少种状态
        if prices.count == 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: 2 * k + 1), count: prices.count)
        for i in 0..<prices.count {
            for j in 0...(2 * k) {
                // 初始化
                if i == 0 {
                    if j % 2 == 0 {
                        dp[0][j] = 0
                    } else {
                        dp[0][j] = -prices[0]
                    }
                    continue
                }
                if j == 0 {
                    dp[i][j] = dp[i - 1][j]
                    continue
                }
                if j % 2 == 1 {
                    // 存在存货
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1] - prices[i])
                } else {
                    // 不存在存货
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1] + prices[i])
                }
            }
        }
        return dp[prices.count - 1][2 * k]
    }
    
    static func test() {
        let prices = [2,4,1]
        let res = Solution188().maxProfit(2, prices)
        print(res)
    }
}
// @lc code=end

