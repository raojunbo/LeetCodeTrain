/*
 * @lc app=leetcode.cn id=1143 lang=swift
 *
 * [1143] 最长公共子序列
 */

// @lc code=start
class Solution1143 {
    func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
        // 定义状态；dp[i][j] 第(i,j)的位置的最长公共子序列
        // 状态转移方程；dp[i][j] = Max(dp[i - 1][j],dp[i][j -1])
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        
        //初始化dp数组
        let dprow = Array(repeating: 0, count: text2.count + 1)
        var dp = Array(repeating:dprow, count: text1.count + 1)
        for i in 1...textChars1.count {
            for j in 1...textChars2.count {
                if textChars2[j - 1] == textChars1[i - 1] {
                    //最后一个相等时
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    //最后一个不相等时,去上边，或者左边的最大值
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[text1.count][text2.count]
    }
    
    //优化空间1：2行的滚动数组
    func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
        // 定义状态；dp[i][j] 第(i,j)的位置的最长公共子序列
        // 状态转移方程；dp[i][j] = Max(dp[i - 1][j],dp[i][j -1])
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        
        //初始化dp数组
        let dprow = Array(repeating: 0, count: textChars2.count + 1)
        var dp = Array(repeating:dprow, count: 2)
        for i in 1...text1.count {
            //采用取模可以将数组滚动化
            let row = i%2
            let preRow = (i - 1)%2
            for j in 1...textChars2.count {
                if textChars2[j - 1] == textChars1[i - 1] {
                    //最后一个相等时
                    dp[row][j] = dp[preRow][j - 1] + 1
                } else {
                    //最后一个不相等时,去上边，或者左边的最大值
                    dp[row][j] = max(dp[preRow][j], dp[row][j - 1])
                }
            }
        }
        return dp[text1.count%2][text2.count]
    }
    
    //空间优化2：1行的数组
    func longestCommonSubsequence3(_ text1: String, _ text2: String) -> Int {
        // 定义状态；dp[i][j] 第(i,j)的位置的最长公共子序列
        // 状态转移方程；dp[i][j] = Max(dp[i - 1][j],dp[i][j -1])
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        
        //初始化dp数组
        var dp = Array(repeating:0, count: textChars2.count + 1)
        for i in 1...textChars1.count {
            var cur = 0
            for j in 1...textChars2.count {
                let leftTop = cur
                cur = dp[j]
                if textChars2[j - 1] == textChars1[i - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j], dp[j - 1])
                }
            }
        }
        return dp[textChars2.count]
    }
    
    //优化空间3：1行的数据依赖于较少的列
    func longestCommonSubsequence4(_ text1: String, _ text2: String) -> Int {
        // 定义状态；dp[i][j] 第(i,j)的位置的最长公共子序列
        // 状态转移方程；dp[i][j] = Max(dp[i - 1][j],dp[i][j -1])
        let textChars1 = Array(text1)
        let textChars2 = Array(text2)
        
        var rowsNums = textChars1
        var colsNums = textChars2
        //谁小谁做列
        if textChars1.count > textChars2.count {
            colsNums = textChars2
            rowsNums = textChars1
        } else {
            colsNums = textChars1
            rowsNums = textChars2
        }
        
        var dp = Array(repeating: 0, count: colsNums.count + 1)
        for i in 1...rowsNums.count {
            var cur = 0
            for j in 1...colsNums.count {
                let leftTop = cur
                cur = dp[j]
                if colsNums[j - 1] == rowsNums[i - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j], dp[j - 1])
                }
            }
        }
        return dp[colsNums.count]
    }
    // 第三遍练习
    func longestCommonSubsequence5(_ text1: String, _ text2: String) -> Int {
        let text1Array = Array(text1)
        let text2Array = Array(text2)
        // 定义dp[i][j] i 表示第一个数组以i结尾的，j 表示第二个数组以j结尾
        // dp[i][j] 表示最长功能子序列
        var dp = Array(repeating: Array(repeating:0, count: text2Array.count + 1), count: text1Array.count + 1)
        for i in 1...text1Array.count {
            for j in 1...text2Array.count {
                // 如果相等
                if text1Array[i - 1] == text2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }else {
                // 若果不相等（因为是子序列， 不相等时，其值为上，或者左中的较大值）
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        print(dp)
        return dp[text1Array.count][text2Array.count]
    }
    
    static func test() {
        let text1 = "1359"
        let text2 = "149"
        let result = Solution1143().longestCommonSubsequence5(text1, text2)
        print(result)
    }
}
// @lc code=end

