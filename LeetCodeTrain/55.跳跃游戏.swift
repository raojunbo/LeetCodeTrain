/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 */

// @lc code=start
class Solution55 {
    //这里如果用动态规划具有后效性，所以不适合用动态规划的方法
    func canJump(_ nums: [Int]) -> Bool {
        //采用贪心算法
        var rightMost = 0 //记录一个能达到向右的最远的距离
        for i in 0...nums.count - 1 {
            //当前小于最远距离
            if i <= rightMost {
                rightMost = max(rightMost, nums[i] + i)
            }
            if rightMost >= nums.count - 1 {
                return true
            }
        }
        return false
    }
    
    static func test() {
        let nums = [0]
        let result = Solution55().canJump(nums)
        print(result)
    }
}
// @lc code=end

