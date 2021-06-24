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
    // 第二遍练习
    // 只能买卖一次
    func maxProfit2(_ prices: [Int]) -> Int {
        var result = 0
        var minValue = prices[0]
        for item in prices {
            // 如果当前值小于最小值
            if item < minValue {
                minValue = item
            } else {
                // 如果当前值大于最小值
                // 求出与最小值的差值
                let tmpResult = item - minValue
                // 当前的差值与上一次的差值进行，比较，取最大的差值
                if tmpResult >= result {
                    result = tmpResult
                }
            }
        }
       return result
    }
    // 第三遍练习
    // 找出差值最的大的就可以了
    func maxProfit3(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var minValue = prices[0]
        var result = 0
        for i in 0..<prices.count {
            let v = prices[i]
            // 若果当前值比最小值小
            if v < minValue {
                minValue = v
            } else {
                // 若果当前值比最小值大，计算差值，是否是最大的差值
                let tmpResult = v - minValue
                if tmpResult > result {
                    result = tmpResult
                }
            }
        }
        return result
    }
    // 第四边练习(很easy的就解决了)
    func maxProfit4(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var minP = prices[0]
        var result = 0
        for i in 0..<prices.count {
            let item = prices[i]
            if item < minP {
                minP = item
            }
            result = max(result, item - minP)
        }
        return result
    }
    
    static func test() {
        let array = [7,1,5,3,6,4]
        let result = Solution121().maxProfit4(array)
        print(result)
    }
}
// @lc code=end

