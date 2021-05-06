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

class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
// @lc code=end

