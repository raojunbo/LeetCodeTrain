//
//  1143-2.最长公共子串.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/1/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution1143_2 {
    
    func longestCommonString(text1: String, text2: String) -> Int {
        //dp 以dp[i][j]结尾
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        //默认都是0
        let dprow = Array(repeating: 0, count: text2.count + 1)
        var dp = Array(repeating: dprow, count: text1.count + 1)
        var result = 0
        for i in 1...textChars1.count {
            for j in 1...textChars2.count {
                //只有在相等时，才有可能是公共子串
                if textChars1[i - 1] == textChars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }
                
                if dp[i][j] > result {
                    result = dp[i][j]
                }
            }
        }
        return result
    }
    
    //用一维数组优化
    func longestCommonString2(text1: String, text2: String) -> Int {
        //dp 以dp[i][j]结尾
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        var rowChars = textChars1
        var colChars = textChars2
        if textChars1.count < textChars2.count {
            colChars = textChars1
            rowChars = textChars2
        }
        
        //默认都是0
        var dp = Array(repeating: 0, count: colChars.count + 1)
        var result = 0
        for i in 1...rowChars.count {
            var cur = 0
            for j in 1...colChars.count {
                //只有在相等时，才有可能是公共子串
                let leftTop = cur
                cur = dp[j]
                if textChars1[i - 1] == textChars2[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = 0
                }
                if dp[j] > result {
                    result = dp[j]
                }
            }
        }
        return result
    }
    
    static func test() {
        let text1 = "ABCD"
        let text2 = "BABC"
        let result = Solution1143_2().longestCommonString2(text1: text1, text2: text2)
        print(result)
    }
}
