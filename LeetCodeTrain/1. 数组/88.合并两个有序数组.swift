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
    // 合并两个有序数组
    // 有一定的技巧：从后向前进行比较
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, res = m + n - 1
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[res] = nums1[i]
                i -= 1
            } else {
                nums1[res] = nums2[j]
                j -= 1
            }
            res -= 1
        }
    }
    
    static func test() {
        var nums1 =  [2,0]
        let nums2 = [1]
        let solution = Solution88()
        solution.merge(&nums1, 1, nums2, 1)
        print(nums1)
    }
}
// @lc code=end
