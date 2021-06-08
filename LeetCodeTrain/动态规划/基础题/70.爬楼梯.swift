/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 爬楼梯的解法
 可以是递归；可以是循环；好像还可以是动态规划；
 1. 递归
 递归表达式
 f(n) = f(n-1) + f(n-2)
 退出条件
 n =0,1,2
 递归的解法不行
 
 */

// @lc code=start
//
/*
 采用递归的方法户出现很多重复计算问题
 动态规划的解法
 dp[i]定义：当为i时的上台阶方法数
 递归表达式：dp[i] = dp[i - 1] + dp[i - 2]
 
*/
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        if n <= 2 {
            return dp[n]
        }
        for i in 3...n {
           dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    // 对上面的数组进行空间上的优化
    func climbStairs2(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var p  = 0 //存储倒数第二个
        var q = 0 //存储倒数第一个
        var r = 1 // 当前值
        for _ in 0..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    static func test() {
        let solution = Solution70()
        let result = solution.climbStairs2(3)
        print(result)
    }
}
// @lc code=end

