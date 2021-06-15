//
//  139. 单词拆分.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 这到题没有理解的很好
class Solution139 {
    // dp[i] 表示字符串s前i个字符组成的字符串s[0..i-1],是否能被空格拆分成若干合法的单词
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let count = s.count
        var dp = Array(repeating: false, count: count + 1)
        // 空串也合法
        dp[0] = true
        // 整个的过程是由下向上的推导过程
        for i in 1...count {
            // 从最小的字符串开始
            for j in 0..<i {
                // 右边子串
                let startIndex = s.index(s.startIndex, offsetBy: j)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                let subStr:String = String(s[startIndex..<endIndex])
                
                // dp[j] 利用其那面已经存储的结果
                if dp[j] && wordDict.contains(subStr) {
                    // 表示字符串有i个长的字符串是符合的
                    dp[i] = true
                    break
                }
            }
        }
        return dp[count]
    }
    static func test() {
        let solution = Solution139()
        let result = solution.wordBreak("leetcode", ["leet", "code"])
        print(result)
    }
}
