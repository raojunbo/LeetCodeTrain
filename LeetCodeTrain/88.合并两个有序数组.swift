/*
 * @lc app=leetcode.cn id=88 lang=swift
 *
 * [88] 合并两个有序数组
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 思路：
 充分利用数组的有序性
 */

// @lc code=start
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        //从后向前
        //找最大值
        var p1 = m - 1
        var p2 = n - 1
        for index in (0..<m + n).reversed() {
            
            if nums1[p1] < nums2[p2] {
                nums1[index] = nums2[p2]
                p2 = p2 - 1
            }else {
                nums1[index] = nums1[p1]
                p1 = p1 - 1
            }
        }
        for item in nums1 {
            print(item)
        }
    }
    
    class func test() {
        var nums =  [1,2,3,0,0,0]
        var nums2 = [2,5,6]
        
        Solution88().merge(&nums, 0, nums2, 3)
    }
}
// @lc code=end

