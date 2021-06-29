/*
 * @lc app=leetcode.cn id=122 lang=swift
 *
 * [122] 买卖股票的最佳时机 II
 */

// @lc code=start
class Solution122 {
    func maxProfit(_ prices: [Int]) -> Int {
//        dp[i][0]=max{dp[i−1][0],dp[i−1][1]+prices[i]}
        // 定义两个状态：当前手里有票dp[i][0]的利润；当前手里无票dp[i][1]时的利润
        // 要满足无后效性
        // 卖出或者持币 dp[i][0] = max{dp[i - 1][0],dp[i - 1][1] + price[i] }
        // 买入或者持票时 dp[i][1] = max{dp[i - 1][0] - price[i], dp[i-1][1]}
        // 最后求出手里无票的情况
        var dp = Array(repeating:Array(repeating: 0, count:2 ), count: prices.count + 1)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1...prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1])
            dp[i][1] = max(dp[i - 1][0] - prices[i - 1], dp[i - 1][1])
        }
        return dp[prices.count][0]
    }

    // 第二次练习(不是一次性的写出来的)
    // 其中手里有票与否的状态要想推测出来比较难
    func maxProfit2(_ prices: [Int]) -> Int {
        // 因为涉及到股票的状态转移方程。所以需要确定前面的是否状态
        // array[0] 表示手里不持有股票 array[1]表示手里持有股票
        var dp = Array(repeating:Array(repeating: 0, count:2 ), count: prices.count + 1)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1...prices.count {
            // 当前手上没有票（可能上次没有票；可能上次有票）
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1])
            // 当前手上有票（上次没票，这次买票了;上次有票）
            dp[i][1] = max(dp[i - 1][0] - prices[i - 1], dp[i - 1][1])
        }
        return dp[prices.count][0]
    }
    
    static func test() {
        let array = [7,1,5,3,6,4]
        let result = Solution122().maxProfit2(array)
        print(result)
    }
}
// @lc code=end

