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
    //dp(41)凑到41分需要的最少硬币个数
    //dp(n) = dp(n - 25) + 1
    //dp(n) = Min{dp(n-25),dp(n-20),dp(n-5),dp(n-1)} + 1
    
    //迭代法（非递归的写法,即动态规划的方法）,自底向上
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 0 {
            return -1
        }
        if amount == 0 {
            return 0
        }
        
        //将默认值都初始化为0
        //dp[i]表示构成i所需要的最小个数
        var dp:[Int] = Array(repeating: 0, count: amount + 1)
        
        for index in 1...amount {
            var minValue = Int.max
            for item in coins {
                //当index小于item,他的上一个筹为-1
                if index < item || dp[index - item] < 0 {
                    continue
                }
                minValue = min(dp[index - item], minValue)
            }
            //但一句都一条都没执行时i
            if minValue == Int.max {
                dp[index] = -1
            } else {
                dp[index] = minValue + 1
            }
        }
        return dp[amount]
    }
    
    static func test (){
        let coins = [1,2,5]
        let resutl = Solution322().coinChange(coins,11)
        print(resutl)
    }
}
// @lc code=end

