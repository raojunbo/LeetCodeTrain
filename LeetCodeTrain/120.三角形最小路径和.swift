/*
 * @lc app=leetcode.cn id=120 lang=swift
 *
 * [120] 三角形最小路径和
 */

// @lc code=start
class Solution120 {
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        if n == 0 {
            return 0
        }
        //就地一原三角型
        var dp = triangle
        for i in 1..<n {
            dp[i][0] = dp[i][0] + dp[i - 1][0] //左边边缘
            dp[i][i] = dp[i][i] +  dp[i - 1][i - 1] //右边边缘
            for j in 1..<i {
                dp[i][j] += min(dp[i - 1][j - 1], dp[i - 1][j])
            }
        }
        return dp[n - 1].min()!
    }
    
    static func test() {
        let triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
        let result = Solution120().minimumTotal(triangle)
        print(result)
    }
}
// @lc code=end

