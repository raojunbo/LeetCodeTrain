/*
 * @lc app=leetcode.cn id=309 lang=swift
 *
 * [309] 最佳买卖股票时机含冷冻期
 */

// @lc code=start
class Solution309 {
    func maxProfit(_ prices: [Int]) -> Int {
        // 买入为负收益
        // 卖出为正收益
        // 具有冷冻期的状态
        
        // 实际上就是定义好状态，然后确定状态的转移
        // 目前持有一支股票，对应的”累计最大收益“ f[i][0]
        // 目前不持有任何股票，并且处于冷冻期(卖出股票后的一天不能买卖)，f[i][1]
        // 目前不持有任何股票，并且不处于冷冻期，f[i][2]
        
        
        // 状态转移方程的转移
        // 可以是上次买的，也可以是本次买的
//        f[i][0] = max(f[i - 1][0], f[i - 1][2] - prices[i])
        // 不能买卖，不能买卖说明上次卖了
//        f[i][1] = f[i - 1][0] + prices[i]
        // 第i天不持有股票，说明当前没有进行操作；不处于冷冻说明没有进行
//        f[i][2] = max(f[i - 1][1], f[i - 1][2])
        
        if prices.count == 0 {
            return 0
        }
        let n = prices.count
        let array = Array(repeating: 0, count: 3)
        var f = Array(repeating: array, count: n)
        //初始化时，假设持有一支股票。持有股票为负收益
        f[0][0] = -prices[0]
        for i in 1..<n {
            f[i][0] = max(f[i - 1][0], f[i - 1][2] - prices[i])
            f[i][1] = f[i - 1][0] + prices[i]
            f[i][2] = max(f[i - 1][1], f[i - 1][2])
        }
        return max(f[n - 1][1], f[n - 1][2])
    }
    
    
    
    // 第二次训练
    // 分析：买入态，卖出态，冷冻期
    // dp[i][j] i表示第i只股票，j表示状态 dp[i][j]表示此种状态下的最大值
    // 0 买入状态
    // 1 表示卖出状态
    // 2 冷冻期
    func maxProfit2(_ prices: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: prices.count)
        // 初始状态
        dp[0][0] = -prices[0]
        for i in 1..<prices.count {
            // 买入状态（上次本身就是买入状态; 上次是冻结状态）
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][2] - prices[i])
            // 卖出的状态（上次是买入的状态）
            dp[i][1] = dp[i - 1][0] + prices[i]
            // 冻结状态（上次是卖出;本身是冻结状态;）
            dp[i][2] = max(dp[i - 1][1],dp[i - 1][2])
        }
        return max(dp[prices.count - 1][1], dp[prices.count - 1][2])
    }
    
    static func test() {
        let array = [1,2,3,0,2]
        let restu = Solution309().maxProfit2(array)
        print(restu)
    }
}
// @lc code=end

