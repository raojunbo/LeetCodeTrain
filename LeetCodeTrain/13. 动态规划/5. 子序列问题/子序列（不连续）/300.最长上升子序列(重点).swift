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
    
    // 第二遍练习(第二遍练习时，还是有点找不到北，原因是不知道怎么去定义状态转移方程)
    // 最长递增子序列
    // dp[i]表示以nums[i]的值结尾的最长子序列的长度
    // 这道题在理解出现问题
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var result = 1
        var dp = Array(repeating: 1, count: nums.count)
        // 尝试不断添加nums
        for i in 1..<nums.count {
            // 比较最长序列
            for j in 0..<i {
                // nums[i]为当前，nums[j] 为i之前
                // 如果i之前较i小dp[j] + 1 为dp[i]的长度。但是也要与dp[i]进行比较（也就是历史值）
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            // 求出的dp[nums.count - 1] 不就是最长的序列
            if dp[i] > result {
                result = dp[i]
            }
        }
        return result
    }
    
    static func test() {
        let nums1 = [10, 9, 2, 5, 3, 7, 101, 18]
        let nums2 = [0,1,0,3,2,3]
        let nums3 = [7,7,7,7,7,7,7]
        let num4 = [4,10,4,3,8,9]
        let num5 = [1,3,6,7,9,4,10,5,6]
        let result = Solution300().lengthOfLIS2(num5)
        print(result)
    }
}
// @lc code=end

