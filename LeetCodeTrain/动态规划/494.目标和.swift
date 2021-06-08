//
//  494.目标和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/31.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
//输入：nums = [1,1,1,1,1], target = 3
//输出：5
//解释：一共有 5 种方法让最终目标和为 3 。
//-1 + 1 + 1 + 1 + 1 = 3
//+1 - 1 + 1 + 1 + 1 = 3
//+1 + 1 - 1 + 1 + 1 = 3
//+1 + 1 + 1 - 1 + 1 = 3
//+1 + 1 + 1 + 1 - 1 = 3
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/target-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

// 这道题不是很直白的动态规划问题；
// 需要做一次转换才能转换成求一个背包装满有多少中装法
// 这道题。没有真正弄明白
class Solution494 {
    
    func findTargetSumWays2(_ nums: [Int], _ target: Int) -> Int {
        // 总和
        var sum = 0
        for i in nums {
            sum += i
        }
        
        if (target + sum)%2 != 0 {
            return 0
        }
        // 背包大小
        let size = (target + sum ) / 2
        var dp = Array(repeating: 0, count: size + 1)
        dp[0] = 1
        // 这里为什么要从后向前
        nums.forEach { num in
            for i in stride(from: size, through: num, by: -1) {
                dp[i] += dp[i - num]
            }
        }
        return dp[size]
    }
    
    static func test() {
        let nums = [1000]
        let target = -1000
        let solution = Solution494()
        let result = solution.findTargetSumWays2(nums, target)
        print(result)
    }
}
