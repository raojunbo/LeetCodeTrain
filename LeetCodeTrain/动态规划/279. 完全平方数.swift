//
//  279. 完全平方数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/8.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 完全平方数
// 这里实际上是一个背包问题
// 01背包问题会将所有的value可能都列成来
class Solution279 {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        let squareIndex = Int(sqrt(Double(n))) + 1
        // 可选的值
        var square_nums = Array(repeating: 0, count: squareIndex)
        for i in 1..<squareIndex {
            square_nums[i] = i * i
        }
        // 求从1到n的dp[i]的完全平方数
        for i in 1...n {
            // 当求i的完全平方数时；
            for s in 1..<squareIndex {
                if i < square_nums[s] {
                    break
                }
                // dp[i] 与dp[i - square_nums] + 1 的比较
                dp[i] = min(dp[i], dp[i - square_nums[s]] + 1)
            }
        }
        return dp[n]
    }
    static func test(){
        let solution = Solution279()
        let result = solution.numSquares(12)
        print(result)
    }
}
