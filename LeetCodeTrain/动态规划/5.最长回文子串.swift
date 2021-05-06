/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution5 {
    // "babad"
    // 从左边读，与从右边读一样；
    // 最值问题
    // 暴力解法 n的平方
    // 因为是子串，所以要知道初始的坐标 与结束的坐标
    // 所以用一个二维的dp来表示状态
    func longestPalindrome(_ s: String) -> String {
        // 定义dp
        // dp[i][j] 表示其是否是回文串
        // 如何计算dp[i][j]，即找出递归表达式；
        // j - i + 1 <=2 时 s[i] 是否等于s[j]
        // j - i + 1 > 2 时， 如果(i + 1, j - 1) 是回文串，且s[i] 等于s[j] ，那么s[i,j] 是回文串；
        // 初始值为dp[0][0]
        // 长度为j - i + 1
        // 思路的重新整理：
        // 动态规划的难点在与定义dp；在与定义出递推表达式
        // 定义dp[i][j] 表示从i为起点，到j 为终点的字符串是否为回文；
        // 这样dp[i][j] 可以由上次的结果推导出来dp[i][j] = dp[i + 1][j - 1] && s[i] == s[j]
        // j - i = 0表示是字符本身
        let sArray:[Character] = Array(s)
        let length = s.count
        var dp: [[Bool]] = []
        for _ in 0..<length {
            let array = Array(repeating: false, count: length)
            dp.append(array)
        }
        
        var maxLen: Int = 1
        var begin: Int = 0
        
        // i 是从大到小
        for i in (0..<dp.count).reversed() {
            // j 是从左到右
            for j in i..<dp[0].count {
                let len = j - i + 1
                dp[i][j] = sArray[i] == sArray[j] && (len <= 2  || dp[i + 1][j - 1])
                // dp[i][j] 是回文
                if dp[i][j] && len > maxLen{
                    dp[i][j] = true
                    maxLen = len
                    begin = i
                }
            }
        }
        return s.substring(in: begin..<begin + maxLen) ?? ""
    }
    
    static func test() {
        let s = "cbbd"
        let solution = Solution5()
        let result = solution.longestPalindrome(s)
        print(result)
    }
}

extension String {
    func substring(in r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
// @lc code=end

