/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长上升子序列
 */

// @lc code=start
class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        //定义dp[i] 以i结尾的最长上升子序列
        if nums.count == 0 {
            return 0
        }
        
        var dp = Array(repeating: 1, count: nums.count)
        var maxResult = dp[0]
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] <= nums[j] {
                    continue
                }
                //当nums[i] > nums[j]时，并且，没有形式的dp[i] 比现有dp[i] 大
                if dp[j] + 1 > dp[i]  {
                    dp[i] = dp[j] + 1
                }
            }
            //记录所有的dp[i]中最大的
            if maxResult < dp[i] {
                maxResult = dp[i]
            }
        }
        return maxResult
    }
    
    static func test() {
        let nums1 = [10, 9, 2, 5, 3, 7, 101, 18]
        let nums2 = [0,1,0,3,2,3]
        let nums3 = [7,7,7,7,7,7,7]
        let num4 = [4,10,4,3,8,9]
        let num5 = [0,1,0,3,2,3]
        let result = Solution300().lengthOfLIS(num5)
        print(result)
    }
}
// @lc code=end

