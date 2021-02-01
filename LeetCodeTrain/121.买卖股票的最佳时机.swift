/*
 * @lc app=leetcode.cn id=121 lang=swift
 *
 * [121] 买卖股票的最佳时机
 */

// @lc code=start
class Solution121 {
    // 买卖股票的最佳时机
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 0 {
            return 0
        }
        var minValue = prices[0]
        var result = 0
        for i in 0..<prices.count {
            // 计算当前与前面最低的差值
            let cur = prices[i] - minValue
            // 差值大于result
            if cur > result {
                result = cur
            }
            // 差值小于0，表明有最小的值了
            if  cur < 0 {
                minValue = prices[i]
            }
        }
        return result
    }
    static func test() {
        let array = [7,6,4,3,1]
        let result = Solution121().maxProfit(array)
        print(result)
    }
}
// @lc code=end

