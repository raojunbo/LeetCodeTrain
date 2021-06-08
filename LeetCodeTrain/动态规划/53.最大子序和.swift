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
    // 第二遍
    // 定义dp[i] 表示到第i个元素截止的最大和
    // 递归表达式
    // dp[i - 1]
    func maxSubArray2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count + 1)
        var maxResult = Int.min
        for i in 0..<nums.count {
            let v = nums[i]
            if i == 0 {
                dp[0] = nums[0]
                if dp[i] > maxResult {
                    maxResult = dp[i]
                }
                continue
            }
            // 如果上一个是负数
            if dp[i - 1] >= 0 {
                dp[i] = dp[i - 1] + v
            } else {
                dp[i] = v
            }
            if dp[i] > maxResult {
                maxResult = dp[i]
            }
        }
        return maxResult
    }
    
    static func test() {
//        let array = [-2, 1, -3, 4, -1 ,2, 1, -5 ,4]
//        let array = [1]
        let array = [5,4,-1,7,8]
        let result = Solution53().maxSubArray2(array)
        print(result)
    }
}
// @lc code=end

