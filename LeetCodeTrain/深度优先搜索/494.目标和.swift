//
//  494.目标和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/31.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution494 {
    // 暴力枚举
    // 复杂度为2的n次方
    // 采用动态规划
    var count: Int = 0
    var dp: [[Int]] = []
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        calculate(nums, 0, 0, target);
        return count
    }
    func calculate(_ nums: [Int], _ i: Int, _ target: Int, _ sum: Int) {
        if (i == nums.count) {
            if sum == target {
                count = count + 1
            }
        } else {
            calculate(nums, i + 1, sum + nums[i], target);
            calculate(nums, i + 1, sum - nums[i], target);
        }
    }
    
    func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
        // 状态转移方程
//         dp[i][j] = dp[i - 1][j - nums[i]] + dp[i - 1][j + nums[i]]
        
        return 0
    }
    
    
    static func test() {
        let nums = [1, 1, 1, 1, 1]
        let target = 3
        let solution = Solution494()
        let result = solution.findTargetSumWays(nums, target)
        print(result)
    }
}
