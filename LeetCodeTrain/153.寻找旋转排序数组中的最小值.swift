/*
 * @lc app=leetcode.cn id=153 lang=swift
 *
 * [153] 寻找旋转排序数组中的最小值
 // 旋转后一边是有序的，一边是无序的。
 // 这个题目的精髓在于理解旋转后的数组特性；
 */

// @lc code=start
class Solution153 {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            //最左边值小于等于最右边值，最左边就是最小值了
            if nums[left] <= nums[right] {
                return nums[left]
            }
            let mid = (left + right)/2
            if nums[left] <= nums[mid] {
                //左边单调增,最小值一定不在这里
                left = mid + 1
            } else {
                right = mid
            }
        }
        return -1
    }
    static func test() {
        
    }
}
// @lc code=end

