/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] x 的平方根
 */
// 采用二分逼近法
// @lc code=start
class Solution69 {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var ans = -1
        while left <= right {
            let mid = (left + right)/2
            if mid * mid <= x {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
    
    static func test() {
        let result = Solution69().mySqrt(4)
        print(result)
    }
}
// @lc code=end

