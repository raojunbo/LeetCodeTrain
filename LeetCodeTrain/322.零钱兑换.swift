/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 输入：coins = [1, 2, 5], amount = 11
 输出：3
 解释：11 = 5 + 5 + 1
 */

// @lc code=start
class Solution322 {
    var needCoins = -1
    // 贪心算法，不能得到最优解
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let sortedCoins = coins.sorted()
        let reversedCoins = sortedCoins.reversed()
        var reverCoin:[Int] = []
        for item in reversedCoins {
            reverCoin.append(item)
        }
        
        var amount = amount
        var coinCount = 0
        var i = 0
        
        while i < reverCoin.count {
            //当前的钱 小于 当前面值
            //不断试探
            if amount < reverCoin[i] {
                i += 1
                continue
            }
            //当前钱 大于当前面值
            amount -= reverCoin[i]
            coinCount += 1
        }
        
        return coinCount
    }
    
    // 暴力递归（自顶向下）
    // 将大问题转换为子问题
    func coinChange1(_ coins: [Int],_ amount: Int) -> Int {
        //结束条件，剩下的钱数小于1
        if amount < 1 {
            return Int.max
        }
        //每次都从里面尝试拿一枚，比较子问题还需要多少coin
        //Amount总钱数
        let coinsCount = coins.count
        var min1 = Int.max
        for index in 0...coinsCount - 1 {
            if amount == coins[index] {
                return 1
            }
            min1 = min(min1, coinChange1(coins,amount - coins[index]))
        }
        return min1 + 1
    }
    
    //记忆化搜索
    func coinChange2(_ coins: [Int],_ amount: Int) -> Int {
        if amount < 1 {
            return -1
        }
        var dp:[Int] = Array(repeating: 0, count: amount + 1)
        
        return coinChange3(coins, amount,dp: &dp)
    }
    
    func coinChange3(_ coins: [Int],_ amount: Int, dp: inout [Int]) -> Int  {
        if amount < 1 {
            return Int.max
        }
        //若果没有计算
        if dp[amount] == 0 {
            let coinsCount = coins.count
            var min1 = Int.max
            for index in 0...coinsCount - 1 {
                if amount == coins[index] {
                    return 1
                }
                min1 = min(min1, coinChange3(coins,amount - coins[index], dp: &dp))
            }
            dp[amount] = min1
        }
        return dp[amount]
    }
    
    //迭代动态规划(自底向下)
    //注意和斐波那契数解法比较。斐波那契是没有最值的一种动态规划；
    func coins3(_ coins: [Int],_ amount: Int, dp: inout [Int]) -> Int {
        if amount < 1 {
            return -1
        }
        var dp:[Int] = Array(repeating: 0, count: amount + 1)
        for index in 1...amount {
            //index 每次向后走一次；
            //都得尝试看是否现有面值是否可以减少次数
            //重新计算使用硬币的次数是否变化
            var minValue  = Int.max
            if index >= 1  {
                minValue = min(dp[index - 1], minValue)
            }
            if index >= 5 {
                minValue = min(dp[index - 5], minValue)
            }
            if index >= 20 {
                minValue = min(dp[index - 20],minValue)
            }
            if index >= 25 {
                minValue = min(dp[index - 25], minValue)
            }
            dp[index]  = minValue + 1
        }
        return dp[amount]
    }
    
    func coins4(_ coins: [Int],_ amount: Int) -> Int {
        if amount < 1 {
            return -1
        }
        var dp:[Int] = Array(repeating: 0, count: amount + 1)
        var faces:[Int] = Array(repeating: 0, count: amount + 1)
        //
        for index in 1...amount {
            var minValue  = Int.max
            //
            if index >= 1  && dp[index - 1] < minValue {
                minValue = dp[index - 1]
                faces[index] = 1
            }
            //
            if index >= 5 && dp[index - 5] < minValue {
                minValue = dp[index - 5]
                faces[index] = 5
            }
            if index >= 20 && dp[index - 20] < minValue {
                minValue = dp[index - 20]
                faces[index] = 20
            }
            if index >= 25 && dp[index - 25] < minValue{
                minValue = dp[index - 25]
                faces[index] = 25
            }
            print(minValue)
            dp[index]  = minValue + 1
        }
//        print(faces)
//        print(dp)
        return dp[amount]
    }
    
    func coins5(_ coins: [Int],_ amount: Int) -> Int {
        if amount < 1 {
            return -1
        }
        var dp:[Int] = Array(repeating: 0, count: amount + 1)
        var faces:[Int] = Array(repeating: 0, count: amount + 1)
        //
        for index in 1...amount {
            var minValue  = Int.max
            //
            if index >= 1  && dp[index - 1] < minValue {
                minValue = dp[index - 1]
                faces[index] = 1
            }
            //
            if index >= 5 && dp[index - 5] < minValue {
                minValue = dp[index - 5]
                faces[index] = 5
            }
            if index >= 20 && dp[index - 20] < minValue {
                minValue = dp[index - 20]
                faces[index] = 20
            }
            if index >= 25 && dp[index - 25] < minValue{
                minValue = dp[index - 25]
                faces[index] = 25
            }
            print(minValue)
            dp[index]  = minValue + 1
        }
//        print(faces)
//        print(dp)
        return dp[amount]
    }
    static func test (){
        let coins = [1,5,20,25]
        let result = Solution322().coins4(coins, 41)
        print(result)
    }
}
// @lc code=end

