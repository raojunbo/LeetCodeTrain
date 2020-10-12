/*
 * @lc app=leetcode.cn id=11 lang=swift
 *
 * [11] 盛最多水的容器
 
 [1,8,6,2,5,4,8,3,7]
 49
 */

// @lc code=start
class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        //思路
        //逐步放弃高度较小的
        //双指针
//        print(Solution11().maxArea([1,8,6,2,5,4,8,3,7]))
        var left = 0
        var right = height.count - 1
        var maxA = 0
        while left < right {
            let currentMaxA = (right - left) * min(height[left], height[right])
            if currentMaxA > maxA {
                maxA = currentMaxA
            }
            if height[left] < height[right] {
                left += 1
            }else{
                right -= 1
            }
        }
        return maxA
    }
}
// @lc code=end

