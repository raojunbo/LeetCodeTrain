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
/*
 总和sum
 加号和a
 减号和b
 a - b = sum
 a + b = target
 2a = sum + target
 a = (sum + target)/2
 即转换成在数组里寻找a = (sum + target)/2 的种数。也就转成成0-1背包问题
 */
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
        
        for i in 0..<nums.count {
            let v = nums[i]
           
            for j in (0...size).reversed() {
                if j < v {
                    continue
                }
                dp[j] += dp[j - v]
            }
        }
        return dp[size]
    }
    
    static func test() {
        let nums = [1,1,1,1,1]
        let target = 3
        
//        let nums = [1000]
//        let target = -1000
        
//        let nums = [0,0,0,0,0,0,0,0,1]
//        let target =
       
        let solution = Solution494()
        let result = solution.findTargetSumWays2(nums, target)
        print(result)
    }
}
