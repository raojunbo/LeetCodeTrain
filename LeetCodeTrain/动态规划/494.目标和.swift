//
//  494.目标和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/31.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution494 {
    var count: Int = 0
    var dp: [[Int]] = []
    // 动态规划无非一维数组，二维数组。都是利用已经计算的结果去推导现在的；
    func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
        // dp[i][j] 表示第i元素组成和为j的方案数,这个i的方案数
        // 递归表达式：是由加或者减两种方案得来
        // 很多时候，也就是0，1，背包问题。二维数组的第二维都是vlaue的值
        // dp[i][j] = dp[i - 1][j - nums[i]] + dp[i - 1][j + nums[i]]
        // 行是nums个
        // 列是2000个
        var dp = Array(repeating: Array(repeating: 0, count: 2000), count: nums.count)
        
//        for i in 0...nums.count  {
//            for j in <#items#> {
//                <#code#>
//            }
//        }
        return 0
    }
    
    
    static func test() {
        let nums = [1, 1, 1, 1, 1]
        let target = 3
        let solution = Solution494()
        let result = solution.findTargetSumWays2(nums, target)
        print(result)
    }
}
