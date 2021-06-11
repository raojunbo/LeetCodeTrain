//
//  1049. 最后以块石头的重量II.swift
//  LeetCodeTrain
//
//  Created by mojiit on 2021/6/11.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

// 定义dp[i][j] i表示第i块石头，j表示剩余的最大,dp[i][j]表示第i块石头的剩下的最小值
// 整个过程转换成求背包容量为sum/2的最大值
// 最终的结果转换成sum - 2 * dp[target]
class Solution1049 {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        var sum = 0
        for item in stones {
            sum += item
        }
        let target = sum / 2
        // 初始化数组
        var dp = Array(repeating: 0, count: target + 1)
        // 一个一个stones
        for i in  0..<stones.count {
            let v = stones[i]
            //
            for j in (stones[i]...target).reversed() {
                dp[j] = max(dp[j], dp[j - v] + v)
            }
        }
        return sum - 2 * dp[target]
    }
    
    static func test() {
        let stones = [31,26,33,21,40]
        let solution = Solution1049()
        let result = solution.lastStoneWeightII(stones)
        print(result)
    }
}
