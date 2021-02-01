/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子序和
 最大连续子序列的和
 1. 分治
 2. 动态规划
 */

// @lc code=start
class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var dp = Array(repeating: 0, count: nums.count + 1)
        var result = Int.min
        for i in 0...(nums.count - 1) {
            if i == 0 {
                dp[i] = nums[0]
                result = dp[i]
                continue
            }
            //如果 dp[i -1] < 0 最大的就是自己
            //如果 dp[i - 1] > 0 相加就是本次最大的和
            if dp[i - 1] < 0 {
                dp[i] = nums[i]
            } else {
                dp[i] = dp[i - 1] + nums[i]
            }
            if dp[i] > result {
                result = dp[i]
            }
        }
        return result
    }
    
    static func test() {
//        let array = [-2, 1, -3, 4, -1 ,2, 1, -5 ,4]
        let array = [1]
        let result = Solution53().maxSubArray(array)
        print(result)
    }
}
// @lc code=end

