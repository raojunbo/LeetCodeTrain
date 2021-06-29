/*
 * @lc app=leetcode.cn id=367 lang=swift
 *
 * [367] 有效的完全平方数
 */

// @lc code=start
class Solution367 {
    // 整体的思路
    // 二分查找法
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 0
        var right = num
        while left <= right {
            var mid = (left + right )/2
            if mid * mid < num {
                left = mid + 1
            } else if mid * mid > num {
                right = mid - 1
            } else {
                return true
            }
        }
        return false
    }
    
    static func test() {
        Solution367().isPerfectSquare(16)
    }
}
// @lc code=end

