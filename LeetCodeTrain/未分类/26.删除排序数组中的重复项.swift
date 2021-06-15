/*
 * @lc app=leetcode.cn id=26 lang=swift
 *
 * [26] 删除排序数组中的重复项
 */

// @lc code=start
class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        //整个思路就是选取后面不同的往前面放
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        
        var p1 = 0
        for p2 in nums {
            if nums[p1] != p2 {
                p1 = p1 + 1
                nums[p1] = p2
            }
        }
        return p1 + 1
    }
    
    static func test(){
        var array = [0,0,1,1,1,2,2,3,3,4]
        Solution26().removeDuplicates(&array)
        for item in array {
            print(item)
        }
    }
}
// @lc code=end

