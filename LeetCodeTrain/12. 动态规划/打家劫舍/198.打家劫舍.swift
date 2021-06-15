/*
 * @lc app=leetcode.cn id=198 lang=swift
 *
 * [198] 打家劫舍
 */

// @lc code=start
class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        //定义dp[i] 从左向右依次偷窃的最大和
        // dp[i] = Max(dp[i - 1],dp[i - 2] + nums[i])
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            if i == 0 {
                dp[0] = nums[0]
                continue
            }
            if i == 1 {
                dp[1] = max(nums[0], nums[1])
                continue
            }
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        }
        return dp[nums.count - 1]
    }
    
    func rob2(_ nums: [Int]) -> Int {
        //定义dp[i] 从左向右依次偷窃的最大和
        // dp[i] = Max(dp[i - 1],dp[i - 2] + nums[i])
        if nums.count == 0 {
            return 0
        }
        var last1 = 0
        var last2 = 0
        var cur = 0
        for i in 0..<nums.count {
            if i == 0 {
                last2 = nums[0]
                continue
            }
            if i == 1 {
                last2 = max(nums[0], nums[1])
                last1 = nums[0]
                continue
            }
          
            cur = max(last2, last1 + nums[i])
            last1 = last2
            last2 = cur
        }
        return last2
    }
    
    static func test() {
        let arry = [2,7,9,3,1]
        let result = Solution198().rob2(arry)
        print(result)
    }
}
// @lc code=end

