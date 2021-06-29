/*
 * @lc app=leetcode.cn id=123 lang=swift
 *
 * [123] 买卖股票的最佳时机 III
 */

// @lc code=start
class Solution123 {
    func maxProfit(_ prices: [Int]) -> Int {
        // 只进行过一次买操作buy1
        // 进行了一次买操作和一次卖操作sell1
        // 在完成了一笔交易的前提下，进行了第二次买操作buy2
        // 完成了全部两笔交易sell2
        // 实际上是维持几个状态变化。
        // buy1 第一次购买，可以由以前未购买，或者本次什么也不做
        // 整个还是一个动态规划的过程
        // 只是将状态用一些遍历承接了
        var buy1 = -prices[0]
        var sell1 = 0
        var buy2 = -prices[0]
        var sell2 = 0
        for i in 0..<prices.count {
            // 什么也不买，或者在当前的价格买
            buy1 = max(buy1, -prices[i])
            // 什么也不卖，或者 在当前的价格卖
            sell1 = max(sell1, buy1 + prices[i])
            // 什么也不买，或者在当前的sell1的基础上买
            buy2 = max(buy2, sell1 - prices[i])
            // 什么也不做，或者在当前的买的基础上在当前的价格卖
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }
    
    // 第二次练习(没有优化的版本比较容易理解)
    // 动态规划的高级状态，前面很多动态规划，只是保存一个状态
    // 此处的动态规划，每一个i，可能有多个状态
    // 需要搞定这些状态的变化过程
    func maxProfit2(_ prices: [Int]) -> Int {
        // 关键在于至多买卖两次，这意味着可以买卖一次，可以买卖两次，也可以不买卖。
        // 一天就会有这几个状态
        // 0. 未进行任何买卖
        // 1. 买了一次
        // 2. 卖了一次
        // 3. 买了两次，卖一次
        // 4. 卖了两次
        // 即这5种状态
        // 定义dp[i][j] i表示第i天,j表示状态，第i天状态为j所剩余的最大现金
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        dp[0][2] = 0
        dp[0][3] = -prices[0]
        dp[0][4] = 0
        for i in 1..<prices.count {
            dp[i][0] = dp[i - 1][0]
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
            dp[i][2] = max(dp[i - 1][2], dp[i - 1][1] + prices[i])
            dp[i][3] = max(dp[i - 1][3], dp[i - 1][2] - prices[i])
            dp[i][4] = max(dp[i - 1][4], dp[i - 1][3] + prices[i])
        }
        return dp[prices.count - 1][4]
    }
    static func test() {
        let prices = [3,3,5,0,0,3,1,4]
        let res = Solution123().maxProfit2(prices)
        print(res)
    }
}
// @lc code=end

