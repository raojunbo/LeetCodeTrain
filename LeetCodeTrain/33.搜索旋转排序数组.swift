/*
 * @lc app=leetcode.cn id=33 lang=swift
 *
 * [33] 搜索旋转排序数组
 */

// @lc code=start
// 有序采用二分查找算法
// 只在有序里
class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var p = 0
        var q = nums.count - 1
        var result = -1
        while p <= q {
            let mid = (p + q) / 2
            if target == nums[mid] {
                result = mid
                break
            }
            //左边有序
            if nums[p] <= nums[mid] {
                // 在有序里进行选找
                if target >= nums[p] && target < nums[mid] {
                    q = mid - 1
                } else {
                    p = mid + 1
                }
            } else {
                //在右序里进行选找
                if target > nums[mid] && target <= nums[q] {
                    p = mid + 1
                } else {
                    q = mid - 1
                }
            }
        }
        return result
    }
    static func test() {
        let array = [1,2,3,4,5,6]
        let target = 4
        let result = Solution33().search(array,target)
        print(result)
    }
}
// @lc code=end

