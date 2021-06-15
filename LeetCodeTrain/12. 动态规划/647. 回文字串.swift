//
//  647. 回文字串.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/7.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 定义dp[i][j] 描述i开头，j结尾的字符串是否是回文串
// 整个的思路是记录以i开头，j结尾的字符串为回文的状态
class Solution647 {
    func countSubstrings(_ s: String) -> Int {
        let sc = Array(s)
        let length = sc.count
        // dp 是一个二维数组
        var dp = Array(repeating: Array(repeating: false, count: length), count: length)
        var count = 0
        // i始终是小于j的（因为i表示开头，j表示结尾）
        // 这种解法感觉是穷举与动态方法的结合
        for j in 0..<length {
            for i in 0...j {
                if i == j {
                    // 单个字符
                    dp[i][j] = true
                    count += 1
                } else if j - i == 1 && sc[i] == sc[j] {
                    // 两个字符
                    dp[i][j] = true
                    count += 1
                } else if j - i > 1 && sc[i] == sc[j] && dp[i + 1][j - 1] {
                    // 多余两个字符dp[i + 1][j - 1] 表示dp[i][j]的是否为
                    dp[i][j] = true
                    count += 1
                }
            }
        }
        return count
    }
   
    static func test(){
//        let s = "abc"
        let s = "aaa"
        let solution = Solution647()
        let result = solution.countSubstrings(s)
        print(result)
    }
}
