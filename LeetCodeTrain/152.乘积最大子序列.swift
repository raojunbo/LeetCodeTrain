/*
 * @lc app=leetcode.cn id=152 lang=swift
 *
 * [152] 乘积最大子序列
 */

// @lc code=start
class Solution152 {
    func maxProduct(_ nums: [Int]) -> Int {
        // 定义dp[i] 表示以i结尾的左边的最大乘积
        // 当前值，左边最大乘积，左边最小乘积
        // 初始值
        var dpmax = Array(repeating: 1, count: nums.count + 1)
        var dpmin = Array(repeating: 1, count: nums.count + 1)
        
        for i in 1...nums.count {
            dpmax[i] = max(nums[i - 1],dpmax[i - 1] * nums[i - 1],dpmin[i - 1] * nums[i - 1])
            dpmin[i] = min(nums[ i - 1], dpmin[i - 1] * nums[i - 1], dpmax[i - 1] * nums[i - 1])
        }
        
        return max(dpmax[nums.count], dpmin[nums.count])
    }
    
    static func test() {
        let array = [2,3,-2,4]
//        let array = [-2]
        let result = Solution152().maxProduct(array)
        print(result)
    }
}
// @lc code=end

