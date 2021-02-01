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
    static func test() {
        let prices = [3,3,5,0,0,3,1,4]
        let res = Solution123().maxProfit(prices)
        print(res)
    }
}
// @lc code=end

