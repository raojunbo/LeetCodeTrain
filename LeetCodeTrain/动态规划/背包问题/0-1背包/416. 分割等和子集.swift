//
//  416. 分割等和子集.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/11.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution416 {
    /*
     像这种是否相等问题都可以转换为最值问题；
     总和可以求出来；sum
     a + b = sum
     a = b
     a + a = sum
     a = sum/2
     转换成在nums里找到是否存在和为sum/2的问题。
     dp[i][j]表示从数组的 [0, i] 这个子区间内挑选一些正整数，每个数只能用一次，使得这些数的和恰好等于 j ,恰好等于j时dp[i][j] = true
     递推表达式: dp[i][j] = dp[i - 1][j - v] || dp[i - 1][j]
     本题选取的数字之和需要 恰好等于 规定的和的一半。
     */
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        for item in nums {
            sum += item
        }
        // 和为奇数
        if sum % 2 == 1 {
            return false
        }
        // 背包容量
        let target = sum / 2
        // 和为偶数
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: nums.count + 1)
        dp[0][0] = true
        for i in 1...nums.count {
            let v = nums[i - 1]
            for j in 1...target {
                if j < v  {
                    dp[i][j] =  dp[i - 1][j]
                    continue
                }
                if j == v {
                    dp[i][j] = true
                    continue
                }
                dp[i][j] = dp[i - 1][j - v] || dp[i - 1][j]
            }
        }
        return dp[nums.count][target]
    }
    // 内存优化
    //
    func canPartition2(_ nums: [Int]) -> Bool {
        var sum = 0
        for item in nums {
            sum += item
        }
        // 和为奇数
        if sum % 2 == 1 {
            return false
        }
        // 背包容量
        let target = sum / 2
        // 和为偶数
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for i in 1...nums.count {
            let v = nums[i - 1]
            for j in (1...target).reversed() {
                if j < v  {
//                    dp[j] =  dp[j]
                    continue
                }
                if j == v {
                    dp[j] = true
                    continue
                }
                dp[j] = dp[j - v] || dp[j]
            }
        }
        return dp[target]
    }
    
    static func test() {
        let nums = [1,5,11,5]
        let solution = Solution416()
        let result = solution.canPartition2(nums)
        print(result)
    }
}
